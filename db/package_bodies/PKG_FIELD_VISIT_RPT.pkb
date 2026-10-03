CREATE OR REPLACE
"PACKAGE BODY        pkg_field_visit_rpt
"
"AS
"
"
"
"    PROCEDURE proc_ins_iss_doc
"
"    (p_bu                VARCHAR2,
"
"     p_plnt                VARCHAR2,
"
"     p_Date                DATE,
"
"     p_to_plnt            VARCHAR2,
"
"     p_doc_no            VARCHAR2,
"
"     p_frm_store_id        VARCHAR2,
"
"     p_lang                NUMBER,
"
"     p_user                VARCHAR2,
"
"     p_res        OUT        VARCHAR2,
"
"     p_dc_no    OUT        VARCHAR2
"
"     )
"
"    IS
"
"    CURSOR c_mat
"
"    IS
"
"    SELECT *
"
"      FROM csd_mtrl_trckg
"
"     WHERE cmt_sel_flag = 'Y'
"
"       AND cmt_sel_user = p_user
"
"       AND cmt_type = 'I'
"
"       AND p_to_plnt IS NOT NULL;
"
"
"
"                v_issdoc_no            VARCHAR2(30);
"
"                v_seq_no            NUMBER    := 1;
"
"                v_issuer_id            VARCHAR2(30);
"
"                v_issuer_name        VARCHAR2(60);
"
"                v_issuer_pos_id        VARCHAR2(30);
"
"                v_issuer_pos_name    VARCHAR2(60);
"
"                dummy1                VARCHAR2(100);
"
"                dummy2                VARCHAR2(100);
"
"                v_year                NUMBER;
"
"                v_period            NUMBER;
"
"                v_to_wh                VARCHAR2(10);
"
"                v_sys_ls_no            NUMBER(15);
"
"                v_source_id            VARCHAR2(10);
"
"                v_source_type        VARCHAR2(1);
"
"                var_lot_seq_no        NUMBER;
"
"                v_Start                NUMBER;
"
"                v_start_no            VARCHAR2(15);
"
"                v_end_no            VARCHAR2(15);
"
"                v_chk                VARCHAR2(1) := 'N';
"
"
"
"    PROCEDURE proc_dec_frm_plnt_stocks(p_bu                VARCHAR2,
"
"                                       p_plnt            VARCHAR2,
"
"                                       p_date            DATE,
"
"                                       p_prod_id        VARCHAR2,
"
"                                       p_prod_rev        NUMBER,
"
"                                       p_frm_store_id    VARCHAR2,
"
"                                       p_sys_ls_no        NUMBER,
"
"                                       p_ser_lot_opt    VARCHAR2,
"
"                                       p_ser_no            VARCHAR2,
"
"                                       p_batch_no        VARCHAR2,
"
"                                       p_unit_cost        NUMBER,
"
"                                       p_seq_no            NUMBER,
"
"                                       p_vou_no            VARCHAR2,
"
"                                       p_user            VARCHAR2,
"
"                                       p_csr_id            VARCHAR2,
"
"                                       p_wo_no            VARCHAR2,
"
"                                       p_csr_no            VARCHAR2,
"
"                                       p_wo_qty            NUMBER,
"
"                                       p_buf_stk_qty    NUMBER,
"
"                                       p_rpr_comp_flag    VARCHAR2,
"
"                                       p_source_type    VARCHAR2,
"
"                                       p_source_id        VARCHAR2,
"
"                                       p_fvr_no            VARCHAR2,
"
"                                       p_fvr_seq_no        NUMBER,
"
"                                       p_rwk_ord_no        VARCHAR2,
"
"                                       p_type            VARCHAR2,
"
"                                       p_status            VARCHAR2
"
"                                       )
"
"    IS
"
"
"
"    v_year                NUMBER;
"
"        v_period            NUMBER;
"
"    v_prod_cls_desc                 VARCHAR2(200)   ;
"
"    v_prod_subcls                     VARCHAR2(10)    ;
"
"    v_prod_subcls_desc            VARCHAR2(200)   ;
"
"    v_prod_grp                    VARCHAR2(10)    ;
"
"    v_prod_grp_desc               VARCHAR2(50)    ;
"
"    v_prod_subgrp                 VARCHAR2(10)    ;
"
"    v_prod_subgrp_desc            VARCHAR2(50)    ;
"
"    v_prod_cls_type                 VARCHAR2(10)    ;
"
"
"
"    BEGIN
"
"
"
"            v_year := func_find_year(p_bu,p_date);
"
"            v_period := func_find_period(p_bu,p_date);
"
"
"
"
"
"                    /*Decrease part*/
"
"
"
"                proc_get_prod_param_det(p_bu                   ,
"
"                            p_plnt                 ,
"
"                            p_prod_id              ,
"
"                            p_prod_rev             ,
"
"                            v_prod_cls_desc        ,
"
"                            v_prod_subcls          ,
"
"                            v_prod_subcls_desc     ,
"
"                            v_prod_grp             ,
"
"                            v_prod_grp_desc        ,
"
"                            v_prod_subgrp          ,
"
"                            v_prod_subgrp_desc     ,
"
"                            v_prod_cls_type        ,
"
"                            p_user                 ,
"
"                            p_lang                 );
"
"
"
"                DBMS_OUTPUT.PUT_LINE('Stocks ' ||' ' ||p_frm_store_id||' ' ||p_prod_id||' ' ||p_prod_rev);
"
"
"
"                    proc_upd_stocks(p_bu,
"
"                                    p_frm_store_id,
"
"                                    NULL,
"
"                                    p_prod_id,
"
"                                    p_prod_rev,
"
"                                    0,
"
"                                    0,
"
"                                    -1,
"
"                                    0,
"
"                                    0,
"
"                                    p_unit_cost,
"
"                                    p_unit_cost,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    p_seq_no,
"
"                                    0,
"
"                                    NULL,
"
"                                    p_vou_no,
"
"                                    NULL,
"
"                                    NULL,
"
"                                    NULL,
"
"                                    v_year,
"
"                                    v_period,
"
"                                    p_date,
"
"                                    NULL,
"
"                                    'CRM',
"
"                                    'MI',
"
"                                    NULL,
"
"                                    p_user,
"
"                                    SYSDATE,
"
"                                    NULL,
"
"                                    func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev),
"
"                                    NULL,
"
"                                    NULL,
"
"                                    NULL,
"
"                                    NULL,
"
"                                    0,
"
"                                    p_ref1 => 'Stocks decreased against Cust. Serv. (DC) W/H Branch Transfer :'|| ' '|| p_vou_no,
"
"                                    p_ref2 => 'Stocks decreased against Cust. Serv. (DC) W/H Branch Transfer :'|| ' '|| p_vou_no ,
"
"                                    p_prod_cls_desc        => v_prod_cls_desc ,
"
"                                    p_prod_sub_cls_id      => v_prod_subcls   ,
"
"                                    p_prod_sub_cls_desc    => v_prod_subcls_desc,
"
"                                    p_prod_grp_id          => v_prod_grp,
"
"                                    p_prod_grp_desc        => v_prod_grp_desc,
"
"                                    p_prod_sub_grp_id      => v_prod_subgrp,
"
"                                    p_prod_sub_grp_desc    => v_prod_subgrp_desc,
"
"                                    p_prod_cls_type        => v_prod_cls_type
"
"                                           );
"
"
"
"            IF func_find_prod_ser_lot_type(p_bu,p_prod_id,p_prod_Rev) NOT IN ('N') THEN
"
"
"
"                    proc_upd_lot_ser_stocks(p_bu,
"
"                                            p_frm_store_id,
"
"                                            p_prod_id,
"
"                                            p_prod_rev,
"
"                                            p_sys_ls_no,
"
"                                            -1,
"
"                                            0,
"
"                                            0,
"
"                                            p_unit_cost,
"
"                                            p_ser_lot_opt,
"
"                                            NULL,
"
"                                            p_ser_no,
"
"                                            'S',
"
"                                            p_frm_store_id,
"
"                                            func_find_prod_expiry_date(p_bu,p_prod_id,p_prod_rev,TRUNC(p_date)),
"
"                                            TRUNC(p_date),
"
"                                            'MI',
"
"                                            NULL,
"
"                                            p_vou_no,
"
"                                            p_seq_no,
"
"                                            'CRM',
"
"                                            NULL,
"
"                                            'Stocks decreased against Cust. Serv. (DC) W/H Branch Transfer :'|| ' '|| p_vou_no,
"
"                                            p_user
"
"                                            );
"
"            END IF;
"
"
"
"            IF func_find_prod_cost_method(p_bu,p_prod_id,p_prod_Rev) NOT IN ('MAC') THEN
"
"
"
"                    DBMS_OUTPUT.PUT_LINE('Batches '||' ' ||p_batch_no);
"
"                    --Raise_Application_Error(-20999,'HRM ' ||'/'||p_batch_no||'/'||p_frm_store_id||'/'||p_prod_id);
"
"
"
"                    proc_upd_stock_batches(
"
"                                            p_bu           ,
"
"                                            p_frm_store_id    ,
"
"                                            p_prod_id     ,
"
"                                            p_prod_rev    ,
"
"                                            p_batch_no     ,
"
"                                            0       ,
"
"                                            1     ,
"
"                                            -1   ,
"
"                                            0     ,
"
"                                            p_unit_cost ,
"
"                                            p_unit_cost ,
"
"                                            0    ,
"
"                                            0 ,
"
"                                            0    ,
"
"                                            0     ,
"
"                                            'N',
"
"                                            p_date   ,
"
"                                            NULL      ,
"
"                                            p_vou_no       ,
"
"                                            p_seq_no  ,
"
"                                            NULL     ,
"
"                                            NULL      ,
"
"                                            p_vou_no       ,
"
"                                            p_seq_no  ,
"
"                                            p_seq_no,
"
"                                            func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)      ,
"
"                                            'MI'    ,
"
"                                            'CRM'          ,
"
"                                            p_vou_no   ,
"
"                                            p_date ,
"
"                                            NULL     ,
"
"                                            NULL   ,
"
"                                            p_user          ,
"
"                                            NULL    ,
"
"                                            NULL  ,
"
"                                            p_ref1=>'Stocks decreased against Cust. Serv. (DC) W/H Branch Transfer' || p_vou_no ||'from store '||func_find_store_desc(p_bu,p_frm_store_id,p_lang) ||'/'||p_plnt ||'-'||func_find_plnt_desc(p_bu,p_plnt,p_lang)  ,
"
"                                            p_ref2=>'Stocks decreased against Cust. Serv. (DC) W/H Branch Transfer' || p_vou_no ||'from store '||func_find_store_desc(p_bu,p_frm_store_id,p_lang) ||'/'||p_plnt ||'-'||func_find_plnt_desc(p_bu,p_plnt,p_lang)   ,
"
"                                            p_prod_cls_desc        => v_prod_cls_desc ,
"
"                                            p_prod_subcls          => v_prod_subcls   ,
"
"                                            p_prod_subcls_desc     => v_prod_subcls_desc,
"
"                                            p_prod_grp             => v_prod_grp,
"
"                                            p_prod_grp_desc        => v_prod_grp_desc,
"
"                                            p_prod_subgrp          => v_prod_subgrp,
"
"                                            p_prod_subgrp_desc     => v_prod_subgrp_desc,
"
"                                            p_prod_cls_type        => v_prod_cls_type
"
"                                        );
"
"
"
"            END IF;
"
"
"
"                        /*Internal transaction - decreased*/
"
"
"
"            DBMS_OUTPUT.PUT_LINE('Transaction');
"
"
"
"            pkg_field_visit_rpt.proc_ins_cmt_hist
"
"                                                (
"
"                                                p_bu            ,
"
"                                                p_vou_no    ,
"
"                                                p_date            ,
"
"                                                p_frm_store_id        ,
"
"                                                p_prod_id        ,
"
"                                                p_prod_rev        ,
"
"                                                p_ser_no        ,
"
"                                                p_csr_id        ,
"
"                                                p_wo_no            ,
"
"                                                p_plnt            ,    --p_wo_unit
"
"                                                p_csr_no        ,
"
"                                                -1                , --p_trans_qty
"
"                                                0                , --p_transit_qty
"
"                                                p_wo_qty        ,
"
"                                                p_buf_stk_qty    ,
"
"                                                p_rpr_comp_flag    ,
"
"                                                p_user            ,
"
"                                                p_sys_ls_no        ,
"
"                                                p_source_type    ,
"
"                                                p_source_id        ,
"
"                                                p_batch_no        ,
"
"                                                'QOH'            ,--p_bucket_type
"
"                                                p_fvr_no         ,
"
"                                                p_fvr_seq_no    ,
"
"                                                p_rwk_ord_no    ,
"
"                                                p_type           ,
"
"                                                p_status         ,
"
"                                                'Stocks decreased against Cust. Serv. (DC) W/H Branch Transfer' || p_vou_no ||'from store '||func_find_store_desc(p_bu,p_frm_store_id,p_lang) ||'/'||p_plnt ||'-'||func_find_plnt_desc(p_bu,p_plnt,p_lang) ,
"
"                                                p_unit_cost  ,
"
"                                                p_vou_no
"
"                                                );
"
"
"
"                /*Pending unit stock in-transit(Increase)*/
"
"
"
"                DBMS_OUTPUT.PUT_LINE('Stocks '||' ' ||'SIT');
"
"
"
"                proc_upd_stocks(p_bu,
"
"                                    p_frm_store_id,
"
"                                    NULL,
"
"                                    p_prod_id,
"
"                                    p_prod_rev,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    p_unit_cost,
"
"                                    p_unit_cost,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    p_seq_no,
"
"                                    0,
"
"                                    NULL,
"
"                                    p_vou_no,
"
"                                    NULL,
"
"                                    NULL,
"
"                                    NULL,
"
"                                    v_year,
"
"                                    v_period,
"
"                                    p_date,
"
"                                    NULL,
"
"                                    'CRM',
"
"                                    'MI',
"
"                                    NULL,
"
"                                    p_user,
"
"                                    SYSDATE,
"
"                                    NULL,
"
"                                    func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev),
"
"                                    NULL,
"
"                                    NULL,
"
"                                    NULL,
"
"                                    NULL,
"
"                                    0,
"
"                                    p_ref1 => 'Stocks increased(SIT) against Cust. Serv. (GC) W/H Branch Transfer :'|| ' '|| p_vou_no,
"
"                                    p_ref2 => 'Stocks increased(SIT) against Cust. Serv. (GC) W/H Branch Transfer :'|| ' '|| p_vou_no,
"
"                                    p_stock_transit_in => 1,
"
"                                    p_prod_cls_desc        => v_prod_cls_desc ,
"
"                                    p_prod_sub_cls_id      => v_prod_subcls   ,
"
"                                    p_prod_sub_cls_desc    => v_prod_subcls_desc,
"
"                                    p_prod_grp_id          => v_prod_grp,
"
"                                    p_prod_grp_desc        => v_prod_grp_desc,
"
"                                    p_prod_sub_grp_id      => v_prod_subgrp,
"
"                                    p_prod_sub_grp_desc    => v_prod_subgrp_desc,
"
"                                    p_prod_cls_type        => v_prod_cls_type
"
"                                   );
"
"
"
"                IF func_find_prod_ser_lot_type(p_bu,p_prod_id,p_prod_Rev) NOT IN ('N') THEN
"
"
"
"                    proc_upd_lot_ser_stocks(p_bu,
"
"                                            p_frm_store_id,
"
"                                            p_prod_id,
"
"                                            p_prod_rev,
"
"                                            p_sys_ls_no,
"
"                                            0,
"
"                                            0,
"
"                                            1,
"
"                                            p_unit_cost,
"
"                                            p_ser_lot_opt,
"
"                                            NULL,
"
"                                            p_ser_no,
"
"                                            'S',
"
"                                            p_frm_store_id,
"
"                                            func_find_prod_expiry_date(p_bu,p_prod_id,p_prod_rev,TRUNC(p_date)),
"
"                                            TRUNC(p_date),
"
"                                            'MI',
"
"                                            NULL,
"
"                                            p_vou_no,
"
"                                            p_seq_no,
"
"                                            'CRM',
"
"                                            NULL,
"
"                                            'Stocks increased(SIT) against Cust. Serv. (DC) W/H Branch Transfer :'|| ' '|| p_vou_no,
"
"                                            p_user
"
"                                            );
"
"                END IF;
"
"
"
"                /*Internal trasaction - increased(SIT)*/
"
"
"
"            DBMS_OUTPUT.PUT_LINE('Trasaction SIT');
"
"
"
"            pkg_field_visit_rpt.proc_ins_cmt_hist
"
"                                                (
"
"                                                p_bu            ,
"
"                                                p_vou_no    ,
"
"                                                p_date            ,
"
"                                                p_frm_store_id        ,
"
"                                                p_prod_id        ,
"
"                                                p_prod_rev        ,
"
"                                                p_ser_no        ,
"
"                                                p_csr_id        ,
"
"                                                p_wo_no            ,
"
"                                                p_plnt            ,    --p_wo_unit
"
"                                                p_csr_no        ,
"
"                                                0                , --p_trans_qty
"
"                                                1                , --p_transit_qty
"
"                                                p_wo_qty        ,
"
"                                                p_buf_stk_qty    ,
"
"                                                p_rpr_comp_flag    ,
"
"                                                p_user            ,
"
"                                                p_sys_ls_no        ,
"
"                                                p_source_type    ,
"
"                                                p_source_id        ,
"
"                                                p_batch_no        ,
"
"                                                'SIT'            ,--p_bucket_type
"
"                                                p_fvr_no         ,
"
"                                                p_fvr_seq_no    ,
"
"                                                p_rwk_ord_no    ,
"
"                                                p_type           ,
"
"                                                p_status         ,
"
"                                                'Stocks increased(SIT) against Cust. Serv. (DC) W/H Branch Transfer :'|| ' '|| p_vou_no,
"
"                                                p_unit_cost  ,
"
"                                                p_vou_no
"
"                                                );
"
"
"
"
"
"    END proc_dec_frm_plnt_stocks;
"
"
"
"    BEGIN
"
"
"
"
"
"
"
"        v_year := func_find_year(p_bu,p_date);
"
"        v_period := func_find_period(p_bu,p_date);
"
"
"
"          proc_get_emp_det(p_bu,
"
"                           p_user,
"
"                           v_issuer_id,
"
"                           v_issuer_name,
"
"                           v_issuer_pos_id,
"
"                           v_issuer_pos_name,
"
"                           dummy1,
"
"                           dummy2,
"
"                           p_lang
"
"                          );
"
"
"
"        v_Start := 1;
"
"
"
"        v_issdoc_no := func_find_icm_next_id(p_bu,p_date,'MI',p_frm_store_id,p_user);
"
"
"
"        IF v_start = 1 THEN
"
"                v_start_no := v_issdoc_no;
"
"        END IF;
"
"
"
"        v_end_no := v_issdoc_no;
"
"
"
"      BEGIN
"
"        SELECT store_id
"
"          INTO v_to_wh
"
"          FROM stores
"
"         WHERE store_bu = p_bu
"
"           AND store_plnt = p_to_plnt
"
"           AND store_physical = 'E'; --
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        Raise_Application_Error(-20768,'ICM '||'Cust. Serv. (DC) W/H not found.'||p_bu||' /'||p_to_plnt);
"
"      END;
"
"
"
"        INSERT INTO inv_stock_trans_hd(isthd_bu,
"
"                                     isthd_plnt,
"
"                                     isthd_ref_unit,
"
"                                     isthd_doc_no,
"
"                                     isthd_doc_oper,
"
"                                     isthd_issuefm_store_id,
"
"                                     isthd_issueto_type,
"
"                                     isthd_issueto_id,
"
"                                     isthd_trans_date,
"
"                                     isthd_year,
"
"                                     isthd_period,
"
"                                     isthd_status,
"
"                                     isthd_reference,
"
"                                     isthd_issuer_id,
"
"                                     isthd_issuer_name,
"
"                                     isthd_issuer_pos_id,
"
"                                     isthd_issuer_pos_name,
"
"                                     isthd_cre_by,
"
"                                     isthd_cre_date
"
"                                    )
"
"                                  VALUES(p_bu,
"
"                                         p_plnt,
"
"                                     p_to_plnt,
"
"                                     v_issdoc_no,
"
"                                     'T',
"
"                                     p_frm_store_id,
"
"                                     'I',
"
"                                     v_to_wh,
"
"                                     p_date,
"
"                                     v_year,
"
"                                     v_period,
"
"                                     'O',
"
"                                     'Material Issuance created from Branch Transfer from the doc no.' || ' : ' || p_doc_no||' ' ||'from ' ||p_plnt,
"
"                                     v_issuer_id,
"
"                                     v_issuer_name,
"
"                                     v_issuer_pos_id,
"
"                                     v_issuer_pos_name,
"
"                                     p_user,
"
"                                     SYSDATE
"
"                                    );
"
"            v_start := v_start + 1;
"
"
"
"        FOR r_mat IN c_mat
"
"        LOOP
"
"
"
"
"
"            INSERT INTO inv_stock_trans_ln(istln_bu,
"
"                                           istln_doc_no,
"
"                                           istln_seq_no,
"
"                                           istln_prod_id,
"
"                                           istln_prod_rev,
"
"                                           istln_uom,
"
"                                           istln_prod_uom,
"
"                                           istln_conv_factor,
"
"                                           istln_prod_cls,
"
"                                           istln_rqst_qty,
"
"                                           istln_trans_qty,
"
"                                           istln_accepted_qty,
"
"                                           istln_unit_cost,
"
"                                           istln_reference,
"
"                                           istln_status,
"
"                                           istln_ord_qty,
"
"                                           istln_mat_type,
"
"                                           istln_cre_by,
"
"                                           istln_cre_date,
"
"                                           istln_type,
"
"                                           istln_ord_type,
"
"                                           istln_ord_pfx,
"
"                                           istln_ord_no,
"
"                                           istln_ord_seq_no,
"
"                                           istln_ord_sub_seq_no
"
"                                          )
"
"                                    VALUES(p_bu,
"
"                                           v_issdoc_no,
"
"                                           v_seq_no,
"
"                                           r_mat.cmt_prod_id,
"
"                                           r_mat.cmt_prod_rev,
"
"                                           func_find_product_uom(p_bu,r_mat.cmt_prod_id,r_mat.cmt_prod_rev),
"
"                                           func_find_product_uom(p_bu,r_mat.cmt_prod_id,r_mat.cmt_prod_rev),
"
"                                           1,
"
"                                           func_find_product_class(p_bu,p_plnt,r_mat.cmt_prod_id,r_mat.cmt_prod_rev),
"
"                                           1,--r_mat.fvrss_repl_qty,
"
"                                           1,--r_mat.fvrss_repl_qty,
"
"                                           1,--r_mat.fvrss_repl_qty,
"
"                                           r_mat.cmt_unit_Cost,
"
"                                           'Material Issuance created from Branch Transfer',
"
"                                           'O',
"
"                                           0,
"
"                                           'S',
"
"                                           p_user,
"
"                                           SYSDATE,
"
"                                           'NA',
"
"                                           'FB',--Field Visit
"
"                                           NULL,
"
"                                           r_mat.cmt_fvr_no,
"
"                                           r_mat.cmt_fvr_seq_no,
"
"                                           NULL
"
"                                          );
"
"
"
"
"
"
"
"                    v_sys_ls_no     := r_mat.cmt_sys_ls_no;
"
"                    v_source_type    := r_mat.cmt_source_type;
"
"                    v_source_id     := r_mat.cmt_source_id;
"
"
"
"
"
"
"
"                   SELECT NVL(MAX(isbd_sub_seq_no),0) + 1
"
"                     INTO var_lot_seq_no
"
"                     FROM inv_stock_batch_details
"
"                    WHERE isbd_bu = p_bu
"
"                      AND isbd_issue_doc_no = v_issdoc_no
"
"                      AND isbd_seq_no = v_seq_no;
"
"
"
"                   INSERT INTO inv_stock_batch_details(isbd_bu,
"
"                                                       isbd_issue_doc_no,
"
"                                                       isbd_seq_no,
"
"                                                       isbd_sub_seq_no,
"
"                                                       isbd_sys_ls_no,
"
"                                                       isbd_lot_no,
"
"                                                       isbd_serial_no,
"
"                                                       isbd_source_type,
"
"                                                       isbd_source_id,
"
"                                                       isbd_trans_qty,
"
"                                                       isbd_excs_qty,
"
"                                                       isbd_trnf_acpt_qty,
"
"                                                       isbd_ins_rec,
"
"                                                       isbd_cre_by,
"
"                                                       isbd_cre_date
"
"                                                      )
"
"                                                VALUES(p_bu,
"
"                                                       v_issdoc_no,
"
"                                                       v_seq_no,
"
"                                                       var_lot_seq_no,
"
"                                                       v_sys_ls_no,
"
"                                                       NULL,
"
"                                                       r_mat.cmt_serial_no,
"
"                                                       v_source_type,
"
"                                                       v_source_id,
"
"                                                       1,
"
"                                                       0,
"
"                                                       1,
"
"                                                       'N',
"
"                                                       p_user,
"
"                                                       SYSDATE
"
"                                                      );
"
"
"
"                IF func_find_prod_cost_method(p_bu,r_mat.cmt_prod_id,r_mat.cmt_prod_rev) NOT IN ('MAC') THEN
"
"
"
"                    INSERT INTO inv_stock_trans_cost_batch(istcb_bu,
"
"                                                           istcb_doc_no,
"
"                                                           istcb_seq_no,
"
"                                                           istcb_sub_seq_no,
"
"                                                           istcb_batch_no,
"
"                                                           istcb_trans_qty,
"
"                                                           istcb_unit_cost,
"
"                                                           istcb_cre_by,
"
"                                                           istcb_cre_date,
"
"                                                           istcb_ins_rec
"
"                                                          )
"
"                                                    VALUES(p_bu,
"
"                                                           v_issdoc_no,
"
"                                                           v_seq_no,
"
"                                                           1,
"
"                                                           r_mat.cmt_batch_no,
"
"                                                           1,
"
"                                                           r_mat.cmt_unit_Cost,
"
"                                                           p_user,
"
"                                                           SYSDATE,
"
"                                                           'Y'
"
"                                                              );
"
"
"
"                END IF;
"
"
"
"
"
"                /*proc_dec_frm_plnt_stocks(p_bu            ,
"
"                                         p_plnt            ,
"
"                                         p_date            ,
"
"                                         r_mat.cmt_prod_id,
"
"                                         r_mat.cmt_prod_rev        ,
"
"                                         p_frm_store_id    ,
"
"                                         r_mat.cmt_sys_ls_no    ,
"
"                                         func_find_prod_ser_lot_type(p_bu,r_mat.cmt_prod_id,r_mat.cmt_prod_rev)    ,
"
"                                         r_mat.cmt_serial_no        ,
"
"                                         r_mat.cmt_batch_no        ,
"
"                                         r_mat.cmt_unit_cost    ,
"
"                                         v_seq_no    ,
"
"                                         p_doc_no    ,
"
"                                         p_user        ,
"
"                                         r_mat.cmt_csr_id        ,
"
"                                         r_mat.cmt_serv_wo_no        ,
"
"                                         r_mat.cmt_csr_no        ,
"
"                                         r_mat.cmt_wo_qty        ,
"
"                                         r_mat.cmt_buf_stk_qty    ,
"
"                                         r_mat.cmt_rpr_comp_flag,
"
"                                         r_mat.cmt_source_type    ,
"
"                                         r_mat.cmt_source_id    ,
"
"                                         r_mat.cmt_fvr_no        ,
"
"                                         r_mat.cmt_fvr_seq_no    ,
"
"                                         r_mat.cmt_rwk_ord_no    ,
"
"                                         r_mat.cmt_type            ,
"
"                                         r_mat.cmt_status
"
"                                         );*/
"
"
"
"                v_seq_no := v_seq_no + 1;
"
"                v_chk     := 'Y';
"
"            END LOOP;
"
"
"
"                     /*pkg_field_visit_rpt.proc_ins_dc_doc_frm_cmt(p_bu,
"
"                                                                 p_plnt,
"
"                                                                 v_issdoc_no,
"
"                                                                 p_user,
"
"                                                                 1,
"
"                                                                 v_dc_no
"
"                                                                 );*/
"
"
"
"
"
"        IF v_chk = 'Y' THEN
"
"
"
"            UPDATE csd_mtrl_trckg
"
"               SET cmt_sel_flag = 'N',
"
"                   cmt_sel_user = NULL,
"
"                   cmt_status = 'B'
"
"             WHERE cmt_bu = p_bu
"
"               AND cmt_sel_flag = 'Y'
"
"               AND cmt_sel_user = p_user
"
"               AND cmt_type = 'I'
"
"               AND p_to_plnt IS NOT NULL;
"
"
"
"
"
"            IF v_start_no <> v_end_no THEN
"
"               p_res := v_start_no ||'-'||v_end_no;
"
"            ELSE
"
"               p_res := v_start_no;
"
"            END IF;
"
"
"
"            IF v_dc_no IS NOT NULL THEN
"
"                p_dc_no := v_dc_no;
"
"            END IF;
"
"
"
"        ELSE
"
"            p_res := 'Document not created.';
"
"        END IF;
"
"
"
"    END proc_ins_iss_doc;
"
"
"
"    PROCEDURE proc_rev_fvr_doc(p_bu                    VARCHAR2,
"
"                               p_lang                NUMBER,
"
"                               p_user                VARCHAR2,
"
"                               p_res        OUT        VARCHAR2,
"
"                               p_chk        OUT        VARCHAR2
"
"                               )
"
"    IS
"
"    CURSOR c_batch(c_doc_no    VARCHAR2,
"
"                   c_seq_no    NUMBER)
"
"    IS
"
"    SELECT istcb_batch_no,
"
"           istcb_unit_cost
"
"      FROM inv_stock_trans_cost_batch
"
"     WHERE istcb_bu = p_bu
"
"       AND istcb_doc_no = c_doc_no
"
"       AND istcb_seq_no = c_seq_no
"
"       AND istcb_trans_qty - (istcb_trnf_tot_acpt_qty + istcb_trnf_tot_rtn_qty) > 0
"
"     ORDER BY istcb_sub_seq_no;
"
"
"
"    r_batch                c_batch%ROWTYPE;
"
"    v_doc_no            VARCHAR2(15);
"
"    v_Store_id            VARCHAR2(10);
"
"    v_to_Store            VARCHAR2(10);
"
"    v_batch_no            NUMBER(15);
"
"    v_Start                NUMBER;
"
"    v_start_no            VARCHAR2(15);
"
"    v_end_no            VARCHAR2(15);
"
"    v_unit_cost            NUMBER(17,5) := 0;
"
"
"
"    PROCEDURE proc_inc_to_plnt_stocks(p_bu                VARCHAR2,
"
"                                       p_plnt            VARCHAR2,
"
"                                       p_to_plnt        VARCHAR2,
"
"                                       p_date            DATE,
"
"                                       p_prod_id        VARCHAR2,
"
"                                       p_prod_rev        NUMBER,
"
"                                       p_frm_store_id    VARCHAR2,
"
"                                       p_sys_ls_no        NUMBER,
"
"                                       p_ser_lot_opt    VARCHAR2,
"
"                                       p_ser_no            VARCHAR2,
"
"                                       p_batch_no        VARCHAR2,
"
"                                       p_unit_cost        NUMBER,
"
"                                       p_seq_no            NUMBER,
"
"                                       p_vou_no            VARCHAR2,
"
"                                       p_user            VARCHAR2,
"
"                                       p_csr_id            VARCHAR2,
"
"                                       p_wo_no            VARCHAR2,
"
"                                       p_csr_no            VARCHAR2,
"
"                                       p_wo_qty            NUMBER,
"
"                                       p_buf_stk_qty    NUMBER,
"
"                                       p_rpr_comp_flag    VARCHAR2,
"
"                                       p_source_type    VARCHAR2,
"
"                                       p_source_id        VARCHAR2,
"
"                                       p_fvr_no            VARCHAR2,
"
"                                       p_fvr_seq_no        NUMBER,
"
"                                       p_rwk_ord_no        VARCHAR2,
"
"                                       p_type            VARCHAR2,
"
"                                       p_status            VARCHAR2
"
"                                       )
"
"    IS
"
"
"
"    v_year            NUMBER;
"
"    v_period        NUMBER;
"
"    v_to_Store        VARCHAR2(10);
"
"    v_batch_no        VARCHAR2(15);
"
"    v_prod_cls_desc                 VARCHAR2(200)   ;
"
"    v_prod_subcls                     VARCHAR2(10)    ;
"
"    v_prod_subcls_desc            VARCHAR2(200)   ;
"
"    v_prod_grp                    VARCHAR2(10)    ;
"
"    v_prod_grp_desc               VARCHAR2(50)    ;
"
"    v_prod_subgrp                 VARCHAR2(10)    ;
"
"    v_prod_subgrp_desc            VARCHAR2(50)    ;
"
"    v_prod_cls_type                 VARCHAR2(10)    ;
"
"
"
"
"
"    BEGIN
"
"
"
"        proc_get_prod_param_det(p_bu           ,
"
"                p_plnt                 ,
"
"                p_prod_id              ,
"
"                p_prod_rev             ,
"
"                v_prod_cls_desc        ,
"
"                v_prod_subcls          ,
"
"                v_prod_subcls_desc     ,
"
"                v_prod_grp             ,
"
"                v_prod_grp_desc        ,
"
"                v_prod_subgrp          ,
"
"                v_prod_subgrp_desc     ,
"
"                v_prod_cls_type        ,
"
"                p_user                 ,
"
"                p_lang                 );
"
"        v_year := func_find_year(p_bu,p_date);
"
"        v_period := func_find_period(p_bu,p_date);
"
"
"
"            BEGIN
"
"                SELECT store_id
"
"                  INTO v_to_Store
"
"                  FROM stores
"
"                 WHERE store_bu = p_bu
"
"                   AND store_plnt = p_plnt
"
"                   AND store_physical = 'G';
"
"            EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                Raise_Application_Error(-20768,'ICM '||'Cust. Serv. (DC) W/H not found.'||p_bu||' /'||p_plnt);
"
"            END;
"
"
"
"            V_TO_STORE := p_source_id;
"
"
"
"            /*Pending unit stock in-transit(Decrease)*/
"
"
"
"                DBMS_OUTPUT.PUT_LINE('Stocks decreased'||' ' ||'SIT');
"
"
"
"                    proc_upd_stocks(p_bu,
"
"                                    p_frm_store_id,
"
"                                    NULL,
"
"                                    p_prod_id,
"
"                                    p_prod_rev,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    p_unit_cost,
"
"                                    p_unit_cost,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    p_seq_no,
"
"                                    0,
"
"                                    NULL,
"
"                                    p_vou_no,
"
"                                    NULL,
"
"                                    NULL,
"
"                                    NULL,
"
"                                    v_year,
"
"                                    v_period,
"
"                                    p_date,
"
"                                    NULL,
"
"                                    'CRM',
"
"                                    'MI',
"
"                                    NULL,
"
"                                    p_user,
"
"                                    SYSDATE,
"
"                                    NULL,
"
"                                    func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev),
"
"                                    NULL,
"
"                                    NULL,
"
"                                    NULL,
"
"                                    NULL,
"
"                                    0,
"
"                                    p_ref1 => 'Stocks decreased(SIT) against Cust. Serv. (GC) W/H Branch Transfer :'|| ' '|| p_vou_no,
"
"                                    p_ref2 => 'Stocks decreased(SIT) against Cust. Serv. (GC) W/H Branch Transfer :'|| ' '|| p_vou_no,
"
"                                    p_stock_transit_in => -1 ,
"
"                                    p_prod_cls_desc        => v_prod_cls_desc ,
"
"                                    p_prod_sub_cls_id      => v_prod_subcls   ,
"
"                                    p_prod_sub_cls_desc    => v_prod_subcls_desc,
"
"                                    p_prod_grp_id          => v_prod_grp,
"
"                                    p_prod_grp_desc        => v_prod_grp_desc,
"
"                                    p_prod_sub_grp_id      => v_prod_subgrp,
"
"                                    p_prod_sub_grp_desc    => v_prod_subgrp_desc,
"
"                                    p_prod_cls_type        => v_prod_cls_type
"
"                                   );
"
"
"
"                IF func_find_prod_ser_lot_type(p_bu,p_prod_id,p_prod_Rev) NOT IN ('N') THEN
"
"
"
"                    proc_upd_lot_ser_stocks(p_bu,
"
"                                            p_frm_store_id,
"
"                                            p_prod_id,
"
"                                            p_prod_rev,
"
"                                            p_sys_ls_no,
"
"                                            0,
"
"                                            0,
"
"                                            -1,
"
"                                            p_unit_cost,
"
"                                            p_ser_lot_opt,
"
"                                            NULL,
"
"                                            p_ser_no,
"
"                                            'S',
"
"                                            p_frm_store_id,
"
"                                            func_find_prod_expiry_date(p_bu,p_prod_id,p_prod_rev,TRUNC(p_date)),
"
"                                            TRUNC(p_date),
"
"                                            'MI',
"
"                                            NULL,
"
"                                            p_vou_no,
"
"                                            p_seq_no,
"
"                                            'CRM',
"
"                                            NULL,
"
"                                            'Stocks decreased(SIT) against Cust. Serv. (GC) W/H Branch Transfer :'|| ' '|| p_vou_no,
"
"                                            p_user
"
"                                            );
"
"                END IF;
"
"
"
"
"
"                    /*Internal trasaction - decreased(SIT)*/
"
"
"
"                DBMS_OUTPUT.PUT_LINE('Trasaction '||' ' ||'SIT');
"
"
"
"            pkg_field_visit_rpt.proc_ins_cmt_hist
"
"                                                (
"
"                                                p_bu            ,
"
"                                                p_vou_no    ,
"
"                                                p_date            ,
"
"                                                p_frm_store_id        ,
"
"                                                p_prod_id        ,
"
"                                                p_prod_rev        ,
"
"                                                p_ser_no        ,
"
"                                                NULL,--p_csr_id        ,
"
"                                                NULL,--p_wo_no            ,
"
"                                                p_plnt            ,    --p_wo_unit
"
"                                                NULL,--p_csr_no        ,
"
"                                                0                , --p_trans_qty
"
"                                                -1                , --p_transit_qty
"
"                                                0,--p_wo_qty        ,
"
"                                                0,--p_buf_stk_qty    ,
"
"                                                'N',--p_rpr_comp_flag    ,
"
"                                                p_user            ,
"
"                                                p_sys_ls_no        ,
"
"                                                'S',--p_source_type    ,
"
"                                                p_frm_store_id,--p_source_id        ,
"
"                                                NULL,--p_batch_no        ,
"
"                                                'SIT'            ,--p_bucket_type
"
"                                                NULL,--p_fvr_no         ,
"
"                                                NULL,--p_fvr_seq_no    ,
"
"                                                NULL,--p_rwk_ord_no    ,
"
"                                                'I',--p_type           ,
"
"                                                'B',--p_status         ,
"
"                                                'Stocks decreased(SIT) against Cust. Serv. (GC) W/H Branch Transfer :'|| ' '|| p_vou_no,
"
"                                                p_unit_cost  ,
"
"                                                p_vou_no
"
"                                                );
"
"
"
"                    /*Stock Increased against received unit*/
"
"
"
"                    DBMS_OUTPUT.PUT_LINE('Stocks increased '||' ' ||'QOH');
"
"
"
"                    proc_upd_stocks(p_bu,
"
"                                    v_to_Store,
"
"                                    NULL,
"
"                                    p_prod_id,
"
"                                    p_prod_rev,
"
"                                    0,
"
"                                    0,
"
"                                    1,
"
"                                    0,
"
"                                    0,
"
"                                    p_unit_cost,
"
"                                    p_unit_cost,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    p_seq_no,
"
"                                    0,
"
"                                    NULL,
"
"                                    p_vou_no,
"
"                                    NULL,
"
"                                    NULL,
"
"                                    NULL,
"
"                                    v_year,
"
"                                    v_period,
"
"                                    p_date,
"
"                                    NULL,
"
"                                    'CRM',
"
"                                    'MI',
"
"                                    NULL,
"
"                                    p_user,
"
"                                    SYSDATE,
"
"                                    NULL,
"
"                                    func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev),
"
"                                    NULL,
"
"                                    NULL,
"
"                                    NULL,
"
"                                    NULL,
"
"                                    0,
"
"                                    p_ref1 => 'Stocks increased against Cust. Serv. (GC) W/H Branch Transfer :'|| ' '|| p_vou_no,
"
"                                    p_ref2 => 'Stocks increased against Cust. Serv. (GC) W/H Branch Transfer :'|| ' '|| p_vou_no,
"
"                                    p_prod_cls_desc        => v_prod_cls_desc ,
"
"                                    p_prod_sub_cls_id      => v_prod_subcls   ,
"
"                                    p_prod_sub_cls_desc    => v_prod_subcls_desc,
"
"                                    p_prod_grp_id          => v_prod_grp,
"
"                                    p_prod_grp_desc        => v_prod_grp_desc,
"
"                                    p_prod_sub_grp_id      => v_prod_subgrp,
"
"                                    p_prod_sub_grp_desc    => v_prod_subgrp_desc,
"
"                                    p_prod_cls_type        => v_prod_cls_type
"
"                                   );
"
"
"
"            IF func_find_prod_ser_lot_type(p_bu,p_prod_id,p_prod_Rev) NOT IN ('N') THEN
"
"
"
"                    proc_upd_lot_ser_stocks(p_bu,
"
"                                            v_to_Store,
"
"                                            p_prod_id,
"
"                                            p_prod_rev,
"
"                                            p_sys_ls_no,
"
"                                            1,
"
"                                            0,
"
"                                            0,
"
"                                            p_unit_cost,
"
"                                            p_ser_lot_opt,
"
"                                            NULL,
"
"                                            p_ser_no,
"
"                                            'S',
"
"                                            v_to_Store,
"
"                                            func_find_prod_expiry_date(p_bu,p_prod_id,p_prod_rev,TRUNC(p_date)),
"
"                                            TRUNC(p_date),
"
"                                            'MI',
"
"                                            NULL,
"
"                                            p_vou_no,
"
"                                            p_seq_no,
"
"                                            'CRM',
"
"                                            NULL,
"
"                                            'Stocks increased against Cust. Serv. (GC) W/H Branch Transfer :'|| ' '|| p_vou_no,
"
"                                            p_user
"
"                                            );
"
"            END IF;
"
"
"
"            IF func_find_prod_cost_method(p_bu,p_prod_id,p_prod_Rev) NOT IN ('MAC') THEN
"
"
"
"                    proc_upd_stock_batches(
"
"                                            p_bu           ,
"
"                                            v_to_Store    ,
"
"                                            p_prod_id     ,
"
"                                            p_prod_rev    ,
"
"                                            NULL     ,
"
"                                            1       ,
"
"                                            0     ,
"
"                                            0   ,
"
"                                            0     ,
"
"                                            p_unit_cost ,
"
"                                            p_unit_cost ,
"
"                                            0    ,
"
"                                            0 ,
"
"                                            0    ,
"
"                                            0     ,
"
"                                            'N',
"
"                                            p_date   ,
"
"                                            NULL      ,
"
"                                            p_vou_no       ,
"
"                                            p_seq_no  ,
"
"                                            NULL     ,
"
"                                            NULL      ,
"
"                                            p_vou_no       ,
"
"                                            p_seq_no  ,
"
"                                            p_seq_no,
"
"                                            func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)      ,
"
"                                            'MI'    ,
"
"                                            'CRM'          ,
"
"                                            p_vou_no   ,
"
"                                            p_date ,
"
"                                            NULL     ,
"
"                                            NULL   ,
"
"                                            p_user          ,
"
"                                            NULL    ,
"
"                                            NULL  ,
"
"                                            p_ref1=>'Stocks increased against Cust. Serv. (GC) W/H Branch Transfer' || p_vou_no ||'from store '||func_find_store_desc(p_bu,v_to_Store,p_lang) ||'/'||p_plnt ||'-'||func_find_plnt_desc(p_bu,p_plnt,p_lang)  ,
"
"                                            p_ref2=>'Stocks increased against Cust. Serv. (GC) W/H Branch Transfer' || p_vou_no ||'from store '||func_find_store_desc(p_bu,v_to_Store,p_lang) ||'/'||p_plnt ||'-'||func_find_plnt_desc(p_bu,p_plnt,p_lang)  ,
"
"                                            p_prod_cls_desc        => v_prod_cls_desc ,
"
"                                            p_prod_subcls          => v_prod_subcls   ,
"
"                                            p_prod_subcls_desc     => v_prod_subcls_desc,
"
"                                            p_prod_grp             => v_prod_grp,
"
"                                            p_prod_grp_desc        => v_prod_grp_desc,
"
"                                            p_prod_subgrp          => v_prod_subgrp,
"
"                                            p_prod_subgrp_desc     => v_prod_subgrp_desc,
"
"                                            p_prod_cls_type        => v_prod_cls_type
"
"                                        );
"
"
"
"            END IF;
"
"
"
"
"
"                /*Internal trasaction - increased(QOH)*/
"
"
"
"            DBMS_OUTPUT.PUT_LINE('Transaction increased '||' ' ||'QOH');
"
"
"
"            pkg_field_visit_rpt.proc_ins_cmt_hist
"
"                                                (
"
"                                                p_bu            ,
"
"                                                p_vou_no    ,
"
"                                                p_date            ,
"
"                                                v_to_Store        ,
"
"                                                p_prod_id        ,
"
"                                                p_prod_rev        ,
"
"                                                p_ser_no        ,
"
"                                                NULL,--p_csr_id        ,
"
"                                                NULL,--p_wo_no            ,
"
"                                                p_plnt            ,    --p_wo_unit
"
"                                                NULL,--p_csr_no        ,
"
"                                                1                , --p_trans_qty
"
"                                                0                , --p_transit_qty
"
"                                                0,--p_wo_qty        ,
"
"                                                0,--p_buf_stk_qty    ,
"
"                                                'N',--p_rpr_comp_flag    ,
"
"                                                p_user            ,
"
"                                                p_sys_ls_no        ,
"
"                                                'S',--p_source_type    ,
"
"                                                v_to_Store,--p_source_id        ,
"
"                                                p_batch_no        ,
"
"                                                'QOH'            ,--p_bucket_type
"
"                                                NULL,--p_fvr_no         ,
"
"                                                NULL,--p_fvr_seq_no    ,
"
"                                                NULL,--p_rwk_ord_no    ,
"
"                                                'I',--p_type           ,
"
"                                                'B',--p_status         ,
"
"                                                'Stocks increased against Cust. Serv. (GC) W/H Branch Transfer' || p_vou_no ||'from store '||func_find_store_desc(p_bu,v_to_Store,p_lang) ||'/'||p_plnt ||'-'||func_find_plnt_desc(p_bu,p_plnt,p_lang)  ,
"
"                                                p_unit_cost  ,
"
"                                                p_vou_no
"
"                                                );
"
"
"
"
"
"
"
"
"
"    END proc_inc_to_plnt_stocks;
"
"
"
"    BEGIN
"
"
"
"
"
"        FOR r_inv IN (SELECT *
"
"                        FROM inv_issue_dtls_view,
"
"                             products,
"
"                             inv_stock_batch_details
"
"                       WHERE istln_bu = p_bu
"
"                         AND istln_bu = prod_bu
"
"                         AND istln_prod_id = prod_id
"
"                         AND istln_prod_rev = prod_rev
"
"                         AND istln_trnf_acpt_flag = 'Y'
"
"                         AND istln_trnf_acpt_user = p_user
"
"                         AND isbd_bu = istln_bu
"
"                         AND isbd_issue_doc_no = istln_doc_no
"
"                         AND isbd_seq_no = istln_seq_no
"
"                         AND isbd_trnf_acpt_qty > 0
"
"                         AND istln_ord_type = 'FB'
"
"                      )
"
"        LOOP
"
"
"
"            BEGIN
"
"                SELECT store_id
"
"                  INTO v_to_Store
"
"                  FROM stores
"
"                 WHERE store_bu = p_bu
"
"                   AND store_plnt = r_inv.isthd_ref_unit
"
"                   AND store_physical = 'E';
"
"            EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                Raise_Application_Error(-20768,'ICM '||'Cust. Serv. (DC) W/H not found.'||p_bu||' /'||r_inv.isthd_ref_unit);
"
"            END;
"
"
"
"            IF r_inv.prod_cost_method NOT IN ('MAC') THEN
"
"
"
"                OPEN c_batch(r_inv.isthd_doc_no,r_inv.istln_seq_no);
"
"                FETCH c_batch INTO r_batch;
"
"                    IF c_batch%FOUND THEN
"
"                        v_batch_no := r_batch.istcb_batch_no;
"
"                        v_unit_cost := r_batch.istcb_unit_cost;
"
"                    ELSE
"
"                        RAISE_APPLICATION_ERROR(-20050,'PLN');
"
"                    END IF;
"
"                CLOSE c_batch;
"
"            ELSE
"
"                v_batch_no := NULL;
"
"                v_unit_cost := 0.00001;
"
"            END IF;
"
"
"
"
"
"            /*Stock received part in to plnt*/
"
"
"
"            proc_inc_to_plnt_stocks(p_bu            ,
"
"                                    r_inv.isthd_plnt            ,
"
"                                    r_inv.isthd_ref_unit,
"
"                                    r_inv.isthd_trans_date            ,
"
"                                    r_inv.istln_prod_id        ,
"
"                                    r_inv.istln_prod_rev        ,
"
"                                    r_inv.isthd_issuefm_store_id    ,
"
"                                    r_inv.isbd_sys_ls_no        ,
"
"                                    func_find_prod_ser_lot_type(p_bu,r_inv.istln_prod_id,r_inv.istln_prod_rev)    ,
"
"                                    r_inv.isbd_serial_no        ,
"
"                                    v_batch_no        ,
"
"                                    v_unit_cost        ,
"
"                                    1        ,
"
"                                    r_inv.isthd_doc_no        ,
"
"                                    p_user        ,
"
"                                    NULL, --p_csr_id        ,
"
"                                    NULL , --p_serv_wo_no        ,
"
"                                    NULL ,--p_csr_no        ,
"
"                                    0, --p_wo_qty        ,
"
"                                    0,--p_buf_stk_qty    ,
"
"                                    'N',--p_rpr_comp_flag,
"
"                                    'S'    ,
"
"                                    r_inv.isthd_issueto_id     ,
"
"                                    NULL, --p_fvr_no        ,
"
"                                    NULL , --p_fvr_seq_no    ,
"
"                                    NULL, --p_rwk_ord_no    ,
"
"                                    'B',--p_type            ,
"
"                                    'N' --p_status
"
"                                    );
"
"
"
"            BEGIN
"
"                SELECT store_id
"
"                  INTO v_Store_id
"
"                  FROM stores
"
"                 WHERE store_bu = p_bu
"
"                   AND store_plnt = r_inv.isthd_plnt
"
"                   AND store_physical = 'E';
"
"            EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                Raise_Application_Error(-20768,'ICM '||'Cust. Serv. (DC) W/H not found.'||p_bu||' /'||r_inv.isthd_plnt  );
"
"            END;
"
"
"
"            SELECT NVL(MAX(TO_NUMBER(cmt_doc_no)),0) + 1
"
"              INTO v_doc_no
"
"              FROM csd_mtrl_trckg
"
"             WHERE cmt_bu = p_bu
"
"               AND cmt_wo_asgn_unit = r_inv.isthd_ref_unit;
"
"
"
"             v_start := 1;
"
"
"
"             IF v_start = 1 THEN
"
"                v_start_no := v_doc_no;
"
"             END IF;
"
"
"
"                v_end_no := v_doc_no;
"
"
"
"            BEGIN
"
"                SELECT COUNT(*)
"
"                  INTO v_prod_cnt
"
"                  FROM prod_plants
"
"                 WHERE prodplnt_bu = p_bu
"
"                   AND prodplnt_plnt = r_inv.isthd_ref_unit
"
"                   AND prodplnt_prod_id = r_inv.istln_prod_id
"
"                   AND prodplnt_prod_Rev = r_inv.istln_prod_rev
"
"                   AND prodplnt_status = 'A';
"
"
"
"            END;
"
"
"
"            IF v_prod_cnt = 0 THEN
"
"                raise_application_error(-20260,'ICM');
"
"            END IF;
"
"
"
"        INSERT INTO csd_mtrl_trckg    (
"
"                                    cmt_bu                 ,
"
"                                    cmt_doc_no             ,
"
"                                    cmt_trans_date         ,
"
"                                    cmt_store_id           ,
"
"                                    cmt_prod_id            ,
"
"                                    cmt_prod_rev           ,
"
"                                    cmt_serial_no          ,
"
"                                    cmt_csr_id             ,
"
"                                    cmt_serv_wo_no         ,
"
"                                    cmt_wo_asgn_unit       ,
"
"                                    cmt_csr_no             ,
"
"                                    cmt_trans_qty          ,
"
"                                    cmt_tranit_qty         ,
"
"                                    cmt_wo_qty             ,
"
"                                    cmt_buf_stk_qty        ,
"
"                                    cmt_rpr_comp_flag      ,
"
"                                    cmt_sel_flag           ,
"
"                                    cmt_sel_user           ,
"
"                                    cmt_cre_by             ,
"
"                                    cmt_cre_date           ,
"
"                                    cmt_upd_by             ,
"
"                                    cmt_upd_date           ,
"
"                                    cmt_sys_ls_no          ,
"
"                                    cmt_source_type        ,
"
"                                    cmt_source_id          ,
"
"                                    cmt_batch_no           ,
"
"                                    cmt_bucket_type        ,
"
"                                    cmt_fvr_no             ,
"
"                                    cmt_fvr_seq_no         ,
"
"                                    cmt_rwk_ord_no           ,
"
"                                    cmt_type                ,
"
"                                    cmt_status,
"
"                                    cmt_ref       ,
"
"                                    cmt_unit_cost,
"
"                                    cmt_branch_miv_no
"
"                                    )
"
"                             VALUES(p_bu                 ,
"
"                                    v_doc_no             ,
"
"                                    r_inv.isthd_trans_date             ,
"
"                                    r_inv.isthd_issueto_id           ,
"
"                                    r_inv.istln_prod_id          ,
"
"                                    r_inv.istln_prod_rev           ,
"
"                                    r_inv.isbd_serial_no          ,
"
"                                    NULL             ,
"
"                                    NULL         ,
"
"                                    r_inv.isthd_ref_unit ,
"
"                                    NULL             ,
"
"                                    1          ,
"
"                                    0         ,
"
"                                    0             ,
"
"                                    0        ,
"
"                                    'N'      ,
"
"                                    'N'           ,
"
"                                    NULL           ,
"
"                                    p_user             ,
"
"                                    SYSDATE           ,
"
"                                    NULL             ,
"
"                                    NULL           ,
"
"                                    r_inv.isbd_sys_ls_no          ,
"
"                                    'S'        ,
"
"                                    r_inv.isthd_issueto_id          ,
"
"                                    v_batch_no           ,
"
"                                    'QOH'        ,
"
"                                    NULL             ,
"
"                                    NULL         ,
"
"                                    NULL  ,
"
"                                    'B',
"
"                                    'N',
"
"                                    'Customer invoice material tracking doc from Branch transfer '||' ' ||r_inv.isthd_ref_unit|| ' to ' || r_inv.isthd_plnt  ||'against the issuance doc '||' ' ||r_inv.isthd_doc_no   ,
"
"                                    v_unit_cost,
"
"                                    r_inv.isthd_doc_no
"
"                                    );
"
"
"
"                        v_start := v_start + 1;
"
"
"
"                UPDATE inv_stock_trans_ln
"
"                   SET istln_trnf_tot_acpt_qty = istln_trnf_tot_acpt_qty + r_inv.istln_trnf_acpt_qty,
"
"                       istln_trnf_acpt_qty = 0,
"
"                       istln_trnf_acpt_flag = 'N',
"
"                       istln_trnf_acpt_user = NULL,
"
"                       istln_upd_by = p_user,
"
"                       istln_upd_date = SYSDATE
"
"                 WHERE istln_bu = r_inv.istln_bu
"
"                   AND istln_doc_no = r_inv.istln_doc_no
"
"                   AND istln_seq_no = r_inv.istln_seq_no
"
"                   AND istln_status = 'O';
"
"
"
"                IF r_inv.istln_trans_qty = (r_inv.istln_trnf_tot_acpt_qty + r_inv.istln_trnf_tot_rtn_qty + r_inv.istln_trnf_acpt_qty + r_inv.istln_trnf_rtn_qty) THEN
"
"
"
"                      UPDATE inv_stock_trans_ln
"
"                         SET istln_status = 'I',
"
"                             istln_upd_by = p_user,
"
"                             istln_upd_date = SYSDATE
"
"                       WHERE istln_bu = r_inv.istln_bu
"
"                         AND istln_doc_no = r_inv.istln_doc_no
"
"                         AND istln_seq_no = r_inv.istln_seq_no
"
"                         AND istln_status = 'O';
"
"
"
"                END IF;
"
"
"
"                    UPDATE inv_stock_trans_hd
"
"                       SET isthd_status = 'I',
"
"                           isthd_upd_by = p_user,
"
"                           isthd_upd_date = SYSDATE
"
"                     WHERE isthd_bu = r_inv.istln_bu
"
"                       AND isthd_doc_no = r_inv.istln_doc_no
"
"                       AND isthd_status = 'O'
"
"                       AND 0 = (SELECT COUNT(*)
"
"                                  FROM inv_stock_trans_ln
"
"                                 WHERE istln_bu = r_inv.istln_bu
"
"                                   AND istln_doc_no = r_inv.istln_doc_no
"
"                                   AND istln_status = 'O');
"
"
"
"
"
"                                   p_chk := 'Y';
"
"
"
"            END LOOP;
"
"
"
"        IF v_start_no <> v_end_no THEN
"
"            p_res := v_start_no ||'-'||v_end_no;
"
"        ELSE
"
"            p_res := v_start_no;
"
"        END IF;
"
"
"
"    END proc_rev_fvr_doc;
"
"
"
"    PROCEDURE proc_ins_cmt_hist
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_doc_no        VARCHAR2,
"
"    p_date            DATE,
"
"    p_store_id        VARCHAR2,
"
"    p_prod_id        VARCHAR2,
"
"    p_prod_rev        NUMBER,
"
"    p_ser_no        VARCHAR2,
"
"    p_csr_id        VARCHAR2,
"
"    p_wo_no            VARCHAR2,
"
"    p_wo_unit        VARCHAR2,
"
"    p_csr_no        VARCHAR2,
"
"    p_trans_qty        NUMBER,
"
"    p_transit_qty    NUMBER,
"
"    p_wo_qty        NUMBER,
"
"    p_buf_stk_qty    NUMBER,
"
"    p_rpr_comp_flag    VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_sys_ls_no        VARCHAR2,
"
"    p_source_type    VARCHAR2,
"
"    p_source_id        VARCHAR2,
"
"    p_batch_no        VARCHAR2,
"
"    p_bucket_type    VARCHAR2,
"
"    p_fvr_no         VARCHAR2,
"
"    p_fvr_seq_no    NUMBER,
"
"    p_rwk_ord_no    VARCHAR2,
"
"    p_type           VARCHAR2,
"
"    p_status         VARCHAR2,
"
"    p_ref            VARCHAR2,
"
"    p_unit_cost      NUMBER,
"
"    p_branch_miv_no    VARCHAR2
"
"    )
"
"    IS
"
"    v_trans_no        VARCHAR2(15);
"
"    BEGIN
"
"
"
"                SELECT NVL(MAX(TO_NUMBER(cmth_trans_no)),0) + 1
"
"                  INTO v_trans_no
"
"                  FROM csd_mtrl_trckg_hist
"
"                 WHERE cmth_bu = p_bu;
"
"
"
"                INSERT INTO csd_mtrl_trckg_hist(cmth_bu,
"
"                                                cmth_trans_no,
"
"                                                cmth_doc_no,
"
"                                                cmth_trans_date,
"
"                                                cmth_store_id,
"
"                                                cmth_prod_id,
"
"                                                cmth_prod_rev,
"
"                                                cmth_serial_no,
"
"                                                cmth_csr_id,
"
"                                                cmth_serv_wo_no,
"
"                                                cmth_wo_asgn_unit,
"
"                                                cmth_csr_no,
"
"                                                cmth_trans_qty,
"
"                                                cmth_tranit_qty,
"
"                                                cmth_wo_qty,
"
"                                                cmth_buf_stk_qty,
"
"                                                cmth_rpr_comp_flag,
"
"                                                cmth_cre_by,
"
"                                                cmth_cre_date,
"
"                                                cmth_sys_ls_no,
"
"                                                cmth_source_type,
"
"                                                cmth_source_id,
"
"                                                cmth_batch_no,
"
"                                                cmth_bucket_type,
"
"                                                cmth_fvr_no     ,
"
"                                                cmth_fvr_seq_no,
"
"                                                cmth_rwk_ord_no,
"
"                                                cmth_type       ,
"
"                                                cmth_status     ,
"
"                                                cmth_ref        ,
"
"                                                cmth_unit_cost  ,
"
"                                                cmth_branch_miv_no
"
"                                                )
"
"                                        VALUES(p_bu,
"
"                                               v_trans_no,
"
"                                               p_doc_no,
"
"                                               p_date,
"
"                                               p_store_id,
"
"                                               p_prod_id,
"
"                                               p_prod_rev,
"
"                                               p_ser_no,
"
"                                               p_csr_id,
"
"                                               p_wo_no,
"
"                                               p_wo_unit,
"
"                                               p_csr_no,
"
"                                               p_trans_qty,
"
"                                               p_transit_qty,
"
"                                               p_wo_qty,
"
"                                               p_buf_stk_qty,
"
"                                               p_rpr_comp_flag,
"
"                                               p_user,
"
"                                               SYSDATE,
"
"                                               p_sys_ls_no,
"
"                                               p_source_type,
"
"                                               p_source_id,
"
"                                               p_batch_no,
"
"                                               p_bucket_type,
"
"                                               p_fvr_no     ,
"
"                                               p_fvr_seq_no,
"
"                                               p_rwk_ord_no,
"
"                                               p_type       ,
"
"                                               p_status     ,
"
"                                               p_ref        ,
"
"                                               p_unit_cost  ,
"
"                                               p_branch_miv_no
"
"                                               );
"
"
"
"    END proc_ins_cmt_hist;
"
"
"
"    PROCEDURE proc_ins_dc_doc_frm_cmt
"
"    (p_bu            VARCHAR2,
"
"     p_plnt            VARCHAR2,
"
"     p_doc_no        VARCHAR2,
"
"     p_user            VARCHAR2,
"
"     p_lang            VARCHAR2,
"
"     p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"    IS
"
"    SELECT isthd_issueto_type,
"
"           isthd_issueto_id,
"
"           isthd_issuefm_store_id,
"
"           istln_ord_type,
"
"           isthd_trans_date,
"
"           isthd_ref_unit
"
"      FROM inv_stock_trans_hd,
"
"           inv_stock_trans_ln
"
"     WHERE isthd_bu = istln_bu
"
"       AND isthd_doc_no = istln_doc_no
"
"       AND isthd_bu = p_bu
"
"       AND isthd_plnt = p_plnt
"
"       AND isthd_doc_no = p_doc_no
"
"       AND istln_status <> 'C'
"
"       AND istln_dc_doc_no IS NULL
"
"     GROUP BY isthd_issueto_type,isthd_issueto_id,isthd_issuefm_store_id,istln_ord_type,isthd_trans_date,isthd_ref_unit
"
"     ORDER BY isthd_issueto_type,istln_ord_type;
"
"
"
"    CURSOR c2(c_benf_type    VARCHAR2,
"
"              c_benf_id    VARCHAR2,
"
"              c_ord_type    VARCHAR2) IS
"
"    SELECT *
"
"      FROM inv_stock_trans_hd,
"
"           inv_stock_trans_ln
"
"     WHERE isthd_bu = istln_bu
"
"       AND isthd_doc_no = istln_doc_no
"
"       AND isthd_bu = p_bu
"
"       AND isthd_plnt = p_plnt
"
"       AND isthd_doc_no = p_doc_no
"
"       AND isthd_issueto_type = c_benf_type
"
"       AND isthd_issueto_id = c_benf_id
"
"       AND istln_ord_type = c_ord_type
"
"       AND istln_status <> 'C'
"
"       AND istln_dc_doc_no IS NULL
"
"     ORDER BY istln_seq_no;
"
"
"
"    CURSOR c3(c_seq_no    NUMBER)
"
"      IS
"
"    SELECT *
"
"      FROM inv_stock_batch_details
"
"     WHERE isbd_bu = p_bu
"
"       AND isbd_issue_doc_no = p_doc_no
"
"       AND isbd_seq_no = c_seq_no
"
"       AND isbd_sys_ls_no IS NOT NULL;
"
"
"
"    CURSOR c4(c_suplr_id VARCHAR2) IS
"
"    SELECT *
"
"      FROM suppliers
"
"     WHERE suplr_bu = p_bu
"
"       AND suplr_suplr_id = c_suplr_id
"
"       AND suplr_transfer_plnt IS NOT NULL
"
"       AND suplr_transfer_bu IS NOT NULL;
"
"
"
"    CURSOR c5
"
"      IS
"
"    SELECT *
"
"      FROM gem_plnt_control
"
"     WHERE gpc_bu = p_bu
"
"       AND gpc_plnt = p_plnt;
"
"
"
"    CURSOR c6(c_benf_type    VARCHAR2,
"
"              c_benf_id    VARCHAR2,
"
"              c_ord_type    VARCHAR2) IS
"
"    SELECT *
"
"      FROM inv_stock_trans_hd,
"
"           inv_stock_trans_ln,
"
"           inv_stock_trans_contr,
"
"           inv_tool_res_issue
"
"     WHERE isthd_bu = istln_bu
"
"       AND isthd_doc_no = istln_doc_no
"
"       AND istln_bu = istc_bu
"
"       AND istln_doc_no = istc_doc_no
"
"       AND istln_seq_no = ISTC_SEQ_NO
"
"       AND istc_bu = itri_bu
"
"       AND istc_doc_no = itri_doc_no
"
"       AND ISTC_SEQ_NO = itri_seq_no
"
"       AND istc_bu = p_bu
"
"       AND istc_doc_no = p_doc_no
"
"       AND isthd_issueto_type = c_benf_type
"
"       AND isthd_issueto_id = c_benf_id
"
"       AND istln_ord_type = c_ord_type
"
"       AND isthd_issueto_type NOT IN ('I','S','R')
"
"       AND func_find_prod_packcon_flag(p_bu,istln_prod_id,istln_prod_rev) = 'Y'
"
"       AND istln_status <> 'C';
"
"
"
"    CURSOR c7(c_ord_pfx    VARCHAR2,
"
"          c_ord_no    VARCHAR2,
"
"          c_seq_no    NUMBER)
"
"    IS
"
"      SELECT *
"
"        FROM sub_contr_ord_process
"
"       WHERE scop_bu = p_bu
"
"         AND scop_ord_pfx = c_ord_pfx
"
"         AND scop_ord_no = c_ord_no
"
"         AND scop_seq_no = c_seq_no;
"
"
"
"    CURSOR c8
"
"      IS
"
"    SELECT *
"
"      FROM icm_control
"
"     WHERE icmctrl_bu = p_bu;
"
"
"
"    cr1            c1%ROWTYPE;
"
"    cr4            c4%ROWTYPE;
"
"    cr5            c5%ROWTYPE;
"
"    cr8            c8%ROWTYPE;
"
"
"
"    var_ord_type        VARCHAR2(2);
"
"    var_dc_doc_no        VARCHAR2(100);
"
"    var_seq_no        NUMBER;
"
"    var_dc_no        VARCHAR2(100);
"
"    var_emp_id        VARCHAR2(10);
"
"    var_emp_desc        VARCHAR2(100);
"
"    var_pos_id        VARCHAR2(10);
"
"    var_pos_desc        VARCHAR2(100);
"
"    var_dep_id        VARCHAR2(10);
"
"    var_dep_desc        VARCHAR2(100);
"
"    var_prod_desc2        VARCHAR2(100);
"
"    var_trans_no        NUMBER;
"
"    var_sub_seq_no        NUMBER;
"
"    var_proc_seq_no        NUMBER;
"
"    var_cmr_res        VARCHAR2(150);
"
"    var_other_type        VARCHAR2(1);
"
"    var_tot_value         NUMBER(17,3);
"
"    var_addr1         VARCHAR2(500);
"
"    var_addr2        VARCHAR2(500);
"
"    var_addr3        VARCHAR2(500);
"
"    var_addr4        VARCHAR2(500);
"
"    var_addr5        VARCHAR2(500);
"
"    var_city        VARCHAR2(500);
"
"    var_state        VARCHAR2(500);
"
"    var_cntry        VARCHAR2(500);
"
"    var_po_box        VARCHAR2(500);
"
"    var_zip            VARCHAR2(500);
"
"    var_tele1        VARCHAR2(500);
"
"    var_tele2        VARCHAR2(500);
"
"    var_email1        VARCHAR2(500);
"
"    var_fax1        VARCHAR2(500);
"
"    var_website        VARCHAR2(500);
"
"    var_ent_user        VARCHAR2(15);
"
"
"
"    BEGIN
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"        IF cr1.isthd_issueto_type IN ('S','I','R','C') THEN
"
"          var_ord_type := 'MT';
"
"        ELSIF cr1.isthd_issueto_type = 'P' THEN
"
"          var_ord_type := 'PI';
"
"        ELSIF cr1.isthd_issueto_type = 'V' THEN
"
"
"
"          IF cr1.istln_ord_type = 'PU' THEN
"
"            var_ord_type := 'IM';
"
"          ELSIF cr1.istln_ord_type = 'SS' THEN
"
"            var_ord_type := 'SS';
"
"          ELSIF cr1.istln_ord_type = 'SV' THEN
"
"            var_ord_type := 'SV';
"
"          ELSIF cr1.istln_ord_type = 'RS' THEN
"
"            var_ord_type := 'RS';
"
"          ELSIF cr1.istln_ord_type = 'RV' THEN
"
"            var_ord_type := 'RV';
"
"          ELSE
"
"            var_ord_type := 'SI';
"
"          END IF;
"
"
"
"        ELSE
"
"          var_ord_type := 'OT';
"
"        END IF;
"
"
"
"        proc_get_emp_det(p_bu,
"
"                         p_user,
"
"                         var_emp_id,
"
"                         var_emp_desc,
"
"                         var_pos_id,
"
"                         var_pos_desc,
"
"                         var_dep_id,
"
"                         var_dep_desc,
"
"                         p_lang
"
"                        );
"
"
"
"        proc_find_addr(p_bu,
"
"                       cr1.isthd_ref_unit,
"
"                       CASE WHEN cr1.isthd_issueto_type IN ('I','S','R') THEN 'N'
"
"                            WHEN cr1.isthd_issueto_type IN ('V','X') THEN 'Y'
"
"                            WHEN cr1.isthd_issueto_type IN ('D') THEN 'D'
"
"                            WHEN cr1.isthd_issueto_type IN ('C') THEN 'C'
"
"                       END,
"
"                       cr1.isthd_issueto_id,
"
"                       var_addr1,
"
"                       var_addr2,
"
"                       var_addr3,
"
"                       var_city,
"
"                       var_state,
"
"                       var_cntry,
"
"                       var_po_box,
"
"                       var_zip,
"
"                        var_tele1,
"
"                       var_tele2,
"
"                       var_email1,
"
"                       var_fax1,
"
"                        var_website
"
"                       );
"
"
"
"        var_dc_no := func_find_pfx_nextno(p_bu,
"
"                                          TRUNC(cr1.isthd_trans_date),
"
"                                          func_find_dc_pfx(p_bu,TRUNC(cr1.isthd_trans_date),p_plnt,var_ord_type),
"
"                                          p_user);
"
"
"
"        SELECT NVL(MAX(TO_NUMBER(dchd_doc_no)),0) + 1
"
"          INTO var_dc_doc_no
"
"          FROM dc_hd
"
"         WHERE dchd_bu = p_bu
"
"           AND dchd_plnt = p_plnt;
"
"
"
"        INSERT INTO dc_hd(dchd_bu,
"
"                          dchd_plnt,
"
"                          dchd_doc_no,
"
"                          dchd_dc_no,
"
"                          dchd_date,
"
"                          dchd_suplr_id,
"
"                          dchd_type,
"
"                          dchd_other_type,
"
"                          dchd_source,
"
"                          dchd_return_flag,
"
"                          dchd_reference,
"
"                          dchd_cre_by,
"
"                          dchd_cre_date,
"
"                          dchd_status,
"
"                          dchd_ref_unit,
"
"                          dchd_approved_by,
"
"                          dchd_approved_pos,
"
"                          dchd_approved_dept,
"
"                          dchd_devly_on,
"
"                          dchd_dispatch_date,
"
"                          dchd_ack_rcvd_flag,
"
"                          dchd_ack_rcvd_on,
"
"                          dchd_shipto_addr1,
"
"                          dchd_shipto_addr2,
"
"                          dchd_shipto_addr3,
"
"                          dchd_shipto_addr4,
"
"                          dchd_shipto_addr5,
"
"                          dchd_shipto_po_box,
"
"                          dchd_shipto_city,
"
"                          dchd_shipto_state,
"
"                          dchd_shipto_country,
"
"                          dchd_shipto_zip,
"
"                          dchd_shipto_tele,
"
"                          dchd_shipto_fax,
"
"                          dchd_shipto_email,
"
"                          dchd_shipto_website,
"
"                          dchd_frm_city,
"
"                          dchd_to_city,
"
"                          dchd_source_frm
"
"                         )
"
"                   VALUES(p_bu,
"
"                          p_plnt,
"
"                          var_dc_doc_no,
"
"                          var_dc_no,
"
"                          TRUNC(cr1.isthd_trans_date),
"
"                          cr1.isthd_issueto_id,
"
"                          var_ord_type,
"
"                          CASE WHEN cr1.isthd_issueto_type = 'S' THEN 'W'
"
"                               WHEN cr1.isthd_issueto_type = 'I' THEN 'I'
"
"                               WHEN cr1.isthd_issueto_type = 'P' THEN 'P'
"
"                               WHEN cr1.isthd_issueto_type = 'C' THEN 'C'
"
"                               WHEN cr1.isthd_issueto_type IN ('R','D') THEN 'D'
"
"                               ELSE 'S'
"
"                          END,
"
"                          'S',
"
"                          CASE WHEN cr1.isthd_issueto_type IN ('S','I') THEN 'N'
"
"                               ELSE 'C'
"
"                          END,
"
"                          'DELIVERY CHALLAN FOR BRANCH TRANSFER FROM THE UNIT'|| ' ' || cr1.isthd_ref_unit,
"
"                          p_user,
"
"                          SYSDATE,
"
"                          'L',
"
"                          cr1.isthd_ref_unit,
"
"                          var_emp_id,
"
"                          var_pos_id,
"
"                          var_dep_id,
"
"                          SYSDATE,
"
"                          TRUNC(cr1.isthd_trans_date),
"
"                          'N',
"
"                          TRUNC(cr1.isthd_trans_date),
"
"                          var_addr1,
"
"                          var_addr2,
"
"                          var_addr3,
"
"                          var_addr4,
"
"                          var_addr5,
"
"                          var_po_box,
"
"                          var_city,
"
"                          var_state,
"
"                          var_cntry,
"
"                          var_zip,
"
"                          var_tele1,
"
"                          var_fax1,
"
"                          var_email1,
"
"                          var_website,
"
"                          (SELECT bup_city
"
"                             FROM bus_unit_plants
"
"                            WHERE bup_bu = p_bu
"
"                              AND bup_plant_id = p_plnt),
"
"                          (SELECT suplr_city
"
"                             FROM suppliers
"
"                            WHERE suplr_bu = p_bu
"
"                              AND suplr_suplr_id = cr1.isthd_issueto_id),
"
"                        cr1.isthd_issuefm_store_id
"
"                         );
"
"
"
"        FOR cr2 IN c2(cr1.isthd_issueto_type,cr1.isthd_issueto_id,cr1.istln_ord_type)
"
"        LOOP
"
"
"
"          SELECT NVL(MAX(dcln_seq_no),0) + 1
"
"            INTO var_seq_no
"
"            FROM dc_ln
"
"           WHERE dcln_bu = p_bu
"
"             AND dcln_plnt = p_plnt
"
"             AND dcln_doc_no = var_dc_doc_no;
"
"
"
"          IF cr1.isthd_issueto_type IN ('V') THEN
"
"
"
"            OPEN c4(cr1.isthd_issueto_id);
"
"            FETCH c4 INTO cr4;
"
"            CLOSE c4;
"
"
"
"          END IF;
"
"
"
"          INSERT INTO dc_ln(dcln_bu,
"
"                            dcln_plnt,
"
"                            dcln_doc_no,
"
"                            dcln_seq_no,
"
"                            dcln_prod_id,
"
"                            dcln_prod_rev,
"
"                            dcln_prod_desc1,
"
"                            dcln_uom,
"
"                            dcln_prod_ord_no,
"
"                            dcln_sf_code,
"
"                            dcln_qty,
"
"                            dcln_proc_qty,
"
"                            dcln_sc_unit_cost,
"
"                            dcln_reference,
"
"                            dcln_source_doc_pfx,
"
"                            dcln_source_doc_no,
"
"                            dcln_source_seq_no,
"
"                            dcln_source_sub_seq_no,
"
"                            dcln_mi_doc_no,
"
"                            dcln_mi_seq_no,
"
"                            dcln_pg_type,
"
"                            dcln_pg_id,
"
"                            dcln_rtn_flag,
"
"                            dcln_cre_by,
"
"                            dcln_cre_date,
"
"                            dcln_trnsfr_bu,
"
"                            dcln_trnsfr_plnt,
"
"                            dcln_store_id,
"
"                            dcln_hsn_code,
"
"                            dcln_imo_no,
"
"                            dcln_rtn_imo_no
"
"                           )
"
"                     VALUES(p_bu,
"
"                            p_plnt,
"
"                            var_dc_doc_no,
"
"                            var_seq_no,
"
"                            cr2.istln_prod_id,
"
"                            cr2.istln_prod_rev,
"
"                            func_find_prod_desc(p_bu,cr2.istln_prod_id,cr2.istln_prod_rev,p_lang),
"
"                            cr2.istln_prod_uom,
"
"                            cr2.istln_po_ord_no,
"
"                            cr2.istln_sf_code,
"
"                            cr2.istln_trans_qty/cr2.istln_conv_factor,
"
"                            cr2.istln_trans_qty/cr2.istln_conv_factor,
"
"                            cr2.istln_unit_cost,
"
"                            cr1.isthd_issueto_id||'/'||var_dc_no||'/MIV#('||'/'||p_doc_no||')'||'/Ord.No.#('||'/'||cr2.istln_ord_pfx||'-'||cr2.istln_ord_no||')',
"
"                            cr2.istln_ord_pfx,
"
"                            cr2.istln_ord_no,
"
"                            cr2.istln_ord_seq_no,
"
"                            cr2.istln_ord_sub_seq_no,
"
"                            cr2.istln_doc_no,
"
"                            cr2.istln_seq_no,
"
"                            'P',
"
"                            cr2.istln_process_id,
"
"                            CASE WHEN cr1.isthd_issueto_type IN ('S','I','V','C') THEN 'N'
"
"                            ELSE 'Y'
"
"                            END,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            cr4.suplr_transfer_bu,
"
"                            cr4.suplr_transfer_plnt,
"
"                            cr2.isthd_issuefm_store_id,
"
"                            cr2.istln_hsn_code,
"
"                            cr2.istln_imo_no,
"
"                            cr2.istln_rtn_imo_no
"
"                            );
"
"
"
"
"
"          FOR cr3 IN c3(cr2.istln_seq_no)
"
"          LOOP
"
"
"
"            SELECT NVL(MAX(dclsd_sub_seq_no),0) + 1
"
"              INTO var_sub_seq_no
"
"              FROM dc_lot_serial_dtls
"
"             WHERE dclsd_bu = p_bu
"
"               AND dclsd_plnt = p_plnt
"
"               AND dclsd_doc_no = var_dc_doc_no
"
"               AND dclsd_seq_no = var_seq_no;
"
"
"
"            INSERT INTO dc_lot_serial_dtls(dclsd_bu,
"
"                                           dclsd_plnt,
"
"                                           dclsd_doc_no,
"
"                                           dclsd_seq_no,
"
"                                           dclsd_sub_seq_no,
"
"                                           dclsd_sys_ls_no,
"
"                                           dclsd_lot_no,
"
"                                           dclsd_serial_no,
"
"                                           dclsd_source_id,
"
"                                           dclsd_source_type,
"
"                                           dclsd_expiry_date,
"
"                                           dclsd_qty,
"
"                                           dclsd_cre_by,
"
"                                           dclsd_cre_date
"
"                                           )
"
"                                    VALUES(p_bu,
"
"                                           p_plnt,
"
"                                           var_dc_doc_no,
"
"                                           var_seq_no,
"
"                                           var_sub_seq_no,
"
"                                           cr3.isbd_sys_ls_no,
"
"                                           cr3.isbd_lot_no,
"
"                                           cr3.isbd_serial_no,
"
"                                           cr3.isbd_source_id,
"
"                                           cr3.isbd_source_type,
"
"                                           cr3.isbd_expiry_date,
"
"                                           cr3.isbd_trans_qty/cr2.istln_conv_factor,
"
"                                           p_user,
"
"                                           SYSDATE
"
"                                           );
"
"
"
"          END LOOP c3;
"
"
"
"          UPDATE inv_stock_trans_ln
"
"             SET istln_dc_no = var_dc_no,
"
"                 istln_dc_doc_no = var_dc_doc_no,
"
"                 istln_dc_seq_no = var_seq_no
"
"           WHERE istln_bu = p_bu
"
"             AND istln_doc_no = cr2.istln_doc_no
"
"             AND istln_seq_no = cr2.istln_seq_no;
"
"
"
"          IF cr1.isthd_issueto_type = 'V' THEN
"
"
"
"            SELECT NVL(MAX(dcmln_trans_no),0)+1
"
"              INTO var_trans_no
"
"              FROM dc_match_ln
"
"             WHERE dcmln_bu = p_bu
"
"               AND dcmln_plnt = p_plnt;
"
"
"
"            INSERT INTO dc_match_ln(dcmln_bu,
"
"                                    dcmln_plnt,
"
"                                    dcmln_trans_no,
"
"                                    dcmln_suplr_id,
"
"                                    dcmln_ord_type,
"
"                                    dcmln_ord_pfx,
"
"                                    dcmln_ord_no,
"
"                                    dcmln_ord_seq_no,
"
"                                    dcmln_ord_sub_seq_no,
"
"                                    dcmln_prod_id,
"
"                                    dcmln_prod_rev,
"
"                                    dcmln_trans_qty,
"
"                                    dcmln_trans_date,
"
"                                    dcmln_source_doc,
"
"                                    dcmln_rcpt_pfx,
"
"                                    dcmln_rcpt_no,
"
"                                    dcmln_rcpt_seq_no,
"
"                                    dcmln_cre_by,
"
"                                    dcmln_cre_date,
"
"                                    dcmln_dc_doc_no,
"
"                                    dcmln_dc_no,
"
"                                    dcmln_dc_seq_no,
"
"                                    dcmln_prod_uom,
"
"                                    dcmln_prod_ord_no,
"
"                                    dcmln_sf_code,
"
"                                    dcmln_temp_qty,
"
"                                    dcmln_hsn_code
"
"                                   )
"
"                             VALUES(p_bu,
"
"                                    p_plnt,
"
"                                    var_trans_no,
"
"                                    cr2.isthd_issueto_id,
"
"                                    DECODE(cr2.istln_ord_type,'PU','SS',cr2.istln_ord_type),
"
"                                    cr2.istln_ord_pfx,
"
"                                    cr2.istln_ord_no,
"
"                                    cr2.istln_ord_seq_no,
"
"                                    cr2.istln_ord_sub_seq_no,
"
"                                    cr2.istln_prod_id,
"
"                                    cr2.istln_prod_rev,
"
"                                    cr2.istln_trans_qty/cr2.istln_conv_factor,
"
"                                    cr2.isthd_trans_date,
"
"                                    'MI',
"
"                                    NULL,
"
"                                    p_doc_no,
"
"                                    cr2.istln_seq_no,
"
"                                    p_user,
"
"                                    SYSDATE,
"
"                                    var_dc_doc_no,
"
"                                    var_dc_no,
"
"                                    var_seq_no,
"
"                                    cr2.istln_prod_uom,
"
"                                    cr2.istln_po_ord_no,
"
"                                    DECODE(cr2.istln_mat_type,'F',cr2.istln_sf_code,NULL),
"
"                                    0,
"
"                                    cr2.istln_hsn_code
"
"                                   );
"
"
"
"          END IF;
"
"
"
"        END LOOP;
"
"
"
"        SELECT NVL(SUM(dcln_qty * dcln_sc_unit_cost),0)
"
"          INTO var_tot_value
"
"          FROM dc_ln
"
"         WHERE dcln_bu = p_bu
"
"           AND dcln_plnt = p_plnt
"
"           AND dcln_doc_no = var_dc_doc_no;
"
"
"
"        UPDATE dc_hd
"
"           SET dchd_tot_value = var_tot_value
"
"         WHERE dchd_bu = p_bu
"
"           AND dchd_plnt = p_plnt
"
"           AND dchd_doc_no = var_dc_doc_no;
"
"
"
"        OPEN c4(cr1.isthd_issueto_id);
"
"        FETCH c4 INTO cr4;
"
"          IF c4%FOUND THEN
"
"            var_other_type := 'X';
"
"          ELSE
"
"            var_other_type := 'S';
"
"          END IF;
"
"        CLOSE c4;
"
"
"
"        OPEN c5;
"
"        FETCH c5 INTO cr5;
"
"          IF c5%FOUND THEN
"
"            IF var_ord_type = 'IM' AND (p_plnt <> cr1.isthd_ref_unit) AND var_other_type <> 'X' THEN
"
"              Raise_Application_Error (-20999,'HRM');
"
"            END IF;
"
"
"
"            IF cr5.gpc_single_dc_cre_flag = 'Y' THEN
"
"
"
"              FOR cr6 IN c6(cr1.isthd_issueto_type,cr1.isthd_issueto_id,cr1.istln_ord_type)
"
"              LOOP
"
"
"
"                SELECT NVL(MAX(dcln_seq_no),0) + 1
"
"                  INTO var_seq_no
"
"                  FROM dc_ln
"
"                 WHERE dcln_bu = p_bu
"
"                   AND dcln_plnt = p_plnt
"
"                   AND dcln_doc_no = var_dc_doc_no;
"
"
"
"
"
"                IF cr1.isthd_issueto_type = 'V' THEN
"
"
"
"                  OPEN c4(cr1.isthd_issueto_id);
"
"                  FETCH c4 INTO cr4;
"
"                  CLOSE c4;
"
"
"
"                END IF;
"
"
"
"                INSERT INTO dc_ln(dcln_bu,
"
"                                  dcln_plnt,
"
"                                  dcln_doc_no,
"
"                                  dcln_seq_no,
"
"                                  dcln_prod_id,
"
"                                  dcln_prod_rev,
"
"                                  dcln_prod_desc1,
"
"                                  dcln_uom,
"
"                                  dcln_qty,
"
"                                  dcln_proc_qty,
"
"                                  dcln_sc_unit_cost,
"
"                                  dcln_cre_by,
"
"                                  dcln_cre_date,
"
"                                  dcln_upd_by,
"
"                                  dcln_upd_date,
"
"                                  dcln_reference,
"
"                                  dcln_prod_ord_no,
"
"                                  dcln_sf_code,
"
"                                  dcln_source_doc_pfx,
"
"                                  dcln_source_doc_no,
"
"                                  dcln_source_seq_no,
"
"                                  dcln_source_sub_seq_no,
"
"                                  dcln_mi_doc_no,
"
"                                  dcln_rtn_flag,
"
"                                  dcln_res_id,
"
"                                  dcln_trnsfr_bu,
"
"                                  dcln_trnsfr_plnt,
"
"                                  dcln_hsn_code
"
"                                 )
"
"                           VALUES(p_bu,
"
"                                  p_plnt,
"
"                                  var_dc_doc_no,
"
"                                  var_seq_no,
"
"                                  cr6.istc_prod_id,
"
"                                  cr6.istc_prod_rev,
"
"                                  func_find_prod_desc(p_bu,cr6.istc_prod_id,cr6.istc_prod_rev,p_lang),
"
"                                  func_find_product_uom(p_bu,cr6.istc_prod_id,cr6.istc_prod_rev),
"
"                                  1,
"
"                                  1,
"
"                                  1,
"
"                                  p_user,
"
"                                  SYSDATE,
"
"                                  NULL,
"
"                                  NULL,
"
"                                  cr6.istln_reference,
"
"                                  NULL,         --cr3.istln_po_ord_no,
"
"                                  NULL,         --cr3.istln_sf_code,
"
"                                  cr6.istln_ord_pfx,  --cr3.istln_ord_pfx,
"
"                                  cr6.istln_ord_no,   --cr3.istln_ord_no,
"
"                                  cr6.istln_ord_seq_no,         --cr3.istln_ord_seq_no,
"
"                                  cr6.istln_ord_sub_seq_no,         --cr3.istln_ord_sub_seq_no,
"
"                                  p_doc_no,
"
"                                  'Y',
"
"                                  cr6.itri_res_id,
"
"                                  cr4.suplr_transfer_bu,
"
"                                  cr4.suplr_transfer_plnt,
"
"                                  cr6.istln_hsn_code
"
"                              );
"
"
"
"                UPDATE mfg_resources
"
"                   SET mfgr_contr_status = 'S'
"
"                 WHERE mfgr_bu = p_bu
"
"                   AND mfgr_plnt = p_plnt
"
"                   AND mfgr_res_id = cr6.itri_res_id
"
"                   AND mfgr_res_type = 'C'
"
"                   AND mfgr_contr_status = 'A';
"
"
"
"              END LOOP;
"
"
"
"        SELECT NVL(SUM(dcln_qty * dcln_sc_unit_cost),0)
"
"          INTO var_tot_value
"
"          FROM dc_ln
"
"         WHERE dcln_bu = p_bu
"
"           AND dcln_plnt = p_plnt
"
"           AND dcln_doc_no = var_dc_doc_no;
"
"
"
"        UPDATE dc_hd
"
"           SET dchd_tot_value = var_tot_value
"
"         WHERE dchd_bu = p_bu
"
"           AND dchd_plnt = p_plnt
"
"           AND dchd_doc_no = var_dc_doc_no;
"
"
"
"            END IF;
"
"
"
"            IF var_other_type = 'X' AND cr5.gpc_auto_cmr_flag = 'Y' THEN
"
"
"
"              BEGIN
"
"
"
"                SELECT pomctrl_entity_user
"
"                  INTO var_ent_user
"
"                  FROM pom_control
"
"                 WHERE pomctrl_bu = cr4.suplr_transfer_bu
"
"                   AND pomctrl_plnt = cr4.suplr_transfer_plnt;
"
"
"
"              EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                Raise_Application_Error(-20963,'POM'||'-'||cr4.suplr_transfer_bu||'-'||cr4.suplr_transfer_plnt);
"
"              END;
"
"
"
"              UPDATE dc_ln
"
"                 SET dcln_cmr_int_user = var_ent_user,
"
"                     dcln_cmr_int_flag = 'Y'
"
"               WHERE dcln_bu = p_bu
"
"                 AND dcln_plnt = p_plnt
"
"                 AND dcln_doc_no = var_dc_doc_no;
"
"
"
"                  proc_create_cmr_doc(cr4.suplr_transfer_bu,
"
"                                      var_dc_doc_no,
"
"                                      var_ent_user,
"
"                                      TRUNC(cr1.isthd_trans_date),
"
"                                      var_cmr_res
"
"                                     );
"
"
"
"            END IF;
"
"
"
"          ELSE
"
"            Raise_Application_Error (-20010,'ICM');
"
"          END IF;
"
"        CLOSE c5;
"
"
"
"      END LOOP;
"
"
"
"      IF p_res IS NOT NULL THEN
"
"        p_res := TRIM(func_find_order_no_substr(p_res));
"
"      END IF;
"
"
"
"    END proc_ins_dc_doc_frm_cmt;
"
"
"
"END pkg_field_visit_rpt;"
/
