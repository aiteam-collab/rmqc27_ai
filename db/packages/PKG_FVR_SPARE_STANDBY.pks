CREATE OR REPLACE
"PACKAGE pkg_fvr_spare_standby
"
"AS
"
"
"
"  PROCEDURE proc_cre_stndby_decr_new_fvr(p_bu            business_units.bu_id%TYPE,
"
"                         p_plnt            bus_unit_plants.bup_plant_id%TYPE,
"
"                         p_plnt_loc_id        fld_visit_rpt_hd.fvrh_plnt_loc_id%TYPE,
"
"                         p_plnt_loc_name    fld_visit_rpt_hd.fvrh_plnt_loc_name%TYPE,
"
"                         p_doc_no        fld_visit_rpt_hd.fvrh_doc_no%TYPE,
"
"                         p_user            VARCHAR2
"
"                        );
"
"
"
"  PROCEDURE proc_cre_mi_frm_fvr_stdby(p_bu        business_units.bu_id%TYPE,
"
"                                      p_plnt        bus_unit_plants.bup_plant_id%TYPE,
"
"                                      p_plnt_loc_id     fld_visit_rpt_hd.fvrh_plnt_loc_id%TYPE,
"
"                      p_plnt_loc_name    fld_visit_rpt_hd.fvrh_plnt_loc_name%TYPE,
"
"                                      p_date        DATE,
"
"                                      p_doc_no        fld_visit_rpt_hd.fvrh_doc_no%TYPE,
"
"                                      p_frm_store_id    stores.store_id%TYPE,
"
"                                      p_user        VARCHAR2,
"
"                                      p_lang        NUMBER
"
"                                     );
"
"
"
"  PROCEDURE proc_cre_mi_frm_cust_gc(p_bu        business_units.bu_id%TYPE,
"
"                                    p_plnt        bus_unit_plants.bup_plant_id%TYPE,
"
"                                    p_plnt_loc_id    fld_visit_rpt_hd.fvrh_plnt_loc_id%TYPE,
"
"                    p_plnt_loc_name    fld_visit_rpt_hd.fvrh_plnt_loc_name%TYPE,
"
"                                    p_date        DATE,
"
"                                    p_doc_no        fld_visit_rpt_hd.fvrh_doc_no%TYPE,
"
"                                    p_user        VARCHAR2,
"
"                                    p_lang        NUMBER,
"
"                    p_res    OUT    VARCHAR2
"
"                                    );
"
"
"
"  PROCEDURE proc_cre_mi_frm_toplnt_cust_gc(p_bu        business_units.bu_id%TYPE,
"
"                                    p_plnt        bus_unit_plants.bup_plant_id%TYPE,
"
"                                    p_plnt_loc_id    fld_visit_rpt_hd.fvrh_plnt_loc_id%TYPE,
"
"                    p_plnt_loc_name    fld_visit_rpt_hd.fvrh_plnt_loc_name%TYPE,
"
"                                    p_date        DATE,
"
"                                    p_doc_no        fld_visit_rpt_hd.fvrh_doc_no%TYPE,
"
"                                    p_user        VARCHAR2,
"
"                                    p_lang        NUMBER,
"
"                    p_res    OUT    VARCHAR2
"
"                                    );
"
"
"
"   PROCEDURE proc_ins_cmt_hist (p_bu               VARCHAR2,
"
"                                p_doc_no           VARCHAR2,
"
"                                p_date             DATE,
"
"                                p_store_id         VARCHAR2,
"
"                                p_prod_id          VARCHAR2,
"
"                                p_prod_rev         NUMBER,
"
"                                p_ser_no           VARCHAR2,
"
"                                p_csr_id           VARCHAR2,
"
"                                p_wo_no            VARCHAR2,
"
"                                p_wo_unit          VARCHAR2,
"
"                                p_csr_no           VARCHAR2,
"
"                                p_trans_qty        NUMBER,
"
"                                p_transit_qty      NUMBER,
"
"                                p_wo_qty           NUMBER,
"
"                                p_buf_stk_qty      NUMBER,
"
"                                p_rpr_comp_flag    VARCHAR2,
"
"                                p_user             VARCHAR2,
"
"                                p_sys_ls_no        VARCHAR2,
"
"                                p_source_type      VARCHAR2,
"
"                                p_source_id        VARCHAR2,
"
"                                p_batch_no         VARCHAR2,
"
"                                p_bucket_type      VARCHAR2,
"
"                                p_fvr_no           VARCHAR2,
"
"                                p_fvr_seq_no       NUMBER,
"
"                                p_rwk_ord_no       VARCHAR2,
"
"                                p_type             VARCHAR2,
"
"                                p_status           VARCHAR2,
"
"                                p_ref              VARCHAR2,
"
"                                p_unit_cost        NUMBER,
"
"                                p_branch_miv_no    VARCHAR2,
"
"                p_sou_plnt         VARCHAR2,
"
"                p_fv_type        VARCHAR2
"
"                );
"
"
"
"END pkg_fvr_spare_standby;"
/
