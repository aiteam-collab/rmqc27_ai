CREATE OR REPLACE
"PACKAGE pkg_shearing
"
"IS
"
"
"
"	PROCEDURE proc_decrease_cons(
"
"								p_bu		VARCHAR2,
"
"								p_plnt		VARCHAR2,
"
"								p_plnt_loc_id	VARCHAR2,
"
"								p_doc_no	VARCHAR2,
"
"								p_doc_date	DATE,
"
"								p_user		VARCHAR2,
"
"								p_lang		NUMBER
"
"								);
"
"
"
"	PROCEDURE proc_inc_scrap(p_bu		VARCHAR2,
"
"							 p_plnt		VARCHAR2,
"
"							 p_plnt_loc_id  VARCHAR2,
"
"							 p_doc_date	DATE,
"
"							 p_doc_no	VARCHAR2,
"
"							 p_lang		NUMBER,
"
"							 p_user		VARCHAR2
"
"							 );
"
"
"
"	PROCEDURE proc_inc_shearing(p_bu			VARCHAR2,
"
"								p_plnt			VARCHAR2,
"
"								p_plnt_loc_id		VARCHAR2,
"
"								p_doc_no		VARCHAR2,
"
"								p_user			VARCHAR2,
"
"								p_lang			NUMBER,
"
"								p_result	OUT	VARCHAR2
"
"								);
"
"
"
"END pkg_shearing;"
/
