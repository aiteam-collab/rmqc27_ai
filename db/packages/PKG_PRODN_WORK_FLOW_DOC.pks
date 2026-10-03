CREATE OR REPLACE
"PACKAGE pkg_prodn_work_flow_doc
"
"IS
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
"								 );
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
"								   p_took_life	  OUT VARCHAR2
"
"								   );
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
"									 );
"
"	PROCEDURE proc_cre_qc_doc(
"
"							 p_bu                   VARCHAR2,
"
"							 p_plnt                 VARCHAR2,
"
"							 p_trans_no             VARCHAR2,
"
"							 p_date		        DATE,
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
"							 p_qc_no          OUT     VARCHAR2
"
"							 );
"
"
"
"
"
"END pkg_prodn_work_flow_doc;"
/
