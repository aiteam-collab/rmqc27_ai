CREATE OR REPLACE
"PACKAGE pack_epc_emp_att
"
"AS
"
"
"
"   PROCEDURE proc_load_prj_emp(p_bu			VARCHAR2,
"
"   			       p_plnt					VARCHAR2,
"
"   			       p_doc_no					VARCHAR2,
"
"   			       p_user					VARCHAR2,
"
"   			       p_res			OUT		VARCHAR2);
"
"
"
"   PROCEDURE proc_post_prj_att(p_bu					VARCHAR2,
"
"   			       p_plnt					VARCHAR2,
"
"   			       p_doc_no					VARCHAR2,
"
"   			       p_user					VARCHAR2,
"
"   			       p_res			OUT		VARCHAR2);
"
"
"
"END pack_epc_emp_att;"
/
