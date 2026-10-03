CREATE OR REPLACE
"PACKAGE pkg_upload_assembly
"
"AUTHID CURRENT_USER
"
"IS
"
"
"
"  PROCEDURE proc_upload_asmbly_drwg (p_bu              VARCHAR2,
"
"				     p_plnt            VARCHAR2,
"
"				     p_doc_no	     VARCHAR2,
"
"				     p_dir             VARCHAR2,
"
"				     p_file_name       VARCHAR2,
"
"				     p_user            VARCHAR2,
"
"				     p_variant     OUT VARCHAR2);
"
"
"
"  PROCEDURE proc_chk_asmbly_drwg (p_bu         VARCHAR2,
"
"				  p_plnt       VARCHAR2,
"
"				  p_doc_no     VARCHAR2,
"
"				  p_user       VARCHAR2,
"
"				  p_fail   OUT VARCHAR2);
"
"
"
"  PROCEDURE proc_ins_asmbly_drwg (p_bu 		VARCHAR2,
"
"				  p_plnt  	VARCHAR2,
"
"				  p_doc_no  	VARCHAR2,
"
"				  p_user 		VARCHAR2);
"
"
"
"  PROCEDURE proc_upload_asmbly_part (
"
"				   p_bu              VARCHAR2,
"
"				   p_plnt            VARCHAR2,
"
"				   p_doc_no	     VARCHAR2,
"
"				   p_dir             VARCHAR2,
"
"				   p_file_name       VARCHAR2,
"
"				   p_user            VARCHAR2,
"
"				   p_variant     OUT VARCHAR2);
"
"
"
"  PROCEDURE proc_chk_asmbly_part (p_bu         VARCHAR2,
"
"				  p_plnt       VARCHAR2,
"
"				  p_doc_no     VARCHAR2,
"
"				  p_user       VARCHAR2,
"
"				  p_fail   OUT VARCHAR2);
"
"
"
"  PROCEDURE proc_ins_asmbly_part (p_bu 		VARCHAR2,
"
"				  p_plnt  	VARCHAR2,
"
"				  p_doc_no  	VARCHAR2,
"
"				  p_user 	VARCHAR2);
"
"
"
"END pkg_upload_assembly;
"
/
