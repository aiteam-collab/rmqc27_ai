CREATE OR REPLACE
"PACKAGE BODY pkg_prodn_work_flow_doc
"
"IS
"
"
"
"
"
"	PROCEDURE proc_post_bulk_doc(p_bu            	VARCHAR2,
"
"								 p_plnt          	VARCHAR2,
"
"								 p_doc_no        	VARCHAR2,
"
"								 p_date				DATE,
"
"								 p_user          	VARCHAR2,
"
"								 p_type				VARCHAR2,
"
"								 p_res        OUT   VARCHAR2,
"
"								 p_res1	      OUT	VARCHAR2,
"
"								 p_qc_doc_no  OUT 	VARCHAR2
"
"								 )
"
"	IS
"
"	var_qc_res		VARCHAR2(4000);
"
"	v_shift_doc_no		VARCHAR2(4000);
"
"	v_shift_mr_no		VARCHAR2(4000);
"
"	v_notify_life 		VARCHAR2(4000);
"
"	v_stop_life		VARCHAR2(4000);
"
"	BEGIN
"
"		--RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"
"
"
"
"		proc_cre_prod_bulk_compl_new(
"
"									p_bu     ,
"
"									p_plnt   ,
"
"									p_doc_no ,
"
"									p_date		,
"
"									p_user   ,
"
"									p_type	,
"
"									p_res    ,
"
"									p_res1	,
"
"									var_qc_res,
"
"									v_shift_doc_no,
"
"									v_shift_mr_no,
"
"									v_notify_life,
"
"									v_stop_life
"
"									);
"
"
"
"		p_qc_doc_no := var_qc_res;
"
"
"
"	END proc_post_bulk_doc;
"
"
"
"	PROCEDURE proc_prodn_non_qc_doc (
"
"								   p_bu               VARCHAR2,
"
"								   p_plnt             VARCHAR2,
"
"								   p_trans_no         VARCHAR2,
"
"								   p_date	      DATE,
"
"								   p_user             VARCHAR2,
"
"								   p_lang             NUMBER,
"
"								   p_prod_ord_no	  VARCHAR2,
"
"								   p_result       OUT VARCHAR2,
"
"								   p_dc_grn_no    OUT VARCHAR2,
"
"								   p_pend_trans   OUT VARCHAR2,
"
"								   p_took_life    OUT VARCHAR2
"
"								   )
"
"    IS
"
"	v_res		VARCHAR2(4000);
"
"	v_res1		VARCHAR2(4000);
"
"	v_res2		VARCHAR2(4000);
"
"	v_notify_life  VARCHAR2(4000);
"
"	v_stop_life 	 VARCHAR2(4000);
"
"
"
"	BEGIN
"
"		/*	 proc_upd_comp_sf_stocks(
"
"						 p_bu,
"
"						 p_plnt,
"
"						 p_date,
"
"						 p_prod_ord_no,
"
"						 p_trans_no,
"
"						 p_user,
"
"						 v_res1
"
"						 );*/
"
"
"
"
"
"
"
"		       proc_prodn_transfer_approve (
"
"						   p_bu          ,
"
"						   p_plnt        ,
"
"						   p_trans_no    ,
"
"						   p_user        ,
"
"						   p_lang        ,
"
"						   p_result      ,
"
"						   p_dc_grn_no   ,
"
"						   p_pend_trans  ,
"
"						   p_took_life,
"
"						   v_notify_life,
"
"						   v_stop_life
"
"						   );
"
"
"
"			IF p_result = 'Y'  THEN
"
"
"
"					UPDATE prod_transfer
"
"					   SET pt_status	= 'A',
"
"						   pt_upd_by	= p_user,
"
"						   pt_upd_date	= SYSDATE
"
"					 WHERE pt_bu		= p_bu
"
"					   AND pt_plnt		= p_plnt
"
"					   AND pt_trans_no	= p_trans_no;
"
"
"
"				     proc_delete_prod_comp_rec (
"
"								 p_bu,
"
"								 p_plnt,
"
"								 p_trans_no,
"
"								 p_prod_ord_no,
"
"								 p_user
"
"								);
"
"
"
"			     /* Primary and Secondary Rejection */
"
"
"
"				      proc_cre_rwk_frm_prod_comp(p_bu,
"
"								 p_plnt,
"
"								 p_trans_no,
"
"								 p_user,
"
"								 v_res
"
"								 );
"
"
"
"
"
"				/* Pre process Rejection */
"
"
"
"				    proc_cre_ppr_frm_prod_comp(p_bu,
"
"							       p_plnt,
"
"							       p_trans_no,
"
"							       p_user,
"
"							       v_res2
"
"							       );
"
"
"
"			END IF;
"
"
"
"	END proc_prodn_non_qc_doc;
"
"
"
"
"
"
"
"
"
"
"
"	PROCEDURE proc_non_prodn_approve (
"
"									 p_bu			VARCHAR2,
"
"									 p_plnt			VARCHAR2,
"
"									 p_trans_no		VARCHAR2,
"
"									 p_doc_no		VARCHAR2,
"
"									 p_date			DATE,
"
"									 p_user			VARCHAR2
"
"									 )
"
"	IS
"
"	BEGIN
"
"
"
"
"
"
"
"			proc_mass_prodn_approve (p_bu		,
"
"			                         p_plnt		,
"
"			                         p_trans_no	,
"
"			                         p_doc_no	,
"
"									 p_date		,
"
"									 p_user
"
"									 );
"
"
"
"
"
"	END proc_non_prodn_approve;
"
"
"
"	PROCEDURE proc_cre_qc_doc(
"
"							 p_bu                   VARCHAR2,
"
"							 p_plnt                 VARCHAR2,
"
"							 p_trans_no             VARCHAR2,
"
"							 p_date			DATE ,
"
"							 p_prod_no              VARCHAR2,
"
"							 p_prod_id              VARCHAR2,
"
"							 p_prod_rev             NUMBER,
"
"							 p_user                 VARCHAR2,
"
"							 p_mode                 VARCHAR2,
"
"							 p_lang		   	NUMBER,
"
"							 p_res          OUT     VARCHAR2,
"
"							 p_qc_no        OUT     VARCHAR2
"
"							 )
"
"    IS
"
"
"
"
"
"    var_qc_res			VARCHAR2(2000);
"
"    v_res1			VARCHAR2(2000);
"
"
"
"	BEGIN
"
"	         proc_upd_comp_sf_stocks(
"
"					 p_bu,
"
"					 p_plnt,
"
"					 p_date,
"
"					 p_prod_no,
"
"					 p_trans_no,
"
"					 p_user,
"
"					 v_res1
"
"				         );
"
"
"
"		proc_ins_qc_doc_sf_trans (
"
"		                        p_bu       ,
"
"		                        p_plnt     ,
"
"		                        p_trans_no ,
"
"		                        p_prod_no  ,
"
"		                        p_prod_id  ,
"
"		                        p_prod_rev ,
"
"		                        p_user     ,
"
"		                        p_mode     ,
"
"		                        p_lang	   ,
"
"		                        p_res 	   ,
"
"		                        p_qc_no
"
"		                        );
"
"
"
"	END proc_cre_qc_doc;
"
"
"
"END;"
/
