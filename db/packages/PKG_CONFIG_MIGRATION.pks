CREATE OR REPLACE
"PACKAGE pkg_config_migration AUTHID CURRENT_USER
"
"IS
"
"   /*Reason Upload*/
"
"   PROCEDURE proc_ins_upl_cls_rej_reasons(
"
"                                         p_bu              VARCHAR2,
"
"                                         p_user         VARCHAR2
"
"                                         );
"
"
"
"   PROCEDURE proc_upload_rej_cls_reason(
"
"                                        p_bu            VARCHAR2,
"
"                                        p_dir            VARCHAR2,
"
"                                        p_file_name        VARCHAR2,
"
"                                        p_user                VARCHAR2,
"
"                                        p_res            OUT    VARCHAR2
"
"                                        );
"
"
"
"    PROCEDURE proc_chk_cls_rej_reasons(
"
"                                      p_bu                 VARCHAR2,
"
"                                      p_user               VARCHAR2,
"
"                                      p_res   OUT          VARCHAR2
"
"                                      );
"
"
"
"    PROCEDURE proc_upload_aoc_char_mig(p_bu            VARCHAR2,
"
"                                       p_dir        VARCHAR2,
"
"                                       p_file_name        VARCHAR2,
"
"                                       p_user        VARCHAR2,
"
"                                       p_res     OUT    VARCHAR2
"
"                                       );
"
"
"
"    /*PROCEDURE proc_chk_excep_aoc_mig(p_bu            VARCHAR2,
"
"                                     p_user            VARCHAR2,
"
"                                     p_res        OUT    VARCHAR2
"
"                                     );*/
"
"
"
"    PROCEDURE proc_ins_aoc_mig(p_bu            VARCHAR2,
"
"                               p_user        VARCHAR2,
"
"                               p_res   OUT    VARCHAR2
"
"                               );
"
"
"
"
"
"   /*Parameter Upload*/
"
"   PROCEDURE proc_upload_temp_parameter
"
"                                       (p_bu            VARCHAR2,
"
"                                        p_dir            VARCHAR2,
"
"                                        p_file_name        VARCHAR2,
"
"                                        p_user            VARCHAR2,
"
"                                        p_res        OUT    VARCHAR2
"
"                                       );
"
"
"
"   PROCEDURE proc_chk_param (
"
"                             p_bu         VARCHAR2,
"
"                             p_user      VARCHAR2,
"
"                             p_res    OUT VARCHAR2
"
"                             );
"
"
"
"   PROCEDURE proc_ins_con_param(
"
"                                p_bu    VARCHAR2,
"
"                                p_user  VARCHAR2
"
"                               );
"
"
"
"   /*Parameter/Fault Upload*/
"
"   PROCEDURE proc_upload_temp_fault
"
"                                       (p_bu            VARCHAR2,
"
"                                        p_dir            VARCHAR2,
"
"                                        p_file_name        VARCHAR2,
"
"                                        p_user            VARCHAR2,
"
"                                        p_res        OUT    VARCHAR2
"
"                                       );
"
"
"
"   PROCEDURE proc_chk_fault (
"
"                             p_bu         VARCHAR2,
"
"                             p_user      VARCHAR2,
"
"                             p_res    OUT VARCHAR2
"
"                             );
"
"
"
"   PROCEDURE proc_ins_config_fault(
"
"                                    p_bu    VARCHAR2,
"
"                                    p_user  VARCHAR2
"
"                                   );
"
"
"
"   /*Parameter/Setting Upload*/
"
"   PROCEDURE proc_upload_temp_stng
"
"                                       (p_bu            VARCHAR2,
"
"                                        p_dir            VARCHAR2,
"
"                                        p_file_name        VARCHAR2,
"
"                                        p_user            VARCHAR2,
"
"                                        p_res        OUT    VARCHAR2
"
"                                       );
"
"
"
"   PROCEDURE proc_chk_stng (
"
"                             p_bu         VARCHAR2,
"
"                             p_user      VARCHAR2,
"
"                             p_res    OUT VARCHAR2
"
"                             );
"
"
"
"   PROCEDURE proc_ins_config_stng(
"
"                                    p_bu    VARCHAR2,
"
"                                    p_user  VARCHAR2
"
"                                   );
"
"
"
"   /*Parameter/Count Upload*/
"
"   PROCEDURE proc_upload_temp_count
"
"                                       (p_bu            VARCHAR2,
"
"                                        p_dir            VARCHAR2,
"
"                                        p_file_name        VARCHAR2,
"
"                                        p_user            VARCHAR2,
"
"                                        p_res        OUT    VARCHAR2
"
"                                       );
"
"
"
"   PROCEDURE proc_chk_count (
"
"                             p_bu         VARCHAR2,
"
"                             p_user      VARCHAR2,
"
"                             p_res    OUT VARCHAR2
"
"                             );
"
"
"
"   PROCEDURE proc_ins_config_count(
"
"                                    p_bu    VARCHAR2,
"
"                                    p_user  VARCHAR2
"
"                                   );
"
"
"
"   /*Parameter/Division Upload*/
"
"   PROCEDURE proc_upload_temp_dev
"
"                                       (p_bu            VARCHAR2,
"
"                                        p_dir            VARCHAR2,
"
"                                        p_file_name        VARCHAR2,
"
"                                        p_user            VARCHAR2,
"
"                                        p_res        OUT    VARCHAR2
"
"                                       );
"
"
"
"   PROCEDURE proc_chk_dev (
"
"                             p_bu         VARCHAR2,
"
"                             p_user      VARCHAR2,
"
"                             p_res    OUT VARCHAR2
"
"                             );
"
"
"
"   PROCEDURE proc_ins_config_dev(
"
"                                    p_bu    VARCHAR2,
"
"                                    p_user  VARCHAR2
"
"                                   );
"
"
"
"   /*Parameter/Division Parameter Upload*/
"
"   PROCEDURE proc_upload_temp_dp
"
"                                       (p_bu            VARCHAR2,
"
"                                        p_dir            VARCHAR2,
"
"                                        p_file_name        VARCHAR2,
"
"                                        p_user            VARCHAR2,
"
"                                        p_res        OUT    VARCHAR2
"
"                                       );
"
"
"
"   PROCEDURE proc_chk_dp (
"
"                             p_bu         VARCHAR2,
"
"                             p_user      VARCHAR2,
"
"                             p_res    OUT VARCHAR2
"
"                             );
"
"
"
"   PROCEDURE proc_ins_config_dp(
"
"                                    p_bu    VARCHAR2,
"
"                                    p_user  VARCHAR2
"
"                                   );
"
"
"
"   /*Glass Configuration Upload */
"
"   PROCEDURE proc_chk_excep_gpi_cfg_mig(p_bu                 VARCHAR2,
"
"                                  p_type               VARCHAR2,
"
"                                  p_user               VARCHAR2,
"
"                               p_res         OUT    VARCHAR2);
"
"
"
"   PROCEDURE proc_upload_gpi_cfg_mig(p_bu            VARCHAR2,
"
"                                     p_type            VARCHAR2,
"
"                                     p_dir            VARCHAR2,
"
"                                     p_file_name    VARCHAR2,
"
"                                     p_user            VARCHAR2,
"
"                                     p_res        OUT    VARCHAR2
"
"                                     );
"
"
"
"   PROCEDURE proc_ins_gpi_cfg_mig(p_bu           VARCHAR2,
"
"                                  p_type         VARCHAR2,
"
"                                  p_user         VARCHAR2,
"
"                                  p_res      OUT VARCHAR2
"
"                                  );
"
"
"
"    /*Data Specification Upload*/
"
"   PROCEDURE proc_upload_speci(
"
"                               p_bu            VARCHAR2,
"
"                               p_dir        VARCHAR2,
"
"                               p_file_name    VARCHAR2,
"
"                               p_user        VARCHAR2,
"
"                               p_spec    OUT    VARCHAR2
"
"                               );
"
"
"
"   PROCEDURE proc_chk_speci(
"
"                            p_bu        VARCHAR2,
"
"                            p_user      VARCHAR2,
"
"                            p_spec  OUT VARCHAR2
"
"                           );
"
"
"
"   PROCEDURE proc_ins_speci(
"
"                            p_bu    VARCHAR2,
"
"                            p_user  VARCHAR2
"
"                            );
"
"
"
"    /*Drawing Upload*/
"
"   PROCEDURE proc_upload_dwgt_cfg_mig(
"
"                                      p_bu            VARCHAR2,
"
"                                      p_dir            VARCHAR2,
"
"                                      p_file_name    VARCHAR2,
"
"                                       p_user        VARCHAR2,
"
"                                      p_res        OUT    VARCHAR2
"
"                                      );
"
"
"
"   PROCEDURE proc_chk_excep_dwgt_cfg_mig(
"
"                                        p_bu            VARCHAR2,
"
"                                        p_user            VARCHAR2,
"
"                                        p_res        OUT    VARCHAR2
"
"                                        );
"
"
"
"   PROCEDURE proc_ins_dwgt_cfg_mig
"
"                                  (
"
"                                  p_bu                VARCHAR2,
"
"                                  p_user            VARCHAR2,
"
"                                  p_res         OUT    VARCHAR2
"
"                                  );
"
"
"
"    /*Design Review Parameter Upload*/
"
"   PROCEDURE proc_upload_rdrp_cfg_mig(
"
"                                      p_bu            VARCHAR2,
"
"                                      p_dir            VARCHAR2,
"
"                                      p_file_name    VARCHAR2,
"
"                                       p_user        VARCHAR2,
"
"                                      p_res     OUT    VARCHAR2
"
"                                      );
"
"
"
"   PROCEDURE proc_chk_excep_rdrp_cfg_mig(
"
"                                        p_bu            VARCHAR2,
"
"                                        p_user            VARCHAR2,
"
"                                        p_res        OUT    VARCHAR2
"
"                                        );
"
"
"
"   PROCEDURE proc_ins_rdrp_cfg_mig(
"
"                                  p_bu            VARCHAR2,
"
"                                  p_user        VARCHAR2,
"
"                                  p_res        OUT    VARCHAR2
"
"                                  );
"
"
"
"    /*Design Input Parameter Upload*/
"
"   PROCEDURE proc_upload_rdip_cfg_mig(
"
"                                     p_bu            VARCHAR2,
"
"                                     p_dir            VARCHAR2,
"
"                                     p_file_name    VARCHAR2,
"
"                                     p_user            VARCHAR2,
"
"                                     p_res        OUT    VARCHAR2
"
"                                     );
"
"
"
"   PROCEDURE proc_chk_excep_rdip_cfg_mig(
"
"                                        p_bu            VARCHAR2,
"
"                                        p_user            VARCHAR2,
"
"                                        p_res        OUT    VARCHAR2
"
"                                        );
"
"
"
"   PROCEDURE proc_ins_rdip_cfg_mig(
"
"                                  p_bu            VARCHAR2,
"
"                                  p_user        VARCHAR2,
"
"                                  p_res        OUT    VARCHAR2
"
"                                  );
"
"
"
"    /*Engineering/Expenses/Groups Upload*/
"
"   PROCEDURE proc_upload_proj_exp_group(
"
"                                       p_bu                VARCHAR2,
"
"                                       p_dir            VARCHAR2,
"
"                                       p_file_name        VARCHAR2,
"
"                                       p_user            VARCHAR2,
"
"                                       p_res     OUT    VARCHAR2
"
"                                       );
"
"
"
"   PROCEDURE proc_chk_prjo_exp_group(
"
"                                    p_bu         VARCHAR2,
"
"                                    p_user       VARCHAR2,
"
"                                    p_res   OUT  VARCHAR2
"
"                                    );
"
"
"
"   PROCEDURE proc_ins_proj_exp_groups(
"
"                                     p_bu          VARCHAR2,
"
"                                     p_user     VARCHAR2
"
"                                     );
"
"
"
"    /*Engineering/Expenses/Prefixes Upload*/
"
"   PROCEDURE proc_upload_proj_exp_prex(
"
"                                      p_bu            VARCHAR2,
"
"                                      p_dir            VARCHAR2,
"
"                                      p_file_name    VARCHAR2,
"
"                                      p_user        VARCHAR2,
"
"                                      p_res        OUT    VARCHAR2
"
"                                      );
"
"
"
"   PROCEDURE proc_chk_proj_expn_pfex(
"
"                                    p_bu         VARCHAR2,
"
"                                    p_user       VARCHAR2,
"
"                                    p_res   OUT  VARCHAR2
"
"                                    );
"
"
"
"   PROCEDURE proc_ins_proj_expn_pref(
"
"                                    p_bu      VARCHAR2,
"
"                                    p_user     VARCHAR2
"
"                                    );
"
"
"
"    /*Engineering/Resources/Resource Groups Upload*/
"
"   PROCEDURE proc_upld_eng_res_grp(
"
"                                      p_bu            VARCHAR2,
"
"                                      p_dir            VARCHAR2,
"
"                                      p_file_name    VARCHAR2,
"
"                                      p_user        VARCHAR2,
"
"                                      p_res        OUT    VARCHAR2
"
"                                      );
"
"
"
"   PROCEDURE proc_chk_eng_res_grp(
"
"                                    p_bu         VARCHAR2,
"
"                                    p_user       VARCHAR2,
"
"                                    p_res   OUT  VARCHAR2
"
"                                    );
"
"
"
"   PROCEDURE proc_ins_eng_res_grp(
"
"                                    p_bu      VARCHAR2,
"
"                                    p_user     VARCHAR2
"
"                                    );
"
"
"
"    /*Engineering/Resources/Resources Upload*/
"
"   PROCEDURE proc_upld_eng_res(
"
"                              p_bu            VARCHAR2,
"
"                              p_dir            VARCHAR2,
"
"                              p_file_name    VARCHAR2,
"
"                              p_user        VARCHAR2,
"
"                              p_res        OUT    VARCHAR2
"
"                              );
"
"
"
"   PROCEDURE proc_chk_eng_res(
"
"                              p_bu         VARCHAR2,
"
"                              p_user       VARCHAR2,
"
"                              p_res   OUT  VARCHAR2
"
"                              );
"
"
"
"   PROCEDURE proc_ins_eng_res(
"
"                              p_bu      VARCHAR2,
"
"                              p_user     VARCHAR2
"
"                              );
"
"
"
"    /*Key Performance Indicator Upload*/
"
"   PROCEDURE proc_upld_kpi_doc(
"
"                               p_bu                VARCHAR2,
"
"                               p_dir            VARCHAR2,
"
"                               p_file_name        VARCHAR2,
"
"                               p_user            VARCHAR2,
"
"                               p_res        OUT    VARCHAR2
"
"                               );
"
"
"
"   PROCEDURE proc_chk_kpi_excep
"
"                               (
"
"                               p_bu                VARCHAR2,
"
"                               p_user            VARCHAR2,
"
"                               p_res        OUT    VARCHAR2
"
"                               );
"
"
"
"   PROCEDURE proc_ins_kpi_doc
"
"                             (
"
"                             p_bu  VARCHAR2,
"
"                             p_user VARCHAR2
"
"                             );
"
"
"
"    /*Key Performance Indicator Targets Upload*/
"
"   PROCEDURE proc_upld_kpi_target_doc(
"
"                               p_bu                VARCHAR2,
"
"                               p_dir            VARCHAR2,
"
"                               p_file_name        VARCHAR2,
"
"                               p_user            VARCHAR2,
"
"                               p_res        OUT    VARCHAR2
"
"                               );
"
"
"
"   PROCEDURE proc_chk_kpi_target_excep
"
"                               (
"
"                               p_bu                VARCHAR2,
"
"                               p_user            VARCHAR2,
"
"                               p_res        OUT    VARCHAR2
"
"                               );
"
"
"
"   PROCEDURE proc_ins_kpi_target_doc
"
"                             (
"
"                             p_bu  VARCHAR2,
"
"                             p_user VARCHAR2
"
"                             );
"
"   /* Steel Conversion cost heads */
"
"   PROCEDURE proc_upld_cost_head(
"
"                               p_bu                VARCHAR2,
"
"                               p_dir            VARCHAR2,
"
"                               p_file_name        VARCHAR2,
"
"                               p_user            VARCHAR2,
"
"                               p_res        OUT    VARCHAR2
"
"                               );
"
"
"
"   PROCEDURE proc_chk_cost_head_excep
"
"                               (
"
"                               p_bu                VARCHAR2,
"
"                               p_user            VARCHAR2,
"
"                               p_res        OUT    VARCHAR2
"
"                               );
"
"
"
"   PROCEDURE proc_ins_cost_head (
"
"                             p_bu  VARCHAR2,
"
"                             p_user VARCHAR2
"
"                             );
"
"/*QC Process Rates*/
"
"   PROCEDURE proc_upload_qc_oth_rates (p_bu              VARCHAR2,
"
"                    p_group_id        VARCHAR2,
"
"                    p_file_name       VARCHAR2,
"
"                    p_user            VARCHAR2,
"
"                    p_variant     OUT VARCHAR2
"
"                    );
"
"
"
"   PROCEDURE proc_chk_qc_oth_rates(p_bu         VARCHAR2,
"
"                  p_user       VARCHAR2,
"
"                  p_fail   OUT VARCHAR2
"
"                  );
"
"
"
"   PROCEDURE proc_ins_qc_oth_rates(p_bu  VARCHAR2,
"
"                   p_user VARCHAR2
"
"                   );
"
"
"
"/*APQP Phase and APQP Parameter*/
"
"   PROCEDURE proc_upload_apqp_phase_param (p_bu            VARCHAR2,
"
"    p_type                  VARCHAR2,
"
"    p_dir            VARCHAR2,
"
"    p_file_name        VARCHAR2,
"
"    p_user                    VARCHAR2,
"
"    p_res               OUT    VARCHAR2
"
"                      );
"
"
"
"   PROCEDURE proc_chk_apqp_phase_param(p_bu            VARCHAR2,
"
"                    p_type                  VARCHAR2,
"
"                    p_user            VARCHAR2,
"
"                    p_res        OUT    VARCHAR2
"
"                       );
"
"
"
"   PROCEDURE proc_ins_apqp_phase_param(p_bu   VARCHAR2,
"
"                                       p_type VARCHAR2,
"
"                       p_user VARCHAR2
"
"                       );
"
"  /*Customer Support - CFG0077 */
"
" /* PROCEDURE proc_mig_cs_locality (p_bu            VARCHAR2,
"
"                      p_fname        VARCHAR2,
"
"                      p_sep            VARCHAR2,
"
"                      p_user        VARCHAR2,
"
"                  p_res        OUT    VARCHAR2
"
"                            );
"
"  PROCEDURE proc_mig_cs_locality_exp(p_bu        VARCHAR2,
"
"                       p_fname    VARCHAR2,
"
"                       p_sep        VARCHAR2,
"
"                       p_user        VARCHAR2,
"
"                   p_res    OUT    VARCHAR2
"
"                               )    ;
"
"  PROCEDURE proc_ins_cs_locality(p_bu        VARCHAR2,
"
"                     p_fname    VARCHAR2,
"
"                     p_sep        VARCHAR2,
"
"                     p_user        VARCHAR2
"
"                     );    */
"
"
"
"END pkg_config_migration;"
/
