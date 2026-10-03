CREATE OR REPLACE
"PACKAGE pkg_fvr_spare
"
"AS
"
"  PROCEDURE proc_cre_stk_decr_new_fvr(p_bu        fld_visit_rpt_hd.fvrh_bu%TYPE,
"
"                      p_plnt        prod_plants.prodplnt_plnt%TYPE,
"
"                      p_plnt_loc_id      fld_visit_rpt_hd.fvrh_plnt_loc_id%TYPE,
"
"                      p_plnt_loc_name      fld_visit_rpt_hd.fvrh_plnt_loc_name%TYPE,
"
"                      p_doc_no        fld_visit_rpt_hd.fvrh_doc_no%TYPE,
"
"                      p_user        fld_visit_rpt_hd.fvrh_cre_by%TYPE
"
"                     );
"
"
"
"  PROCEDURE proc_cre_mi_frm_fvr_rplce(p_bu        business_units.bu_id%TYPE,
"
"                                      p_plnt        bus_unit_plants.bup_plant_id%TYPE,
"
"                      p_plnt_loc_id      fld_visit_rpt_hd.fvrh_plnt_loc_id%TYPE,
"
"                      p_plnt_loc_name      fld_visit_rpt_hd.fvrh_plnt_loc_name%TYPE,
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
"  PROCEDURE proc_cre_post_quote_frm_fvr(p_bu    fld_visit_rpt_hd.fvrh_bu%TYPE,
"
"                        p_plnt    prod_plants.prodplnt_plnt%TYPE,
"
"                        p_plnt_loc_id      fld_visit_rpt_hd.fvrh_plnt_loc_id%TYPE,
"
"                        p_plnt_loc_name      fld_visit_rpt_hd.fvrh_plnt_loc_name%TYPE,
"
"                        p_doc_no    fld_visit_rpt_hd.fvrh_doc_no%TYPE,
"
"                        p_user    fld_visit_rpt_hd.fvrh_cre_by%TYPE
"
"                        );
"
"
"
"END pkg_fvr_spare;"
/
