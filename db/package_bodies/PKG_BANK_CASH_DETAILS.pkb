CREATE OR REPLACE
"PACKAGE BODY        pkg_bank_cash_details
"
"AS
"
"   PROCEDURE proc_account_bank_details (
"
"      p_bu                      IN     VARCHAR2,
"
"      p_btdln_acct              IN     VARCHAR2,
"
"      p_btdln_acct_desc            OUT VARCHAR2,
"
"      p_lgr_bfcry_id               OUT VARCHAR2,
"
"      p_btdln_bfcry_id             OUT VARCHAR2,
"
"      p_btdln_ref_bu               OUT VARCHAR2,
"
"      p_btdln_bfcry_type           OUT VARCHAR2,
"
"      p_lgr_bfcry_desc             OUT VARCHAR2,
"
"      p_btdln_acct_type            OUT VARCHAR2,
"
"      p_btdln_gstin_no             OUT VARCHAR2,
"
"      p_btdln_state_code           OUT VARCHAR2,
"
"      p_btdln_gst_type             OUT VARCHAR2,
"
"      p_btdln_suplr_type           OUT VARCHAR2,
"
"      p_btrans_trans_curcy      IN     VARCHAR2,
"
"      p_btrans_trs_bse_exrate   IN     NUMBER,
"
"      p_btdln_ref_type             OUT VARCHAR2,
"
"      p_btdln_curr                 OUT VARCHAR2,
"
"      p_btln_exrate                OUT NUMBER,
"
"      p_btdln_dist_amt             OUT NUMBER,
"
"      p_btdln_lvl1                 OUT VARCHAR2,
"
"      p_btdln_lvl2                 OUT VARCHAR2,
"
"      p_btdln_lvl3                 OUT VARCHAR2,
"
"      p_btdln_lvl4                 OUT VARCHAR2,
"
"      p_btdln_lvl5                 OUT VARCHAR2,
"
"      p_btdln_lvl6                 OUT VARCHAR2,
"
"      p_btdln_cc_code              OUT VARCHAR2,
"
"      p_btdln_lvl_prj              OUT VARCHAR2,
"
"      p_btdln_acct_plant           OUT VARCHAR2,
"
"      p_cost_cen_desc              OUT VARCHAR2,
"
"      p_plnt_loc_id                OUT VARCHAR2,
"
"      p_btdln_cwp_asset_id         OUT VARCHAR2,
"
"      p_btdln_gst_sulr_name        OUT VARCHAR2,
"
"      p_btdln_gst_pan_no           OUT VARCHAR2,
"
"      p_btdln_gst_pan_avail        OUT VARCHAR2,
"
"      p_btdln_hsn_code             OUT VARCHAR2,
"
"      p_btrans_plant             IN    VARCHAR2 DEFAULT NULL)
"
"   IS
"
"   BEGIN
"
"      IF p_btdln_acct IS NULL
"
"      THEN
"
"         raise_application_error (-20999, 'Account must be entered.');
"
"      ELSIF p_btdln_acct IS NOT NULL
"
"      THEN
"
"         DECLARE
"
"            CURSOR c1
"
"            IS
"
"               SELECT glac_acct,
"
"                      glac_acct_desc1,
"
"                      glac_hsn_sac_code,
"
"                      glac_tc_id,
"
"                      glac_pan_no
"
"                 FROM gl_accts
"
"                WHERE glac_bu = p_bu AND glac_acct = p_btdln_acct;
"
"
"
"            CURSOR C2
"
"            IS
"
"               SELECT ssl_gst_no,
"
"                      state_code,
"
"                      state_name1,
"
"                      ssl_gst_type,
"
"                      ssl_type
"
"                 FROM suplr_ship_loc, states
"
"                WHERE     ssl_bu = p_bu
"
"                      AND ssl_suplr_id = p_lgr_bfcry_id
"
"                      AND ssl_dflt_flg = 'Y'
"
"                      AND state_id = ssl_state;
"
"
"
"            CURSOR C4
"
"            IS
"
"               SELECT ssl_gst_no,
"
"                      state_code,
"
"                      state_name1,
"
"                      ssl_gst_type,
"
"                      ssl_type
"
"                 FROM suplr_ship_loc, states
"
"                WHERE     ssl_bu = p_bu
"
"                      AND ssl_suplr_id = p_lgr_bfcry_id
"
"                      AND ssl_dflt_flg in ('B','S','D')
"
"                      AND state_id = ssl_state
"
"                      AND ssl_bu =STATE_BU;
"
"
"
"            cr1             c1%ROWTYPE;
"
"            cr2             c2%ROWTYPE;
"
"            cr4             c4%ROWTYPE;
"
"            v_ledger_type   VARCHAR2 (50);
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
"            IF p_btdln_acct IS NOT NULL
"
"            THEN
"
"               IF c1%FOUND
"
"               THEN
"
"--                  IF p_btdln_acct IS NULL
"
"--                  THEN
"
"                     p_btdln_acct_desc := cr1.glac_acct_desc1;--cr1.glac_acct;
"
"--                  END IF;*/
"
"                  p_btdln_hsn_code  := cr1.glac_hsn_sac_code;
"
"                  p_btdln_bfcry_id  := cr1.glac_tc_id;
"
"                  p_btdln_ref_bu    := p_bu;
"
"
"
"                  IF cr1.glac_pan_no IS NOT NULL THEN
"
"                       p_btdln_gst_pan_no := cr1.glac_pan_no;
"
"                       p_btdln_gst_pan_avail := 'W';
"
"                  END IF;
"
"
"
"                  proc_find_party_id_rev (p_bu,
"
"                                          p_btdln_acct,
"
"                                          p_btdln_bfcry_type,
"
"                                          p_lgr_bfcry_id,
"
"                                          p_lgr_bfcry_desc,
"
"                                          p_btdln_acct_type);
"
"--raise_application_error(-20999,p_lgr_bfcry_desc||'~'||p_lgr_bfcry_id);
"
"--                    IF p_btdln_bfcry_type = 'S' AND func_find_partner_id(p_bu,p_lgr_bfcry_id,'S') IS NOT NULL THEN
"
"--                        p_lgr_bfcry_id        := NULL;
"
"--                        p_lgr_bfcry_desc    := NULL;
"
"--                    ELSIF p_btdln_bfcry_type = 'C' AND func_find_partner_id(p_bu,p_lgr_bfcry_id,'C') IS NOT NULL THEN
"
"--                        p_lgr_bfcry_id        := NULL;
"
"--                        p_lgr_bfcry_desc    := NULL;
"
"--                    END IF;
"
"                  IF p_btdln_bfcry_type = 'S'
"
"                  THEN
"
"                     OPEN c2;
"
"
"
"                     FETCH c2 INTO cr2;
"
"
"
"                     IF C2%FOUND
"
"                     THEN
"
"                        p_btdln_gstin_no := cr2.ssl_gst_no;
"
"                        p_btdln_state_code := cr2.state_code;
"
"                        p_btdln_gst_type := cr2.ssl_gst_type;
"
"                        p_btdln_suplr_type := cr2.ssl_type;
"
"                     END IF;
"
"
"
"                     CLOSE c2;
"
"                  ELSIF p_btdln_bfcry_type = 'C'
"
"                  THEN
"
"                 --   RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"                     OPEN c4;
"
"
"
"                     FETCH c4 INTO cr4;
"
"
"
"                     IF c4%FOUND
"
"                     THEN
"
"                        p_btdln_gstin_no := cr4.ssl_gst_no;
"
"                        p_btdln_state_code := cr4.state_code;
"
"                        p_btdln_gst_type := cr4.ssl_gst_type;
"
"                        p_btdln_suplr_type := cr4.ssl_type;
"
"                     END IF;
"
"
"
"                     CLOSE c4;
"
"                  END IF;
"
"               ELSE
"
"                  raise_application_error (-20999, 'Account not found.');
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
"      END IF;
"
"
"
"      IF p_btdln_acct IS NOT NULL
"
"      THEN
"
"         DECLARE
"
"            CURSOR c1
"
"            IS
"
"               SELECT COUNT (*) v_cnt
"
"                 FROM gl_accts
"
"                WHERE     glac_bu = p_bu
"
"                      AND glac_acct = p_btdln_acct
"
"                      AND glac_cust_id IS NULL
"
"                      AND glac_suplr_id IS NULL
"
"                      AND glac_sub_grp_type NOT IN
"
"                             ('SAP',
"
"                              'SAD',
"
"                              'SSD',
"
"                              'SAC',
"
"                              'CAR',
"
"                              'CAD',
"
"                              'CSD',
"
"                              'CEMD',
"
"                              'CRET',
"
"                              'CPBG',
"
"                              'PCK',
"
"                              'BDS',
"
"                              'TDS',
"
"                              'ESI',
"
"                              'SVT',
"
"                              'TCS',
"
"                              'CASH',
"
"                              'IMP',
"
"                              'EC')
"
"                      AND glac_acct_type_code IS NULL
"
"               UNION ALL
"
"               SELECT COUNT (*) V_CNT
"
"                 FROM gl_accts, acct_type_codes
"
"                WHERE     glac_bu = p_bu
"
"                      AND glac_acct = p_btdln_acct
"
"                      AND glac_cust_id IS NULL
"
"                      AND glac_suplr_id IS NULL
"
"                      AND atc_acct_type NOT IN
"
"                             ('SAP',
"
"                              'SAD',
"
"                              'SSD',
"
"                              'SAC',
"
"                              'CAR',
"
"                              'CAD',
"
"                              'CSD',
"
"                              'CEMD',
"
"                              'CRET',
"
"                              'CPBG',
"
"                              'PCK',
"
"                              'BDS',
"
"                              'TDS',
"
"                              'ESI',
"
"                              'SVT',
"
"                              'TCS',
"
"                              'CASH',
"
"                              'IMP',
"
"                              'EC')
"
"                      AND glac_bu = atc_bu
"
"                      AND glac_acct_type_code = atc_code
"
"                      AND glac_acct_type_code IS NOT NULL;
"
"
"
"         CURSOR c2
"
"         IS
"
"            SELECT COUNT (*) v_cnt
"
"              FROM unt_ac_cat_sal_paybl_acct, glm_control
"
"             WHERE uacspa_bu = p_bu
"
"               AND uacspa_acct = p_btdln_acct
"
"               AND glmctrl_bu = uacspa_bu
"
"               AND glmctrl_pay_agnst_pyrl = 'Y';
"
"
"
"         CURSOR c3
"
"         IS
"
"            SELECT COUNT (*) V_CNT
"
"              FROM fin_mgmt_control
"
"             WHERE fmc_bu = p_bu
"
"               AND fmc_acct = p_btdln_acct
"
"               AND fmc_acct_type IN ('LC', 'US');
"
"
"
"            cr1   c1%ROWTYPE;
"
"            cr2   c2%ROWTYPE;
"
"            cr3   c3%ROWTYPE;
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
"            OPEN C2;
"
"
"
"             FETCH C2 INTO CR2;
"
"
"
"             OPEN C3;
"
"
"
"             FETCH C3 INTO CR3;
"
"
"
"            IF CR1.V_CNT > 0 AND CR2.V_CNT <= 0 AND CR3.V_CNT <= 0
"
"            THEN
"
"               p_btdln_ref_type := 'N';
"
"               p_btdln_curr := p_btrans_trans_curcy;
"
"               p_btln_exrate := p_btrans_trs_bse_exrate;
"
"            ELSE
"
"               p_btdln_dist_amt := 0;
"
"               p_btdln_ref_type := 'R';
"
"               p_btdln_curr := p_btrans_trans_curcy;
"
"               p_btln_exrate := p_btrans_trs_bse_exrate;
"
"            END IF;
"
"         END;
"
"      END IF;
"
"
"
"      -----------for assigning null values if ledger changed-------------
"
"
"
"      IF p_btdln_acct IS NOT NULL
"
"      THEN
"
"         DECLARE
"
"            CURSOR C1
"
"            IS
"
"               SELECT COUNT (*) V_CNT
"
"                 FROM gl_lvl_accounts
"
"                WHERE glal_bu = p_bu AND glal_acct = p_btdln_acct AND(glal_plant = p_btrans_plant OR p_btrans_plant IS NULL);
"
"
"
"
"
"            CURSOR C2
"
"            IS
"
"               SELECT *
"
"                 FROM gl_lvl_accounts
"
"                WHERE glal_bu = p_bu AND glal_acct = p_btdln_acct AND(glal_plant = p_btrans_plant OR p_btrans_plant IS NULL);
"
"
"
"            CR1   C1%ROWTYPE;
"
"            CR2   C2%ROWTYPE;
"
"              v_bs_lvl  VARCHAR2(5);
"
"         BEGIN
"
"            SELECT glmctrl_bs_level
"
"                      INTO  v_bs_lvl
"
"                     FROM glm_control
"
"                   WHERE glmctrl_bu = p_bu;
"
"
"
"           IF v_bs_lvl = 'E' THEN
"
"            OPEN C1;
"
"
"
"            FETCH C1 INTO CR1;
"
"
"
"            IF C1%FOUND
"
"            THEN
"
"               IF CR1.V_CNT = 1
"
"                  AND (func_find_apm_prj_req_flag (p_bu) = 'N'
"
"                       OR func_find_arm_prj_req_flag (p_bu) = 'N')
"
"               THEN
"
"                  OPEN C2;
"
"
"
"                  FETCH C2 INTO CR2;
"
"
"
"                  IF C2%FOUND
"
"                  THEN
"
"                     p_btdln_ref_bu := p_bu;
"
"                     p_btdln_lvl1 := cr2.glal_lvl1;
"
"                     p_btdln_lvl2 := cr2.glal_lvl2;
"
"                     p_btdln_lvl3 := cr2.glal_lvl3;
"
"                     p_btdln_lvl4 := cr2.glal_lvl4;
"
"                     p_btdln_lvl5 := cr2.glal_lvl5;
"
"                     p_btdln_lvl6 := cr2.glal_lvl6;
"
"                     p_btdln_cc_code := cr2.glal_cc_code;
"
"                     p_btdln_lvl_prj := cr2.glal_lvl_prj;
"
"                     p_btdln_acct_plant := cr2.glal_plant;
"
"                     p_cost_cen_desc := cr2.glal_cc_desc;
"
"                     p_plnt_loc_id := cr2.glal_plnt_loc_id;
"
"                  END IF;
"
"
"
"                  CLOSE C2;
"
"               END IF;
"
"            END IF;
"
"
"
"            CLOSE C1;
"
"          END IF;
"
"         END;
"
"      END IF;
"
"
"
"
"
"      IF p_btdln_cc_code IS NOT NULL
"
"      THEN
"
"         DECLARE
"
"            CURSOR C0
"
"            IS
"
"               SELECT COUNT (*) v_count
"
"                 FROM fam_control
"
"                WHERE famctrl_bu = p_bu;
"
"
"
"            CURSOR c1
"
"            IS
"
"               SELECT *
"
"                 FROM gl_accts
"
"                WHERE     glac_bu = p_bu
"
"                      AND glac_acct = p_btdln_acct
"
"                      AND glac_sub_grp_type IN ('CWP')
"
"                      AND glac_acct_status = 'A';
"
"
"
"            CURSOR c2
"
"            IS
"
"               SELECT COUNT (*) v_cnt
"
"                 FROM (SELECT fa_asset_desc1, fa_asset_id
"
"                         FROM fixed_asset_level_acct,
"
"                              fixed_assets,
"
"                              fam_control
"
"                        WHERE     fala_bu = fa_bu
"
"                              AND fala_asset_id = fa_asset_id
"
"                              AND fa_bu = p_bu
"
"                              AND fa_asset_status = 'Y'
"
"                              AND fa_tang_type = 'TW'
"
"                              AND fala_acct = p_btdln_acct
"
"                              AND famctrl_bu = p_bu
"
"                              --AND famctrl_ast_act_src = 'AS'
"
"                       UNION ALL
"
"                       SELECT fa_asset_desc1, fa_asset_id
"
"                         FROM fixed_assets, fixed_asset_accounts, fam_control
"
"                        WHERE     faa_bu = fa_bu
"
"                              AND faa_group_id = fa_group_id
"
"                              AND faa_sub_group_id = fa_sub_group_id
"
"                              AND fa_bu = p_bu
"
"                              AND fa_asset_status = 'Y'
"
"                              AND fa_tang_type = 'TW'
"
"                              AND faa_acct = p_btdln_acct
"
"                              AND famctrl_bu = p_bu
"
"                             /* AND famctrl_ast_act_src = 'DS'*/);
"
"
"
"
"
"            CURSOR c3
"
"            IS
"
"               SELECT fa_asset_desc1, fa_asset_id
"
"                 FROM fixed_asset_level_acct, fixed_assets, fam_control
"
"                WHERE     fala_bu = fa_bu
"
"                      AND fala_asset_id = fa_asset_id
"
"                      AND fa_bu = p_bu
"
"                      AND fa_asset_status = 'Y'
"
"                      AND fa_tang_type = 'TW'
"
"                      AND fala_acct = p_btdln_acct
"
"                      AND famctrl_bu = p_bu
"
"                      --AND famctrl_ast_act_src = 'AS'
"
"               UNION ALL
"
"               SELECT fa_asset_desc1, fa_asset_id
"
"                 FROM fixed_assets, fixed_asset_accounts, fam_control
"
"                WHERE     faa_bu = fa_bu
"
"                      AND faa_group_id = fa_group_id
"
"                      AND faa_sub_group_id = fa_sub_group_id
"
"                      AND fa_bu = p_bu
"
"                      AND fa_asset_status = 'Y'
"
"                      AND fa_tang_type = 'TW'
"
"                      AND faa_acct = p_btdln_acct
"
"                      AND famctrl_bu = p_bu
"
"                     /*AND famctrl_ast_act_src = 'DS'*/;
"
"
"
"            CURSOR C4
"
"            IS
"
"               SELECT *
"
"                 FROM fam_control
"
"                WHERE famctrl_bu = p_bu;
"
"
"
"            cr0   c0%ROWTYPE;
"
"            cr1   c1%ROWTYPE;
"
"            cr2   c2%ROWTYPE;
"
"            cr3   c3%ROWTYPE;
"
"            cr4   c4%ROWTYPE;
"
"         BEGIN
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
"               IF cr0.v_count > 0
"
"               THEN
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
"                     OPEN c4;
"
"
"
"                     FETCH c4 INTO cr4;
"
"
"
"                     IF c4%NOTFOUND
"
"                     THEN
"
"                        NULL;
"
"                     ELSE
"
"                        OPEN c2;
"
"
"
"                        FETCH c2 INTO cr2;
"
"
"
"                        IF cr2.v_cnt = 0
"
"                        THEN
"
"                           /*IF func_find_fa_acct_src (p_bu, 'A') = 'AS'
"
"                           THEN */
"
"                              raise_application_error (
"
"                                 -20999,
"
"                                 'Ledger is not linked to the asset');
"
"                           --ELSE
"
"                              raise_application_error (
"
"                                 -20999,
"
"                                 'Ledger is not linked in the Appl.Acct.(FA)');
"
"                           --END IF;
"
"                        ELSIF cr2.v_cnt = 1
"
"                        THEN
"
"                           OPEN c3;
"
"
"
"                           FETCH c3 INTO cr3;
"
"
"
"                           IF c3%FOUND
"
"                           THEN
"
"                              p_btdln_cwp_asset_id := CR3.fa_asset_id;
"
"                           END IF;
"
"
"
"                           CLOSE c3;
"
"                        END IF;
"
"
"
"                        CLOSE c2;
"
"                     END IF;
"
"
"
"                     CLOSE c4;
"
"                  END IF;
"
"
"
"                  CLOSE c1;
"
"               END IF;
"
"            END IF;
"
"
"
"            CLOSE C0;
"
"         END;
"
"      END IF;
"
"
"
"      IF p_btdln_acct IS NOT NULL
"
"      THEN
"
"         DECLARE
"
"            CURSOR c1
"
"            IS
"
"               SELECT *
"
"                 FROM gl_accts
"
"                WHERE     glac_bu = p_bu
"
"                      AND glac_acct_status = 'A'
"
"                      AND glac_acct = p_btdln_acct
"
"                      AND glac_sub_grp_type IN ('DNT', 'OTHR')
"
"                      AND glac_tc_id IS NOT NULL;
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
"--            Raise_Application_Error(-20999,CR1.glac_tc_id);
"
"            IF C1%FOUND
"
"            THEN
"
"               p_btdln_bfcry_id := CR1.glac_tc_id;
"
"            ELSE
"
"               NULL;
"
"            END IF;
"
"
"
"            CLOSE C1;
"
"         END;
"
"      END IF;
"
"
"
"
"
"      DECLARE
"
"         CURSOR C1
"
"         IS
"
"            SELECT glmctrl_cv_usage_flag
"
"              FROM glm_control
"
"             WHERE glmctrl_bu = p_bu AND glmctrl_cv_usage_flag = 'Y';
"
"
"
"         CURSOR C2
"
"         IS
"
"            SELECT *
"
"              FROM gl_accts
"
"             WHERE     glac_bu = p_bu
"
"                   AND glac_acct_status = 'A'
"
"                   AND glac_acct = p_btdln_acct
"
"                   AND glac_sub_grp_type IN ('CASH', 'IMP');
"
"
"
"         CR1   C1%ROWTYPE;
"
"         CR2   C2%ROWTYPE;
"
"      BEGIN
"
"         OPEN C1;
"
"
"
"         FETCH C1 INTO CR1;
"
"
"
"         IF C1%FOUND
"
"         THEN
"
"            OPEN C2;
"
"
"
"            FETCH C2 INTO CR2;
"
"
"
"            IF C2%FOUND
"
"            THEN
"
"               /*raise_application_error ( -20999, 'Cashier/Imprestor account not allowed.');*/
"
"               NULL;
"
"            END IF;
"
"
"
"            CLOSE C2;
"
"         END IF;
"
"
"
"         CLOSE C1;
"
"      END;
"
"
"
"      IF p_btdln_bfcry_type = 'S' AND p_lgr_bfcry_id IS NOT NULL
"
"      THEN
"
"         BEGIN
"
"            SELECT ssl_state_code,
"
"                   ssl_gst_no,
"
"                   ssl_gst_type,
"
"                   ssl_type,
"
"                   p_lgr_bfcry_desc,
"
"                   SUBSTR (ssl_gst_no, 3, 10),
"
"                   'W'
"
"              INTO p_btdln_state_code,
"
"                   p_btdln_gstin_no,
"
"                   p_btdln_gst_type,
"
"                   p_btdln_suplr_type,
"
"                   p_btdln_gst_sulr_name,
"
"                   p_btdln_gst_pan_no,
"
"                   p_btdln_gst_pan_avail
"
"              FROM suplr_ship_loc
"
"             WHERE     ssl_bu = p_bu
"
"                   AND ssl_suplr_id = p_lgr_bfcry_id
"
"                   AND ssl_dflt_flg IN ('B', 'S', 'D');
"
"         EXCEPTION
"
"            WHEN NO_DATA_FOUND
"
"            THEN
"
"               NULL;
"
"            WHEN TOO_MANY_ROWS
"
"            THEN
"
"               NULL;
"
"         END;
"
"      END IF;
"
"   END proc_account_bank_details;
"
"
"
"   PROCEDURE proc_cash_assign_party (p_bu                     VARCHAR2,
"
"                                     p_user                   VARCHAR2,
"
"                                     p_btdln_acct      IN     VARCHAR2,
"
"                                     p_bfcry_type      IN     VARCHAR2,
"
"                                     p_lgr_bfcry_id       OUT VARCHAR2,
"
"                                     p_lgr_desc        IN     VARCHAR2,
"
"                                     p_acct_type          OUT VARCHAR2,
"
"                                     p_ref_bu          IN     VARCHAR2,
"
"                                     p_lvl1               OUT VARCHAR2,
"
"                                     p_lvl2               OUT VARCHAR2,
"
"                                     p_lvl3               OUT VARCHAR2,
"
"                                     p_lvl4               OUT VARCHAR2,
"
"                                     p_lvl5               OUT VARCHAR2,
"
"                                     p_lvl6               OUT VARCHAR2,
"
"                                     p_lvl_prj            OUT VARCHAR2,
"
"                                     p_acct_plant         OUT VARCHAR2,
"
"                                     p_cost_desc          OUT VARCHAR2,
"
"                                     p_cc_code            OUT VARCHAR2,
"
"                                     p_plnt_loc_id        OUT VARCHAR2,
"
"                                     p_state_code         OUT VARCHAR2,
"
"                                     p_gstin_no           OUT VARCHAR2,
"
"                                     p_gst_type           OUT VARCHAR2,
"
"                                     p_suplr_type         OUT VARCHAR2,
"
"                                     p_gst_sulr_name      OUT VARCHAR2,
"
"                                     p_gst_pan_no         OUT VARCHAR2,
"
"                                     p_gst_pan_avail      OUT VARCHAR2,
"
"                                     p_lang                   NUMBER)
"
"   IS
"
"   BEGIN
"
"      IF p_bfcry_type IN ('S', 'C') AND p_lgr_desc IS NOT NULL
"
"      THEN
"
"      --raise_application_error(-20999,p_bfcry_type);
"
"         DECLARE
"
"            CURSOR C1
"
"            IS
"
"               SELECT glal_suplr_id bfcry_id, glal_lgr_type, glal_bfcry_type
"
"                 FROM suplr_cust_acct_vw_rev
"
"                WHERE     glal_bu = p_bu
"
"                      AND glal_acct = p_btdln_acct
"
"                      AND glal_bfcry_desc = p_lgr_desc
"
"                      AND glal_bfcry_type = p_bfcry_type;
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
"            IF c1%NOTFOUND AND p_bfcry_type NOT IN ( 'E' )
"
"            THEN
"
"               raise_application_error (-20999, 'Party not found.'||'~'||p_bfcry_type||'~'||p_btdln_acct||'~'||p_lgr_desc);
"
"            ELSE
"
"               p_lgr_bfcry_id := cr1.bfcry_id;
"
"               p_acct_type := cr1.glal_lgr_type;
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
"     IF p_bfcry_type IN ('E') THEN
"
"       DECLARE
"
"         CURSOR c1
"
"           IS
"
"         SELECT emp_emp_id,
"
"                emp_type
"
"           FROM employees
"
"          WHERE emp_bu = p_bu
"
"           -- AND emp_first_name1 = p_lgr_desc
"
"           AND UPPER(
"
"        REGEXP_REPLACE(
"
"          TRIM(
"
"            emp_first_name1 || ' ' ||
"
"            NVL(emp_middle_name1, '') || ' ' ||
"
"            emp_last_name1
"
"          ),
"
"          '\s+',
"
"          ' '
"
"        )
"
"      ) LIKE '%' ||
"
"          UPPER(
"
"            REGEXP_REPLACE(TRIM(p_lgr_desc), '\s+', ' ')
"
"          ) || '%'
"
"            AND emp_status ='A';
"
"        cr1 c1%ROWTYPE;
"
"       BEGIN
"
"         OPEN c1;
"
"         FETCH c1 INTO cr1;
"
"
"
"           p_lgr_bfcry_id := cr1.emp_emp_id;
"
"           p_acct_type    := cr1.emp_type;
"
"        CLOSE c1;
"
"       END;
"
"     END IF;
"
"
"
"      ---proc_suplr_ldgr_hold (p_lgr_bfcry_id,p_bfcry_type);
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
"              FROM suppliers
"
"             WHERE     suplr_bu = p_bu
"
"                   AND suplr_suplr_id = p_lgr_bfcry_id
"
"                   AND suplr_hold_flag = 'Y'
"
"                   AND p_bfcry_type = 'S';
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
"            raise_application_error (-20999, 'Supplier is in Hold');
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
"
"
"      IF p_lgr_bfcry_id IS NOT NULL AND p_bfcry_type <> 'E' --AND v_bs_lvl = 'E'
"
"      THEN
"
"         IF func_find_party_type (p_bu, p_lgr_bfcry_id, p_lang) = 'P'
"
"         THEN
"
"            DECLARE
"
"               CURSOR c1
"
"               IS
"
"                  SELECT pcc_desc,
"
"                         pcc_bu,
"
"                         pcc_ac_plnt,
"
"                         pcc_ac_lvl1,
"
"                         pcc_ac_lvl2,
"
"                         pcc_ac_lvl3,
"
"                         pcc_ac_lvl4,
"
"                         pcc_ac_lvl5,
"
"                         pcc_ac_lvl6,
"
"                         pcc_ac_lvl_prj,
"
"                         party_id,
"
"                         party_desc,
"
"                         pcc_cc_code,
"
"                         pcc_ac_plnt_loc_id
"
"                    FROM (SELECT UNIQUE
"
"                                 a.glal_cc_desc pcc_desc,
"
"                                 a.glal_bu pcc_bu,
"
"                                 a.glal_plant pcc_ac_plnt,
"
"                                 a.glal_lvl1 pcc_ac_lvl1,
"
"                                 a.glal_lvl2 pcc_ac_lvl2,
"
"                                 a.glal_lvl3 pcc_ac_lvl3,
"
"                                 a.glal_lvl4 pcc_ac_lvl4,
"
"                                 a.glal_lvl5 pcc_ac_lvl5,
"
"                                 a.glal_lvl6 pcc_ac_lvl6,
"
"                                 a.glal_lvl_prj pcc_ac_lvl_prj,
"
"                                 b.glal_suplr_id party_id,
"
"                                 func_find_party_name (a.glal_bu,
"
"                                                       b.glal_suplr_id,
"
"                                                       1)
"
"                                    party_desc,
"
"                                 a.glal_cc_code pcc_cc_code,
"
"                                 func_find_dflt_plnt_loc (p_bu, a.glal_plant)
"
"                                    pcc_ac_plnt_loc_id
"
"                            FROM gl_lvl_accounts a, suplr_cust_ledger_vw b
"
"                           WHERE a.glal_acct = p_btdln_acct
"
"                                 AND a.glal_sub_grp_type NOT IN
"
"                                        ('BANK', 'BKI', 'BKR')
"
"                                 AND func_find_glm_bs_lvl (p_ref_bu) = 'U'
"
"                                 AND a.glal_bu = b.glal_bu
"
"                                 AND a.glal_acct = b.glal_acct
"
"                                 AND b.glal_acct = p_btdln_acct
"
"                                 AND a.glal_plant = b.glal_party_plant
"
"                                 AND a.glal_plant = b.glal_plant
"
"                                 AND b.glal_acct = p_btdln_acct
"
"                                 AND ( (b.glal_suplr_id = p_lgr_bfcry_id
"
"                                        AND p_bfcry_type = 'S'))
"
"                          UNION ALL
"
"                          SELECT UNIQUE
"
"                                 a.glal_cc_desc pcc_desc,
"
"                                 a.glal_bu pcc_bu,
"
"                                 a.glal_plant pcc_ac_plnt,
"
"                                 a.glal_lvl1 pcc_ac_lvl1,
"
"                                 a.glal_lvl2 pcc_ac_lvl2,
"
"                                 a.glal_lvl3 pcc_ac_lvl3,
"
"                                 a.glal_lvl4 pcc_ac_lvl4,
"
"                                 a.glal_lvl5 pcc_ac_lvl5,
"
"                                 a.glal_lvl6 pcc_ac_lvl6,
"
"                                 a.glal_lvl_prj pcc_ac_lvl_prj,
"
"                                 b.glal_cust_id party_id,
"
"                                 func_find_party_name (a.glal_bu,
"
"                                                       b.glal_cust_id,
"
"                                                       1)
"
"                                    party_desc,
"
"                                 a.glal_cc_code pcc_cc_code,
"
"                                 func_find_dflt_plnt_loc (p_bu, a.glal_plant)
"
"                                    pcc_ac_plnt_loc_id
"
"                            FROM gl_lvl_accounts a, suplr_cust_ledger_vw b
"
"                           WHERE a.glal_acct = p_btdln_acct
"
"                                 AND a.glal_sub_grp_type NOT IN
"
"                                        ('BANK', 'BKI', 'BKR')
"
"                                 AND func_find_glm_bs_lvl (p_ref_bu) = 'U'
"
"                                 AND a.glal_bu = b.glal_bu
"
"                                 AND a.glal_acct = b.glal_acct
"
"                                 AND b.glal_acct = p_btdln_acct
"
"                                 AND a.glal_plant = b.glal_party_plant
"
"                                 AND a.glal_plant = b.glal_plant
"
"                                 AND b.glal_acct = p_btdln_acct
"
"                                 AND ( (b.glal_cust_id = p_lgr_bfcry_id
"
"                                        AND p_bfcry_type = 'C'))
"
"                          UNION ALL
"
"                          SELECT glal_cc_desc pcc_desc,
"
"                                 glal_bu pcc_bu,
"
"                                 glal_plant pcc_ac_plnt,
"
"                                 glal_lvl1 pcc_ac_lvl1,
"
"                                 glal_lvl2 pcc_ac_lvl2,
"
"                                 glal_lvl3 pcc_ac_lvl3,
"
"                                 glal_lvl4 pcc_ac_lvl4,
"
"                                 glal_lvl5 pcc_ac_lvl5,
"
"                                 glal_lvl6 pcc_ac_lvl6,
"
"                                 glal_lvl_prj pcc_ac_lvl_prj,
"
"                                 NULL party_id,
"
"                                 NULL party_desc,
"
"                                 glal_cc_code pcc_cc_code,
"
"                                 func_find_dflt_plnt_loc (p_bu, glal_plant)
"
"                                    pcc_ac_plnt_loc_id
"
"                            FROM gl_lvl_accounts a
"
"                           WHERE glal_acct = p_btdln_acct
"
"                                 AND glal_sub_grp_type NOT IN
"
"                                        ('BANK', 'BKI', 'BKR')
"
"                                 AND p_bfcry_type NOT IN ('S', 'C')
"
"                                 AND func_find_glm_bs_lvl (p_ref_bu) = 'U'
"
"                          UNION ALL
"
"                          SELECT glal_cc_desc pcc_desc,
"
"                                 glal_bu pcc_bu,
"
"                                 glal_plant pcc_ac_plnt,
"
"                                 glal_lvl1 pcc_ac_lvl1,
"
"                                 glal_lvl2 pcc_ac_lvl2,
"
"                                 glal_lvl3 pcc_ac_lvl3,
"
"                                 glal_lvl4 pcc_ac_lvl4,
"
"                                 glal_lvl5 pcc_ac_lvl5,
"
"                                 glal_lvl6 pcc_ac_lvl6,
"
"                                 glal_lvl_prj pcc_ac_lvl_prj,
"
"                                 NULL party_id,
"
"                                 NULL party_desc,
"
"                                 glal_cc_code pcc_cc_code,
"
"                                 func_find_dflt_plnt_loc (p_bu, glal_plant)
"
"                                    pcc_ac_plnt_loc_id
"
"                            FROM gl_lvl_accounts a
"
"                           WHERE glal_acct = p_btdln_acct
"
"                                 AND glal_sub_grp_type NOT IN
"
"                                        ('BANK', 'BKI', 'BKR')
"
"                                 AND func_find_glm_bs_lvl (p_ref_bu) = 'E'
"
"                          UNION ALL
"
"                          SELECT pcc_desc,
"
"                                 pcc_bu,
"
"                                 pcc_ac_plnt,
"
"                                 pcc_ac_lvl1,
"
"                                 pcc_ac_lvl2,
"
"                                 pcc_ac_lvl3,
"
"                                 pcc_ac_lvl4,
"
"                                 pcc_ac_lvl5,
"
"                                 pcc_ac_lvl6,
"
"                                 pcc_ac_lvl_prj,
"
"                                 NULL party_id,
"
"                                 NULL party_desc,
"
"                                 pcc_cc_code,
"
"                                 FUNC_FIND_DFLT_PLNT_LOC (p_bu, pcc_ac_plnt)
"
"                                    pcc_ac_plnt_loc_id
"
"                            FROM profit_cost_centers a
"
"                           WHERE     pcc_so_prj_id IS NOT NULL
"
"                                 AND func_find_apm_prj_req_flag (p_bu) = 'Y'
"
"                                 AND p_bfcry_type = 'S'
"
"                                 AND pcc_default_flag = 'Y'
"
"                          UNION ALL
"
"                          SELECT pcc_desc,
"
"                                 pcc_bu,
"
"                                 pcc_ac_plnt,
"
"                                 pcc_ac_lvl1,
"
"                                 pcc_ac_lvl2,
"
"                                 pcc_ac_lvl3,
"
"                                 pcc_ac_lvl4,
"
"                                 pcc_ac_lvl5,
"
"                                 pcc_ac_lvl6,
"
"                                 pcc_ac_lvl_prj,
"
"                                 prj_cust_id party_id,
"
"                                 func_find_party_name (pcc_bu,
"
"                                                       prj_cust_id,
"
"                                                       1)
"
"                                    party_desc,
"
"                                 pcc_cc_code,
"
"                                 func_find_dflt_plnt_loc (p_bu, pcc_ac_plnt)
"
"                                    pcc_ac_plnt_loc_id
"
"                            FROM profit_cost_centers a, projects
"
"                           WHERE     pcc_so_prj_id IS NOT NULL
"
"                                 AND func_find_arm_prj_req_flag (p_bu) = 'Y'
"
"                                 AND prj_bu = pcc_bu
"
"                                 AND pcc_so_prj_id = prj_proj_id
"
"                                 AND (prj_cust_id = p_lgr_bfcry_id
"
"                                      OR p_lgr_bfcry_id IS NULL)
"
"                                 AND p_bfcry_type = 'C'
"
"                                 AND pcc_default_flag = 'Y'
"
"                          UNION ALL
"
"                          SELECT pcc_desc,
"
"                                 pcc_bu,
"
"                                 pcc_ac_plnt,
"
"                                 pcc_ac_lvl1,
"
"                                 pcc_ac_lvl2,
"
"                                 pcc_ac_lvl3,
"
"                                 pcc_ac_lvl4,
"
"                                 pcc_ac_lvl5,
"
"                                 pcc_ac_lvl6,
"
"                                 pcc_ac_lvl_prj,
"
"                                 soh_cust_id party_id,
"
"                                 func_find_party_name (pcc_bu,
"
"                                                       soh_cust_id,
"
"                                                       1)
"
"                                    party_desc,
"
"                                 pcc_cc_code,
"
"                                 func_find_dflt_plnt_loc (p_bu, pcc_ac_plnt)
"
"                                    pcc_ac_plnt_loc_id
"
"                            FROM profit_cost_centers a, sales_order_hd
"
"                           WHERE     pcc_so_prj_id IS NOT NULL
"
"                                 AND func_find_arm_prj_req_flag (p_bu) = 'Y'
"
"                                 AND pcc_bu = soh_bu
"
"                                 AND pcc_so_pfx || pcc_so_prj_id =
"
"                                        soh_order_pfx || soh_order_no
"
"                                 AND (soh_cust_id = p_lgr_bfcry_id
"
"                                      OR p_lgr_bfcry_id IS NULL)
"
"                                 AND p_bfcry_type = 'C'
"
"                                 AND pcc_default_flag = 'Y')
"
"                   WHERE (pcc_bu = p_ref_bu
"
"                          OR (EXISTS
"
"                                 (SELECT 1
"
"                                    FROM corp_inter_co_trans
"
"                                   WHERE (    cict_fm_bu = p_bu
"
"                                          AND cict_to_bu = pcc_bu
"
"                                          AND cict_trans_dir = 'U')
"
"                                         OR ( (    cict_fm_bu = p_bu
"
"                                               AND cict_to_bu = pcc_bu
"
"                                               AND cict_trans_dir = 'B')
"
"                                             OR (    cict_to_bu = p_bu
"
"                                                 AND cict_fm_bu = pcc_bu
"
"                                                 AND cict_trans_dir = 'B')))))
"
"                         AND EXISTS
"
"                                (SELECT 1
"
"                                   FROM profit_cc_unit_access
"
"                                  WHERE ( (pcua_trgt_bu = pcc_bu
"
"                                           AND pcua_trgt_ac_plnt =
"
"                                                  pcc_ac_plnt
"
"                                           AND pcua_trgt_ac_lvl1 =
"
"                                                  pcc_ac_lvl1
"
"                                           AND pcua_trgt_ac_lvl2 =
"
"                                                  pcc_ac_lvl2
"
"                                           AND pcua_trgt_ac_lvl3 =
"
"                                                  pcc_ac_lvl3
"
"                                           AND pcua_trgt_ac_lvl4 =
"
"                                                  pcc_ac_lvl4
"
"                                           AND pcua_trgt_ac_lvl5 =
"
"                                                  pcc_ac_lvl5
"
"                                           AND pcua_trgt_ac_lvl6 =
"
"                                                  pcc_ac_lvl6
"
"                                           AND pcua_trgt_ac_lvl_prj =
"
"                                                  pcc_ac_lvl_prj)
"
"                                         OR (pcua_trgt_bu = pcc_bu
"
"                                             AND pcua_trgt_ac_plnt =
"
"                                                    pcc_ac_plnt
"
"                                             AND pcua_trgt_ac_lvl1 IS NULL)
"
"                                         OR (    pcua_trgt_bu = pcc_bu
"
"                                             AND pcua_trgt_ac_plnt IS NULL
"
"                                             AND pcua_trgt_ac_lvl1 IS NULL))
"
"                                        AND pcua_user_id = p_user
"
"                                        AND pcua_bu = p_bu)
"
"                         AND party_id = p_lgr_bfcry_id;
"
"
"
"               cr1   c1%ROWTYPE;
"
"                v_bs_lvl  VARCHAR2(5);
"
"            BEGIN
"
"
"
"                 SELECT glmctrl_bs_level
"
"                      INTO  v_bs_lvl
"
"                     FROM glm_control
"
"                   WHERE glmctrl_bu = p_bu;
"
"
"
"           IF v_bs_lvl = 'E' THEN
"
"               OPEN c1;
"
"
"
"               FETCH c1 INTO cr1;
"
"
"
"               IF c1%FOUND
"
"               THEN
"
"
"
"                  IF p_lgr_bfcry_id <> cr1.party_id
"
"                  THEN
"
"                     NULL;
"
"                  ELSE
"
"                     p_lvl1 := cr1.pcc_ac_lvl1;
"
"                     p_lvl2 := cr1.pcc_ac_lvl2;
"
"                     p_lvl3 := cr1.pcc_ac_lvl3;
"
"                     p_lvl4 := cr1.pcc_ac_lvl4;
"
"                     p_lvl5 := cr1.pcc_ac_lvl5;
"
"                     p_lvl6 := cr1.pcc_ac_lvl6;
"
"                     p_lvl_prj := cr1.pcc_ac_lvl_prj;
"
"                     p_acct_plant := cr1.pcc_ac_plnt;
"
"                     p_cost_desc := cr1.pcc_desc;
"
"                     p_cc_code := cr1.pcc_cc_code;
"
"                     p_plnt_loc_id := cr1.pcc_ac_plnt_loc_id;
"
"                  END IF;
"
"               ELSE
"
"                  NULL;
"
"               END IF;
"
"             END IF;
"
"            END;
"
"         END IF;
"
"      END IF;
"
"      IF p_bfcry_type IN('S','C') AND p_lgr_bfcry_id IS NOT NULL
"
"      THEN
"
"--          Raise_Application_Error(-20999,p_bfcry_type||'/'||p_lgr_bfcry_id);
"
"         BEGIN
"
"            SELECT ssl_state_code,
"
"                   ssl_gst_no,
"
"                   ssl_gst_type,
"
"                   ssl_type,
"
"                   p_lgr_desc,
"
"                   SUBSTR (ssl_gst_no, 3, 10),
"
"                   'W'
"
"              INTO p_state_code,
"
"                   p_gstin_no,
"
"                   p_gst_type,
"
"                   p_suplr_type,
"
"                   p_gst_sulr_name,
"
"                   p_gst_pan_no,
"
"                   p_gst_pan_avail
"
"              FROM suplr_ship_loc
"
"             WHERE     ssl_bu = p_bu
"
"                   AND ssl_suplr_id = p_lgr_bfcry_id
"
"                   AND ssl_dflt_flg IN ('B', 'S', 'D');
"
"         EXCEPTION
"
"            WHEN NO_DATA_FOUND
"
"            THEN
"
"               NULL;
"
"            WHEN TOO_MANY_ROWS
"
"            THEN
"
"               NULL;
"
"         END;
"
"      END IF;
"
"
"
"
"
"      ----------------------
"
"      IF p_btdln_acct IS NOT NULL
"
"      THEN
"
"         DECLARE
"
"            CURSOR C1
"
"            IS
"
"               SELECT COUNT (*) V_CNT
"
"                 FROM gl_lvl_accounts
"
"                WHERE glal_bu = p_bu AND glal_acct = p_btdln_acct;
"
"
"
"
"
"            CURSOR C2
"
"            IS
"
"               SELECT *
"
"                 FROM gl_lvl_accounts
"
"                WHERE glal_bu = p_bu AND glal_acct = p_btdln_acct;
"
"
"
"            CR1   C1%ROWTYPE;
"
"            CR2   C2%ROWTYPE;
"
"              v_bs_lvl  VARCHAR2(5);
"
"         BEGIN
"
"            SELECT glmctrl_bs_level
"
"                      INTO  v_bs_lvl
"
"                     FROM glm_control
"
"                   WHERE glmctrl_bu = p_bu;
"
"
"
"           IF v_bs_lvl = 'E' THEN
"
"            OPEN C1;
"
"
"
"            FETCH C1 INTO CR1;
"
"
"
"            IF C1%FOUND
"
"            THEN
"
"               IF CR1.V_CNT = 1
"
"                  AND (func_find_apm_prj_req_flag (p_bu) = 'N'
"
"                       OR func_find_arm_prj_req_flag (p_bu) = 'N')
"
"               THEN
"
"                  OPEN C2;
"
"
"
"                  FETCH C2 INTO CR2;
"
"
"
"                  IF C2%FOUND
"
"                  THEN
"
"                     p_lvl1 := cr2.glal_lvl1;
"
"                     p_lvl2 := cr2.glal_lvl2;
"
"                     p_lvl3 := cr2.glal_lvl3;
"
"                     p_lvl4 := cr2.glal_lvl4;
"
"                     p_lvl5 := cr2.glal_lvl5;
"
"                     p_lvl6 := cr2.glal_lvl6;
"
"                     p_cc_code := cr2.glal_cc_code;
"
"                     p_lvl_prj := cr2.glal_lvl_prj;
"
"                     p_acct_plant := cr2.glal_plant;
"
"                     p_cost_desc := cr2.glal_cc_desc;
"
"                     p_plnt_loc_id := cr2.glal_plnt_loc_id;
"
"                  END IF;
"
"
"
"                  CLOSE C2;
"
"               END IF;
"
"            END IF;
"
"
"
"            CLOSE C1;
"
"          END IF;
"
"         END;
"
"      END IF;
"
"   END proc_cash_assign_party;
"
"
"
"
"
"   PROCEDURE proc_cash_rcpt_acc_asgn (
"
"      p_bu                           VARCHAR2,
"
"      p_btdln_acct            IN OUT VARCHAR2,
"
"      p_btdln_acct_desc          OUT VARCHAR2,
"
"      p_lgr_bfcry_id             OUT VARCHAR2,
"
"      p_hsn_code                 OUT VARCHAR2,
"
"      p_bfcry_id                 OUT VARCHAR2,
"
"      p_ref_bu                   OUT VARCHAR2,
"
"      p_bfcry_type               OUT VARCHAR2,
"
"      p_lgr_bfcry_desc           OUT VARCHAR2,
"
"      p_acct_type                OUT VARCHAR2,
"
"      p_btdln_gstin_no           OUT VARCHAR2,
"
"      p_btdln_state_code         OUT VARCHAR2,
"
"      p_btdln_gst_type           OUT VARCHAR2,
"
"      p_btdln_suplr_type         OUT VARCHAR2,
"
"      p_btrans_trans_curcy           VARCHAR2,
"
"      p_trans_base_exrate            NUMBER,
"
"      p_btdln_ref_type           OUT VARCHAR2,
"
"      p_btdln_curr               OUT VARCHAR2,
"
"      p_btln_exrate              OUT NUMBER,
"
"      p_btdln_dist_amt           OUT NUMBER,
"
"      p_btdln_lvl1               OUT VARCHAR2,
"
"      p_btdln_lvl2               OUT VARCHAR2,
"
"      p_btdln_lvl3               OUT VARCHAR2,
"
"      p_btdln_lvl4               OUT VARCHAR2,
"
"      p_btdln_lvl5               OUT VARCHAR2,
"
"      p_btdln_lvl6               OUT VARCHAR2,
"
"      p_btdln_cc_code            OUT VARCHAR2,
"
"      p_btdln_lvl_prj            OUT VARCHAR2,
"
"      p_btdln_acct_plant         OUT VARCHAR2,
"
"      p_cost_cen_desc            OUT VARCHAR2,
"
"      p_cwp_asset_id             OUT VARCHAR2,
"
"      p_btdln_gst_sulr_name      OUT VARCHAR2,
"
"      p_btdln_gst_pan_no         OUT VARCHAR2,
"
"      p_btdln_gst_pan_avail      OUT VARCHAR2)
"
"   IS
"
"   BEGIN
"
"      DECLARE
"
"         CURSOR c1
"
"         IS
"
"            SELECT DISTINCT glal_desc1
"
"              FROM gl_lvl_accounts
"
"             WHERE glal_bu = p_bu AND glal_acct = p_btdln_acct;
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
"         FETCH c1 INTO CR1;
"
"
"
"         IF c1%FOUND
"
"         THEN
"
"            p_btdln_acct_desc := cr1.glal_desc1;
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
"
"
"      IF p_btdln_acct IS NOT NULL
"
"      THEN
"
"         DECLARE
"
"            CURSOR c1
"
"            IS
"
"               SELECT glac_acct,
"
"                      glac_acct_desc1,
"
"                      glac_hsn_sac_code,
"
"                      glac_tc_id
"
"                 FROM gl_accts
"
"                WHERE glac_bu = p_bu AND glac_acct = p_btdln_acct;
"
"
"
"            CURSOR C2
"
"            IS
"
"               SELECT ssl_gst_no,
"
"                      state_code,
"
"                      state_name1,
"
"                      ssl_gst_type,
"
"                      ssl_type
"
"                 FROM suplr_ship_loc, states
"
"                WHERE     ssl_bu = p_bu
"
"                      AND ssl_suplr_id = p_lgr_bfcry_id
"
"                      AND ssl_dflt_flg = 'Y'
"
"                      AND state_id = ssl_state;
"
"
"
"            CURSOR C4
"
"            IS
"
"               SELECT ssl_gst_no,
"
"                      state_code,
"
"                      state_name1,
"
"                      ssl_gst_type,
"
"                      ssl_type
"
"                 FROM suplr_ship_loc, states
"
"                WHERE     ssl_bu = p_bu
"
"                      AND ssl_suplr_id = p_lgr_bfcry_id
"
"                      AND ssl_dflt_flg = 'Y'
"
"                      AND state_id = ssl_state;
"
"
"
"            cr1             c1%ROWTYPE;
"
"            cr2             c2%ROWTYPE;
"
"            cr4             c4%ROWTYPE;
"
"            v_ledger_type   VARCHAR2 (50);
"
"         BEGIN
"
"           --PROC_DEBUG_PROC(p_bfcry_type||'-'||'DHANA');
"
"
"
"            OPEN c1;
"
"
"
"            FETCH c1 INTO cr1;
"
"
"
"            IF p_btdln_acct IS NOT NULL
"
"            THEN
"
"               IF c1%FOUND
"
"               THEN
"
"                  p_hsn_code := cr1.glac_hsn_sac_code;
"
"                  p_bfcry_id := cr1.glac_tc_id;
"
"                  p_ref_bu := p_bu;
"
"
"
"                  proc_find_party_id_rev (p_bu,
"
"                                          p_btdln_acct,
"
"                                          p_bfcry_type,
"
"                                          p_lgr_bfcry_id,
"
"                                          p_lgr_bfcry_desc,
"
"                                          p_acct_type);
"
"
"
"
"
"                  IF p_bfcry_type = 'S'
"
"                  THEN
"
"                     OPEN c2;
"
"
"
"                     FETCH c2 INTO cr2;
"
"
"
"                     IF C2%FOUND
"
"                     THEN
"
"                        p_btdln_gstin_no := cr2.ssl_gst_no;
"
"                        p_btdln_state_code := cr2.state_code;
"
"                        p_btdln_gst_type := cr2.ssl_gst_type;
"
"                        p_btdln_suplr_type := cr2.ssl_type;
"
"                     END IF;
"
"
"
"                     CLOSE c2;
"
"                  ELSIF p_bfcry_type = 'C'
"
"                  THEN
"
"                     OPEN c4;
"
"
"
"                     FETCH c4 INTO cr4;
"
"
"
"                     IF c4%FOUND
"
"                     THEN
"
"                       PROC_DEBUG_PROC(cr4.state_code||'-'||'DHANA');
"
"                        p_btdln_gstin_no := cr4.ssl_gst_no;
"
"                        p_btdln_state_code := cr4.state_code;
"
"                        p_btdln_gst_type := cr4.ssl_gst_type;
"
"                        p_btdln_suplr_type := cr4.ssl_type;
"
"                     END IF;
"
"
"
"                     CLOSE c4;
"
"                  END IF;
"
"               ELSE
"
"                  raise_application_error (-20999, 'Account not found.');
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
"      END IF;
"
"
"
"      IF p_btdln_acct IS NOT NULL
"
"      THEN
"
"         DECLARE
"
"            CURSOR c1
"
"            IS
"
"               SELECT COUNT (*) v_cnt
"
"                 FROM gl_accts
"
"                WHERE     glac_bu = p_bu
"
"                      AND glac_acct = p_btdln_acct
"
"                      AND glac_cust_id IS NULL
"
"                      AND glac_suplr_id IS NULL
"
"                      AND glac_sub_grp_type NOT IN
"
"                             ('SAP',
"
"                              'SAD',
"
"                              'SSD',
"
"                              'SAC',
"
"                              'CAR',
"
"                              'CAD',
"
"                              'CSD',
"
"                              'CEMD',
"
"                              'CRET',
"
"                              'CPBG',
"
"                              'PCK',
"
"                              'BDS',
"
"                              'TDS',
"
"                              'ESI',
"
"                              'SVT',
"
"                              'TCS',
"
"                              'CASH',
"
"                              'IMP',
"
"                              'EC')
"
"                      AND glac_acct_type_code IS NULL
"
"               UNION ALL
"
"               SELECT COUNT (*) v_cnt
"
"                 FROM gl_accts, acct_type_codes
"
"                WHERE     glac_bu = p_bu
"
"                      AND GLAC_ACCT = p_btdln_acct
"
"                      AND GLAC_CUST_ID IS NULL
"
"                      AND GLAC_SUPLR_ID IS NULL
"
"                      AND atc_acct_type NOT IN
"
"                             ('SAP',
"
"                              'SAD',
"
"                              'SSD',
"
"                              'SAC',
"
"                              'CAR',
"
"                              'CAD',
"
"                              'CSD',
"
"                              'CEMD',
"
"                              'CRET',
"
"                              'CPBG',
"
"                              'PCK',
"
"                              'BDS',
"
"                              'TDS',
"
"                              'ESI',
"
"                              'SVT',
"
"                              'TCS',
"
"                              'CASH',
"
"                              'IMP',
"
"                              'EC')
"
"                      AND glac_bu = atc_bu
"
"                      AND glac_acct_type_code = atc_code
"
"                      AND glac_acct_type_code IS NOT NULL;
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
"            IF cr1.v_cnt > 0
"
"            THEN
"
"               p_btdln_ref_type := 'N';
"
"               p_btdln_curr := p_btrans_trans_curcy;
"
"               p_btln_exrate := p_trans_base_exrate;
"
"            ELSE
"
"               p_btdln_dist_amt := 0;
"
"               p_btdln_ref_type := 'R';
"
"               p_btdln_curr := p_btrans_trans_curcy;
"
"               p_btln_exrate := p_trans_base_exrate;
"
"            END IF;
"
"         END;
"
"      END IF;
"
"
"
"      -----------for assigning null values if ledger changed-------------
"
"
"
"
"
"
"
"      IF p_btdln_acct IS NOT NULL
"
"      THEN
"
"         DECLARE
"
"            CURSOR C1
"
"            IS
"
"               SELECT COUNT (*) v_cnt
"
"                 FROM gl_lvl_accounts
"
"                WHERE glal_bu = p_bu AND glal_acct = p_btdln_acct;
"
"
"
"            CURSOR C2
"
"            IS
"
"               SELECT *
"
"                 FROM gl_lvl_accounts
"
"                WHERE glal_bu = p_bu AND glal_acct = p_btdln_acct;
"
"
"
"            CR1   C1%ROWTYPE;
"
"            CR2   C2%ROWTYPE;
"
"              v_bs_lvl  VARCHAR2(5);
"
"         BEGIN
"
"           SELECT glmctrl_bs_level
"
"                      INTO  v_bs_lvl
"
"                     FROM glm_control
"
"                   WHERE glmctrl_bu = p_bu;
"
"
"
"           IF v_bs_lvl = 'E' THEN
"
"            OPEN C1;
"
"
"
"            FETCH C1 INTO CR1;
"
"
"
"            IF C1%FOUND
"
"            THEN
"
"               IF CR1.V_CNT = 1
"
"                  AND (func_find_apm_prj_req_flag (p_bu) = 'N'
"
"                       OR func_find_arm_prj_req_flag (p_bu) = 'N')
"
"               THEN
"
"                  OPEN C2;
"
"
"
"                  FETCH C2 INTO CR2;
"
"
"
"                  IF C2%FOUND
"
"                  THEN
"
"                     p_ref_bu := p_bu;
"
"                     p_btdln_lvl1 := cr2.glal_lvl1;
"
"                     p_btdln_lvl2 := cr2.glal_lvl2;
"
"                     p_btdln_lvl3 := cr2.glal_lvl3;
"
"                     p_btdln_lvl4 := cr2.glal_lvl4;
"
"                     p_btdln_lvl5 := cr2.glal_lvl5;
"
"                     p_btdln_lvl6 := cr2.glal_lvl6;
"
"                     p_btdln_cc_code := cr2.glal_cc_code;
"
"                     p_btdln_lvl_prj := cr2.glal_lvl_prj;
"
"                     p_btdln_acct_plant := cr2.glal_plant;
"
"                     p_cost_cen_desc := cr2.glal_cc_desc;
"
"                  END IF;
"
"
"
"                  CLOSE C2;
"
"               END IF;
"
"            END IF;
"
"
"
"            CLOSE C1;
"
"          END IF;
"
"         END;
"
"      END IF;
"
"
"
"      IF p_cost_cen_desc IS NOT NULL
"
"      THEN
"
"         DECLARE
"
"            CURSOR C0
"
"            IS
"
"               SELECT COUNT (*) v_count
"
"                 FROM fam_control
"
"                WHERE famctrl_bu = p_bu;
"
"
"
"            CURSOR c1
"
"            IS
"
"               SELECT *
"
"                 FROM gl_accts
"
"                WHERE     glac_bu = p_bu
"
"                      AND glac_acct = p_btdln_acct
"
"                      AND glac_sub_grp_type IN ('CWP')
"
"                      AND glac_acct_status = 'A';
"
"
"
"            CURSOR c2
"
"            IS
"
"               SELECT COUNT (*) v_cnt
"
"                 FROM (SELECT fa_asset_desc1, fa_asset_id
"
"                         FROM fixed_asset_level_acct,
"
"                              fixed_assets,
"
"                              fam_control
"
"                        WHERE     fala_bu = fa_bu
"
"                              AND fala_asset_id = fa_asset_id
"
"                              AND fa_bu = p_bu
"
"                              AND fa_asset_status = 'Y'
"
"                              AND fa_tang_type = 'TW'
"
"                              AND fala_acct = p_btdln_acct
"
"                              --AND famctrl_ast_act_src = 'AS'
"
"                       UNION ALL
"
"                       SELECT fa_asset_desc1, fa_asset_id
"
"                         FROM fixed_assets, fixed_asset_accounts, fam_control
"
"                        WHERE     faa_bu = fa_bu
"
"                              AND faa_group_id = fa_group_id
"
"                              AND faa_sub_group_id = fa_sub_group_id
"
"                              AND fa_bu = p_bu
"
"                              AND fa_asset_status = 'Y'
"
"                              AND fa_tang_type = 'TW'
"
"                              AND faa_acct = p_btdln_acct
"
"                              AND famctrl_bu = p_bu
"
"                              /*AND famctrl_ast_act_src = 'DS'*/);
"
"
"
"
"
"            CURSOR c3
"
"            IS
"
"               SELECT fa_asset_desc1, fa_asset_id
"
"                 FROM fixed_asset_level_acct, fixed_assets, fam_control
"
"                WHERE     fala_bu = fa_bu
"
"                      AND fala_asset_id = fa_asset_id
"
"                      AND fa_bu = p_bu
"
"                      AND fa_asset_status = 'Y'
"
"                      AND fa_tang_type = 'TW'
"
"                      AND fala_acct = p_btdln_acct
"
"                      AND famctrl_bu = p_bu
"
"                      --AND famctrl_ast_act_src = 'AS'
"
"               UNION ALL
"
"               SELECT fa_asset_desc1, fa_asset_id
"
"                 FROM fixed_assets, fixed_asset_accounts, fam_control
"
"                WHERE     faa_bu = fa_bu
"
"                      AND faa_group_id = fa_group_id
"
"                      AND faa_sub_group_id = fa_sub_group_id
"
"                      AND fa_bu = p_bu
"
"                      AND fa_asset_status = 'Y'
"
"                      AND fa_tang_type = 'TW'
"
"                      AND faa_acct = p_btdln_acct
"
"                      AND famctrl_bu = p_bu
"
"                      /*AND famctrl_ast_act_src = 'DS'*/;
"
"
"
"            CURSOR C4
"
"            IS
"
"               SELECT *
"
"                 FROM fam_control
"
"                WHERE famctrl_bu = p_bu;
"
"
"
"            cr0   c0%ROWTYPE;
"
"            cr1   c1%ROWTYPE;
"
"            cr2   c2%ROWTYPE;
"
"            cr3   c3%ROWTYPE;
"
"            cr4   c4%ROWTYPE;
"
"         BEGIN
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
"               IF cr0.v_count > 0
"
"               THEN
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
"                     OPEN c4;
"
"
"
"                     FETCH c4 INTO cr4;
"
"
"
"                     IF c4%NOTFOUND
"
"                     THEN
"
"                        NULL;
"
"                     ELSE
"
"                        OPEN c2;
"
"
"
"                        FETCH c2 INTO cr2;
"
"
"
"                        IF cr2.v_cnt = 0
"
"                        THEN
"
"                           --IF func_find_fa_acct_src (p_bu, 'A') = 'AS'
"
"                          -- THEN
"
"                              raise_application_error (
"
"                                 -20999,
"
"                                 'Ledger is not linked to the asset');
"
"                          -- ELSE
"
"                              raise_application_error (
"
"                                 -20999,
"
"                                 'Ledger is not linked in the Appl.Acct.(FA)');
"
"                           --END IF;
"
"                        ELSIF cr2.v_cnt = 1
"
"                        THEN
"
"                           OPEN c3;
"
"
"
"                           FETCH c3 INTO cr3;
"
"
"
"                           IF c3%FOUND
"
"                           THEN
"
"                              p_cwp_asset_id := cr3.fa_asset_id;
"
"                           END IF;
"
"
"
"                           CLOSE c3;
"
"                        END IF;
"
"
"
"                        CLOSE c2;
"
"                     END IF;
"
"
"
"                     CLOSE c4;
"
"                  END IF;
"
"
"
"                  CLOSE c1;
"
"               END IF;
"
"            END IF;
"
"
"
"            CLOSE C0;
"
"         END;
"
"      END IF;
"
"
"
"      IF p_btdln_acct IS NOT NULL
"
"      THEN
"
"         DECLARE
"
"            CURSOR c1
"
"            IS
"
"               SELECT *
"
"                 FROM gl_accts
"
"                WHERE     glac_bu = p_bu
"
"                      AND glac_acct_status = 'A'
"
"                      AND glac_acct = p_btdln_acct
"
"                      AND glac_sub_grp_type IN ('DNT', 'OTHR')
"
"                      AND glac_tc_id IS NOT NULL;
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
"            IF C1%FOUND
"
"            THEN
"
"               p_bfcry_id := cr1.glac_tc_id;
"
"            ELSE
"
"               NULL;
"
"            END IF;
"
"
"
"            CLOSE C1;
"
"         END;
"
"      END IF;
"
"
"
"      DECLARE
"
"         CURSOR C1
"
"         IS
"
"            SELECT glmctrl_cv_usage_flag
"
"              FROM glm_control
"
"             WHERE glmctrl_bu = p_bu AND glmctrl_cv_usage_flag = 'Y';
"
"
"
"         CURSOR C2
"
"         IS
"
"            SELECT *
"
"              FROM gl_accts
"
"             WHERE     glac_bu = p_bu
"
"                   AND glac_acct_status = 'A'
"
"                   AND glac_acct = p_btdln_acct
"
"                   AND glac_sub_grp_type IN ('CASH', 'IMP');
"
"
"
"         cr1   c1%ROWTYPE;
"
"         cr2   c2%ROWTYPE;
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
"            OPEN c2;
"
"
"
"            FETCH c2 INTO cr2;
"
"
"
"            IF c2%FOUND
"
"            THEN
"
"               raise_application_error (
"
"                  -20999,
"
"                  'Cashier/Imprestor account not allowed.');
"
"            END IF;
"
"
"
"            CLOSE c2;
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
"      IF p_bfcry_type IN( 'S','C') AND p_lgr_bfcry_id IS NOT NULL
"
"      THEN
"
"         BEGIN
"
"            SELECT ssl_state_code,
"
"                   ssl_gst_no,
"
"                   ssl_gst_type,
"
"                   ssl_type,
"
"                   p_lgr_bfcry_desc,
"
"                   SUBSTR (ssl_gst_no, 3, 10),
"
"                   'W'
"
"              INTO p_btdln_state_code,
"
"                   p_btdln_gstin_no,
"
"                   p_btdln_gst_type,
"
"                   p_btdln_suplr_type,
"
"                   p_btdln_gst_sulr_name,
"
"                   p_btdln_gst_pan_no,
"
"                   p_btdln_gst_pan_avail
"
"              FROM suplr_ship_loc
"
"             WHERE     ssl_bu = p_bu
"
"                   AND ssl_suplr_id = p_lgr_bfcry_id
"
"                   AND ssl_dflt_flg IN ('B', 'S', 'D');
"
"         EXCEPTION
"
"            WHEN NO_DATA_FOUND
"
"            THEN
"
"               NULL;
"
"            WHEN TOO_MANY_ROWS
"
"            THEN
"
"               NULL;
"
"         END;
"
"      END IF;
"
"   END proc_cash_rcpt_acc_asgn;
"
"
"
"   PROCEDURE proc_ins_ref_dtls (p_bu                           VARCHAR2,
"
"                                p_ord_pfx                      VARCHAR2,
"
"                                p_ord_no                       VARCHAR2,
"
"                                p_seq_no                       VARCHAR2,
"
"                                p_fmt_mask                     VARCHAR2,
"
"                                p_btr_agnt_ref                 VARCHAR2,
"
"                                p_btr_trans_amt                VARCHAR2,
"
"                                p_btr_doc_pfx                  VARCHAR2,
"
"                                p_btr_doc_no                   VARCHAR2,
"
"                                p_btr_adv_doc_no               VARCHAR2,
"
"                                p_btr_due_no                   VARCHAR2,
"
"                                p_btr_doc_tds_amt              VARCHAR2,
"
"                                p_btr_dr_cr_type               VARCHAR2,
"
"                                p_btr_doc_amt           IN OUT VARCHAR2,
"
"                                p_btr_currency             OUT VARCHAR2,
"
"                                p_btr_exchange_rate        OUT VARCHAR2,
"
"                                p_btr_org_bfcry_type       OUT VARCHAR2,
"
"                                p_btr_org_bcfry_id         OUT VARCHAR2,
"
"                                p_btr_lgr_type             OUT VARCHAR2,
"
"                                p_btr_plnt_loc_id          OUT VARCHAR2,
"
"                                p_btr_proj_id              OUT VARCHAR2,
"
"                                p_btr_off_bal_amt          OUT VARCHAR2,
"
"                                p_btr_doc_amt_bfr_tds      OUT VARCHAR2,
"
"                                p_pay_amt_bc               OUT VARCHAR2,
"
"                                p_btr_tds_assbl_val        OUT VARCHAR2,
"
"                                p_trans_amt_dummy       IN OUT VARCHAR2,
"
"                                p_btr_sub_seq_no            IN     NUMBER DEFAULT NULL,
"
"                                p_btr_off_bal_amt1      IN     NUMBER   DEFAULT 0,
"
"                                p_btr_doc_amt1          IN     NUMBER   DEFAULT 0)
"
"   IS
"
"      CURSOR c_hd
"
"      IS
"
"         SELECT *
"
"           FROM bank_trans
"
"          WHERE     btrans_bu = p_bu
"
"                AND btrans_ord_pfx = p_ord_pfx
"
"                AND btrans_ord_no = p_ord_no;
"
"
"
"      CURSOR c_ln
"
"      IS
"
"         SELECT *
"
"           FROM bank_trans_dist_ln
"
"          WHERE     btdln_bu = p_bu
"
"                AND btdln_ord_no = p_ord_no
"
"                AND btdln_seq_no = p_seq_no;
"
"      CURSOR c_ref
"
"      IS
"
"         SELECT btr_trans_amt
"
"           FROM bank_trans_ref_det
"
"          WHERE     btr_bu = p_bu
"
"                AND btr_ord_no = p_ord_no
"
"                AND btr_seq_no = p_seq_no
"
"                AND btr_sub_seq_no = p_btr_sub_seq_no;
"
"
"
"      cr_hd   c_hd%ROWTYPE;
"
"      cr_ln   c_ln%ROWTYPE;
"
"      cr_ref  c_ref%ROWTYPE;
"
"      v_lgr_type VARCHAR2(10);
"
"      v_apm_prj_req            VARCHAR2 (5) := func_find_apm_prj_req_flag (p_bu);
"
"      v_arm_prj_req             VARCHAR2 (5) := func_find_arm_prj_req_flag (p_bu);
"
"   BEGIN
"
"   --RAISE_APPLICATION_ERROR(-20999,'HRM'||'-'||p_btr_agnt_ref);
"
"      OPEN c_hd;
"
"
"
"      FETCH c_hd INTO cr_hd;
"
"
"
"      OPEN c_ln;
"
"
"
"      FETCH c_ln INTO cr_ln;
"
"
"
"      IF TO_NUMBER (p_btr_trans_amt, p_fmt_mask) <> 0
"
"      THEN
"
"
"
"         IF p_btr_agnt_ref IN ('A', 'D')
"
"         THEN
"
"            --RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"            p_btr_currency := cr_hd.btrans_trans_curcy;
"
"            IF cr_hd.btrans_trans_curcy <> func_find_base_currency (p_bu)
"
"            THEN
"
"               IF cr_ln.btdln_bfcry_type IN ('S')
"
"               THEN
"
"                  IF func_find_party_type (p_bu, cr_ln.btdln_lgr_bfcry_id, 1) IN
"
"                        ('P', 'I', 'Q')
"
"                  THEN
"
"                     p_btr_exchange_rate :=
"
"                        func_find_cash_ex_rate (
"
"                           p_bu,
"
"                           cr_ln.btdln_lgr_bfcry_id,
"
"                           cr_hd.btrans_trans_curcy,
"
"                           func_find_base_currency (p_bu),
"
"                           cr_hd.btrans_trans_date);
"
"                  ELSE
"
"                     p_btr_exchange_rate := cr_hd.btrans_trans_base_exrate;
"
"                  END IF;
"
"               ELSE
"
"                  p_btr_exchange_rate :=cr_hd.btrans_trans_base_exrate; --cr_hd.btrans_bank_base_exrate;
"
"               END IF;
"
"            ELSE
"
"               p_btr_exchange_rate := cr_hd.btrans_trans_base_exrate; --cr_hd.btrans_bank_base_exrate;
"
"            END IF;
"
"         ELSE
"
"
"
"            p_btr_exchange_rate :=cr_hd.btrans_trans_base_exrate; --cr_hd.btrans_bank_base_exrate;
"
"            IF  cr_ln.btdln_lgr_bfcry_id IS NOT NULL AND cr_ln.btdln_bfcry_type IN ('S','C') THEN
"
"            BEGIN
"
"            SELECT suplr_currency
"
"              INTO p_btr_currency
"
"              FROM suppliers
"
"            WHERE suplr_bu = p_bu
"
"                 AND suplr_suplr_id =  cr_ln.btdln_lgr_bfcry_id;
"
"            EXCEPTION WHEN no_data_found THEN
"
"               p_btr_currency := cr_hd.btrans_trans_curcy;
"
"            END;
"
"            END IF;
"
"
"
"
"
"         END IF;
"
"
"
"         DECLARE
"
"            CURSOR c2
"
"            IS
"
"               SELECT DECODE (glal_suplr_id,
"
"                              NULL, glal_cust_id,
"
"                              glal_suplr_id)
"
"                         part_id,
"
"                      DECODE (glal_suplr_id, NULL, 'C', 'S') part_type
"
"                 FROM suplr_cust_ledger_vw
"
"                WHERE     glal_bu = p_bu
"
"                      AND glal_plant = cr_ln.btdln_acct_plant
"
"                      AND glal_lvl1 = cr_ln.btdln_lvl1
"
"                      AND glal_lvl2 = cr_ln.btdln_lvl2
"
"                      AND glal_lvl3 = cr_ln.btdln_lvl3
"
"                      AND glal_lvl4 = cr_ln.btdln_lvl4
"
"                      AND glal_acct = cr_ln.btdln_acct
"
"                      AND (glal_suplr_id IS NULL OR glal_cust_id IS NULL);
"
"
"
"            cr2   c2%ROWTYPE;
"
"         BEGIN
"
"            IF p_btr_agnt_ref IN ('I', 'O', 'W', 'F', 'M', 'G')
"
"            THEN
"
"               IF TO_NUMBER (p_btr_trans_amt, p_fmt_mask) >
"
"                     func_find_doc_type_bal_amt (
"
"                        p_bu,
"
"                        p_btr_agnt_ref,
"
"                        p_btr_doc_pfx,
"
"                        p_btr_doc_no,
"
"                        p_btr_adv_doc_no,
"
"                        p_btr_due_no,
"
"                        NVL (p_btr_org_bfcry_type, cr_ln.btdln_bfcry_type))
"
"                     + TO_NUMBER (p_btr_trans_amt, p_fmt_mask)
"
"               THEN
"
"                  raise_application_error (
"
"                     -20999,
"
"                     'Amount to be Paid should not exceed Payable amount');
"
"               END IF;
"
"            ELSIF p_btr_agnt_ref IN ('K', 'B')
"
"            THEN
"
"               IF TO_NUMBER (p_btr_trans_amt, p_fmt_mask) >
"
"                     func_find_pc_bd_bal_amt (
"
"                        p_bu,
"
"                        p_btr_agnt_ref,
"
"                        p_btr_doc_pfx,
"
"                        p_btr_doc_no,
"
"                        p_btr_due_no,
"
"                        NVL (p_btr_org_bfcry_type, cr_ln.btdln_bfcry_type),
"
"                        p_btr_dr_cr_type)
"
"                     + TO_NUMBER (p_btr_trans_amt, p_fmt_mask)
"
"               THEN
"
"                  raise_application_error (
"
"                     -20999,
"
"                     'Amount to be Paid should not exceed Payable amount');
"
"               END IF;
"
"            END IF;
"
"
"
"            IF p_btr_agnt_ref IN ('P', 'O', 'D', 'A', 'I', 'Q')
"
"            THEN
"
"            --raise_application_error(-20999, cr_ln.btdln_acct_type);
"
"               p_btr_org_bfcry_type := cr_ln.btdln_bfcry_type;
"
"               p_btr_org_bcfry_id := cr_ln.btdln_lgr_bfcry_id;
"
"               p_btr_lgr_type := cr_ln.btdln_acct_type;
"
"               p_btr_plnt_loc_id := cr_ln.btdln_plnt_loc_id;
"
"               IF p_btr_org_bfcry_type = 'S' AND v_apm_prj_req ='C' THEN
"
"              -- raise_application_error(-20999, cr_ln.btdln_acct_type);
"
"                   p_btr_proj_id := cr_ln.btdln_cc_code;
"
"               ELSIF p_btr_org_bfcry_type = 'C' AND v_arm_prj_req ='C' THEN
"
"                  p_btr_proj_id := cr_ln.btdln_cc_code;
"
"                   --raise_application_error(-20999, '1'||'~'||p_btr_proj_id);
"
"               ELSE
"
"                  p_btr_proj_id := cr_ln.btdln_lvl_prj;
"
"               END IF;
"
"            END IF;
"
"
"
"
"
"
"
"
"
"
"
"            IF p_btr_agnt_ref <> 'A'
"
"            THEN
"
"           -- RAISE_APPLICATION_ERROR(-20999,p_ord_no||'-'||p_seq_no||'-'||p_btr_sub_seq_no);
"
"                 SELECT btr_lgr_type
"
"                     INTO v_lgr_type
"
"                     FROM bank_trans_ref_det
"
"                   WHERE btr_bu = p_bu
"
"                        AND btr_ord_no = p_ord_no
"
"                        AND btr_agnt_ref <> 'A'
"
"                        AND btr_seq_no = p_seq_no
"
"                        AND btr_sub_seq_no = p_btr_sub_seq_no;
"
"
"
"               p_btr_org_bfcry_type := cr_ln.btdln_bfcry_type;
"
"               p_btr_org_bcfry_id := cr_ln.btdln_lgr_bfcry_id;
"
"               p_btr_lgr_type := v_lgr_type;
"
"               p_btr_plnt_loc_id := cr_ln.btdln_plnt_loc_id;
"
"
"
"             --  RAISE_APPLICATION_ERROR(-20999,p_btr_org_bfcry_type||'~'||p_btr_org_bcfry_id);
"
"
"
"               IF p_btr_org_bfcry_type = 'S' AND v_apm_prj_req ='C' THEN
"
"                   p_btr_proj_id := cr_ln.btdln_cc_code;
"
"               ELSIF p_btr_org_bfcry_type = 'C' AND v_arm_prj_req ='C' THEN
"
"                  p_btr_proj_id := cr_ln.btdln_cc_code;
"
"               ELSE
"
"                  p_btr_proj_id := cr_ln.btdln_lvl_prj;
"
"               END IF;
"
"            END IF;
"
"
"
"            IF p_btr_agnt_ref IN ('R')
"
"            THEN
"
"               p_btr_lgr_type := cr_ln.btdln_bfcry_type || 'AD';
"
"               p_btr_org_bfcry_type := cr_ln.btdln_bfcry_type;
"
"               p_btr_org_bcfry_id := cr_ln.btdln_lgr_bfcry_id;
"
"            END IF;
"
"
"
"            p_btr_off_bal_amt := TO_NUMBER (p_btr_trans_amt, p_fmt_mask);
"
"         END;
"
"
"
"         IF p_btr_org_bcfry_id IS NOT NULL
"
"         THEN
"
"            IF p_btr_agnt_ref IN ('I', 'O', 'W', 'F', 'M', 'K', 'B', 'Q')
"
"            THEN
"
"--               p_btr_doc_amt :=
"
"--                  (NVL (TO_NUMBER (p_btr_doc_amt, p_fmt_mask), 0)
"
"--                   - ((TO_NUMBER (p_btr_trans_amt, p_fmt_mask)) - (TO_NUMBER (p_trans_amt_dummy, p_fmt_mask)) --NVL(cr_ref.btr_trans_amt,0)--
"
"--                   ));
"
"           --p_btr_doc_amt := func_find_doc_type_bill_amt(p_bu,p_btr_agnt_ref,p_btr_doc_pfx,p_btr_doc_no,p_btr_adv_doc_no,p_btr_due_no,p_btr_org_bfcry_type)- TO_NUMBER (p_btr_trans_amt, p_fmt_mask);
"
"           p_btr_doc_amt := p_btr_doc_amt1 -( TO_NUMBER (p_btr_trans_amt, p_fmt_mask) - p_btr_off_bal_amt1);
"
"           proc_debug_proc(p_btr_doc_amt1||'-'||TO_NUMBER (p_btr_trans_amt, p_fmt_mask)||'-'||p_btr_off_bal_amt1 ||'~'|| ' Amt');
"
"           IF p_btr_doc_amt < 0 THEN
"
"              p_btr_doc_amt :=0;
"
"            END IF;
"
"            END IF;
"
"         END IF;
"
"      END IF;
"
"
"
"      IF TO_NUMBER (p_btr_doc_tds_amt, p_fmt_mask) > 0
"
"      THEN
"
"         p_btr_doc_amt_bfr_tds :=(TO_NUMBER (p_btr_trans_amt, p_fmt_mask) - TO_NUMBER (p_btr_doc_tds_amt, p_fmt_mask));
"
"      END IF;
"
"      p_pay_amt_bc := p_btr_exchange_rate * TO_NUMBER (p_btr_trans_amt, p_fmt_mask);
"
"      IF cr_hd.btrans_type <> 'CT' THEN
"
"          p_btr_tds_assbl_val := TO_NUMBER (p_btr_trans_amt, p_fmt_mask);
"
"      END IF;
"
"
"
"      IF p_btr_agnt_ref IN ('K','W','I') AND p_btr_sub_seq_no IS NOT NULL
"
"            THEN
"
"            SELECT btr_org_bfcry_type,
"
"                   btr_org_bcfry_id,
"
"                   btr_lgr_type,
"
"                   btr_plnt_loc_id,
"
"                   btr_proj_id,
"
"                   btr_currency,
"
"                   btr_exchange_rate
"
"              INTO p_btr_org_bfcry_type,
"
"                   p_btr_org_bcfry_id,
"
"                   p_btr_lgr_type,
"
"                   p_btr_plnt_loc_id,
"
"                   p_btr_proj_id,
"
"                   p_btr_currency,
"
"                   p_btr_exchange_rate
"
"              FROM bank_trans_ref_det
"
"              WHERE btr_bu = p_bu
"
"                AND btr_ord_no = p_ord_no
"
"                AND btr_seq_no = p_seq_no
"
"                AND btr_sub_seq_no = p_btr_sub_seq_no;
"
"              -- raise_application_error(-20999,p_btr_org_bcfry_id);
"
"            END IF;
"
"   END proc_ins_ref_dtls;
"
"
"
"
"
"/* Added by Dinesh */
"
"
"
"    PROCEDURE proc_upd_gst_dtls(p_bu                         VARCHAR2,
"
"                                p_ord_pfx                    VARCHAR2,
"
"                                p_ord_no                     VARCHAR2,
"
"                                p_seq_no                     VARCHAR2,
"
"                                p_btdln_state_code           VARCHAR2,
"
"                                p_btdln_gst_suplr            VARCHAR2,
"
"                                p_btdln_gstin_no               VARCHAR2,
"
"                                p_btdln_gst_pan_avail          VARCHAR2,
"
"                                p_btdln_gst_pan_no             VARCHAR2,
"
"                                p_btdln_suplr_bill_no          VARCHAR2,
"
"                                p_btdln_suplr_bill_date        DATE,
"
"                                p_btdln_gst_type               VARCHAR2,
"
"                                p_btdln_suplr_type             VARCHAR2,
"
"                                p_btdln_supply_type            VARCHAR2,
"
"                                p_btdln_input_type             VARCHAR2,
"
"                                p_btdln_gst_rev_tax_cat        VARCHAR2,
"
"                                p_btdln_gst_rev_tax_flag       VARCHAR2,
"
"                                p_btdln_port_code              VARCHAR2,
"
"                                p_btdln_boe_date               DATE,
"
"                                p_btdln_boe_no                 VARCHAR2,
"
"                                p_btdln_lc_po_pfx              VARCHAR2,
"
"                                p_btdln_lc_po_no               VARCHAR2,
"
"                                p_btdln_gst_supply             VARCHAR2,
"
"                                p_btdln_hsn_code               VARCHAR2 DEFAULT NULL,
"
"                                p_btdln_commodity_code  VARCHAR2 DEFAULT NULL
"
"                            )
"
"       IS
"
"    CURSOR C1(c_hsn_code VARCHAR2)
"
"        IS
"
"    SELECT ghc_hsn_code
"
"      FROM gst_hsn_codes
"
"     WHERE ghc_hsn_code = c_hsn_code
"
"       AND exists (SELECT 1
"
"                     FROM hsn_sac_tax_rates
"
"                    where hstr_bu = p_bu
"
"                      AND hstr_hsnsac_code = ghc_hsn_code
"
"                      AND hstr_status= 'A') ;
"
"    CURSOR c2(c_hsn_code VARCHAR2)
"
"      IS
"
"    SELECT *
"
"      FROM hsn_sac_tax_rates
"
"     WHERE HSTR_BU = p_bu
"
"       AND hstr_hsnsac_code = c_hsn_code
"
"       AND hstr_status      ='A'
"
"       AND sysdate BETWEEN hstr_date_from AND hstr_date_to;
"
"
"
"    CURSOR c3
"
"      IS
"
"    SELECT btdln_tax_assess_val,btdln_hsn_code,btdln_exmpt_flag
"
"      FROM bank_trans_dist_ln
"
"     WHERE btdln_bu = p_bu
"
"       AND btdln_ord_no = p_ord_no
"
"       AND btdln_seq_no = p_seq_no;
"
"
"
"   CR1   C1%ROWTYPE;
"
"   CR2   C2%ROWTYPE;
"
"   CR3   C3%ROWTYPE;
"
"   v_tax_ptc   NUMBER;
"
"   v_cgst_amt  NUMBER;
"
"   v_sgst_amt  NUMBER;
"
"   v_igst_amt  NUMBER;
"
"   v_utgst_amt NUMBER;
"
"   v_cess_pct  NUMBER;
"
"   v_cess_amt  NUMBER;
"
"   v_gst_pan_no  VARCHAR2(10);
"
"   v_gst_pan_avail  VARCHAR2(1);
"
"   v_hsn_code        VARCHAR2(25);
"
"   v_rnd        NUMBER := func_find_appl_rnddigit (p_bu);
"
"   BEGIN
"
"        OPEN c3;
"
"        FETCH c3 INTO cr3;
"
"        CLOSE c3;
"
"       IF cr3.btdln_hsn_code is not null AND cr3.btdln_exmpt_flag ='N' then
"
"
"
"        OPEN C1(cr3.btdln_hsn_code);
"
"        FETCH C1 INTO CR1;
"
"
"
"         IF C1%NOTFOUND THEN
"
"
"
"            RAISE_APPLICATION_ERROR(-20999,'HSN Code Not Found.');
"
"         END IF;
"
"         CLOSE C1;
"
"         OPEN C2(cr3.btdln_hsn_code);
"
"     FETCH c2 INTO CR2;
"
"     IF c2%FOUND THEN
"
"
"
"       IF p_btdln_suplr_type = 'L' AND p_btdln_supply_type NOT IN ('E','O','N') THEN
"
"          v_tax_ptc  := cr2.hstr_cgst_tax_pct + cr2.hstr_sgst_tax_pct ;
"
"          v_cgst_amt := ((cr3.btdln_tax_assess_val/100)* cr2.hstr_cgst_tax_pct ) ;
"
"          v_sgst_amt := ((cr3.btdln_tax_assess_val/100)* cr2.hstr_sgst_tax_pct );
"
"          v_igst_amt := 0;
"
"          v_utgst_amt:= 0;
"
"          v_cess_pct := cr2.hstr_gst_cess_tax_pct;
"
"          v_cess_amt := ((cr3.btdln_tax_assess_val/100)* cr2.hstr_gst_cess_tax_pct );
"
"          v_hsn_code := NVL(p_btdln_hsn_code,cr3.btdln_hsn_code);
"
"        ELSIF p_btdln_suplr_type = 'I' AND p_btdln_supply_type NOT IN ('E','O','N')  THEN
"
"          v_tax_ptc   := cr2.hstr_igst_tax_pct ;
"
"          v_cgst_amt  := 0;
"
"          v_sgst_amt  := 0;
"
"          v_igst_amt  := ((cr3.btdln_tax_assess_val/100) * cr2.hstr_igst_tax_pct);
"
"          v_utgst_amt := 0;
"
"          v_cess_pct  := cr2.hstr_gst_cess_tax_pct;
"
"          v_cess_amt  := ((cr3.btdln_tax_assess_val/100)* cr2.hstr_gst_cess_tax_pct );
"
"          v_hsn_code := NVL(p_btdln_hsn_code,cr3.btdln_hsn_code);
"
"        ELSIF p_btdln_suplr_type = 'U' AND p_btdln_supply_type NOT IN ('E','A','N','O') THEN
"
"          v_tax_ptc  := cr2.hstr_cgst_tax_pct + cr2.hstr_utgst_tax_pct ;
"
"          v_cgst_amt := ((cr3.btdln_tax_assess_val/100)* cr2.hstr_cgst_tax_pct ) ;
"
"          v_sgst_amt := 0;
"
"          v_igst_amt := 0;
"
"          v_utgst_amt:= ((cr3.btdln_tax_assess_val/100) * cr2.hstr_utgst_tax_pct);
"
"          v_cess_pct := cr2.hstr_gst_cess_tax_pct;
"
"          v_cess_amt := ((cr3.btdln_tax_assess_val/100)* cr2.hstr_gst_cess_tax_pct );
"
"          v_hsn_code := NVL(p_btdln_hsn_code,cr3.btdln_hsn_code);
"
"        END IF;
"
"
"
"        IF p_btdln_supply_type = 'A' THEN
"
"          v_tax_ptc  := 0;
"
"          v_cgst_amt := 0;
"
"          v_sgst_amt := 0;
"
"          v_igst_amt := 0;
"
"          v_utgst_amt:= 0;
"
"          v_cess_pct := 0;
"
"          v_cess_amt := 0;
"
"          v_hsn_code := NULL;
"
"          END IF;
"
"      /*
"
"       IF p_btdln_suplr_type ='L'  AND p_btdln_supply_type IN ('E') THEN
"
"          v_tax_ptc  := cr2.hstr_cgst_tax_pct + cr2.hstr_sgst_tax_pct;
"
"       ELSIF p_btdln_suplr_type ='I'  AND p_btdln_supply_type IN ('E')  THEN
"
"          v_tax_ptc := cr2.hstr_igst_tax_pct;
"
"      ELSIF p_btdln_suplr_type ='U'  AND p_btdln_supply_type IN ('E')  THEN
"
"         v_tax_ptc :=   cr2.hstr_cgst_tax_pct + cr2.hstr_utgst_tax_pct;
"
"      END IF; */
"
"
"
"      END IF;
"
"ELSE
"
"
"
"          v_tax_ptc   := 0;
"
"          v_cgst_amt  := 0;
"
"          v_sgst_amt  := 0;
"
"          v_igst_amt  := 0;
"
"          v_utgst_amt := 0;
"
"          v_cess_pct  := 0;
"
"          v_cess_amt  := 0;
"
"END IF;
"
"     IF p_btdln_gstin_no IS NOT NULL AND p_btdln_gst_pan_no IS  NULL THEN
"
"        v_gst_pan_no    := SUBSTR(p_btdln_gstin_no,3,10);
"
"        v_gst_pan_avail := 'W';
"
"      ELSE
"
"        v_gst_pan_no    := p_btdln_gst_pan_no;
"
"        v_gst_pan_avail := p_btdln_gst_pan_avail;
"
"      END IF;
"
"
"
"--      RAISE_APPLICATION_ERROR(-20999,p_btdln_suplr_type || ' ~ ' ||p_btdln_input_type);
"
"
"
"            UPDATE bank_trans_dist_ln
"
"               SET btdln_state_code         = p_btdln_state_code,
"
"                   btdln_gst_sulr_name      = p_btdln_gst_suplr,
"
"                   btdln_suplr_bill_no      = p_btdln_suplr_bill_no,
"
"                   btdln_gstin_no           = p_btdln_gstin_no,
"
"                   btdln_suplr_type         = p_btdln_suplr_type,
"
"                   btdln_suplr_bill_date    = p_btdln_suplr_bill_date,
"
"                   btdln_gst_type           = p_btdln_gst_type,
"
"                   btdln_supply_type        = p_btdln_supply_type,
"
"                   btdln_input_type         = p_btdln_input_type,
"
"                   btdln_gst_supply         = p_btdln_gst_supply,
"
"                   btdln_gst_rev_tax_cat    = p_btdln_gst_rev_tax_cat,
"
"                   btdln_gst_rev_tax_flag   = CASE WHEN p_btdln_gst_rev_tax_cat IS NOT NULL AND p_btdln_gst_type = 'U' THEN 'Y' ELSE 'N' END,
"
"                   btdln_port_code          = p_btdln_port_code,
"
"                   btdln_boe_date           = p_btdln_boe_date,
"
"                   btdln_boe_no             = p_btdln_boe_no,
"
"                   btdln_lc_po_pfx          = p_btdln_lc_po_pfx,
"
"                   btdln_lc_po_no           = p_btdln_lc_po_no,
"
"                   btdln_gst_pan_avail      = p_btdln_gst_pan_avail,--v_gst_pan_avail,--p_btdln_gst_pan_avail,
"
"                   btdln_gst_pan_no         = p_btdln_gst_pan_no,--v_gst_pan_no,--p_btdln_gst_pan_no,
"
"                   btdln_tax_pct            = NVL(ROUND(v_tax_ptc,v_rnd),0),
"
"                   btdln_cgst_amt           = NVL(ROUND(v_cgst_amt,v_rnd),0),
"
"                   btdln_sgst_amt           = NVL(ROUND(v_sgst_amt,v_rnd),0),
"
"                   btdln_igst_amt           = NVL(ROUND(v_igst_amt,v_rnd),0),
"
"                   btdln_utgst_amt          = NVL(ROUND(v_utgst_amt,v_rnd),0),
"
"                   btdln_cess_pct           = NVL(ROUND(v_cess_pct,v_rnd),0),
"
"                   btdln_cess_amt           = NVL(ROUND(v_cess_amt,v_rnd),0)
"
"                   --btdln_commodity_code = p_btdln_commodity_code
"
"                   --btdln_hsn_code             = v_hsn_code
"
"             WHERE btdln_bu                 = p_bu
"
"               AND btdln_ord_no             = p_ord_no
"
"               AND btdln_seq_no             = p_seq_no;
"
"
"
"  END proc_upd_gst_dtls;
"
"
"
"/* Added by Dinesh */
"
"  PROCEDURE proc_web_pay_acct_party_dtls (p_bu                   IN VARCHAR2,
"
"                                                          p_user                 IN VARCHAR2,
"
"                                                          p_btrans_ord_pfx       IN VARCHAR2,
"
"                                                          p_btrans_ord_no        IN VARCHAR2,
"
"                                                          p_btdln_acct           IN VARCHAR2,
"
"                                                          p_btdln_acct_desc      OUT VARCHAR2,
"
"                                                          p_btdln_lgr_bfcry_id   IN OUT VARCHAR2,
"
"                                                          p_btdln_hsn_code       OUT VARCHAR2,
"
"                                                          p_btdln_acct_no        OUT VARCHAR2,
"
"                                                          p_btdln_ref_bu         OUT VARCHAR2,
"
"                                                          p_btdln_curr           OUT VARCHAR2,
"
"                                                          p_btln_exrate          OUT VARCHAR2,
"
"                                                          p_btdln_bfcry_type     IN OUT VARCHAR2,
"
"                                                          p_btdln_branch_desc    OUT VARCHAR2,
"
"                                                          p_btdln_lgr_bfcry_desc OUT VARCHAR2,
"
"                                                          p_btdln_ifsc_code      OUT VARCHAR2,
"
"                                                          p_btdln_bnk_acct_type  OUT VARCHAR2,
"
"                                                          p_btdln_pay_to_name    OUT VARCHAR2,
"
"                                                          p_btdln_ref_type       OUT VARCHAR2,
"
"                                                          p_btdln_lvl1           OUT VARCHAR2,
"
"                                                          p_btdln_lvl2           OUT VARCHAR2,
"
"                                                          p_btdln_lvl3           OUT VARCHAR2,
"
"                                                          p_btdln_lvl4           OUT VARCHAR2,
"
"                                                          p_btdln_lvl5           OUT VARCHAR2,
"
"                                                          p_btdln_lvl6           OUT VARCHAR2,
"
"                                                          p_btdln_cc_code        OUT VARCHAR2,
"
"                                                          p_btdln_cc_name        OUT VARCHAR2,
"
"                                                          p_btdln_lvl_prj        OUT VARCHAR2,
"
"                                                          p_btdln_acct_plant     OUT VARCHAR2,
"
"                                                          p_btdln_plnt_loc_id    OUT VARCHAR2,
"
"                                                          p_btdln_acct_type      OUT VARCHAR2,
"
"                                                          p_btdln_pay_bank_name  OUT VARCHAR2,
"
"                                                          p_btdln_state_code     OUT VARCHAR2,
"
"                                                          p_btdln_gstin_no       OUT VARCHAR2,
"
"                                                          p_btdln_gst_type       OUT VARCHAR2,
"
"                                                          p_btdln_suplr_type     OUT VARCHAR2,
"
"                                                          p_btdln_gst_sulr_name  OUT VARCHAR2,
"
"                                                          p_btdln_gst_pan_avail  OUT VARCHAR2,
"
"                                                          p_btdln_gst_pan_no     OUT VARCHAR2,
"
"                                                          p_cur_bal_bu           OUT VARCHAR2,
"
"                                                          p_btdln_cfc_code       OUT VARCHAR2,
"
"                                                          p_btdln_cfc_desc       OUT VARCHAR2,
"
"                                                          p_btdln_xpnse_code     OUT VARCHAR2,
"
"                                                          p_btdln_xpnse_desc     OUT VARCHAR2)
"
"   IS
"
"
"
" CURSOR c5                                        /*Process For Account Bank payment*/
"
"   IS
"
" SELECT *
"
"   FROM bank_trans
"
"  WHERE btrans_bu = p_bu
"
"    AND btrans_ord_pfx = p_btrans_ord_pfx
"
"    AND btrans_ord_no = p_btrans_ord_no;
"
"
"
"    cr5 c5%rowtype;
"
"    v_bs_lvl   VARCHAR2(5):=func_find_glm_bs_lvl(p_bu);
"
"    v_inter_intra VARCHAR2(5):='N';
"
"BEGIN
"
"--RAISE_APPLICATION_ERROR(-20999,'TEST11');
"
"    OPEN c5;
"
"    FETCH c5 INTO cr5;
"
"    IF p_btdln_acct IS NULL THEN
"
"        raise_application_error(-20999, 'Account must be entered.');
"
"    ELSE
"
"        DECLARE
"
"            CURSOR c1
"
"             IS
"
"             SELECT glac_acct,
"
"                    glac_acct_desc1,
"
"                    glac_hsn_sac_code,
"
"                    glac_acct_status
"
"               FROM gl_accts
"
"              WHERE glac_bu = p_bu
"
"                AND glac_acct_status = 'A'
"
"                AND glac_acct = p_btdln_acct;
"
"
"
"            CURSOR c3
"
"              IS
"
"             SELECT xaic_ifsc_code,
"
"                    xaic_acct_no,
"
"                    xaic_acct_type,
"
"                    xaic_ref,
"
"                    xaic_branch_desc
"
"               FROM gl_accts,
"
"                    xpns_acct_ifsc_codes
"
"              WHERE glac_bu = p_bu
"
"                AND glac_bu = xaic_bu
"
"                AND glac_acct = xaic_acct_id
"
"                AND glac_acct = p_btdln_acct;
"
"
"
"            CURSOR c2
"
"             IS
"
"             SELECT ssl_gst_no,
"
"                    state_code,
"
"                    state_name1,
"
"                    ssl_gst_type,
"
"                    ssl_type
"
"               FROM suplr_ship_loc,
"
"                    states
"
"              WHERE ssl_bu = p_bu
"
"                AND ssl_suplr_id = p_btdln_lgr_bfcry_id
"
"                AND ssl_dflt_flg = 'Y'
"
"                AND state_id = ssl_state;
"
"
"
"            CURSOR c4
"
"             IS
"
"             SELECT ssl_gst_no,
"
"                    state_code,
"
"                    state_name1,
"
"                    ssl_gst_type,
"
"                    ssl_type
"
"               FROM suplr_ship_loc,
"
"                    states
"
"              WHERE ssl_bu = p_bu
"
"                AND ssl_suplr_id = p_btdln_lgr_bfcry_id
"
"                AND ssl_dflt_flg = 'Y'
"
"                AND state_id = ssl_state;
"
"            CURSOR c6
"
"              IS
"
"            SELECT txc_xpns_code,
"
"                   txc_code_desc
"
"              FROM trv_xpns_code
"
"             WHERE txc_bu = p_bu
"
"               AND txc_acct = p_btdln_acct;
"
"
"
"           CURSOR c7--(c_plnt  VARCHAR2)
"
"           IS
"
"              SELECT *
"
"                 FROM  suplr_plant_accts,suppliers
"
"               WHERE spla_bu = p_bu
"
"                   AND spla_acct = p_btdln_acct
"
"                   --AND (spla_plnt =  c_plnt  AND v_bs_lvl ='U' OR v_bs_lvl ='E')
"
"                   AND suplr_bu =  spla_bu
"
"                   AND suplr_party_type IN('N','A')
"
"                   AND suplr_suplr_id = spla_suplr_id;
"
"
"
"            cr1 c1%rowtype;
"
"            cr3 c3%rowtype;
"
"            cr2 c2%rowtype;
"
"            cr4 c4%rowtype;
"
"            cr6 c6%rowtype;
"
"            cr7 c7%rowtype;
"
"            v_hsn_code VARCHAR2(30);
"
"        BEGIN
"
"
"
"            OPEN c1;
"
"            FETCH c1 INTO cr1;
"
"            IF c1%found THEN
"
"                IF cr1.glac_acct_status <> 'A' THEN
"
"                    raise_application_error(-20999, 'Account is Inactive');
"
"                END IF;
"
"                IF  cr5.btrans_trans_curcy  = func_find_base_currency(p_bu) THEN
"
"                     v_hsn_code := cr1.glac_hsn_sac_code;
"
"                ELSE
"
"                    v_hsn_code := NULL;
"
"                END IF;
"
"                p_btdln_acct_desc := cr1.glac_acct_desc1;
"
"                p_btdln_hsn_code  :=  v_hsn_code;
"
"                p_btdln_curr      := cr5.btrans_trans_curcy;
"
"                p_btdln_ref_bu    := p_bu;
"
"                p_btln_exrate     := cr5.btrans_trans_base_exrate; /* TO Update Line Exchange Rate  - ADDED ON 06.06.2019 */
"
"
"
"                IF cr5.btrans_type IN('JT')
"
"                THEN
"
"                OPEN c7;--(cr5.btrans_plant);
"
"
"
"                FETCH c7 INTO cr7;
"
"
"
"                IF c7%NOTFOUND
"
"                THEN
"
"                proc_find_party_id_rev(p_bu,
"
"                                       p_btdln_acct,
"
"                                       p_btdln_bfcry_type,
"
"                                       p_btdln_lgr_bfcry_id,
"
"                                       p_btdln_lgr_bfcry_desc,
"
"                                       p_btdln_acct_type);
"
"                ELSE
"
"                v_inter_intra :='Y';
"
"
"
"                END IF;
"
"                CLOSE c7;
"
"                ELSE
"
"                proc_find_party_id_rev(p_bu,
"
"                                       p_btdln_acct,
"
"                                       p_btdln_bfcry_type,
"
"                                       p_btdln_lgr_bfcry_id,
"
"                                       p_btdln_lgr_bfcry_desc,
"
"                                       p_btdln_acct_type);
"
"                v_inter_intra :='N';
"
"                END IF;
"
"                OPEN c3;
"
"                FETCH c3 INTO cr3;
"
"                IF c3%found THEN
"
"                    p_btdln_ifsc_code     := cr3.xaic_ifsc_code;
"
"                    p_btdln_acct_no       := cr3.xaic_acct_no;
"
"                    p_btdln_bnk_acct_type := cr3.xaic_acct_type;
"
"                    p_btdln_pay_to_name   := cr3.xaic_ref;
"
"                ELSE
"
"                    IF c3%notfound AND ( p_btdln_ifsc_code IS NOT NULL OR p_btdln_acct_no IS NOT NULL OR p_btdln_bnk_acct_type IS NOT NULL ) THEN
"
"                        p_btdln_ifsc_code     := NULL;
"
"                        p_btdln_acct_no       := NULL;
"
"                        p_btdln_bnk_acct_type := 'SB';
"
"                        p_btdln_pay_to_name   := NULL;
"
"                    END IF;
"
"                END IF;
"
"
"
"                CLOSE c3;
"
"            ELSE
"
"                raise_application_error(-20999, 'Account not found.');
"
"            END IF;
"
"
"
"            CLOSE c1;
"
"
"
"            OPEN c6;
"
"            FETCH c6 INTO cr6;
"
"              IF c6%FOUND THEN
"
"                p_btdln_xpnse_code  := cr6.txc_xpns_code;
"
"                p_btdln_xpnse_desc  := cr6.txc_code_desc;
"
"              END IF;
"
"           CLOSE c6;
"
"        END;
"
"    END IF;
"
"
"
"    IF p_btdln_acct_desc IS NOT NULL THEN
"
"
"
"        DECLARE
"
"            CURSOR c1
"
"              IS
"
"            SELECT COUNT(*) v_cnt
"
"              FROM gl_accts
"
"             WHERE glac_bu = p_bu
"
"               AND glac_acct = p_btdln_acct
"
"               AND glac_cust_id IS NULL
"
"               AND glac_suplr_id IS NULL
"
"               AND glac_sub_grp_type NOT IN ( 'SAP', 'SAD', 'SSD', 'SAC', 'CAR', 'CAD', 'CSD', 'CEMD', 'CRET', 'CPBG', 'PCK', 'BDS', 'TDS', 'ESI', 'SVT', 'TCS', 'CASH', 'IMP', 'EC' )
"
"               AND glac_acct_type_code IS NULL
"
"            UNION ALL
"
"            SELECT COUNT(*) v_cnt
"
"              FROM gl_accts,
"
"                   acct_type_codes
"
"             WHERE glac_bu = p_bu
"
"               AND glac_acct = p_btdln_acct
"
"               AND glac_cust_id IS NULL
"
"               AND glac_suplr_id IS NULL
"
"               AND atc_acct_type NOT IN ( 'SAP', 'SAD', 'SSD', 'SAC', 'CAR','CAD', 'CSD', 'CEMD', 'CRET', 'CPBG', 'PCK', 'BDS', 'TDS', 'ESI', 'SVT', 'TCS', 'CASH', 'IMP', 'EC' )
"
"               AND glac_bu = atc_bu
"
"               AND glac_acct_type_code = atc_code
"
"               AND glac_acct_type_code IS NOT NULL
"
"               UNION ALL
"
"            SELECT COUNT(*) v_cnt
"
"              FROM gl_accts
"
"             WHERE glac_bu = p_bu
"
"               AND glac_acct = p_btdln_acct
"
"               AND glac_cust_id IS NULL
"
"               AND glac_suplr_id IS NULL
"
"               AND glac_sub_grp_type IN ( 'CASH', 'IMP' )
"
"               AND glac_acct_type_code IS NULL
"
"               AND EXISTS (SELECT 1 FROM glm_control WHERE glmctrl_bu = glac_bu AND (glmctrl_pend_ci_doc_ctrl='Y' OR glmctrl_pend_imp_doc_ctrl ='Y'))  ;
"
"
"
"            CURSOR c2 --not used
"
"              IS
"
"            SELECT COUNT(*) v_cnt
"
"              FROM unt_ac_cat_sal_paybl_acct,
"
"                   glm_control
"
"             WHERE uacspa_bu = p_bu
"
"               AND uacspa_acct = p_btdln_acct
"
"               AND glmctrl_bu = uacspa_bu
"
"               --AND 1=2
"
"               AND glmctrl_pay_agnst_pyrl = 'Y';
"
"
"
"            CURSOR c3
"
"              IS
"
"            SELECT COUNT(*) v_cnt
"
"              FROM fin_mgmt_control
"
"             WHERE fmc_bu = p_bu
"
"               AND fmc_acct = p_btdln_acct
"
"               AND fmc_acct_type IN ( 'LC', 'US' );
"
"
"
"            cr1 c1%rowtype;
"
"            cr2 c2%rowtype;
"
"            cr3 c3%rowtype;
"
"        BEGIN
"
"      --  RAISE_APPLICATION_ERROR(-20999,'TEST');
"
"            OPEN c1;
"
"            FETCH c1 INTO cr1;
"
"            OPEN c2;
"
"            FETCH c2 INTO cr2;
"
"            OPEN c3;
"
"            FETCH c3 INTO cr3;
"
"            IF cr1.v_cnt > 0 AND cr2.v_cnt <= 0 AND cr3.v_cnt <= 0 THEN
"
"                p_btdln_ref_type := 'N';
"
"               -- RAISE_APPLICATION_ERROR(-2999,'TEST1'||p_btdln_ref_type);
"
"            ELSE
"
"                p_btdln_ref_type := 'R';--cr1.v_cnt||cr2.v_cnt||cr3.v_cnt;
"
"             -- RAISE_APPLICATION_ERROR(-2999,'TEST'||p_btdln_ref_type);
"
"            END IF;
"
"
"
"            CLOSE c3;
"
"            CLOSE c2;
"
"            CLOSE c1;
"
"        END;
"
"    END IF;
"
"
"
"   /****** FOR SINGLE COST CENTER  EXISTS ******/
"
"
"
"    IF p_btdln_acct_desc IS NOT NULL THEN
"
"        DECLARE
"
"            CURSOR c1
"
"                IS
"
"            SELECT COUNT(*) v_cnt
"
"              FROM gl_lvl_accounts
"
"             WHERE glal_bu = p_btdln_ref_bu
"
"               AND glal_acct = p_btdln_acct;
"
"
"
"            CURSOR c2
"
"              IS
"
"            SELECT *
"
"              FROM gl_lvl_accounts
"
"             WHERE glal_bu = p_btdln_ref_bu
"
"               AND glal_acct = p_btdln_acct;
"
"
"
"            cr1 c1%rowtype;
"
"            cr2 c2%rowtype;
"
"            v_bs_lvl  VARCHAR2(5);
"
"        BEGIN
"
"                   SELECT glmctrl_bs_level
"
"                      INTO  v_bs_lvl
"
"                     FROM glm_control
"
"                   WHERE glmctrl_bu = p_bu;
"
"          --   RAISE_APPLICATION_ERROR(-20999,'TEST'||'-'||p_btdln_ref_bu||'-'||p_btdln_acct||'-');
"
"           IF v_bs_lvl = 'E' THEN
"
"
"
"            OPEN c1;
"
"            FETCH c1 INTO cr1;
"
"
"
"            IF c1%found THEN
"
"
"
"                IF cr1.v_cnt = 1 AND ( func_find_apm_prj_req_flag(p_bu) = 'N' OR func_find_arm_prj_req_flag(p_bu) = 'N' ) THEN
"
"                    OPEN c2;
"
"                    FETCH c2 INTO cr2;
"
"                    IF c2%found THEN
"
"
"
"                        p_btdln_lvl1       := cr2.glal_lvl1;
"
"                        p_btdln_lvl2       := cr2.glal_lvl2;
"
"                        p_btdln_lvl3       := cr2.glal_lvl3;
"
"                        p_btdln_lvl4       := cr2.glal_lvl4;
"
"                        p_btdln_lvl5       := cr2.glal_lvl5;
"
"                        p_btdln_lvl6       := cr2.glal_lvl6;
"
"                        p_btdln_cc_code    := cr2.glal_cc_code;
"
"                        p_btdln_lvl_prj    := cr2.glal_lvl_prj;
"
"                        p_btdln_acct_plant := cr2.glal_plant;
"
"                        p_btdln_cc_name    := cr2.glal_cc_desc;
"
"                        IF p_btdln_ref_bu IS NULL THEN
"
"                            p_btdln_ref_bu := p_bu;
"
"                        END IF;
"
"                    END IF;
"
"
"
"                    CLOSE c2;
"
"                END IF;
"
"            END IF;
"
"
"
"            CLOSE c1;
"
"         END IF;
"
"        END;
"
"
"
"    END IF;
"
"
"
"    p_btdln_plnt_loc_id := func_find_dflt_plnt_loc(p_bu, p_btdln_acct_plant);
"
"
"
"
"
"   ------FOR LC FLAG-----
"
"
"
"    DECLARE
"
"        v_bfcry_type VARCHAR2(5);
"
"        v_lgr_type   VARCHAR2(5);
"
"        v_bfcry_id   VARCHAR2(50);
"
"        v_bfcry_desc VARCHAR2(500);
"
"    BEGIN
"
"    IF v_inter_intra = 'N'
"
"    THEN
"
"        proc_find_party_id_rev(p_bu,
"
"                               p_btdln_acct,
"
"                               v_bfcry_type,
"
"                               v_bfcry_id,
"
"                               v_bfcry_desc,
"
"                               v_lgr_type);
"
"    ELSE
"
"      p_btdln_ref_type :='N';
"
"    END IF;
"
"    END;
"
"
"
"    DECLARE
"
"        CURSOR c1 IS
"
"        SELECT *
"
"          FROM fin_mgmt_control
"
"         WHERE fmc_bu = p_bu
"
"           AND fmc_acct = p_btdln_acct
"
"           AND fmc_acct_type IN ( 'US' );
"
"
"
"        cr1 c1%rowtype;
"
"    BEGIN
"
"        OPEN c1;
"
"        FETCH c1 INTO cr1;
"
"        IF c1%found THEN
"
"            p_btdln_ref_type := 'N';
"
"        END IF;
"
"    END;
"
"
"
"    DECLARE
"
"        CURSOR c1
"
"          IS
"
"        SELECT spbd_pay_acct_type,
"
"               spbd_bank_ifsc_code,
"
"               spbd_bank_acc_no,
"
"               spbd_pay_bank_name,
"
"               spbd_branch_desc,
"
"               spbd_pay_to_name
"
"          FROM suplr_pay_bank_dtls
"
"         WHERE spbd_bu = p_bu
"
"           AND spbd_suplr_id = p_btdln_lgr_bfcry_id
"
"           AND p_btdln_bfcry_type = 'S'
"
"           AND spbd_dflt_flag = 'Y'
"
"        UNION ALL
"
"        SELECT suplr_pay_acct_type,
"
"               suplr_ifsc_code,
"
"               suplr_pay_acct_no,
"
"               suplr_prnt_capn,
"
"               NULL,
"
"               NULL
"
"          FROM suppliers
"
"         WHERE suplr_bu = p_bu
"
"           AND suplr_suplr_id = p_btdln_lgr_bfcry_id
"
"           AND suplr_party_type = 'C'
"
"           AND p_btdln_bfcry_type = 'C';
"
"
"
"        CURSOR c2
"
"          IS
"
"        SELECT xaic_pay_bank_name,
"
"               xaic_branch_desc,
"
"               xaic_bank_city,
"
"               xaic_ifsc_code,
"
"               xaic_acct_no,
"
"               xaic_acct_type,
"
"               xaic_ref
"
"          FROM gl_accts,
"
"               xpns_acct_ifsc_codes
"
"         WHERE glac_bu = p_bu
"
"           AND glac_bu = xaic_bu
"
"           AND glac_acct = xaic_acct_id
"
"           AND glac_acct = p_btdln_acct;
"
"
"
"        cr1 c1%rowtype;
"
"        cr2 c2%rowtype;
"
"    BEGIN
"
"
"
"        IF p_btdln_bfcry_type IN ( 'S', 'C' ) THEN
"
"            OPEN c1;
"
"            FETCH c1 INTO cr1;
"
"            IF c1%found THEN
"
"                p_btdln_ifsc_code     := cr1.spbd_bank_ifsc_code;
"
"                p_btdln_acct_no       := cr1.spbd_bank_acc_no;
"
"                p_btdln_bnk_acct_type := cr1.spbd_pay_acct_type;
"
"                p_btdln_pay_bank_name := cr1.spbd_pay_bank_name;
"
"                p_btdln_branch_desc   := cr1.spbd_branch_desc;
"
"                p_btdln_pay_to_name   := cr1.spbd_pay_to_name;
"
"            ELSE
"
"                p_btdln_ifsc_code     := NULL;
"
"                p_btdln_acct_no       := NULL;
"
"                p_btdln_bnk_acct_type := 'SB';
"
"                p_btdln_pay_to_name   := NULL;
"
"                p_btdln_pay_bank_name := NULL;
"
"                p_btdln_branch_desc   := NULL;
"
"            END IF;
"
"
"
"            CLOSE c1;
"
"        ELSE
"
"            OPEN c2;
"
"            FETCH c2 INTO cr2;
"
"            IF c2%found THEN
"
"                p_btdln_pay_bank_name := cr2.xaic_pay_bank_name;
"
"                p_btdln_branch_desc   := cr2.xaic_branch_desc;
"
"                p_btdln_ifsc_code     := cr2.xaic_ifsc_code;
"
"                p_btdln_acct_no       := cr2.xaic_acct_no;
"
"                p_btdln_bnk_acct_type := cr2.xaic_acct_type;
"
"                p_btdln_pay_to_name   := cr2.xaic_ref;
"
"            ELSE
"
"                p_btdln_ifsc_code     := NULL;
"
"                p_btdln_acct_no       := NULL;
"
"                p_btdln_bnk_acct_type := 'SB';
"
"                p_btdln_pay_to_name   := NULL;
"
"            END IF;
"
"
"
"            CLOSE c2;
"
"        END IF;
"
"    END;
"
"
"
"    IF p_btdln_acct IS NOT NULL THEN
"
"        p_cur_bal_bu := func_find_gl_acct_curr_bal_bu(p_btdln_ref_bu, cr5.btrans_trans_year, p_btdln_acct);
"
"    END IF;
"
"
"
"    --raise_application_error(-20999,'HRM'||p_btdln_bfcry_type||'~'||p_btdln_lgr_bfcry_id);
"
"
"
"    IF p_btdln_bfcry_type = 'S' AND p_btdln_lgr_bfcry_id IS NOT NULL THEN
"
"
"
"
"
"         BEGIN
"
"             SELECT ssl_state_code,
"
"                    ssl_gst_no,
"
"                    ssl_gst_type,
"
"                    ssl_type,
"
"                    p_btdln_lgr_bfcry_desc,
"
"                    suplr_pan_no
"
"               INTO p_btdln_state_code,
"
"                    p_btdln_gstin_no,
"
"                    p_btdln_gst_type,
"
"                    p_btdln_suplr_type,
"
"                    p_btdln_gst_sulr_name,
"
"                    p_btdln_gst_pan_no
"
"              FROM suppliers,
"
"                   suplr_ship_loc
"
"             WHERE suplr_bu = ssl_bu
"
"               AND ssl_bu = p_bu
"
"               AND suplr_suplr_id = ssl_suplr_id
"
"               AND ssl_suplr_id = p_btdln_lgr_bfcry_id
"
"               AND ssl_dflt_flg IN ( 'B', 'S', 'D' );
"
"
"
"         -- raise_application_error(-20999,'Test'||'~'||p_btdln_suplr_type);
"
"
"
"        EXCEPTION WHEN no_data_found THEN
"
"                NULL;
"
"            WHEN too_many_rows THEN
"
"                NULL;
"
"        END;
"
"    END IF;
"
"
"
"    IF p_btdln_bfcry_type = 'C' AND p_btdln_lgr_bfcry_id IS NOT NULL THEN
"
"        BEGIN
"
"             SELECT ssl_state_code,
"
"                    ssl_gst_no,
"
"                    ssl_gst_type,
"
"                    ssl_type,
"
"                    p_btdln_lgr_bfcry_desc,
"
"                    suplr_pan_no
"
"               INTO p_btdln_state_code,
"
"                    p_btdln_gstin_no,
"
"                    p_btdln_gst_type,
"
"                    p_btdln_suplr_type,
"
"                    p_btdln_gst_sulr_name,
"
"                    p_btdln_gst_pan_no
"
"              FROM suppliers,
"
"                   suplr_ship_loc
"
"             WHERE suplr_bu = ssl_bu
"
"               AND ssl_bu = p_bu
"
"               AND suplr_suplr_id = ssl_suplr_id
"
"               AND ssl_suplr_id = p_btdln_lgr_bfcry_id
"
"               AND ssl_dflt_flg IN ( 'B', 'S', 'D' );
"
"
"
"        EXCEPTION WHEN no_data_found THEN
"
"                NULL;
"
"            WHEN too_many_rows THEN
"
"                NULL;
"
"        END;
"
"    END IF;
"
"
"
"    CLOSE c5;
"
"
"
"    IF cr5.btrans_cfc_code IS NOT NULL THEN
"
"        BEGIN
"
"            SELECT cfc_code,
"
"                  cfc_desc
"
"              INTO p_btdln_cfc_code,
"
"                   p_btdln_cfc_desc
"
"              FROM cash_flow_code
"
"             WHERE cfc_bu = p_bu
"
"               AND cfc_code = cr5.btrans_cfc_code;
"
"
"
"        EXCEPTION WHEN OTHERS THEN
"
"        -- RAISE_APPLICATION_ERROR(-20999,'TEST'||'-'||cr5.btrans_cfc_code||'-'||p_btdln_cfc_code||'-'||p_btdln_cfc_desc);
"
"        --EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                NULL;
"
"        END;
"
"    END IF;
"
"
"
" /* Assign Party Details */
"
"
"
"    IF p_btdln_bfcry_type IN ( 'S', 'C' ) AND p_btdln_lgr_bfcry_desc IS NOT NULL
"
"    THEN
"
"        DECLARE
"
"            CURSOR c1
"
"               IS
"
"            SELECT glal_suplr_id bfcry_id,
"
"                   glal_lgr_type,
"
"                   glal_bfcry_type
"
"              FROM suplr_cust_acct_vw_rev
"
"             WHERE glal_bu = p_bu
"
"               AND glal_acct = p_btdln_acct
"
"               AND glal_bfcry_desc = p_btdln_lgr_bfcry_desc
"
"               AND glal_bfcry_type = p_btdln_bfcry_type
"
"            UNION
"
"           SELECT UNIQUE spla_suplr_id bfcry_id,
"
"                 'AP' glal_lgr_type,
"
"                 'S'  glal_bfcry_type
"
"              FROM gl_accts, suplr_plant_accts, suppliers
"
"             WHERE     glac_acct_status = 'A'
"
"                   AND glac_bu =  p_bu
"
"                   AND glac_bu = spla_bu
"
"                   AND glac_acct = spla_acct
"
"                   AND glac_acct = p_btdln_acct
"
"                   AND suplr_bu = spla_bu
"
"                   AND suplr_party_type IN( 'R' ,'P','I')
"
"                   AND suplr_suplr_id = spla_suplr_id
"
"                   AND suplr_status = 'A';
"
"
"
"            cr1 c1%rowtype;
"
"        BEGIN
"
"            OPEN c1;
"
"            FETCH c1 INTO cr1;
"
"            IF c1%notfound AND p_btdln_bfcry_type NOT IN ( 'E' ) THEN
"
"                raise_application_error(-20999, 'Party not found.');
"
"            ELSE
"
"                p_btdln_lgr_bfcry_id := cr1.bfcry_id;
"
"                p_btdln_acct_type    := cr1.glal_lgr_type;
"
"            END IF;
"
"
"
"            CLOSE c1;
"
"        END;
"
"    END IF;
"
"
"
"--raise_application_error(-20999,p_btdln_lgr_bfcry_desc);
"
"    /*IF p_btdln_bfcry_type IN ( 'E' ) THEN
"
"        DECLARE
"
"            CURSOR c1 IS
"
"            SELECT emp_emp_id,
"
"                   emp_type
"
"              FROM employees
"
"             WHERE emp_bu = p_bu
"
"               AND emp_first_name1 = p_btdln_lgr_bfcry_desc
"
"               AND emp_status = 'A';
"
"
"
"            cr1 c1%rowtype;
"
"        BEGIN
"
"            OPEN c1;
"
"            FETCH c1 INTO cr1;
"
"            p_btdln_lgr_bfcry_id := cr1.emp_emp_id;
"
"            p_btdln_acct_type    := cr1.emp_type;
"
"            CLOSE c1;
"
"        END;
"
"    END IF;*/
"
"
"
"    DECLARE
"
"        CURSOR c1
"
"          IS
"
"        SELECT *
"
"          FROM suppliers
"
"         WHERE suplr_bu = p_bu
"
"           AND suplr_suplr_id = p_btdln_lgr_bfcry_id
"
"           AND suplr_hold_flag = 'Y'
"
"           AND p_btdln_bfcry_type = 'S';
"
"
"
"        cr1 c1%rowtype;
"
"    BEGIN
"
"        OPEN c1;
"
"        FETCH c1 INTO cr1;
"
"        IF c1%found THEN
"
"            raise_application_error(-20999, 'Supplier is in Hold');
"
"        END IF;
"
"        CLOSE c1;
"
"    END;
"
"    IF p_btdln_lgr_bfcry_id IS NOT NULL AND p_btdln_bfcry_type <> 'E' THEN
"
"        IF func_find_party_type(p_bu, p_btdln_lgr_bfcry_id, 1) = 'P' THEN
"
"            DECLARE
"
"                CURSOR c1
"
"                  IS
"
"                SELECT pcc_desc,
"
"                       pcc_bu,
"
"                       pcc_ac_plnt,
"
"                       pcc_ac_lvl1,
"
"                       pcc_ac_lvl2,
"
"                       pcc_ac_lvl3,
"
"                       pcc_ac_lvl4,
"
"                       pcc_ac_lvl5,
"
"                       pcc_ac_lvl6,
"
"                       pcc_ac_lvl_prj,
"
"                       party_id,
"
"                       party_desc,
"
"                       pcc_cc_code,
"
"                       pcc_ac_plnt_loc_id
"
"                  FROM(SELECT UNIQUE a.glal_cc_desc pcc_desc,
"
"                              a.glal_bu pcc_bu,
"
"                              a.glal_plant pcc_ac_plnt,
"
"                              a.glal_lvl1 pcc_ac_lvl1,
"
"                              a.glal_lvl2 pcc_ac_lvl2,
"
"                              a.glal_lvl3 pcc_ac_lvl3,
"
"                              a.glal_lvl4 pcc_ac_lvl4,
"
"                              a.glal_lvl5 pcc_ac_lvl5,
"
"                              a.glal_lvl6 pcc_ac_lvl6,
"
"                              a.glal_lvl_prj pcc_ac_lvl_prj,
"
"                              b.glal_suplr_id party_id,
"
"                              func_find_party_name(a.glal_bu, b.glal_suplr_id, 1) party_desc,
"
"                              a.glal_cc_code pcc_cc_code,
"
"                              func_find_dflt_plnt_loc(p_bu, a.glal_plant) pcc_ac_plnt_loc_id
"
"                         FROM gl_lvl_accounts      a,
"
"                              suplr_cust_ledger_vw b
"
"                        WHERE a.glal_acct = p_btdln_acct
"
"                          AND a.glal_sub_grp_type NOT IN ( 'BANK', 'BKI', 'BKR' )
"
"                          AND func_find_glm_bs_lvl(p_btdln_ref_bu) = 'U'
"
"                          AND a.glal_bu = b.glal_bu
"
"                          AND a.glal_acct = b.glal_acct
"
"                          AND b.glal_acct = p_btdln_acct
"
"                          AND a.glal_plant = b.glal_party_plant
"
"                          AND a.glal_plant = b.glal_plant
"
"                          AND b.glal_acct = p_btdln_acct
"
"                          AND ( ( b.glal_suplr_id = p_btdln_lgr_bfcry_id
"
"                                  AND p_btdln_bfcry_type = 'S' ) )
"
"                        UNION ALL
"
"                        SELECT UNIQUE a.glal_cc_desc pcc_desc,
"
"                               a.glal_bu pcc_bu,
"
"                               a.glal_plant pcc_ac_plnt,
"
"                               a.glal_lvl1 pcc_ac_lvl1,
"
"                               a.glal_lvl2 pcc_ac_lvl2,
"
"                               a.glal_lvl3 pcc_ac_lvl3,
"
"                               a.glal_lvl4 pcc_ac_lvl4,
"
"                               a.glal_lvl5 pcc_ac_lvl5,
"
"                               a.glal_lvl6 pcc_ac_lvl6,
"
"                               a.glal_lvl_prj pcc_ac_lvl_prj,
"
"                               b.glal_cust_id party_id,
"
"                               func_find_party_name(a.glal_bu, b.glal_cust_id, 1) party_desc,
"
"                               a.glal_cc_code pcc_cc_code,
"
"                               func_find_dflt_plnt_loc(p_bu, a.glal_plant) pcc_ac_plnt_loc_id
"
"                          FROM gl_lvl_accounts      a,
"
"                               suplr_cust_ledger_vw b
"
"                         WHERE a.glal_acct = p_btdln_acct
"
"                           AND a.glal_sub_grp_type NOT IN ( 'BANK', 'BKI', 'BKR' )
"
"                           AND func_find_glm_bs_lvl(p_btdln_ref_bu) = 'U'
"
"                           AND a.glal_bu = b.glal_bu
"
"                           AND a.glal_acct = b.glal_acct
"
"                           AND b.glal_acct = p_btdln_acct
"
"                           AND a.glal_plant = b.glal_party_plant
"
"                           AND a.glal_plant = b.glal_plant
"
"                           AND b.glal_acct = p_btdln_acct
"
"                           AND ( ( b.glal_cust_id = p_btdln_lgr_bfcry_id
"
"                                   AND p_btdln_bfcry_type = 'C' ) )
"
"                        UNION ALL
"
"                        SELECT glal_cc_desc pcc_desc,
"
"                               glal_bu pcc_bu,
"
"                               glal_plant pcc_ac_plnt,
"
"                               glal_lvl1 pcc_ac_lvl1,
"
"                               glal_lvl2 pcc_ac_lvl2,
"
"                               glal_lvl3 pcc_ac_lvl3,
"
"                               glal_lvl4 pcc_ac_lvl4,
"
"                               glal_lvl5 pcc_ac_lvl5,
"
"                               glal_lvl6 pcc_ac_lvl6,
"
"                               glal_lvl_prj pcc_ac_lvl_prj,
"
"                               NULL party_id,
"
"                               NULL party_desc,
"
"                               glal_cc_code pcc_cc_code,
"
"                               func_find_dflt_plnt_loc(p_bu, glal_plant) pcc_ac_plnt_loc_id
"
"                          FROM gl_lvl_accounts a
"
"                         WHERE glal_acct = p_btdln_acct
"
"                           AND glal_sub_grp_type NOT IN ( 'BANK', 'BKI', 'BKR' )
"
"                           AND p_btdln_bfcry_type NOT IN ( 'S', 'C' )
"
"                           AND func_find_glm_bs_lvl(p_btdln_ref_bu) = 'U'
"
"                        UNION ALL
"
"                        SELECT glal_cc_desc pcc_desc,
"
"                               glal_bu pcc_bu,
"
"                               glal_plant pcc_ac_plnt,
"
"                               glal_lvl1 pcc_ac_lvl1,
"
"                               glal_lvl2 pcc_ac_lvl2,
"
"                               glal_lvl3 pcc_ac_lvl3,
"
"                               glal_lvl4 pcc_ac_lvl4,
"
"                               glal_lvl5 pcc_ac_lvl5,
"
"                               glal_lvl6 pcc_ac_lvl6,
"
"                               glal_lvl_prj pcc_ac_lvl_prj,
"
"                               NULL party_id,
"
"                               NULL party_desc,
"
"                               glal_cc_code pcc_cc_code,
"
"                               func_find_dflt_plnt_loc(p_bu, glal_plant) pcc_ac_plnt_loc_id
"
"                          FROM gl_lvl_accounts a
"
"                         WHERE glal_acct = p_btdln_acct
"
"                           AND glal_sub_grp_type NOT IN ( 'BANK', 'BKI', 'BKR' )
"
"                           AND func_find_glm_bs_lvl(p_btdln_ref_bu) = 'E'
"
"                        UNION ALL
"
"                        SELECT pcc_desc,
"
"                               pcc_bu,
"
"                               pcc_ac_plnt,
"
"                               pcc_ac_lvl1,
"
"                               pcc_ac_lvl2,
"
"                               pcc_ac_lvl3,
"
"                               pcc_ac_lvl4,
"
"                               pcc_ac_lvl5,
"
"                               pcc_ac_lvl6,
"
"                               pcc_ac_lvl_prj,
"
"                               NULL party_id,
"
"                               NULL party_desc,
"
"                               pcc_cc_code,
"
"                               func_find_dflt_plnt_loc(p_bu, pcc_ac_plnt) pcc_ac_plnt_loc_id
"
"                          FROM profit_cost_centers a
"
"                         WHERE pcc_so_prj_id IS NOT NULL
"
"                           AND func_find_apm_prj_req_flag(p_bu) = 'Y'
"
"                           AND p_btdln_bfcry_type = 'S'
"
"                           AND pcc_default_flag = 'Y'
"
"                        UNION ALL
"
"                        SELECT pcc_desc,
"
"                               pcc_bu,
"
"                               pcc_ac_plnt,
"
"                               pcc_ac_lvl1,
"
"                               pcc_ac_lvl2,
"
"                               pcc_ac_lvl3,
"
"                               pcc_ac_lvl4,
"
"                               pcc_ac_lvl5,
"
"                               pcc_ac_lvl6,
"
"                               pcc_ac_lvl_prj,
"
"                               prj_cust_id                                  party_id,
"
"                               func_find_party_name(pcc_bu, prj_cust_id, 1) party_desc,
"
"                               pcc_cc_code,
"
"                               func_find_dflt_plnt_loc(p_bu, pcc_ac_plnt)   pcc_ac_plnt_loc_id
"
"                          FROM profit_cost_centers a,
"
"                               projects
"
"                         WHERE pcc_so_prj_id IS NOT NULL
"
"                           AND func_find_arm_prj_req_flag(p_bu) = 'Y'
"
"                           AND prj_bu = pcc_bu
"
"                           AND pcc_so_prj_id = prj_proj_id
"
"                           AND ( prj_cust_id = p_btdln_lgr_bfcry_id
"
"                                 OR p_btdln_lgr_bfcry_id IS NULL )
"
"                           AND p_btdln_bfcry_type = 'C'
"
"                           AND pcc_default_flag = 'Y'
"
"                        UNION ALL
"
"                        SELECT pcc_desc,
"
"                               pcc_bu,
"
"                               pcc_ac_plnt,
"
"                               pcc_ac_lvl1,
"
"                               pcc_ac_lvl2,
"
"                               pcc_ac_lvl3,
"
"                               pcc_ac_lvl4,
"
"                               pcc_ac_lvl5,
"
"                               pcc_ac_lvl6,
"
"                               pcc_ac_lvl_prj,
"
"                               soh_cust_id                                  party_id,
"
"                               func_find_party_name(pcc_bu, soh_cust_id, 1) party_desc,
"
"                               pcc_cc_code,
"
"                               func_find_dflt_plnt_loc(p_bu, pcc_ac_plnt)   pcc_ac_plnt_loc_id
"
"                          FROM profit_cost_centers a,
"
"                               sales_order_hd
"
"                         WHERE pcc_so_prj_id IS NOT NULL
"
"                           AND func_find_arm_prj_req_flag(p_bu) = 'Y'
"
"                           AND pcc_bu = soh_bu
"
"                           AND pcc_so_pfx || pcc_so_prj_id = soh_order_pfx || soh_order_no
"
"                           AND ( soh_cust_id = p_btdln_lgr_bfcry_id
"
"                                 OR p_btdln_lgr_bfcry_id IS NULL )
"
"                           AND p_btdln_bfcry_type = 'C'
"
"                           AND pcc_default_flag = 'Y')
"
"                 WHERE( pcc_bu = p_btdln_ref_bu
"
"                       OR ( EXISTS (SELECT 1
"
"                                      FROM corp_inter_co_trans
"
"                                     WHERE (cict_fm_bu = p_bu
"
"                                       AND cict_to_bu = pcc_bu
"
"                                       AND cict_trans_dir = 'U' )
"
"                                        OR ( ( cict_fm_bu = p_bu
"
"                                           AND cict_to_bu = pcc_bu
"
"                                           AND cict_trans_dir = 'B' )
"
"                                        OR ( cict_to_bu = p_bu
"
"                                            AND cict_fm_bu = pcc_bu
"
"                                            AND cict_trans_dir = 'B' ) )) ) )
"
"                    AND EXISTS (SELECT 1
"
"                                  FROM profit_cc_unit_access
"
"                                 WHERE( ( pcua_trgt_bu = pcc_bu
"
"                                   AND pcua_trgt_ac_plnt = pcc_ac_plnt
"
"                                   AND pcua_trgt_ac_lvl1 = pcc_ac_lvl1
"
"                                   AND pcua_trgt_ac_lvl2 = pcc_ac_lvl2
"
"                                   AND pcua_trgt_ac_lvl3 = pcc_ac_lvl3
"
"                                   AND pcua_trgt_ac_lvl4 = pcc_ac_lvl4
"
"                                   AND pcua_trgt_ac_lvl5 = pcc_ac_lvl5
"
"                                   AND pcua_trgt_ac_lvl6 = pcc_ac_lvl6
"
"                                   AND pcua_trgt_ac_lvl_prj = pcc_ac_lvl_prj )
"
"                                      OR ( pcua_trgt_bu = pcc_bu
"
"                                           AND pcua_trgt_ac_plnt = pcc_ac_plnt
"
"                                           AND pcua_trgt_ac_lvl1 IS NULL )
"
"                                      OR ( pcua_trgt_bu = pcc_bu
"
"                                           AND pcua_trgt_ac_plnt IS NULL
"
"                                           AND pcua_trgt_ac_lvl1 IS NULL ) )
"
"                                   AND pcua_user_id = p_user
"
"                                   AND pcua_bu = p_bu)
"
"                    AND party_id = p_btdln_lgr_bfcry_id;
"
"
"
"                cr1 c1%rowtype;
"
"                 v_bs_lvl  VARCHAR2(5);
"
"            BEGIN
"
"              SELECT glmctrl_bs_level
"
"                      INTO  v_bs_lvl
"
"                     FROM glm_control
"
"                   WHERE glmctrl_bu = p_bu;
"
"
"
"           IF v_bs_lvl = 'E' THEN
"
"                OPEN c1;
"
"                FETCH c1 INTO cr1;
"
"                IF c1%found THEN
"
"                    IF p_btdln_lgr_bfcry_id <> cr1.party_id THEN
"
"                        NULL;
"
"                    ELSE
"
"                        p_btdln_lvl1        := cr1.pcc_ac_lvl1;
"
"                        p_btdln_lvl2        := cr1.pcc_ac_lvl2;
"
"                        p_btdln_lvl3        := cr1.pcc_ac_lvl3;
"
"                        p_btdln_lvl4        := cr1.pcc_ac_lvl4;
"
"                        p_btdln_lvl5        := cr1.pcc_ac_lvl5;
"
"                        p_btdln_lvl6        := cr1.pcc_ac_lvl6;
"
"                        p_btdln_lvl_prj     := cr1.pcc_ac_lvl_prj;
"
"                        p_btdln_acct_plant  := cr1.pcc_ac_plnt;
"
"                        p_btdln_cc_name     := cr1.pcc_desc;
"
"                        p_btdln_cc_code     := cr1.pcc_cc_code;
"
"                        p_btdln_plnt_loc_id := cr1.pcc_ac_plnt_loc_id;
"
"                    END IF;
"
"                ELSE
"
"                    NULL;
"
"                END IF;
"
"             END IF;
"
"            END;
"
"
"
"        END IF;
"
"    END IF;
"
"
"
"    IF p_btdln_bfcry_type IN ( 'S', 'C' ) AND p_btdln_lgr_bfcry_id IS NOT NULL THEN
"
"--          Raise_Application_Error(-20999,p_btdln_bfcry_type||'/'||p_btdln_lgr_bfcry_id);
"
"        BEGIN
"
"            SELECT ssl_state_code,
"
"                   ssl_gst_no,
"
"                   ssl_gst_type,
"
"                   ssl_type,
"
"                   p_btdln_lgr_bfcry_desc,
"
"                   --substr(ssl_gst_no, 3, 10),
"
"                   --'W',
"
"                   suplr_pan_no
"
"              INTO p_btdln_state_code,
"
"                   p_btdln_gstin_no,
"
"                   p_btdln_gst_type,
"
"                   p_btdln_suplr_type,
"
"                   p_btdln_gst_sulr_name,
"
"                   --p_btdln_gst_pan_no,
"
"                   --p_btdln_gst_pan_avail,
"
"                   p_btdln_gst_pan_no
"
"              FROM suppliers,
"
"                   suplr_ship_loc
"
"             WHERE suplr_bu = ssl_bu
"
"               AND ssl_bu = p_bu
"
"               AND suplr_suplr_id = ssl_suplr_id
"
"               AND suplr_suplr_id = p_btdln_lgr_bfcry_id
"
"               AND ssl_dflt_flg IN ( 'B', 'S', 'D' );
"
"         -- Raise_Application_Error(-20999,p_btdln_bfcry_type||'/'||p_btdln_lgr_bfcry_id||'-'||p_btdln_state_code);
"
"        EXCEPTION WHEN no_data_found THEN
"
"                NULL;
"
"            WHEN too_many_rows THEN
"
"                NULL;
"
"        END;
"
"    END IF;
"
"    IF p_btdln_gst_pan_no IS NULL THEN
"
"        p_btdln_gst_pan_avail := 'O';
"
"       -- p_btdln_gst_pan_no := NULL;
"
"    ELSIF p_btdln_gst_pan_no IS NOT NULL THEN
"
"        p_btdln_gst_pan_avail := 'W';
"
"        --p_btdln_gst_pan_no := substr(p_btdln_gstin_no, 3, 10);
"
"    END IF;
"
"
"
"
"
"END proc_web_pay_acct_party_dtls;
"
"
"
"PROCEDURE proc_assign_tax_dtls (p_bu                   IN VARCHAR2,
"
"                                p_ord_no               IN VARCHAR2,
"
"                                p_seq_no               IN NUMBER,
"
"                                p_btdln_hsn_code       IN VARCHAR2,
"
"                                p_btdln_suplr_type     IN VARCHAR2,
"
"                                p_btdln_tax_assess_val IN NUMBER,
"
"                                p_btdln_tax_pct        OUT NUMBER,
"
"                                p_btdln_cgst_amt       OUT NUMBER,
"
"                                p_btdln_sgst_amt       OUT NUMBER,
"
"                                p_btdln_igst_amt       OUT NUMBER,
"
"                                p_btdln_utgst_amt      OUT NUMBER,
"
"                                p_btdln_cess_pct       OUT NUMBER,
"
"                                p_btdln_cess_amt       OUT NUMBER)
"
"    IS
"
"
"
"    CURSOR c1
"
"      IS
"
"    SELECT ghc_hsn_code
"
"      FROM gst_hsn_codes
"
"     WHERE ghc_hsn_code = p_btdln_hsn_code
"
"       AND EXISTS (SELECT 1
"
"                     FROM hsn_sac_tax_rates
"
"                    WHERE hstr_bu = p_bu
"
"                      AND hstr_hsnsac_code = ghc_hsn_code
"
"                      AND hstr_status = 'A');
"
"
"
"    CURSOR c2
"
"      IS
"
"    SELECT *
"
"      FROM hsn_sac_tax_rates
"
"     WHERE hstr_bu          = p_bu
"
"       AND hstr_hsnsac_code = p_btdln_hsn_code
"
"       AND hstr_status      = 'A'
"
"       AND sysdate BETWEEN hstr_date_from AND hstr_date_to;
"
"
"
"    CURSOR c3
"
"      IS
"
"    SELECT *
"
"      FROM bank_trans_dist_ln
"
"     WHERE btdln_bu = p_bu
"
"       AND btdln_ord_no = p_ord_no
"
"       AND btdln_seq_no = p_seq_no;
"
"
"
"    cr1 c1%rowtype;
"
"    cr2 c2%rowtype;
"
"    cr3 c3%rowtype;
"
"BEGIN
"
"    IF p_btdln_hsn_code IS NOT NULL THEN
"
"    --pkg_bank_cash_details.proc_valid_hsn(p_bu,NULL,p_ord_no);
"
"        OPEN c1;
"
"        FETCH c1 INTO cr1;
"
"        IF c1%notfound THEN
"
"            raise_application_error(-20999, 'HSN Code Not Found.');
"
"        END IF;
"
"        CLOSE c1;
"
"        OPEN c2;
"
"        FETCH c2 INTO cr2;
"
"        IF c2%found THEN
"
"            IF p_btdln_suplr_type = 'L' THEN
"
"                p_btdln_tax_pct   := cr2.hstr_cgst_tax_pct + cr2.hstr_sgst_tax_pct ;
"
"                p_btdln_cgst_amt  := ( ( p_btdln_tax_assess_val / 100 ) * cr2.hstr_cgst_tax_pct );
"
"                p_btdln_sgst_amt  := ( ( p_btdln_tax_assess_val / 100 ) * cr2.hstr_sgst_tax_pct );
"
"                p_btdln_igst_amt  := 0;
"
"                p_btdln_utgst_amt := 0;
"
"                p_btdln_cess_pct  := cr2.hstr_gst_cess_tax_pct;
"
"                p_btdln_cess_amt  := ( ( p_btdln_tax_assess_val / 100 ) * cr2.hstr_gst_cess_tax_pct );
"
"            ELSIF p_btdln_suplr_type = 'I' THEN
"
"                p_btdln_tax_pct   := cr2.hstr_igst_tax_pct ;
"
"                p_btdln_cgst_amt  := 0;
"
"                p_btdln_sgst_amt  := 0;
"
"                p_btdln_igst_amt  := ( ( p_btdln_tax_assess_val / 100 ) * cr2.hstr_igst_tax_pct );
"
"                p_btdln_utgst_amt := 0;
"
"                p_btdln_cess_pct  := cr2.hstr_gst_cess_tax_pct;
"
"                p_btdln_cess_amt  := ( ( p_btdln_tax_assess_val / 100 ) * cr2.hstr_gst_cess_tax_pct );
"
"            ELSIF p_btdln_suplr_type = 'U' THEN
"
"            --proc_debug_proc(p_btdln_tax_assess_val||'~'||( ( p_btdln_tax_assess_val / 100 ) * cr2.hstr_cgst_tax_pct )||'~'||'GST');
"
"                p_btdln_tax_pct   := cr2.hstr_cgst_tax_pct + cr2.hstr_utgst_tax_pct ;
"
"                p_btdln_cgst_amt  := ( ( p_btdln_tax_assess_val / 100 ) * cr2.hstr_cgst_tax_pct );
"
"                p_btdln_sgst_amt  := 0;
"
"                p_btdln_igst_amt  := 0;
"
"                p_btdln_utgst_amt := ( ( p_btdln_tax_assess_val / 100 ) * cr2.hstr_utgst_tax_pct );
"
"                p_btdln_cess_pct  := cr2.hstr_gst_cess_tax_pct;
"
"                p_btdln_cess_amt  := ( ( p_btdln_tax_assess_val / 100 ) * cr2.hstr_gst_cess_tax_pct );
"
"            ELSIF p_btdln_suplr_type IS NULL THEN
"
"                p_btdln_tax_pct   := 0;
"
"                p_btdln_cgst_amt  := 0;
"
"                p_btdln_sgst_amt  := 0;
"
"                p_btdln_igst_amt  := 0;
"
"                p_btdln_utgst_amt := 0;
"
"                p_btdln_cess_pct  := 0;
"
"                p_btdln_cess_amt  := 0;
"
"            END IF;
"
"        ELSE
"
"          raise_application_error(-20999, 'HSN Code Not Found.');
"
"        END IF;
"
"        OPEN c3;
"
"        FETCH c3 INTO cr3;
"
"        IF c3%FOUND AND cr3.btdln_supply_type = 'A' THEN
"
"          p_btdln_tax_pct  := 0;
"
"          p_btdln_cgst_amt := 0;
"
"          p_btdln_sgst_amt := 0;
"
"          p_btdln_igst_amt := 0;
"
"          p_btdln_utgst_amt:= 0;
"
"          p_btdln_cess_pct := 0;
"
"          p_btdln_cess_amt := 0;
"
"        END IF;
"
"     CLOSE c3;
"
"    ELSE   /* HSN COde Is NULL*/
"
"      p_btdln_tax_pct  := 0;
"
"      p_btdln_cgst_amt := 0;
"
"      p_btdln_sgst_amt := 0;
"
"      p_btdln_igst_amt := 0;
"
"      p_btdln_utgst_amt:= 0;
"
"      p_btdln_cess_pct := 0;
"
"      p_btdln_cess_amt := 0;
"
"    END IF;
"
"END proc_assign_tax_dtls;
"
"
"
"    PROCEDURE proc_dill_down(p_bu         VARCHAR2,
"
"                             p_doc_pfx    VARCHAR2,
"
"                             p_doc_no     VARCHAR2,
"
"                             p_where      VARCHAR2,
"
"                             p_session    VARCHAR2,
"
"                             p_global_user VARCHAR2,
"
"                             p_global_p    VARCHAR2,
"
"                             p_global_schema VARCHAR2,
"
"                             p_url    OUT VARCHAR2,
"
"                             p_bank          VARCHAR2 DEFAULT NULL,
"
"                             p_plnt          VARCHAR2 DEFAULT NULL)
"
"      IS
"
"      CURSOR c1
"
"        IS
"
"      SELECT par_doc_type,
"
"             par_vou_type,
"
"             par_src_doc_no,
"
"             par_src_doc_pfx,
"
"             pdd_plant,
"
"             par_pfx,
"
"             par_doc_no
"
"        FROM pending_payables_vw_hist_rev
"
"       WHERE par_bu          = p_bu
"
"         AND par_pfx         = p_doc_pfx
"
"         AND par_doc_no      = p_doc_no
"
"         AND p_where         = 'PP'
"
"      UNION
"
"      SELECT par_doc_type,
"
"             par_vou_type,
"
"             par_src_doc_no,
"
"             par_src_doc_pfx,
"
"             pdd_plant,
"
"             par_pfx,
"
"             par_doc_no
"
"        FROM pending_receivable_vw_hist_rev
"
"       WHERE par_bu          = p_bu
"
"         AND par_pfx         = p_doc_pfx
"
"         AND par_doc_no      = p_doc_no
"
"         AND p_where         = 'PR'
"
"     UNION
"
"      SELECT par_doc_type,
"
"             par_vou_type,
"
"             par_src_doc_no,
"
"             par_src_doc_pfx,
"
"             pdd_plant,
"
"             par_pfx,
"
"             par_doc_no
"
"        FROM pending_payables_stat_vw_hist
"
"       WHERE par_bu = p_bu
"
"         AND par_pfx         = p_doc_pfx
"
"         AND par_doc_no      = p_doc_no
"
"         AND p_where         = 'PPS';
"
"
"
"     CURSOR c2
"
"        IS
"
"      SELECT DECODE(aprh_rqst_type,'PO',aprh_po_pfx,'PI','PI','SC',aprh_po_pfx) aprh_pfx,
"
"             DECODE(aprh_rqst_type,'PO',aprh_po_no,'PI',aprh_pi_no,'SC',aprh_po_no) aprh_no,
"
"             DECODE(aprh_rqst_type,'PO','PO','PI','PI','SC','SCO','N','N') doc_type,
"
"             aprh_plnt,
"
"             aprh_doc_no
"
"        FROM adv_pay_rqst_hd
"
"       WHERE aprh_bu = p_bu
"
"         AND aprh_doc_no = p_doc_no;
"
"         --AND aprh_rqst_type IN ('PO','PI','SC','N');
"
"
"
"     CURSOR c3
"
"        IS
"
"      SELECT DECODE(pard_ord_type,'SO',pard_ord_pfx,'PI',pard_pi_pfx) aprh_pfx,
"
"             DECODE(pard_ord_type,'SO',pard_ord_no,'PI',pard_pi_no) aprh_no,
"
"             DECODE(pard_ord_type,'SO','SO','PI','PI') doc_type,
"
"             pard_plnt,
"
"             pard_doc_no
"
"        FROM adv_rcpt_doc_vw
"
"       WHERE pard_bu = p_bu
"
"         --AND (pard_prop_adv_amt - (pard_rct_amt + pard_rct_inprog_amt)) > 0
"
"         AND pard_status ='P'
"
"         --AND pard_ord_type IN ('PI','SO')
"
"         AND pard_doc_no = p_doc_no;
"
"
"
"     CURSOR c4
"
"       IS
"
"     SELECT phhd_pyrl_no,
"
"            phhd_year,
"
"            phhd_period,
"
"            phhd_process_batch_no
"
"       FROM payroll_hist_view
"
"      WHERE phhd_bu = p_bu
"
"        AND phhd_pyrl_no = p_doc_no;
"
"
"
"     CURSOR c5
"
"       IS
"
"     SELECT BTRANSH_ORD_PFX,BTRANSH_ORD_NO
"
"       FROM BANK_TRANS_MULTI_CHQ_VW
"
"      where BTRANSH_BU= p_bu
"
"        AND btransh_status not in ('V','C','X')
"
"        and btransh_type IN('BT','CV')
"
"        and BTRANSH_BANK_ID = p_bank
"
"        and BTRANSH_PLANT   = p_plnt
"
"        AND BTRANSH_ORD_PFX = p_doc_pfx
"
"        AND BTRANSH_ORD_NO  = p_doc_no
"
"        AND p_where         = 'VOID';
"
"
"
"
"
"      cr1  c1%ROWTYPE;
"
"      cr2  c2%ROWTYPE;
"
"      cr3  c3%ROWTYPE;
"
"      cr4  c4%ROWTYPE;
"
"      cr5  c5%ROWTYPE;
"
"
"
"      v_doc_type       VARCHAR2(10);
"
"      v_pfx_type       VARCHAR2(10);
"
"      v_apex_page_no   NUMBER;
"
"      v_apex_appl_no   NUMBER;
"
"      v_param_id       VARCHAR2(2000);
"
"      v_param_val      VARCHAR2(2000);
"
"      v_model_url      VARCHAR2(2000);
"
"      v_ord_pfx        VARCHAR2(10);
"
"      v_ord_no         VARCHAR2(40);
"
"      v_plant          VARCHAR2(10);
"
"      v_link           VARCHAR2(2000);
"
"      v_app_no         NUMBER(5);
"
"      v_page_alias     VARCHAR2 (2000);
"
"      v_app_alias      VARCHAR2(2000);
"
"      v_checksum       VARCHAR2(4000);
"
"      v_string         VARCHAR2(2000);
"
"      v_raw            RAW(2000);
"
"      v_hash           RAW(2000);
"
"      v_si_doc_no      sales_invoices_hd.sihd_doc_no%TYPE;
"
"    BEGIN
"
"
"
"        IF  p_where IN ('PP','PR','PPS') THEN /* Pending Payable And Pending Receivable*/
"
"         OPEN c1;
"
"         FETCH c1 INTO cr1;
"
"         --raise_application_error(-20999,p_where||'/'||p_doc_pfx||'/'||p_doc_no);
"
"
"
"          IF  c1%FOUND THEN
"
"
"
"          --raise_application_error(-20999,cr1.par_doc_type||'/'||cr1.par_vou_type||'/'||cr1.par_doc_type);
"
"          --proc_debug_proc(cr1.par_doc_type||'~'||cr1.par_vou_type);
"
"           IF (cr1.par_doc_type IN ('P','R','CV','JV') OR (cr1.par_vou_type IN ('BPV','BRV','CPV','CRV','JV') AND cr1.par_doc_type IN ('CN','DN'))) THEN
"
"        --raise_application_error(-20999,v_doc_type||'-'||v_ord_pfx||'-'||v_ord_no);
"
"             BEGIN
"
"               SELECT btrans_type||btrans_trans_mode,btrans_ord_pfx,btrans_ord_no
"
"                 INTO v_doc_type,v_ord_pfx,v_ord_no
"
"                 FROM bank_trans_hist_vw
"
"                WHERE btrans_bu = p_bu
"
"                  AND btrans_ord_pfx = cr1.par_src_doc_pfx
"
"                  AND btrans_ord_no  = cr1.par_src_doc_no;
"
"                   IF v_doc_type = 'BTP' THEN
"
"                      v_pfx_type := 'BPV';
"
"                      v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                      v_param_val:= v_ord_pfx||','||v_ord_no||',NAV';
"
"                   ELSIF  v_doc_type = 'BTR' THEN
"
"                      v_pfx_type := 'BRV';
"
"                      v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                      v_param_val:= v_ord_pfx||','||v_ord_no||',NAV';
"
"                   ELSIF v_doc_type = 'CTP' THEN
"
"                      v_pfx_type := 'CPV';
"
"                      v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                      v_param_val:= v_ord_pfx||','||v_ord_no||',NAV';
"
"                   ELSIF  v_doc_type = 'CTR' THEN
"
"                      v_pfx_type := 'CRV';
"
"                      v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                      v_param_val:= v_ord_pfx||','||v_ord_no||',NAV';
"
"                   ELSIF  v_doc_type = 'JTP' THEN
"
"                      v_pfx_type := 'JV';
"
"                      v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                      v_param_val:= v_ord_pfx||','||v_ord_no||',JOURNAL_VOUCHER';
"
"                   ELSIF  v_doc_type = 'CVI' THEN
"
"                      v_pfx_type := 'CV';
"
"                      v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                      v_param_val:= v_ord_pfx||','||v_ord_no||',NAV';
"
"                   ELSIF  v_doc_type = 'CVO' THEN
"
"                      v_pfx_type := 'CV';
"
"                      v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                      v_param_val:= v_ord_pfx||','||v_ord_no||',NAV';
"
"                   END IF;
"
"           -- raise_application_error(-20999,v_pfx_type||'-'||v_param_id||'-'||v_param_val||'-/-'||cr1.par_doc_type||'-'||cr1.par_doc_type||'-'|| p_where);
"
"               EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                 v_doc_type := NULL;
"
"               END;
"
"             --  raise_application_error(-20999,v_pfx_type||'-'||v_param_id||'-'||v_param_val);
"
"           ELSIF ((cr1.par_doc_type IN ('SB','CN','DN')) OR (cr1.par_doc_type IN ('CN','DN') AND cr1.par_vou_type IN ('SB') AND p_where         = 'PPS')) THEN
"
"                 BEGIN
"
"                 --RAISE_APPLICATION_ERROR(-20999,cr1.par_pfx||'~'||cr1.par_doc_no);
"
"                   SELECT suphd_doc_type,suphd_pfx,suphd_doc_no
"
"                     INTO v_doc_type,v_ord_pfx,v_ord_no
"
"                     FROM suplr_doc_hd_hist_vw1
"
"                    WHERE suphd_bu = p_bu
"
"                      AND suphd_pfx    = cr1.par_pfx
"
"                      AND suphd_doc_no = cr1.par_doc_no;
"
"
"
"                    IF v_doc_type  = 'SB' THEN
"
"                       v_pfx_type := 'SB';
"
"                       v_param_id := 'SUPHD_PFX,SUPHD_DOC_NO,NAVI_TYPE';
"
"                       v_param_val:= v_ord_pfx||','||v_ord_no||','||'NAV';
"
"                    END IF;
"
"                    IF v_doc_type  IN ('CN','DN') AND p_where IN ( 'PPS','PR','PP')  THEN --PP added by yuvaraj 08-01-2025
"
"                    --RAISE_APPLICATION_ERROR(-20999,'1');
"
"                       v_pfx_type := 'SB';
"
"                       v_param_id := 'SUPHD_PFX,SUPHD_DOC_NO,NAVI_TYPE';
"
"                       v_param_val:= v_ord_pfx||','||v_ord_no||','||'NAV';
"
"                    END IF;
"
"
"
"                   EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                     v_doc_type := NULL;
"
"                 END;
"
"           ELSIF cr1.par_doc_type IN ('SI','DN','CN') THEN
"
"             --raise_application_error(-20999,cr1.par_src_doc_pfx ||'~'||cr1.par_src_doc_no||'~'||cr1.pdd_plant);
"
"                     BEGIN
"
"                     SELECT sihd_vou_type,sihd_doc_no
"
"                       INTO v_doc_type,v_si_doc_no
"
"                       FROM sales_invoices_hd
"
"                      WHERE sihd_bu = p_bu
"
"                        AND sihd_plant = cr1.pdd_plant
"
"                        AND (sihd_inv_pfx = cr1.par_src_doc_pfx  OR sihd_doc_pfx = cr1.par_src_doc_pfx)
"
"                        AND (sihd_inv_no = cr1.par_src_doc_no OR sihd_doc_no = cr1.par_src_doc_no);
"
"
"
"                         IF v_doc_type IN ('SIDE','SIFA','SIFR','SIFS','SIG','SISCR','SIS','SIT','SISUP','SI') THEN
"
"                            v_pfx_type := 'SI';
"
"                            v_param_id := 'SIHD_PLANT,SIHD_DOC_NO,PAGE_NAVI';
"
"                            v_param_val:= cr1.pdd_plant||','||v_si_doc_no||','||'INVOICE';
"
"
"
"                         ELSIF v_doc_type IN ('CN','DNIC','CNOT','CNSR','CNSI') THEN
"
"                            v_pfx_type := 'CN';
"
"                            v_param_id := 'SIHD_PLANT,SIHD_DOC_NO,PAGE_NAVI';
"
"                            v_param_val:= cr1.pdd_plant||','||v_si_doc_no||','||'CREDIT_NOTE';
"
"                         ELSIF v_doc_type IN ('DN','DNIV','DNOT','DNPR','DNSI') THEN
"
"                            v_pfx_type := 'DN';
"
"                            v_param_id := 'SIHD_PLANT,SIHD_DOC_NO,PAGE_NAVI';
"
"                            v_param_val:= cr1.pdd_plant||','||v_si_doc_no||','||'DEBIT_NOTE';
"
"                        END IF;
"
"                    EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                        BEGIN
"
"                           SELECT suphd_doc_type,suphd_pfx,suphd_doc_no
"
"                             INTO v_doc_type,v_ord_pfx,v_ord_no
"
"                             FROM suplr_doc_hd_hist_vw1
"
"                            WHERE suphd_bu = p_bu
"
"                              AND suphd_pfx    = cr1.par_src_doc_pfx
"
"                              AND suphd_doc_no = cr1.par_src_doc_no;
"
"
"
"                            IF v_doc_type  = 'SB' THEN
"
"                               v_pfx_type := 'SB';
"
"                               v_param_id := 'SUPHD_PFX,SUPHD_DOC_NO,NAVI_TYPE';
"
"                               v_param_val:= v_ord_pfx||','||v_ord_no||','||'NAV';
"
"                            END IF;
"
"
"
"                           EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                             v_doc_type := NULL;
"
"                         END;
"
"                    END;
"
"        CLOSE c1;
"
"        END IF;
"
"        END IF;
"
"        ELSIF p_where         = 'VOID' THEN /* Void/Clear*/
"
"           OPEN c5;
"
"           FETCH c5 INTO cr5;
"
"           BEGIN
"
"               SELECT btrans_type||btrans_trans_mode,btrans_ord_pfx,btrans_ord_no
"
"                 INTO v_doc_type,v_ord_pfx,v_ord_no
"
"                 FROM bank_trans_hist_vw
"
"                WHERE btrans_bu = p_bu
"
"                  AND btrans_ord_pfx = cr5.BTRANSH_ORD_PFX
"
"                  AND btrans_ord_no  = cr5.BTRANSH_ORD_NO;
"
"                   IF v_doc_type = 'BTP' THEN
"
"                      v_pfx_type := 'BPV';
"
"                      v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                      v_param_val:= v_ord_pfx||','||v_ord_no||',NAV';
"
"                   ELSIF  v_doc_type = 'BTR' THEN
"
"                      v_pfx_type := 'BRV';
"
"                      v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                      v_param_val:= v_ord_pfx||','||v_ord_no||',NAV';
"
"                   ELSIF v_doc_type = 'CTP' THEN
"
"                      v_pfx_type := 'CPV';
"
"                      v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                      v_param_val:= v_ord_pfx||','||v_ord_no||',NAV';
"
"                   ELSIF  v_doc_type = 'CTR' THEN
"
"                      v_pfx_type := 'CRV';
"
"                      v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                      v_param_val:= v_ord_pfx||','||v_ord_no||',NAV';
"
"                   ELSIF  v_doc_type = 'JTP' THEN
"
"                      v_pfx_type := 'JV';
"
"                      v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                      v_param_val:= v_ord_pfx||','||v_ord_no||',JOURNAL_VOUCHER';
"
"                   ELSIF  v_doc_type = 'CVI' THEN
"
"                      v_pfx_type := 'CV';
"
"                      v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,NAVI_TYPE';
"
"                      v_param_val:= v_ord_pfx||','||v_ord_no||',NAV';
"
"                   ELSIF  v_doc_type = 'CVO' THEN
"
"                      v_pfx_type := 'CV';
"
"                      v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,NAVI_TYPE';
"
"                      v_param_val:= v_ord_pfx||','||v_ord_no||',NAV';
"
"                   END IF;
"
"
"
"               EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                 v_doc_type := NULL;
"
"               END;
"
"             CLOSE c5;
"
"         ELSIF p_where         = 'RJV' THEN /* Recuring Journal*/
"
"         --RAISE_APPLICATION_ERROR(-20999,p_doc_pfx);
"
"           SELECT doc_type ,ord_pfx,ord_no
"
"             INTO v_doc_type,v_ord_pfx,v_ord_no
"
"             FROM(
"
"           SELECT btrans_type||btrans_trans_mode doc_type ,btrans_ord_pfx ord_pfx,btrans_ord_no ord_no
"
"                 FROM bank_trans_hist_vw
"
"                WHERE btrans_bu = p_bu
"
"                  AND btrans_ord_pfx = p_doc_pfx
"
"                  AND btrans_ord_no  = p_doc_no
"
"            UNION
"
"            SELECT suphd_doc_type,suphd_pfx,suphd_doc_no
"
"              FROM suplr_doc_hd_hist_vw1
"
"             WHERE suphd_bu = p_bu
"
"               AND suphd_pfx    = p_doc_pfx
"
"               AND suphd_doc_no = p_doc_no);
"
"
"
"                   IF v_doc_type = 'BTP' THEN
"
"                      v_pfx_type := 'BPV';
"
"                      v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                      v_param_val:= v_ord_pfx||','||v_ord_no||',NAV';
"
"                   ELSIF v_doc_type = 'CTP' THEN
"
"                      v_pfx_type := 'CPV';
"
"                      v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                      v_param_val:= v_ord_pfx||','||v_ord_no||',NAV';
"
"                   ELSIF v_doc_type  = 'SB' THEN
"
"                       v_pfx_type := 'SB';
"
"                       v_param_id := 'SUPHD_PFX,SUPHD_DOC_NO,NAVI_TYPE';
"
"                       v_param_val:= v_ord_pfx||','||v_ord_no||','||'NAV';
"
"                   END IF;
"
"        ELSIF p_where = 'PPA' THEN  /* Pending Payable Advance*/
"
"          /*OPEN c2;
"
"          FETCH c2 INTO cr2;
"
"          IF cr2.doc_type = 'N' THEN
"
"             RAISE_APPLICATION_ERROR(-20999,'N/A Type Advance doc. not allowed');
"
"          ELSIF cr2.doc_type = 'PI' THEN
"
"             RAISE_APPLICATION_ERROR(-20999,'Proforma Invoice Type Advance doc. not allowed');
"
"          END IF;
"
"          IF c2%FOUND THEN
"
"             IF cr2.doc_type ='PO' THEN
"
"                v_pfx_type := 'PO';
"
"                v_param_id := 'POH_ORDER_NO,PAGE_NAVI';
"
"                v_param_val:= cr2.aprh_no||','||'PURCHASE_ORDER';
"
"             ELSIF cr2.doc_type = 'PI' THEN
"
"                v_pfx_type := 'PI';
"
"                v_param_id := 'PIHD_PLNT,PIHD_DOC_NO,PAGE_NAVI';
"
"                v_param_val:= cr2.aprh_plnt||','||cr2.aprh_no||','||'PROFORMA_INVOICE';
"
"             ELSIF cr2.doc_type = 'SCO' THEN
"
"                v_pfx_type := 'SCO';
"
"                v_param_id := 'POH_ORDER_NO,PAGE_NAVI';
"
"                v_param_val:= cr2.aprh_no||','||'SUB_CONTRACT_ORDER';
"
"            END IF;
"
"          END IF;
"
"          CLOSE c2;*/
"
"          OPEN c2;
"
"          FETCH c2 INTO cr2;
"
"          IF c2%FOUND THEN
"
"            SELECT WBF_APPL_NO
"
"              INTO v_apex_appl_no
"
"              FROM wapl_bus_fun
"
"             WHERE WBF_BUS_FUN_ID ='APM1135';
"
"            v_apex_page_no := 116131136;
"
"            v_param_id := 'APRH_DOC_NO,PAGE_NAV';
"
"            v_param_val:= cr2.aprh_doc_no||','||'ADV_PYMNT_REQ';
"
"          END IF;
"
"          CLOSE c2;
"
"        ELSIF p_where = 'PRA' THEN/* Pending Receivable Advance*/
"
"           /*OPEN c3;
"
"           FETCH c3 INTO cr3;
"
"           IF c3%FOUND THEN
"
"             IF cr3.doc_type ='SO' THEN
"
"                v_pfx_type := 'SO';
"
"                v_param_id := 'SOH_ORDER_PFX,SOH_ORDER_NO,PAGE_NAV';
"
"                v_param_val:= cr3.aprh_pfx||','||cr3.aprh_no||','||'SALES_ORDER';
"
"             ELSIF cr3.doc_type = 'PI' THEN
"
"                v_pfx_type := 'PI';
"
"                v_param_id := 'PIHD_PLNT,PIHD_DOC_NO,PAGE_NAVI';
"
"                v_param_val:= cr3.pard_plnt||','||'PROFORMA_INVOICE';
"
"             END IF;
"
"           END IF;
"
"           CLOSE c3;*/
"
"           OPEN c3;
"
"           FETCH c3 INTO cr3;
"
"           IF c3%FOUND THEN
"
"           SELECT WBF_APPL_NO
"
"             INTO v_apex_appl_no
"
"             FROM wapl_bus_fun
"
"            WHERE WBF_BUS_FUN_ID ='ARM1011';
"
"            v_apex_page_no := 11813101101;
"
"            v_param_id := 'PARD_DOC_NO,PAGE_NAV';
"
"            v_param_val:= cr3.pard_doc_no||','||'ADV_RCPT_REQ';
"
"           END IF;
"
"           CLOSE c3;
"
"        ELSIF p_where = 'PPPA' THEN /* Pending Payment Advice*/
"
"
"
"                v_pfx_type := 'PA';
"
"                v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                v_param_val:= p_doc_pfx||','||p_doc_no||',PAYMENT_ADVICE';
"
"        ELSIF p_where = 'PPP' THEN /* Pending Payment Payroll*/
"
"           OPEN c4;
"
"           FETCH c4 INTO cr4;
"
"
"
"                v_apex_appl_no := 9004;
"
"                v_apex_page_no := 607;--16251310501;--38;--16251310506;
"
"                v_param_id := 'BATCH_NO,PYRL_NO,PRO_PAY_EMP_TYP,PAGE_NAVI,NAVI_TYPE';
"
"                v_param_val:= cr4.phhd_process_batch_no||','||cr4.phhd_pyrl_no||','||'PRA'||','||'NAV';
"
"           CLOSE c4;
"
"        END IF;
"
"        IF v_pfx_type IS NOT NULL AND v_apex_appl_no IS NULL AND v_apex_page_no IS NULL THEN
"
"           BEGIN
"
"             SELECT apt_appl_no,
"
"                    apt_page_no
"
"               INTO v_apex_appl_no,
"
"                    v_apex_page_no
"
"               FROM appl_pfx_types
"
"              WHERE apt_bu = p_bu
"
"                AND apt_pfx_type = v_pfx_type;
"
"              EXCEPTION WHEN NO_DATA_FOUND THEN v_apex_appl_no := NULL;  v_apex_page_no:= NULL;
"
"           END;
"
"        END IF;
"
"
"
"             IF v_apex_appl_no IS NULL OR v_apex_page_no IS NULL THEN
"
"                RAISE_APPLICATION_ERROR(-20999,'Application no. or Page no. not defined'||'/'||v_apex_appl_no||'/'||v_apex_page_no||'/'||v_pfx_type);
"
"             END IF;
"
"
"
"             v_param_id := 'P'||v_apex_page_no||'_'|| REPLACE(v_param_id, ',', ',P'||v_apex_page_no||'_');
"
"
"
"             IF v_apex_appl_no IS NOT NULL AND v_apex_page_no IS NOT NULL THEN
"
"           --  PROC_DEBUG_PROC(v_apex_appl_no ||'~'||v_apex_page_no||'~'||v_pfx_type);
"
"               p_url := APEX_UTIL.PREPARE_URL('f?p=' || v_apex_appl_no|| ':'  ||v_apex_page_no||':'||p_session|| '::::'||v_param_id||':'||v_param_val);
"
"             END IF;
"
"
"
"
"
"    END proc_dill_down;
"
" PROCEDURE proc_valid_hsn(p_bu           VARCHAR2,
"
"                          p_doc_pfx      VARCHAR2,
"
"                          p_doc_no       VARCHAR2)
"
"  IS
"
"
"
"  v_bs_lvl            glm_control.glmctrl_bs_level%TYPE := func_find_glm_bs_lvl(p_bu);
"
" CURSOR c1 (c_hsn_code  VARCHAR2)
"
"      IS
"
"    SELECT ghc_hsn_code
"
"      FROM gst_hsn_codes
"
"     WHERE ghc_hsn_code = c_hsn_code
"
"       AND EXISTS (SELECT 1
"
"                     FROM hsn_sac_tax_rates
"
"                    WHERE hstr_bu = p_bu
"
"                      AND hstr_hsnsac_code = ghc_hsn_code
"
"                      AND hstr_status = 'A');
"
"
"
"    CURSOR c2 (c_hsn_code VARCHAR2)
"
"      IS
"
"    SELECT hstr_cgst_tax_pct,hstr_sgst_tax_pct,hstr_igst_tax_pct,hstr_utgst_tax_pct
"
"      FROM hsn_sac_tax_rates
"
"     WHERE hstr_bu          = p_bu
"
"       AND hstr_hsnsac_code = c_hsn_code
"
"       AND hstr_status      = 'A'
"
"       AND sysdate BETWEEN hstr_date_from AND hstr_date_to;
"
"
"
"    CURSOR c3(c_suplr_id VARCHAR2,c_acct    VARCHAR2,c_plnt   VARCHAR2,c_lgr_type VARCHAR2,c_bfcry_type  VARCHAR2)
"
"      IS
"
"    SELECT  spla_plnt d
"
"          FROM suplr_plant_accts
"
"         WHERE spla_bu = p_bu
"
"           AND spla_suplr_id = c_suplr_id
"
"           AND spla_acct  = c_acct
"
"           AND spla_active_flag = 'Y'
"
"           AND ((c_bfcry_type = 'S' AND ((func_find_code_req(p_bu,c_bfcry_type,'SAD') ='S' AND c_lgr_type = spla_lgr_type) OR (func_find_code_req(spla_bu,c_bfcry_type,'SAD') <>'S' OR func_find_code_req(spla_bu,c_bfcry_type,'SAD') IS NULL)))
"
"                OR (c_bfcry_type = 'C' AND ((func_find_code_req(spla_bu,c_bfcry_type,'CAD') ='S' AND c_lgr_type = spla_lgr_type) OR (func_find_code_req(spla_bu,c_bfcry_type,'CAD') <>'S' OR func_find_code_req(spla_bu,c_bfcry_type,'CAD') IS NULL))))
"
"           --AND spla_lgr_type = c_lgr_type
"
"           AND ((spla_plnt = c_plnt AND v_bs_lvl ='U') OR (v_bs_lvl ='E'));
"
"
"
"    cr1 c1%rowtype;
"
"    cr2 c2%rowtype;
"
"    cr3 c3%rowtype;
"
"BEGIN
"
"
"
"    FOR cr0 IN (SELECT *
"
"                  FROM bank_trans_dist_ln
"
"                 WHERE btdln_bu = p_bu
"
"                   AND btdln_ord_no = p_doc_no
"
"                   AND btdln_hsn_code IS NOT NULL)
"
"    LOOP
"
"
"
"        OPEN c1(cr0.btdln_hsn_code);
"
"        FETCH c1 INTO cr1;
"
"        IF c1%notfound THEN
"
"            raise_application_error(-20999, 'HSN Code Not Found.');
"
"        END IF;
"
"        CLOSE c1;
"
"        OPEN c2(cr0.btdln_hsn_code);
"
"        FETCH c2 INTO cr2;
"
"        IF c2%found THEN
"
"            IF cr0.btdln_suplr_type = 'L' THEN
"
"               IF cr2.hstr_cgst_tax_pct = 0  THEN
"
"                  raise_application_error(-20999,'CGST Tax % should be greater then Zero - '||cr0.btdln_hsn_code);
"
"               ELSIF cr2.hstr_sgst_tax_pct =0 THEN
"
"                  raise_application_error(-20999,'SGST Tax % should be greater then Zero - '||cr0.btdln_hsn_code);
"
"               END IF;
"
"            ELSIF cr0.btdln_suplr_type = 'I' THEN
"
"                IF cr2.hstr_igst_tax_pct = 0 THEN
"
"                  raise_application_error(-20999,'IGST Tax % should be greater then Zero - '||cr0.btdln_hsn_code);
"
"               END IF;
"
"            ELSIF cr0.btdln_suplr_type = 'U' THEN
"
"                 IF cr2.hstr_cgst_tax_pct = 0 THEN
"
"                    raise_application_error(-20999,'CGST Tax % should be greater then Zero - '||cr0.btdln_hsn_code);
"
"                 ELSIF  cr2.hstr_utgst_tax_pct =0 THEN
"
"                    raise_application_error(-20999,'UTGST Tax % should be greater then Zero - '||cr0.btdln_hsn_code);
"
"                 END IF;
"
"            END IF;
"
"        END IF;
"
"      CLOSE c2;
"
"    END LOOP;
"
"
"
"    FOR cr_ln IN (SELECT btdln_acct,btdln_seq_no,btdln_lgr_bfcry_id,btdln_acct_type,btdln_bfcry_desc,DECODE(glmctrl_bs_level,'E',NULL,btdln_acct_plant) btdln_acct_plant,btdln_bfcry_type
"
"                  FROM bank_trans_dist_ln,glm_control
"
"                 WHERE btdln_bu = p_bu
"
"                   AND glmctrl_bu = btdln_bu
"
"                   AND btdln_ord_no = p_doc_no
"
"                   AND btdln_lgr_bfcry_id IS NOT NULL
"
"                   AND EXISTS(SELECT 1
"
"                                FROM suppliers
"
"                               WHERE suplr_bu = btdln_bu
"
"                                 AND suplr_suplr_id = btdln_lgr_bfcry_id
"
"                                 AND suplr_party_type IN ('S','C'))
"
"                   AND(btdln_tax_gen_flag ='N' OR (btdln_tax_gen_flag = 'Y' AND btdln_ref_type = 'R' AND (btdln_dist_amt <> 0 OR btdln_tds_exempt_cert_no IS NOT NULL ))))
"
"    LOOP
"
"        OPEN c3(cr_ln.btdln_lgr_bfcry_id, cr_ln.btdln_acct,cr_ln.btdln_acct_plant,cr_ln.btdln_acct_type,cr_ln.btdln_bfcry_type);
"
"        FETCH c3 INTO cr3;
"
"          IF c3%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'Unit not found for Party : '||cr_ln.btdln_bfcry_desc);
"
"
"
"          END IF;
"
"        CLOSE c3;
"
"    END LOOP;
"
"    UPDATE bank_trans_dist_ln
"
"       SET btdln_plnt_loc_id = func_find_dflt_plnt_loc(btdln_bu,btdln_acct_plant)
"
"     WHERE btdln_bu = p_bu
"
"       AND btdln_ord_no = p_doc_no
"
"       AND btdln_plnt_loc_id IS NULL;
"
" END proc_valid_hsn;
"
"
"
" PROCEDURE proc_valid_rj (p_bu           VARCHAR2,
"
"                             p_doc_pfx      VARCHAR2,
"
"                             p_doc_no       VARCHAR2)
"
"    IS
"
"    v_pct    NUMBER;
"
"BEGIN
"
"  FOR cr1 IN (SELECT btdln_seq_no
"
"                FROM bank_trans_dist_ln
"
"               WHERE btdln_bu = p_bu
"
"                 AND btdln_ord_no = p_doc_no
"
"                 AND EXISTS(SELECT 1
"
"                              FROM BANK_TRANS_RECR_ACCT_HIST_VW
"
"                             WHERE BTRAH_BU = btdln_bu
"
"                               AND BTRAH_DOC_NO = btdln_ord_no
"
"                               AND BTRAH_SEQ_NO = btdln_seq_no))
"
"   LOOP
"
"
"
"              SELECT SUM(BTRAH_SHARE_PCT)
"
"                INTO v_pct
"
"                from BANK_TRANS_RECR_ACCT_HIST_VW
"
"               WHERE BTRAH_BU = p_bu
"
"                 AND BTRAH_DOC_NO = p_doc_no
"
"                 AND BTRAH_SEQ_NO = cr1.btdln_seq_no;
"
"   IF v_pct > 0 AND v_pct <100 THEN
"
"    RAISE_APPLICATION_ERROR(-20999,'Recurring Journal sum of share % should be equal to 100 for Line '||cr1.btdln_seq_no);
"
"   END IF;
"
"   END LOOP;
"
" END proc_valid_rj;
"
"
"
" PROCEDURE proc_valid_min_max_exrate(p_bu      VARCHAR2,
"
"                                        p_curr_id VARCHAR2,
"
"                                        p_ex_rate NUMBER)
"
"   IS
"
"      CURSOR c1 IS
"
"       SELECT curcy_chk_rng_flag
"
"         FROM currencies
"
"        WHERE curcy_bu = p_bu
"
"        AND curcy_id = p_curr_id
"
"        AND curcy_usg_flg ='Y';
"
"
"
"    CURSOR c2 IS
"
"     SELECT curcy_min_ex_rate,
"
"            curcy_max_ex_rate
"
"       FROM currencies
"
"      WHERE curcy_bu = p_bu
"
"        AND curcy_id = p_curr_id
"
"        AND p_ex_rate BETWEEN curcy_min_ex_rate AND curcy_max_ex_rate
"
"        AND curcy_usg_flg ='Y';
"
"
"
"cr1 c1%rowtype;
"
"cr2 c2%rowtype;
"
"v_min_rate  NUMBER(13,8);
"
"v_max_rate  NUMBER(13,8);
"
"BEGIN
"
"    OPEN C1;
"
"     FETCH c1 INTO cr1;
"
"        IF c1%found and cr1.curcy_chk_rng_flag='Y' then
"
"
"
"      SELECT curcy_min_ex_rate,
"
"           curcy_max_ex_rate
"
"      INTO v_min_rate,
"
"           v_max_rate
"
"      FROM currencies
"
"     WHERE curcy_bu = p_bu
"
"       AND curcy_id = p_curr_id;
"
"
"
"       OPEN c2;
"
"         FETCH c2 INTO cr2;
"
"          IF c2%notfound  AND p_ex_rate > 0 THEN
"
"            RAISE_APPLICATION_ERROR(-20999,p_ex_rate||'-'||p_curr_id||' EX. Rate Should be Min. '|| v_min_rate|| ' and Max. '|| v_max_rate);
"
"          END IF;
"
"        CLOSE c2;
"
"        END IF;
"
"    CLOSE c1;
"
"END proc_valid_min_max_exrate;
"
"PROCEDURE proc_valid_pymnl_dist_ln (p_bu             VARCHAR2,
"
"                                    p_btrans_ord_pfx VARCHAR2,
"
"                                    p_btrans_ord_no  VARCHAR2)
"
"IS
"
"  v_dist_ln_cnt     NUMBER;
"
"  v_glm_control     VARCHAR2(1);
"
"BEGIN
"
"  SELECT COUNT(btdln_lgr_bfcry_id)
"
"    INTO v_dist_ln_cnt
"
"    FROM(
"
"  SELECT DISTINCT btdln_lgr_bfcry_id btdln_lgr_bfcry_id
"
"    FROM bank_trans_dist_ln,suppliers
"
"   WHERE btdln_bu = p_bu
"
"     AND btdln_bu = suplr_bu
"
"     AND btdln_ord_no = p_btrans_ord_no
"
"     AND btdln_lgr_bfcry_id IS NOT NULL
"
"     AND suplr_suplr_id = btdln_lgr_bfcry_id
"
"     AND suplr_party_type IN ('S','C'));
"
"
"
"  SELECT glmctrl_alw_multi_party_pymnt
"
"    INTO v_glm_control
"
"    FROM glm_control
"
"   WHERE GLMCTRL_BU = p_bu;
"
"
"
"   IF v_glm_control = 'N' AND v_dist_ln_cnt > 1
"
"     THEN
"
"     RAISE_APPLICATION_ERROR(-20999,'More then one party not allowed.');
"
"    END IF;
"
"END ;
"
"
"
"FUNCTION func_valid_min_max_exrate(p_bu      VARCHAR2,
"
"                                   p_curr_id VARCHAR2,
"
"                                   p_ex_rate NUMBER)
"
"  RETURN VARCHAR2
"
"   IS
"
"      CURSOR c1 IS
"
"       SELECT curcy_chk_rng_flag
"
"         FROM currencies
"
"        WHERE curcy_bu = p_bu
"
"        AND curcy_id = p_curr_id
"
"        AND curcy_usg_flg ='Y';
"
"
"
"    CURSOR c2 IS
"
"     SELECT curcy_min_ex_rate,
"
"            curcy_max_ex_rate
"
"       FROM currencies
"
"      WHERE curcy_bu = p_bu
"
"        AND curcy_id = p_curr_id
"
"        AND p_ex_rate BETWEEN curcy_min_ex_rate AND curcy_max_ex_rate
"
"        AND curcy_usg_flg ='Y';
"
"
"
"cr1 c1%rowtype;
"
"cr2 c2%rowtype;
"
"v_min_rate  NUMBER(13,8);
"
"v_max_rate  NUMBER(13,8);
"
"BEGIN
"
"
"
"    OPEN C1;
"
"     FETCH c1 INTO cr1;
"
"        IF c1%found and cr1.curcy_chk_rng_flag='Y' then
"
"
"
"      SELECT curcy_min_ex_rate,
"
"           curcy_max_ex_rate
"
"      INTO v_min_rate,
"
"           v_max_rate
"
"      FROM currencies
"
"     WHERE curcy_bu = p_bu
"
"       AND curcy_id = p_curr_id;
"
"
"
"       OPEN c2;
"
"         FETCH c2 INTO cr2;
"
"          IF c2%notfound  AND p_ex_rate > 0 THEN
"
"            RETURN(p_ex_rate||'-'||p_curr_id||' EX. Rate Should be Min. '|| v_min_rate|| ' and Max. '|| v_max_rate);
"
"          ELSE
"
"            RETURN NULL;
"
"          END IF;
"
"        CLOSE c2;
"
"        ELSE
"
"           RETURN NULL;
"
"        END IF;
"
"    CLOSE c1;
"
"END func_valid_min_max_exrate;
"
"
"
"PROCEDURE proc_valid_bank_pymnt(p_bu VARCHAR2,p_ord_no VARCHAR2)
"
"IS
"
"      /*CURSOR c1
"
"      IS
"
"         SELECT btr_org_bfcry_type, btr_org_bcfry_id, btr_bfcry_doc_no,btr_proj_id
"
"           FROM bank_trans_ref_det_hist_vw
"
"          WHERE btr_bu = p_bu
"
"            AND btr_ord_no = p_btrans_ord_no
"
"            AND btr_dr_cr_type = 'DR'
"
"            AND btr_org_bcfry_id IS NOT NULL
"
"            AND btr_lgr_type <> 'AD'
"
"            AND btr_agnt_ref = 'I';*/
"
"
"
"      CURSOR c2 /*(
"
"         c_party_type    VARCHAR2,
"
"         c_party_id      VARCHAR2,
"
"         c_bill_no       VARCHAR2,
"
"         c_proj_id       VARCHAR2
"
"         )*/
"
"      IS WITH ap_ar_cs AS (
"
"                    SELECT aadc_bu, aadc_cls_id
"
"                    FROM ap_ar_doc_class
"
"                    WHERE aadc_bu = p_bu
"
"                      AND aadc_doc_type = 'TD'
"
"                ),
"
"                bank_ref_det AS (
"
"                    SELECT btr_bu,
"
"                           btr_bfcry_doc_no,
"
"                           btr_org_bfcry_type,
"
"                           btr_org_bcfry_id
"
"                    FROM bank_trans_ref_det
"
"                    WHERE btr_bu = p_bu
"
"                      AND btr_ord_no = p_ord_no
"
"                      AND btr_dr_cr_type = 'DR'
"
"                      AND btr_org_bcfry_id IS NOT NULL
"
"                      AND btr_lgr_type <> 'AD'
"
"                      AND btr_agnt_ref = 'I'
"
"                ),
"
"                pending_ap AS (
"
"                    SELECT par_bu,
"
"                           par_suplr_doc_no,
"
"                           par_bfcry_type,
"
"                           par_suplr_id,
"
"                           par_cls_id
"
"                    FROM pending_payables_vw_hist_rev
"
"                    WHERE par_bu = p_bu
"
"                      AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                      AND par_status = 'P'
"
"                      AND par_bu = p_bu
"
"                      AND pdd_check_flag = 'N'
"
"                      AND par_doc_type IN ('DN', 'SI', 'P')
"
"                )
"
"                SELECT b.btr_bfcry_doc_no
"
"                FROM bank_ref_det b
"
"                JOIN pending_ap p
"
"                  ON p.par_suplr_doc_no = b.btr_bfcry_doc_no
"
"                 AND p.par_bfcry_type   = b.btr_org_bfcry_type
"
"                 AND p.par_suplr_id     = b.btr_org_bcfry_id
"
"                 AND p.par_bu           = b.btr_bu/*
"
"                WHERE NOT EXISTS (
"
"                    SELECT 1
"
"                    FROM ap_ar_cs a
"
"                    WHERE a.aadc_bu     = p.par_bu
"
"                      AND a.aadc_cls_id = p.par_cls_id
"
"                )*/;
"
"/*
"
"         WITH ap_ar_cs AS(SELECT aadc_bu,aadc_cls_id FROM ap_ar_doc_class WHERE aadc_bu = p_bu AND aadc_doc_type = 'TD'),
"
"              bank_ref_det AS(SELECT btr_bu,btr_bfcry_doc_no,btr_org_bfcry_type,btr_org_bcfry_id
"
"                                FROM bank_trans_ref_det
"
"                               WHERE btr_bu = p_bu
"
"                                 AND btr_ord_no = p_btrans_ord_no
"
"                                 AND btr_dr_cr_type = 'DR'
"
"                                 AND btr_org_bcfry_id IS NOT NULL
"
"                                 AND btr_lgr_type <> 'AD'
"
"                                 AND btr_agnt_ref = 'I'),
"
"              pending_ap AS(SELECT par_bu,par_suplr_doc_no,par_bfcry_type,par_suplr_id,par_cls_id
"
"                              FROM pending_payables_vw_hist_rev
"
"                             WHERE par_bu = p_bu
"
"                               AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                               AND par_status = 'P'
"
"                               AND par_bu = p_bu
"
"                               AND pdd_check_flag = 'N'
"
"                               AND par_doc_type  IN('DN', 'SI', 'P'))
"
"         SELECT btr_bfcry_doc_no
"
"           FROM pending_ap,bank_ref_det
"
"          WHERE par_bu = p_bu
"
"            AND par_suplr_doc_no = btr_bfcry_doc_no
"
"            AND par_bfcry_type = btr_org_bfcry_type
"
"            AND par_suplr_id   = btr_org_bcfry_id
"
"            AND btr_bu = par_bu
"
"            AND NOT EXISTS
"
"                       (SELECT 1
"
"                          FROM ap_ar_cs
"
"                         WHERE aadc_bu = par_bu
"
"                           AND aadc_cls_id = par_cls_id);*/
"
"
"
"      CURSOR c3/* (
"
"         c_party_type    VARCHAR2,
"
"         c_party_id      VARCHAR2,
"
"         c_bill_no       VARCHAR2)*/
"
"      IS
"
"         WITH ap_ar_cs AS (
"
"                SELECT aadc_bu, aadc_cls_id
"
"                FROM ap_ar_doc_class
"
"                WHERE aadc_bu = p_bu
"
"                  AND aadc_doc_type = 'TD'
"
"            ),
"
"            bank_ref_det AS (
"
"                SELECT btr_bu,
"
"                       btr_bfcry_doc_no,
"
"                       btr_org_bfcry_type,
"
"                       btr_org_bcfry_id
"
"                FROM bank_trans_ref_det
"
"                WHERE btr_bu = p_bu
"
"                  AND btr_ord_no = p_ord_no
"
"                  AND btr_dr_cr_type = 'DR'
"
"                  AND btr_org_bcfry_id IS NOT NULL
"
"                  AND btr_lgr_type <> 'AD'
"
"                  AND btr_agnt_ref = 'I'
"
"            ),
"
"            pending_ap AS (
"
"                SELECT par_bu,
"
"                       par_suplr_doc_no,
"
"                       par_bfcry_type,
"
"                       par_suplr_id,
"
"                       par_cls_id
"
"                FROM pending_payables_vw_hist_rev
"
"                WHERE par_bu = p_bu
"
"                  AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                  AND par_status = 'P'
"
"                  AND par_bu = p_bu
"
"                  AND pdd_check_flag = 'N'
"
"                  AND par_doc_type IN ('DN', 'SI', 'P')
"
"            )
"
"            SELECT b.btr_bfcry_doc_no
"
"            FROM bank_ref_det b
"
"            JOIN pending_ap p
"
"              ON p.par_suplr_doc_no = b.btr_bfcry_doc_no
"
"             AND p.par_bfcry_type   = b.btr_org_bfcry_type
"
"             AND p.par_suplr_id     = b.btr_org_bcfry_id
"
"             AND p.par_bu           = b.btr_bu/*
"
"            WHERE  EXISTS (
"
"                SELECT 1
"
"                FROM ap_ar_cs a
"
"                WHERE a.aadc_bu     = p.par_bu
"
"                  AND a.aadc_cls_id = p.par_cls_id
"
"            )*/;
"
"        /*
"
"         WITH ap_ar_cs AS(SELECT aadc_bu,aadc_cls_id FROM ap_ar_doc_class WHERE aadc_bu = p_bu AND aadc_doc_type = 'TD'),
"
"              bank_ref_det AS(SELECT btr_bu,btr_bfcry_doc_no,btr_org_bfcry_type,btr_org_bcfry_id
"
"                                FROM bank_trans_ref_det
"
"                               WHERE btr_bu = p_bu
"
"                                 AND btr_ord_no = p_btrans_ord_no
"
"                                 AND btr_dr_cr_type = 'DR'
"
"                                 AND btr_org_bcfry_id IS NOT NULL
"
"                                 AND btr_lgr_type <> 'AD'
"
"                                 AND btr_agnt_ref = 'I'),
"
"              pending_ap AS(SELECT par_bu,par_suplr_doc_no,par_bfcry_type,par_suplr_id,par_cls_id
"
"                              FROM pending_payables_vw_hist_rev
"
"                             WHERE par_bu = p_bu
"
"                               AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                               AND par_status = 'P'
"
"                               AND par_bu = p_bu
"
"                               AND pdd_check_flag = 'N'
"
"                               AND par_doc_type  IN('DN', 'SI', 'P'))
"
"         SELECT btr_bfcry_doc_no
"
"           FROM pending_ap,ap_ar_cs,bank_ref_det
"
"          WHERE par_bu = p_bu
"
"            AND par_suplr_doc_no = btr_bfcry_doc_no
"
"            AND par_bfcry_type = btr_org_bfcry_type
"
"            AND par_suplr_id   = btr_org_bcfry_id
"
"            AND btr_bu = par_bu
"
"            AND aadc_bu = par_bu
"
"            AND aadc_cls_id = par_cls_id;*/
"
"
"
"      cr2   c2%ROWTYPE;
"
"      cr3   c3%ROWTYPE;
"
"   BEGIN
"
"      --FOR cr1 IN c1
"
"      --LOOP
"
"         OPEN c2;/* (cr1.btr_org_bfcry_type,
"
"                  cr1.btr_org_bcfry_id,
"
"                  cr1.btr_bfcry_doc_no,
"
"                  cr1.btr_proj_id);*/
"
"
"
"         FETCH c2 INTO cr2;
"
"
"
"         IF c2%FOUND
"
"         THEN
"
"            raise_application_error (
"
"               -20999,
"
"               'Debit document exists against the Bill/Doc. No. '
"
"               || cr2.btr_bfcry_doc_no);
"
"         END IF;
"
"
"
"         CLOSE c2;
"
"
"
"         OPEN c3;/* (cr1.btr_org_bfcry_type,
"
"                  cr1.btr_org_bcfry_id,
"
"                  cr1.btr_bfcry_doc_no);*/
"
"
"
"         FETCH c3 INTO cr3;
"
"
"
"         IF c3%FOUND
"
"         THEN
"
"            raise_application_error (
"
"               -20999,
"
"               'Please select the TDS document against the Bill No. '
"
"               || cr3.btr_bfcry_doc_no);
"
"         END IF;
"
"
"
"         CLOSE c3;
"
"      --END LOOP;
"
"   END proc_valid_bank_pymnt;
"
"END pkg_bank_cash_details;"
/
