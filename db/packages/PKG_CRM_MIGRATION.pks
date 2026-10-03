CREATE OR REPLACE
"PACKAGE pkg_crm_migration
"
"AUTHID CURRENT_USER
"
"AS
"
"
"
"PROCEDURE proc_ins_spons (p_bu       VARCHAR2,
"
"                          p_fname    VARCHAR2,
"
"                          p_sep      VARCHAR2,
"
"                          p_user     VARCHAR2); --Sponsors CFG0150
"
"
"
"PROCEDURE proc_ins_target_audience(p_bu       VARCHAR2,
"
"                                   p_fname    VARCHAR2,
"
"                                   p_sep      VARCHAR2,
"
"                                   p_user     VARCHAR2); --Target Audience CFG0150
"
"
"
"PROCEDURE proc_ins_lead_cls_reasn(p_bu       VARCHAR2,
"
"                                  p_fname    VARCHAR2,
"
"                                  p_sep      VARCHAR2,
"
"                                  p_user     VARCHAR2); --Target Audience CFG0150
"
"
"
"PROCEDURE proc_ins_crm_group(p_bu       VARCHAR2,
"
"                             p_fname    VARCHAR2,
"
"                             p_sep      VARCHAR2,
"
"                             p_user     VARCHAR2); --CRM GROUP CFG0150
"
"
"
"PROCEDURE proc_ins_lead_stages(p_bu       VARCHAR2,
"
"                               p_fname    VARCHAR2,
"
"                               p_sep      VARCHAR2,
"
"                               p_user     VARCHAR2); --Lead Stages CFG0150
"
"
"
"
"
"PROCEDURE proc_ins_enq_cls_reasn(p_bu       VARCHAR2,
"
"                                 p_fname    VARCHAR2,
"
"                                 p_sep      VARCHAR2,
"
"                                 p_user     VARCHAR2); --Enquiry Close Reason CFG0150
"
"
"
"PROCEDURE proc_ins_enq_stg (p_bu       VARCHAR2,
"
"                            p_fname    VARCHAR2,
"
"                            p_sep      VARCHAR2,
"
"                            p_user     VARCHAR2);--Enquiry Stage CFG0150
"
"
"
"PROCEDURE proc_ins_sales_area_mig (p_bu       VARCHAR2,
"
"                                   p_fname    VARCHAR2,
"
"                                   p_sep      VARCHAR2,
"
"                                   p_user     VARCHAR2);  --Sales Area CFG0210--
"
"
"
"PROCEDURE proc_ins_sales_terr_mig (p_bu       VARCHAR2,
"
"                                   p_fname    VARCHAR2,
"
"                                   p_sep      VARCHAR2,
"
"                                   p_user     VARCHAR2);   --Sales Terr CFG0210------
"
"
"
"PROCEDURE proc_ins_sales_sub_terr_mig (p_bu       VARCHAR2,
"
"                       p_fname    VARCHAR2,
"
"                       p_sep      VARCHAR2,
"
"                       p_user     VARCHAR2);  -- Sales Sub Terr CFG0210--
"
"
"
"PROCEDURE proc_ins_sales_person_mig(p_bu       VARCHAR2,
"
"                    p_fname    VARCHAR2,
"
"                    p_sep      VARCHAR2,
"
"                    p_user     VARCHAR2);  --Sales Person CFG0210--
"
"
"
"PROCEDURE proc_ins_gate_enty_mig (p_bu       VARCHAR2,
"
"                  p_fname    VARCHAR2,
"
"                  p_sep      VARCHAR2,
"
"                  p_user     VARCHAR2);  ---Gate No. CFG0183--
"
"PROCEDURE proc_ins_gate_keeper_mig (p_bu       VARCHAR2,
"
"                                    p_fname    VARCHAR2,
"
"                                    p_sep      VARCHAR2,
"
"                                    p_user     VARCHAR2);  ---Gate KEEPER. CFG0183--
"
"
"
"PROCEDURE  proc_ins_major_class(p_bu       VARCHAR2,
"
"                                p_fname    VARCHAR2,
"
"                                p_sep      VARCHAR2,
"
"                                p_user     VARCHAR2,
"
"                               p_res      OUT    VARCHAR2 ); ----Major Class. CFG0190
"
"
"
"PROCEDURE proc_ins_dept_grp_asso_mig (p_bu       VARCHAR2,
"
"                                      p_fname    VARCHAR2,
"
"                                      p_sep      VARCHAR2,
"
"                                      p_user     VARCHAR2);--Dept Grp Asso. CFG0150--
"
"
"
" PROCEDURE proc_ins_enq_para  (p_bu       VARCHAR2,
"
"                               p_fname    VARCHAR2,
"
"                               p_sep      VARCHAR2,
"
"                               p_user     VARCHAR2);    --enq para. CFG0150--
"
"
"
" PROCEDURE proc_ins_class  (p_bu        VARCHAR2,
"
"                       p_fname    VARCHAR2,
"
"                       p_sep        VARCHAR2,
"
"                       p_user      VARCHAR2); ---Classes. CFG0190 --
"
"
"
"PROCEDURE proc_ins_quot_attr_mig (p_bu       VARCHAR2,
"
"                      p_fname    VARCHAR2,
"
"                      p_sep      VARCHAR2,
"
"                                  p_user     VARCHAR2);  -- Quot -> Attribute CFG0150 --
"
"
"
"PROCEDURE proc_ins_open_sco_mig_ln(p_bu              VARCHAr2,
"
"                   p_doc_no          VARCHAr2,
"
"                   p_fname           VARCHAR2,
"
"                   p_sep             VARCHAR2,
"
"                   p_user           VARCHAR2
"
"                   ); -- Open SCO Migration
"
"
"
"
"
"END pkg_crm_migration;"
/
