CREATE OR REPLACE
"PACKAGE BODY pkg_daily_trans
"
"AS
"
"
"
"  PROCEDURE proc_ins_daily_trans_log(p_bu	VARCHAR2,
"
"                                     p_fr_date	DATE,
"
"				     p_to_date	DATE,
"
"				     p_user	VARCHAR2
"
"				    )
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
"      FROM (
"
"--SCM
"
"	--Purchase Order
"
"	    SELECT poh.poh_bu AS doc_bu,'PO' AS vou_type,poh.poh_type AS sub_vou_type,poh.poh_plant AS doc_plnt,
"
"                   poh.poh_plnt_loc_id AS doc_plnt_loc_id,
"
"                   poh.poh_cre_by AS doc_cre_by,poh_cre_date doc_cre_date,
"
"		   poh_order_date doc_date,
"
"		   poh_order_pfx doc_pfx,
"
"		   poh_order_no doc_no,
"
"		   DECODE(poh_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled',poh_status) doc_status
"
"              FROM pur_order_hd poh
"
"	     WHERE poh_bu = p_bu
"
"	       AND poh.poh_mode = 'PO'
"
"	       AND TRUNC(poh.poh_cre_date) >= p_fr_date
"
"	       AND TRUNC(poh.poh_cre_date) <= p_to_date
"
"	---Approved Supplier (Purchase)
"
"	    UNION ALL
"
"            SELECT suprprod_bu,'ASPR','ASPR',suprprod_plnt,NULL,suprprod_cre_by,suprprod_cre_date,
"
"		   suprprod_cre_date,suprprod_doc_pfx,suprprod_doc_no,
"
"		   DECODE(suprprod_status,'N','Draft','E','Entry Completed','A','Approved','C','Cancelled') doc_status
"
"	      FROM suplr_products_vw
"
"	     WHERE suprprod_bu = p_bu
"
"		AND TRUNC(suprprod_cre_date) >= p_fr_date
"
"		AND TRUNC(suprprod_cre_date) <= p_to_date
"
"		AND suprprod_type ='PR'
"
"	---Approved Supplier (SCO)
"
"	    UNION ALL
"
"            SELECT suprprod_bu,'ASSC','ASSC',suprprod_plnt,NULL,suprprod_cre_by,suprprod_cre_date,
"
"		   suprprod_cre_date,suprprod_doc_pfx,suprprod_doc_no,
"
"		   DECODE(suprprod_status,'N','Draft','E','Entry Completed','A','Approved','C','Cancelled') doc_status
"
"	      FROM suplr_products_vw
"
"	     WHERE suprprod_bu = p_bu
"
"		AND TRUNC(suprprod_cre_date) >= p_fr_date
"
"		AND TRUNC(suprprod_cre_date) <= p_to_date
"
"		AND suprprod_type ='SC'
"
"	---Supplier Performance PO
"
"	    UNION ALL
"
"            SELECT spfhd_bu,'SPPO','SPPO',spfhd_plnt,spfhd_loc_id,spfhd_cre_by,spfhd_cre_date,
"
"		   spfhd_doc_date,spfhd_doc_pfx,spfhd_doc_no,
"
"		   DECODE(spfhd_status,'N','Draft','U','Update','Cancelled') doc_status
"
"	      FROM suplr_performance_hd
"
"	     WHERE spfhd_bu = p_bu
"
"		AND TRUNC(spfhd_cre_date) >= p_fr_date
"
"		AND TRUNC(spfhd_cre_date) <= p_to_date
"
"		AND spfhd_mode ='PO'/*
"
"	--Rate Contract (PR)
"
"	    UNION ALL
"
"	    SELECT prchd_bu,'OOP','OOP',prchd_plnt,prchd_plnt_loc_id,prchd_cre_by,prchd_cre_date,
"
"	           prchd_po_date,prchd_po_pfx,prchd_po_no,
"
"		   DECODE(prchd_status,'N','Draft','E','Entry Completed','A','Approved','C','Cancelled',prchd_status) doc_status
"
"	      FROM pur_rate_contr_hd
"
"	     WHERE prchd_bu = p_bu
"
"	       AND TRUNC(prchd_cre_date) >= p_fr_date
"
"	       AND TRUNC(prchd_cre_date) <= p_to_date
"
"	       AND prchd_prod_type = 'PR'
"
"	--Rate Contract (SC)
"
"	*/
"
"	    UNION ALL
"
"	    SELECT prchd_bu,'OOS','OOS',prchd_plnt,prchd_plnt_loc_id,prchd_cre_by,prchd_cre_date,
"
"	           prchd_po_date,prchd_po_pfx,prchd_po_no,
"
"		   DECODE(prchd_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled',prchd_status) doc_status
"
"	      FROM pur_rate_contr_hd
"
"	     WHERE prchd_bu = p_bu
"
"	       AND TRUNC(prchd_cre_date) >= p_fr_date
"
"	       AND TRUNC(prchd_cre_date) <= p_to_date
"
"	       AND prchd_prod_type = 'SC'
"
"	--OPen SCO Price
"
"	    UNION ALL
"
"            SELECT sprchd_bu,'OOS','OOS',sprchd_plnt,sprchd_plnt_loc_id,sprchd_cre_by,sprchd_cre_date,
"
"                   sprchd_po_date,sprchd_po_pfx,sprchd_po_no,
"
"		   DECODE(sprchd_status,'N','Draft','R','Revised','E','Entry Completed','A','Approved','C','Cancelled',sprchd_status) doc_status
"
"	       FROM subctr_proc_rate_contr_hd
"
"              WHERE sprchd_bu = p_bu
"
"		AND TRUNC(sprchd_cre_date) >= p_fr_date
"
"		AND TRUNC(sprchd_cre_date) <= p_to_date
"
"	--Supplier Schedule Request
"
"	    UNION ALL
"
"	    SELECT ssrh_bu,'SSPR','SSPR',ssrh_plnt,ssrh_plnt_loc_id,ssrh_cre_by,ssrh_cre_date,
"
"	           ssrh_rqst_date,ssrh_rqst_pfx,ssrh_rqst_no,
"
"		   DECODE(ssrh_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled',ssrh_status) doc_status
"
"	      FROM suplr_sch_rqst_hd
"
"	     WHERE ssrh_bu = p_bu
"
"	       AND TRUNC(ssrh_cre_date) >= p_fr_date
"
"	       AND TRUNC(ssrh_cre_date) <= p_to_date
"
"	       AND ssrh_mode = 'PR'
"
"	--Supplier Schedule Order
"
"	    UNION ALL
"
"	    SELECT sshd_bu,'SSPO','SSPO',sshd_plnt,sshd_plnt_loc_id,sshd_cre_by,sshd_cre_date,
"
"	           sshd_doc_date,sshd_doc_pfx,sshd_doc_no,
"
"		   DECODE(sshd_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled',sshd_status) doc_status
"
"	      FROM suplr_schld_hd
"
"	     WHERE sshd_bu = p_bu
"
"	       AND TRUNC(sshd_cre_date) >= p_fr_date
"
"	       AND TRUNC(sshd_cre_date) <= p_to_date
"
"	       AND sshd_ps_type = 'PR'
"
"	---Supplier Schedule Request Cls. (SSR Cls.)
"
"	    UNION ALL
"
"            SELECT schd_bu,'SSRC','SSRC',schd_plnt,schd_plnt_loc_id,schd_cre_by,schd_cre_date,
"
"		   schd_doc_date,schd_doc_pfx,schd_doc_no,
"
"		    DECODE(schd_status,'N','Draft','A','Approved','C','Cancelled','E','Entry Completed') doc_status
"
"	      FROM ssr_cls_hd
"
"	     WHERE schd_bu = p_bu
"
"		AND TRUNC(schd_cre_date) >= p_fr_date
"
"		AND TRUNC(schd_cre_date) <= p_to_date/*
"
"	---Supplier Schedule Order Cls. (SSO Cls.)
"
"	    UNION ALL
"
"            SELECT schd_bu,'SSOC','SSOC',schd_plnt,schd_plnt_loc_id,schd_cre_by,schd_cre_date,
"
"		   schd_doc_date,schd_doc_pfx,schd_doc_no,
"
"		   DECODE(schd_status,'N','Draft','E','Entry completed','A','Approved','C','Cancelled') doc_status
"
"	      FROM sso_cls_hd
"
"	     WHERE schd_bu = p_bu
"
"		AND TRUNC(schd_cre_date) >= p_fr_date
"
"		AND TRUNC(schd_cre_date) <= p_to_date*/
"
"	---Supplier Schedule Order Cls. (SSO Cls.)
"
"	    UNION ALL
"
"            SELECT ssah_bu,'SSOC','SSOC',ssah_plnt,ssah_plnt_loc_id,ssah_cre_by,ssah_cre_date,
"
"		   ssah_doc_date,ssah_doc_pfx,ssah_doc_no,
"
"		   DECODE(ssah_status,'N','Draft','E','Entry completed','A','Approved','C','Cancelled','P','Approved') doc_status
"
"	      FROM suplr_schld_amd_hd
"
"	     WHERE ssah_bu = p_bu
"
"		AND TRUNC(ssah_cre_date) >= p_fr_date
"
"		AND TRUNC(ssah_cre_date) <= p_to_date
"
"	 --Purchase Order Amendment
"
"	    UNION ALL
"
"	    SELECT pah_bu,'POA','POA',pah_plnt,pah_plnt_loc_id,pah_cre_by,pah_cre_date,pah_doc_date,'PO',pah_doc_no,
"
"	decode(pah_status,'N','Draft','E','Entry Completed','A','Approved','C','Cancelled')doc_status
"
"          FROM po_amend_hd
"
"         WHERE PAH_BU = p_bu
"
"           AND TRUNC(pah_cre_date) >= p_fr_date
"
"           AND TRUNC(pah_cre_date) <= p_to_date
"
"	   AND pah_mode = 'PR'
"
"	---Lot Serial Expiry Updation
"
"            UNION ALL
"
"            SELECT lsueh_bu,'LSE','LSE',lsueh_plnt,lsueh_plnt_loc_id,lsueh_cre_by,lsueh_cre_date,
"
"		   lsueh_doc_date,lsueh_doc_pfx,lsueh_doc_no,
"
"		   DECODE(lsueh_status,'N','Draft','E','Entry Completed','P','Posted','C','Cancelled','A','Approved') doc_status
"
"	      FROM lot_ser_upd_exp_hd
"
"             WHERE lsueh_bu = p_bu
"
"		AND TRUNC(lsueh_cre_date) >= p_fr_date
"
"		AND TRUNC(lsueh_cre_date) <= p_to_date
"
"	 --Subcontract Order Amendment
"
"	    UNION ALL
"
"	    SELECT pah_bu,'SCOA','SCOA',pah_plnt,pah_plnt_loc_id,pah_cre_by,pah_cre_date,pah_doc_date,'SCO',pah_doc_no,
"
"	decode(pah_status,'N','Draft','E','Entry Completed','A','Approved','C','Cancelled')doc_status
"
"          FROM po_amend_hd
"
"         WHERE PAH_BU = p_bu
"
"           AND TRUNC(pah_cre_date) >= p_fr_date
"
"           AND TRUNC(pah_cre_date) <= p_to_date
"
"	   AND pah_mode = 'SC'
"
"	--Purchase Request
"
"	    UNION ALL
"
"	    SELECT prh_bu,'PR',prh_rec_source,prh_plant,prh_plnt_loc_id,prh_cre_by,prh_cre_date,
"
"	           prh_rqst_date,prh_rqst_pfx,prh_rqst_no,
"
"		   DECODE(prh_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled',prh_status) doc_status
"
"	      FROM pur_req_hd
"
"	     WHERE prh_bu = p_bu
"
"	       AND TRUNC(prh_cre_date) >= p_fr_date
"
"	       AND TRUNC(prh_cre_date) <= p_to_date
"
"	       AND prh_mode = 'PO'
"
"	    /*UNION ALL
"
"	    SELECT poh_bu,'PO',poh_type,poh_plant,poh_plnt_loc_id,poh_cre_by,poh_cre_date,
"
"	           poh_order_date,poh_order_pfx,poh_order_no,
"
"		   DECODE(poh_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled',poh_status) doc_status
"
"	      FROM pur_order_hd
"
"	     WHERE poh_bu = p_bu
"
"	       AND TRUNC(poh_cre_date) >= p_fr_date
"
"	       AND TRUNC(poh_cre_date) <= p_to_date
"
"	       AND poh_mode = 'PO'*/
"
"	--Inspectio Request
"
"	   UNION ALL
"
"	   SELECT tqphd_bu,'IR',tqphd_sub_vou,tqphd_plnt,tqphd_plnt_loc_id,tqphd_cre_by,tqphd_cre_date,
"
"	           tqphd_pln_date,tqphd_pln_pfx,tqphd_pln_no,
"
"		   DECODE(tqphd_status,'N','Draft','C','Completed','P','Partial','L','Cancelled',tqphd_status) doc_status
"
"	      FROM tqm_qc_plan_hd
"
"	     WHERE tqphd_bu = p_bu
"
"	       AND TRUNC(tqphd_cre_date) >= p_fr_date
"
"	       AND TRUNC(tqphd_cre_date) <= p_to_date
"
"	       AND tqphd_sub_vou IS NOT NULL
"
"        --Inspection Document
"
"	    UNION ALL
"
"	    SELECT tqhd_bu,'ID',CASE WHEN tqhd_insp_mode = 'PR' THEN 'IDPO'
"
"                                     WHEN tqhd_insp_mode = 'SC' THEN 'IDSCO'
"
"                                     WHEN tqhd_insp_mode = 'CS' THEN 'IDCMR'
"
"                                     WHEN tqhd_insp_mode = 'ST' THEN 'IDSQC'
"
"                                     WHEN tqhd_insp_mode = 'SF' THEN 'IDSFC'
"
"                                     WHEN tqhd_insp_mode = 'ME' THEN 'IDMR'
"
"                                     WHEN tqhd_insp_mode = 'SR' THEN 'IDSR'
"
"                                     WHEN tqhd_insp_mode = 'FI' THEN 'IDFPI'
"
"                                     WHEN tqhd_insp_mode IN('PD','PI') THEN 'IDPDI'
"
"                                     WHEN tqhd_insp_mode = 'RW' THEN 'IDRWO'
"
"                                 END,tqhd_plnt,tqhd_plnt_loc_id,tqhd_cre_by,tqhd_cre_date,
"
"	           tqhd_date,tqhd_qc_pfx,tqhd_qc_no,
"
"		   DECODE(tqhd_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled',tqhd_status) doc_status
"
"	      FROM tqm_qc_hd
"
"	     WHERE tqhd_bu = p_bu
"
"	       AND TRUNC(tqhd_cre_date) >= p_fr_date
"
"	       AND TRUNC(tqhd_cre_date) <= p_to_date
"
"	--Subcontract Order
"
"	    UNION ALL
"
"	    SELECT poh_bu,'SCO',poh_type,poh_plant,poh_plnt_loc_id,poh_cre_by,poh_cre_date,
"
"	           poh_order_date,poh_order_pfx,poh_order_no,
"
"		   DECODE(poh_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled',poh_status) doc_status
"
"	      FROM pur_order_hd
"
"	     WHERE poh_bu = p_bu
"
"	       AND TRUNC(poh_cre_date) >= p_fr_date
"
"	       AND TRUNC(poh_cre_date) <= p_to_date
"
"	       AND poh_mode = 'SC'
"
"	--GRN(PR)
"
"	    UNION ALL
"
"	    SELECT porh_bu,'GRNP',porh_type,porh_plnt,porh_plnt_loc_id,porh_cre_by,porh_cre_date,
"
"	           porh_receipt_date,porh_receipt_pfx,porh_receipt_no,
"
"		   decode(porh_status,'N','Draft','Q','QC Completed','P','Partial','C','Cancel','R','Received',porh_status)   doc_status
"
"	      FROM pur_ord_receipt_hd_view
"
"	     WHERE porh_bu = p_bu
"
"	       AND TRUNC(porh_cre_date) >= p_fr_date
"
"	       AND TRUNC(porh_cre_date) <= p_to_date
"
"	       AND porh_mode = 'PR'
"
"	--Supplier Performance (Score Grade)
"
"	    UNION ALL
"
"	    SELECT sghd_bu,'SPSG','SPSG',sghd_plnt,NULL,sghd_cre_by,sghd_cre_date,
"
"	           sghd_cre_date,sghd_doc_pfx,sghd_doc_no,
"
"		   DECODE(sghd_status,'N','Draft','A','Active','R','Copied','C','Cancelled') doc_status
"
"	      FROM suplr_grade_hd
"
"	     WHERE sghd_bu = p_bu
"
"	       AND TRUNC(sghd_cre_date) >= p_fr_date
"
"	       AND TRUNC(sghd_cre_date) <= p_to_date
"
"	--RFQ(PR)
"
"	    UNION ALL
"
"	    SELECT rfqhd_bu,'RFQ','RFQ' rfqhd_type,rfqhd_plnt,rfqhd_plnt_loc_id,rfqhd_cre_by,rfqhd_cre_date,
"
"	           rfqhd_rfq_date,rfqhd_rfq_pfx,rfqhd_rfq_no,
"
"		   Decode(RFQHD_STATUS,'N','Draft','Q','Quotation','R','Rate Finalized','I','Entry Completed','A','Approved','C','Cancelled','O','Ordered')  doc_status
"
"	      FROM rfq_hd
"
"	     WHERE rfqhd_bu = p_bu
"
"	       AND TRUNC(rfqhd_cre_date) >= p_fr_date
"
"	       AND TRUNC(rfqhd_cre_date) <= p_to_date
"
"       --GRN(SCO)
"
"	    UNION ALL
"
"	    SELECT porh_bu,'GRNS',porh_type,porh_plnt,porh_plnt_loc_id,porh_cre_by,porh_cre_date,
"
"	           porh_receipt_date,porh_receipt_pfx,porh_receipt_no,
"
"		   DECODE(PORH_STATUS,'N','Draft','Q','QC Completed','P','Partial','C','Cancelled','R','Received')doc_status
"
"	      FROM pur_ord_receipt_hd_view
"
"	     WHERE porh_bu = p_bu
"
"	       AND TRUNC(porh_cre_date) >= p_fr_date
"
"	       AND TRUNC(porh_cre_date) <= p_to_date
"
"	       AND porh_mode = 'SC'
"
"       --SCO Opening Balance
"
"	    UNION ALL
"
"	    SELECT usoh_bu,'SCOB','SCOB',usoh_plnt,usoh_plnt_loc_id,usoh_cre_by,usoh_cre_date,
"
"	           usoh_doc_date,usoh_doc_pfx porh_receipt_pfx,usoh_doc_no,
"
"		   DECODE (USOH_STATUS,  'N', 'Draft',  'P', 'Posted',  'C', 'Cancelled')doc_status
"
"	      FROM upd_stk_opbal_hd
"
"	     WHERE usoh_bu = p_bu
"
"	       AND TRUNC(usoh_cre_date) >= p_fr_date
"
"	       AND TRUNC(usoh_cre_date) <= p_to_date
"
"	--Share Of Business
"
"	    UNION ALL
"
"	    SELECT pdshd_bu,'SOB','SOB',pdshd_plnt,pdshd_plnt_loc_id,pdshd_cre_by,pdshd_cre_date,
"
"	           pdshd_cre_date,pdshd_doc_pfx,pdshd_doc_no,
"
"		   DECODE(pdshd_status,'N','Draft','E','Entry Completed','C','Cancelled','A','Approved') doc_status
"
"	      FROM prod_deflt_suplr_hd
"
"	     WHERE pdshd_bu = p_bu
"
"	       AND TRUNC(pdshd_cre_date) >= p_fr_date
"
"	       AND TRUNC(pdshd_cre_date) <= p_to_date
"
"	--Purchase Price List
"
"	    UNION ALL
"
"	    SELECT pspl_bu,'PLP','PLP',pspl_plnt,pspl_plnt_loc_id,pspl_cre_by,pspl_cre_date,
"
"	           pspl_doc_date,pspl_doc_pfx pdshd_doc_pfx,pspl_doc_no,
"
"		   DECODE(pspl_status,'N','Draft','E','Entry Completed','A','Approved','M','Amended','C','Cancelled') doc_status
"
"	      FROM pur_sc_price_list_hist_vw
"
"	     WHERE pspl_bu = p_bu
"
"		AND pspl_type ='PR'
"
"		AND TRUNC(pspl_cre_date) >= p_fr_date
"
"		AND TRUNC(pspl_cre_date) <= p_to_date
"
"	--Open Order Purchase (Open PO)
"
"	    UNION ALL
"
"	    SELECT prchd_bu,'OOP','OOP',prchd_plnt,prchd_plnt_loc_id,prchd_cre_by,prchd_cre_date,
"
"	           prchd_po_date,prchd_po_pfx,prchd_po_no,
"
"		   DECODE(prchd_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled','L','Correction') doc_status
"
"	      FROM pur_rate_contr_hd
"
"	     WHERE prchd_bu = p_bu
"
"		AND prchd_prod_type in('PR','PO')
"
"		AND TRUNC(prchd_cre_date) >= p_fr_date
"
"		AND TRUNC(prchd_cre_date) <= p_to_date
"
"	--Open Order Purchase Amd. (Open PO Amd.)
"
"	    UNION ALL
"
"	    SELECT prcahd_bu,'OOAP','OOAP',prcahd_plnt,prcahd_plnt_loc_id,prcahd_cre_by,prcahd_cre_date,
"
"	           prcahd_doc_date,prcahd_po_pfx,prcahd_doc_no,
"
"		   decode(prcahd_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled','L','Correction') doc_status
"
"	      FROM pur_rate_contr_ament_hd
"
"	     WHERE prcahd_bu = p_bu
"
"		AND prcahd_prod_type IN('PR','PO')
"
"		AND TRUNC(prcahd_cre_date) >= p_fr_date
"
"		AND TRUNC(prcahd_cre_date) <= p_to_date
"
"	--ASN(Advance Shipping Notice)
"
"	    UNION ALL
"
"	    SELECT asnh_bu,'ASN','ASN',asnh_plnt,asnh_plnt_loc_id,asnh_cre_by,asnh_cre_date,
"
"	           asnh_doc_date,asnh_doc_pfx,asnh_doc_no,
"
"		   DECODE(asnh_status,'N','Draft','P','Approved','C','Cancelled')doc_status
"
"	      FROM adv_shpmt_notfn_hd
"
"	     WHERE asnh_bu = p_bu
"
"	       AND TRUNC(asnh_cre_date) >= p_fr_date
"
"	       AND TRUNC(asnh_cre_date) <= p_to_date
"
"         --Rate Contract (PR)
"
"	    UNION ALL
"
"            SELECT imrch_bu,'MR','MRCS',imrch_plnt,imrch_plnt_loc_id,imrch_cre_by,imrch_cre_date,
"
"		   imrch_doc_date,imrch_doc_pfx,imrch_doc_no,
"
"		   DECODE(imrch_status,'N','Draft','E','Entry Completed','A','Approved','C','Cancelled',imrch_status) doc_status
"
"              FROM inv_mat_req_cls_hd
"
"             WHERE imrch_bu = p_bu
"
"		AND TRUNC(imrch_cre_date) >= p_fr_date
"
"		AND TRUNC(imrch_cre_date) <= p_to_date
"
"	 ---Lot Hold/Unhold
"
"	    UNION ALL
"
"            SELECT lthh_bu,'LHU','LHU',lthh_plnt,lthh_plnt_loc_id,lthh_cre_by,lthh_cre_date,
"
"		   lthh_doc_date,lthh_doc_pfx,lthh_doc_no,
"
"		   DECODE(lthh_status,'N','Draft','E','Entry Completed','C','Cancelled','A','Approved') doc_status
"
"	      FROM lot_trans_hold_hd
"
"	     WHERE lthh_bu = p_bu
"
"		AND TRUNC(lthh_cre_date) >= p_fr_date
"
"		AND TRUNC(lthh_cre_date) <= p_to_date
"
"	--Gate Entry
"
"	    UNION ALL
"
"            SELECT dchd_bu,'DCD','DCD',dchd_plnt,NULL,dchd_cre_by,dchd_cre_date,
"
"		   dchd_date,dchd_doc_pfx,dchd_doc_no,
"
"		   DECODE(dchd_status,'N','Draft','O','Entry Completed','L', 'Approved','E', 'Cancelled','R','Revised') doc_status
"
"	      FROM dc_hd
"
"	     WHERE dchd_bu = p_bu
"
"		AND TRUNC(dchd_cre_date) >= p_fr_date
"
"		AND TRUNC(dchd_cre_date) <= p_to_date
"
"  	--Returnable DC
"
"	    UNION ALL
"
"	    SELECT drhd_bu AS doc_bu,'RDC' AS vou_type,'RDC' AS sub_vou_type,drhd_plnt AS doc_plnt,drhd_plnt_loc_id AS doc_plnt_loc_id,
"
"		   drhd_cre_by AS doc_cre_by,drhd_cre_date doc_cre_date,drhd_date doc_date,NULL doc_pfx,drhd_doc_no doc_no,
"
"		   DECODE (drhd_status,'N','Draft','C','Completed','L','Cancelled') doc_status
"
"	      FROM dc_receipt_hd
"
"	     WHERE drhd_bu = p_bu
"
"		AND TRUNC (drhd_cre_date) >= p_fr_date
"
"		AND TRUNC (drhd_cre_date) <= p_to_date
"
"	--Customer Material Return (CMR)
"
"	    UNION ALL
"
"	    SELECT cmtrhd_bu,'CMRR','CMRR',cmtrhd_plnt,cmtrhd_plnt_loc_id,cmtrhd_cre_by,cmtrhd_cre_date,
"
"	           cmtrhd_doc_date,cmtrhd_doc_pfx,cmtrhd_doc_no,
"
"		   DECODE(cmtrhd_status,'N','Draft','P','Approved','C','Cancelled ','E','Entry Completed',cmtrhd_status) doc_status
"
"	      FROM cust_mat_trans_return_hd
"
"	     WHERE cmtrhd_bu = p_bu
"
"		AND TRUNC(cmtrhd_cre_date) >= p_fr_date
"
"		AND TRUNC(cmtrhd_cre_date) <= p_to_date
"
"	--Inventory Count/ Stock Count Entries
"
"	    UNION ALL
"
"	    SELECT schd_bu AS doc_bu,'IC' AS vou_type,'IC' AS sub_vou_type,schd_plnt AS doc_plnt,schd_plnt_loc_id AS doc_plnt_loc_id,
"
"		   schd_cre_by AS doc_cre_by,schd_cre_date doc_cre_date,schd_count_date doc_date,schd_ord_pfx doc_pfx,schd_ord_no doc_no,
"
"		   DECODE(schd_ent_status,'N','Draft','P','Posted','C','Cancelled',schd_ent_status) doc_status
"
"	      FROM stock_count_hd
"
"	     WHERE schd_bu = p_bu
"
"		AND TRUNC (schd_cre_date) >= p_fr_date
"
"		AND TRUNC (schd_cre_date) <= p_to_date
"
"	--Customer Material Receipt (CMR - Receipt)
"
"	    UNION ALL
"
"	    SELECT cmthd_bu AS doc_bu,'CMR' AS vou_type,'CMR' AS sub_vou_type,cmthd_plnt AS doc_plnt,cmthd_plnt_loc_id AS doc_plnt_loc_id,
"
"		   cmthd_cre_by AS doc_cre_by,cmthd_cre_date doc_cre_date,cmthd_doc_date doc_date,cmthd_doc_pfx doc_pfx,cmthd_doc_no doc_no,
"
"		    DECODE(cmthd_status,'N','Draft','P','Approved','C','Cancelled','Partial','L','Q','QC Completed','E','Entry Completed') doc_status
"
"	      FROM cust_mat_trans_hd
"
"	     WHERE cmthd_bu = p_bu
"
"		AND TRUNC (cmthd_cre_date) >= p_fr_date
"
"		AND TRUNC (cmthd_cre_date) <= p_to_date
"
"	--Stock Revaluation
"
"	    UNION ALL
"
"	    SELECT srh_bu AS doc_bu,'SRV' AS vou_type,'SRV' AS sub_vou_type,srh_plnt AS doc_plnt,NULL AS doc_plnt_loc_id,
"
"		   srh_cre_by AS doc_cre_by,srh_cre_date doc_cre_date,srh_doc_date doc_date,srh_doc_pfx doc_pfx,srh_doc_no doc_no,
"
"		   decode(srh_status,'N','Draft','C','Cancelled','A','Posted')doc_status
"
"	      FROM stk_reval_hd
"
"	     WHERE srh_bu = p_bu
"
"		AND TRUNC (srh_cre_date) >= p_fr_date
"
"		AND TRUNC (srh_cre_date) <= p_to_date
"
"	--Stock Adjustment
"
"	    UNION ALL
"
"	    SELECT sathd_bu AS doc_bu,'SA' AS vou_type,'SA' AS sub_vou_type,sathd_plnt AS doc_plnt,sathd_plnt_loc_id AS doc_plnt_loc_id,
"
"		   sathd_cre_by AS doc_cre_by,sathd_cre_date doc_cre_date,sathd_ord_date doc_date,NULL doc_pfx,sathd_ord_no doc_no,
"
"		   DECODE(sathd_status,'E','Draft','C','Cancelled','N','Entry Completed','A','Approved') doc_status
"
"	      FROM stock_adj_trans_hd
"
"	     WHERE sathd_bu = p_bu
"
"		AND TRUNC (sathd_cre_date) >= p_fr_date
"
"		AND TRUNC (sathd_cre_date) <= p_to_date
"
"	--Segregation
"
"	    UNION ALL
"
"	    SELECT psh_bu AS doc_bu,'SEG' AS vou_type,'SEG' AS sub_vou_type,psh_plnt AS doc_plnt,psh_plnt_loc_id AS doc_plnt_loc_id,
"
"		   psh_cre_by AS doc_cre_by,psh_cre_date doc_cre_date,psh_doc_date doc_date,psh_doc_pfx doc_pfx,psh_doc_no doc_no,
"
"		   DECODE(psh_status,'N','Draft','E','Entry Completed','A','Approved','C','Cancelled') doc_status
"
"	      FROM prod_segr_hd
"
"	     WHERE psh_bu = p_bu
"
"		AND TRUNC (psh_cre_date) >= p_fr_date
"
"		AND TRUNC (psh_cre_date) <= p_to_date
"
"	--Material Receipt Voucher
"
"	    UNION ALL
"
"	    SELECT isthd_bu AS doc_bu,'MRV' AS vou_type,'MRV' AS sub_vou_type,isthd_plnt AS doc_plnt,isthd_plnt_loc_id AS doc_plnt_loc_id,
"
"		   isthd_cre_by AS doc_cre_by,isthd_cre_date doc_cre_date,isthd_trans_date doc_date,isthd_doc_pfx doc_pfx,isthd_doc_no doc_no,
"
"		   DECODE(isthd_status,'N','Draft','I','Issued','C','Cancelled')  doc_status
"
"	      FROM inv_stock_trans_hd_vw
"
"	     WHERE isthd_bu = p_bu
"
"	        AND isthd_doc_oper = 'R'
"
"		AND TRUNC (isthd_cre_date) >= p_fr_date
"
"		AND TRUNC (isthd_cre_date) <= p_to_date
"
"	--Material Issuance Voucher
"
"	    UNION ALL
"
"	    SELECT isthd_bu AS doc_bu,'MIV' AS vou_type,'MIV' AS sub_vou_type,isthd_plnt AS doc_plnt,isthd_plnt_loc_id AS doc_plnt_loc_id,
"
"		   isthd_cre_by AS doc_cre_by,isthd_cre_date doc_cre_date,isthd_trans_date doc_date,NULL doc_pfx,isthd_doc_no doc_no,
"
"		   DECODE(isthd_status,'N','Draft','O','Transit In','I','Posted','C','Cancelled') doc_status
"
"	      FROM inv_stock_trans_hd_vw
"
"	     WHERE isthd_bu = p_bu
"
"	        AND isthd_doc_oper <> 'R'
"
"		AND TRUNC (isthd_cre_date) >= p_fr_date
"
"		AND TRUNC (isthd_cre_date) <= p_to_date
"
"	--Material Return
"
"	    UNION ALL
"
"	    SELECT ssthd_bu AS doc_bu,'MRTN' AS vou_type,'MRTN' AS sub_vou_type,ssthd_plnt AS doc_plnt,ssthd_plnt_loc_id AS doc_plnt_loc_id,
"
"		   ssthd_cre_by AS doc_cre_by,ssthd_cre_date doc_cre_date,ssthd_date doc_date,ssthd_doc_pfx doc_pfx,ssthd_doc_no doc_no,
"
"		   DECODE(ssthd_status,'N','Draft','Q','QC Completed','P','Partial','I','Issued','C','Cancelled')  doc_status
"
"	      FROM store_stock_trans_hd_vw
"
"	     WHERE ssthd_bu = p_bu
"
"		AND ssthd_type = 'MR'
"
"		AND TRUNC (ssthd_cre_date) >= p_fr_date
"
"		AND TRUNC (ssthd_cre_date) <= p_to_date
"
"	--Material Request
"
"	    UNION ALL
"
"	    SELECT imrhd_bu AS doc_bu,'MR' AS vou_type,'MR' AS sub_vou_type,imrhd_plnt AS doc_plnt,imrhd_plnt_loc_id AS doc_plnt_loc_id,
"
"		   imrhd_cre_by AS doc_cre_by,imrhd_cre_date doc_cre_date,imrhd_rqst_date doc_date,NULL doc_pfx,imrhd_rqst_no doc_no,
"
"		    DECODE (imrhd_status,'E', 'Draft', 'N', 'Entry Completed', 'A', 'Approved','L', 'Closeshorted','C', 'Cancelled') doc_status
"
"	      FROM inv_material_request_hd_vw
"
"	     WHERE imrhd_bu = p_bu
"
"		AND TRUNC (imrhd_cre_date) >= p_fr_date
"
"		AND TRUNC (imrhd_cre_date) <= p_to_date
"
"	--Non Conformance Report (NCR)
"
"	    UNION ALL
"
"	    SELECT tqncr_bu AS doc_bu,'NCR' AS vou_type,'NCR' AS sub_vou_type,tqncr_plnt AS doc_plnt,tqncr_plnt_loc_id AS doc_plnt_loc_id,
"
"		   tqncr_cre_by AS doc_cre_by,tqncr_cre_date doc_cre_date,tqncr_ncr_date doc_date,tqncr_ncr_pfx doc_pfx,tqncr_ncr_no doc_no,
"
"		   DECODE(tqncr_status,'O','Draft','E','Entry Completed','C','Closed','L','Cancelled','A','Approved',tqncr_status)doc_status
"
"	      FROM tqm_ncr
"
"	     WHERE tqncr_bu = p_bu
"
"		AND TRUNC (tqncr_cre_date) >= p_fr_date
"
"		AND TRUNC (tqncr_cre_date) <= p_to_date
"
"	--Calibration
"
"            UNION ALL
"
"            SELECT ich_bu AS doc_bu,'CAL' AS vou_type,'CAL' AS sub_vou_type,ich_plnt AS doc_plnt,ich_plnt_loc_id AS doc_plnt_loc_id,
"
"		   ich_cre_by AS doc_cre_by,ich_cre_date doc_cre_date,ich_doc_date doc_date,ich_doc_pfx doc_pfx,ich_doc_no doc_no,
"
"		   DECODE(ich_status,'N','Draft','P','Approved','E','Entry Completed','C','Cancelled',ich_status) doc_status
"
"              FROM inst_calib_hd_vw
"
"             WHERE ich_bu = p_bu
"
"		AND TRUNC (ich_cre_date) >= p_fr_date
"
"		AND TRUNC (ich_cre_date) <= p_to_date
"
"	--Instruments
"
"            UNION ALL
"
"            SELECT qi_bu AS doc_bu,'INST' AS vou_type,'INST' AS sub_vou_type,qi_plnt AS doc_plnt,qi_plnt_loc_id AS doc_plnt_loc_id,
"
"		   qi_cre_by AS doc_cre_by,qi_cre_date doc_cre_date,qi_cre_date doc_date,NULL doc_pfx,qi_inst_id doc_no,
"
"		   DECODE(qi_status,'N','Draft','U','In Use','S','In Study','O','Obsolete','C','Correction','I','Returned','E','Entry Completed')
"
"		    doc_status
"
"              FROM qc_instruments
"
"             WHERE qi_bu = p_bu
"
"		AND TRUNC (qi_cre_date) >= p_fr_date
"
"		AND TRUNC (qi_cre_date) <= p_to_date
"
"	--Instruments Rejection
"
"            UNION ALL
"
"            SELECT idfh_bu AS doc_bu,'INSR' AS vou_type,'INSR' AS sub_vou_type,idfh_plnt AS doc_plnt,idfh_plnt_loc_id AS doc_plnt_loc_id,
"
"		   idfh_cre_by ,idfh_cre_date doc_cre_date,idfh_doc_date idfh_doc_date,idfh_doc_pfx doc_pfx,idfh_doc_no doc_no,
"
"		   DECODE(idfh_status,'N','Draft','P','Approved','C','Cancelled','E','Entry Completed') doc_status
"
"              FROM instr_disp_form_hd
"
"             WHERE idfh_bu = p_bu
"
"        AND TRUNC (idfh_cre_date) >= p_fr_date
"
"        AND TRUNC (idfh_cre_date) <= p_to_date
"
"	--INSTRUMENT ISSUE/RETURN/TRANSFER
"
"            UNION ALL
"
"	   SELECT ith_bu AS doc_bu,'IIRT' AS vou_type,'IIRT' AS sub_vou_type,ith_plnt AS doc_plnt,ith_plnt_loc_id AS doc_plnt_loc_id,
"
"           ith_cre_by ,ith_cre_date doc_cre_date,ith_doc_date idfh_doc_date,ith_doc_pfx doc_pfx,ith_doc_no doc_no,
"
"           DECODE(ith_status,'N','Draft','P','Approved','C','Cancelled','E','Entry Completed') doc_status
"
"              FROM instr_trans_hd
"
"             WHERE ith_bu = p_bu
"
"        AND TRUNC (ith_cre_date) >= p_fr_date
"
"        AND TRUNC (ith_cre_date) <= p_to_date
"
"	--R and R(REPEATABILITY AND REPRODUCIBILITY)
"
"            UNION ALL
"
"	   SELECT msh_bu AS doc_bu,'RAR' AS vou_type,DECODE(msh_study_type,'RR','RAA','CT','RCT','SD','RSD','RAM') AS sub_vou_type,msh_plant AS doc_plnt,msh_plnt_loc_id AS doc_plnt_loc_id,
"
"           msh_cre_by ,msh_cre_date doc_cre_date,msh_doc_date msh_doc_date,msh_doc_pfx doc_pfx,msh_doc_no doc_no,
"
"           DECODE(msh_status,'N','Draft','A','Approved','C','Cancelled','E','Entry Completed') doc_status
"
"              FROM msa_study_hd
"
"             WHERE msh_bu = p_bu
"
"        AND TRUNC (msh_cre_date) >= p_fr_date
"
"        AND TRUNC (msh_cre_date) <= p_to_date
"
"--Sales
"
"	--Sales order
"
"	    UNION ALL
"
"	    SELECT soh_bu AS doc_bu,'SO' AS vou_type,soh_order_type AS sub_vou_type,soh_plant AS doc_plnt,soh_plnt_loc_id AS doc_plnt_loc_id,
"
"	          soh_cre_by AS doc_cre_by,soh_cre_date doc_cre_date,soh_order_date doc_date,soh_order_pfx doc_pfx,soh_order_no doc_no,
"
"		  DECODE (soh_status,'N', 'Draft','O', 'Entry Completed','A', 'Approved', 'L', 'Cancelled','C', 'Closeshort','T', 'Amended',soh_status) doc_status
"
"	      FROM sales_order_hd
"
"	     WHERE soh_bu = p_bu
"
"		AND soh_vou_type = 'SO'
"
"		AND TRUNC (soh_cre_date) >= p_fr_date
"
"		AND TRUNC (soh_cre_date) <= p_to_date
"
"	--Labor order
"
"	    UNION ALL
"
"	    SELECT soh_bu AS doc_bu,'JWO' AS vou_type,soh_order_type AS sub_vou_type,soh_plant AS doc_plnt,soh_plnt_loc_id AS doc_plnt_loc_id,
"
"		 soh_cre_by AS doc_cre_by,soh_cre_date doc_cre_date,soh_order_date doc_date,soh_order_pfx doc_pfx,soh_order_no doc_no,
"
"		 DECODE (soh_status,'N', 'Draft','O', 'Entry Completed','A', 'Approved','L', 'Cancelled','T','closeshorted',soh_status) doc_status
"
"	      FROM sales_order_hd
"
"	     WHERE soh_bu = p_bu
"
"		AND soh_vou_type = 'JWO'
"
"		AND TRUNC (soh_cre_date) >= p_fr_date
"
"		AND TRUNC (soh_cre_date) <= p_to_date
"
"	--Sales order Amd.
"
"	  UNION ALL
"
"	    SELECT soh_bu AS doc_bu,'SOA' AS vou_type,'SOA' AS sub_vou_type,soh_plnt AS doc_plnt,soh_plnt_loc_id AS doc_plnt_loc_id,
"
"		   soh_cre_by AS doc_cre_by,soh_cre_date doc_cre_date,soh_doc_date doc_date,soh_doc_pfx doc_pfx,soh_doc_no doc_no,
"
"		   DECODE (soh_status,'N', 'Draft','E', 'Entry Completed', 'A', 'Approved','C', 'Cancelled',soh_status) doc_status
"
"	      FROM so_amend_hd
"
"	     WHERE soh_bu = p_bu
"
"		AND TRUNC (soh_cre_date) >= p_fr_date
"
"		AND TRUNC (soh_cre_date) <= p_to_date
"
"	--Sales Invoices
"
"	    UNION ALL
"
"	    SELECT sihd_bu AS doc_bu,sihd_vou_type AS vou_type,sihd_type AS sub_vou_type,sihd_plant AS doc_plnt,sihd_plnt_loc_id AS doc_plnt_loc_id,
"
"		 sihd_cre_by AS doc_cre_by,sihd_cre_date doc_cre_date,sihd_doc_date doc_date,sihd_doc_pfx doc_pfx,sihd_doc_no doc_no,
"
"		 DECODE (sihd_status,'N', 'Draft','P', 'Picked','E', 'Entry Completed','I', 'Invoiced','C', 'Cancelled',sihd_status) doc_status
"
"	      FROM sales_invoices_hd
"
"	    WHERE sihd_bu = p_bu
"
"		AND sihd_vou_type = 'SI'
"
"		AND TRUNC (sihd_cre_date) >= p_fr_date
"
"		AND TRUNC (sihd_cre_date) <= p_to_date
"
"	--Labor Invoices
"
"	    UNION ALL
"
"	    SELECT sihd_bu AS doc_bu,sihd_vou_type AS vou_type,sihd_type AS sub_vou_type,sihd_plant AS doc_plnt,sihd_plnt_loc_id AS doc_plnt_loc_id,
"
"		 sihd_cre_by AS doc_cre_by,sihd_cre_date doc_cre_date,sihd_doc_date doc_date,sihd_doc_pfx doc_pfx,sihd_doc_no doc_no,
"
"		 DECODE (sihd_status,'N', 'Draft','P', 'Picked','E', 'Entry Completed','I', 'Invoiced','C', 'Cancelled',sihd_status) doc_status
"
"	      FROM sales_invoices_hd
"
"	    WHERE sihd_bu = p_bu
"
"		AND sihd_vou_type = 'JWI'
"
"		AND TRUNC (sihd_cre_date) >= p_fr_date
"
"		AND TRUNC (sihd_cre_date) <= p_to_date
"
"	--Proforma Invoices
"
"	    UNION ALL
"
"	    SELECT pihd_bu AS doc_bu,pihd_vou_type AS vou_type,pihd_type AS sub_vou_type,pihd_plnt AS doc_plnt,pihd_plnt_loc_id AS doc_plnt_loc_id,
"
"		 pihd_cre_by AS doc_cre_by,pihd_cre_date doc_cre_date,pihd_doc_date doc_date,pihd_doc_pfx doc_pfx,pihd_doc_no doc_no,
"
"		 DECODE (pihd_status,'N', 'Draft','E', 'Entry Completed','I', 'Invoiced','C', 'Cancelled',pihd_status)doc_status
"
"	      FROM proforma_invoices_hd
"
"	    WHERE pihd_bu = p_bu
"
"		AND pihd_vou_type = 'PI'
"
"		AND TRUNC (pihd_cre_date) >= p_fr_date
"
"		AND TRUNC (pihd_cre_date) <= p_to_date
"
"	--Credit Note
"
"	    UNION ALL
"
"	    SELECT sihd_bu AS doc_bu,sihd_vou_type AS vou_type,sihd_sub_vou_type AS sub_vou_type,sihd_plant AS doc_plnt,sihd_plnt_loc_id AS doc_plnt_loc_id,
"
"		 sihd_cre_by AS doc_cre_by,sihd_cre_date doc_cre_date,sihd_doc_date doc_date,sihd_doc_pfx doc_pfx,sihd_doc_no doc_no,
"
"		 DECODE (sihd_status,'N', 'Draft','P', 'Picked','E', 'Entry Completed','I', 'Invoiced','C', 'Cancelled',sihd_status)doc_status
"
"	      FROM sales_invoices_hd
"
"	     WHERE sihd_bu = p_bu
"
"		AND sihd_vou_type = 'CN'
"
"		AND TRUNC (sihd_cre_date) >= p_fr_date
"
"		AND TRUNC (sihd_cre_date) <= p_to_date
"
"	--Debit Note
"
"	    UNION ALL
"
"	    SELECT sihd_bu AS doc_bu,sihd_vou_type AS vou_type,sihd_sub_vou_type AS sub_vou_type,sihd_plant AS doc_plnt,sihd_plnt_loc_id AS doc_plnt_loc_id,
"
"		 sihd_cre_by AS doc_cre_by,sihd_cre_date doc_cre_date,sihd_doc_date doc_date,sihd_doc_pfx doc_pfx,sihd_doc_no doc_no,
"
"		 DECODE (sihd_status,'N', 'Draft','P', 'Picked','E', 'Entry Completed','I', 'Invoiced','C', 'Cancelled',sihd_status) doc_status
"
"	      FROM sales_invoices_hd
"
"	     WHERE sihd_bu = p_bu
"
"		AND sihd_vou_type = 'DN'
"
"		AND TRUNC (sihd_cre_date) >= p_fr_date
"
"		AND TRUNC (sihd_cre_date) <= p_to_date
"
"	--Price List
"
"	    UNION ALL
"
"	    SELECT cpl_bu AS doc_bu,'PL' AS vou_type,'PL' AS sub_vou_type,cpl_plnt AS doc_plnt,cpl_plnt_loc_id AS doc_plnt_loc_id,
"
"		   cpl_cre_by AS doc_cre_by,cpl_cre_date doc_cre_date,cpl_doc_date doc_date,cpl_doc_pfx doc_pfx,cpl_doc_no doc_no,
"
"		   DECODE(cpl_status,'N','Draft','A','Approved','C','Cancelled','E','Entry Completed',cpl_status) doc_status
"
"	      FROM cust_price_list
"
"	     WHERE cpl_bu = p_bu
"
"		AND TRUNC (cpl_cre_date) >= p_fr_date
"
"		AND TRUNC (cpl_cre_date) <= p_to_date
"
"	--Catalog Price
"
"	    UNION ALL
"
"	    SELECT sctln_bu AS doc_bu,NULL AS vou_type,NULL AS sub_vou_type,NULL AS doc_plnt,NULL AS doc_plnt_loc_id,
"
"		   sctln_cre_by AS doc_cre_by,sctln_cre_date doc_cre_date,NULL doc_date,NULL doc_pfx,sctln_doc_no doc_no,
"
"		   DECODE (sctln_status,'N','Draft','A','Approved','P','Approved','C','Cancelled','E','Entry Completed',sctln_status) doc_status
"
"	      FROM sales_catalog_ln
"
"	     WHERE sctln_bu = p_bu
"
"		AND TRUNC (sctln_cre_date) >= p_fr_date
"
"		AND TRUNC (sctln_cre_date) <= p_to_date
"
"	--Standard Price
"
"	    UNION ALL
"
"	    SELECT ssp_bu AS doc_bu,NULL AS vou_type,NULL AS sub_vou_type,ssp_plant AS doc_plnt,ssp_plnt_loc_id AS doc_plnt_loc_id,
"
"		   ssp_cre_by AS doc_cre_by,ssp_cre_date doc_cre_date,NULL doc_date,NULL doc_pfx,NULL doc_no,
"
"		   DECODE(ssp_status,'N','Draft','A','Approved','C','Cancelled','E','Entry Completed',ssp_status) doc_status
"
"	      FROM sales_std_prices
"
"	     WHERE ssp_bu = p_bu
"
"		AND TRUNC (ssp_cre_date) >= p_fr_date
"
"		AND TRUNC (ssp_cre_date) <= p_to_date
"
"	--OPEN SO
"
"	    UNION ALL
"
"	    SELECT srchd_bu AS doc_bu,'OSO' AS vou_type,'OSO' AS sub_vou_type,srchd_plnt AS doc_plnt,srchd_plnt_loc_id AS doc_plnt_loc_id,
"
"		   srchd_cre_by AS doc_cre_by,srchd_cre_date doc_cre_date,srchd_doc_date doc_date,srchd_doc_pfx doc_pfx,srchd_doc_no doc_no,
"
"		   DECODE (srchd_status,'A','Approved','E','Draft','N','Entry Completed','C', 'Cancelled',srchd_status) doc_status
"
"	      FROM sales_rate_contr_hd
"
"	     WHERE srchd_bu = p_bu
"
"		AND srchd_type = 'S'
"
"		AND TRUNC (srchd_cre_date) >= p_fr_date
"
"		AND TRUNC (srchd_cre_date) <= p_to_date
"
"	--OPEN SO AMD.
"
"	    UNION ALL
"
"	    SELECT srcahd_bu AS doc_bu,'OSOA' AS vou_type,'OSOA' AS sub_vou_type,srcahd_plnt AS doc_plnt,srcahd_plnt_loc_id AS doc_plnt_loc_id,
"
"		   srcahd_cre_by AS doc_cre_by,srcahd_cre_date doc_cre_date,srcahd_doc_date doc_date,srcahd_doc_pfx doc_pfx,srcahd_doc_no doc_no,
"
"		   DECODE (srcahd_status,'A','Approved','E','Draft','N','Entry Completed','C', 'Cancelled',srcahd_status) doc_status
"
"	      FROM sales_rate_contr_ament_hd
"
"	     WHERE srcahd_bu = p_bu
"
"		--AND srchd_type = 'S'
"
"		AND TRUNC (srcahd_cre_date) >= p_fr_date
"
"		AND TRUNC (srcahd_cre_date) <= p_to_date
"
"	--OPEN JWO
"
"	    UNION ALL
"
"	    SELECT srchd_bu AS doc_bu,'OJWO' AS vou_type,'OJWO' AS sub_vou_type,srchd_plnt AS doc_plnt,srchd_plnt_loc_id AS doc_plnt_loc_id,
"
"		   srchd_cre_by AS doc_cre_by,srchd_cre_date doc_cre_date,srchd_doc_date doc_date,srchd_doc_pfx doc_pfx,srchd_doc_no doc_no,
"
"		   DECODE (srchd_status,'A','Approved','E','Draft','N','Entry Completed','C', 'Cancelled',srchd_status) doc_status
"
"	      FROM sales_rate_contr_hd
"
"	     WHERE srchd_bu = p_bu
"
"		AND srchd_type = 'L'
"
"		AND TRUNC (srchd_cre_date) >= p_fr_date
"
"		AND TRUNC (srchd_cre_date) <= p_to_date
"
"	--OPEN JWO AMD.
"
"	    UNION ALL
"
"	    SELECT srcahd_bu AS doc_bu,'OSOA' AS vou_type,'OJWOA' AS sub_vou_type,srcahd_plnt AS doc_plnt,srcahd_plnt_loc_id AS doc_plnt_loc_id,
"
"		   srcahd_cre_by AS doc_cre_by,srcahd_cre_date doc_cre_date,srcahd_doc_date doc_date,srcahd_doc_pfx doc_pfx,srcahd_doc_no doc_no,
"
"		   DECODE (srcahd_status,'A','Approved','E','Draft','N','Entry Completed','C', 'Cancelled',srcahd_status) doc_status
"
"	      FROM sales_rate_contr_ament_hd
"
"	     WHERE srcahd_bu = p_bu
"
"		--AND srchd_type = 'L'
"
"		AND TRUNC (srcahd_cre_date) >= p_fr_date
"
"		AND TRUNC (srcahd_cre_date) <= p_to_date
"
"	--Customer Schedule
"
"	    UNION ALL
"
"	    SELECT cohd_bu AS doc_bu,'CS' AS vou_type,'CS' AS sub_vou_type,cohd_plnt AS doc_plnt,cohd_plnt_loc_id AS doc_plnt_loc_id,
"
"		   cohd_cre_by AS doc_cre_by,cohd_cre_date doc_cre_date,cohd_date doc_date,cohd_batch_pfx doc_pfx,cohd_batch_no doc_no,
"
"		   DECODE (cohd_status,'E','Draft','N','Entry Completed ','A','Approved','C','Cancelled','L','Closeshorted','T','Amended','S','Closed',cohd_status) doc_status
"
"	      FROM cust_order_hd
"
"	     WHERE cohd_bu = p_bu
"
"		AND TRUNC (cohd_cre_date) >= p_fr_date
"
"		AND TRUNC (cohd_cre_date) <= p_to_date
"
"	--Customer Schedule Amd.
"
"	    UNION ALL
"
"	    SELECT camh_bu AS doc_bu,'CSA' AS vou_type,'CSA' AS sub_vou_type,camh_plnt AS doc_plnt,camh_plnt_loc_id AS doc_plnt_loc_id,
"
"		   camh_cre_by AS doc_cre_by,camh_cre_date doc_cre_date,camh_doc_date doc_date,camh_doc_pfx doc_pfx,camh_doc_no doc_no,
"
"		   DECODE(camh_status,'N','Draft','E','Entry Completed','A','Approved','C','Cancelled',camh_status) doc_status
"
"	      FROM cs_amend_multi_hd
"
"	     WHERE camh_bu = p_bu
"
"		AND TRUNC (camh_cre_date) >= p_fr_date
"
"		AND TRUNC (camh_cre_date) <= p_to_date
"
"	--Despatch Plan
"
"	    UNION ALL
"
"	    SELECT cdph_bu AS doc_bu,'DES' AS vou_type,'DES' AS sub_vou_type,cdph_plnt AS doc_plnt,cdph_plnt_loc_id AS doc_plnt_loc_id,
"
"		   cdph_cre_by AS doc_cre_by,cdph_cre_date doc_cre_date,cdph_doc_date doc_date,--func_find_vou_dflt_pfx(cdph_bu,cdph_plnt,cdph_plnt_loc_id,'DES','DES')
"
"		   NULL doc_pfx,cdph_doc_no doc_no,
"
"		   DECODE(cdph_status,'N','Draft','E','Entry Completed','A','Approved','C','Cancelled',cdph_status) doc_status
"
"	      FROM cust_desp_plan_hd
"
"	     WHERE cdph_bu = p_bu
"
"		AND TRUNC (cdph_cre_date) >= p_fr_date
"
"		AND TRUNC (cdph_cre_date) <= p_to_date
"
"	--Price Diff. Working
"
"	    UNION ALL
"
"	    SELECT ssihd_bu AS doc_bu,'IPD' AS vou_type,'IPD' AS sub_vou_type,ssihd_plnt AS doc_plnt,ssihd_plnt_loc_id AS doc_plnt_loc_id,
"
"		   ssihd_cre_by AS doc_cre_by,ssihd_cre_date doc_cre_date,ssihd_doc_date doc_date,'IPD' doc_pfx,ssihd_doc_no doc_no,
"
"		   DECODE(ssihd_status,'N','Draft','I','Invoiced','C','Cancelled',ssihd_status) doc_status
"
"	      FROM sales_sup_inv_hd
"
"	     WHERE SSIHD_BU = p_bu
"
"		AND TRUNC (SSIHD_CRE_DATE) >= p_fr_date
"
"		AND TRUNC (SSIHD_CRE_DATE) <= p_to_date
"
"	--Project Draft Invoice
"
"	    UNION ALL
"
"	    SELECT pdih_bu AS doc_bu,'PDI' AS vou_type,'PDI' AS sub_vou_type,pdih_plnt AS doc_plnt,NULL AS doc_plnt_loc_id,
"
"		   pdih_cre_by AS doc_cre_by,pdih_cre_date doc_cre_date,pdih_date doc_date,NULL doc_pfx,pdih_doc_no doc_no,
"
"		   DECODE (pdih_status,'N', 'Draft','P', 'Posted','C', 'Cancelled',pdih_status) doc_status
"
"	      FROM proj_draft_inv_hd
"
"	     WHERE pdih_bu = p_bu
"
"		AND TRUNC (pdih_cre_date) >= p_fr_date
"
"		AND TRUNC (pdih_cre_date) <= p_to_date
"
"--MARKETING
"
"	--CUSTOMER COMPLAINT
"
"	    UNION ALL
"
"	    SELECT ccfhd_bu AS doc_bu,'CCP' AS vou_type,'CCP' AS sub_vou_type,ccfhd_plnt AS doc_plnt,ccfhd_plnt_loc_id AS doc_plnt_loc_id,
"
"		    ccfhd_cre_by AS doc_cre_by,ccfhd_cre_date doc_cre_date,ccfhd_date doc_date,'CC' doc_pfx,ccfhd_comp_no doc_no,
"
"		    DECODE (ccfhd_status,'Q', 'QC Completed','N', 'Draft','C', 'Cancelled','E', 'Entry Completed','L', 'Approved') doc_status
"
"	      FROM cust_comp_fdbck_hd
"
"	     WHERE ccfhd_bu = p_bu
"
"		AND TRUNC (ccfhd_cre_date) >= p_fr_date
"
"		AND TRUNC (ccfhd_cre_date) <= p_to_date
"
"	--CAMPAIGNS
"
"	    UNION ALL
"
"	    SELECT crmc_bu AS doc_bu,'CA' AS vou_type,'CA' AS sub_vou_type,NULL AS doc_plnt,NULL AS doc_plnt_loc_id,
"
"		   crmc_cre_by AS doc_cre_by,crmc_cre_date doc_cre_date,NULL doc_date,
"
"		  (SELECT DISTINCT apsta_pfx FROM appl_pfx_sub_types_asso WHERE apsta_bu = p_bu AND apsta_vou_type = 'CA' AND ROWNUM = 1) doc_pfx,crmc_campaign_id doc_no,
"
"		   DECODE (crmc_status,'P', 'Planning','A', 'Active','C', 'Close Campaign','L', 'Cancelled') doc_status
"
"	      FROM crm_campaigns
"
"	     WHERE crmc_bu = p_bu
"
"		AND TRUNC (crmc_cre_date) >= p_fr_date
"
"		AND TRUNC (crmc_cre_date) <= p_to_date
"
"	--LEADS
"
"	    UNION ALL
"
"	    SELECT ml_bu AS doc_bu,'LA' AS vou_type,'LA' AS sub_vou_type,NULL AS doc_plnt,NULL AS doc_plnt_loc_id,
"
"		   ml_cre_by AS doc_cre_by,ml_cre_date doc_cre_date, ml_lead_date doc_date,(SELECT DISTINCT apsta_pfx FROM appl_pfx_sub_types_asso WHERE apsta_bu = p_bu AND apsta_vou_type = 'LA') doc_pfx, ml_lead_no doc_no,
"
"		   DECODE (ml_status,'D', 'Draft','Q', 'Qualified and Not Accounted','A', 'Qualified and Accounted','H', 'Hold','D', 'Disqualify') doc_status
"
"	      FROM mktg_leads
"
"	     WHERE ml_bu = p_bu
"
"		AND TRUNC (ml_cre_date) >= p_fr_date
"
"		AND TRUNC (ml_cre_date) <= p_to_date
"
"	--ENQUIRY
"
"	    UNION ALL
"
"	    SELECT ophd_bu AS doc_bu,'EA' AS vou_type,'EA' AS sub_vou_type,ophd_plant AS doc_plnt,ophd_plnt_loc_id AS doc_plnt_loc_id,
"
"		   ophd_cre_by AS doc_cre_by,ophd_cre_date doc_cre_date,ophd_date doc_date,'EA' doc_pfx, ophd_doc_no doc_no,
"
"		   DECODE (ophd_status, 'N', 'Open',  'E', 'Entry Completed',  'L', 'Cancelled', 'C', 'Closed','A', 'Approved','H','Hold')doc_status
"
"	      FROM opport_hd
"
"	     WHERE ophd_bu = p_bu
"
"	     AND ophd_cp_type <> 'P'
"
"		AND TRUNC (ophd_cre_date) >= p_fr_date
"
"		AND TRUNC (ophd_cre_date) <= p_to_date
"
"	--Quotation
"
"	    UNION ALL
"
"	    SELECT sqh_bu AS doc_bu,'SQ' AS vou_type,'SQ' AS sub_vou_type,sqh_plant AS doc_plnt,sqh_plnt_loc_id AS doc_plnt_loc_id,
"
"		   sqh_cre_by AS doc_cre_by,sqh_cre_date doc_cre_date,sqh_quote_date doc_date,sqh_quote_pfx doc_pfx,sqh_quote_no doc_no,
"
"		   DECODE (sqh_status,'N', 'Draft','S', 'Approved','C', 'Cancelled','E', 'Closed','O', 'Order','R', 'Reversed','T', 'Entry Completed') doc_status
"
"	      FROM so_quote_hd
"
"	     WHERE sqh_bu = p_bu
"
"		AND TRUNC (sqh_cre_date) >= p_fr_date
"
"		AND TRUNC (sqh_cre_date) <= p_to_date
"
"	--Feasibility Study
"
"	    UNION ALL
"
"	    SELECT ofsh_bu AS doc_bu,'FT' AS vou_type,'FT' AS sub_vou_type,ofsh_plnt AS doc_plnt,ofsh_plnt_loc_id AS doc_plnt_loc_id,
"
"		   ofsh_cre_by AS doc_cre_by,ofsh_cre_date doc_cre_date,ofsh_doc_date doc_date,ofsh_pfx doc_pfx,ofsh_doc_no doc_no,
"
"		   DECODE (ofsh_status,'N', 'Draft','C', 'Approved','L', 'Cancelled','E', 'Entry Completed') doc_status
"
"	      FROM opport_feas_study_hd
"
"	     WHERE ofsh_bu = p_bu
"
"		AND TRUNC (ofsh_cre_date) >= p_fr_date
"
"		AND TRUNC (ofsh_cre_date) <= p_to_date
"
"	--DAILY ACTIVITY
"
"	    UNION ALL
"
"	    SELECT csdal_bu AS doc_bu,'DACTL' AS vou_type,'DACTL' AS sub_vou_type,csdal_plnt AS doc_plnt,NULL AS doc_plnt_loc_id,
"
"		   csdal_cre_by AS doc_cre_by,csdal_cre_date doc_cre_date,csdal_doc_date doc_date,
"
"		   (SELECT DISTINCT apsta_pfx d FROM appl_pfx_sub_types_asso, appl_doc_pfx_loc WHERE apsta_bu = adpl_bu AND apsta_pfx = adpl_pfx AND apsta_bu = p_bu AND apsta_vou_type = 'DACTL' AND apsta_sub_type = 'DACTL') doc_pfx, csdal_doc_no doc_no,
"
"		   DECODE (csdal_status,'N', 'Draft','P', 'Posted','C', 'Cancelled') doc_status
"
"	      FROM crm_sp_dly_actvty_log
"
"	     WHERE csdal_bu = p_bu
"
"		AND TRUNC (csdal_cre_date) >= p_fr_date
"
"		AND TRUNC (csdal_cre_date) <= p_to_date	 /*
"
"	--COST ESTIMATION
"
"	    UNION ALL
"
"	    SELECT oceh_bu AS doc_bu,'CES' AS vou_type,'CES' AS sub_vou_type,oceh_plnt AS doc_plnt,NULL AS doc_plnt_loc_id,
"
"		   oceh_cre_by AS doc_cre_by,oceh_cre_date doc_cre_date,oceh_doc_date doc_date,func_find_vou_dflt_pfx(oceh_bu,oceh_plnt,(SELECT Bupld_Loc_Id
"
"                                                 FROM bus_unit_plants_loc_dtls
"
"                                                WHERE bupld_bu = oceh_bu
"
"                                                      AND bupld_plnt =
"
"                                                             oceh_plnt
"
"                                                      AND bupld_actv_loc_flag =
"
"                                                             'Y'
"
"                                                      AND bupld_dflt_loc_flag =
"
"                                                             'Y'),'CES','CES') doc_pfx,oceh_doc_no doc_no,
"
"		   Decode(oceh_status,'N','Draft','E','Entry Completed','L','Cancelled','C','Approved') doc_status
"
"	      FROM opport_cost_est_hd
"
"	     WHERE oceh_bu = p_bu
"
"		AND TRUNC (oceh_cre_date) >= p_fr_date
"
"		AND TRUNC (oceh_cre_date) <= p_to_date*/
"
"	--SERVICE ORDER
"
"	    UNION ALL
"
"	    SELECT svohd_bu AS doc_bu,'SOCSR' AS vou_type,'SOCSR' AS sub_vou_type,svohd_plant AS doc_plnt,svohd_plnt_loc_id AS doc_plnt_loc_id,
"
"		   svohd_cre_by AS doc_cre_by,svohd_cre_date doc_cre_date,svohd_date doc_date,--func_find_vou_dflt_pfx (svohd_bu,svohd_plant,svohd_plnt_loc_id,'SOCSR','SOCSR')
"
"		   NULL doc_pfx,svohd_order_no doc_no,
"
"		   DECODE(svohd_status,'N','Draft','A','Approved','C','Cancelled','E','Entry Completed',svohd_status) doc_status
"
"	      FROM service_order_hd
"
"	     WHERE svohd_bu = p_bu
"
"		AND TRUNC (svohd_cre_date) >= p_fr_date
"
"		AND TRUNC (svohd_cre_date) <= p_to_date
"
"	--Field Visit Report
"
"	    UNION ALL
"
"	    SELECT fvrh_bu AS doc_bu,'FVR' AS vou_type,'FVR' AS sub_vou_type,fvrh_csr_assign_to_plnt AS doc_plnt,fvrh_plnt_loc_id AS doc_plnt_loc_id,
"
"		   fvrh_cre_by AS doc_cre_by,fvrh_cre_date doc_cre_date,fvrh_doc_date doc_date,fvrh_doc_pfx doc_pfx,fvrh_doc_no doc_no,
"
"		   DECODE(fvrh_status,'N','Draft','E','Entry Completed','P','Approved','C','Cancelled') doc_status
"
"	      FROM fld_visit_rpt_hd
"
"	     WHERE fvrh_bu = p_bu
"
"		AND TRUNC (fvrh_cre_date) >= p_fr_date
"
"		AND TRUNC (fvrh_cre_date) <= p_to_date
"
"	--Machine Details
"
"	    UNION ALL
"
"	    SELECT scnthd_bu as doc_bu,'MD' as vou_type,'MD' as sub_vou_type,scnthd_plant as doc_plnt,scnthd_plnt_loc_id as doc_plnt_loc_id,
"
"		   scnthd_cre_by as doc_cre_by,scnthd_cre_date doc_cre_date,scnthd_date doc_date,null doc_pfx,scnthd_doc_no doc_no,
"
"		   DECODE(scnthd_status,'N','Draft','P','Installation pend.','I','Installed','A','Activated','C','Cancelled','E','Entry Completed.')doc_status
"
"	      FROM SERVICE_CONTRACT_HD
"
"             WHERE SCNTHD_BU = p_bu
"
"		AND TRUNC (SCNTHD_CRE_DATE) >= p_fr_date
"
"		AND TRUNC (SCNTHD_CRE_DATE) <= p_to_date
"
"	--wARRANTY AMC
"
"	    UNION ALL
"
"	    SELECT waah_bu AS doc_bu,'AMCW' AS vou_type, 'AMCW' AS sub_vou_type,waah_plnt AS doc_plnt, waah_plnt_loc_id AS doc_plnt_loc_id,
"
"		   waah_cre_by AS doc_cre_by, waah_cre_date doc_cre_date,waah_doc_date doc_date,NULL doc_pfx,waah_doc_no doc_no,
"
"		   DECODE (waah_status,'P', 'Approved', 'N', 'Draft','E', 'Entry Completed','C', 'Cancelled', waah_status)doc_status
"
"	     FROM warr_amc_agrmnt_hd
"
"	    WHERE  waah_bu = p_bu
"
"		AND TRUNC (waah_cre_date) >= p_fr_date
"
"		AND TRUNC (waah_cre_date) <= p_to_date
"
"	--Quotation AMC
"
"	    UNION ALL
"
"	    SELECT cqh_bu as doc_bu,'QAMC' as vou_type,'QAMC' as sub_vou_type, cqh_csr_assign_to_plnt as doc_plnt,cqh_plnt_loc_id as doc_plnt_loc_id,
"
"		   cqh_cre_by as doc_cre_by,cqh_cre_date doc_cre_date,cqh_quote_date  doc_date,   null doc_pfx,cqh_quote_no doc_no,
"
"		   DECODE(cqh_status,'N','Draft','P','Posted','C','Cancelled')  doc_status
"
"	      FROM csd_quote_hd
"
"	     WHERE     cqh_bu = p_bu
"
"		AND TRUNC (cqh_cre_date) >= p_fr_date
"
"		AND TRUNC (cqh_cre_date) <= p_to_date
"
"	--Capex
"
"	    UNION ALL
"
"	    SELECT crh_bu AS doc_bu,'CPRJ' AS vou_type, 'CPRJ' AS sub_vou_type,NULL, NULL,
"
"		   crh_cre_by AS doc_cre_by, crh_cre_date doc_cre_date,crh_doc_date doc_date,NULL doc_pfx,crh_doc_no doc_no,
"
"		   DECODE(crh_status, 'N', 'Draft', 'A', 'Approved','E','Entry Completed') doc_status
"
"	     FROM capex_rqst_hd
"
"	    WHERE  crh_bu = p_bu
"
"		AND TRUNC (crh_cre_date) >= p_fr_date
"
"		AND TRUNC (crh_cre_date) <= p_to_date
"
"	--SO Amend. Multi
"
"	    UNION ALL
"
"	    SELECT samh_bu AS doc_bu,'SOAM' AS vou_type,'SOAM' AS sub_vou_type,samh_plnt AS doc_plnt,samh_plnt_loc_id AS doc_plnt_loc_id,
"
"		   samh_cre_by AS doc_cre_by,samh_cre_date doc_cre_date,samh_doc_date doc_date,samh_doc_pfx doc_pfx,samh_doc_no doc_no,
"
"		   DECODE (samh_status,'A', 'Approved','N', 'Draft','E', 'Entry Completed','C', 'Cancelled',samh_status) doc_status
"
"	      FROM so_amend_multi_hd
"
"	     WHERE samh_bu = p_bu
"
"		AND TRUNC (samh_cre_date) >= p_fr_date
"
"		AND TRUNC (samh_cre_date) <= p_to_date
"
"--HRM
"
"	--Emp. Profile
"
"	    UNION ALL
"
"	    SELECT ephd_bu AS doc_bu,'EPB' AS vou_type,'EPB' AS sub_vou_type,ephd_new_plnt AS doc_plnt,ephd_new_loc_id AS doc_plnt_loc_id,
"
"		   ephd_cre_by AS doc_cre_by,ephd_cre_date AS doc_cre_date,ephd_date AS doc_date,ephd_pfx AS doc_pfx,ephd_doc_no AS doc_no,
"
"		   DECODE(ephd_status,'E','Draft',
"
"                          'N','Confirmed',
"
"                          'A','Approved',
"
"                          'C','Cancelled') AS doc_status
"
"	      FROM emp_profiles_hd
"
"	     WHERE ephd_bu  =  p_bu
"
"		AND TRUNC(ephd_cre_date) >= p_fr_date
"
"		AND TRUNC(ephd_cre_date) <= p_to_date
"
"	--Emp. Releive
"
"	    UNION ALL
"
"	    SELECT emprel_bu AS doc_bu,'ER' AS vou_type,'ER' AS sub_vou_type,NULL AS doc_plnt,NULL AS doc_plnt_loc_id,
"
"		   emprel_cre_by AS doc_cre_by,emprel_cre_date AS doc_cre_date,emprel_doc_date AS doc_date,emprel_pfx AS doc_pfx,emprel_doc_no AS doc_no,
"
"		   DECODE(emprel_status,'N','Draft','E','Entry Completed','A','Approved','C','Cancelled', 'I','FNF Inprogress','R','Relieved',emprel_status) AS doc_status
"
"	      FROM emp_relieve
"
"	     WHERE emprel_bu  =  p_bu
"
"		AND TRUNC(emprel_cre_date) >= p_fr_date
"
"		AND TRUNC(emprel_cre_date) <= p_to_date
"
"	--Emp. Comp. Off
"
"	    UNION ALL
"
"	    SELECT heco_bu AS doc_bu,'CPO' AS vou_type,'CPO' AS sub_vou_type,NULL AS doc_plnt,NULL AS doc_plnt_loc_id,
"
"		   heco_cre_by AS doc_cre_by,heco_cre_date AS doc_cre_date,heco_doc_date AS doc_date,heco_pfx AS doc_pfx,heco_doc_no AS doc_no,
"
"		   DECODE(heco_status,'N','Draft','E','Entry Completed','A','Approved','L','Cancelled',heco_status) AS doc_status
"
"	      FROM hrm_emp_comp_off
"
"	     WHERE heco_bu  =  p_bu
"
"		AND TRUNC(heco_cre_date) >= p_fr_date
"
"		AND TRUNC(heco_cre_date) <= p_to_date
"
"	--Emp. Leave Entry
"
"	    UNION ALL
"
"	    SELECT empleave_bu AS doc_bu,'LE' AS vou_type,'LE' AS sub_vou_type,NULL AS doc_plnt,NULL AS doc_plnt_loc_id,
"
"		   empleave_cre_by AS doc_cre_by,empleave_cre_date AS doc_cre_date,empleave_req_date AS doc_date,empleave_pfx AS doc_pfx,empleave_doc_no AS doc_no,
"
"		   DECODE(empleave_status,'N','Draft','E','Entry Completed','P','Posted','R','Reversed','C','Cancelled','L','Cancelled',empleave_status) AS doc_status
"
"	      FROM employee_leaves
"
"	     WHERE empleave_bu  =  p_bu
"
"		AND TRUNC(empleave_cre_date) >= p_fr_date
"
"		AND TRUNC(empleave_cre_date) <= p_to_date
"
"--FIN
"
"	--Bank Transfer
"
"	    UNION ALL
"
"	    SELECT btrans_bu doc_bu,btrans_vou_type vou_type,btrans_vou_type sub_vou_type,btrans_plant doc_plnt, btrans_plnt_loc_id doc_plnt_loc_id,
"
"		   btrans_cre_by,btrans_cre_date,btrans_pv_date,btrans_ord_pfx,btrans_ord_no,
"
"		   DECODE(btrans_status,'N','Draft','O','Entry Completed','I','Issued','R','Received','C','Cleared','X','Cancelled','V','Void','D','Deleted','S','Posted','P','Approved')btps_doc_status
"
"	      FROM bank_trans_hist_vw
"
"	     WHERE btrans_bu =p_bu
"
"		AND btrans_type  IN ('BT','CT','AD')
"
"		AND TRUNC (NVL(btrans_cre_date,btrans_pv_date)) >= p_fr_date
"
"		AND TRUNC (NVL(btrans_cre_date,btrans_pv_date)) <= p_to_date
"
"	    UNION ALL
"
"	    SELECT btrans_bu doc_bu,btrans_vou_type vou_type,btrans_vou_type  sub_vou_type,btrans_plant doc_plnt, btrans_plnt_loc_id doc_plnt_loc_id,
"
"		   btrans_cre_by,btrans_cre_date,btrans_pv_date,btrans_ord_pfx,btrans_ord_no,
"
"		   DECODE(BTRANS_STATUS,'N','Draft','O','Entry Completed','I','Approved','R','Received','C','Cleared','X','Cancelled','V','Void','D','Deleted','S','Posted')btps_doc_status
"
"	      FROM bank_trans_hist_vw
"
"	     WHERE btrans_bu=p_bu
"
"		AND btrans_type  IN ('JT')
"
"		AND TRUNC (NVL(btrans_cre_date,btrans_pv_date)) >= p_fr_date
"
"		AND TRUNC (NVL(btrans_cre_date,btrans_pv_date)) <= p_to_date
"
"	   UNION ALL
"
"	    SELECT btrans_bu doc_bu, btrans_vou_type vou_type,btrans_vou_type sub_vou_type,
"
"		   btrans_plant doc_plnt,btrans_plnt_loc_id doc_plnt_loc_id,
"
"		   btrans_cre_by,btrans_cre_date,btrans_pv_date,btrans_ord_pfx,btrans_ord_no,
"
"		   DECODE(btrans_status,'N','Draft','O','Entry Completed','I','Approved','R','Received','C','Cleared','X','Cancelled','V','Void','D','Deleted','S','Posted') btps_doc_status
"
"	      FROM bank_trans_hist_vw
"
"	     WHERE btrans_bu = p_bu
"
"		AND btrans_type  IN ('CV')
"
"		AND TRUNC (NVL(btrans_cre_date,btrans_pv_date)) >= p_fr_date
"
"		AND TRUNC (NVL(btrans_cre_date,btrans_pv_date)) <= p_to_date
"
"	    UNION ALL
"
"	    SELECT suphd_bu AS doc_bu,suphd_vou_type AS vou_type,suphd_grn_refer AS sub_vou_type,suphd_plant AS doc_plnt,suphd_plnt_loc_id AS doc_plnt_loc_id,
"
"		   suphd_cre_by AS doc_cre_by,suphd_cre_date doc_cre_date,suphd_doc_date doc_date,suphd_pfx doc_pfx,suphd_doc_no doc_no,
"
"		   DECODE (suphd_status,'N', 'Draft','O', 'Entry Completed','P', 'Approved','C', 'Cancelled','D', 'Deleted',suphd_status) suphd_status
"
"	     FROM suplr_doc_hd_hist_vw1
"
"	    WHERE suphd_bu = p_bu
"
"		AND suphd_doc_type = 'SB'
"
"		AND suphd_doc_no = suphd_src_doc_no
"
"		AND TRUNC (suphd_cre_date) >= p_fr_date
"
"		AND TRUNC (suphd_cre_date) <= p_to_date
"
"		AND suphd_grn_refer NOT IN ('DN','CN')
"
"	--Letter Of Credit
"
"	    UNION ALL
"
"	    SELECT lcd_bu AS doc_bu,'LCR' AS vou_type,'LCR' AS sub_vou_type,lcd_plnt AS doc_plnt,lcd_plnt_loc_id AS doc_plnt_loc_id,
"
"		   lcd_cre_by AS doc_cre_by,lcd_cre_date doc_cre_date,lcd_doc_date doc_date,lcd_doc_pfx doc_pfx,lcd_doc_no doc_no,
"
"		   DECODE (lcd_status ,'N','Draft','A','Active','X','Cancelled','L','Closed','D','Deleted') doc_status
"
"	      FROM letter_credit_doc
"
"	     WHERE lcd_bu = p_bu
"
"		AND lcd_mode = 'R'
"
"		AND TRUNC (lcd_cre_date) >= p_fr_date
"
"		AND TRUNC (lcd_cre_date) <= p_to_date
"
"	--Letter Of Credit Issue
"
"	    UNION ALL
"
"	    SELECT lcd_bu AS doc_bu,'LCI' AS vou_type,'LCI' AS sub_vou_type,lcd_plnt AS doc_plnt,lcd_plnt_loc_id AS doc_plnt_loc_id,
"
"		   lcd_cre_by AS doc_cre_by,lcd_cre_date doc_cre_date,lcd_doc_date doc_date,lcd_doc_pfx doc_pfx,lcd_doc_no doc_no,
"
"		  DECODE (lcd_status ,'N','Draft','A','Active','X','Cancelled','L','Closed','D','Deleted')doc_status
"
"	      FROM letter_credit_doc
"
"	     WHERE lcd_bu = p_bu
"
"		AND lcd_mode = 'I'
"
"		AND TRUNC (lcd_cre_date) >= p_fr_date
"
"		AND TRUNC (lcd_cre_date) <= p_to_date
"
"	--Fixed Asset Reversal
"
"	    UNION ALL
"
"	    SELECT fdrh_bu AS doc_bu,fdrh_vou_type AS vou_type,fdrh_sub_vou_type AS sub_vou_type,fdrh_plnt AS doc_plnt,null AS doc_plnt_loc_id,
"
"		   fdrh_cre_by AS doc_cre_by,fdrh_cre_date doc_cre_date,fdrh_vou_DATE doc_date,fdrh_vou_pfx doc_pfx, fdrh_vou_no doc_no,
"
"		    DECODE(fdrh_status,'N','Draft','A','Approved','E','Entry completed','C','Cancelled',
"
"		    'Y','Not yet converted to FA','F','Converted to FA','X','Closed','T','Terminated','R','Retired',
"
"		    'P','Scrapped','M','Move to Stock','D','Sold') doc_status
"
"	      FROM fa_depr_rev_hd
"
"	     WHERE fdrh_bu = p_bu
"
"		AND TRUNC (fdrh_cre_date) >= p_fr_date
"
"		AND TRUNC (fdrh_cre_date) <= p_to_date
"
"	--Fixed Asset Disposal
"
"	    UNION ALL
"
"	    SELECT fd_bu AS doc_bu,'FAL' AS vou_type, 'FAL' AS sub_vou_type,
"
"		   (SELECT fa_plnt FROM fixed_assets WHERE fa_bu = fd_bu AND fa_asset_id = fd_asset_id FETCH FIRST 1 ROWS ONLY) AS doc_plnt,
"
"		   (SELECT fa_plnt_loc_id FROM fixed_assets WHERE fa_bu = fd_bu AND fa_asset_id = fd_asset_id FETCH FIRST 1 ROWS ONLY) AS doc_plnt_loc_id,
"
"		   fd_cre_by as doc_cre_by, fd_cre_date doc_cre_date,fd_doc_date doc_date,null doc_pfx,fd_doc_no doc_no,
"
"		   DECODE(fd_status,'N','Draft','A','Approved','E','Entry completed','C','Cancelled',fd_status)doc_status
"
"	      FROM fa_disposal
"
"             WHERE  fd_bu = p_bu
"
"		AND TRUNC (fd_cre_date) >= p_fr_date
"
"		AND TRUNC (fd_cre_date) <= p_to_date
"
"	--Fixed Asset
"
"	    UNION ALL
"
"	    SELECT fa_bu AS doc_bu,NVL(fa_vou_type,'FAA') AS vou_type, NVL(fa_sub_vou_type,'FAA') AS sub_vou_type,fa_plnt AS doc_plnt, FA_PLNT_LOC_ID AS doc_plnt_loc_id,
"
"	    fa_cre_by AS doc_cre_by, fa_cre_date doc_cre_date,fa_vou_date doc_date,fa_vou_pfx doc_pfx,fa_vou_no doc_no,
"
"	    DECODE(fa_asset_status,'N','Draft','A','Active','E','Entry completed', 'C','Cancelled', 'Y','Not yet converted to FA','F','Converted to FA', 'X','Closed','T','Terminated', 'R','Retired','P','Scrapped','M','Move to Stock',
"
"		   'D','Sold',fa_asset_status)doc_status
"
"              FROM fixed_assets
"
"             WHERE  fa_bu = p_bu
"
"		AND TRUNC (fa_cre_date) >= p_fr_date
"
"		AND TRUNC (fa_cre_date) <= p_to_date
"
"	--PACKING CREDIT
"
"	    UNION ALL
"
"	    SELECT pcdh_bu AS doc_bu,'PCE' AS vou_type,'PCE' AS sub_vou_type,pcdh_plnt AS doc_plnt,pcdh_gl_plnt_loc_id AS doc_plnt_loc_id,
"
"		   pcdh_cre_by AS doc_cre_by,pcdh_cre_date doc_cre_date,pcdh_doc_date doc_date,pcdh_doc_pfx doc_pfx,pcdh_doc_no doc_no,
"
"		   DECODE (pcdh_status,'A','Approved','N','Draft','C', 'Cancelled',pcdh_status) doc_status
"
"	      FROM pckg_cr_doc_hd
"
"	     WHERE pcdh_bu = p_bu
"
"		AND TRUNC (pcdh_cre_date) >= p_fr_date
"
"		AND TRUNC (pcdh_cre_date) <= p_to_date
"
"	--Closing TB
"
"	    UNION ALL
"
"	    SELECT gjh_bu AS doc_bu,'GJ' AS vou_type,'GJ' AS sub_vou_type,gjh_plnt AS doc_plnt,gjh_src_plnt_loc_id AS doc_plnt_loc_id,
"
"		   gjh_cre_by AS doc_cre_by,gjh_cre_date doc_cre_date,gjh_jrnl_date doc_date,gjh_vou_pfx doc_pfx,gjh_vou_no doc_no,
"
"		   DECODE (gjh_status,'P', 'Approved','N', 'Draft','E', 'Entry Completed','C', 'Cancelled',gjh_status) doc_status
"
"	      FROM cl_tb_mig_hd_temp
"
"	     WHERE gjh_bu = p_bu
"
"		AND TRUNC (gjh_cre_date) >= p_fr_date
"
"		AND TRUNC (gjh_cre_date) <= p_to_date
"
"
"
"	--Recurring Journal
"
"	    UNION ALL
"
"	    SELECT grh_bu AS doc_bu,'RJ' AS vou_type,'RJ' AS sub_vou_type,grh_plant AS doc_plnt,grh_plnt_loc_id AS doc_plnt_loc_id,
"
"		   grh_cre_by AS doc_cre_by,grh_cre_date doc_cre_date,grh_vou_date doc_date,grh_vou_pfx doc_pfx,grh_vou_no doc_no,
"
"		   DECODE (grh_status,'R', 'Active','N', 'Draft','C', 'Cancelled',grh_status) doc_status
"
"	      FROM gl_rcrg_hd
"
"	     WHERE grh_bu = p_bu
"
"		AND TRUNC (grh_cre_date) >= p_fr_date
"
"		AND TRUNC (grh_cre_date) <= p_to_date
"
"
"
"	--Bill of Exchange
"
"	    UNION ALL
"
"	    SELECT boehd_bu AS doc_bu,'BOE' AS vou_type,'BOE' AS sub_vou_type,boehd_plant AS doc_plnt,boehd_plant_loc_id AS doc_plnt_loc_id,
"
"		   boehd_cre_by AS doc_cre_by,boehd_cre_date doc_cre_date,boehd_doc_date doc_date,NULL doc_pfx,boehd_doc_no doc_no,
"
"		   DECODE (boehd_status,'A', 'Active','N', 'Draft','C', 'Cancelled',boehd_status) doc_status
"
"	      FROM boe_hd
"
"	     WHERE boehd_bu = p_bu
"
"		AND TRUNC (boehd_cre_date) >= p_fr_date
"
"		AND TRUNC (boehd_cre_date) <= p_to_date
"
"
"
"	--Bill Discounting
"
"	    UNION ALL
"
"	    SELECT bdhd_bu AS doc_bu,'BD' AS vou_type,'BD' AS sub_vou_type,bdhd_plant AS doc_plnt,bdhd_gl_plnt_loc_id AS doc_plnt_loc_id,
"
"		   bdhd_cre_by AS doc_cre_by,bdhd_cre_date doc_cre_date,bdhd_doc_date doc_date,bdhd_doc_pfx doc_pfx,bdhd_doc_no doc_no,
"
"		   DECODE (bdhd_status,'A', 'Active','N', 'Draft','C','Closed','X', 'Cancelled',bdhd_status) doc_status
"
"	      FROM bills_disc_hd
"
"	     WHERE bdhd_bu = p_bu
"
"		AND TRUNC (bdhd_cre_date) >= p_fr_date
"
"		AND TRUNC (bdhd_cre_date) <= p_to_date
"
"	--FA DEPRECIATION
"
"	    UNION ALL
"
"	    SELECT fdhh_bu AS doc_bu,'FAD' AS vou_type,'FAD' AS sub_vou_type,NULL AS doc_plnt,NULL AS doc_plnt_loc_id,
"
"		   fdhh_cre_by AS doc_cre_by,fdhh_cre_date doc_cre_date,fdhh_cre_date doc_date,fdhh_fam_batch_pfx doc_pfx,fdhh_fam_batch_no doc_no,
"
"		   DECODE (fdlnh_status,'A', 'Approved','E', 'Draft','N', 'Entry Completed','C', 'Cancelled','R','Reversed','P','Posted',fdlnh_status)doc_status
"
"	      FROM fa_depr_hd_hist,fa_depr_ln_hist
"
"	     WHERE fdhh_bu = fdlnh_bu
"
"		AND fdhh_bu = p_bu
"
"		AND fdhh_year = fdlnh_fp_year
"
"		AND fdhh_period        = fdlnh_fp_period
"
"		AND fdhh_fam_batch_no  = fdlnh_fam_batch_no
"
"		AND TRUNC (fdhh_cre_date) >= p_fr_date
"
"		AND TRUNC (fdhh_cre_date) <= p_to_date
"
"		GROUP BY fdhh_bu,fdhh_cre_by,fdhh_cre_date,fdhh_fam_batch_pfx,fdhh_fam_batch_no,fdlnh_status  /*
"
"	    UNION ALL
"
"	    SELECT fa_fp_bu AS doc_bu,'FAD' AS vou_type,'FAD' AS sub_vou_type,NULL AS doc_plnt, NULL AS doc_plnt_loc_id,
"
"		   fa_fadd_cre_by AS doc_cre_by,TRUNC(fa_fadd_cre_date) doc_cre_date,fa_fadd_cre_date doc_date,
"
"		   NULL doc_pfx, fa_fadd_fam_batch_no doc_no,
"
"		   'Draft' doc_status
"
"	      FROM fixed_asset_depr_vw,fin_yr_period_vw
"
"	     WHERE fa_fp_bu         = p_bu
"
"               AND Fp_bu            = fa_fp_bu
"
"               AND Fp_year          = fa_fp_year
"
"               AND Fp_period        = fa_fp_period
"
"	       AND TRUNC (fa_fadd_cre_date) >= p_fr_date
"
"	       AND TRUNC (fa_fadd_cre_date) <= p_to_date
"
"             GROUP BY fa_fp_bu,fa_fadd_cre_by,fa_fadd_cre_date,fa_fadd_fam_batch_no */
"
"
"
"---PMF
"
"	--Production ORDER
"
"	    UNION ALL
"
"	    SELECT prohd_bu doc_bu, 'PRO' vou_type,prohd_type sub_vou_type,prohd_plnt  doc_plnt,prohd_loc_id doc_plnt_loc_id ,
"
"                   prohd_cre_by  doc_cre_by ,prohd_cre_date doc_cre_date ,prohd_date doc_date,prohd_ord_pfx  doc_pfx ,prohd_ord_no doc_no ,
"
"                   DECODE (prohd_status,'E','Unreleased','N','Entry Completed','P','Inprogress','H','On Hold','L','Close Shorted','R','Completed','C','Cancelled')doc_status
"
"	      FROM  prod_order_hd_hist_view
"
"	     WHERE  prohd_bu  = p_bu
"
"		AND  TRUNC(prohd_cre_date)  >= p_fr_date
"
"		AND  TRUNC(prohd_cre_date)  <= p_to_date
"
"	--Rework Order Completion
"
"	    UNION ALL
"
"	    SELECT rwochd_bu doc_bu,'RWC' vou_type,rwochd_ord_type sub_vou_type,rwochd_plnt doc_plnt,rwochd_plnt_loc_id doc_plnt_loc_id,
"
"		   rwochd_cre_by doc_cre_by,rwochd_cre_date doc_cre_date,rwochd_date doc_date,rwochd_comp_pfx doc_pfx,rwochd_doc_no doc_no,
"
"		   decode(rwochd_status, 'N', 'Draft', 'E', 'Entry Completed','F', 'Forwarded to QC', 'Q', 'QC Completed', 'P','Posted', 'A', 'Approved', 'C', 'Cancelled') doc_status
"
"	      FROM rework_order_comp_view
"
"	     WHERE  rwochd_bu   =p_bu
"
"		AND trunc(rwochd_date) >= p_fr_date
"
"		AND trunc(rwochd_date) <= p_to_date
"
"	--BOM
"
"	    UNION ALL
"
"	    SELECT bomhdh_bu doc_bu,'BOM' vou_type,'BOM' sub_vou_type,bomhdh_plnt doc_plnt,
"
"		   (SELECT bupld_loc_id FROM bus_unit_plants_loc_dtls WHERE bupld_bu = bomhdh_bu and bupld_plnt = bomhdh_plnt AND bupld_actv_loc_flag = 'Y' AND bupld_dflt_loc_flag = 'Y') doc_plnt_loc_id,
"
"		   bomhdh_cre_by doc_cre_by,bomhdh_cre_date doc_cre_date,bomhdh_cre_date doc_date,
"
"		   func_find_get_mfg_pfx(bomhdh_bu,(SELECT bupld_loc_id FROM bus_unit_plants_loc_dtls WHERE bupld_bu = bomhdh_bu AND bupld_plnt = bomhdh_plnt AND bupld_actv_loc_flag = 'Y' AND bupld_dflt_loc_flag = 'Y'), bomhdh_plnt,'BOM') doc_pfx,
"
"		   bomhdh_bom_no doc_no,
"
"		   decode (bomhdh_status,'E','Draft','A','Active','N','Entry Completed','I','Inactive','C','Cancelled') doc_status
"
"	      FROM bom_hd_hist
"
"	     WHERE bomhdh_bu =p_bu
"
"		AND  TRUNC(bomhdh_cre_date)  >= p_fr_date
"
"		AND trunc(bomhdh_cre_date) <= p_to_date
"
"
"
"	--Prod Completion
"
"	    UNION ALL
"
"	    SELECT pt_bu AS doc_bu,'PRC' AS vou_type,'PRC' AS sub_vou_type,pt_plnt AS doc_plnt,PT_LOC_ID AS doc_plnt_loc_id,
"
"		   pt_cre_by AS doc_cre_by,pt_cre_date doc_cre_date,pt_date doc_date,
"
"		  --(SELECT DISTINCT apsta_pfx d FROM appl_pfx_sub_types_asso,appl_doc_pfx_loc WHERE apsta_bu = adpl_bu AND apsta_pfx = adpl_pfx AND apsta_bu = p_bu AND apsta_vou_type = 'PRC' AND apsta_sub_type = 'PRC')
"
"		  pt_comp_pfx doc_pfx,
"
"		   pt_trans_no doc_no,
"
"		   decode(pt_status, 'N', 'Draft', 'A', 'Posted', 'C', 'Cancelled','F','Forwarded To QC','Q','QC Completed',pt_status) doc_status
"
"	      FROM prod_trans_hist_view
"
"	     WHERE pt_bu = p_bu
"
"	     AND pt_smd_type IN ('S','T')
"
"		AND trunc(pt_cre_date) >= p_fr_date
"
"		AND trunc(pt_cre_date) <= p_to_date
"
"	--BOM Hist
"
"	    UNION ALL
"
"	    SELECT bomhd_bu doc_bu,'BOM' vou_type,'BOM' sub_vou_type,bomhd_plnt doc_plnt,
"
"		   (SELECT bupld_loc_id FROM bus_unit_plants_loc_dtls WHERE bupld_bu = bomhd_bu and bupld_plnt = bomhd_plnt AND bupld_actv_loc_flag = 'Y' AND bupld_dflt_loc_flag = 'Y') doc_plnt_loc_id,
"
"		   bomhd_cre_by doc_cre_by,bomhd_cre_date doc_cre_date,bomhd_cre_date doc_date,
"
"		   func_find_get_mfg_pfx(bomhd_bu,(SELECT bupld_loc_id FROM bus_unit_plants_loc_dtls WHERE bupld_bu = bomhd_bu AND bupld_plnt = bomhd_plnt AND bupld_actv_loc_flag = 'Y' AND bupld_dflt_loc_flag = 'Y'), bomhd_plnt,'BOM') doc_pfx,
"
"		   bomhd_bom_no doc_no,
"
"		   decode (bomhd_status,'E','Draft','A','Active','N','Entry Completed','I','Inactive','C','Cancelled') doc_status
"
"	      FROM bom_hd
"
"	     WHERE bomhd_bu =p_bu
"
"		AND  TRUNC(bomhd_cre_date) >= p_fr_date
"
"		AND trunc(bomhd_cre_date)  <= p_to_date
"
"	    UNION ALL
"
"	    SELECT mntwotc_bu AS doc_bu,'WOC' AS vou_type,'WOC' AS sub_vou_type,mntwotc_plnt AS doc_plnt,Mntwotc_Loc_Id AS doc_plnt_loc_id,
"
"     mntwotc_cre_by             AS doc_cre_by,
"
"     mntwotc_cre_date           doc_cre_date,
"
"    mntwotc_doc_date           doc_date,
"
"   mntwotc_doc_pfx  doc_pfx,
"
"    mntwotc_doc_no             doc_no,
"
"   DECODE(mntwotc_status,'N','Draft','E','Entry Completed','C','Cancelled','P','Approved','M','Completed','H','Handover')doc_status
"
"FROM
"
"    maint_wo_task_comp_view
"
"WHERE
"
"        mntwotc_bu = p_bu
"
"    AND trunc(mntwotc_doc_date) >= p_fr_date
"
"    AND trunc(mntwotc_doc_date) <= p_to_date
"
"UNION ALL
"
"SELECT
"
"      mntrqst_bu              AS doc_bu,
"
"    'MWR'                   AS vou_type,
"
"    'MWR'                   AS sub_vou_type,
"
"    mntrqst_plnt               AS doc_plnt,
"
"    mntrqst_plnt_loc_id        AS doc_plnt_loc_id,
"
"     mntrqst_cre_by             AS doc_cre_by,
"
"     mntrqst_cre_date           doc_cre_date,
"
"    TRUNC (mntrqst_date)            doc_date,
"
"   (SELECT DISTINCT adp_pfx
"
"                                  FROM appl_doc_prefixes, appl_doc_pfx_loc
"
"                                 WHERE     adp_bu = adpl_bu
"
"                                       AND adp_plnt = adpl_plnt
"
"                                       AND adp_pfx = adpl_pfx
"
"                                       AND adp_doc_type = 'MWR'
"
"                                       AND adp_bu = mntrqst_bu
"
"                                       AND adp_plnt = mntrqst_plnt
"
"                                       AND adpl_loc_id = mntrqst_plnt_loc_id)  doc_pfx,
"
"    mntrqst_rqst_no             doc_no,
"
"    decode(mntrqst_status, 'E','Draft','N','Entry Completed','A','Approved','U','Authorise','C','Cancelled','O','Ordered','L','WO Completed','S','Closeshorted')doc_status
"
"FROM
"
"    maint_request
"
"WHERE
"
"        mntrqst_bu = p_bu
"
"    AND trunc(mntrqst_date) >= p_fr_date
"
"    AND trunc(mntrqst_date) <= p_to_date
"
"UNION ALL
"
"SELECT
"
"      pmsh_bu              AS doc_bu,
"
"    'PMWO'                   AS vou_type,
"
"    'PMWO'                   AS sub_vou_type,
"
"    pmsh_plnt               AS doc_plnt,
"
"    pmsh_loc_id        AS doc_plnt_loc_id,
"
"     pmsh_cre_by             AS doc_cre_by,
"
"     pmsh_cre_date           doc_cre_date,
"
"    TRUNC (pmsh_doc_date)            doc_date,
"
"    (SELECT DISTINCT adp_pfx
"
"                                  FROM appl_doc_prefixes, appl_doc_pfx_loc
"
"                                 WHERE     adp_bu = adpl_bu
"
"                                       AND adp_plnt = adpl_plnt
"
"                                       AND adp_pfx = adpl_pfx
"
"                                       AND adp_doc_type = 'PMWO'
"
"                                       AND adp_bu = pmsh_bu
"
"                                       AND adp_plnt = pmsh_plnt
"
"                                       AND adpl_loc_id = pmsh_loc_id)  doc_pfx,
"
"    pmsh_doc_no             doc_no,
"
"    DECODE(pmsh_status,'N','Draft','I','WO Inprogress','P','Posted','C','Cancelled','A','WO Completed') doc_status
"
"FROM
"
"    pred_mnt_sch_hd
"
"WHERE
"
"        pmsh_bu = p_bu
"
"    AND trunc(pmsh_doc_date) >= p_fr_date
"
"    AND trunc(pmsh_doc_date) <= p_to_date
"
"    --Production Ord. Closeshort
"
"    UNION ALL
"
"    SELECT pocsh_bu AS doc_bu,'PROCL' vou_type,'PROCL' sub_vou_type,pocsh_plnt AS doc_plnt,
"
"  (SELECT bupld_loc_id FROM bus_unit_plants_loc_dtls WHERE bupld_bu = pocsh_bu and bupld_plnt = pocsh_plnt AND bupld_actv_loc_flag = 'Y' AND bupld_dflt_loc_flag = 'Y') doc_plnt_loc_id,
"
"   pocsh_cre_by doc_cre_by,pocsh_cre_date doc_cre_date,pocsh_doc_date doc_date,NULL doc_pfx,pocsh_doc_no doc_no,
"
"   DECODE(pocsh_status,'N','Draft','E','Entry Completed','P','Approved','C','Cancelled') doc_status
"
"  FROM prod_ord_cls_shrt_hd
"
" WHERE pocsh_bu = p_bu
"
"AND TRUNC(pocsh_cre_date) >= p_fr_date
"
"AND TRUNC(pocsh_cre_date) <= p_to_date
"
"UNION ALL
"
"--Meter Reading
"
"SELECT
"
"      emrhd_bu              AS doc_bu,
"
"    'EMR'                   AS vou_type,
"
"    'EMR'                   AS sub_vou_type,
"
"    emrhd_plnt               AS doc_plnt,
"
"    NULL        AS doc_plnt_loc_id,
"
"     emrhd_cre_by             AS doc_cre_by,
"
"     emrhd_cre_date           doc_cre_date,
"
"    TRUNC (emrhd_doc_date)            doc_date,
"
"      (SELECT DISTINCT adp_pfx
"
"                                  FROM appl_doc_prefixes, appl_doc_pfx_loc
"
"                                 WHERE     adp_bu = adpl_bu
"
"                                       AND adp_plnt = adpl_plnt
"
"                                       AND adp_pfx = adpl_pfx
"
"                                       AND adp_doc_type = 'EMR'
"
"                                       AND adp_bu = emrhd_bu
"
"                                       AND adp_plnt = emrhd_plnt
"
"                                       AND adpl_loc_id =
"
"                                              (SELECT Bupld_Loc_Id
"
"                                                 FROM bus_unit_plants_loc_dtls
"
"                                                WHERE bupld_bu = emrhd_bu
"
"                                                      AND bupld_plnt =
"
"                                                             emrhd_plnt
"
"                                                      AND bupld_actv_loc_flag =
"
"                                                             'Y'
"
"                                                      AND bupld_dflt_loc_flag =
"
"                                                             'Y')) doc_pfx,
"
"    emrhd_doc_no             doc_no,
"
"    DECODE( emrhd_status,'N','Draft','P','Posted','C','Cancelled') doc_status
"
"FROM
"
"    eqmpt_meter_reading_hd
"
"WHERE
"
"        emrhd_bu = p_bu
"
"    AND trunc(emrhd_doc_date) >= p_fr_date
"
"    AND trunc(emrhd_doc_date) <= p_to_date
"
"	--
"
"/*	UNION ALL
"
"	 SELECT
"
"      rwochd_bu              AS doc_bu,
"
"    'RWC'                   AS vou_type,
"
"    rwochd_ord_type        AS sub_vou_type,
"
"    rwochd_plnt               AS doc_plnt,
"
"    NULL                     AS doc_plnt_loc_id,
"
"    rwochd_cre_by             AS doc_cre_by,
"
"    rwochd_cre_date           doc_cre_date,
"
"    rwochd_date           doc_date,
"
"    rwochd_comp_pfx       doc_pfx,
"
"    rwochd_doc_no             doc_no,
"
"    decode(rwochd_status, 'N', 'Draft', 'E', 'Entry Completed',
"
"           'C', 'Cancelled','F','Forwarded To QC','Q','QC Completed','A','Approved','P','Posted') doc_status
"
"FROM
"
"    rework_order_comp_view
"
"WHERE
"
"        rwochd_bu = p_bu
"
"    AND trunc(rwochd_date) >= p_fr_date
"
"    AND trunc(rwochd_date) <= p_to_date*/
"
"	    UNION ALL
"
"	    SELECT mrphd_bu  AS doc_bu,'MRR' AS vou_type,'MRR' AS sub_vou_type,mrphd_plnt AS doc_plnt,NULL AS doc_plnt_loc_id,
"
"		   mrphd_cre_by AS doc_cre_by,mrphd_cre_date doc_cre_date,mrphd_date doc_date,NULL doc_pfx,mrphd_mrp_no doc_no,
"
"		   DECODE (mrphd_status,'E','Draft','N','Entry Completed','A','Approved','R','Run','L','Released')  doc_status
"
"	      FROM mrp_hd
"
"	     WHERE mrphd_bu = p_bu
"
"		AND trunc(mrphd_cre_date) >= p_fr_date
"
"		AND trunc(mrphd_cre_date) <= p_to_date
"
"	--Rework Order
"
"	    UNION ALL
"
"	    SELECT rwohd_bu AS doc_bu,'RWO' AS vou_type,rwohd_ord_type AS sub_vou_type,rwohd_plnt AS doc_plnt,rwohd_plnt_loc_id AS doc_plnt_loc_id,
"
"		   rwohd_cre_by AS doc_cre_by,rwohd_cre_date doc_cre_date,rwohd_date doc_date,rwohd_ord_pfx doc_pfx,rwohd_ord_no doc_no,
"
"		   decode(Rwohd_Status, 'E', 'Draft', 'N', 'Entry Completed','L', 'Cancelled','F','Forwarded To QC','A','Approved','C','Completed') doc_status
"
"	      FROM rework_order_dtls_view
"
"	     WHERE rwohd_bu = p_bu
"
"		AND rwohd_ord_type <> 'RCS'
"
"		AND trunc(rwohd_date) >= p_fr_date
"
"		AND trunc(rwohd_date) <= p_to_date
"
"UNION ALL
"
"SELECT
"
"      mntwo_bu              AS doc_bu,
"
"    'MWO'                   AS vou_type,
"
"    'MWO'                   AS sub_vou_type,
"
"    mntwo_plnt               AS doc_plnt,
"
"    mntwo_loc_id                     AS doc_plnt_loc_id,
"
"     mntwo_cre_by             AS doc_cre_by,
"
"     mntwo_cre_date           doc_cre_date,
"
"    mntwo_date           doc_date,
"
"    mntwo_ord_pfx      doc_pfx,
"
"    mntwo_wo_no             doc_no,
"
"    DECODE(mntwo_status,'E','Draft','N','Entry Completed','C','Cancelled','A','Approved','M','Completed','H','Handover')  doc_status
"
"FROM
"
"    maint_work_order_vw
"
"WHERE
"
"        mntwo_bu = p_bu
"
"    AND trunc(mntwo_cre_date) >= p_fr_date
"
"    AND trunc(mntwo_cre_date) <= p_to_date
"
"	--SHEARING
"
"	UNION ALL
"
"	SELECT
"
"    pcph_bu              AS doc_bu,
"
"    'SH'                   AS vou_type,
"
"    'SH'                   AS sub_vou_type,
"
"    pcph_plnt               AS doc_plnt,
"
"    pcph_loc_id                     AS doc_plnt_loc_id,
"
"    pcph_cre_by             AS doc_cre_by,
"
"    pcph_cre_date           doc_cre_date,
"
"    pcph_doc_date           doc_date,
"
"    pcph_comp_pfx              doc_pfx,
"
"    pcph_doc_no             doc_no,
"
"    DECODE(Pcph_Status,'N','Draft','E','Entry Completed','C','Cancelled','P','Posted','Q','QC Completed','L','Partial','F','Forwarded To QC',Pcph_Status)  doc_status
"
"FROM
"
"    prod_cut_proc_hd
"
"WHERE
"
"        pcph_bu = p_bu
"
"    AND trunc(pcph_doc_date) >= p_fr_date
"
"    AND trunc(pcph_doc_date) <= p_to_date
"
"UNION ALL
"
"SELECT
"
"    wchd_bu              AS doc_bu,
"
"    'WDC'                   AS vou_type,
"
"    'WDC'                   AS sub_vou_type,
"
"    wchd_plnt               AS doc_plnt,
"
"    NULL                     AS doc_plnt_loc_id,
"
"    wchd_cre_by             AS doc_cre_by,
"
"    wchd_cre_date           doc_cre_date,
"
"    wchd_cre_date           doc_date,
"
"    (SELECT apsta_pfx
"
"      FROM appl_pfx_sub_types_asso,appl_doc_pfx_loc
"
"     WHERE apsta_bu = adpl_bu
"
"       AND apsta_pfx = adpl_pfx
"
"       AND apsta_bu = p_bu
"
"       AND apsta_vou_type = 'WDC'
"
"       AND apsta_sub_type = 'WDC'
"
"       AND adpl_dflt_loc = 'Y'
"
"       AND rownum = 1 )              doc_pfx,
"
"    wchd_clndr_no             doc_no,
"
"   DECODE (wchd_status,'A','Active','I','Inactive','N','Draft')  doc_status
"
"FROM
"
"    workday_calendar_hd
"
"WHERE
"
"        wchd_bu = p_bu
"
"    AND trunc(wchd_cre_date) >= p_fr_date
"
"    AND trunc(wchd_cre_date) <= p_to_date/*
"
"	--Daily Plan
"
"	    UNION ALL
"
"	    SELECT cadph_bu AS doc_bu,'CADP' AS vou_type,'CADP' AS sub_vou_type,cadph_plnt AS doc_plnt,cadph_loc_id AS doc_plnt_loc_id,cadph_cre_by AS doc_cre_by,cadph_cre_date doc_cre_date,
"
"		   cadph_doc_date doc_date,NULL doc_pfx,cadph_doc_no doc_no,
"
"		   DECODE(cadph_status,'N','Draft','P','Posted','L','Cancelled') doc_status
"
"	      FROM cast_ally_daily_plan_hd
"
"	     WHERE cadph_bu = p_bu
"
"		AND TRUNC(cadph_cre_date) >= p_fr_date
"
"		AND TRUNC(cadph_cre_date) <= p_to_date
"
"	--Mixing
"
"	    UNION ALL
"
"	    SELECT camh_bu AS doc_bu,'CAMIX' AS vou_type,'CAMIX' AS sub_vou_type,camh_plnt AS doc_plnt,camh_loc_id AS doc_plnt_loc_id,camh_cre_by AS doc_cre_by,camh_cre_date doc_cre_date,
"
"		   camh_doc_date doc_date,NULL doc_pfx,camh_doc_no doc_no,
"
"		   DECODE(camh_status,'E','Draft','N','Entry Completed','P','Posted','L','Cancelled') doc_status
"
"	      FROM cast_alloy_mix_hd
"
"	     WHERE camh_bu = p_bu
"
"		AND TRUNC(camh_cre_date) >= p_fr_date
"
"		AND TRUNC(camh_cre_date) <= p_to_date
"
"	--Sleeve Inprocess
"
"	    UNION ALL
"
"	    SELECT caish_bu AS doc_bu,'CASI' AS vou_type,'CASI' AS sub_vou_type,caish_plnt AS doc_plnt,caish_loc_id AS doc_plnt_loc_id,caish_cre_by AS doc_cre_by,caish_cre_date doc_cre_date,
"
"		   caish_doc_date doc_date,NULL doc_pfx,caish_doc_no doc_no,
"
"		   DECODE(caish_status,'E','Draft','P','Posted','C','Cancelled') doc_status
"
"	      FROM cast_ally_inp_slv_hd
"
"	     WHERE caish_bu = p_bu
"
"		AND TRUNC(caish_cre_date) >= p_fr_date
"
"		AND TRUNC(caish_cre_date) <= p_to_date
"
"	--FG Packing
"
"	    UNION ALL
"
"	    SELECT caph_bu AS doc_bu,'CAFG' AS vou_type,'CAFG' AS sub_vou_type,caph_plnt AS doc_plnt,caph_loc_id AS doc_plnt_loc_id,caph_cre_by AS doc_cre_by,caph_cre_date doc_cre_date,
"
"		   caph_doc_date doc_date,NULL doc_pfx,caph_doc_no doc_no,
"
"		   DECODE(caph_status,'N','Draft','P','Posted','C','Cancelled') doc_status
"
"	      FROM cast_ally_pack_hd
"
"	     WHERE caph_bu = p_bu
"
"		AND TRUNC(caph_cre_date) >= p_fr_date
"
"		AND TRUNC(caph_cre_date) <= p_to_date*/
"
"	--Project Expense
"
"	    UNION ALL
"
"	    SELECT pxdh_bu AS doc_bu,'PE' AS vou_type,'PE' AS sub_vou_type,pxdh_plnt AS doc_plnt,
"
"		  (SELECT bupld_loc_id FROM bus_unit_plants_loc_dtls WHERE bupld_bu = pxdh_bu and bupld_plnt = pxdh_plnt AND bupld_actv_loc_flag = 'Y' AND bupld_dflt_loc_flag = 'Y') doc_plnt_loc_id,
"
"		   pxdh_cre_by doc_cre_by,pxdh_cre_date doc_cre_date,pxdh_date doc_date,NULL doc_pfx,pxdh_doc_no doc_no,
"
"		   DECODE(pxdh_status,'E','Draft','N','Entry Completed','P','Approved','C','Cancelled') doc_status
"
"	      FROM proj_xpns_doc_hd
"
"	     WHERE pxdh_bu = p_bu
"
"		AND TRUNC(pxdh_cre_date) >= p_fr_date
"
"		AND TRUNC(pxdh_cre_date) <= p_to_date
"
"	--Project Workday Calendar
"
"	    UNION ALL
"
"	    SELECT prjwchd_bu AS doc_bu,'PWDC' vou_type,'PWDC' sub_vou_type,prjwchd_plnt AS doc_plnt,
"
"		  (SELECT bupld_loc_id FROM bus_unit_plants_loc_dtls WHERE bupld_bu = prjwchd_bu and bupld_plnt = prjwchd_plnt AND bupld_actv_loc_flag = 'Y' AND bupld_dflt_loc_flag = 'Y') doc_plnt_loc_id,
"
"		   prjwchd_cre_by doc_cre_by,prjwchd_cre_date doc_cre_date,prjwchd_cre_date doc_date,NULL doc_pfx,prjwchd_clndr_no doc_no,
"
"		   DECODE(prjwchd_status,'N','Draft','A','Active') doc_status
"
"	      FROM proj_workday_calendar_hd
"
"	     WHERE prjwchd_bu = p_bu
"
"		AND TRUNC(prjwchd_cre_date) >= p_fr_date
"
"		AND TRUNC(prjwchd_cre_date) <= p_to_date
"
"	--Project Cost Budget
"
"	    UNION ALL
"
"	    SELECT pcbh_bu AS doc_bu,'PCB' vou_type,'PCB' sub_vou_type,pcbh_plnt AS doc_plnt,
"
"		  (SELECT bupld_loc_id FROM bus_unit_plants_loc_dtls WHERE bupld_bu = pcbh_bu and bupld_plnt = pcbh_plnt AND bupld_actv_loc_flag = 'Y' AND bupld_dflt_loc_flag = 'Y') doc_plnt_loc_id,
"
"		   pcbh_cre_by doc_cre_by,pcbh_cre_date doc_cre_date,pcbh_date doc_date,NULL doc_pfx,pcbh_doc_no doc_no,
"
"		   DECODE(pcbh_status,'N','Draft','E','Entry Completed','A','Approved','R','Revised','C','Cancelled') doc_status
"
"	      FROM proj_cost_budget_hd
"
"	     WHERE pcbh_bu = p_bu
"
"		AND TRUNC(pcbh_cre_date) >= p_fr_date
"
"		AND TRUNC(pcbh_cre_date) <= p_to_date
"
"	--Project Employee Time Card
"
"	    UNION ALL
"
"	    SELECT petch_bu AS doc_bu,'PETC' vou_type,'PETC' sub_vou_type,petch_plnt AS doc_plnt,petch_loc_id doc_plnt_loc_id,
"
"		   petch_cre_by doc_cre_by,petch_cre_date doc_cre_date,petch_date doc_date,NULL doc_pfx,petch_doc_no doc_no,
"
"		   DECODE(petch_status,'A','Approved','E','Draft','C','Cancelled','P','Posted') doc_status
"
"	      FROM proj_emp_time_card_hd
"
"	     WHERE petch_bu = p_bu
"
"		AND TRUNC(petch_cre_date) >= p_fr_date
"
"		AND TRUNC(petch_cre_date) <= p_to_date
"
"	--Project Resource Usage
"
"	    UNION ALL
"
"	    SELECT pruh_bu AS doc_bu,'PRU' vou_type,'PRU' sub_vou_type,pruh_plnt AS doc_plnt,
"
"		  (SELECT bupld_loc_id FROM bus_unit_plants_loc_dtls WHERE bupld_bu = pruh_bu and bupld_plnt = pruh_plnt AND bupld_actv_loc_flag = 'Y' AND bupld_dflt_loc_flag = 'Y') doc_plnt_loc_id,
"
"		   pruh_cre_by doc_cre_by,pruh_cre_date doc_cre_date,pruh_date doc_date,NULL doc_pfx,pruh_doc_no doc_no,
"
"		   DECODE(PRUH_STATUS,'E','Draft','N','Entry Completed','P','Approved','C','Cancelled') doc_status
"
"	      FROM proj_res_usage_hd
"
"	     WHERE pruh_bu = p_bu
"
"		AND TRUNC(pruh_cre_date) >= p_fr_date
"
"		AND TRUNC(pruh_cre_date) <= p_to_date
"
"	--Repair Work Order
"
"	    UNION ALL
"
"	    SELECT rwohd_bu AS doc_bu,'RWO' AS vou_type,'RCS' AS sub_vou_type,rwohd_plnt AS doc_plnt,rwohd_plnt_loc_id doc_plnt_loc_id,
"
"		   rwohd_cre_by doc_cre_by,rwohd_cre_date doc_cre_date,rwohd_date doc_date,NULL doc_pfx,rwohd_ord_no doc_no,
"
"		   DECODE(rwohd_status,'E','Draft','N','Entry Completed','A','Approved','L','Cancelled','C','Completed') doc_status
"
"	      FROM rework_order_dtls_view
"
"             WHERE rwohd_bu = p_bu
"
"		 AND rwohd_ord_type = 'RCS'
"
"		 AND TRUNC(rwohd_cre_date) >= p_fr_date
"
"		 AND TRUNC(rwohd_cre_date) <= p_to_date
"
"	--Repair Work Order Completion
"
"	    UNION ALL
"
"	    SELECT rwochd_bu doc_bu,'CSWC' vou_type,'RCCS' sub_vou_type,rwochd_plnt doc_plnt,rwochd_plnt_loc_id doc_plnt_loc_id,
"
"		   rwochd_cre_by doc_cre_by,rwochd_cre_date doc_cre_date,rwochd_date doc_date,rwochd_comp_pfx doc_pfx,rwochd_doc_no doc_no,
"
"		   decode(rwochd_status, 'N', 'Draft', 'E', 'Entry Completed','F', 'Forwarded to QC', 'Q', 'QC Completed', 'P','Posted', 'A', 'Approved', 'C', 'Cancelled') doc_status
"
"	      FROM rework_order_comp_view
"
"	     WHERE  rwochd_bu   = p_bu
"
"	         AND rwochd_ord_type ='RCCS'
"
"		 AND trunc(rwochd_cre_date) >= p_fr_date
"
"		 AND trunc(rwochd_cre_date) <= p_to_date
"
"---GATE ENTRY
"
"	    UNION ALL
"
"            SELECT gehd_bu,'GEN','GEN',gehd_plnt,gehd_plnt_loc_id,gehd_cre_by,gehd_cre_date,
"
"		   gehd_date,NULL,gehd_doc_no,
"
"		   DECODE(gehd_status , 'N','Draft','C','Correction','I','Inwarded','E','Cancelled','L','Completed','W','Weigh Bridge Moved','O','Weigh Bridge Completed') doc_status
"
"	      FROM gate_entry_hd
"
"	     WHERE gehd_bu = p_bu
"
"		AND TRUNC(gehd_cre_date) >= p_fr_date
"
"		AND TRUNC(gehd_cre_date) <= p_to_date
"
"--WFM
"
"	--Authorization Change Process
"
"	    UNION ALL
"
"	    SELECT wacrh_bu,'ACR','ACRP',wacrh_plnt,wacrh_plnt_loc_id,wacrh_cre_by,wacrh_cre_date,
"
"	           warch_doc_date,warch_doc_prefix,wacrh_doc_no,
"
"		   DECODE(wacrh_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled',wacrh_status) doc_status
"
"	      FROM wf_authorization_change_req_hd
"
"	     WHERE wacrh_bu = p_bu
"
"	       AND TRUNC(wacrh_cre_date) >= p_fr_date
"
"	       AND TRUNC(wacrh_cre_date) <= p_to_date
"
"	       AND wacrh_chng_req_type ='P'
"
"	--Authorization Change Request
"
"	    UNION ALL
"
"	    SELECT wacrh_bu,'ACR','ACRE',wacrh_plnt,wacrh_plnt_loc_id,wacrh_cre_by,wacrh_cre_date,
"
"	           warch_doc_date,warch_doc_prefix,wacrh_doc_no,
"
"		   DECODE(wacrh_status,'E','Draft','N','Entry Completed','A','Approved','C','Cancelled',wacrh_status) doc_status
"
"	      FROM wf_authorization_change_req_hd
"
"	     WHERE wacrh_bu = p_bu
"
"	       AND TRUNC(wacrh_cre_date) >= p_fr_date
"
"	       AND TRUNC(wacrh_cre_date) <= p_to_date
"
"	       AND wacrh_chng_req_type <> 'P'
"
"	   )
"
"	WHERE vou_type IN ('FAD','MRR') OR EXISTS(SELECT 1 FROM dly_mod_plnt WHERE dmp_bu = p_bu AND dmp_user = p_user AND dmp_sel_flag = 'Y' AND dmp_plnt = doc_plnt);
"
"
"
"    FORALL indx IN 1..r_dt_vou.COUNT
"
"      INSERT INTO dly_user_mod_vou_dtls VALUES r_dt_vou(indx);
"
"
"
"   /* INSERT INTO dly_user_mod_trans(dumt_bu,
"
"                                   dumt_user,
"
"				   dumt_seq_no,
"
"				   dumt_sub_vou_type,
"
"				   dumt_vou_type,
"
"				   dumt_plnt,
"
"				   dumt_vou_cre_user,
"
"				   dumt_tot_cnt,
"
"				   dumt_cre_by,
"
"				   dumt_cre_date
"
"				  )
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
"     GROUP BY dmtv.dumvd_bu,dmtv.dumvd_sub_vou_type,dmtv.dumvd_vou_type,dmtv.dumvd_vou_plnt,dmtv.dumvd_vou_cre_by,avt.apt_seq,avst.apst_print_seq_no;*/
"
"
"
"/*
"
"
"
"    SELECT ROW_NUMBER() OVER (ORDER BY avt.apt_seq,avst.apst_print_seq_no) AS seqno,
"
"           dmtv.dumvd_sub_vou_type,func_find_sub_vou_type_desc(dmtv.dumvd_bu,dmtv.dumvd_sub_vou_type) dumvd_sub_vou_type_desc,
"
"	   dmtv.dumvd_vou_type,func_find_vou_type_desc(dmtv.dumvd_bu,dmtv.dumvd_vou_type) dumvd_vou_type_desc,
"
"	   COUNT(dmtv.dumvd_vou_no) tot_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 1 THEN 1 ELSE 0 END) apr_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 2 THEN 1 ELSE 0 END) may_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 3 THEN 1 ELSE 0 END) jun_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 4 THEN 1 ELSE 0 END) jul_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 5 THEN 1 ELSE 0 END) aug_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 6 THEN 1 ELSE 0 END) sep_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 7 THEN 1 ELSE 0 END) oct_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 8 THEN 1 ELSE 0 END) nov_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 9 THEN 1 ELSE 0 END) dec_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 10 THEN 1 ELSE 0 END) jan_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 11 THEN 1 ELSE 0 END) feb_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 12 THEN 1 ELSE 0 END) mar_cnt
"
"      FROM dly_user_mod_vou_dtls dmtv,fin_periods fp,appl_vou_sub_types avst,appl_pfx_types avt
"
"     WHERE fp.fp_bu = dmtv.dumvd_bu
"
"       AND TRUNC(dmtv.dumvd_vou_date) BETWEEN fp.fp_from_date AND fp.fp_end_date
"
"       AND dmtv.dumvd_bu = avst.apst_bu(+)
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
"     GROUP BY dmtv.dumvd_bu,dmtv.dumvd_sub_vou_type,dmtv.dumvd_vou_type,avt.apt_seq,avst.apst_print_seq_no;
"
"
"
"    SELECT ROW_NUMBER() OVER (ORDER BY avt.apt_seq) AS seqno,
"
"	   dmtv.dumvd_vou_type,func_find_vou_type_desc(dmtv.dumvd_bu,dmtv.dumvd_vou_type) dumvd_vou_type_desc,
"
"	   COUNT(dmtv.dumvd_vou_no) tot_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 1 THEN 1 ELSE 0 END) apr_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 2 THEN 1 ELSE 0 END) may_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 3 THEN 1 ELSE 0 END) jun_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 4 THEN 1 ELSE 0 END) jul_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 5 THEN 1 ELSE 0 END) aug_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 6 THEN 1 ELSE 0 END) sep_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 7 THEN 1 ELSE 0 END) oct_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 8 THEN 1 ELSE 0 END) nov_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 9 THEN 1 ELSE 0 END) dec_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 10 THEN 1 ELSE 0 END) jan_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 11 THEN 1 ELSE 0 END) feb_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 12 THEN 1 ELSE 0 END) mar_cnt
"
"      FROM dly_user_mod_vou_dtls dmtv,fin_periods fp,appl_pfx_types avt
"
"     WHERE fp.fp_bu = dmtv.dumvd_bu
"
"       AND TRUNC(dmtv.dumvd_vou_date) BETWEEN fp.fp_from_date AND fp.fp_end_date
"
"       AND dmtv.dumvd_bu = avt.apt_bu(+)
"
"       AND dmtv.dumvd_vou_type = avt.apt_pfx_type(+)
"
"       AND dmtv.dumvd_bu = p_bu
"
"       AND dmtv.dumvd_user = p_user
"
"     GROUP BY dmtv.dumvd_bu,dmtv.dumvd_vou_type,avt.apt_seq;
"
"
"
"    SELECT ROW_NUMBER() OVER (ORDER BY dmtv.dumvd_vou_cre_by) AS seqno,
"
"	   dmtv.dumvd_vou_cre_by,
"
"	   COUNT(dmtv.dumvd_vou_no) tot_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 1 THEN 1 ELSE 0 END) apr_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 2 THEN 1 ELSE 0 END) may_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 3 THEN 1 ELSE 0 END) jun_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 4 THEN 1 ELSE 0 END) jul_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 5 THEN 1 ELSE 0 END) aug_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 6 THEN 1 ELSE 0 END) sep_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 7 THEN 1 ELSE 0 END) oct_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 8 THEN 1 ELSE 0 END) nov_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 9 THEN 1 ELSE 0 END) dec_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 10 THEN 1 ELSE 0 END) jan_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 11 THEN 1 ELSE 0 END) feb_cnt,
"
"	   SUM(CASE WHEN fp.fp_period = 12 THEN 1 ELSE 0 END) mar_cnt
"
"      FROM dly_user_mod_vou_dtls dmtv,fin_periods fp
"
"     WHERE fp.fp_bu = dmtv.dumvd_bu
"
"       AND TRUNC(dmtv.dumvd_vou_date) BETWEEN fp.fp_from_date AND fp.fp_end_date
"
"       AND dmtv.dumvd_bu = p_bu
"
"       AND dmtv.dumvd_user = p_user
"
"     GROUP BY dmtv.dumvd_bu,dmtv.dumvd_vou_cre_by;
"
"
"
"*/
"
"
"
"  END proc_ins_daily_trans_log;
"
"
"
"END pkg_daily_trans;"
/
