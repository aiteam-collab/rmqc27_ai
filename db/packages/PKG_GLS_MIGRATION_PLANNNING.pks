CREATE OR REPLACE
"PACKAGE pkg_gls_migration_plannning
"
"AUTHID CURRENT_USER
"
"AS
"
"	PROCEDURE proc_drop_temp_table(p_table_name		VARCHAR2);
"
"
"
"	/*PROCEDURE proc_chk_exception(p_bu		VARCHAR2,
"
"								 p_glass	VARCHAR2
"
"								 );*/
"
"
"
"	PROCEDURE proc_migr_glass_family(p_bu            VARCHAR2,
"
"                                     	 p_file_name     VARCHAR2,
"
"                                     	 p_user          VARCHAR2,
"
"                                     	 p_res       OUT VARCHAR2
"
"                                     	 );
"
"
"
"	PROCEDURE proc_migr_glass (p_bu            VARCHAR2,
"
"				   p_file_name     VARCHAR2,
"
"				   p_user          VARCHAR2,
"
"				   p_res       OUT VARCHAR2
"
"				   );
"
"    	PROCEDURE proc_migr_shape (p_bu            VARCHAR2,
"
"				   p_file_name     VARCHAR2,
"
"				   p_user          VARCHAR2,
"
"				   p_res       OUT VARCHAR2
"
"				   );
"
"        PROCEDURE proc_migr_cavity_content (p_bu            VARCHAR2,
"
"					    p_file_name     VARCHAR2,
"
"					    p_user          VARCHAR2,
"
"					    p_res       OUT VARCHAR2
"
"				   	    );
"
" 	PROCEDURE proc_migr_make (p_bu            VARCHAR2,
"
"			    	  p_file_name     VARCHAR2,
"
"			    	  p_user          VARCHAR2,
"
"			    	  p_res       OUT VARCHAR2
"
"		    		 );
"
"	PROCEDURE proc_migr_coating (p_bu            VARCHAR2,
"
"				     p_file_name     VARCHAR2,
"
"				     p_user          VARCHAR2,
"
"				     p_res       OUT VARCHAR2
"
"		    		       );
"
"	PROCEDURE proc_migr_color (p_bu            VARCHAR2,
"
"				   p_file_name     VARCHAR2,
"
"				   p_user          VARCHAR2,
"
"				   p_res       OUT VARCHAR2
"
"		    		       );
"
"	PROCEDURE proc_migr_layer_type (p_bu            VARCHAR2,
"
"					p_file_name     VARCHAR2,
"
"					p_user          VARCHAR2,
"
"					p_res       OUT VARCHAR2
"
"					);
"
"	PROCEDURE proc_migr_reason 	(p_bu            VARCHAR2,
"
"					p_file_name     VARCHAR2,
"
"					p_user          VARCHAR2,
"
"					p_res       OUT VARCHAR2
"
"					);
"
"	PROCEDURE proc_migr_edging     (p_bu            VARCHAR2,
"
"					p_file_name     VARCHAR2,
"
"					p_user          VARCHAR2,
"
"					p_res       OUT VARCHAR2
"
"					);
"
"	PROCEDURE proc_migr_chrg_allow     (p_bu            VARCHAR2,
"
"					    p_file_name     VARCHAR2,
"
"					    p_user          VARCHAR2,
"
"					    p_res       OUT VARCHAR2
"
"					    );
"
"	PROCEDURE proc_migr_pvb_thk    (p_bu            VARCHAR2,
"
"					p_file_name     VARCHAR2,
"
"					p_user          VARCHAR2,
"
"					p_res       OUT VARCHAR2
"
"					);
"
"	PROCEDURE proc_migr_cav_thk    (p_bu            VARCHAR2,
"
"					p_file_name     VARCHAR2,
"
"					p_user          VARCHAR2,
"
"					p_res       OUT VARCHAR2
"
"					);
"
"	PROCEDURE proc_migr_Round_off    (p_bu            VARCHAR2,
"
"					  p_file_name     VARCHAR2,
"
"					  p_user          VARCHAR2,
"
"					  p_res       OUT VARCHAR2
"
"					  );
"
"	PROCEDURE proc_migr_process    (p_bu            VARCHAR2,
"
"						p_file_name     VARCHAR2,
"
"						p_user          VARCHAR2,
"
"						p_res       OUT VARCHAR2
"
"					);
"
"	PROCEDURE proc_migr_cut_allow    (p_bu            VARCHAR2,
"
"					  p_file_name     VARCHAR2,
"
"					  p_user          VARCHAR2,
"
"					  p_res       OUT VARCHAR2
"
"					  );
"
"
"
"
"
"
"
"END pkg_gls_migration_plannning;"
/
