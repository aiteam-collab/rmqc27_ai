CREATE OR REPLACE
"PACKAGE pkg_gate_entry
"
"AS
"
"
"
"  PROCEDURE proc_ins_ge_barcode_dtls(p_bu	dc_hd.dchd_bu%TYPE,
"
"			             p_plnt	dc_hd.dchd_plnt%TYPE,
"
"			             p_doc_no	dc_hd.dchd_doc_no%TYPE,
"
"				     p_user	dc_hd.dchd_cre_by%TYPE,
"
"				     p_barcode	VARCHAR2
"
"			            );
"
"
"
"  PROCEDURE proc_ins_ge_dc_dtls(p_bu		dc_hd.dchd_bu%TYPE,
"
"			        p_plnt		dc_hd.dchd_plnt%TYPE,
"
"			        p_doc_no	dc_hd.dchd_doc_no%TYPE,
"
"			        p_user		dc_hd.dchd_cre_by%TYPE
"
"                               );
"
"
"
"END pkg_gate_entry;"
/
