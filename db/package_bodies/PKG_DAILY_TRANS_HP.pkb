CREATE OR REPLACE
"PACKAGE BODY pkg_daily_trans_hp
"
"AS
"
"
"
"  PROCEDURE proc_ins_daily_trans_log(p_bu    VARCHAR2,
"
"                                     p_fr_date    DATE,
"
"                     p_to_date    DATE,
"
"                     p_user    VARCHAR2
"
"                    )
"
"  AS
"
"  BEGIN
"
"
"
"    DELETE FROM dly_mod_trans_ln
"
"     WHERE dmtl_bu = p_bu
"
"       AND dmtl_user = p_user;
"
"
"
"    DELETE FROM dly_user_mod_trans
"
"     WHERE dumt_bu = p_bu
"
"       AND dumt_user = p_user;
"
"
"
"    DELETE FROM dly_user_mod_vou_dtls
"
"     WHERE dumvd_bu = p_bu
"
"       AND dumvd_user = p_user;
"
"
"
"    SELECT p_bu,p_user,ROW_NUMBER() OVER (ORDER BY vou_type,sub_vou_type,doc_cre_date) AS rn,
"
"           vou_type,sub_vou_type,doc_plnt,doc_plnt_loc_id,doc_date,doc_pfx,doc_no,doc_status,doc_cre_by,doc_cre_date,
"
"           p_user,NULL,NULL,NULL,SYSDATE,NULL,NULL,NULL,NULL,NULL
"
"      BULK COLLECT INTO r_dt_vou
"
"      FROM (SELECT poh.poh_bu AS doc_bu,'PO' AS vou_type,poh.poh_type AS sub_vou_type,poh.poh_plant AS doc_plnt,
"
"                   poh.poh_plnt_loc_id AS doc_plnt_loc_id,
"
"                   poh.poh_cre_by AS doc_cre_by,poh_cre_date doc_cre_date,
"
"           poh_order_date doc_date,
"
"           poh_order_pfx doc_pfx,
"
"           poh_order_no doc_no,
"
"           DECODE(poh_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled',poh_status) doc_status
"
"              FROM pur_order_hd poh
"
"         WHERE poh_bu = p_bu
"
"           AND poh.poh_mode = 'PO'
"
"           AND TRUNC(poh.poh_cre_date) >= p_fr_date
"
"           AND TRUNC(poh.poh_cre_date) <= p_to_date
"
"        UNION ALL
"
"        SELECT prchd_bu,'OOP','OOP',prchd_plnt,prchd_plnt_loc_id,prchd_cre_by,prchd_cre_date,
"
"               prchd_po_date,prchd_po_pfx,prchd_po_no,
"
"           DECODE(prchd_status,'N','Draft','E','Entry Completed','A','Approved','C','Cancelled',prchd_status) doc_status
"
"          FROM pur_rate_contr_hd
"
"         WHERE prchd_bu = p_bu
"
"           AND TRUNC(prchd_cre_date) >= p_fr_date
"
"           AND TRUNC(prchd_cre_date) <= p_to_date
"
"           AND prchd_prod_type = 'PR'
"
"        UNION ALL
"
"        SELECT prchd_bu,'OOS','OOS',prchd_plnt,prchd_plnt_loc_id,prchd_cre_by,prchd_cre_date,
"
"               prchd_po_date,prchd_po_pfx,prchd_po_no,
"
"           DECODE(prchd_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled',prchd_status) doc_status
"
"          FROM pur_rate_contr_hd
"
"         WHERE prchd_bu = p_bu
"
"           AND TRUNC(prchd_cre_date) >= p_fr_date
"
"           AND TRUNC(prchd_cre_date) <= p_to_date
"
"           AND prchd_prod_type = 'SC'
"
"        UNION ALL
"
"        SELECT ssrh_bu,'SSPR','SSPR',ssrh_plnt,ssrh_plnt_loc_id,ssrh_cre_by,ssrh_cre_date,
"
"               ssrh_rqst_date,ssrh_rqst_pfx,ssrh_rqst_no,
"
"           DECODE(ssrh_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled',ssrh_status) doc_status
"
"          FROM suplr_sch_rqst_hd
"
"         WHERE ssrh_bu = p_bu
"
"           AND TRUNC(ssrh_cre_date) >= p_fr_date
"
"           AND TRUNC(ssrh_cre_date) <= p_to_date
"
"           AND ssrh_mode = 'PR'
"
"        UNION ALL
"
"        SELECT sshd_bu,'SSPO','SSPO',sshd_plnt,sshd_plnt_loc_id,sshd_cre_by,sshd_cre_date,
"
"               sshd_doc_date,sshd_doc_pfx,sshd_doc_no,
"
"           DECODE(sshd_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled',sshd_status) doc_status
"
"          FROM suplr_schld_hd
"
"         WHERE sshd_bu = p_bu
"
"           AND TRUNC(sshd_cre_date) >= p_fr_date
"
"           AND TRUNC(sshd_cre_date) <= p_to_date
"
"           AND sshd_ps_type = 'PR'
"
"        UNION ALL
"
"        SELECT prh_bu,'PR',prh_rec_source,prh_plant,prh_plnt_loc_id,prh_cre_by,prh_cre_date,
"
"               prh_rqst_date,prh_rqst_pfx,prh_rqst_no,
"
"           DECODE(prh_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled',prh_status) doc_status
"
"          FROM pur_req_hd
"
"         WHERE prh_bu = p_bu
"
"           AND TRUNC(prh_cre_date) >= p_fr_date
"
"           AND TRUNC(prh_cre_date) <= p_to_date
"
"           AND prh_mode = 'PO'
"
"        UNION ALL
"
"        SELECT poh_bu,'PO',poh_type,poh_plant,poh_plnt_loc_id,poh_cre_by,poh_cre_date,
"
"               poh_order_date,poh_order_pfx,poh_order_no,
"
"           DECODE(poh_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled',poh_status) doc_status
"
"          FROM pur_order_hd
"
"         WHERE poh_bu = p_bu
"
"           AND TRUNC(poh_cre_date) >= p_fr_date
"
"           AND TRUNC(poh_cre_date) <= p_to_date
"
"           AND poh_mode = 'PO'
"
"        UNION ALL
"
"        SELECT poh_bu,'SCO',poh_type,poh_plant,poh_plnt_loc_id,poh_cre_by,poh_cre_date,
"
"               poh_order_date,poh_order_pfx,poh_order_no,
"
"           DECODE(poh_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled',poh_status) doc_status
"
"          FROM pur_order_hd
"
"         WHERE poh_bu = p_bu
"
"           AND TRUNC(poh_cre_date) >= p_fr_date
"
"           AND TRUNC(poh_cre_date) <= p_to_date
"
"           AND poh_mode = 'SC'
"
"        UNION ALL
"
"        SELECT porh_bu,'GRNP',porh_type,porh_plnt,porh_plnt_loc_id,porh_cre_by,porh_cre_date,
"
"               porh_receipt_date,porh_receipt_pfx,porh_receipt_no,
"
"           DECODE(porh_wf_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled',porh_wf_status) doc_status
"
"          FROM pur_ord_receipt_hd_view
"
"         WHERE porh_bu = p_bu
"
"           AND TRUNC(porh_cre_date) >= p_fr_date
"
"           AND TRUNC(porh_cre_date) <= p_to_date
"
"           AND porh_mode = 'PO'
"
"        UNION ALL
"
"        SELECT porh_bu,'GRNS',porh_type,porh_plnt,porh_plnt_loc_id,porh_cre_by,porh_cre_date,
"
"               porh_receipt_date,porh_receipt_pfx,porh_receipt_no,
"
"           DECODE(porh_wf_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled',porh_wf_status) doc_status
"
"          FROM pur_ord_receipt_hd_view
"
"         WHERE porh_bu = p_bu
"
"           AND TRUNC(porh_cre_date) >= p_fr_date
"
"           AND TRUNC(porh_cre_date) <= p_to_date
"
"           AND porh_mode = 'SC'
"
"        UNION ALL
"
"        SELECT pdshd_bu,'SOB','SOB',pdshd_plnt,pdshd_plnt_loc_id,pdshd_cre_by,pdshd_cre_date,
"
"               pdshd_cre_date,pdshd_doc_pfx,pdshd_doc_no,
"
"           DECODE(pdshd_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled',pdshd_status) doc_status
"
"          FROM prod_deflt_suplr_hd
"
"         WHERE pdshd_bu = p_bu
"
"           AND TRUNC(pdshd_cre_date) >= p_fr_date
"
"           AND TRUNC(pdshd_cre_date) <= p_to_date
"
"       );
"
"
"
"    FORALL indx IN 1..r_dt_vou.COUNT
"
"      INSERT INTO dly_user_mod_vou_dtls VALUES r_dt_vou(indx);
"
"
"
"    INSERT INTO dly_user_mod_trans(dumt_bu,
"
"                                   dumt_user,
"
"                   dumt_seq_no,
"
"                   dumt_sub_vou_type,
"
"                   dumt_vou_type,
"
"                   dumt_plnt,
"
"                   dumt_vou_cre_user,
"
"                   dumt_tot_cnt,
"
"                   dumt_cre_by,
"
"                   dumt_cre_date
"
"                  )
"
"    SELECT p_bu,p_user,ROW_NUMBER() OVER (ORDER BY avt.apt_seq,avst.apst_print_seq_no,dmtv.dumvd_vou_plnt,dmtv.dumvd_vou_cre_by) AS rn,
"
"           dmtv.dumvd_sub_vou_type,dmtv.dumvd_vou_type,dmtv.dumvd_vou_plnt,dmtv.dumvd_vou_cre_by,COUNT(*),p_user,SYSDATE
"
"      FROM dly_user_mod_vou_dtls dmtv,appl_vou_sub_types avst,appl_pfx_types avt
"
"     WHERE dmtv.dumvd_bu = avst.apst_bu(+)
"
"       AND dmtv.dumvd_sub_vou_type = avst.apst_sub_type(+)
"
"       AND avst.apst_bu = avt.apt_bu(+)
"
"       AND avst.apst_vou_type = avt.apt_pfx_type(+)
"
"       AND dmtv.dumvd_bu = p_bu
"
"       AND dmtv.dumvd_user = p_user
"
"     GROUP BY dmtv.dumvd_bu,dmtv.dumvd_sub_vou_type,dmtv.dumvd_vou_type,dmtv.dumvd_vou_plnt,dmtv.dumvd_vou_cre_by,avt.apt_seq,avst.apst_print_seq_no;
"
"
"
"    INSERT INTO dly_mod_trans_ln(dmtl_bu,
"
"                                 dmtl_user,
"
"                 dmtl_seq_no,
"
"                 dmtl_sub_vou_type,
"
"                 dmtl_vou_type,
"
"                 dmtl_plnt,
"
"                 dmtl_tot_cnt,
"
"                 dmtl_cre_by,
"
"                 dmtl_cre_date
"
"                )
"
"    SELECT p_bu,p_user,ROW_NUMBER() OVER (ORDER BY avt.apt_seq,avst.apst_print_seq_no,dmtv.dumvd_vou_plnt) AS rn,
"
"           dmtv.dumvd_sub_vou_type,dmtv.dumvd_vou_type,dmtv.dumvd_vou_plnt,COUNT(*),p_user,SYSDATE
"
"      FROM dly_user_mod_vou_dtls dmtv,appl_vou_sub_types avst,appl_pfx_types avt
"
"     WHERE dmtv.dumvd_bu = avst.apst_bu(+)
"
"       AND dmtv.dumvd_sub_vou_type = avst.apst_sub_type(+)
"
"       AND avst.apst_bu = avt.apt_bu(+)
"
"       AND avst.apst_vou_type = avt.apt_pfx_type(+)
"
"       AND dmtv.dumvd_bu = p_bu
"
"       AND dmtv.dumvd_user = p_user
"
"     GROUP BY dmtv.dumvd_bu,dmtv.dumvd_sub_vou_type,dmtv.dumvd_vou_type,dmtv.dumvd_vou_plnt,avt.apt_seq,avst.apst_print_seq_no;
"
"
"
"  END proc_ins_daily_trans_log;
"
"
"
"END pkg_daily_trans_hp;"
/
