CREATE OR REPLACE
"PACKAGE pack_calc_emp_tds
"
"AS
"
"
"
"   PROCEDURE proc_calc_emp_tds_pyrl(p_bu				VARCHAR2,
"
"   		 	            p_doc_no				VARCHAR2,
"
"   			            p_user				VARCHAR2,
"
"   			            p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_emp_tds_hra(p_bu					VARCHAR2,
"
"			           p_doc_no				VARCHAR2,
"
"			           p_user				VARCHAR2,
"
"			           p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_emp_tds_hpso(p_bu				VARCHAR2,
"
"			            p_doc_no				VARCHAR2,
"
"			            p_user				VARCHAR2,
"
"			            p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_emp_tds_hplo(p_bu				VARCHAR2,
"
"			            p_doc_no				VARCHAR2,
"
"			            p_user				VARCHAR2,
"
"			            p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_emp_tds_80c(p_bu					VARCHAR2,
"
"			           p_doc_no				VARCHAR2,
"
"			           p_user				VARCHAR2,
"
"			           p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_emp_tds_80ccg(p_bu				VARCHAR2,
"
"   		 	             p_doc_no				VARCHAR2,
"
"   			             p_user				VARCHAR2,
"
"			             p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_emp_tds_80d(p_bu					VARCHAR2,
"
"			           p_doc_no				VARCHAR2,
"
"			           p_user				VARCHAR2,
"
"			           p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_emp_tds_80dd(p_bu				VARCHAR2,
"
"			            p_doc_no				VARCHAR2,
"
"			            p_user				VARCHAR2,
"
"			            p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_emp_tds_80ddb(p_bu				VARCHAR2,
"
"			             p_doc_no				VARCHAR2,
"
"			             p_user				VARCHAR2,
"
"			             p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_emp_tds_80g(p_bu					VARCHAR2,
"
"			           p_doc_no				VARCHAR2,
"
"			           p_user				VARCHAR2,
"
"			           p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_emp_tds_80e(p_bu					VARCHAR2,
"
"			           p_doc_no				VARCHAR2,
"
"			           p_user				VARCHAR2,
"
"			           p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_emp_tds_80u(p_bu					VARCHAR2,
"
"			           p_doc_no				VARCHAR2,
"
"			           p_user				VARCHAR2,
"
"			           p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_emp_tds_conv(p_bu				VARCHAR2,
"
"			            p_doc_no				VARCHAR2,
"
"			            p_user				VARCHAR2,
"
"			            p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_emp_tds_lta(p_bu					VARCHAR2,
"
"			           p_doc_no				VARCHAR2,
"
"			           p_user				VARCHAR2,
"
"			           p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_emp_tds_80ccd1(p_bu				VARCHAR2,
"
"			              p_doc_no				VARCHAR2,
"
"			              p_user				VARCHAR2,
"
"			              p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_emp_tds_80ccd2(p_bu				VARCHAR2,
"
"			              p_doc_no				VARCHAR2,
"
"			              p_user				VARCHAR2,
"
"			              p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_emp_tds_other(p_bu				VARCHAR2,
"
"			             p_doc_no				VARCHAR2,
"
"			             p_user				VARCHAR2,
"
"			             p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_calc_emp_tds_tax(p_bu					VARCHAR2,
"
"			           p_doc_no				VARCHAR2,
"
"			           p_user				VARCHAR2,
"
"			           p_res		OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_load_emp_tds(p_bu				VARCHAR2,
"
"			       p_doc_no				VARCHAR2,
"
"			       p_user				VARCHAR2,
"
"			       p_res		OUT		VARCHAR2);
"
"
"
"END;"
/
