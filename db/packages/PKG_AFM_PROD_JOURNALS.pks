CREATE OR REPLACE
"PACKAGE pkg_afm_prod_journals
"
"
"
"  AS
"
"	PROCEDURE proc_cre_afm_animal_feed_jrnls(p_bu		VARCHAR2,
"
"						 p_plnt		VARCHAR2,
"
"						 p_doc_no	VARCHAR2,
"
"						 p_doc_date	DATE,
"
"						 p_no_of_bags   NUMBER,
"
"						 p_user		VARCHAR2,
"
"						 p_lang		NUMBER
"
"						 );
"
"
"
"	PROCEDURE proc_cre_afm_oil_prodn_jrnls(p_bu		VARCHAR2,
"
"					       p_plnt		VARCHAR2,
"
"					       p_doc_no		VARCHAR2,
"
"					       p_doc_date	DATE,
"
"					       p_mach_id	VARCHAR2,
"
"					       p_user		VARCHAR2,
"
"					       p_lang		NUMBER
"
"					       );
"
"
"
"
"
"	PROCEDURE proc_cre_afm_oil_ref_jrnls(p_bu		VARCHAR2,
"
"					       p_plnt		VARCHAR2,
"
"					       p_doc_no		VARCHAR2,
"
"					       p_doc_date	DATE,
"
"					       p_mach_id	VARCHAR2,
"
"					       p_dly_oh_amt	NUMBER,
"
"					       p_shft_oh_amt	NUMBER,
"
"					       p_user		VARCHAR2,
"
"					       p_lang		NUMBER
"
"					       );
"
"
"
"
"
"	PROCEDURE proc_cre_afm_oil_pack_jrnls(p_bu		VARCHAR2,
"
"					       p_plnt		VARCHAR2,
"
"					       p_doc_no		VARCHAR2,
"
"					       p_doc_date	DATE,
"
"					       p_user		VARCHAR2,
"
"					       p_lang		NUMBER
"
"					       );
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
"	PROCEDURE proc_cre_afm_tripsht_revn_jrnl(
"
"						p_bu		VARCHAR2,
"
"						p_plnt		VARCHAR2,
"
"						p_doc_no	VARCHAR2,
"
"						p_doc_date	DATE,
"
"						p_user		VARCHAR2,
"
"						p_lang		NUMBER
"
"						);
"
"
"
"
"
"	PROCEDURE proc_cre_afm_tripsht_xpns_jrnl(
"
"					p_bu		VARCHAR2,
"
"					p_plnt		VARCHAR2,
"
"					p_doc_no	VARCHAR2,
"
"					p_doc_date	DATE,
"
"					p_user		VARCHAR2,
"
"					p_lang		NUMBER
"
"					);
"
"
"
"
"
"	PROCEDURE proc_cre_afm_rrclose_jrnl(
"
"					p_bu		VARCHAR2,
"
"					p_plnt		VARCHAR2,
"
"					p_doc_no	VARCHAR2,
"
"					p_doc_date	DATE,
"
"					p_user		VARCHAR2,
"
"					p_lang		NUMBER
"
"					);
"
"
"
"
"
"
"
"END pkg_afm_prod_journals;"
/
