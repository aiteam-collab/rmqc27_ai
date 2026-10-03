CREATE OR REPLACE
"PACKAGE BODY pkg_ai_sales AS
"
"
"
"    FUNCTION fy_start( p_on_date IN DATE ) RETURN DATE IS
"
"        l_year PLS_INTEGER := EXTRACT( YEAR FROM p_on_date );
"
"    BEGIN
"
"        IF EXTRACT( MONTH FROM p_on_date ) < c_fy_start_month THEN
"
"            l_year := l_year - 1;
"
"        END IF;
"
"        RETURN TO_DATE( l_year || LPAD(c_fy_start_month,2,'0') || '01', 'YYYYMMDD' );
"
"    END fy_start;
"
"
"
"
"
"    FUNCTION to_fin_year( p_cal_year IN NUMBER ) RETURN NUMBER IS
"
"    BEGIN
"
"        IF p_cal_year IS NULL THEN
"
"            RETURN NULL;
"
"        END IF;
"
"        -- Already a composite such as 202627
"
"        IF p_cal_year > 9999 THEN
"
"            RETURN p_cal_year;
"
"        END IF;
"
"        -- 2026 -> 202627
"
"        RETURN ( p_cal_year * 100 ) + MOD( p_cal_year + 1, 100 );
"
"    END to_fin_year;
"
"
"
"
"
"    FUNCTION resolve_period(
"
"        p_period_type IN VARCHAR2,
"
"        p_month       IN NUMBER   DEFAULT NULL,
"
"        p_year        IN NUMBER   DEFAULT NULL,
"
"        p_from_date   IN VARCHAR2 DEFAULT NULL,
"
"        p_to_date     IN VARCHAR2 DEFAULT NULL
"
"    ) RETURN t_ai_period_tab PIPELINED
"
"    IS
"
"        l_today  DATE := TRUNC(SYSDATE);
"
"        l_from   DATE;
"
"        l_to     DATE;
"
"        l_fy     NUMBER;
"
"        l_fp     NUMBER;
"
"        l_label  VARCHAR2(100);
"
"        l_note   VARCHAR2(400);
"
"        l_type   VARCHAR2(30) := UPPER( NVL(p_period_type,'CURRENT_MONTH') );
"
"    BEGIN
"
"        CASE l_type
"
"
"
"            WHEN 'CURRENT_MONTH' THEN
"
"                l_from  := TRUNC(l_today,'MM');
"
"                l_to    := LAST_DAY(l_today);
"
"                l_label := TO_CHAR(l_from,'Month YYYY');
"
"
"
"            WHEN 'LAST_MONTH' THEN
"
"                l_from  := TRUNC( ADD_MONTHS(l_today,-1), 'MM' );
"
"                l_to    := LAST_DAY( ADD_MONTHS(l_today,-1) );
"
"                l_label := TO_CHAR(l_from,'Month YYYY');
"
"
"
"            WHEN 'MONTH_YEAR' THEN
"
"                IF p_month IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20101,
"
"                        'MONTH_YEAR requires p_month (1-12).');
"
"                END IF;
"
"                IF p_month NOT BETWEEN 1 AND 12 THEN
"
"                    RAISE_APPLICATION_ERROR(-20102,
"
"                        'Month must be between 1 and 12. Received: '||p_month);
"
"                END IF;
"
"                l_from := TO_DATE( NVL(p_year, EXTRACT(YEAR FROM l_today))
"
"                                   || LPAD(p_month,2,'0') || '01', 'YYYYMMDD' );
"
"                l_to   := LAST_DAY(l_from);
"
"                l_label := TO_CHAR(l_from,'Month YYYY');
"
"                IF p_year IS NULL THEN
"
"                    l_note := 'Year not specified; assumed current calendar year '
"
"                              || EXTRACT(YEAR FROM l_today) || '.';
"
"                END IF;
"
"
"
"            WHEN 'CURRENT_FIN_YEAR' THEN
"
"                l_from  := fy_start(l_today);
"
"                l_to    := ADD_MONTHS(l_from,12) - 1;
"
"                l_label := 'FY ' || TO_CHAR(l_from,'YYYY') ||'-'||
"
"                           TO_CHAR(ADD_MONTHS(l_from,12),'YY');
"
"
"
"            WHEN 'CURRENT_FIN_YEAR_TD' THEN
"
"                l_from  := fy_start(l_today);
"
"                BEGIN
"
"                    SELECT fp_end_date
"
"                      INTO l_to
"
"                      FROM fin_periods
"
"                     WHERE fp_bu = pkg_ai_sec.get_bu
"
"                       AND l_today BETWEEN fp_from_date AND fp_end_date;
"
"                EXCEPTION
"
"                    WHEN NO_DATA_FOUND THEN
"
"                        l_to := LAST_DAY(l_today);
"
"                END;
"
"                l_label := 'FY ' || TO_CHAR(l_from,'YYYY') ||'-'||
"
"                           TO_CHAR(ADD_MONTHS(l_from,12),'YY')
"
"                           || ' year-to-date (through ' || TO_CHAR(l_to,'Mon YYYY') || ')';
"
"
"
"            WHEN 'LAST_FIN_YEAR' THEN
"
"                l_from  := ADD_MONTHS( fy_start(l_today), -12 );
"
"                l_to    := ADD_MONTHS(l_from,12) - 1;
"
"                l_label := 'FY ' || TO_CHAR(l_from,'YYYY') ||'-'||
"
"                           TO_CHAR(ADD_MONTHS(l_from,12),'YY');
"
"
"
"            WHEN 'CURRENT_FIN_PERIOD' THEN
"
"                BEGIN
"
"                    SELECT fp_year, fp_period, fp_from_date, fp_end_date, fp_short_desc
"
"                      INTO l_fy, l_fp, l_from, l_to, l_label
"
"                      FROM fin_periods
"
"                     WHERE fp_bu = pkg_ai_sec.get_bu
"
"                       AND l_today BETWEEN fp_from_date AND fp_end_date;
"
"                EXCEPTION
"
"                    WHEN NO_DATA_FOUND THEN
"
"                        RAISE_APPLICATION_ERROR(-20103,
"
"                            'No open financial period covers today for this Business Unit.');
"
"                END;
"
"
"
"            WHEN 'FIN_PERIOD' THEN
"
"                IF p_month IS NULL OR p_year IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20104,
"
"                        'FIN_PERIOD requires p_month (period number) and p_year (financial year).');
"
"                END IF;
"
"                BEGIN
"
"                    SELECT fp_year, fp_period, fp_from_date, fp_end_date, fp_short_desc
"
"                      INTO l_fy, l_fp, l_from, l_to, l_label
"
"                      FROM fin_periods
"
"                     WHERE fp_bu = pkg_ai_sec.get_bu
"
"                       AND fp_year = p_year AND fp_period = p_month;
"
"                EXCEPTION
"
"                    WHEN NO_DATA_FOUND THEN
"
"                        RAISE_APPLICATION_ERROR(-20105,
"
"                            'Financial period '||p_month||'/'||p_year||
"
"                            ' does not exist for this Business Unit.');
"
"                END;
"
"
"
"            WHEN 'DATE_RANGE' THEN
"
"                IF p_from_date IS NULL OR p_to_date IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20106,
"
"                        'DATE_RANGE requires both p_from_date and p_to_date as YYYY-MM-DD.');
"
"                END IF;
"
"                BEGIN
"
"                    l_from := TO_DATE(p_from_date,'YYYY-MM-DD');
"
"                    l_to   := TO_DATE(p_to_date,  'YYYY-MM-DD');
"
"                EXCEPTION
"
"                    WHEN OTHERS THEN
"
"                        RAISE_APPLICATION_ERROR(-20107,
"
"                            'Dates must be YYYY-MM-DD. Received: '||p_from_date||' to '||p_to_date);
"
"                END;
"
"                IF l_from > l_to THEN
"
"                    RAISE_APPLICATION_ERROR(-20108,'from_date is after to_date.');
"
"                END IF;
"
"                l_label := TO_CHAR(l_from,'DD-Mon-YYYY')||' to '||TO_CHAR(l_to,'DD-Mon-YYYY');
"
"
"
"            ELSE
"
"                RAISE_APPLICATION_ERROR(-20109,
"
"                    'Unknown period_type: '||l_type);
"
"        END CASE;
"
"
"
"        PIPE ROW( t_ai_period( l_type, l_from, l_to, l_fy, l_fp,
"
"                               TRIM(l_label), l_note ) );
"
"        RETURN;
"
"    END resolve_period;
"
"
"
"
"
"    FUNCTION create_export_request(
"
"        p_dataset   IN VARCHAR2,
"
"        p_filters   IN CLOB,
"
"        p_row_count IN NUMBER
"
"    ) RETURN NUMBER
"
"    IS
"
"        PRAGMA AUTONOMOUS_TRANSACTION;
"
"        l_id NUMBER;
"
"    BEGIN
"
"        INSERT INTO ai_export_requests
"
"               ( aer_bu, aer_app_user, aer_apex_session,
"
"                 aer_dataset, aer_filters, aer_row_count )
"
"        VALUES ( pkg_ai_sec.get_bu,
"
"                 SYS_CONTEXT('APEX$SESSION','APP_USER'),
"
"                 TO_NUMBER( SYS_CONTEXT('APEX$SESSION','APP_SESSION') ),
"
"                 p_dataset, p_filters, p_row_count )
"
"        RETURNING aer_id INTO l_id;
"
"        COMMIT;
"
"        RETURN l_id;
"
"    END create_export_request;
"
"
"
"
"
"    FUNCTION create_chart_request(
"
"        p_chart_type  IN VARCHAR2,
"
"        p_dataset     IN VARCHAR2,
"
"        p_dimension   IN VARCHAR2,
"
"        p_granularity IN VARCHAR2,
"
"        p_title       IN VARCHAR2,
"
"        p_filters     IN CLOB
"
"    ) RETURN NUMBER
"
"    IS
"
"        PRAGMA AUTONOMOUS_TRANSACTION;
"
"        l_id NUMBER;
"
"    BEGIN
"
"        INSERT INTO ai_chart_requests
"
"               ( acr_bu, acr_app_user, acr_apex_session,
"
"                 acr_chart_type, acr_dataset, acr_dimension,
"
"                 acr_granularity, acr_title, acr_filters )
"
"        VALUES ( pkg_ai_sec.get_bu,
"
"                 SYS_CONTEXT('APEX$SESSION','APP_USER'),
"
"                 TO_NUMBER( SYS_CONTEXT('APEX$SESSION','APP_SESSION') ),
"
"                 p_chart_type, p_dataset, p_dimension,
"
"                 p_granularity, p_title, p_filters )
"
"        RETURNING acr_id INTO l_id;
"
"        COMMIT;
"
"        RETURN l_id;
"
"    END create_chart_request;
"
"
"
"END pkg_ai_sales;"
/
