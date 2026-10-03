CREATE OR REPLACE
"PACKAGE pkg_dpm_mis
"
"AS
"
"
"
"  PROCEDURE proc_gen_dpm_stock_level(p_bu	VARCHAR2,
"
"                                     p_frm_date	DATE,
"
"                           	     p_to_date	DATE,
"
"                           	     p_user	VARCHAR2
"
"                          	    );
"
"
"
"  PROCEDURE proc_gen_min_max_prod_frm_bom(p_bu		 VARCHAR2,
"
"  					  p_type	 VARCHAR2,
"
"  					  p_par_prod_id	 VARCHAR2,
"
"  					  p_par_prod_rev NUMBER,
"
"  					  p_user	 VARCHAR2,
"
"  					  p_lang	 NUMBER
"
"  					 );
"
"
"
"  PROCEDURE proc_gen_ir_closing_pct(p_bu	VARCHAR2,
"
"  				    p_year	NUMBER,
"
"  				    p_period	NUMBER,
"
"  				    p_user	VARCHAR2
"
"  				   );
"
"
"
"
"
"END pkg_dpm_mis;"
/
