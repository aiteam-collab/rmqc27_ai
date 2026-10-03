CREATE OR REPLACE
"PACKAGE pkg_icm_migration
"
"AUTHID CURRENT_USER
"
"AS
"
"PROCEDURE proc_ins_attr_group (p_bu       VARCHAR2,
"
"                                  p_fname    VARCHAR2,
"
"                                  p_sep      VARCHAR2,
"
"                                  p_user     VARCHAR2); --Attibute group CFG0199
"
"
"
"PROCEDURE proc_ins_item_conv_factor(p_bu     VARCHAR2,
"
"                                    p_fname  VARCHAR2,
"
"                                    p_sep    VARCHAR2,
"
"                                    p_user   VARCHAR2);
"
"PROCEDURE proc_ins_prod_spec_attr (p_bu       VARCHAR2,
"
"                                  p_fname    VARCHAR2,
"
"                                  p_sep      VARCHAR2,
"
"                                  p_user     VARCHAR2);  --Attibute Desc CFG0199
"
"PROCEDURE proc_ins_item_pack(p_bu     VARCHAR2,
"
"                             p_prod_id  VARCHAR2,
"
"			     p_prod_rev VARCHAR2,
"
"                             p_fname  VARCHAR2,
"
"                             p_sep    VARCHAR2,
"
"                             p_user   VARCHAR2);
"
"PROCEDURE proc_ins_purge_item(p_bu     VARCHAR2,
"
"                             p_fname  VARCHAR2,
"
"                             p_sep    VARCHAR2,
"
"                             p_user   VARCHAR2);
"
"PROCEDURE proc_ins_item_part_inbuilt(p_bu     VARCHAR2,
"
"                                     p_fname  VARCHAR2,
"
"                                     p_sep    VARCHAR2,
"
"                                     p_user   VARCHAR2);
"
"PROCEDURE proc_ins_bin_prod_ass (p_bu       VARCHAR2,
"
"                                    p_fname    VARCHAR2,
"
"                                    p_sep      VARCHAR2,
"
"                                    p_user     VARCHAR2);     -- ITEM, LOCATOR WAREHOUSE ASSOCIATION CFG0910
"
"
"
"PROCEDURE proc_ins_prod_parts_cont (p_bu       VARCHAR2,
"
"                                       p_fname    VARCHAR2,
"
"                                       p_sep      VARCHAR2,
"
"                                       p_user     VARCHAR2);   -- ITEM PARTS INBUILT CFG0400
"
"PROCEDURE proc_ins_item_avg_cons_qty(p_bu     VARCHAR2,
"
"                                     p_fname  VARCHAR2,
"
"                                     p_sep    VARCHAR2,
"
"                                     p_user   VARCHAR2);
"
"PROCEDURE proc_ins_cast_item_weight(p_bu     VARCHAR2,
"
"                                     p_fname  VARCHAR2,
"
"                                     p_sep    VARCHAR2,
"
"                                     p_user   VARCHAR2);
"
"PROCEDURE proc_ins_admin_cost_acct_group(p_bu     VARCHAR2,
"
"                                     p_fname  VARCHAR2,
"
"                                     p_sep    VARCHAR2,
"
"                                     p_user   VARCHAR2);
"
"PROCEDURE proc_ins_prod_deflt_mfg_entity (p_bu       VARCHAR2,
"
"                                             p_fname    VARCHAR2,
"
"                                             p_sep      VARCHAR2,
"
"                                             p_user     VARCHAR2); --Item Deflt Prod Entity CFG0270
"
"/*PROCEDURE proc_ins_cast_ally_acct_grp (p_bu       VARCHAR2,
"
"                                          p_fname    VARCHAR2,
"
"                                          p_sep      VARCHAR2,
"
"                                          p_user     VARCHAR2); */--Inexo Casting Acct Grp Master CFG0119
"
"PROCEDURE proc_ins_acct_grp_asso (p_bu       VARCHAR2,
"
"                                               p_fname    VARCHAR2,
"
"                                               p_sep      VARCHAR2,
"
"                                               p_user     VARCHAR2); --Inexo Casting Grp - Acct CFG0119
"
"PROCEDURE proc_ins_adm_grup_assct (p_bu     VARCHAR2,
"
"                                     p_fname  VARCHAR2,
"
"                                     p_sep    VARCHAR2,
"
"                                     p_user   VARCHAR2,
"
"                                     p_result OUT VARCHAR2);
"
"PROCEDURE proc_ins_prod_rm_grade_asso (p_bu       VARCHAR2,
"
"                                                                p_fname    VARCHAR2,
"
"                                                                p_sep      VARCHAR2,
"
"                                                                p_user     VARCHAR2); --Item Grade AsSO CFG0112
"
"PROCEDURE proc_ins_term_cond_group (p_bu       VARCHAR2,
"
"                                                                p_fname    VARCHAR2,
"
"                                                                p_sep      VARCHAR2,
"
"                                                                p_user     VARCHAR2); --Item Grade AsSO CFG0112
"
"PROCEDURE proc_ins_trm_and_cond(p_bu     VARCHAR2,
"
"                                p_fname  VARCHAR2,
"
"                                p_sep    VARCHAR2,
"
"                                p_user   VARCHAR2,
"
"                                p_result OUT VARCHAR2);
"
"
"
"PROCEDURE proc_ins_opport_risk_factor (p_bu       VARCHAR2,
"
"                                       p_fname    VARCHAR2,
"
"                                       p_sep      VARCHAR2,
"
"                                       p_user     VARCHAR2);	--Risk Factor Opport (CFG1210)
"
"
"
"END pkg_icm_migration;"
/
