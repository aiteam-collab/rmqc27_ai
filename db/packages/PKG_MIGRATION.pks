CREATE OR REPLACE
"PACKAGE pkg_migration
"
"AUTHID CURRENT_USER
"
"AS
"
"
"
"PROCEDURE proc_mig_stores(p_bu        VARCHAR2,
"
"                          p_fname    VARCHAR2,
"
"              p_user    VARCHAR2,
"
"              p_res        OUT    VARCHAR2
"
"             ); --STORES(CFG1091)
"
"
"
"PROCEDURE proc_ins_cust_schld_mirg(p_bu        VARCHAR2,
"
"                                   p_plnt    VARCHAR2,
"
"                                   p_doc_no    VARCHAR2,
"
"                   p_fname    VARCHAR2,
"
"                   p_sep    VARCHAR2,
"
"                   p_user    VARCHAR2
"
"                  ); -- Customer Schedule Day Wise
"
"
"
"PROCEDURE proc_ins_cust_schld(p_bu    VARCHAR2,
"
"                              p_plnt    VARCHAR2,
"
"                              p_doc_no    VARCHAR2,
"
"                  p_fname    VARCHAR2,
"
"                  p_sep    VARCHAR2,
"
"                  p_user    VARCHAR2,
"
"                  p_res  OUT VARCHAR2
"
"                 ); -- Customer Schedule Week Wise
"
"
"
"PROCEDURE proc_ins_sales_ord_ln(p_bu        VARCHAR2,
"
"                                p_ord_pfx    VARCHAR2,
"
"                    p_ord_no    VARCHAR2,
"
"                    p_fname        VARCHAR2,
"
"                    p_sep        VARCHAR2,
"
"                    p_user        VARCHAR2,
"
"                    p_res    OUT    VARCHAR2
"
"                   ); -- Sales Order Ln.
"
"
"
"/*PROCEDURE proc_ins_pos_item_mig(p_bu        VARCHAR2,
"
"                p_plnt        VARCHAR2,
"
"                p_fname        VARCHAR2,
"
"                p_sep        VARCHAR2,
"
"                p_user        VARCHAR2
"
"                   ); -- Point of Sales Item Migration*/
"
"
"
"PROCEDURE proc_ins_open_so_mig(p_bu        VARCHAR2,
"
"                   p_plnt        VARCHAR2,
"
"                   p_doc_no        VARCHAR2,
"
"                   p_fname        VARCHAR2,
"
"                   p_sep        VARCHAR2,
"
"                   p_user        VARCHAR2,
"
"                   p_res    OUT    VARCHAR2
"
"                   ); -- Open Sales Order
"
"
"
"PROCEDURE proc_ins_stk_cnt_mig(p_bu               business_units.bu_id%TYPE,
"
"                               p_plnt        stock_count_hd.schd_plnt%TYPE,
"
"                   p_ord_no        stock_count_hd.schd_ord_no%TYPE,
"
"                   p_store_id    stock_count_hd.schd_store_id%TYPE,
"
"                   p_file_name        stock_count_hd.schd_file_name%TYPE,
"
"                   p_sep        VARCHAR2,
"
"                   p_user             stock_count_hd.schd_cre_by%TYPE,
"
"                   p_res    OUT    VARCHAR2,
"
"                   p_emp_user       VARCHAR2
"
"                   ); -- Stock Count Entries
"
"
"
"PROCEDURE proc_ins_stk_adj_mig(p_bu               business_units.bu_id%TYPE,
"
"                   p_plnt        stock_adj_trans_hd.sathd_plnt%TYPE,
"
"                   p_ord_no        stock_adj_trans_hd.sathd_ord_no%TYPE,
"
"                   p_store_id    stock_adj_trans_hd.sathd_store_id%TYPE,
"
"                   p_file_name        stock_adj_trans_hd.sathd_file_name%TYPE,
"
"                   p_sep        VARCHAR2,
"
"                   p_user             stock_adj_trans_hd.sathd_cre_by%TYPE,
"
"                   p_res    OUT    VARCHAR2
"
"                  ); -- Stock Adjustments
"
"
"
"PROCEDURE proc_ins_open_po_mig(p_bu        business_units.bu_id%TYPE,
"
"                   p_doc_no        pur_rate_contr_mig_hd.prcmh_doc_no%TYPE,
"
"                   p_fname        pur_rate_contr_mig_hd.prcmh_file_name%TYPE,
"
"                   p_sep        VARCHAR2,
"
"           p_res  OUT    VARCHAR2,
"
"                   p_user        pur_rate_contr_mig_hd.prcmh_cre_by%TYPE
"
"                  ); -- Open Purchase Order
"
"
"
"PROCEDURE proc_ins_open_sc_mig(p_bu        business_units.bu_id%TYPE,
"
"                   p_doc_no        sc_rate_contr_mig_hd.scrcmh_doc_no%TYPE,
"
"                   p_fname        sc_rate_contr_mig_hd.scrcmh_file_name%TYPE,
"
"                   p_sep        VARCHAR2,
"
"                   p_user        sc_rate_contr_mig_hd.scrcmh_cre_by%TYPE
"
"                  ); -- Open Subcontract Order
"
"
"
"PROCEDURE proc_ins_sco_stk_mig(p_bu        business_units.bu_id%TYPE,
"
"                   p_plnt        upd_stk_opbal_hd.usoh_plnt%TYPE,
"
"                   p_doc_no        upd_stk_opbal_hd.usoh_doc_no%TYPE,
"
"                   p_fname        upd_stk_opbal_hd.usoh_file_name%TYPE,
"
"                   p_sep        VARCHAR2,
"
"                   p_user        upd_stk_opbal_hd.usoh_cre_by%TYPE,
"
"                   p_out  OUT   VARCHAR2
"
"                  ); -- Opening SCO Stock Migration
"
"
"
"PROCEDURE proc_ins_pend_po_mig(p_bu        business_units.bu_id%TYPE,
"
"                   p_doc_no        pur_order_mig_ln.poml_doc_no%TYPE,
"
"                   p_fname        pur_order_mig_hd.pomh_file_name%TYPE,
"
"                   p_sep        VARCHAR2,
"
"                   p_user        pur_order_mig_hd.pomh_cre_by%TYPE,
"
"                   p_res    OUT    VARCHAR2
"
"                   ); -- Pending Purchase Order
"
"
"
"PROCEDURE proc_ins_srcm_mig(p_bu        business_units.bu_id%TYPE,
"
"                   p_doc_no        sal_rtn_cm_mig_ln.srcml_doc_no%TYPE,
"
"                   p_fname        sal_rtn_cm_mig_hd.srcmh_file_name%TYPE,
"
"                   p_sep        VARCHAR2,
"
"                   p_user        sal_rtn_cm_mig_hd.srcmh_cre_by%TYPE
"
"                   ); -- Sales Return credit Memo
"
"
"
"PROCEDURE proc_ins_pend_so_mig(p_bu        VARCHAR2,
"
"                   p_doc_no        VARCHAR2,
"
"                   p_fname        VARCHAR2,
"
"                   p_sep        VARCHAR2,
"
"                   p_user        VARCHAR2,
"
"                   p_res   OUT  VARCHAR2
"
"                   );
"
"
"
"PROCEDURE proc_ins_pend_so_mig1(p_bu        business_units.bu_id%TYPE,
"
"                   p_doc_no        sales_order_mig_hd.somh_doc_no%TYPE,
"
"                   p_fname        sales_order_mig_hd.somh_file_name%TYPE,
"
"                   p_sep        VARCHAR2,
"
"                   p_user        sales_order_mig_hd.somh_cre_by%TYPE,
"
"                   p_res   OUT  VARCHAR2
"
"                   ); -- Pending Sales Order
"
"
"
"PROCEDURE proc_ins_enqry_mig(p_bu        business_units.bu_id%TYPE,
"
"                 p_doc_no        opport_hd.ophd_doc_no%TYPE,
"
"                 p_fname        VARCHAR2,
"
"                 p_sep        VARCHAR2,
"
"                 p_user        opport_hd.ophd_cre_by%TYPE
"
"                 );    -- Enquiry
"
"
"
"PROCEDURE proc_ins_leads_mig(p_bu        business_units.bu_id%TYPE,
"
"                 p_lead_no        mktg_leads.ml_lead_no%TYPE,
"
"                 p_fname        VARCHAR2,
"
"                 p_sep        VARCHAR2,
"
"                 p_user        mktg_leads.ml_cre_by%TYPE
"
"                 );    -- Leads
"
"
"
"/*PROCEDURE proc_ins_leads_mach_mig(p_bu        business_units.bu_id%TYPE,
"
"                       p_lead_no    mktg_leads.ml_lead_no%TYPE,
"
"                       p_fname    VARCHAR2,
"
"                       p_sep        VARCHAR2,
"
"                       p_user    mktg_leads.ml_cre_by%TYPE
"
"                       );    -- Machine Details in Leads*/
"
"
"
"PROCEDURE proc_ins_prosp_mig(p_bu        business_units.bu_id%TYPE,
"
"                 p_doc_no        prospects_migr_hd.pmhd_doc_no%TYPE,
"
"                 p_fname        VARCHAR2,
"
"                 p_sep        VARCHAR2,
"
"                 p_user        prospects_migr_hd.pmhd_cre_by%TYPE
"
"                 );    -- Prospects
"
"
"
"PROCEDURE proc_ins_instr_mig(p_bu        business_units.bu_id%TYPE,
"
"                 p_fname        VARCHAR2,
"
"                 p_sep        VARCHAR2,
"
"                 p_user        qc_instruments.qi_cre_by%TYPE
"
"                 );    -- Instruments
"
"
"
"PROCEDURE proc_ins_ls_frm_grn(p_bu               business_units.bu_id%TYPE,
"
"                  p_plnt        pur_ord_receipt_hd.porh_plnt%TYPE,
"
"                  p_rcpt_pfx    pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"                  p_rcpt_no        pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"                  p_file_name        VARCHAR2,
"
"                  p_sep        VARCHAR2,
"
"                  p_user             pur_ord_receipt_hd.porh_cre_by%TYPE
"
"                 ); -- Purchase Receipt
"
"
"
"PROCEDURE proc_ins_ls_frm_grn1(p_bu               business_units.bu_id%TYPE,
"
"                   p_rcpt_pfx    pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"                   p_rcpt_no    pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"                   p_file_name        VARCHAR2,
"
"                   p_sep        VARCHAR2,
"
"                   p_user             pur_ord_receipt_hd.porh_cre_by%TYPE
"
"                  ); -- Purchase Receipt
"
"
"
"/*PROCEDURE proc_ins_bale_frm_grn(p_bu               business_units.bu_id%TYPE,
"
"                    p_plnt        pur_ord_receipt_hd.porh_plnt%TYPE,
"
"                    p_rcpt_pfx    pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"                    p_rcpt_no    pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"                p_rcpt_seq_no    pur_ord_receipt_ln.porl_seq_no%TYPE,
"
"                p_ls_seq_no    pur_rcpt_lot_serial.prcls_seq_no%TYPE,
"
"                    p_fname        VARCHAR2,
"
"                    p_user        pur_ord_receipt_hd.porh_cre_by%TYPE
"
"                   ); -- Purchase Receipt*/
"
"
"
"/*PROCEDURE proc_ins_migr_item (p_bu               business_units.bu_id%TYPE,
"
"                    p_doc_no          prod_migr_hd.pmh_doc_no%TYPE,
"
"                    p_fname        VARCHAR2,
"
"                    p_user        prod_migr_hd.pmh_cre_by%TYPE
"
"                 ); -- item migration*/
"
"
"
"PROCEDURE proc_ins_attr(p_bu                business_units.bu_id%TYPE,
"
"             p_po_pfx        pur_order_hd.poh_order_pfx%TYPE,
"
"             p_po_no        pur_order_hd.poh_order_no%TYPE,
"
"               p_fname            VARCHAR2,
"
"               p_user            pur_order_hd.poh_cre_by%TYPE
"
"            ); --Purchase request
"
"
"
"PROCEDURE proc_ins_ls_frm_mi(p_bu               business_units.bu_id%TYPE,
"
"                  p_doc_no        inv_stock_trans_hd.isthd_doc_no%TYPE,
"
"                  p_file_name        VARCHAR2,
"
"                  p_sep        VARCHAR2,
"
"                  p_user             inv_stock_trans_hd.isthd_cre_by%TYPE
"
"                 ); -- Material Issue.
"
"
"
"PROCEDURE proc_ins_addr_amc_warranty(p_bu               business_units.bu_id%TYPE,
"
"                     p_plnt               warr_amc_agrmnt_hd.waah_plnt%TYPE,
"
"                         p_doc_no        warr_amc_agrmnt_hd.waah_doc_no%TYPE,
"
"                         p_file_name        VARCHAR2,
"
"                         p_sep        VARCHAR2,
"
"                         p_user             warr_amc_agrmnt_hd.waah_cre_by%TYPE
"
"                         );
"
"
"
"/*PROCEDURE proc_ins_feed_price(p_bu     VARCHAR2,
"
"                              p_doc_no    VARCHAR2,
"
"                              p_doc_rev    NUMBER,
"
"                  p_fname    VARCHAR2,
"
"                  p_sep    VARCHAR2,
"
"                  p_user    VARCHAR2
"
"                  );
"
"
"
"PROCEDURE proc_ins_feed_disc(p_bu     VARCHAR2,
"
"                             p_doc_no    VARCHAR2,
"
"                             p_doc_rev    NUMBER,
"
"                       p_fname    VARCHAR2,
"
"                       p_sep    VARCHAR2,
"
"                       p_user    VARCHAR2
"
"                       );*/
"
"
"
"/*PROCEDURE proc_ins_ord_review_mirg  (p_bu               business_units.bu_id%TYPE,
"
"                     p_plnt               sales_ord_check_list.socl_plnt_id%TYPE,
"
"                         p_doc_no        sales_ord_check_list.socl_doc_no%TYPE,
"
"                         p_file_name        VARCHAR2,
"
"                         p_sep        VARCHAR2,
"
"                         p_user             sales_ord_check_list.socl_cre_by%TYPE
"
"                         )    ;*/
"
"
"
"PROCEDURE proc_ins_so_target_mig(p_bu        business_units.bu_id%TYPE,
"
"                     p_fname    VARCHAR2,
"
"                     p_sep        VARCHAR2,
"
"                     p_user        SALE_VAL_CUST_PROD_TARGET.SVCT_CRE_BY%TYPE
"
"                     ) ;
"
"
"
"PROCEDURE proc_ins_cust_schld_mig(p_bu        business_units.bu_id%TYPE,
"
"                     p_plnt     bus_unit_plants.bup_plant_id%TYPE,
"
"                     p_batch_no     cust_order_hd.cohd_batch_no%TYPE,
"
"                     p_fname    VARCHAR2,
"
"                     p_sep        VARCHAR2,
"
"                     p_user        cust_order_hd.cohd_cre_by%TYPE,
"
"                     p_res        OUT VARCHAR2
"
"                     ) ;--customer schedule migration
"
"
"
"PROCEDURE proc_ins_cust_schld_multi_mig(p_bu        business_units.bu_id%TYPE,
"
"                     p_plnt     bus_unit_plants.bup_plant_id%TYPE,
"
"                     p_batch_no     cust_order_hd.cohd_batch_no%TYPE,
"
"                     p_cust_id     cust_order_hd.cohd_cust_id%TYPE,
"
"                     p_fname    VARCHAR2,
"
"                     p_sep        VARCHAR2,
"
"                     p_user        cust_order_hd.cohd_cre_by%TYPE
"
"                     ) ;--customer schedule multi migration
"
"
"
"PROCEDURE proc_ins_si_pack_mig(p_bu        VARCHAR2,
"
"                                  p_plnt     VARCHAR2,
"
"                  p_doc_no    VARCHAR2,
"
"                  p_fname    VARCHAR2,
"
"                  p_sep        VARCHAR2,
"
"                  p_user        VARCHAR2,
"
"                  p_res           OUT VARCHAR2
"
"                 ) ;--Sales Inv. Packing migration
"
"
"
"PROCEDURE proc_ins_so_amd_upld(p_bu        VARCHAR2,
"
"                               p_plnt     VARCHAR2,
"
"                   p_doc_no    VARCHAR2,
"
"                   p_fname    VARCHAR2,
"
"                   p_sep        VARCHAR2,
"
"                   p_user        VARCHAR2,
"
"                   p_res           OUT VARCHAR2
"
"                  ) ;--SO Amd. Upld.
"
"
"
"PROCEDURE proc_ins_cust_schld_tata_mig(p_bu        business_units.bu_id%TYPE,
"
"                       p_plnt         bus_unit_plants.bup_plant_id%TYPE,
"
"                       p_batch_no     cust_order_hd.cohd_batch_no%TYPE,
"
"                       p_cust_id     cust_order_hd.cohd_cust_id%TYPE,
"
"                       p_fname            VARCHAR2,
"
"                       p_sep        VARCHAR2,
"
"                       p_user        cust_order_hd.cohd_cre_by%TYPE,
"
"                       p_res    OUT    VARCHAR2
"
"                      );--customer schedule tata migration
"
"
"
"PROCEDURE proc_ins_cust_schld_mah_mig(p_bu        business_units.bu_id%TYPE,
"
"                      p_plnt         bus_unit_plants.bup_plant_id%TYPE,
"
"                      p_batch_no     cust_order_hd.cohd_batch_no%TYPE,
"
"                      p_fname            VARCHAR2,
"
"                      p_sep        VARCHAR2,
"
"                      p_user        cust_order_hd.cohd_cre_by%TYPE,
"
"                      p_res    OUT    VARCHAR2
"
"                      );--customer schedule Mahindra migration
"
"
"
"PROCEDURE proc_ins_po_mig(p_bu        business_units.bu_id%TYPE,
"
"              p_plnt     bus_unit_plants.bup_plant_id%TYPE,
"
"                          p_ord_pfx     pur_order_hd.poh_order_pfx%TYPE,
"
"              p_ord_no    pur_order_hd.poh_order_no%TYPE,
"
"              p_fname    VARCHAR2,
"
"              p_sep        VARCHAR2,
"
"              p_type     VARCHAR2,
"
"              p_user    pur_order_hd.poh_cre_by%TYPE
"
"              ); --Purchase Order
"
"
"
"PROCEDURE proc_ins_svo_mig(p_bu        business_units.bu_id%TYPE,
"
"               p_fname    VARCHAR2,
"
"               p_sep    VARCHAR2,
"
"               p_user    service_order_hd.svohd_cre_by%TYPE
"
"               );    -- Service Order
"
"
"
"PROCEDURE proc_ins_std_price_mig(p_bu         VARCHAR2,
"
"                                 p_doc_no    VARCHAR2,
"
"                           p_fname    VARCHAR2,
"
"                           p_sep        VARCHAR2,
"
"                           p_user        VARCHAR2
"
"                           );  -- Standard Price Migration
"
"
"
"PROCEDURE proc_ins_std_price_mig_tra(p_bu         VARCHAR2,
"
"                                      p_doc_no    VARCHAR2,
"
"                                p_fname    VARCHAR2,
"
"                                p_sep        VARCHAR2,
"
"                                p_user        VARCHAR2
"
"                               );  -- Standard Price Migration - Trading
"
"
"
"PROCEDURE proc_ins_std_price_mig_exp(p_bu         VARCHAR2,
"
"                                     p_doc_no        VARCHAR2,
"
"                               p_user        VARCHAR2
"
"                              );  -- Standard Price Migration Exception
"
"
"
"PROCEDURE proc_ins_std_price_mig_exp_tra(p_bu         VARCHAR2,
"
"                                     p_doc_no        VARCHAR2,
"
"                               p_user        VARCHAR2
"
"                              );  -- Standard Price Migration Exception - Trading
"
"
"
"/*PROCEDURE proc_ins_hci_price_mig(p_bu         VARCHAR2,
"
"                           p_fname    VARCHAR2,
"
"                           p_sep        VARCHAR2,
"
"                           p_user        VARCHAR2
"
"                           );  -- Health care price Migration*/
"
"
"
"PROCEDURE proc_ins_po_price_list_mig(p_bu        business_units.bu_id%TYPE,
"
"                         p_fname        VARCHAR2,
"
"                         p_sep        VARCHAR2,
"
"                     p_res     OUT     VARCHAR2,
"
"                         p_user        pur_sc_price_list.pspl_cre_by%TYPE
"
"                 );
"
"
"
"PROCEDURE proc_ins_corp_sr_temp(p_bu         VARCHAR2,
"
"                   p_doc_no        VARCHAR2,
"
"                   p_fname        VARCHAR2,
"
"                   p_sep        VARCHAR2,
"
"                   p_user        VARCHAR2
"
"                   );
"
"
"
"PROCEDURE proc_ins_po_price_bulk_mig(p_bu         business_units.bu_id%TYPE,
"
"                     p_fname        VARCHAR2,
"
"                     p_doc_no            VARCHAR2,
"
"                     p_sep        VARCHAR2,
"
"                     p_user        suplr_price_list_ln.spll_cre_by%TYPE
"
"                     );
"
"
"
"PROCEDURE proc_ins_pur_buyer(p_bu        business_units.bu_id%TYPE,
"
"                 p_fname        VARCHAR2,
"
"                 p_sep        VARCHAR2,
"
"                 p_res     OUT     VARCHAR2,
"
"                 p_user        suplr_price_list_ln.spll_cre_by%TYPE
"
"                );
"
"
"
"PROCEDURE proc_ins_pur_attribute(p_bu        business_units.bu_id%TYPE,
"
"                     p_fname        VARCHAR2,
"
"                     p_sep        VARCHAR2,
"
"                 p_res     OUT     VARCHAR2,
"
"                     p_user        suplr_price_list_ln.spll_cre_by%TYPE
"
"                    );
"
"
"
"PROCEDURE proc_ins_pur_amd_reason(p_bu        business_units.bu_id%TYPE,
"
"                      p_fname        VARCHAR2,
"
"                      p_sep                VARCHAR2,
"
"                  p_res     OUT     VARCHAR2,
"
"                      p_user        suplr_price_list_ln.spll_cre_by%TYPE
"
"                    );
"
"
"
"PROCEDURE proc_ins_tqm_observ_mig(p_bu               business_units.bu_id%TYPE,
"
"                      p_qc_no        tqm_qc_hd.tqhd_qc_no%TYPE,
"
"                      p_file_name        VARCHAR2,
"
"                      p_sep            VARCHAR2,
"
"                  p_res        OUT     VARCHAR2,
"
"                      p_user             tqm_qc_hd.tqhd_cre_by%TYPE
"
"                  );
"
"
"
"PROCEDURE proc_ins_tqm_elemt_obs_mig(p_bu               business_units.bu_id%TYPE,
"
"                     p_qc_pfx        tqm_qc_hd.tqhd_qc_pfx%TYPE,
"
"                         p_qc_no        tqm_qc_hd.tqhd_qc_no%TYPE,
"
"                     p_qc_rev        tqm_qc_hd.tqhd_qc_rev%TYPE,
"
"                         p_file_name        VARCHAR2,
"
"                         p_sep        VARCHAR2,
"
"                         p_user             tqm_qc_hd.tqhd_cre_by%TYPE
"
"                    );
"
"
"
"PROCEDURE proc_ins_sub_class_mig(p_bu        business_units.bu_id%TYPE,
"
"                     p_fname    VARCHAR2,
"
"                     p_sep        VARCHAR2,
"
"                     p_user        suplr_price_list_ln.spll_cre_by%TYPE
"
"                    );
"
"
"
"PROCEDURE proc_drop_exist_table(p_table_name     VARCHAR2);
"
"
"
"PROCEDURE proc_ins_insp_plan_mig(p_bu             business_units.bu_id%TYPE,
"
"                     p_doc_no        VARCHAR2,
"
"                     p_fname        VARCHAR2,
"
"                     p_sep            VARCHAR2,
"
"                     p_user            VARCHAR2,
"
"                 p_res        OUT    VARCHAR2,
"
"                 p_dir            varchar2
"
"                    );
"
"PROCEDURE proc_ins_insp_plan_mig_exp(p_bu         business_units.bu_id%TYPE,
"
"                         p_doc_no        VARCHAR2,
"
"                         p_user        VARCHAR2,
"
"                 p_res        OUT    VARCHAR2
"
"                        );
"
"PROCEDURE proc_ins_insp_plan_mig_dtls(p_bu         business_units.bu_id%TYPE,
"
"                          p_doc_no        VARCHAR2,
"
"                          p_user        VARCHAR2,
"
"                      p_res        OUT    VARCHAR2
"
"                          );
"
"
"
"PROCEDURE proc_ins_camp_lead_mig(p_bu         VARCHAR2,
"
"                                 p_camp_id      VARCHAR2,
"
"                     p_fname    VARCHAR2,
"
"                     p_sep        VARCHAR2,
"
"                     p_user        VARCHAR2
"
"                     );  -- MKG1000(Leads Generated)
"
"
"
"PROCEDURE proc_ins_camp_lead_mig_exp(p_bu         VARCHAR2,
"
"                                     p_camp_id        VARCHAR2,
"
"                               p_user        VARCHAR2
"
"                              );-- MKG1000(Leads Generated Exception)
"
"
"
"PROCEDURE proc_ins_si_serial_mig(p_bu         VARCHAR2,
"
"                                 p_plnt        VARCHAR2,
"
"                 p_doc_no    VARCHAR2,
"
"                 p_seq_no    NUMBER,
"
"                 p_store_id     VARCHAR2,
"
"                 p_prod_id    VARCHAR2,
"
"                 p_prod_rev    NUMBER,
"
"                 p_fname    VARCHAR2,
"
"                 p_sep        VARCHAR2,
"
"                 p_user        VARCHAR2
"
"                 );--Sales Serial Migration
"
"
"
"PROCEDURE proc_load_godown_stk_mig(p_bu               business_units.bu_id%TYPE,
"
"                       p_plnt        fsnr_go_down_stock_hd.fgdsh_plnt%TYPE,
"
"                       p_doc_no        fsnr_go_down_stock_hd.fgdsh_doc_no%TYPE,
"
"                       p_file_name        VARCHAR2,
"
"                       p_user             fsnr_go_down_stock_hd.fgdsh_cre_by%TYPE
"
"                      ); --ICM1003
"
"
"
"PROCEDURE proc_load_slab_qty_mig(p_bu               business_units.bu_id%TYPE,
"
"                     p_file_name        VARCHAR2,
"
"                     p_user             prod_mfg_slab_master.pmsm_cre_by%TYPE
"
"                    ); --SFC1711
"
"
"
"PROCEDURE proc_ins_tc_group(p_bu               business_units.bu_id%TYPE,
"
"                p_fname                VARCHAR2,
"
"                p_sep               VARCHAR2,
"
"                p_res     OUT     VARCHAR2,
"
"                p_user             tnc_attr_groups.tag_cre_by%TYPE
"
"                    ); --CFG0180
"
"
"
"END pkg_migration;"
/
