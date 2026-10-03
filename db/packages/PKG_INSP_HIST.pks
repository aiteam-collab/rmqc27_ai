CREATE OR REPLACE
"PACKAGE pkg_insp_hist
"
"AS
"
"
"
"  PROCEDURE proc_ins_qc_plan_hist(p_bu		tqm_qc_plan_hd.tqphd_bu%TYPE,
"
"			          p_pln_pfx	tqm_qc_plan_hd.tqphd_pln_pfx%TYPE,
"
"			          p_pln_no	tqm_qc_plan_hd.tqphd_pln_no%TYPE
"
"			         );
"
"
"
"  PROCEDURE proc_rev_qc_plan_hist(p_bu		tqm_qc_plan_hd.tqphd_bu%TYPE,
"
"			          p_pln_pfx	tqm_qc_plan_hd.tqphd_pln_pfx%TYPE,
"
"			          p_pln_no	tqm_qc_plan_hd.tqphd_pln_no%TYPE
"
"			         );
"
"
"
"  PROCEDURE proc_ins_qc_hist(p_bu	tqm_qc_hd.tqhd_bu%TYPE,
"
"			     p_qc_pfx	tqm_qc_hd.tqhd_qc_pfx%TYPE,
"
"			     p_qc_no	tqm_qc_hd.tqhd_qc_no%TYPE,
"
"			     p_qc_rev	tqm_qc_hd.tqhd_qc_rev%TYPE
"
"			    );
"
"
"
"  PROCEDURE proc_rev_qc_hist(p_bu	tqm_qc_hd.tqhd_bu%TYPE,
"
"			     p_qc_pfx	tqm_qc_hd.tqhd_qc_pfx%TYPE,
"
"			     p_qc_no	tqm_qc_hd.tqhd_qc_no%TYPE,
"
"			     p_qc_rev	tqm_qc_hd.tqhd_qc_rev%TYPE
"
"			    );
"
"
"
"END pkg_insp_hist;"
/
