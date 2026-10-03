CREATE OR REPLACE
"PACKAGE pkg_bom_hist
"
"AS
"
"
"
"	PROCEDURE proc_cre_bom_rev (p_bu		    			VARCHAR2,
"
"							    p_plnt		VARCHAR2,
"
"							    p_bom_no		VARCHAR2,
"
"							    p_eff_from		DATE,
"
"							    p_eff_to		DATE,
"
"							    p_user		VARCHAR2,
"
"							    p_res	OUT	VARCHAR2
"
"							    );
"
"
"
"	PROCEDURE proc_ins_bom_hist(p_bu			VARCHAR2,
"
"								p_plnt			VARCHAR2,
"
"				    	        p_bom_no		VARCHAR2,
"
"				    	        p_ref			VARCHAR2,
"
"				    	        p_user			VARCHAR2,
"
"				    	        p_res		OUT	VARCHAR2
"
"								);
"
"
"
"	PROCEDURE proc_copy_bom(p_bu			VARCHAR2,
"
"							p_plnt			VARCHAR2,
"
"							p_bom_no		VARCHAR2,
"
"							p_to_plnt		VARCHAR2,
"
"							p_prod_id		VARCHAR2,
"
"							p_prod_rev		NUMBER,
"
"							p_bom_name		VARCHAR2,
"
"							P_bom_rev		VARCHAR2,
"
"							p_bom_uom		VARCHAR2,
"
"							p_eff_from		DATE,
"
"							p_eff_to		DATE,
"
"							p_rm_rqrd		VARCHAR2,
"
"							p_user			VARCHAR2,
"
"							p_res		OUT	VARCHAR2,
"
"							p_sou_bu                VARCHAR2 DEFAULT NULL
"
"							);
"
"
"
"	PROCEDURE proc_check_unit_asso(p_bu			VARCHAR2,
"
"								   p_plnt		VARCHAR2,
"
"								   p_bom_no		VARCHAR2
"
"								   );
"
"
"
"	PROCEDURE proc_inactivate_bom 		  (p_bu				VARCHAR2,
"
"						   p_plnt			VARCHAR2,
"
"				    	           p_bom_no			VARCHAR2,
"
"				    	           p_ref			VARCHAR2,
"
"				    	           p_type			VARCHAR2, --'C' - Correction 'I' - Inactive
"
"				    	           p_user			VARCHAR2,
"
"				    	           p_res		OUT	VARCHAR2
"
"								   );
"
"
"
"END pkg_bom_hist;"
/
