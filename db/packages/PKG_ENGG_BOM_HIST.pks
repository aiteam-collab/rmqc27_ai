CREATE OR REPLACE
"PACKAGE pkg_engg_bom_hist
"
"AS
"
"
"
"	PROCEDURE proc_cre_engg_bom_rev (p_bu		    			VARCHAR2,
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
"
"
"        PROCEDURE proc_ins_engg_bom_hist(p_bu			VARCHAR2,
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
"	PROCEDURE proc_inactivate_engg_bom 		  (p_bu				VARCHAR2,
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
"END pkg_engg_bom_hist;"
/
