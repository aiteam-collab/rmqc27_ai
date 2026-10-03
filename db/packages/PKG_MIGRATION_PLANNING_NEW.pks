CREATE OR REPLACE
"PACKAGE pkg_migration_planning_new
"
"IS
"
"
"
"PROCEDURE proc_ins_bom_migrate_ln_new (
"
"                                      p_bu           VARCHAR2,
"
"                                      p_plnt         VARCHAR2,
"
"                                      p_doc_no       VARCHAR2,
"
"                                      p_file_name    VARCHAR2,
"
"                                      p_user         VARCHAR2,
"
"                                      p_res     OUT   VARCHAR2
"
"                                      );
"
"
"
"END;"
/
