CREATE OR REPLACE
"PACKAGE BODY pkg_mcp_tools AS
"
"
"
"  ------------------------------------------------------------------------------
"
"  -- Guard: every tool must run inside a validated MCP context
"
"  ------------------------------------------------------------------------------
"
"  PROCEDURE assert_context IS
"
"  BEGIN
"
"    IF SYS_CONTEXT('RM_MCP_CTX', 'BU') IS NULL
"
"       OR SYS_CONTEXT('RM_MCP_CTX', 'ERP_USER') IS NULL
"
"    THEN
"
"      raise_application_error(-20401, 'MCP context not set - call through the MCP server only.');
"
"    END IF;
"
"  END assert_context;
"
"
"
"  ------------------------------------------------------------------------------
"
"  FUNCTION erp_context (p_args IN CLOB, p_mode IN VARCHAR2 DEFAULT 'EXECUTE') RETURN CLOB IS
"
"    l_out    CLOB;
"
"    l_period VARCHAR2(200);
"
"  BEGIN
"
"    assert_context;
"
"
"
"    -- Current financial period (NULL if not defined for today)
"
"    SELECT MAX( 'Period ' || fp_period || ' of FY '
"
"                || SUBSTR(TO_CHAR(fp_year),1,4) || '-' || SUBSTR(TO_CHAR(fp_year),5,2)
"
"                || ' (' || TO_CHAR(fp_from_date,'DD-Mon-YYYY')
"
"                || ' to ' || TO_CHAR(fp_end_date,'DD-Mon-YYYY') || ')' )
"
"      INTO l_period
"
"      FROM fin_periods
"
"     WHERE fp_bu = pkg_ai_sec.get_bu
"
"       AND TRUNC(SYSDATE) BETWEEN fp_from_date AND fp_end_date;
"
"
"
"    SELECT JSON_OBJECT(
"
"             'erp_user'                 VALUE SYS_CONTEXT('RM_MCP_CTX','ERP_USER'),
"
"             'business_unit'            VALUE pkg_ai_sec.get_bu,
"
"             'business_unit_name'       VALUE pkg_ai_sec.get_bu_name,
"
"             'today'                    VALUE TO_CHAR(SYSDATE, 'YYYY-MM-DD'),
"
"             'current_financial_period' VALUE l_period,
"
"             'fin_year_basis'           VALUE 'Financial year runs April to March. Period 1 = April.'
"
"             RETURNING CLOB )
"
"      INTO l_out
"
"      FROM dual;
"
"
"
"    RETURN l_out;
"
"  END erp_context;
"
"
"
"  ------------------------------------------------------------------------------
"
"  FUNCTION sales_summary (p_args IN CLOB, p_mode IN VARCHAR2 DEFAULT 'EXECUTE') RETURN CLOB IS
"
"    l_a        json_object_t := json_object_t.parse(NVL(p_args, '{}'));
"
"    l_period   VARCHAR2(30)  := UPPER(NVL(l_a.get_string('period_type'), 'CURRENT_MONTH'));
"
"    l_month    NUMBER        := l_a.get_number('month');
"
"    l_year     NUMBER        := l_a.get_number('year');
"
"    l_from     VARCHAR2(10)  := l_a.get_string('from_date');
"
"    l_to       VARCHAR2(10)  := l_a.get_string('to_date');
"
"    l_status   VARCHAR2(1)   := UPPER(l_a.get_string('status'));
"
"    l_cust     VARCHAR2(50)  := l_a.get_string('customer_id');
"
"    l_sp       VARCHAR2(50)  := l_a.get_string('salesperson_id');
"
"    l_out      CLOB;
"
"  BEGIN
"
"    assert_context;
"
"
"
"    IF l_period = 'DATE_RANGE' AND (l_from IS NULL OR l_to IS NULL) THEN
"
"      raise_application_error(-20010, 'period_type DATE_RANGE needs both from_date and to_date (YYYY-MM-DD).');
"
"    END IF;
"
"
"
"    WITH p AS (
"
"          SELECT *
"
"            FROM TABLE( pkg_ai_sales.resolve_period(
"
"                          p_period_type => l_period,
"
"                          p_month       => l_month,
"
"                          p_year        => l_year,
"
"                          p_from_date   => l_from,
"
"                          p_to_date     => l_to ) )
"
"         ),
"
"         hdr AS (
"
"          SELECT h.invoice_key, h.status
"
"            FROM vw_ai_sales_inv_hdr_sec h, p
"
"           WHERE h.effective_date BETWEEN p.from_date AND p.to_date
"
"             AND ( l_status IS NULL OR h.status_code    = l_status )
"
"             AND ( l_cust   IS NULL OR h.cust_id        = l_cust )
"
"             AND ( l_sp     IS NULL OR h.salesperson_id = l_sp )
"
"         ),
"
"         amt AS (
"
"          SELECT SUM(l.gross_amt_bc) gross_sales,
"
"                 SUM(l.disc_amt_bc)  discount,
"
"                 SUM(l.net_sales_bc) net_sales,
"
"                 SUM(l.tax_amt_bc)   tax,
"
"                 SUM(l.net_amt_bc)   invoice_value,
"
"                 COUNT(*)            line_count
"
"            FROM vw_ai_sales_inv_line_sec l
"
"           WHERE l.invoice_key IN (SELECT invoice_key FROM hdr)
"
"             AND l.is_revenue  = 'Y'
"
"             AND l.status_code <> 'C'
"
"         ),
"
"         qty AS (
"
"          SELECT l.uom, SUM(l.inv_qty) total_qty
"
"            FROM vw_ai_sales_inv_line_sec l
"
"           WHERE l.invoice_key IN (SELECT invoice_key FROM hdr)
"
"             AND l.is_revenue     = 'Y'
"
"             AND l.status_code   <> 'C'
"
"             AND l.matl_type_code = 'P'
"
"           GROUP BY l.uom
"
"         )
"
"    SELECT JSON_OBJECT(
"
"             'period'           VALUE p.period_label,
"
"             'note'             VALUE p.resolved_note,
"
"             'business_unit'    VALUE pkg_ai_sec.get_bu,
"
"             'currency'         VALUE 'Base currency (INR)',
"
"             'invoice_count'    VALUE hc.invoice_count,
"
"             'line_count'       VALUE a.line_count,
"
"             'gross_sales_bc'   VALUE ROUND(NVL(a.gross_sales,0),2),
"
"             'discount_bc'      VALUE ROUND(NVL(a.discount,0),2),
"
"             'net_sales_bc'     VALUE ROUND(NVL(a.net_sales,0),2),
"
"             'tax_bc'           VALUE ROUND(NVL(a.tax,0),2),
"
"             'invoice_value_bc' VALUE ROUND(NVL(a.invoice_value,0),2),
"
"             'total_quantity'   VALUE q.total_quantity,
"
"             'status_breakdown' VALUE sb.status_breakdown,
"
"             'definitions'      VALUE 'net_sales_bc = total sales/revenue (gross - discount, excluding tax). invoice_value_bc = net sales + tax.'
"
"             RETURNING CLOB )
"
"      INTO l_out
"
"      FROM amt a
"
"     CROSS JOIN p
"
"     CROSS JOIN ( SELECT COUNT(*) invoice_count FROM hdr ) hc
"
"     CROSS JOIN ( SELECT LISTAGG(TRIM(TO_CHAR(total_qty,'FM999999999990.999')) || ' ' || uom, ', ')
"
"                           WITHIN GROUP (ORDER BY total_qty DESC) total_quantity
"
"                    FROM qty ) q
"
"     CROSS JOIN ( SELECT LISTAGG(status || '=' || cnt, ', ') WITHIN GROUP (ORDER BY status) status_breakdown
"
"                    FROM ( SELECT status, COUNT(*) cnt FROM hdr GROUP BY status ) ) sb;
"
"
"
"    RETURN l_out;
"
"  END sales_summary;
"
"
"
"  ------------------------------------------------------------------------------
"
"  FUNCTION purchase_request_create (p_args IN CLOB, p_mode IN VARCHAR2 DEFAULT 'EXECUTE') RETURN CLOB IS
"
"    l_a      json_object_t := json_object_t.parse(NVL(p_args, '{}'));
"
"    l_item   VARCHAR2(100) := TRIM(l_a.get_string('item_code'));
"
"    l_qty    NUMBER        := l_a.get_number('quantity');
"
"    l_rev    VARCHAR2(30)  := TRIM(l_a.get_string('item_revision'));
"
"    l_res    VARCHAR2(32767);
"
"    l_chk    json_object_t;
"
"    l_out    CLOB;
"
"  BEGIN
"
"    assert_context;
"
"
"
"    IF l_item IS NULL THEN
"
"      raise_application_error(-20020, 'item_code is required.');
"
"    END IF;
"
"    IF l_qty IS NULL OR l_qty <= 0 THEN
"
"      raise_application_error(-20021, 'quantity must be greater than zero.');
"
"    END IF;
"
"
"
"    IF UPPER(p_mode) = 'PREVIEW' THEN
"
"      -- Dry run: nothing is written.
"
"      -- OPTIONAL: call your validate-only routine here, e.g.
"
"      --   pkg_pr_ai.create_pr(p_lines_json => ..., p_validate_only => 'Y', ...);
"
"      -- and raise_application_error(-2002x, ...) with its message if invalid.
"
"      SELECT JSON_OBJECT(
"
"               'action'         VALUE 'Create draft Purchase Request',
"
"               'business_unit'  VALUE pkg_ai_sec.get_bu,
"
"               'requested_by'   VALUE SYS_CONTEXT('RM_MCP_CTX','ERP_USER'),
"
"               'item_code'      VALUE l_item,
"
"               'item_revision'  VALUE l_rev,
"
"               'quantity'       VALUE l_qty,
"
"               'status_after'   VALUE 'E (Draft) - needs normal approval in the ERP',
"
"               'saved'          VALUE 'NO - nothing has been saved yet'
"
"               RETURNING CLOB )
"
"        INTO l_out
"
"        FROM dual;
"
"      RETURN l_out;
"
"    END IF;
"
"
"
"    -- EXECUTE: reuse the existing, tested ERP logic.
"
"    -- FN_AI_CALL_PKG_PR must read user/BU through pkg_ai_sec (see script 02).
"
"    DECLARE
"
"      l_plant VARCHAR2(50) := UPPER(TRIM(l_a.get_string('plant')));
"
"      l_rev_n NUMBER       := NVL(TO_NUMBER(REGEXP_SUBSTR(l_rev, '^[0-9]+')), 0);
"
"    BEGIN
"
"      IF l_plant IS NULL THEN
"
"        BEGIN
"
"          SELECT MIN(bup_plant_id) INTO l_plant
"
"            FROM rmqc27.bus_unit_plants, rmqc27.appl_user_plant_access
"
"           WHERE bup_bu = auba_bu
"
"             AND bup_plant_id = auba_plant
"
"             AND bup_bu = pkg_ai_sec.get_bu
"
"             AND auba_user_id = SYS_CONTEXT('RM_MCP_CTX','ERP_USER')
"
"             AND TRUNC(SYSDATE) BETWEEN auba_from AND auba_to;
"
"        EXCEPTION WHEN OTHERS THEN l_plant := NULL;
"
"        END;
"
"      END IF;
"
"
"
"      l_res := fn_ai_call_pkg_pr(
"
"                 p_item_name     => l_item,
"
"                 p_qty           => l_qty,
"
"                 p_plant         => NVL(l_plant, '1'),
"
"                 p_item_rev      => l_rev_n,
"
"                 p_validate_only => 'N' );
"
"    END;
"
"
"
"    -- Return as-is if it is JSON, otherwise wrap it.
"
"    BEGIN
"
"      l_chk := json_object_t.parse(l_res);
"
"      RETURN l_res;
"
"    EXCEPTION
"
"      WHEN OTHERS THEN
"
"        SELECT JSON_OBJECT('result' VALUE l_res RETURNING CLOB) INTO l_out FROM dual;
"
"        RETURN l_out;
"
"    END;
"
"  END purchase_request_create;
"
"
"
"END pkg_mcp_tools;"
/
