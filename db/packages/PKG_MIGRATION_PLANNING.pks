CREATE OR REPLACE
"PACKAGE pkg_migration_planning AUTHID CURRENT_USER
"
"IS
"
"
"
"    PROCEDURE proc_drop_exist_table(p_table_name     VARCHAR2);
"
"
"
"    PROCEDURE proc_migr_mrp_frm_plan(p_bu            VARCHAR2,
"
"                                     p_plnt          VARCHAR2,
"
"                                     p_doc_no        VARCHAR2,
"
"                                     p_doc_rev       NUMBER,
"
"                                     p_from_date     DATE,
"
"                                     p_file_name     VARCHAR2,
"
"                                     p_user          VARCHAR2,
"
"                                     p_res       OUT VARCHAR2
"
"                                     );
"
"
"
"    PROCEDURE proc_load_mrp_frm_plan(p_bu              VARCHAR2,
"
"                                     p_plnt            VARCHAR2,
"
"                                     p_doc_no          VARCHAR2,
"
"                                     p_doc_rev         VARCHAR2,
"
"                                     p_mrp_no          VARCHAR2,
"
"                                     p_date_from       DATE,
"
"                                     P_date_to         DATE,
"
"                                     p_user            VARCHAR2
"
"                                     );
"
"    PROCEDURE proc_load_mrp_frm_mon_plan(p_bu              VARCHAR2,
"
"                                     p_plnt            VARCHAR2,
"
"                                     p_doc_no          VARCHAR2,
"
"                                     p_doc_rev         VARCHAR2,
"
"                                     p_mrp_no          VARCHAR2,
"
"                                     p_date_from       DATE,
"
"                                     P_date_to         DATE,
"
"                                     p_user            VARCHAR2
"
"                                     );
"
"
"
"
"
"    PROCEDURE proc_ins_migr_routing_ln(p_bu           VARCHAR2,
"
"                                       p_plnt         VARCHAR2,
"
"                                       p_doc_no       VARCHAR2,
"
"                                       p_file_name    VARCHAR2,
"
"                                       p_user         VARCHAR2
"
"                                       );
"
"
"
"    PROCEDURE proc_ins_migr_bom_ln (p_bu           VARCHAR2,
"
"                                    p_plnt         VARCHAR2,
"
"                                    p_doc_no       VARCHAR2,
"
"                                    p_file_name    VARCHAR2,
"
"                                    p_user         VARCHAR2
"
"                                    );
"
"
"
"    PROCEDURE proc_ins_migr_bor_ln (
"
"                                    p_bu           VARCHAR2,
"
"                                    p_plnt         VARCHAR2,
"
"                                    p_doc_no       VARCHAR2,
"
"                                    p_file_name    VARCHAR2,
"
"                                    p_user         VARCHAR2
"
"                                    );
"
"
"
"    PROCEDURE proc_ins_migr_bor_details(p_bu           VARCHAR2,
"
"                                        p_plnt         VARCHAR2,
"
"                                        p_doc_no       VARCHAR2,
"
"                                        p_file_name    VARCHAR2,
"
"                                        p_user         VARCHAR2
"
"                                        );
"
"
"
"    PROCEDURE proc_migr_mrp_demand (
"
"                                    p_bu           VARCHAR2,
"
"                                    p_plnt         VARCHAR2,
"
"                                    p_doc_no       VARCHAR2,
"
"                                    p_file_name    VARCHAR2,
"
"                                    p_user         VARCHAR2,
"
"                                    p_res     OUT   VARCHAR2
"
"                                    );
"
"
"
"    PROCEDURE proc_ins_bom_migrate_ln (
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
"                                      p_res     OUT   VARCHAR2,
"
"                      p_sep        VARCHAR2   DEFAULT '|'
"
"                                      );
"
"
"
"   PROCEDURE proc_ins_bom_migrate_ln_prd (
"
"                                         p_bu           VARCHAR2,
"
"                                         p_plnt         VARCHAR2,
"
"                                         p_doc_no       VARCHAR2,
"
"                                         p_file_name    VARCHAR2,
"
"                                         p_user         VARCHAR2,
"
"                                         p_res     OUT   VARCHAR2
"
"                                      );
"
"
"
"    PROCEDURE proc_ins_eqpmt_mig_det(
"
"                                     p_bu           VARCHAR2,
"
"                                     p_plnt         VARCHAR2,
"
"                                     p_doc_no       VARCHAR2,
"
"                                     p_file_name    VARCHAR2,
"
"                                     p_user         VARCHAR2
"
"                                    );
"
"
"
"    PROCEDURE proc_ins_migr_fcast_det(
"
"                                      p_bu               VARCHAR2,
"
"                                      p_plnt             VARCHAR2,
"
"                                      p_fcast_no         VARCHAR2,
"
"                                      p_fcast_rev       NUMBER,
"
"                                      p_firm_st_date    DATE,
"
"                                      p_firm_ed_date    DATE,
"
"                                      p_tent_st_date    DATE,
"
"                                      p_tent_ed_date    DATE,
"
"                                      p_file_name        VARCHAR2,
"
"                                      p_user             VARCHAR2,
"
"                                      p_res    OUT      VARCHAR2
"
"                                      );
"
"
"
"    PROCEDURE proc_ins_migr_fcast_plan_det(
"
"                                           p_bu               VARCHAR2,
"
"                                           p_doc_no           VARCHAR2,
"
"                                           p_doc_rev        NUMBER,
"
"                                           p_doc_date        DATE,
"
"                                           p_file_name        VARCHAR2,
"
"                                           p_user             VARCHAR2,
"
"                                           p_res        OUT    VARCHAR2
"
"                                           );
"
"
"
"                        /*Machine Config Upload Starts*/
"
"
"
"    PROCEDURE proc_upload_mfg_res_groups(p_bu                VARCHAR2,
"
"                                         p_dir                VARCHAR2,
"
"                                         p_file_name        VARCHAR2,
"
"                                         p_user                VARCHAR2,
"
"                                         p_res            OUT    VARCHAR2
"
"                                         );
"
"    PROCEDURE proc_chk_res_group
"
"                                (p_bu    VARCHAR2,
"
"                                 p_user  VARCHAR2,
"
"                                 p_res   OUT VARCHAR2
"
"                                );
"
"
"
"    PROCEDURE proc_ins_mfg_res_groups
"
"                                    (p_bu    VARCHAR2,
"
"                                     p_user  VARCHAR2
"
"                                    );
"
"
"
"    PROCEDURE proc_upload_mfg_resources_man(p_bu            VARCHAR2,
"
"                                             p_dir            VARCHAR2,
"
"                                             p_file_name    VARCHAR2,
"
"                                             p_user            VARCHAR2,
"
"                                             p_res        OUT    VARCHAR2
"
"                                            );
"
"    PROCEDURE proc_chk_mfg_resources_man
"
"                                      (p_bu       VARCHAR2,
"
"                                       p_user     VARCHAR2,
"
"                                       p_res  OUT VARCHAR2
"
"                                      );
"
"
"
"    PROCEDURE proc_ins_mfg_resources_man
"
"                                        (p_bu  VARCHAR2,
"
"                                         p_user VARCHAR2
"
"                                        );
"
"
"
"    PROCEDURE proc_chk_mfg_resources_mach
"
"                                        (p_bu         VARCHAR2,
"
"                                         p_user       VARCHAR2,
"
"                                         p_res   OUT  VARCHAR2
"
"                                        );
"
"
"
"    PROCEDURE proc_upload_migr_tool(p_bu                VARCHAR2,
"
"                    p_plnt        VARCHAR2,
"
"                    p_doc_no        VARCHAR2,
"
"                    p_dir                VARCHAR2,
"
"                    p_file_name         VARCHAR2,
"
"                    p_user              VARCHAR2,
"
"                    p_res        OUT     VARCHAR2
"
"                    );
"
"    PROCEDURE proc_ins_migr_tool
"
"                (p_bu          VARCHAR2,
"
"                 p_plnt         VARCHAR2,
"
"                 p_user     VARCHAR2,
"
"                 p_res    OUT VARCHAR2
"
"                 );
"
"
"
"    PROCEDURE proc_inc_ei_assy_dtls (p_bu        VARCHAR2,
"
"                    p_file_name        VARCHAR2,
"
"                    p_user        VARCHAR2,
"
"                    p_res      OUT    VARCHAR2
"
"                   );
"
"
"
"    PROCEDURE proc_inc_ei_assy_proc_dtls (p_bu        VARCHAR2,
"
"                                        p_assy_id    VARCHAR2,
"
"                                        p_file_name    VARCHAR2,
"
"                                        p_user        VARCHAR2,
"
"                                        p_res     OUT    VARCHAR2
"
"                                        );
"
"
"
"    PROCEDURE proc_ins_ei_prj_plan_ln( p_bu           VARCHAR2,
"
"                     p_plnt         VARCHAR2,
"
"                     p_doc_no       VARCHAR2,
"
"                     p_doc_rev      NUMBER,
"
"                     p_file_name    VARCHAR2,
"
"                     p_user         VARCHAR2
"
"                    ) ;
"
"
"
"    PROCEDURE proc_ins_ei_prj_plan_proc
"
"                     (
"
"                     p_bu           VARCHAR2,
"
"                     p_plnt         VARCHAR2,
"
"                     p_doc_no       VARCHAR2,
"
"                     p_doc_rev      NUMBER,
"
"                     p_file_name    VARCHAR2,
"
"                     p_user         VARCHAR2
"
"                     );
"
"
"
"    PROCEDURE proc_upd_cut_end_bits_dtls(p_bu        VARCHAR2,
"
"                       p_plnt        VARCHAR2,
"
"                       p_doc_no        VARCHAR2,
"
"                       p_thickness      VARCHAR2,
"
"                       p_lot_no        VARCHAR2,
"
"                       p_file_name    VARCHAR2,
"
"                       p_user        VARCHAR2
"
"                      )    ;
"
"
"
"    PROCEDURE proc_ins_mfg_item (p_bu        VARCHAR2,
"
"                      p_file_name    VARCHAR2,
"
"                      p_sep             VARCHAR2,
"
"                      p_user        VARCHAR2,
"
"                      p_result     OUT    VARCHAR2
"
"                      );
"
"
"
"        /*Shift Wise With Production Order Completion Migration*/
"
"     PROCEDURE proc_mig_shift_wise_comp(
"
"                                        p_bu            VARCHAR2,
"
"                                        p_plnt            VARCHAR2,
"
"                                        p_doc_no        VARCHAR2,
"
"                                        p_doc_date      DATE,
"
"                                        p_shift_id        VARCHAR2,
"
"                                        p_user            VARCHAR2,
"
"                                        p_file_name     VARCHAR2,
"
"                                        p_lang            NUMBER,
"
"                                        p_mr_res    OUT    VARCHAR2
"
"                                        );
"
"
"
"        /*Shift Wise Without Production Order Completion Migration*/
"
"    PROCEDURE proc_mig_sw_wo_prod_comp
"
"                                    (
"
"                                    p_bu            VARCHAR2,
"
"                                    p_plnt            VARCHAR2,
"
"                                    p_doc_no        VARCHAR2,
"
"                                    p_doc_date      DATE,
"
"                                    p_shift_id        VARCHAR2,
"
"                                    p_user            VARCHAR2,
"
"                                    p_file_name        VARCHAR2,
"
"                                    p_lang            NUMBER,
"
"                                    p_mr_res OUT    VARCHAR2
"
"                                    );
"
"
"
"        /*Customer Schedule Migration Week Wise*/
"
"    PROCEDURE proc_mig_cust_schld_weeks(
"
"                                        p_bu            VARCHAR2,
"
"                                        p_plnt            VARCHAR2,
"
"                                        p_doc_no        VARCHAR2,
"
"                                        p_user            VARCHAR2,
"
"                                        p_file_name     VARCHAR2,
"
"                                        p_lang            NUMBER,
"
"                                        p_sep            VARCHAR2
"
"                                        );
"
"
"
"        /*Customer Schedule Migration Day Wise*/
"
"    PROCEDURE proc_mig_cust_schld_days(
"
"                                        p_bu            VARCHAR2,
"
"                                        p_plnt            VARCHAR2,
"
"                                        p_doc_no        VARCHAR2,
"
"                                        p_from_date        DATE,
"
"                                        p_to_date        DATE,
"
"                                        p_user            VARCHAR2,
"
"                                        p_file_name     VARCHAR2,
"
"                                        p_lang            NUMBER,
"
"                                        p_sep            VARCHAR2,
"
"                                        p_out    OUT        VARCHAR2
"
"                                        );
"
"
"
"        /*Customer Schedule Migration Month Wise*/
"
"    PROCEDURE proc_mig_cust_schld_months(
"
"                                         p_bu            VARCHAR2,
"
"                                         p_plnt            VARCHAR2,
"
"                                         p_doc_no        VARCHAR2,
"
"                                         p_user            VARCHAR2,
"
"                                         p_file_name     VARCHAR2,
"
"                                         p_lang            NUMBER,
"
"                                         p_sep            VARCHAR2
"
"                                         );
"
"
"
"    /*Sales Forecast Category Wise Upload*/
"
"    PROCEDURE proc_mig_fcast_cat_det
"
"                                   (
"
"                                   p_bu           VARCHAR2,
"
"                                   p_plnt         VARCHAR2,
"
"                                   p_fcast_no     VARCHAR2,
"
"                                   p_fcast_rev    NUMBER,
"
"                                   p_file_name    VARCHAR2,
"
"                                   p_user         VARCHAR2
"
"                                   );
"
"
"
"    PROCEDURE proc_ins_furnance_spec(p_bu        VARCHAR2,
"
"                                     p_plnt     VARCHAR2,
"
"                                     p_doc_no    VARCHAR2,
"
"                                     p_file_name    VARCHAR2,
"
"                                     p_user        VARCHAR2
"
"                                     );
"
"
"
"    /*BOM Migration - BOM1001*/
"
"    PROCEDURE proc_mig_bom_det(
"
"                              p_bu           VARCHAR2,
"
"                              p_plnt         VARCHAR2,
"
"                              p_doc_no       VARCHAR2,
"
"                              p_file_name    VARCHAR2,
"
"                              p_user         VARCHAR2,
"
"                              p_res     OUT  VARCHAR2
"
"                              );
"
"
"
"    /*Upload Cost Estimation Material Details*/
"
"    PROCEDURE proc_ins_cost_est_prod_mig(
"
"                         p_bu           VARCHAR2,
"
"                         p_plnt         VARCHAR2,
"
"                         p_doc_no       VARCHAR2,
"
"                         p_file_name    VARCHAR2,
"
"                         p_user         VARCHAR2,
"
"                         p_res    OUT   VARCHAR2
"
"                         );
"
"
"
"END pkg_migration_planning;"
/
