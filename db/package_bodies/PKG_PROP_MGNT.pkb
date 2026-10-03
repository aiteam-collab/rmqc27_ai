CREATE OR REPLACE
"PACKAGE BODY pkg_prop_mgnt
"
"AS
"
"	PROCEDURE proc_cust_coll(p_bu           VARCHAR2,
"
"							 p_from_date    DATE,
"
"							 p_to_date      DATE,
"
"							 p_type         VARCHAR2,
"
"							 p_user         VARCHAR2)
"
"   IS
"
"
"
"  v_bud_amt     NUMBER(18,3);
"
"  v_recvd_amt   NUMBER(18,3);
"
"	BEGIN
"
"    DELETE temp_prop_mgmt WHERE tpm_bu = p_bu AND tpm_cre_by = p_user;
"
"
"
"	  INSERT INTO temp_prop_mgmt(tpm_bu,
"
"								tpm_seq_no,
"
"								tpm_si_no,
"
"								tpm_print_seq_no,
"
"								tpm_acct,
"
"								tpm_acct_desc,
"
"								tpm_bud_amt,
"
"								tpm_recvd_amt,
"
"								tpm_lgr_bal,
"
"								tpm_cre_by,
"
"								tpm_cre_date)
"
"						 VALUES(p_bu,
"
"								1,
"
"								'A',
"
"								NULL,
"
"								NULL,
"
"								'Initial Collection-On Flat Registration',
"
"								NULL,
"
"								NULL,
"
"								NULL,
"
"								p_user,
"
"								sysdate);
"
"
"
"	 INSERT INTO temp_prop_mgmt(tpm_bu,
"
"								tpm_seq_no,
"
"								tpm_si_no,
"
"								tpm_print_seq_no,
"
"								tpm_acct,
"
"								tpm_acct_desc,
"
"								tpm_bud_amt,
"
"								tpm_recvd_amt,
"
"								tpm_lgr_bal,
"
"								tpm_cre_by,
"
"								tpm_cre_date)
"
"						 SELECT p_bu,
"
"								2,
"
"								'1',
"
"								'1',
"
"								'APE',
"
"								'Maintenance (3 Years)',
"
"								pmv_net_rcvd_amt,
"
"								pmv_bc_amt,
"
"								0,
"
"								p_user,
"
"								sysdate
"
"						   FROM(SELECT SUM(pmv_net_rcvd_amt) pmv_net_rcvd_amt,
"
"									   SUM(pmv_bc_amt) pmv_bc_amt
"
"						           FROM proprty_mgmt_vw
"
"								  WHERE pmv_bu = p_bu
"
"								    AND ((pmv_pv_date BETWEEN p_from_date AND p_to_date) OR pmv_pv_date IS NULL)
"
"									AND pmv_param_id = 'M');
"
"
"
"	 INSERT INTO temp_prop_mgmt(tpm_bu,
"
"								tpm_seq_no,
"
"								tpm_si_no,
"
"								tpm_print_seq_no,
"
"								tpm_acct,
"
"								tpm_acct_desc,
"
"								tpm_bud_amt,
"
"								tpm_recvd_amt,
"
"								tpm_lgr_bal,
"
"								tpm_cre_by,
"
"								tpm_cre_date)
"
"						 SELECT p_bu,
"
"								3,
"
"								'2',
"
"								'2',
"
"								pmv_acct,
"
"								pmv_acct_class_desc,
"
"								pmv_net_rcvd_amt,
"
"								pmv_bc_amt,
"
"								0,
"
"								p_user,
"
"								sysdate
"
"						   FROM(SELECT SUM(pmv_net_rcvd_amt) pmv_net_rcvd_amt,
"
"									   SUM(pmv_bc_amt) pmv_bc_amt,
"
"									   pmv_acct,
"
"									   pmv_acct_class_desc
"
"						           FROM proprty_mgmt_vw
"
"								  WHERE pmv_bu = p_bu
"
"								    AND ((pmv_pv_date BETWEEN p_from_date AND p_to_date) OR pmv_pv_date IS NULL)
"
"									AND pmv_param_id = 'BWSSB'
"
"							   GROUP BY pmv_acct,pmv_acct_class_desc);
"
"
"
"	 INSERT INTO temp_prop_mgmt(tpm_bu,
"
"								tpm_seq_no,
"
"								tpm_si_no,
"
"								tpm_print_seq_no,
"
"								tpm_acct,
"
"								tpm_acct_desc,
"
"								tpm_bud_amt,
"
"								tpm_recvd_amt,
"
"								tpm_lgr_bal,
"
"								tpm_cre_by,
"
"								tpm_cre_date)
"
"						 SELECT p_bu,
"
"								4,
"
"								'3',
"
"								'3',
"
"								pmv_acct,
"
"								pmv_acct_class_desc,
"
"								pmv_net_rcvd_amt,
"
"								pmv_bc_amt,
"
"								0,
"
"								p_user,
"
"								sysdate
"
"						   FROM(SELECT SUM(pmv_net_rcvd_amt) pmv_net_rcvd_amt,
"
"									   SUM(pmv_bc_amt) pmv_bc_amt,
"
"									   pmv_acct,
"
"									   pmv_acct_class_desc
"
"						           FROM proprty_mgmt_vw
"
"								  WHERE pmv_bu = p_bu
"
"								    AND ((pmv_pv_date BETWEEN p_from_date AND p_to_date) OR pmv_pv_date IS NULL)
"
"									AND pmv_param_id = 'CORPUS'
"
"							   GROUP BY pmv_acct,pmv_acct_class_desc);
"
"
"
"		INSERT INTO temp_prop_mgmt(tpm_bu,
"
"								tpm_seq_no,
"
"								tpm_si_no,
"
"								tpm_print_seq_no,
"
"								tpm_acct,
"
"								tpm_acct_desc,
"
"								tpm_bud_amt,
"
"								tpm_recvd_amt,
"
"								tpm_lgr_bal,
"
"								tpm_cre_by,
"
"								tpm_cre_date)
"
"						 SELECT p_bu,
"
"								5,
"
"								'4',
"
"								'4',
"
"								pmv_acct,
"
"								pmv_acct_class_desc,
"
"								pmv_net_rcvd_amt,
"
"								pmv_bc_amt,
"
"								0,
"
"								p_user,
"
"								sysdate
"
"						   FROM(SELECT SUM(pmv_net_rcvd_amt) pmv_net_rcvd_amt,
"
"									   SUM(pmv_bc_amt) pmv_bc_amt,
"
"									   pmv_acct,
"
"									   pmv_acct_class_desc
"
"						           FROM proprty_mgmt_vw
"
"								  WHERE pmv_bu = p_bu
"
"								    AND ((pmv_pv_date BETWEEN p_from_date AND p_to_date) OR pmv_pv_date IS NULL)
"
"									AND pmv_param_id = 'KATHA'
"
"							   GROUP BY pmv_acct,pmv_acct_class_desc);
"
"
"
"	INSERT INTO temp_prop_mgmt(tpm_bu,
"
"								tpm_seq_no,
"
"								tpm_si_no,
"
"								tpm_print_seq_no,
"
"								tpm_acct,
"
"								tpm_acct_desc,
"
"								tpm_bud_amt,
"
"								tpm_recvd_amt,
"
"								tpm_lgr_bal,
"
"								tpm_cre_by,
"
"								tpm_cre_date)
"
"						 SELECT p_bu,
"
"								6,
"
"								'5',
"
"								'5',
"
"								pmv_acct,
"
"								pmv_acct_class_desc,
"
"								pmv_net_rcvd_amt,
"
"								pmv_bc_amt,
"
"								0,
"
"								p_user,
"
"								sysdate
"
"						   FROM(SELECT SUM(pmv_net_rcvd_amt) pmv_net_rcvd_amt,
"
"									   SUM(pmv_bc_amt) pmv_bc_amt,
"
"									   pmv_acct,
"
"									   pmv_acct_class_desc
"
"						           FROM proprty_mgmt_vw
"
"								  WHERE pmv_bu = p_bu
"
"								    AND ((pmv_pv_date BETWEEN p_from_date AND p_to_date) OR pmv_pv_date IS NULL)
"
"									AND pmv_param_id = 'GAIL'
"
"							   GROUP BY pmv_acct,pmv_acct_class_desc);
"
"
"
"	INSERT INTO temp_prop_mgmt(tpm_bu,
"
"								tpm_seq_no,
"
"								tpm_si_no,
"
"								tpm_print_seq_no,
"
"								tpm_acct,
"
"								tpm_acct_desc,
"
"								tpm_bud_amt,
"
"								tpm_recvd_amt,
"
"								tpm_lgr_bal,
"
"								tpm_cre_by,
"
"								tpm_cre_date)
"
"						 SELECT p_bu,
"
"								7,
"
"								'B',
"
"								NULL,
"
"								NULL,
"
"								'Paid Maintenance',
"
"								NULL,
"
"								sihd_tot_amt,
"
"								0,
"
"								p_user,
"
"								sysdate
"
"						   FROM(SELECT SUM(sihd_tot_amt) sihd_tot_amt
"
"							      FROM sales_invoices_hd
"
"							     WHERE sihd_bu = p_bu
"
"							       AND sihd_doc_date BETWEEN p_from_date AND p_to_date
"
"							       AND sihd_status = 'I');
"
"
"
"
"
"	INSERT INTO temp_prop_mgmt(tpm_bu,
"
"								tpm_seq_no,
"
"								tpm_si_no,
"
"								tpm_print_seq_no,
"
"								tpm_acct,
"
"								tpm_acct_desc,
"
"								tpm_bud_amt,
"
"								tpm_recvd_amt,
"
"								tpm_lgr_bal,
"
"								tpm_cre_by,
"
"								tpm_cre_date)
"
"						 SELECT p_bu,
"
"								8,
"
"								'C',
"
"								NULL,
"
"								NULL,
"
"								'On Demand Services',
"
"								NULL,
"
"								pmv_bc_amt,
"
"								0,
"
"								p_user,
"
"								sysdate
"
"						   FROM(SELECT SUM(ajh_bc_db_amt - ajh_bc_cr_amt) pmv_bc_amt
"
"						          FROM appl_journals_hist
"
"								 WHERE ajh_bu = p_bu
"
"								   AND ajh_jrnl_date BETWEEN p_from_date AND p_to_date
"
"								   AND ajh_gl_acct = '4010102004');
"
"
"
"	END proc_cust_coll;
"
"END pkg_prop_mgnt;"
/
