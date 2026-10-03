CREATE OR REPLACE
"PACKAGE BODY        PKG_SO_WEB_SOM1040
"
"AS
"
"   PROCEDURE proc_so_item_assign_web (
"
"     p_soh_bu                   IN     VARCHAR2,
"
"   p_user                     IN     VARCHAR2,
"
"   p_lang                     IN     VARCHAR2,
"
"   p_soh_plant                IN     VARCHAR2,
"
"   p_soh_plant_loc_id         IN     VARCHAR2,
"
"   p_soh_order_pfx            IN     VARCHAR2,
"
"   p_soh_order_no             IN     VARCHAR2,
"
"   p_soh_cust_id              IN     VARCHAR2,
"
"   p_soh_order_type           IN     VARCHAR2,
"
"   p_soh_order_date           IN     DATE,
"
"   p_soq_prod_id              IN     VARCHAR2,
"
"   p_soq_prod_rev             IN     NUMBER,
"
"   p_soq_uom                  IN OUT VARCHAR2,
"
"   p_soh_currency             IN     VARCHAR2,
"
"   p_soq_cust_prod_id         IN OUT VARCHAR2,
"
"   p_soq_price_basis             OUT VARCHAR2,
"
"   p_soq_cust_prod_desc          OUT VARCHAR2,
"
"   p_soq_price_uom               OUT VARCHAR2,
"
"   p_soq_prod_desc1              OUT VARCHAR2,
"
"   p_soq_sub_cls                 OUT VARCHAR2,
"
"   p_soq_tolerance_pct           OUT NUMBER,
"
"   p_soq_cont_cat_no          IN OUT VARCHAR2,
"
"   p_soq_sales_price_class    IN OUT VARCHAR2,
"
"   p_soq_price                   OUT NUMBER,
"
"   p_price_class_desc            OUT VARCHAR2,
"
"   p_soq_catalog_no           IN     VARCHAR2,
"
"   p_soq_class_id             IN OUT VARCHAR2,
"
"   p_soq_mrp_price               OUT VARCHAR2,
"
"   p_soq_assemb_no               OUT VARCHAR2,
"
"   p_soq_price_conv_factor       OUT VARCHAR2,
"
"   p_soq_prod_net_weight         OUT VARCHAR2,
"
"   p_soq_prod_gross_weight       OUT VARCHAR2,
"
"   p_soq_tac_rqrd_flag           OUT VARCHAR2,
"
"   p_soq_prod_uom             IN OUT VARCHAR2,
"
"   p_soq_conv_factor          IN OUT VARCHAR2,
"
"   p_soh_cust_po_no           IN     VARCHAR2,
"
"   p_soh_cust_po_rev          IN     VARCHAR2,
"
"   p_soh_cust_po_date         IN     VARCHAR2,
"
"   p_soq_cust_po_no           IN OUT VARCHAR2,
"
"   p_soq_cust_po_rev             OUT VARCHAR2,
"
"   p_soq_cust_po_date            OUT VARCHAR2,
"
"   p_soq_prod_grade_id           OUT VARCHAR2,
"
"   p_grade_desc                  OUT VARCHAR2,
"
"   p_soq_prod_cat_id             OUT VARCHAR2,
"
"   p_soq_cat_desc                OUT VARCHAR2,
"
"   p_soq_prod_size               OUT VARCHAR2,
"
"   p_prod_size_desc              OUT VARCHAR2,
"
"   p_soq_prod_pack_size          OUT VARCHAR2,
"
"   p_prod_pack_size              OUT VARCHAR2,
"
"   p_soq_prod_grp                OUT VARCHAR2,
"
"   p_soq_prod_subgrp             OUT VARCHAR2,
"
"   p_soq_instl_rqrd_flag         OUT VARCHAR2,
"
"   p_soq_prod_tar_weight         OUT VARCHAR2,
"
"   p_soq_prj_type                OUT VARCHAR2,
"
"   p_soq_gross_price             OUT NUMBER,
"
"   p_soq_duty_drawback_flag      OUT VARCHAR2,
"
"   p_soq_stl_std_spec_id         OUT VARCHAR2,
"
"   p_soq_prod_cls_desc           OUT VARCHAR2,
"
"   p_soq_prod_subcls_desc        OUT VARCHAR2,
"
"   p_soq_prod_grp_desc           OUT VARCHAR2,
"
"   p_soq_prod_subgrp_desc        OUT VARCHAR2,
"
"   p_soq_prod_ext_desc           OUT VARCHAR2,
"
"   p_stk_qty                     OUT NUMBER,
"
"   p_soq_tcf_id                  OUT VARCHAR2,
"
"   p_soh_gst_cust_type        IN     VARCHAR2,
"
"   p_soq_gst_input_type          OUT VARCHAR2,
"
"   p_soh_billto_loc_id               VARCHAR2,
"
"   p_soh_gst_w_wo_pay_flag           VARCHAR2,
"
"   p_soq_hsn_code                OUT VARCHAR2,
"
"   p_soq_tax_set_id              OUT VARCHAR2,
"
"   p_tax_desc                    OUT VARCHAR2,
"
"   p_drw_no                      OUT VARCHAR2,
"
"   p_drw_rev                     OUT VARCHAR2,
"
"   p_soq_sal_acct_desc           OUT VARCHAR2,
"
"   p_soq_desp_date               OUT DATE,
"
"   p_soq_rqrd_date               OUT DATE,
"
"   p_cust_tax_charge_flag        OUT VARCHAR2,
"
"   p_soq_bom_revision_num        OUT NUMBER,
"
"   p_soq_bom_no                  OUT VARCHAR2,
"
"   p_soq_bom_name                OUT VARCHAR2)
"
"IS
"
"   CURSOR c_hd
"
"   IS
"
"      SELECT *
"
"        FROM sales_order_hd
"
"       WHERE     soh_bu = p_soh_bu
"
"             AND soh_order_pfx = p_soh_order_pfx
"
"             AND soh_order_no = p_soh_order_no;
"
"
"
"
"
"
"
"   CURSOR c_ln
"
"   IS
"
"      SELECT *
"
"        FROM sales_order_qtys
"
"       WHERE soq_bu = p_soh_bu AND soq_order_no = p_soh_order_no;
"
"
"
"   cr_ln   c_ln%ROWTYPE;
"
"   cr_hd   c_hd%ROWTYPE;
"
"BEGIN
"
"   IF p_soq_prod_id IS NULL
"
"   THEN
"
"      raise_application_error (-20999, 'Item must be entered');
"
"   ELSE
"
"      IF p_soq_prod_id IS NOT NULL AND p_soq_prod_rev IS NULL
"
"      THEN
"
"         NULL;
"
"      END IF;
"
"   END IF;
"
"
"
"   BEGIN
"
"      DECLARE
"
"         CURSOR c0
"
"         IS
"
"            SELECT somctrl_serv_item
"
"              FROM som_control
"
"             WHERE somctrl_bu = p_soh_bu;
"
"
"
"         CURSOR c_ctrl
"
"         IS
"
"            SELECT prodplnt_cust_asso
"
"              FROM prod_plants
"
"             WHERE     prodplnt_bu = p_soh_bu
"
"                   AND prodplnt_plnt = p_soh_plant
"
"                   AND prodplnt_prod_id = p_soq_prod_id
"
"                   AND prodplnt_prod_rev = p_soq_prod_rev
"
"                   AND prodplnt_status = 'A';
"
"
"
"
"
"         CURSOR c1
"
"         IS
"
"           SELECT prod_id,
"
"                   custp_tax_set_id,
"
"                   custp_tolr_pct,
"
"                   custp_hsn_code,
"
"                   custp_drawing_no,
"
"                   custp_drawing_rev,
"
"                   custp_uom,
"
"                   custp_cust_prod_id,
"
"                   custp_price_basis,
"
"                   custp_cust_prod_desc,
"
"                   prod_uom
"
"              FROM (SELECT DISTINCT
"
"                           prod_id,
"
"                           NULL custp_tax_set_id,
"
"                           NULL custp_tcf_id,
"
"                           NULL custp_tolr_pct,
"
"                           prod_hsn_code custp_hsn_code,
"
"                           prod_drawing_no custp_drawing_no,
"
"                           prod_drg_rev custp_drawing_rev,
"
"                           NVL (prod_sale_uom, prod_uom) custp_uom,
"
"                           NULL custp_cust_prod_id,
"
"                           suplr_sales_price_source custp_price_basis,
"
"                           NULL custp_cust_prod_desc,
"
"                           prod_uom
"
"                      FROM products,
"
"                           prod_plants,
"
"                           suppliers,
"
"                           som_control
"
"                     WHERE     prod_bu = prodplnt_bu
"
"                           AND prod_id = prodplnt_prod_id
"
"                           AND prod_rev = prodplnt_prod_rev
"
"                           AND prod_status = 'A'
"
"                           AND prod_saleable = 'Y'
"
"                           AND prod_rtn_crt_flag = 'N'
"
"                           AND prodplnt_status = 'A'
"
"                           AND prodplnt_cust_asso = 'N'
"
"                           AND prod_bu = somctrl_bu
"
"                           AND prod_bu = suplr_bu
"
"                           AND prod_bu = p_soh_bu
"
"                           AND prodplnt_plnt = p_soh_plant
"
"                           AND suplr_suplr_id =
"
"                                  NVL (cr_hd.soh_parent_cust_id,
"
"                                       p_soh_cust_id)
"
"                           AND prod_id = p_soq_prod_id
"
"                           AND suplr_status = 'A'
"
"                           AND ( (somctrl_serv_item = 'N'
"
"                                  AND ( (p_soh_order_type NOT IN
"
"                                            ('SOS', 'SOSCR')
"
"                                         AND prodplnt_cls_type <> 'SV'
"
"                                         AND prod_stocked = 'Y')
"
"                                       OR (    prodplnt_cls_type = 'RP'
"
"                                           AND p_soh_order_type = 'SOSCR'
"
"                                           AND prod_stocked = 'Y')
"
"                                       OR (    p_soh_order_type = 'SOS'
"
"                                           AND prodplnt_cls_type = 'SV'
"
"                                           AND prod_stocked = 'N')))
"
"                                OR (somctrl_serv_item = 'Y'
"
"                                    AND ( (p_soh_order_type NOT IN
"
"                                              ('SOS', 'SOSCR')
"
"                                           AND prodplnt_cls_type <> 'SV')
"
"                                         OR (    prodplnt_cls_type = 'RP'
"
"                                             AND p_soh_order_type = 'SOSCR'
"
"                                             AND prod_stocked = 'Y')
"
"                                         OR (    p_soh_order_type = 'SOS'
"
"                                             AND prodplnt_cls_type = 'SV'
"
"                                             AND prod_stocked = 'N'))))
"
"                    UNION ALL
"
"                    SELECT DISTINCT prod_id,
"
"                                    custp_tax_set_id,
"
"                                    custp_tcf_id,
"
"                                    custp_tolr_pct,
"
"                                    custp_hsn_code,
"
"                                    prod_drawing_no custp_drawing_no,
"
"                                    prod_drg_rev custp_drawing_rev,
"
"                                    custp_uom,
"
"                                    custp_cust_prod_id,
"
"                                    custp_price_basis,
"
"                                    custp_cust_prod_desc,
"
"                                    prod_uom
"
"                      FROM products,
"
"                           prod_plants,
"
"                           suppliers,
"
"                           som_control,
"
"                           cust_prod
"
"                     WHERE     prod_bu = prodplnt_bu
"
"                           AND prod_id = prodplnt_prod_id
"
"                           AND prod_rev = prodplnt_prod_rev
"
"                           AND prod_status = 'A'
"
"                           AND prod_saleable = 'Y'
"
"                           AND prod_rtn_crt_flag = 'N'
"
"                           AND prodplnt_status = 'A'
"
"                           AND prodplnt_cust_asso = 'Y'
"
"                           AND prod_bu = somctrl_bu
"
"                           AND prod_bu = suplr_bu
"
"                           AND custp_bu = prod_bu
"
"                           AND custp_prod_id = prod_id
"
"                           AND custp_prod_rev = prod_rev
"
"                           AND custp_prod_flag = 'Y'
"
"                           AND prod_bu = p_soh_bu
"
"                           AND prodplnt_plnt = p_soh_plant
"
"                           AND suplr_suplr_id =
"
"                                  NVL (cr_hd.soh_parent_cust_id,p_soh_cust_id)
"
"                           AND custp_cust_id =
"
"                                  NVL (cr_hd.soh_parent_cust_id,
"
"                                       p_soh_cust_id)
"
"                           AND prod_id = p_soq_prod_id
"
"                           AND suplr_status = 'A'
"
"                           AND ( (somctrl_serv_item = 'N'
"
"                                  AND ( (p_soh_order_type NOT IN
"
"                                            ('SOS', 'SOSCR')
"
"                                         AND prodplnt_cls_type <> 'SV'
"
"                                         AND prod_stocked = 'Y')
"
"                                       OR (prodplnt_cls_type = 'RP'
"
"                                           AND p_soh_order_type =
"
"                                                  'SOSCR'
"
"                                           AND prod_stocked = 'Y')
"
"                                       OR (p_soh_order_type =
"
"                                              'SOS'
"
"                                           AND prodplnt_cls_type = 'SV'
"
"                                           AND prod_stocked = 'N')))
"
"                                OR (somctrl_serv_item = 'Y'
"
"                                    AND ( (p_soh_order_type NOT IN
"
"                                              ('SOS', 'SOSCR')
"
"                                           AND prodplnt_cls_type <> 'SV')
"
"                                         OR (prodplnt_cls_type = 'RP'
"
"                                             AND p_soh_order_type =
"
"                                                    'SOSCR'
"
"                                             AND prod_stocked = 'Y')
"
"                                         OR (p_soh_order_type =
"
"                                                'SOS'
"
"                                             AND prodplnt_cls_type = 'SV'
"
"                                             AND prod_stocked = 'N')))));
"
"
"
"
"
"         CURSOR c14
"
"         IS
"
"            SELECT spc_class_id
"
"              FROM sales_price_classes
"
"             WHERE spc_bu = p_soh_bu AND spc_sel_flag = 'Y';
"
"
"
"         CURSOR c10
"
"         IS
"
"            SELECT pplsw_sales_price_class
"
"              FROM prod_plants_loc_ship_wh
"
"             WHERE     pplsw_bu = p_soh_bu
"
"                   AND pplsw_plnt = p_soh_plant
"
"                   AND pplsw_prod_id = p_soq_prod_id
"
"                   AND pplsw_prod_rev = p_soq_prod_rev
"
"                   AND pplsw_plnt_loc_id = p_soh_plant_loc_id
"
"                   AND pplsw_so_pfx = p_soh_order_pfx;
"
"
"
"
"
"         CURSOR c12
"
"         IS
"
"            SELECT sctln_tc_set_id, sctln_price
"
"              FROM sales_catalog_ln
"
"             WHERE     sctln_bu = p_soh_bu
"
"                   AND sctln_prod_id = p_soq_prod_id
"
"                   AND sctln_prod_rev = p_soq_prod_rev
"
"                   AND (p_soh_order_date BETWEEN sctln_date_from
"
"                                             AND sctln_date_to)
"
"                   AND sctln_curcy_id = p_soh_currency;
"
"
"
"
"
"
"
"         var_ltime     NUMBER (5);
"
"         cr0           c0%ROWTYPE;
"
"         cr1           c1%ROWTYPE;
"
"         cr10          c10%ROWTYPE;
"
"         cr12          c12%ROWTYPE;
"
"         cr14          c14%ROWTYPE;
"
"         v_ctlg_flag   VARCHAR2 (1);
"
"         cr_ctrl       c_ctrl%ROWTYPE;
"
"      BEGIN
"
"         IF p_soq_prod_id IS NULL
"
"         THEN
"
"            raise_application_error (-20999, 'Item must be entered');
"
"         ELSE
"
"        OPEN c_ctrl;
"
"
"
"               --   RAISE_APPLICATION_ERROR   (-20999,p_soh_plant||'/'||cr_hd.soh_parent_cust_id||'/'||p_soh_cust_id||'/'||p_soh_order_type||'/'||p_soq_prod_id||p_soq_prod_rev);
"
"            FETCH c_ctrl INTO cr_ctrl;
"
"
"
"            CLOSE c_ctrl;
"
"
"
"            OPEN c0;
"
"
"
"            FETCH c0 INTO cr0;
"
"
"
"            IF c0%FOUND
"
"            THEN
"
"               OPEN c1;
"
"
"
"               FETCH c1 INTO cr1;
"
"
"
"               IF c1%NOTFOUND
"
"               THEN
"
"                  IF cr_ctrl.prodplnt_cust_asso <> 'Y'
"
"                  THEN
"
"                     raise_application_error (-20999, 'Item not Found');
"
"                  ELSE
"
"                     raise_application_error (-20999,
"
"                                              'Customer item not defined');
"
"                  END IF;
"
"               ELSE
"
"                  IF cr_ctrl.prodplnt_cust_asso = 'Y'
"
"                  THEN
"
"                     p_soq_uom := cr1.custp_uom;
"
"                     p_soq_cust_prod_id := cr1.custp_cust_prod_id;
"
"                     p_soq_hsn_code := cr1.custp_hsn_code;
"
"                     p_soq_price_basis := cr1.custp_price_basis;
"
"                     p_soq_cust_prod_desc := cr1.custp_cust_prod_desc;
"
"                  ELSE
"
"                     p_soq_uom := cr1.custp_uom;
"
"                     p_soq_hsn_code := cr1.custp_hsn_code;
"
"                     p_soq_price_basis := cr1.custp_price_basis;
"
"                  END IF;
"
"
"
"                  P_soq_prod_uom := cr1.prod_uom;
"
"
"
"                  IF p_soq_price_uom IS NULL
"
"                  THEN
"
"                     p_soq_price_uom :=
"
"                        func_find_product_uom (p_soh_bu,
"
"                                               p_soq_prod_id,
"
"                                               p_soq_prod_rev);
"
"                  END IF;
"
"
"
"                  IF p_soq_price_basis NOT IN ('P', 'C', 'L')
"
"                     AND cr_ctrl.prodplnt_cust_asso = 'Y'
"
"                  THEN
"
"                     p_soq_tolerance_pct := cr1.custp_tolr_pct;
"
"                  ELSIF P_soq_price_basis NOT IN ('P', 'C', 'L')
"
"                        AND cr_ctrl.prodplnt_cust_asso = 'N'
"
"                  THEN
"
"                     p_soq_tolerance_pct := 0;
"
"                  END IF;
"
"
"
"                  IF p_soq_price_basis = 'L'
"
"                     AND cr_ctrl.prodplnt_cust_asso = 'Y'
"
"                  THEN
"
"                     P_soq_cust_prod_id := cr1.custp_cust_prod_id;
"
"
"
"                     p_soq_cont_cat_no :=
"
"                        func_find_catalog_no (p_soh_bu,
"
"                                              p_soh_cust_id,
"
"                                              p_soq_prod_id,
"
"                                              p_soq_prod_rev,
"
"                                              p_soq_cust_prod_id,
"
"                                              p_soq_cont_cat_no);
"
"                  END IF;
"
"               END IF;
"
"
"
"               CLOSE c1;
"
"
"
"               OPEN c14;
"
"
"
"               FETCH c14 INTO cr14;
"
"
"
"               OPEN c10;
"
"
"
"               FETCH c10 INTO cr10;
"
"
"
"               p_soq_sales_price_class :=
"
"                  NVL (cr10.pplsw_sales_price_class, cr14.spc_class_id);
"
"
"
"
"
"               CLOSE c10;
"
"
"
"               CLOSE c14;
"
"            ELSIF cr0.somctrl_serv_item = 'Y'
"
"            THEN
"
"               OPEN c1;
"
"
"
"               FETCH c1 INTO cr1;
"
"
"
"               IF p_soq_uom IS NULL
"
"               THEN
"
"                  p_soq_uom :=
"
"                     func_find_product_uom (p_soh_bu,
"
"                                            p_soq_prod_id,
"
"                                            p_soq_prod_rev);
"
"               END IF;
"
"
"
"
"
"               DECLARE
"
"                  CURSOR c1
"
"                  IS
"
"                     SELECT prod_sale_uom, prod_hsn_code,prod_desc11
"
"                       FROM products
"
"                      WHERE     prod_bu = p_soh_bu
"
"                            AND prod_id = p_soq_prod_id
"
"                            AND prod_rev = p_soq_prod_rev;
"
"
"
"                  cr1   c1%ROWTYPE;
"
"               BEGIN
"
"
"
"                  OPEN c1;
"
"
"
"                  FETCH c1 INTO cr1;
"
"
"
"                  IF c1%FOUND
"
"                  THEN
"
"                  raise_application_error(-20999,cr1.prod_desc11);
"
"                     p_soq_uom := cr1.prod_sale_uom;
"
"                     p_soq_prod_desc1 := cr1.prod_desc11;
"
"                  --:soq_hsn_code := cr1.prod_hsn_code;
"
"                  END IF;
"
"
"
"                  CLOSE c1;
"
"               END;
"
"
"
"
"
"               IF p_soq_price_uom IS NULL
"
"               THEN
"
"                  p_soq_price_uom :=
"
"                     func_find_product_uom (p_soh_bu,
"
"                                            p_soq_prod_id,
"
"                                            p_soq_prod_rev);
"
"               END IF;
"
"
"
"
"
"               /*p_soq_prod_desc1 :=
"
"                  func_find_prod_desc (p_soh_bu,
"
"                                       p_soq_prod_id,
"
"                                       p_soq_prod_rev,
"
"                                       1);*/
"
"
"
"               p_soq_class_id :=
"
"                  func_find_product_class (p_soh_bu,
"
"                                           p_soh_plant,
"
"                                           p_soq_prod_id,
"
"                                           p_soq_prod_rev);
"
"               --                     RAISE_APPLICATION_ERROR(-20999,p_soq_class_id);
"
"
"
"
"
"               p_soq_sub_cls :=
"
"                  func_find_product_subclass (p_soh_bu,
"
"                                              p_soh_plant,
"
"                                              p_soq_prod_id,
"
"                                              p_soq_prod_rev);
"
"
"
"
"
"               IF p_soq_price_basis NOT IN ('P', 'C', 'L')
"
"               THEN
"
"                  p_soq_tcf_id := NULL;
"
"                  p_soq_tolerance_pct := cr1.custp_tolr_pct;
"
"               END IF;
"
"            END IF;
"
"
"
"         END IF;
"
"
"
"
"
"         OPEN c14;
"
"
"
"         FETCH c14 INTO cr14;
"
"
"
"         OPEN c10;
"
"
"
"         FETCH c10 INTO cr10;
"
"
"
"         p_soq_sales_price_class :=
"
"            NVL (cr10.pplsw_sales_price_class, cr14.spc_class_id);
"
"
"
"
"
"         CLOSE c10;
"
"
"
"         CLOSE c14;
"
"
"
"         IF p_soq_sales_price_class IS NOT NULL
"
"         THEN
"
"            p_price_class_desc :=
"
"               func_find_sales_price_class (p_soh_bu,
"
"                                            p_soq_sales_price_class,
"
"                                            1);
"
"         END IF;
"
"
"
"         IF p_soq_price_basis IN ('L')
"
"         THEN
"
"            OPEN c12;
"
"
"
"            FETCH c12 INTO cr12;
"
"
"
"            IF c12%FOUND
"
"            THEN
"
"               p_soq_price := cr12.sctln_price;
"
"            END IF;
"
"
"
"            CLOSE c12;
"
"         END IF;
"
"
"
"         CLOSE c0;
"
"      END;
"
"
"
"      DECLARE
"
"         CURSOR c11
"
"         IS
"
"            SELECT custp_tolr_pct,
"
"                   custp_mtl_test_rqrd_flag,
"
"                   custp_dim_test_rqrd_flag,
"
"                   custp_tac_rqrd_flag
"
"              FROM products, cust_prod, prod_plants
"
"             WHERE     prod_bu = p_soh_bu
"
"                   AND prod_id || prod_rev = p_soq_prod_id
"
"                   AND prod_bu = prodplnt_bu
"
"                   AND prodplnt_plnt = p_soh_plant
"
"                   AND prod_id = prodplnt_prod_id
"
"                   AND prod_rev = prodplnt_prod_rev
"
"                   AND prod_saleable = 'Y'
"
"                   AND prod_status = 'A'
"
"                   AND custp_bu = prod_bu
"
"                   AND custp_prod_id = prod_id
"
"                   AND custp_prod_rev = prod_rev
"
"                   AND custp_cust_id = p_soh_cust_id
"
"                   AND prod_stocked = 'Y';
"
"
"
"         cr11   c11%ROWTYPE;
"
"      BEGIN
"
"         OPEN c11;
"
"
"
"         FETCH c11 INTO cr11;
"
"
"
"         IF c11%FOUND
"
"         THEN
"
"            p_soq_tolerance_pct := cr11.custp_tolr_pct;
"
"            p_soq_tac_rqrd_flag := cr11.custp_tac_rqrd_flag;
"
"         ELSE
"
"            p_soq_tolerance_pct := 0;
"
"            p_soq_tac_rqrd_flag := 'N';
"
"         END IF;
"
"
"
"         CLOSE c11;
"
"      END;
"
"
"
"
"
"      IF p_soq_prod_rev IS NOT NULL
"
"      THEN
"
"         p_soq_conv_factor :=
"
"            func_find_uom_conversion (p_soh_bu,
"
"                                      p_soq_prod_id,
"
"                                      p_soq_prod_rev,
"
"                                      p_soq_prod_uom,
"
"                                      p_soq_uom);
"
"      END IF;
"
"
"
"
"
"      IF     p_soh_cust_po_no IS NOT NULL
"
"         AND p_soh_cust_po_rev IS NOT NULL
"
"         AND p_soh_cust_po_date IS NOT NULL
"
"         AND p_soq_cust_po_no IS NULL
"
"      THEN
"
"         p_soq_cust_po_no := p_soh_cust_po_no;
"
"         p_soq_cust_po_rev := p_soh_cust_po_rev;
"
"         p_soq_cust_po_date := p_soh_cust_po_date;
"
"      END IF;
"
"
"
"
"
"      IF p_soq_prod_id IS NOT NULL
"
"      THEN
"
"         DECLARE
"
"            CURSOR c1
"
"            IS
"
"               SELECT prod_cls,
"
"             prod_sub_cls,
"
"             prod_group_id,
"
"             prod_subgroup_id,
"
"             prod_inst_req_flag,
"
"             prod_stl_spec_id,
"
"             prod_duty_drawback_flag,
"
"             prod_tcs_sec_id,
"
"             prod_net_weight,
"
"             prod_gross_weight,
"
"             prod_gst_exempt_flag,
"
"             prod_gst_types_of_supply,
"
"             prod_desc11
"
"                 FROM products
"
"                WHERE prod_bu = p_soh_bu
"
"                      AND prod_id = p_soq_prod_id
"
"                      AND prod_rev = p_soq_prod_rev;
"
"
"
"            cr1   c1%ROWTYPE;
"
"         BEGIN
"
"            OPEN c1;
"
"
"
"            FETCH c1 INTO cr1;
"
"
"
"            IF c1%FOUND
"
"            THEN
"
"               p_soq_prod_desc1 := cr1.prod_desc11;
"
"               p_soq_prod_grp := cr1.prod_group_id;
"
"               p_soq_prod_subgrp := cr1.prod_subgroup_id;
"
"               p_soq_instl_rqrd_flag := cr1.prod_inst_req_flag;
"
"               p_soq_prod_tar_weight := 0;
"
"               p_soq_mrp_price := 0;
"
"               p_soq_prj_type := 'S';
"
"               p_soq_gross_price := 0;
"
"               p_soq_duty_drawback_flag := cr1.prod_duty_drawback_flag;
"
"               p_soq_stl_std_spec_id := cr1.prod_stl_spec_id;
"
"            END IF;
"
"
"
"            CLOSE c1;
"
"         END;
"
"      END IF;
"
"
"
"
"
"      IF p_soq_class_id IS NOT NULL
"
"      THEN
"
"         p_soq_prod_cls_desc :=
"
"            func_find_class_desc (p_soh_bu, p_soq_class_id, 1);
"
"      END IF;
"
"
"
"      IF p_soq_sub_cls IS NOT NULL
"
"      THEN
"
"         p_soq_prod_subcls_desc :=
"
"            func_find_subclass_desc (p_soh_bu, p_soq_sub_cls, 1);
"
"      END IF;
"
"
"
"      IF p_soq_prod_grp IS NOT NULL
"
"      THEN
"
"         p_soq_prod_grp_desc :=
"
"            func_find_prod_group_desc (p_soh_bu, p_soq_prod_grp, 1);
"
"      END IF;
"
"
"
"      IF p_soq_prod_subgrp IS NOT NULL
"
"      THEN
"
"         p_soq_prod_subgrp_desc :=
"
"            func_find_prod_sub_grp_desc (p_soh_bu, p_soq_prod_subgrp, 1);
"
"      END IF;
"
"
"
"      IF p_soq_prod_id IS NOT NULL
"
"      THEN
"
"         DECLARE
"
"            CURSOR c1
"
"            IS
"
"               SELECT bomhd_bom_name, bomhd_bom_no, bomhd_revision_num
"
"                 FROM bom_hd
"
"                WHERE     bomhd_bu = p_soh_bu
"
"                      AND bomhd_plnt = p_soh_plant
"
"                      AND bomhd_prod_id = p_soq_prod_id
"
"                      AND bomhd_prod_rev = p_soq_prod_rev
"
"                      AND bomhd_status = 'A';
"
"
"
"            cr1   c1%ROWTYPE;
"
"         BEGIN
"
"            OPEN c1;
"
"
"
"            FETCH c1 INTO cr1;
"
"
"
"            IF c1%FOUND
"
"            THEN
"
"               p_soq_bom_name := cr1.bomhd_bom_name;
"
"               p_soq_bom_no := cr1.bomhd_bom_no;
"
"               p_soq_bom_revision_num := cr1.bomhd_revision_num;
"
"            END IF;
"
"
"
"            CLOSE c1;
"
"         END;
"
"      END IF;
"
"
"
"      IF p_soq_prod_id IS NOT NULL
"
"      THEN
"
"         p_soq_prod_ext_desc :=
"
"            func_find_prod_ext_qry_desc (p_soh_bu,
"
"                                         p_soq_prod_id,
"
"                                         p_soq_prod_rev,
"
"                                         1);
"
"      END IF;
"
"
"
"      IF p_soq_prod_id IS NOT NULL
"
"      THEN
"
"         DECLARE
"
"            v_sales_acct      gl_accts.glac_acct%TYPE;
"
"            v_sales_cc_code   profit_cost_centers.pcc_cc_code%TYPE;
"
"            var_acct_plnt     VARCHAR2 (10);
"
"            v_trip_plan_no    VARCHAR2 (15);
"
"            v_veh_id          VARCHAR2 (10);
"
"            v_plnt_state_id   VARCHAR2 (10);
"
"            v_cust_state_id   VARCHAR2 (100);
"
"            v_sub_unit        VARCHAR2 (10);
"
"            v_sale_lvl1       profit_cost_centers.pcc_ac_lvl1%TYPE;
"
"            v_sale_lvl2       profit_cost_centers.pcc_ac_lvl2%TYPE;
"
"            v_sale_lvl3       profit_cost_centers.pcc_ac_lvl3%TYPE;
"
"            v_sale_lvl4       profit_cost_centers.pcc_ac_lvl4%TYPE;
"
"            v_sale_lvl_prj    profit_cost_centers.pcc_ac_lvl_prj%TYPE;
"
"            v_sale_lvl5       profit_cost_centers.pcc_ac_lvl5%TYPE;
"
"            v_sale_lvl6       profit_cost_centers.pcc_ac_lvl6%TYPE;
"
"            v_plnt_loc_id     VARCHAR2 (10);
"
"         BEGIN
"
"            BEGIN
"
"               SELECT bup_state
"
"                 INTO v_plnt_state_id
"
"                 FROM bus_unit_plants
"
"                WHERE bup_bu = p_soh_bu AND bup_plant_id = p_soh_plant;
"
"            EXCEPTION
"
"               WHEN NO_DATA_FOUND
"
"               THEN
"
"                  v_plnt_state_id := NULL;
"
"            END;
"
"
"
"            BEGIN
"
"               SELECT ssl_state
"
"                 INTO v_cust_state_id
"
"                 FROM suplr_ship_loc
"
"                WHERE     ssl_bu = p_soh_bu
"
"                      AND ssl_suplr_id = p_soh_cust_id
"
"                      AND ssl_loc_name1 = cr_hd.soh_billto_loc_name;
"
"            EXCEPTION
"
"               WHEN NO_DATA_FOUND
"
"               THEN
"
"                  v_cust_state_id := NULL;
"
"            END;
"
"         END;
"
"      END IF;
"
"
"
"      IF cr_ln.soq_sal_acct_id IS NOT NULL
"
"      THEN
"
"         DECLARE
"
"            CURSOR c1
"
"            IS
"
"               SELECT suat_acct, glac_acct_desc1
"
"                 FROM sales_unit_accts, gl_accts
"
"                WHERE     suat_bu = glac_bu
"
"                      AND suat_acct = glac_acct
"
"                      AND suat_plnt = cr_hd.soh_plant
"
"                      AND suat_type = 'NS'
"
"                      AND suat_acct = cr_ln.soq_sal_acct_id
"
"                      AND p_soh_order_type IN ('SO', 'SS')
"
"               UNION ALL
"
"               SELECT suat_acct, glac_acct_desc1
"
"                 FROM sales_unit_accts, gl_accts
"
"                WHERE     suat_bu = glac_bu
"
"                      AND suat_acct = glac_acct
"
"                      AND suat_plnt = cr_hd.soh_plant
"
"                      AND suat_type = 'SE'
"
"                      AND suat_acct = cr_ln.soq_sal_acct_id
"
"                      AND p_soh_order_type = 'SV'
"
"               UNION ALL
"
"               SELECT suat_acct, glac_acct_desc1
"
"                 FROM sales_unit_accts, gl_accts
"
"                WHERE     suat_bu = glac_bu
"
"                      AND suat_acct = glac_acct
"
"                      AND suat_plnt = cr_hd.soh_plant
"
"                      AND suat_type = 'SOFS'
"
"                      AND suat_acct = cr_ln.soq_sal_acct_id
"
"                      AND p_soh_order_type = 'FS'
"
"               UNION ALL
"
"               SELECT suat_acct, glac_acct_desc1
"
"                 FROM sales_unit_accts, gl_accts
"
"                WHERE     suat_bu = glac_bu
"
"                      AND suat_acct = glac_acct
"
"                      AND suat_plnt = cr_hd.soh_plant
"
"                      AND suat_type = 'SOFR'
"
"                      AND suat_acct = cr_ln.soq_sal_acct_id
"
"                      AND p_soh_order_type = 'FE'
"
"               UNION ALL
"
"               SELECT suat_acct, glac_acct_desc1
"
"                 FROM sales_unit_accts, gl_accts
"
"                WHERE     suat_bu = glac_bu
"
"                      AND suat_acct = glac_acct
"
"                      AND suat_plnt = cr_hd.soh_plant
"
"                      AND suat_type = 'LO'
"
"                      AND suat_acct = cr_ln.soq_sal_acct_id
"
"                      AND p_soh_order_type IN
"
"                             ('LO', 'LI', 'LE', 'RB', 'RP', 'LW')
"
"               UNION ALL
"
"               SELECT suat_acct, glac_acct_desc1
"
"                 FROM sales_unit_accts, gl_accts
"
"                WHERE     suat_bu = glac_bu
"
"                      AND suat_acct = glac_acct
"
"                      AND suat_plnt = cr_hd.soh_plant
"
"                      AND suat_type = 'STS'
"
"                      AND suat_acct = cr_ln.soq_sal_acct_id
"
"                      AND p_soh_order_type IN ('ST', 'SE');
"
"
"
"            cr1   c1%ROWTYPE;
"
"         BEGIN
"
"            OPEN c1;
"
"
"
"            FETCH c1 INTO cr1;
"
"
"
"            IF c1%FOUND
"
"            THEN
"
"               p_soq_sal_acct_desc := cr1.glac_acct_desc1;
"
"            END IF;
"
"
"
"            CLOSE c1;
"
"         END;
"
"      END IF;
"
"
"
"
"
"      IF cr_ln.soq_hsn_code IS NULL
"
"      THEN
"
"         DECLARE
"
"            CURSOR c1
"
"            IS
"
"               SELECT prod_sale_uom, prod_hsn_code
"
"                 FROM products
"
"                WHERE     prod_bu = p_soh_bu
"
"                      AND prod_id = p_soq_prod_id
"
"                      AND prod_rev = p_soq_prod_rev;
"
"
"
"            cr1   c1%ROWTYPE;
"
"         BEGIN
"
"            OPEN c1;
"
"
"
"            FETCH c1 INTO cr1;
"
"
"
"            IF c1%FOUND
"
"            THEN
"
"               p_soq_hsn_code := cr1.prod_hsn_code;
"
"            END IF;
"
"
"
"            CLOSE c1;
"
"         END;
"
"      END IF;
"
"
"
"      DECLARE
"
"         var_seq_no           NUMBER (10) := 0;
"
"         var_cnt              NUMBER;
"
"         v_cnt                NUMBER;
"
"         var_store            VARCHAR2 (10);
"
"         var_ltime            NUMBER (10) := 0;
"
"         var_prod_lead_time   NUMBER (10) := 0;
"
"         var_rm_lead_time     NUMBER (10) := 0;
"
"         var_rqrd_date        DATE;
"
"         var_rqrd_date1       DATE;
"
"         var_base_curr        VARCHAR2 (5);
"
"         var_cust_curr        VARCHAR2 (5);
"
"         var_exchange         NUMBER (13, 8);
"
"         var_loc_id           VARCHAR2 (5);
"
"         var_cmt_seq_no       NUMBER;
"
"         BBB                  NUMBER;
"
"         v_start              NUMBER;
"
"         v_start_no           NUMBER;
"
"         v_end_no             NUMBER;
"
"
"
"         CURSOR C2
"
"         IS
"
"            SELECT soh_plant
"
"              FROM sales_order_hd
"
"             WHERE soh_bu = p_soh_bu AND soh_order_no = p_soh_order_no;
"
"
"
"         CURSOR c3
"
"         IS
"
"            SELECT ssl_loc_name1
"
"              FROM suplr_ship_loc
"
"             WHERE     ssl_bu = p_soh_bu
"
"                   AND ssl_suplr_id = p_soh_cust_id
"
"                   AND ssl_dflt_flg IN ('D', 'S');
"
"
"
"         CURSOR c4
"
"         IS
"
"            SELECT prodplnt_plnt
"
"              FROM products, prod_plants
"
"             WHERE     prod_bu = prodplnt_bu
"
"                   AND prod_id = prodplnt_prod_id
"
"                   AND prod_rev = prodplnt_prod_rev
"
"                   AND prod_status = 'A'
"
"                   AND prodplnt_bu = p_soh_bu
"
"                   AND prodplnt_prod_id = p_soq_prod_id
"
"                   AND prodplnt_prod_rev = p_soq_prod_rev
"
"                   AND prodplnt_plnt = p_soh_plant;
"
"
"
"         CURSOR c5
"
"         IS
"
"            SELECT MAX (prodplnt_fix_lead_time) prodplnt_fix_lead_time
"
"              FROM (  SELECT bomhd_prod_id,
"
"                             bomhd_prod_rev,
"
"                             bomln_prod_id,
"
"                             bomln_prod_rev,
"
"                             bomln_prod_uom,
"
"                             bomln_uom,
"
"                             prodplnt_fix_lead_time,
"
"                             SUM (bomln_required_qty / bomln_conv_factor)
"
"                                bomln_required_qty
"
"                        FROM bom_hd,
"
"                             routing_ln,
"
"                             bom_ln,
"
"                             prod_plants
"
"                       WHERE     bomhd_bu = rouln_bu
"
"                             AND bomhd_plnt = rouln_plnt
"
"                             AND bomhd_bom_no = rouln_bom_no
"
"                             AND bomln_bu = rouln_bu
"
"                             AND bomln_plnt = rouln_plnt
"
"                             AND bomln_bom_no = rouln_bom_no
"
"                             AND bomln_oprn_seq_no = rouln_oprn_seq_no
"
"                             AND bomln_bu = prodplnt_bu
"
"                             AND bomln_plnt = prodplnt_plnt
"
"                             AND bomln_prod_id = prodplnt_prod_id
"
"                             AND bomln_prod_rev = prodplnt_prod_rev
"
"                             AND prodplnt_status = 'A'
"
"                             AND bomhd_bu = p_soh_bu
"
"                             AND bomhd_plnt = p_soh_plant
"
"                             AND bomhd_prod_id = p_soq_prod_id
"
"                             AND bomhd_prod_rev = p_soq_prod_rev
"
"                             AND TRUNC (SYSDATE) BETWEEN bomhd_eff_from
"
"                                                     AND bomhd_eff_to
"
"                             AND bomhd_primary = 'Y'
"
"                             AND bomhd_status = 'A'
"
"                    GROUP BY bomhd_bu,
"
"                             bomhd_plnt,
"
"                             bomhd_prod_id,
"
"                             bomhd_prod_rev,
"
"                             bomln_prod_id,
"
"                             bomln_prod_rev,
"
"                             bomln_prod_uom,
"
"                             bomln_uom,
"
"                             prodplnt_fix_lead_time);
"
"
"
"         CURSOR c6 (c_days NUMBER)
"
"         IS
"
"            SELECT row_num, wcln_date
"
"              FROM (SELECT ROWNUM row_num, wcln_date
"
"                      FROM (  SELECT wcln_date
"
"                                FROM workday_calendar_hd, workday_calendar_ln
"
"                               WHERE     wchd_bu = wcln_bu
"
"                                     AND wchd_plnt = wcln_plnt
"
"                                     AND wchd_clndr_no = wcln_clndr_no
"
"                                     AND wchd_bu = p_soh_bu
"
"                                     AND wchd_plnt = p_soh_plant
"
"                                     AND wchd_year >=
"
"                                            func_find_year (p_soh_bu,
"
"                                                            p_soh_order_date)
"
"                                     AND wchd_status = 'A'
"
"                                     AND wcln_holiday = 'N'
"
"                                     AND TRUNC (wcln_date) >=
"
"                                            TRUNC (p_soh_order_date)
"
"                            ORDER BY wcln_date))
"
"             WHERE row_num = c_days;
"
"
"
"         cr3                  c3%ROWTYPE;
"
"         cr4                  c4%ROWTYPE;
"
"         cr5                  c5%ROWTYPE;
"
"         cr6                  c6%ROWTYPE;
"
"         var_rqrd_days        NUMBER;
"
"         var_desp_days        NUMBER;
"
"         V_PLNT               VARCHAR2 (10);
"
"         var_cmt_date         DATE;
"
"         v_schld_type         VARCHAR2 (1);
"
"         v_no_of_cont         NUMBER := 0;
"
"      BEGIN
"
"         var_cust_curr := p_soh_currency;
"
"         var_base_curr := func_find_base_currency (p_soh_bu);
"
"         var_exchange :=
"
"            func_find_exchange_rate (p_soh_bu,
"
"                                     var_cust_curr,
"
"                                     var_base_curr,
"
"                                     p_soh_order_date,
"
"                                     'SO');
"
"
"
"
"
"
"
"         FOR CR2 IN C2
"
"         LOOP
"
"            v_plnt := cr2.soh_plant;
"
"         END LOOP;
"
"
"
"         SELECT sSL_LEAD_TIME
"
"           INTO var_ltime
"
"           FROM suplr_SHIP_LOC
"
"          WHERE     ssL_BU = p_soh_bu
"
"                AND ssL_suplr_ID = p_soh_cust_id
"
"                AND ROWNUM = 1;
"
"
"
"         SELECT func_find_product_leadtime (p_soh_bu,
"
"                                            p_soh_plant,
"
"                                            p_soq_prod_id,
"
"                                            p_soq_prod_rev,
"
"                                            cr_ln.soq_qty_ordered,
"
"                                            'MFG')
"
"           INTO var_prod_lead_time
"
"           FROM DUAL;
"
"
"
"         OPEN c5;
"
"
"
"         FETCH c5 INTO cr5;
"
"
"
"         IF c5%FOUND
"
"         THEN
"
"            var_rm_lead_time := cr5.prodplnt_fix_lead_time;
"
"         ELSE
"
"            var_rm_lead_time := 0;
"
"         END IF;
"
"
"
"         CLOSE c5;
"
"
"
"
"
"
"
"         SELECT COUNT (*)
"
"           INTO v_cnt
"
"           FROM suppliers
"
"          WHERE     suplr_bu = p_soh_bu
"
"                AND suplr_suplr_id = p_soh_cust_id
"
"                AND suplr_country = (SELECT bu_country
"
"                                       FROM business_units
"
"                                      WHERE bu_id = p_soh_bu);
"
"
"
"         OPEN c4;
"
"
"
"         FETCH c4 INTO cr4;
"
"
"
"         IF c4%NOTFOUND
"
"         THEN
"
"            raise_Application_error (-20999, 'Item not found at this plant.');
"
"         ELSE
"
"            v_plnt := cr4.prodplnt_plnt;
"
"         END IF;
"
"
"
"         CLOSE c4;
"
"
"
"         var_rqrd_days :=
"
"              NVL (var_ltime, 0)
"
"            + NVL (var_prod_lead_time, 0)
"
"            + NVL (var_rm_lead_time, 0);
"
"
"
"         IF var_rqrd_days = 0
"
"         THEN
"
"            var_rqrd_days := 1;
"
"         ELSE
"
"            var_rqrd_days := var_rqrd_days;
"
"         END IF;
"
"
"
"         var_desp_days :=
"
"            NVL (var_prod_lead_time, 0) + NVL (var_rm_lead_time, 0);
"
"
"
"         IF var_desp_days = 0
"
"         THEN
"
"            var_desp_days := 1;
"
"         ELSE
"
"            var_desp_days := var_desp_days;
"
"         END IF;
"
"
"
"         OPEN c6 (var_rqrd_days);
"
"
"
"         FETCH c6 INTO cr6;
"
"
"
"         IF c6%FOUND
"
"         THEN
"
"            var_rqrd_date := cr6.wcln_date;
"
"         ELSE
"
"            raise_application_error (
"
"               -20999,
"
"                  'Workday calendar not defined.'
"
"               || 'Required Date'
"
"               || '/'
"
"               || cr6.wcln_date
"
"               || '/'
"
"               || var_rqrd_days
"
"               || '/'
"
"               || var_rqrd_date
"
"               || '/'
"
"               || (  NVL (var_ltime, 0)
"
"                   + NVL (var_prod_lead_time, 0)
"
"                   + NVL (var_rm_lead_time, 0))
"
"               || '/'
"
"               || NVL (var_ltime, 0)
"
"               || '/'
"
"               || NVL (var_prod_lead_time, 0)
"
"               || '/'
"
"               || NVL (var_rm_lead_time, 0));
"
"         END IF;
"
"
"
"         CLOSE c6;
"
"
"
"         OPEN c6 (var_desp_days);
"
"
"
"         FETCH c6 INTO cr6;
"
"
"
"         IF c6%FOUND
"
"         THEN
"
"            var_rqrd_date1 := cr6.wcln_date;
"
"         ELSE
"
"            raise_application_error (-20999,
"
"                                     'WORKDAY_CALENDAR' || 'Despatch Date');
"
"         END IF;
"
"
"
"         CLOSE c6;
"
"
"
"         OPEN C3;
"
"
"
"         FETCH C3 INTO CR3;
"
"
"
"         IF C3%FOUND
"
"         THEN
"
"            UPDATE sales_order_qtys
"
"               SET soq_desp_date = var_rqrd_date1,
"
"                   soq_rqrd_date = var_rqrd_date
"
"             WHERE soq_bu = p_soh_bu AND soq_order_no = p_soh_order_no;
"
"
"
"            CLOSE c3;
"
"         END IF;
"
"      END;
"
"   END;
"
"END;
"
"
"
"   PROCEDURE proc_so_post_web_som1040 (p_bu                 VARCHAR2,
"
"                                       p_user               VARCHAR2,
"
"                                       p_order_pfx          VARCHAR2,
"
"                                       p_order_no           VARCHAR2,
"
"                                       p_res         IN OUT VARCHAR2)
"
"   IS
"
"      CURSOR c_hd
"
"      IS
"
"         SELECT *
"
"           FROM sales_order_hd
"
"          WHERE     soh_bu = p_bu
"
"                AND soh_order_no = p_order_no
"
"                AND soh_order_pfx = p_order_pfx;
"
"
"
"      cr_hd           c_hd%ROWTYPE;
"
"      v_cust_credit   VARCHAR2 (200);
"
"   BEGIN
"
"      OPEN c_hd;
"
"
"
"      FETCH c_hd INTO cr_hd;
"
"
"
"      IF cr_hd.soh_cust_po_no IS NULL
"
"      THEN
"
"         DECLARE
"
"            CURSOR c1
"
"            IS
"
"               SELECT soq_cust_po_no, soq_cust_po_rev, soq_cust_po_date
"
"                 FROM sales_order_qtys
"
"                WHERE     soq_bu = p_bu
"
"                      AND soq_order_no = p_order_no
"
"                      AND soq_cust_po_no IS NOT NULL
"
"                      AND ROWNUM = 1;
"
"
"
"            cr1   c1%ROWTYPE;
"
"         BEGIN
"
"            OPEN c1;
"
"
"
"            FETCH c1 INTO cr1;
"
"
"
"            IF c1%FOUND
"
"            THEN
"
"               cr_hd.soh_cust_po_no := cr1.soq_cust_po_no;
"
"               cr_hd.soh_cust_po_rev := cr1.soq_cust_po_rev;
"
"               cr_hd.soh_cust_po_date := cr1.soq_cust_po_date;
"
"            END IF;
"
"
"
"            CLOSE c1;
"
"         END;
"
"      END IF;
"
"
"
"      UPDATE sales_order_qtys
"
"         SET soq_cust_po_no = cr_hd.soh_cust_po_no,
"
"             soq_cust_po_rev = cr_hd.soh_cust_po_rev,
"
"             soq_cust_po_date = cr_hd.soh_cust_po_date
"
"       WHERE     soq_bu = p_bu
"
"             AND soq_order_no = p_order_no
"
"             AND soq_cust_po_no IS NULL;
"
"
"
"      UPDATE sales_order_qtys
"
"         SET soq_shipfrm_loc_name = cr_hd.soh_shipfrm_loc_name,
"
"             soq_shipfrm_loc_id = cr_hd.soh_plnt_loc_id
"
"       WHERE soq_shipfrm_loc_name IS NULL
"
"         AND soq_bu = p_bu
"
"         AND soq_order_no = p_order_no;
"
"
"
"      COMMIT;
"
"
"
"      DECLARE
"
"         CURSOR c1
"
"         IS
"
"            SELECT somctrl_so_cust_po_rqrd
"
"              FROM som_control
"
"             WHERE somctrl_bu = p_bu;
"
"
"
"         cr1     c1%ROWTYPE;
"
"         v_cnt   NUMBER (5);
"
"      BEGIN
"
"         OPEN c1;
"
"
"
"         FETCH c1 INTO cr1;
"
"
"
"         IF c1%FOUND AND cr1.somctrl_so_cust_po_rqrd = 'Y'
"
"         THEN
"
"            SELECT COUNT (*)
"
"              INTO v_cnt
"
"              FROM sales_order_qtys
"
"             WHERE     soq_bu = p_bu
"
"                   AND soq_order_no = p_order_no
"
"                   AND soq_promotion_flag IN ('N', 'T', 'P')
"
"                   AND soq_cust_po_no IS NULL;
"
"
"
"            IF v_cnt > 0
"
"            THEN
"
"               raise_application_error (
"
"                  -20999,
"
"                  'Customer PO No. in line level must be entered.');
"
"            END IF;
"
"         END IF;
"
"      END;
"
"
"
"      DECLARE
"
"         CURSOR c1
"
"         IS
"
"            SELECT somctrl_so_cust_po_rqrd
"
"              FROM som_control
"
"             WHERE somctrl_bu = p_bu;
"
"
"
"         cr1     c1%ROWTYPE;
"
"         v_cnt   NUMBER (5);
"
"      BEGIN
"
"         OPEN c1;
"
"
"
"         FETCH c1 INTO cr1;
"
"
"
"         IF c1%FOUND AND cr1.somctrl_so_cust_po_rqrd = 'Y'
"
"         THEN
"
"            SELECT COUNT (*)
"
"              INTO v_cnt
"
"              FROM sales_order_qtys
"
"             WHERE     soq_bu = p_bu
"
"                   AND soq_order_no = p_order_no
"
"                   AND soq_promotion_flag IN ('N', 'T', 'P')
"
"                   AND soq_cust_po_date IS NULL;
"
"
"
"            IF v_cnt > 0
"
"            THEN
"
"               raise_application_error (
"
"                  -20999,
"
"                  'Customer PO Date in line level must be entered.');
"
"            END IF;
"
"         END IF;
"
"      END;
"
"
"
"
"
"      IF    cr_hd.soh_billto_loc_name IS NULL
"
"         OR cr_hd.soh_shipto_loc_name IS NULL
"
"         OR cr_hd.soh_billfrm_loc_name IS NULL
"
"         OR cr_hd.soh_shipfrm_loc_name IS NULL
"
"      THEN
"
"         raise_application_error (-20999, 'Location must be entered.');
"
"      END IF;
"
"
"
"
"
"      IF cr_hd.soh_sales_person IS NULL
"
"      THEN
"
"         raise_application_error (-20999, 'Sales Person must be entered.');
"
"      END IF;
"
"
"
"
"
"      DECLARE
"
"         CURSOR c1
"
"         IS
"
"            SELECT somctrl_so_cust_po_rqrd
"
"              FROM som_control
"
"             WHERE somctrl_bu = P_BU;
"
"
"
"         cr1   c1%ROWTYPE;
"
"      BEGIN
"
"         OPEN c1;
"
"
"
"         FETCH c1 INTO cr1;
"
"
"
"         IF     c1%FOUND
"
"            AND cr1.somctrl_so_cust_po_rqrd = 'Y'
"
"            AND cr_hd.soh_cust_po_date IS NULL
"
"         THEN
"
"            RAISE_APPLICATION_ERROR (-20999,
"
"                                     'Customer PO date must be entered.');
"
"         END IF;
"
"
"
"         CLOSE c1;
"
"      END;
"
"
"
"
"
"      DECLARE
"
"         CURSOR c1
"
"         IS
"
"              SELECT *
"
"                FROM sales_order_hd, sales_order_qtys, products
"
"               WHERE     soh_bu = soq_bu
"
"                     AND soh_order_no = soq_order_no
"
"                     AND prod_bu = soq_bu
"
"                     AND prod_id = soq_prod_id
"
"                     AND prod_rev = soq_prod_rev
"
"                     AND soq_bu = p_bu
"
"                     AND soq_order_no = p_order_no
"
"                     AND prod_stocked = 'Y'
"
"                     AND soh_status = 'N'
"
"                     AND soq_status = 'N'
"
"            ORDER BY soq_seq_no;
"
"
"
"         CURSOR c2 (
"
"            c_plnt           VARCHAR2,
"
"            c_plnt_loc_id    VARCHAR2,
"
"            c_store_id       VARCHAR2)
"
"         IS
"
"            SELECT *
"
"              FROM stores
"
"             WHERE     store_bu = p_bu
"
"                   AND store_plnt = c_plnt
"
"                   AND store_plnt_loc_id = c_plnt_loc_id
"
"                   AND store_id = c_store_id;
"
"
"
"         cr2   c2%ROWTYPE;
"
"      BEGIN
"
"         FOR cr1 IN c1
"
"         LOOP
"
"            OPEN c2 (cr1.soh_plant, cr1.soq_shipfrm_loc_id, cr1.soq_store_id);
"
"
"
"            FETCH c2 INTO cr2;
"
"
"
"            IF c2%NOTFOUND
"
"            THEN
"
"               RAISE_APPLICATION_ERROR (
"
"                  -20999,
"
"                  'Warehouse is not associated with unit location.');
"
"            END IF;
"
"
"
"            CLOSE c2;
"
"         END LOOP c1;
"
"      END;
"
"
"
"      DECLARE
"
"         CURSOR c1
"
"         IS
"
"            SELECT *
"
"              FROM sales_order_qtys
"
"             WHERE soq_bu = p_bu AND soq_order_no = p_order_no;
"
"
"
"         CURSOR c2 (
"
"            c_so_no            VARCHAR2,
"
"            c_so_schld_desc    VARCHAR2)
"
"         IS
"
"            SELECT *
"
"              FROM sales_order_qtys
"
"             WHERE     soq_bu = p_bu
"
"                   AND soq_order_no <> c_so_no
"
"                   AND soq_schld_desc = c_so_schld_desc
"
"                   AND soq_status <> 'L'
"
"                   AND  (soq_cs_qty <> (soq_qty_ordered - (soq_qty_invoiced+soq_in_process_qty)));
"
"      BEGIN
"
"         FOR cr1 IN c1
"
"         LOOP
"
"            FOR cr2 IN c2 (cr1.soq_order_no, cr1.soq_schld_desc)
"
"            LOOP
"
"               RAISE_APPLICATION_ERROR (
"
"                  -20999,
"
"                     'SO/Prj. reference already exists.'
"
"                  || '-'
"
"                  || cr2.soq_order_no);
"
"            END LOOP c2;
"
"         END LOOP c1;
"
"      END;
"
"
"
"
"
"      /*  IF func_find_base_currency (p_bu) <> cr_hd.soh_currency
"
"           AND cr_hd.soh_lut_ref_no IS NULL
"
"        THEN
"
"           raise_application_error (-20999, 'LUT No. must be entered.');
"
"        END IF;
"
"     */
"
"
"
"      DECLARE
"
"         CURSOR c1
"
"         IS
"
"            SELECT soq_seq_no, soq_prod_id, soq_prod_rev
"
"              FROM sales_order_hd,
"
"                   sales_order_qtys,
"
"                   products,
"
"                   prod_plants
"
"             WHERE     soq_bu = soh_bu
"
"                   AND soq_order_no = soh_order_no
"
"                   AND soq_bu = prod_bu
"
"                   AND soq_prod_id = prod_id
"
"                   AND soq_prod_rev = prod_rev
"
"                   AND prod_bu = prodplnt_bu
"
"                   AND prod_id = prodplnt_prod_id
"
"                   AND prod_rev = prodplnt_prod_rev
"
"                   AND prodplnt_plnt = cr_hd.soh_plant
"
"                   AND prodplnt_bom_req = 'Y'
"
"                   AND prodplnt_cls_type = 'FG'
"
"                   AND prod_indicator = 'I'
"
"                   AND prod_strategy = 'E1'
"
"                   AND soq_status NOT IN ('C', 'L')
"
"                   AND soh_order_type NOT IN ('LE', 'LI')
"
"                   AND soq_bom_name IS NULL
"
"                   AND soq_bom_no IS NULL
"
"                   AND soh_bu = p_bu
"
"                   AND soh_order_no = p_order_no;
"
"
"
"         cr1   c1%ROWTYPE;
"
"      BEGIN
"
"         OPEN c1;
"
"
"
"         FETCH c1 INTO cr1;
"
"
"
"         IF c1%FOUND
"
"         THEN
"
"            raise_application_error (
"
"               -20999,
"
"                  'BOM name must be entered for the line.'
"
"               || '/'
"
"               || cr1.soq_seq_no);
"
"         END IF;
"
"
"
"         CLOSE c1;
"
"      END;
"
"
"
"      IF cr_hd.soh_order_type <> 'ST'
"
"      THEN
"
"         DECLARE
"
"            CURSOR c1
"
"            IS
"
"               SELECT soq_seq_no
"
"                 FROM sales_order_qtys
"
"                WHERE     soq_bu = p_bu
"
"                      AND soq_order_no = p_order_no
"
"                      AND soq_price_basis <> 'U'
"
"                      AND soq_status IN ('N', 'T');
"
"
"
"            CURSOR c2 (
"
"               c_seq_no NUMBER)
"
"            IS
"
"               SELECT *
"
"                 FROM sales_order_qtys
"
"                WHERE     soq_bu = p_bu
"
"                      AND soq_order_no = p_order_no
"
"                      AND soq_seq_no = c_seq_no
"
"                      AND soq_price_basis <> 'U'
"
"                      AND (soq_realzn_price = 0 OR soq_realzn_price IS NULL)
"
"                      AND soq_status IN ('N', 'T');
"
"
"
"            CURSOR c3
"
"            IS
"
"               SELECT somctrl_realisation_rqrd
"
"                 FROM som_control
"
"                WHERE somctrl_bu = p_bu;
"
"
"
"            cr2   c2%ROWTYPE;
"
"            cr3   c3%ROWTYPE;
"
"         BEGIN
"
"            FOR cr1 IN c1
"
"            LOOP
"
"               OPEN c3;
"
"
"
"               FETCH c3 INTO cr3;
"
"
"
"               CLOSE c3;
"
"
"
"               OPEN c2 (cr1.soq_seq_no);
"
"
"
"               FETCH c2 INTO cr2;
"
"
"
"               IF c2%FOUND AND cr3.somctrl_realisation_rqrd = 'Y'
"
"               THEN
"
"                  raise_application_error (
"
"                     -20999,
"
"                        'Realisation must be entered for the line no.'
"
"                     || '-'
"
"                     || cr1.soq_seq_no);
"
"               END IF;
"
"
"
"               CLOSE c2;
"
"            END LOOP c1;
"
"         END;
"
"      END IF;
"
"
"
"
"
"      IF cr_hd.soh_billto_loc_name IS NULL
"
"      THEN
"
"         raise_application_error (-20999, 'Location Not Found.');
"
"      END IF;
"
"
"
"      DECLARE
"
"         v_spec_cnt   NUMBER;
"
"      BEGIN
"
"         FOR cr1
"
"            IN (SELECT soq_seq_no
"
"                  FROM sales_order_qtys
"
"                 WHERE     soq_bu = p_bu
"
"                       AND soq_order_no = p_order_no
"
"                       AND soq_status NOT IN ('C', 'L')
"
"                       AND soq_qty_ordered = 0)
"
"         LOOP
"
"            raise_application_error (
"
"               -20999,
"
"               'Order Qty. must be entered for line no. ' || cr1.soq_seq_no);
"
"         END LOOP;
"
"      END;
"
"
"
"      proc_chk_cust_trans_hold (p_bu, cr_hd.soh_cust_id);
"
"
"
"
"
"/*      IF cr_hd.soh_cash_disc_pct >= 0
"
"      THEN
"
"         UPDATE sales_order_qtys
"
"            SET soq_cash_disc_amt =
"
"                   (NVL ( ( (soq_qty_ordered * soq_price) - soq_disc_amt), 0)
"
"                    * cr_hd.soh_cash_disc_pct
"
"                    / 100)
"
"          WHERE soq_bu = p_bu AND soq_order_no = p_order_no;
"
"
"
"         COMMIT;
"
"      END IF;
"
"    */
"
"
"
"      proc_upd_sales_amt (p_bu,
"
"                          p_order_no,
"
"                          p_user,
"
"                          cr_hd.soh_order_type);
"
"
"
"      DECLARE
"
"         CURSOR C3
"
"         IS
"
"            SELECT (NVL (
"
"                       NVL (
"
"                          SUM (
"
"                             ( (soq_qty_ordered / soq_conv_factor)
"
"                              * soq_price)
"
"                             - ( ( (soq_qty_ordered / soq_conv_factor)
"
"                                  * soq_price)
"
"                                * soq_disc_pct
"
"                                / 100)),
"
"                          0),
"
"                       0))
"
"                      tot_amt
"
"              FROM sales_order_hd, sales_order_qtys
"
"             WHERE     soh_bu = soq_bu
"
"                   AND soh_order_no = soq_order_no
"
"                   AND soh_status NOT IN ('C', 'L')
"
"                   AND soq_status NOT IN ('C', 'L')
"
"                   AND soh_order_no = cr_hd.soh_order_no
"
"                   AND soh_order_pfx = cr_hd.soh_order_pfx
"
"                   AND soh_bu = p_bu;
"
"
"
"         CURSOR C4
"
"         IS
"
"            SELECT SUM (
"
"                        soq_igst_amt
"
"                      + soq_sgst_amt
"
"                      + soq_cgst_amt
"
"                      + soq_utgst_amt
"
"                      + soq_cess_amt)
"
"                      TAX_AMT
"
"              FROM SALES_ORDER_QTYS
"
"             WHERE soq_order_no = cr_hd.soh_order_no AND SOQ_BU = p_bu;
"
"
"
"
"
"
"
"         cr3                c3%ROWTYPE;
"
"         cr4                c4%ROWTYPE;
"
"         TOTAL_CAL_AMOUNT   VARCHAR2 (50);
"
"      BEGIN
"
"         OPEN C3;
"
"
"
"         FETCH C3 INTO CR3;
"
"
"
"         CLOSE C3;
"
"
"
"         OPEN C4;
"
"
"
"         FETCH C4 INTO CR4;
"
"
"
"         CLOSE C4;
"
"
"
"         total_cal_amount := NVL (cr3.tot_amt, 0) + NVL (cr4.tax_amt, 0);
"
"         /*proc_chq_pan_no_req (p_bu,
"
"                              'C',
"
"                              cr_hd.soh_cust_id,
"
"                              total_cal_amount);*/
"
"      END;
"
"
"
"
"
"      DECLARE
"
"         CURSOR c01
"
"         IS
"
"            SELECT soq_seq_no
"
"              FROM sales_order_qtys
"
"             WHERE     soq_bu = p_bu
"
"                   AND soq_order_no = cr_hd.soh_order_no
"
"                   AND soq_status <> 'L';
"
"
"
"         CURSOR c1
"
"         IS
"
"            SELECT soq_seq_no, NVL (soq_qty_ordered, 0) ln_qty
"
"              FROM sales_order_qtys
"
"             WHERE     soq_bu = p_bu
"
"                   AND soq_order_no = cr_hd.soh_order_no
"
"                   AND soq_status <> 'L';
"
"
"
"         CURSOR c2
"
"         IS
"
"            SELECT soq_store_id,
"
"                   soq_prod_id,
"
"                   soq_prod_rev,
"
"                   soq_qty_due,
"
"                   soq_qty_ordered,
"
"                   soq_rqrd_date
"
"              FROM sales_order_qtys
"
"             WHERE soq_bu = p_bu AND soq_order_no = cr_hd.soh_order_no;
"
"
"
"         CURSOR c3
"
"         IS
"
"            SELECT suplr_cr_lmt_chk_flag
"
"              FROM suppliers
"
"             WHERE suplr_bu = p_bu AND suplr_suplr_id = cr_hd.soh_cust_id;
"
"
"
"         CURSOR c4
"
"         IS
"
"            SELECT *
"
"              FROM sales_order_qtys
"
"             WHERE     soq_bu = p_bu
"
"                   AND soq_order_no = cr_hd.soh_order_no
"
"                   AND soq_status <> 'L';
"
"
"
"         CURSOR c6
"
"         IS
"
"            SELECT term_adv_pct
"
"              FROM terms_hd
"
"             WHERE term_bu = p_bu AND term_term_id = cr_hd.soh_term_id;
"
"
"
"
"
"
"
"         cr6               c6%ROWTYPE;
"
"         v_cr_limit_hold   VARCHAR2 (10) := 'N';
"
"
"
"         var_sum_qty       NUMBER (18, 3);
"
"         var_tot_tax       NUMBER (18, 3);
"
"         var_adv_amt       NUMBER (18, 3);
"
"         var_tot_amt       NUMBER (18, 3);
"
"         var_flag          VARCHAR2 (1) := 'Y';
"
"         var_flag1         VARCHAR2 (1) := 'N';
"
"         alrt              NUMBER;
"
"         var_cnt           NUMBER;
"
"         var_cnt1          NUMBER;
"
"         var_cnt2          NUMBER;
"
"         var_cnt3          NUMBER;
"
"         var_cnt_price     NUMBER;
"
"         var_res           VARCHAR2 (1);
"
"         cr3               c3%ROWTYPE;
"
"         var_tax_cnt       NUMBER;
"
"         cp1               NUMBER;
"
"         cp2               NUMBER;
"
"         chk_alert         NUMBER;
"
"         var_qty           NUMBER;
"
"         var_qty1          NUMBER;
"
"         var_loc_cnt       NUMBER (5);
"
"         v_spd_qty         NUMBER (12, 3);
"
"         var_appr_cnt      NUMBER (10);
"
"         cust_credit       NUMBER;
"
"         total             NUMBER;
"
"         pt_tot            NUMBER;
"
"         t_tot             NUMBER;
"
"      BEGIN
"
"         SELECT COUNT (1)
"
"           INTO var_cnt_price
"
"           FROM sales_order_qtys
"
"          WHERE     soq_bu = p_bu
"
"                AND soq_order_no = cr_hd.soh_order_no
"
"                AND soq_price = 0
"
"                AND soq_promotion_flag IN ('T', 'N')
"
"                AND cr_hd.soh_order_type NOT IN ('LE', 'RP')
"
"                AND soq_status <> 'L';
"
"
"
"         IF var_cnt_price <> 0
"
"         THEN
"
"            raise_application_error (-20979, 'SOM');
"
"         END IF;
"
"
"
"         IF cr_hd.soh_plant IS NULL
"
"         THEN
"
"            raise_application_error (-20980, 'SOM');
"
"         END IF;
"
"
"
"         IF cr_hd.soh_sub_terr_id IS NULL
"
"         THEN
"
"            raise_application_error (-20981, 'SOM');
"
"         END IF;
"
"
"
"
"
"         DECLARE
"
"            CURSOR c1
"
"            IS
"
"               SELECT somctrl_so_chk_cr_limit_flag, somctrl_cr_limit_wf_req
"
"                 FROM som_control
"
"                WHERE somctrl_bu = p_bu;
"
"
"
"            cr1        c1%ROWTYPE;
"
"            v_result   VARCHAR2 (100);
"
"         BEGIN
"
"            OPEN c1;
"
"
"
"            FETCH c1 INTO cr1;
"
"
"
"            IF c1%FOUND AND cr1.somctrl_so_chk_cr_limit_flag = 'Y'
"
"            THEN
"
"                proc_chk_cust_credit_limit_so (p_bu,
"
"                                               cr_hd.soh_plant,
"
"                                               p_order_pfx,
"
"                                               p_order_no,
"
"                                               cr_hd.soh_cust_id,
"
"                                               TRUNC (cr_hd.soh_order_date),
"
"                                               p_user,
"
"                                               v_result);
"
"
"
"
"
"               IF cr1.somctrl_cr_limit_wf_req = 'N'
"
"               THEN
"
"                  IF v_result = 'Y'
"
"                  THEN
"
"                     raise_application_error (-20999,
"
"                                              'Credit Limit exceeds.');
"
"                  END IF;
"
"               ELSE
"
"                  IF v_result = 'Y'
"
"                  THEN
"
"                     UPDATE sales_order_hd
"
"                        SET soh_credit_limit_exceed_flag = 'Y'
"
"                      WHERE     soh_bu = p_bu
"
"                            AND soh_order_pfx = p_order_pfx
"
"                            AND soh_order_no = p_order_no;
"
"
"
"                     COMMIT;
"
"                  ELSE
"
"                     UPDATE sales_order_hd
"
"                        SET soh_credit_limit_exceed_flag = 'N'
"
"                      WHERE     soh_bu = p_bu
"
"                            AND soh_order_pfx = p_order_pfx
"
"                            AND soh_order_no = p_order_no;
"
"
"
"                     COMMIT;
"
"                  END IF;
"
"               END IF;
"
"            END IF;
"
"
"
"            CLOSE c1;
"
"         END;
"
"
"
"
"
"
"
"
"
"         DECLARE
"
"            CURSOR c1
"
"            IS
"
"               SELECT somctrl_so_chk_cr_limit_flag, somctrl_cr_limit_wf_req
"
"                 FROM som_control
"
"                WHERE somctrl_bu = p_bu;
"
"
"
"
"
"            v_new_param       VARCHAR2 (5);
"
"            v_wf_type         VARCHAR2 (15);
"
"            v_std_price_cnt   NUMBER;
"
"            cr1               c1%ROWTYPE;
"
"            v_result          VARCHAR2 (100);
"
"            v_appr_res        VARCHAR2 (1);
"
"         BEGIN
"
"            OPEN c1;
"
"
"
"            FETCH c1 INTO cr1;
"
"
"
"            IF     c1%FOUND
"
"               AND cr1.somctrl_so_chk_cr_limit_flag = 'Y'
"
"               AND cr1.somctrl_cr_limit_wf_req = 'Y'
"
"            THEN
"
"
"
"                 proc_chk_cust_credit_limit_so (p_bu,
"
"                                                 cr_hd.soh_plant,
"
"                                                 p_order_pfx,
"
"                                                 p_order_no,
"
"                                                 cr_hd.soh_cust_id,
"
"                                                 TRUNC (cr_hd.soh_order_date),
"
"                                                 p_USER,
"
"                                                 v_result);
"
"               p_res := v_result;
"
"            ELSE
"
"               v_result := 'N';
"
"               p_res := v_result;                     --declared by Iswarya---
"
"            END IF;
"
"
"
"            CLOSE c1;
"
"         END;
"
"      END;
"
"   END;
"
"END;"
/
