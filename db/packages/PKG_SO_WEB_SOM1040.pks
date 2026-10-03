CREATE OR REPLACE
"PACKAGE PKG_SO_WEB_SOM1040
"
"AS
"
"   PROCEDURE proc_so_item_assign_web (
"
"      p_soh_bu                   IN     VARCHAR2,
"
"      p_user                     IN     VARCHAR2,
"
"      p_lang                     IN     VARCHAR2,
"
"      p_soh_plant                IN     VARCHAR2,
"
"      p_soh_plant_loc_id         IN     VARCHAR2,
"
"      p_soh_order_pfx            IN     VARCHAR2,
"
"      p_soh_order_no             IN     VARCHAR2,
"
"      p_soh_cust_id              IN     VARCHAR2,
"
"      p_soh_order_type           IN     VARCHAR2,
"
"      p_soh_order_date           IN     DATE,
"
"      p_soq_prod_id              IN     VARCHAR2,
"
"      p_soq_prod_rev             IN     NUMBER,
"
"      p_soq_uom                  IN OUT VARCHAR2,
"
"      p_soh_currency             IN     VARCHAR2,
"
"      p_soq_cust_prod_id         IN OUT VARCHAR2,
"
"      p_soq_price_basis             OUT VARCHAR2,
"
"      p_soq_cust_prod_desc          OUT VARCHAR2,
"
"      p_soq_price_uom               OUT VARCHAR2,
"
"      p_soq_prod_desc1              OUT VARCHAR2,
"
"      p_soq_sub_cls                 OUT VARCHAR2,
"
"      p_soq_tolerance_pct           OUT NUMBER,
"
"      p_soq_cont_cat_no          IN OUT VARCHAR2,
"
"      p_soq_sales_price_class    IN OUT VARCHAR2,
"
"      p_soq_price                   OUT NUMBER,
"
"      p_price_class_desc            OUT VARCHAR2,
"
"      p_soq_catalog_no           IN     VARCHAR2,
"
"      p_soq_class_id             IN OUT VARCHAR2,
"
"      p_soq_mrp_price               OUT VARCHAR2,
"
"      p_soq_assemb_no               OUT VARCHAR2,
"
"      p_soq_price_conv_factor       OUT VARCHAR2,
"
"      p_soq_prod_net_weight         OUT VARCHAR2,
"
"      p_soq_prod_gross_weight       OUT VARCHAR2,
"
"      p_soq_tac_rqrd_flag           OUT VARCHAR2,
"
"      p_soq_prod_uom             IN OUT VARCHAR2,
"
"      p_soq_conv_factor          IN OUT VARCHAR2,
"
"      p_soh_cust_po_no           IN     VARCHAR2,
"
"      p_soh_cust_po_rev          IN     VARCHAR2,
"
"      p_soh_cust_po_date         IN     VARCHAR2,
"
"      p_soq_cust_po_no           IN OUT VARCHAR2,
"
"      p_soq_cust_po_rev             OUT VARCHAR2,
"
"      p_soq_cust_po_date            OUT VARCHAR2,
"
"      p_soq_prod_grade_id           OUT VARCHAR2,
"
"      p_grade_desc                  OUT VARCHAR2,
"
"      p_soq_prod_cat_id             OUT VARCHAR2,
"
"      p_soq_cat_desc                OUT VARCHAR2,
"
"      p_soq_prod_size               OUT VARCHAR2,
"
"      p_prod_size_desc              OUT VARCHAR2,
"
"      p_soq_prod_pack_size          OUT VARCHAR2,
"
"      p_prod_pack_size              OUT VARCHAR2,
"
"      p_soq_prod_grp                OUT VARCHAR2,
"
"      p_soq_prod_subgrp             OUT VARCHAR2,
"
"      p_soq_instl_rqrd_flag         OUT VARCHAR2,
"
"      p_soq_prod_tar_weight         OUT VARCHAR2,
"
"      p_soq_prj_type                OUT VARCHAR2,
"
"      p_soq_gross_price             OUT NUMBER,
"
"      p_soq_duty_drawback_flag      OUT VARCHAR2,
"
"      p_soq_stl_std_spec_id         OUT VARCHAR2,
"
"      p_soq_prod_cls_desc           OUT VARCHAR2,
"
"      p_soq_prod_subcls_desc        OUT VARCHAR2,
"
"      p_soq_prod_grp_desc           OUT VARCHAR2,
"
"      p_soq_prod_subgrp_desc        OUT VARCHAR2,
"
"      p_soq_prod_ext_desc           OUT VARCHAR2,
"
"      p_stk_qty                     OUT NUMBER,
"
"      p_soq_tcf_id                  OUT VARCHAR2,
"
"      p_soh_gst_cust_type        IN     VARCHAR2,
"
"      p_soq_gst_input_type          OUT VARCHAR2,
"
"      p_soh_billto_loc_id               VARCHAR2,
"
"      p_soh_gst_w_wo_pay_flag           VARCHAR2,
"
"      p_soq_hsn_code                OUT VARCHAR2,
"
"      p_soq_tax_set_id              OUT VARCHAR2,
"
"      p_tax_desc                    OUT VARCHAR2,
"
"      p_drw_no                      OUT VARCHAR2,
"
"      p_drw_rev                     OUT VARCHAR2,
"
"      p_soq_sal_acct_desc           OUT VARCHAR2,
"
"      p_soq_desp_date               OUT DATE,
"
"      p_soq_rqrd_date               OUT DATE,
"
"      p_cust_tax_charge_flag        OUT VARCHAR2,
"
"      p_soq_bom_revision_num        OUT NUMBER,
"
"      p_soq_bom_no                  OUT VARCHAR2,
"
"      p_soq_bom_name                OUT VARCHAR2);
"
"
"
"PROCEDURE proc_so_post_web_som1040 (p_bu                 VARCHAR2,
"
"                                       p_user               VARCHAR2,
"
"                                       p_order_pfx          VARCHAR2,
"
"                                       p_order_no           VARCHAR2,
"
"                                       p_res         IN OUT VARCHAR2);
"
"END PKG_SO_WEB_SOM1040;"
/
