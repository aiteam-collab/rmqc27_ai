CREATE OR REPLACE
"PACKAGE BODY        pkg_budget
"
"AS
"
"   FUNCTION func_chk_budget_type (p_bu VARCHAR2)
"
"      RETURN VARCHAR2
"
"   IS
"
"      v_bud_type   VARCHAR2 (1);
"
"   BEGIN
"
"      BEGIN
"
"         SELECT glmctrl_bud_type
"
"           INTO v_bud_type
"
"           FROM glm_control
"
"          WHERE glmctrl_bu = p_bu;
"
"      EXCEPTION
"
"         WHEN NO_DATA_FOUND
"
"         THEN
"
"            Raise_Application_Error (-20058, 'GLM' || '~' || p_bu);
"
"      END;
"
"
"
"      RETURN v_bud_type;
"
"   END func_chk_budget_type;
"
"
"
"   FUNCTION func_get_budget_type (p_bu VARCHAR2, p_acct VARCHAR2)
"
"      RETURN VARCHAR2
"
"   IS
"
"      v_sub_grp_type   VARCHAR2 (5);
"
"   BEGIN
"
"      BEGIN
"
"         SELECT CASE WHEN glac_sub_grp_type = 'CWP' THEN 'CB' ELSE 'XB' END
"
"           INTO v_sub_grp_type
"
"           FROM gl_accts
"
"          WHERE glac_bu = p_bu AND glac_acct = p_acct;
"
"      EXCEPTION
"
"         WHEN NO_DATA_FOUND
"
"         THEN
"
"            Raise_Application_Error (-20058,
"
"                                     'GLM' || '~' || p_bu || '~' || p_acct);
"
"      END;
"
"
"
"      RETURN v_sub_grp_type;
"
"   END func_get_budget_type;
"
"
"
"   FUNCTION func_get_plnt_bud_req (p_bu VARCHAR2, p_plnt VARCHAR2)
"
"      RETURN VARCHAR2
"
"   IS
"
"      v_plnt_bud_flag   VARCHAR2 (1);
"
"   BEGIN
"
"      BEGIN
"
"         SELECT bup_bud_flag
"
"           INTO v_plnt_bud_flag
"
"           FROM bus_unit_plants
"
"          WHERE bup_bu = p_bu AND bup_plant_id = p_plnt;
"
"      EXCEPTION
"
"         WHEN NO_DATA_FOUND
"
"         THEN
"
"            v_plnt_bud_flag := 'N';
"
"      END;
"
"
"
"      RETURN v_plnt_bud_flag;
"
"   END func_get_plnt_bud_req;
"
"
"
"   FUNCTION func_get_acct_bud_req (p_bu VARCHAR2, p_acct VARCHAR2)
"
"      RETURN VARCHAR2
"
"   IS
"
"      v_acct_bud_rqrd_flag   VARCHAR2 (1);
"
"   BEGIN
"
"      BEGIN
"
"         SELECT glac_bud_flag
"
"           INTO v_acct_bud_rqrd_flag
"
"           FROM gl_accts
"
"          WHERE     glac_bu = p_bu
"
"                AND glac_acct = p_acct
"
"                AND glac_acct_status = 'A';
"
"      EXCEPTION
"
"         WHEN NO_DATA_FOUND
"
"         THEN
"
"            v_acct_bud_rqrd_flag := 'N';
"
"      END;
"
"
"
"      RETURN v_acct_bud_rqrd_flag;
"
"   END func_get_acct_bud_req;
"
"
"
"   FUNCTION func_get_cc_code_bud_req (p_bu VARCHAR2, p_cc_code VARCHAR2)
"
"      RETURN VARCHAR2
"
"   IS
"
"      v_cc_bud_rqrd_flag   VARCHAR2 (1);
"
"   BEGIN
"
"      BEGIN
"
"         SELECT pcc_bud_flag
"
"           INTO v_cc_bud_rqrd_flag
"
"           FROM profit_cost_centers
"
"          WHERE     pcc_bu = p_bu
"
"                AND pcc_active_flag = 'Y'
"
"                AND pcc_cc_code = p_cc_code;
"
"      EXCEPTION
"
"         WHEN NO_DATA_FOUND
"
"         THEN
"
"            v_cc_bud_rqrd_flag := 'N';
"
"      END;
"
"
"
"      RETURN v_cc_bud_rqrd_flag;
"
"   END func_get_cc_code_bud_req;
"
"
"
"   FUNCTION func_get_acct_grp_bud_req (p_bu VARCHAR2, p_acct VARCHAR2)
"
"      RETURN VARCHAR2
"
"   IS
"
"      v_grp_bud_rqrd_flag   VARCHAR2 (1);
"
"   BEGIN
"
"      BEGIN
"
"         SELECT gacl_bud_flag
"
"           INTO v_grp_bud_rqrd_flag
"
"           FROM gl_accts, gl_account_classes
"
"          WHERE     glac_bu = gacl_bu
"
"                AND glac_cl_id = gacl_id
"
"                AND glac_bu = p_bu
"
"                AND glac_acct = p_acct;
"
"      EXCEPTION
"
"         WHEN NO_DATA_FOUND
"
"         THEN
"
"            v_grp_bud_rqrd_flag := 'N';
"
"      END;
"
"
"
"      RETURN v_grp_bud_rqrd_flag;
"
"   END func_get_acct_grp_bud_req;
"
"
"
"   FUNCTION func_get_acct_grp (p_bu VARCHAR2, p_acct VARCHAR2)
"
"      RETURN VARCHAR2
"
"   IS
"
"      v_acct_grp   VARCHAR2 (10);
"
"   BEGIN
"
"      BEGIN
"
"         SELECT glac_cl_id
"
"           INTO v_acct_grp
"
"           FROM gl_accts, gl_account_classes
"
"          WHERE     glac_bu = gacl_bu
"
"                AND glac_cl_id = gacl_id
"
"                AND glac_bu = p_bu
"
"                AND glac_acct = p_acct;
"
"      EXCEPTION
"
"         WHEN NO_DATA_FOUND
"
"         THEN
"
"            v_acct_grp := NULL;
"
"      END;
"
"
"
"      RETURN v_acct_grp;
"
"   END func_get_acct_grp;
"
"
"
"   PROCEDURE proc_chk_val_fr_xpns_cap_budget (
"
"      p_bu             VARCHAR2,
"
"      p_plnt           VARCHAR2,
"
"      p_plnt_loc_id    VARCHAR2,
"
"      p_year           NUMBER,
"
"      p_period         NUMBER,
"
"      p_type           VARCHAR2,
"
"      p_acct           VARCHAR2,
"
"      p_cc_code        VARCHAR2,
"
"      p_vou_amt        NUMBER,
"
"      p_user           VARCHAR2,
"
"      p_proj_id        VARCHAR2 DEFAULT NULL,
"
"      p_sou_doc_amt    NUMBER DEFAULT 0)
"
"   IS
"
"      CURSOR c_gl (
"
"         c_bud_type     VARCHAR2,
"
"         c_acct_plnt    VARCHAR2,
"
"         c_acct_grp     VARCHAR2,
"
"         c_acct         VARCHAR2,
"
"         c_cc_code      VARCHAR2)
"
"      IS
"
"         SELECT *
"
"           FROM gl_xpns_bud_hd, gl_xpns_bud_ln
"
"          WHERE     gxbh_bu = gxbl_bu
"
"                AND gxbh_doc_no = gxbl_doc_no
"
"                AND gxbh_status = 'A'
"
"                AND gxbh_bu = p_bu
"
"                AND gxbh_bud_type = c_bud_type
"
"                AND c_bud_type = 'C'
"
"                AND gxbh_fin_year = p_year
"
"                AND p_period BETWEEN gxbh_period_from AND gxbh_period_to
"
"                AND (gxbl_acct = c_acct
"
"                     OR (c_acct IS NULL AND gxbl_acct IS NULL))
"
"                AND (gxbl_cc_code = c_cc_code
"
"                     OR (c_cc_code IS NULL AND gxbl_cc_code IS NULL))
"
"         UNION
"
"         SELECT *
"
"           FROM gl_xpns_bud_hd, gl_xpns_bud_ln
"
"          WHERE     gxbh_bu = gxbl_bu
"
"                AND gxbh_doc_no = gxbl_doc_no
"
"                AND gxbh_status = 'A'
"
"                AND gxbh_bu = p_bu
"
"                AND gxbh_bud_type = c_bud_type
"
"                AND c_bud_type = 'A'
"
"                AND gxbh_fin_year = p_year
"
"                AND p_period BETWEEN gxbh_period_from AND gxbh_period_to
"
"                AND (gxbl_acct = c_acct
"
"                     OR (c_acct IS NULL AND gxbl_acct IS NULL))
"
"         UNION
"
"         SELECT *
"
"           FROM gl_xpns_bud_hd, gl_xpns_bud_ln
"
"          WHERE     gxbh_bu = gxbl_bu
"
"                AND gxbh_doc_no = gxbl_doc_no
"
"                AND gxbh_status = 'A'
"
"                AND gxbh_bu = p_bu
"
"                AND gxbh_bud_type = c_bud_type
"
"                AND c_bud_type = 'B'
"
"                AND gxbh_fin_year = p_year
"
"                AND p_period BETWEEN gxbh_period_from AND gxbh_period_to
"
"                AND (gxbl_ac_plnt = c_acct_plnt
"
"                     OR (c_acct_plnt IS NULL AND gxbl_ac_plnt IS NULL))
"
"                AND (gxbl_acct = c_acct
"
"                     OR (c_acct IS NULL AND gxbl_acct IS NULL))
"
"         UNION
"
"         SELECT *
"
"           FROM gl_xpns_bud_hd, gl_xpns_bud_ln
"
"          WHERE     gxbh_bu = gxbl_bu
"
"                AND gxbh_doc_no = gxbl_doc_no
"
"                AND gxbh_status = 'A'
"
"                AND gxbh_bu = p_bu
"
"                AND gxbh_bud_type = c_bud_type
"
"                AND c_bud_type = 'G'
"
"                AND gxbh_fin_year = p_year
"
"                AND p_period BETWEEN gxbh_period_from AND gxbh_period_to
"
"                AND (gxbl_ac_grp = c_acct_grp
"
"                     OR (c_acct_grp IS NULL AND gxbl_ac_grp IS NULL))
"
"         UNION
"
"         SELECT *
"
"           FROM gl_xpns_bud_hd, gl_xpns_bud_ln
"
"          WHERE     gxbh_bu = gxbl_bu
"
"                AND gxbh_doc_no = gxbl_doc_no
"
"                AND gxbh_status = 'A'
"
"                AND gxbh_bu = p_bu
"
"                AND gxbh_bud_type = c_bud_type
"
"                AND c_bud_type = 'H'
"
"                AND gxbh_fin_year = p_year
"
"                AND p_period BETWEEN gxbh_period_from AND gxbh_period_to
"
"                AND (gxbl_ac_plnt = c_acct_plnt
"
"                     OR (c_acct_plnt IS NULL AND gxbl_ac_plnt IS NULL))
"
"                AND (gxbl_ac_grp = c_acct_grp
"
"                     OR (c_acct_grp IS NULL AND gxbl_ac_grp IS NULL))
"
"         UNION
"
"         SELECT *
"
"           FROM gl_xpns_bud_hd, gl_xpns_bud_ln
"
"          WHERE     gxbh_bu = gxbl_bu
"
"                AND gxbh_doc_no = gxbl_doc_no
"
"                AND gxbh_status = 'A'
"
"                AND gxbh_bu = p_bu
"
"                AND gxbh_bud_type = c_bud_type
"
"                AND c_bud_type = 'D'
"
"                AND gxbh_fin_year = p_year
"
"                AND p_period BETWEEN gxbh_period_from AND gxbh_period_to
"
"                AND (gxbl_cc_code = c_cc_code
"
"                     OR (c_cc_code IS NULL AND gxbl_cc_code IS NULL));
"
"
"
"      CURSOR c_cb
"
"      IS
"
"         SELECT *
"
"           FROM cptl_budget
"
"          WHERE     cb_bu = p_bu
"
"                AND cb_acct_id = p_acct
"
"                AND cb_sub_proj_id = p_proj_id
"
"                AND cb_status = 'A';
"
"
"
"      v_acct_grp   VARCHAR2 (10);
"
"      r_gl         c_gl%ROWTYPE;
"
"      r_cb         c_cb%ROWTYPE;
"
"      v_bud_type   VARCHAR2 (1);
"
"      v_act_amt    NUMBER;
"
"   BEGIN
"
"      v_bud_type := pkg_budget.func_chk_budget_type (p_bu);
"
"
"
"      v_act_amt :=
"
"         func_find_budget_lgr_bal_new (
"
"            p_bu,
"
"            p_year,
"
"            p_acct       => CASE
"
"                              WHEN v_bud_type IN ('A', 'B', 'C') THEN p_acct
"
"                              ELSE NULL
"
"                           END,
"
"            p_acc_grp    => CASE
"
"                              WHEN v_bud_type IN ('G', 'H')
"
"                                   AND pkg_budget.func_get_budget_type (
"
"                                          p_bu,
"
"                                          p_acct) = 'XB'
"
"                              THEN
"
"                                 pkg_budget.func_get_acct_grp (p_bu, p_acct)
"
"                              ELSE
"
"                                 NULL
"
"                           END,
"
"            p_plnt       => CASE
"
"                              WHEN v_bud_type IN ('B', 'H')
"
"                                   AND pkg_budget.func_get_budget_type (
"
"                                          p_bu,
"
"                                          p_acct) = 'XB'
"
"                              THEN
"
"                                 p_plnt
"
"                              ELSE
"
"                                 NULL
"
"                           END,
"
"            p_cc_code    => CASE
"
"                              WHEN v_bud_type IN ('C', 'D')
"
"                                   AND pkg_budget.func_get_budget_type (
"
"                                          p_bu,
"
"                                          p_acct) = 'XB'
"
"                              THEN
"
"                                 p_cc_code
"
"                              ELSE
"
"                                 NULL
"
"                           END,
"
"            p_bud_type   => CASE
"
"                              WHEN pkg_budget.func_get_budget_type (p_bu,
"
"                                                                    p_acct) =
"
"                                      'CWP'
"
"                              THEN
"
"                                 'CB'
"
"                              ELSE
"
"                                 'XB'
"
"                           END);
"
"
"
"
"
"      IF pkg_budget.func_get_budget_type (p_bu, p_acct) <> 'CWP'
"
"      THEN
"
"         IF pkg_budget.func_chk_budget_type (p_bu) = 'A'
"
"            AND pkg_budget.func_get_acct_bud_req (p_bu, p_acct) = 'Y'
"
"         THEN
"
"            OPEN c_gl (v_bud_type,
"
"                       p_plnt,
"
"                       NULL,
"
"                       p_acct,
"
"                       p_cc_code);
"
"
"
"            FETCH c_gl INTO r_gl;
"
"
"
"            IF c_gl%FOUND
"
"            THEN
"
"               IF r_gl.gxbl_allw_exc_flag = 'N'
"
"                  AND r_gl.gxbl_bud_amt <
"
"                         (  NVL (v_act_amt, 0)
"
"                          + r_gl.gxbl_pr_amt
"
"                          + r_gl.gxbl_po_amt
"
"                          + r_gl.gxbl_grn_amt
"
"                          + r_gl.gxbl_mr_amt
"
"                          + r_gl.gxbl_amt_all_fm_proj
"
"                          + r_gl.gxbl_free_amt
"
"                          + r_gl.gxbl_ss_amt
"
"                          + p_vou_amt
"
"                          - NVL(p_sou_doc_amt,0))
"
"               THEN
"
"                  Raise_Application_Error (
"
"                     -20500,
"
"                     'BUD' || '~' || r_gl.gxbl_bud_amt || '~'
"
"                     || (  NVL (v_act_amt, 0)
"
"                         + r_gl.gxbl_pr_amt
"
"                         + r_gl.gxbl_po_amt
"
"                         + r_gl.gxbl_grn_amt
"
"                         + r_gl.gxbl_mr_amt
"
"                         + r_gl.gxbl_amt_all_fm_proj
"
"                         + r_gl.gxbl_free_amt
"
"                         + r_gl.gxbl_ss_amt
"
"                         + p_vou_amt
"
"                         - NVL(p_sou_doc_amt,0)));
"
"               END IF;
"
"            ELSE
"
"               Raise_Application_Error (
"
"                  -20074,
"
"                     'GLM'
"
"                  || '~'
"
"                  || v_bud_type
"
"                  || '~'
"
"                  || p_plnt
"
"                  || '~'
"
"                  || p_acct);
"
"            END IF;
"
"
"
"            CLOSE c_gl;
"
"         ELSIF     pkg_budget.func_chk_budget_type (p_bu) = 'B'
"
"               AND pkg_budget.func_get_acct_bud_req (p_bu, p_acct) = 'Y'
"
"               AND pkg_budget.func_get_plnt_bud_req (p_bu, p_plnt) = 'Y'
"
"         THEN
"
"            OPEN c_gl (v_bud_type,
"
"                       p_plnt,
"
"                       NULL,
"
"                       p_acct,
"
"                       NULL);
"
"
"
"            FETCH c_gl INTO r_gl;
"
"
"
"            IF c_gl%FOUND
"
"            THEN
"
"               IF r_gl.gxbl_allw_exc_flag = 'N'
"
"                  AND r_gl.gxbl_bud_amt <
"
"                         (  NVL (v_act_amt, 0)
"
"                          + r_gl.gxbl_pr_amt
"
"                          + r_gl.gxbl_po_amt
"
"                          + r_gl.gxbl_grn_amt
"
"                          + r_gl.gxbl_mr_amt
"
"                          + r_gl.gxbl_amt_all_fm_proj
"
"                          + r_gl.gxbl_free_amt
"
"                          + r_gl.gxbl_ss_amt
"
"                          + p_vou_amt
"
"                          - NVL(p_sou_doc_amt,0))
"
"               THEN
"
"                  Raise_Application_Error (
"
"                     -20500,
"
"                     'BUD' || '~' || r_gl.gxbl_bud_amt || '~'
"
"                     || (  NVL (v_act_amt, 0)
"
"                         + r_gl.gxbl_pr_amt
"
"                         + r_gl.gxbl_po_amt
"
"                         + r_gl.gxbl_grn_amt
"
"                         + r_gl.gxbl_mr_amt
"
"                         + r_gl.gxbl_amt_all_fm_proj
"
"                         + r_gl.gxbl_free_amt
"
"                         + r_gl.gxbl_ss_amt
"
"                         + p_vou_amt
"
"                         - NVL(p_sou_doc_amt,0)));
"
"               END IF;
"
"            ELSE
"
"               Raise_Application_Error (
"
"                  -20074,
"
"                     'GLM'
"
"                  || '~'
"
"                  || v_bud_type
"
"                  || '~'
"
"                  || p_plnt
"
"                  || '~'
"
"                  || p_acct);
"
"            END IF;
"
"
"
"            CLOSE c_gl;
"
"         ELSIF pkg_budget.func_chk_budget_type (p_bu) = 'C'
"
"               AND pkg_budget.func_get_acct_bud_req (p_bu, p_acct) = 'Y'
"
"               AND pkg_budget.func_get_cc_code_bud_req (p_bu, p_cc_code) =
"
"                      'Y'
"
"         THEN
"
"            OPEN c_gl (v_bud_type,
"
"                       p_plnt,
"
"                       NULL,
"
"                       p_acct,
"
"                       p_cc_code);
"
"
"
"            FETCH c_gl INTO r_gl;
"
"
"
"            IF c_gl%FOUND
"
"            THEN
"
"               IF r_gl.gxbl_allw_exc_flag = 'N'
"
"                  AND r_gl.gxbl_bud_amt <
"
"                         (  NVL (v_act_amt, 0)
"
"                          + r_gl.gxbl_pr_amt
"
"                          + r_gl.gxbl_po_amt
"
"                          + r_gl.gxbl_grn_amt
"
"                          + r_gl.gxbl_mr_amt
"
"                          + r_gl.gxbl_amt_all_fm_proj
"
"                          + r_gl.gxbl_free_amt
"
"                          + r_gl.gxbl_ss_amt
"
"                          + p_vou_amt
"
"                          - NVL(p_sou_doc_amt,0))
"
"               THEN
"
"                  Raise_Application_Error (
"
"                     -20500,
"
"                     'BUD' || '~' || r_gl.gxbl_bud_amt || '~'
"
"                     || (  NVL (v_act_amt, 0)
"
"                         + r_gl.gxbl_pr_amt
"
"                         + r_gl.gxbl_po_amt
"
"                         + r_gl.gxbl_grn_amt
"
"                         + r_gl.gxbl_mr_amt
"
"                         + r_gl.gxbl_amt_all_fm_proj
"
"                         + r_gl.gxbl_free_amt
"
"                         + r_gl.gxbl_ss_amt
"
"                         + p_vou_amt
"
"                         - NVL(p_sou_doc_amt,0)));
"
"               END IF;
"
"            ELSE
"
"               Raise_Application_Error (
"
"                  -20074,
"
"                     'GLM'
"
"                  || '~'
"
"                  || v_bud_type
"
"                  || '~'
"
"                  || p_plnt
"
"                  || '~'
"
"                  || p_acct
"
"                  || '~'
"
"                  || p_cc_code);
"
"            END IF;
"
"
"
"            CLOSE c_gl;
"
"         ELSIF pkg_budget.func_chk_budget_type (p_bu) = 'D'
"
"               AND pkg_budget.func_get_cc_code_bud_req (p_bu, p_cc_code) =
"
"                      'Y'
"
"         THEN
"
"            OPEN c_gl (v_bud_type,
"
"                       p_plnt,
"
"                       NULL,
"
"                       p_acct,
"
"                       p_cc_code);
"
"
"
"            FETCH c_gl INTO r_gl;
"
"
"
"            IF c_gl%FOUND
"
"            THEN
"
"               IF r_gl.gxbl_allw_exc_flag = 'N'
"
"                  AND r_gl.gxbl_bud_amt <
"
"                         (  NVL (v_act_amt, 0)
"
"                          + r_gl.gxbl_pr_amt
"
"                          + r_gl.gxbl_po_amt
"
"                          + r_gl.gxbl_grn_amt
"
"                          + r_gl.gxbl_mr_amt
"
"                          + r_gl.gxbl_amt_all_fm_proj
"
"                          + r_gl.gxbl_free_amt
"
"                          + r_gl.gxbl_ss_amt
"
"                          + p_vou_amt
"
"                          - NVL(p_sou_doc_amt,0))
"
"               THEN
"
"                  Raise_Application_Error (
"
"                     -20500,
"
"                     'BUD' || '~' || r_gl.gxbl_bud_amt || '~'
"
"                     || (  NVL (v_act_amt, 0)
"
"                         + r_gl.gxbl_pr_amt
"
"                         + r_gl.gxbl_po_amt
"
"                         + r_gl.gxbl_grn_amt
"
"                         + r_gl.gxbl_mr_amt
"
"                         + r_gl.gxbl_amt_all_fm_proj
"
"                         + r_gl.gxbl_free_amt
"
"                         + r_gl.gxbl_ss_amt
"
"                         + p_vou_amt
"
"                         - NVL(p_sou_doc_amt,0)));
"
"               END IF;
"
"            ELSE
"
"               Raise_Application_Error (
"
"                  -20074,
"
"                     'GLM'
"
"                  || '~'
"
"                  || v_bud_type
"
"                  || '~'
"
"                  || p_plnt
"
"                  || '~'
"
"                  || p_acct
"
"                  || '~'
"
"                  || p_cc_code);
"
"            END IF;
"
"
"
"            CLOSE c_gl;
"
"         ELSIF pkg_budget.func_chk_budget_type (p_bu) = 'G'
"
"               AND pkg_budget.func_get_acct_grp_bud_req (p_bu, p_acct) = 'Y'
"
"         THEN
"
"            v_acct_grp := pkg_budget.func_get_acct_grp (p_bu, p_acct);
"
"
"
"            OPEN c_gl (v_bud_type,
"
"                       p_plnt,
"
"                       v_acct_grp,
"
"                       p_acct,
"
"                       p_cc_code);
"
"
"
"            FETCH c_gl INTO r_gl;
"
"
"
"            IF c_gl%FOUND
"
"            THEN
"
"               IF r_gl.gxbl_allw_exc_flag = 'N'
"
"                  AND r_gl.gxbl_bud_amt <
"
"                         (  NVL (v_act_amt, 0)
"
"                          + r_gl.gxbl_pr_amt
"
"                          + r_gl.gxbl_po_amt
"
"                          + r_gl.gxbl_grn_amt
"
"                          + r_gl.gxbl_mr_amt
"
"                          + r_gl.gxbl_amt_all_fm_proj
"
"                          + r_gl.gxbl_free_amt
"
"                          + r_gl.gxbl_ss_amt
"
"                          + p_vou_amt
"
"                          - NVL(p_sou_doc_amt,0))
"
"               THEN
"
"                  Raise_Application_Error (
"
"                     -20500,
"
"                     'BUD' || '~' || r_gl.gxbl_bud_amt || '~'
"
"                     || (  NVL (v_act_amt, 0)
"
"                         + r_gl.gxbl_pr_amt
"
"                         + r_gl.gxbl_po_amt
"
"                         + r_gl.gxbl_grn_amt
"
"                         + r_gl.gxbl_mr_amt
"
"                         + r_gl.gxbl_amt_all_fm_proj
"
"                         + r_gl.gxbl_free_amt
"
"                         + r_gl.gxbl_ss_amt
"
"                         + p_vou_amt
"
"                         - NVL(p_sou_doc_amt,0)));
"
"               END IF;
"
"            ELSE
"
"               Raise_Application_Error (
"
"                  -20074,
"
"                     'GLM'
"
"                  || '~'
"
"                  || v_bud_type
"
"                  || '~'
"
"                  || v_acct_grp
"
"                  || '~'
"
"                  || p_plnt
"
"                  || '~'
"
"                  || p_acct
"
"                  || '~'
"
"                  || p_cc_code);
"
"            END IF;
"
"
"
"            CLOSE c_gl;
"
"         ELSIF     pkg_budget.func_chk_budget_type (p_bu) = 'H'
"
"               AND pkg_budget.func_get_acct_grp_bud_req (p_bu, p_acct) = 'Y'
"
"               AND pkg_budget.func_get_plnt_bud_req (p_bu, p_plnt) = 'Y'
"
"         THEN
"
"            v_acct_grp := pkg_budget.func_get_acct_grp (p_bu, p_acct);
"
"
"
"            OPEN c_gl (v_bud_type,
"
"                       p_plnt,
"
"                       v_acct_grp,
"
"                       p_acct,
"
"                       p_cc_code);
"
"
"
"            FETCH c_gl INTO r_gl;
"
"
"
"            IF c_gl%FOUND
"
"            THEN
"
"               IF r_gl.gxbl_allw_exc_flag = 'N'
"
"                  AND r_gl.gxbl_bud_amt <
"
"                         (  NVL (v_act_amt, 0)
"
"                          + r_gl.gxbl_pr_amt
"
"                          + r_gl.gxbl_po_amt
"
"                          + r_gl.gxbl_grn_amt
"
"                          + r_gl.gxbl_mr_amt
"
"                          + r_gl.gxbl_amt_all_fm_proj
"
"                          + r_gl.gxbl_free_amt
"
"                          + r_gl.gxbl_ss_amt
"
"                          + p_vou_amt
"
"                          - NVL(p_sou_doc_amt,0))
"
"               THEN
"
"                  Raise_Application_Error (
"
"                     -20500,
"
"                     'BUD' || '~' || r_gl.gxbl_bud_amt || '~'
"
"                     || (  NVL (v_act_amt, 0)
"
"                         + r_gl.gxbl_pr_amt
"
"                         + r_gl.gxbl_po_amt
"
"                         + r_gl.gxbl_grn_amt
"
"                         + r_gl.gxbl_mr_amt
"
"                         + r_gl.gxbl_amt_all_fm_proj
"
"                         + r_gl.gxbl_free_amt
"
"                         + r_gl.gxbl_ss_amt
"
"                         + p_vou_amt
"
"                         - NVL(p_sou_doc_amt,0)));
"
"               END IF;
"
"            ELSE
"
"               Raise_Application_Error (
"
"                  -20074,
"
"                     'GLM'
"
"                  || '~'
"
"                  || v_bud_type
"
"                  || '~'
"
"                  || v_acct_grp
"
"                  || '~'
"
"                  || p_plnt
"
"                  || '~'
"
"                  || p_acct
"
"                  || '~'
"
"                  || p_cc_code);
"
"            END IF;
"
"
"
"            CLOSE c_gl;
"
"         END IF;
"
"      ELSE
"
"         IF pkg_budget.func_get_acct_bud_req (p_bu, p_acct) = 'Y'
"
"         THEN
"
"            OPEN c_cb;
"
"
"
"            FETCH c_cb INTO r_cb;
"
"
"
"            IF c_cb%FOUND
"
"            THEN
"
"               IF r_cb.cb_bud_amt <
"
"                     (  NVL (v_act_amt, 0)
"
"                      + r_cb.cb_pr_amt
"
"                      + r_cb.cb_po_amt
"
"                      + r_cb.cb_grn_amt
"
"                      + r_cb.cb_miv_amt
"
"                      + p_vou_amt
"
"                      - NVL(p_sou_doc_amt,0))
"
"               THEN
"
"                  Raise_Application_Error (
"
"                     -20500,
"
"                     'BUD' || '~' || r_cb.cb_bud_amt || '~'
"
"                     || (  NVL (v_act_amt, 0)
"
"                         + r_cb.cb_pr_amt
"
"                         + r_cb.cb_po_amt
"
"                         + r_cb.cb_grn_amt
"
"                         + r_cb.cb_miv_amt
"
"                         + p_vou_amt
"
"                         - NVL(p_sou_doc_amt,0)));
"
"               END IF;
"
"            ELSE
"
"               Raise_Application_Error (
"
"                  -20074,
"
"                  'GLM' || '~' || p_plnt || '~' || p_acct || '~' || p_proj_id);
"
"            END IF;
"
"
"
"            CLOSE c_cb;
"
"         END IF;
"
"      END IF;
"
"   END proc_chk_val_fr_xpns_cap_budget;
"
"
"
"   PROCEDURE proc_upd_val_fr_xpns_cap_budget (
"
"      p_bu             VARCHAR2,
"
"      p_plnt           VARCHAR2,
"
"      p_doc_date       DATE,
"
"      p_year           NUMBER,
"
"      p_period         NUMBER,
"
"      p_type           VARCHAR2,
"
"      p_acct           VARCHAR2,
"
"      p_cc_code        VARCHAR2,
"
"      p_vou_pfx        VARCHAR2,
"
"      p_vou_no         VARCHAR2,
"
"      p_vou_line_no    NUMBER,
"
"      p_vou_amt        NUMBER,
"
"      p_user           VARCHAR2,
"
"      p_proj_id        VARCHAR2 DEFAULT NULL)
"
"   IS
"
"      CURSOR c_gl (
"
"         c_bud_type     VARCHAR2,
"
"         c_acct_plnt    VARCHAR2,
"
"         c_acct_grp     VARCHAR2,
"
"         c_acct         VARCHAR2,
"
"         c_cc_code      VARCHAR2)
"
"      IS
"
"         SELECT *
"
"           FROM gl_xpns_bud_hd, gl_xpns_bud_ln
"
"          WHERE     gxbh_bu = gxbl_bu
"
"                AND gxbh_doc_no = gxbl_doc_no
"
"                AND gxbh_status = 'A'
"
"                AND gxbh_bu = p_bu
"
"                AND gxbh_bud_type = c_bud_type
"
"                AND c_bud_type = 'C'
"
"                AND gxbh_fin_year = p_year
"
"                AND p_period BETWEEN gxbh_period_from AND gxbh_period_to
"
"                AND (gxbl_acct = c_acct
"
"                     OR (c_acct IS NULL AND gxbl_acct IS NULL))
"
"                AND (gxbl_cc_code = c_cc_code
"
"                     OR (c_cc_code IS NULL AND gxbl_cc_code IS NULL))
"
"         UNION
"
"         SELECT *
"
"           FROM gl_xpns_bud_hd, gl_xpns_bud_ln
"
"          WHERE     gxbh_bu = gxbl_bu
"
"                AND gxbh_doc_no = gxbl_doc_no
"
"                AND gxbh_status = 'A'
"
"                AND gxbh_bu = p_bu
"
"                AND gxbh_bud_type = c_bud_type
"
"                AND c_bud_type = 'A'
"
"                AND gxbh_fin_year = p_year
"
"                AND p_period BETWEEN gxbh_period_from AND gxbh_period_to
"
"                AND (gxbl_acct = c_acct
"
"                     OR (c_acct IS NULL AND gxbl_acct IS NULL))
"
"         UNION
"
"         SELECT *
"
"           FROM gl_xpns_bud_hd, gl_xpns_bud_ln
"
"          WHERE     gxbh_bu = gxbl_bu
"
"                AND gxbh_doc_no = gxbl_doc_no
"
"                AND gxbh_status = 'A'
"
"                AND gxbh_bu = p_bu
"
"                AND gxbh_bud_type = c_bud_type
"
"                AND c_bud_type = 'B'
"
"                AND gxbh_fin_year = p_year
"
"                AND p_period BETWEEN gxbh_period_from AND gxbh_period_to
"
"                AND (gxbl_ac_plnt = c_acct_plnt
"
"                     OR (c_acct_plnt IS NULL AND gxbl_ac_plnt IS NULL))
"
"                AND (gxbl_acct = c_acct
"
"                     OR (c_acct IS NULL AND gxbl_acct IS NULL))
"
"         UNION
"
"         SELECT *
"
"           FROM gl_xpns_bud_hd, gl_xpns_bud_ln
"
"          WHERE     gxbh_bu = gxbl_bu
"
"                AND gxbh_doc_no = gxbl_doc_no
"
"                AND gxbh_status = 'A'
"
"                AND gxbh_bu = p_bu
"
"                AND gxbh_bud_type = c_bud_type
"
"                AND c_bud_type = 'G'
"
"                AND gxbh_fin_year = p_year
"
"                AND p_period BETWEEN gxbh_period_from AND gxbh_period_to
"
"                AND (gxbl_ac_grp = c_acct_grp
"
"                     OR (c_acct_grp IS NULL AND gxbl_ac_grp IS NULL))
"
"         UNION
"
"         SELECT *
"
"           FROM gl_xpns_bud_hd, gl_xpns_bud_ln
"
"          WHERE     gxbh_bu = gxbl_bu
"
"                AND gxbh_doc_no = gxbl_doc_no
"
"                AND gxbh_status = 'A'
"
"                AND gxbh_bu = p_bu
"
"                AND gxbh_bud_type = c_bud_type
"
"                AND c_bud_type = 'H'
"
"                AND gxbh_fin_year = p_year
"
"                AND p_period BETWEEN gxbh_period_from AND gxbh_period_to
"
"                AND (gxbl_ac_plnt = c_acct_plnt
"
"                     OR (c_acct_plnt IS NULL AND gxbl_ac_plnt IS NULL))
"
"                AND (gxbl_ac_grp = c_acct_grp
"
"                     OR (c_acct_grp IS NULL AND gxbl_ac_grp IS NULL))
"
"         UNION
"
"         SELECT *
"
"           FROM gl_xpns_bud_hd, gl_xpns_bud_ln
"
"          WHERE     gxbh_bu = gxbl_bu
"
"                AND gxbh_doc_no = gxbl_doc_no
"
"                AND gxbh_status = 'A'
"
"                AND gxbh_bu = p_bu
"
"                AND gxbh_bud_type = c_bud_type
"
"                AND c_bud_type = 'D'
"
"                AND gxbh_fin_year = p_year
"
"                AND p_period BETWEEN gxbh_period_from AND gxbh_period_to
"
"                AND (gxbl_cc_code = c_cc_code
"
"                     OR (c_cc_code IS NULL AND gxbl_cc_code IS NULL));
"
"
"
"      CURSOR c_cb
"
"      IS
"
"         SELECT *
"
"           FROM cptl_budget
"
"          WHERE     cb_bu = p_bu
"
"                AND cb_acct_id = p_acct
"
"                AND cb_sub_proj_id = p_proj_id
"
"                AND cb_status = 'A';
"
"
"
"      v_acct_grp       VARCHAR2 (10);
"
"      r_gl             c_gl%ROWTYPE;
"
"      r_cb             c_cb%ROWTYPE;
"
"      v_bud_type       VARCHAR2 (1);
"
"      v_source         VARCHAR2 (2);
"
"      v_pr_amt         NUMBER := 0;
"
"      v_po_amt         NUMBER := 0;
"
"      v_ss_amt         NUMBER := 0;
"
"      v_mode           VARCHAR2 (2);
"
"      v_po_amd_amt     NUMBER := 0;
"
"      v_act_amt        NUMBER := 0;
"
"      v_pa_cls_amt     NUMBER := 0;
"
"      v_pa_chng_type   VARCHAR2 (1);
"
"      v_ap_po_amt      NUMBER := 0;
"
"      v_ap_po_type     VARCHAR2(1) := 'N';
"
"   BEGIN
"
"      v_bud_type := pkg_budget.func_chk_budget_type (p_bu);
"
"
"
"      v_act_amt :=
"
"         func_find_budget_lgr_bal_new (
"
"            p_bu,
"
"            p_year,
"
"            p_acct       => CASE
"
"                              WHEN v_bud_type IN ('A', 'B', 'C') THEN p_acct
"
"                              ELSE NULL
"
"                           END,
"
"            p_acc_grp    => CASE
"
"                              WHEN v_bud_type IN ('G', 'H')
"
"                                   AND pkg_budget.func_get_budget_type (
"
"                                          p_bu,
"
"                                          p_acct) = 'XB'
"
"                              THEN
"
"                                 pkg_budget.func_get_acct_grp (p_bu, p_acct)
"
"                              ELSE
"
"                                 NULL
"
"                           END,
"
"            p_plnt       => CASE
"
"                              WHEN v_bud_type IN ('B', 'H')
"
"                                   AND pkg_budget.func_get_budget_type (
"
"                                          p_bu,
"
"                                          p_acct) = 'XB'
"
"                              THEN
"
"                                 p_plnt
"
"                              ELSE
"
"                                 NULL
"
"                           END,
"
"            p_cc_code    => CASE
"
"                              WHEN v_bud_type IN ('C', 'D')
"
"                                   AND pkg_budget.func_get_budget_type (
"
"                                          p_bu,
"
"                                          p_acct) = 'XB'
"
"                              THEN
"
"                                 p_cc_code
"
"                              ELSE
"
"                                 NULL
"
"                           END,
"
"            p_bud_type   => CASE
"
"                              WHEN pkg_budget.func_get_budget_type (p_bu,
"
"                                                                    p_acct) =
"
"                                      'CWP'
"
"                              THEN
"
"                                 'CB'
"
"                              ELSE
"
"                                 'XB'
"
"                           END);
"
"
"
"      /*  RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||func_find_budget_lgr_bal_new(p_bu,
"
"                                               p_year,
"
"                                               p_acct => CASE WHEN v_bud_type IN ('A','B','C') THEN p_acct ELSE NULL END,
"
"                                               p_acc_grp => CASE WHEN v_bud_type IN ('G','H') AND pkg_budget.func_get_budget_type(p_bu,p_acct) = 'XB' THEN pkg_budget.func_get_acct_grp(p_bu,p_acct) ELSE NULL END,
"
"                                               p_plnt => CASE WHEN v_bud_type IN ('B','H') AND pkg_budget.func_get_budget_type(p_bu,p_acct) = 'XB' THEN p_plnt ELSE NULL END,
"
"                                               p_cc_code => CASE WHEN v_bud_type IN ('C','D') AND pkg_budget.func_get_budget_type(p_bu,p_acct) = 'XB' THEN p_cc_code ELSE NULL END,
"
"                                               p_bud_type => CASE WHEN pkg_budget.func_get_budget_type(p_bu,p_acct) = 'CWP' THEN 'CB' ELSE 'XB' END
"
"                                              ));             */
"
"      --raise_application_error(-20999,p_year||'~'||CASE WHEN v_bud_type IN ('A','B','C') THEN p_acct ELSE NULL END||'~'||CASE WHEN v_bud_type IN ('G','H') AND pkg_budget.func_get_budget_type(p_bu,p_acct) = 'XB' THEN pkg_budget.func_get_acct_grp(p_bu,p_acct) ELSE NULL END||'~'||CASE WHEN v_bud_type IN ('B','H') AND pkg_budget.func_get_budget_type(p_bu,p_acct) = 'XB' THEN p_plnt ELSE NULL END||'~'||CASE WHEN v_bud_type IN ('C','D') AND pkg_budget.func_get_budget_type(p_bu,p_acct) = 'XB' THEN p_cc_code ELSE NULL END||'~'|| CASE WHEN v_bud_type IN ('A','B','C') THEN p_acct ELSE NULL END||'~'||CASE WHEN pkg_budget.func_get_budget_type(p_bu,p_acct) = 'CWP' THEN 'CB' ELSE 'XB' END);
"
"
"
"
"
"      IF p_type = 'PR'
"
"      THEN
"
"         v_source := 'M';
"
"         v_pr_amt := 0;
"
"         v_po_amt := 0;
"
"         v_ss_amt := 0;
"
"         v_po_amd_amt := 0;
"
"         v_pa_cls_amt := 0;
"
"      ELSIF p_type = 'PO'
"
"      THEN
"
"         BEGIN
"
"            SELECT poh_origin, poh_mode
"
"              INTO v_source, v_mode
"
"              FROM pur_order_hd
"
"             WHERE     poh_bu = p_bu
"
"                   AND poh_order_pfx = p_vou_pfx
"
"                   AND poh_order_no = p_vou_no;
"
"         EXCEPTION
"
"            WHEN NO_DATA_FOUND
"
"            THEN
"
"               v_source := 'M';
"
"         END;
"
"
"
"         IF v_source IN ('P', 'R', 'F')
"
"         THEN
"
"            BEGIN
"
"               SELECT NVL (
"
"                         SUM (
"
"                            pol_ordered_qty / prl_conv_factor
"
"                            * (prl_bc_unit_cost)),
"
"                         0)
"
"                 INTO v_pr_amt
"
"                 FROM pur_req_hd, pur_req_ln, pur_order_ln
"
"                WHERE     prh_bu = prl_bu
"
"                      AND prh_rqst_no = prl_rqst_no
"
"                      AND prl_bu = pol_bu
"
"                      AND prl_rqst_no = pol_pr_no
"
"                      AND prl_seq_no = pol_pr_seq_no
"
"                      AND pol_bu = p_bu
"
"                      AND pol_order_no = p_vou_no
"
"                      AND pol_seq_no = p_vou_line_no;
"
"            EXCEPTION
"
"               WHEN NO_DATA_FOUND
"
"               THEN
"
"                  v_pr_amt := 0;
"
"            END;
"
"            /*
"
"            IF v_pr_amt = 0 AND v_mode <> 'SC'
"
"            THEN
"
"               Raise_Application_Error (
"
"                  -20999,
"
"                  'HRM' || '~' || p_vou_no || '~' || p_vou_line_no);
"
"            END IF;*/
"
"         END IF;
"
"
"
"         v_po_amt := 0;
"
"         v_ss_amt := 0;
"
"         v_pa_cls_amt := 0;
"
"      ELSIF p_type = 'PA'
"
"      THEN
"
"         BEGIN
"
"            SELECT palc_chnge_type
"
"              INTO v_pa_chng_type
"
"              FROM po_amend_line_chnges
"
"             WHERE     palc_bu = p_bu
"
"                   AND palc_plnt = p_plnt
"
"                   AND palc_doc_no = p_vou_no
"
"                   AND palc_seq_no = p_vou_line_no;
"
"         EXCEPTION
"
"            WHEN NO_DATA_FOUND
"
"            THEN
"
"               v_pa_chng_type := 'M';
"
"         END;
"
"
"
"         IF v_pa_chng_type = 'C'
"
"         THEN
"
"            --v_pa_cls_amt := ABS(p_vou_amt);
"
"            BEGIN
"
"               SELECT NVL (
"
"                         SUM (
"
"                            palc_new_po_qty
"
"                            * (prl_bc_unit_cost * prl_conv_factor)),
"
"                         0)
"
"                 INTO v_pa_cls_amt
"
"                 FROM pur_req_hd, pur_req_ln, po_amend_line_chnges
"
"                WHERE     prh_bu = prl_bu
"
"                      AND prh_rqst_no = prl_rqst_no
"
"                      AND prl_bu = palc_bu
"
"                      AND prl_rqst_no = palc_pr_no
"
"                      AND prl_seq_no = palc_pr_seq_no
"
"                      AND palc_bu = p_bu
"
"                      AND palc_plnt = p_plnt
"
"                      AND palc_doc_no = p_vou_no
"
"                      AND palc_seq_no = p_vou_line_no;
"
"            EXCEPTION
"
"               WHEN NO_DATA_FOUND
"
"               THEN
"
"                  v_pa_cls_amt := 0;
"
"            END;
"
"         ELSE
"
"            v_pa_cls_amt := 0;
"
"         END IF;
"
"      ELSIF p_type IN ('GRN','GRNR')
"
"      THEN
"
"         BEGIN
"
"            SELECT porh_grn_source
"
"              INTO v_source
"
"              FROM pur_ord_receipt_hd
"
"             WHERE     porh_bu = p_bu
"
"                   AND porh_receipt_pfx = p_vou_pfx
"
"                   AND porh_receipt_no = p_vou_no;
"
"         EXCEPTION
"
"            WHEN NO_DATA_FOUND
"
"            THEN
"
"               v_source := 'M';
"
"         END;
"
"
"
"         v_pr_amt := 0;
"
"         v_po_amd_amt := 0;
"
"
"
"         IF v_source = 'PO'
"
"         THEN
"
"            BEGIN
"
"               SELECT ROUND (
"
"                         NVL (
"
"                            SUM (
"
"                               ( ( (pol_gross_amt - pol_disc_amt)
"
"                                  / pol_ordered_qty)
"
"                                * poh_exchange_rate)
"
"                               * porl_receipt_qty),
"
"                            0),
"
"                         2)
"
"                 INTO v_po_amt
"
"                 FROM pur_order_hd, pur_order_ln, pur_ord_receipt_ln
"
"                WHERE poh_bu = pol_bu
"
"                  AND poh_order_no = pol_order_no
"
"                  AND pol_bu = porl_bu
"
"                  AND pol_order_no = porl_po_no
"
"                  AND pol_seq_no = porl_po_seq_no
"
"                  AND porl_bu = p_bu
"
"                  AND porl_receipt_no = p_vou_no
"
"                  AND porl_seq_no = p_vou_line_no;
"
"            EXCEPTION
"
"               WHEN NO_DATA_FOUND
"
"               THEN
"
"                  v_po_amt := 0;
"
"            END;
"
"
"
"            IF v_po_amt = 0
"
"            THEN
"
"               Raise_Application_Error (
"
"                  -20999,
"
"                  'HRM' || '~' || p_vou_no || '~' || p_vou_line_no);
"
"            END IF;
"
"
"
"            v_ss_amt := 0;
"
"            v_pa_cls_amt := 0;
"
"         ELSIF v_source = 'SS'
"
"         THEN
"
"            BEGIN
"
"               SELECT ROUND (
"
"                         NVL (
"
"                            SUM (
"
"                               ( (ssld_schld_qty * ssln_price)
"
"                                / ssld_schld_qty)
"
"                               * porl_receipt_qty),
"
"                            0),
"
"                         2)
"
"                 INTO v_ss_amt
"
"                 FROM suplr_schld_hd,
"
"                      suplr_schld_ln,
"
"                      suplr_schld_ln_dtls,
"
"                      pur_ord_receipt_ln
"
"                WHERE     sshd_bu = ssln_bu
"
"                      AND sshd_doc_pfx = ssln_doc_pfx
"
"                      AND sshd_doc_no = ssln_doc_no
"
"                      AND ssln_bu = ssld_bu
"
"                      AND ssln_doc_pfx = ssld_doc_pfx
"
"                      AND ssln_doc_no = ssld_doc_no
"
"                      AND ssln_seq_no = ssld_seq_no
"
"                      AND ssld_bu = porl_bu
"
"                      AND ssld_doc_pfx = porl_ss_doc_pfx
"
"                      AND ssld_doc_no = porl_ss_doc_no
"
"                      AND ssld_seq_no = porl_ss_seq_no
"
"                      AND ssld_sub_seq_no = porl_ss_sub_seq_no
"
"                      AND porl_bu = p_bu
"
"                      AND porl_receipt_no = p_vou_no
"
"                      AND porl_seq_no = p_vou_line_no;
"
"            EXCEPTION
"
"               WHEN NO_DATA_FOUND
"
"               THEN
"
"                  v_ss_amt := 0;
"
"            END;
"
"
"
"            IF v_ss_amt = 0
"
"            THEN
"
"               Raise_Application_Error (
"
"                  -20999,
"
"                  'HRM' || '~' || p_vou_no || '~' || p_vou_line_no);
"
"            END IF;
"
"
"
"            v_po_amt := 0;
"
"            v_pa_cls_amt := 0;
"
"         END IF;
"
"         ELSIF p_type IN ('AP','APR') THEN
"
"            BEGIN
"
"              SELECT suphd_pur_type
"
"                INTO v_source
"
"                FROM suplr_doc_hd_hist_vw1
"
"               WHERE suphd_bu = p_bu
"
"                 AND suphd_pfx = p_vou_pfx
"
"                 AND suphd_doc_no = p_vou_no;
"
"            END;
"
"
"
"            BEGIN
"
"              SELECT DISTINCT CASE WHEN supln_receipt_no IS NULL AND supln_po_no IS NOT NULL THEN 'Y' ELSE 'N' END
"
"                INTO v_ap_po_type
"
"                FROM suplr_doc_ln_hist_vw1
"
"               WHERE supln_bu = p_bu
"
"                 AND supln_doc_no = p_vou_no
"
"                 AND supln_po_no IS NOT NULL
"
"                 AND ROWNUM =1;
"
"            EXCEPTION WHEN NO_DATA_FOUND THEN
"
"              v_ap_po_type := 'N';
"
"            END;
"
"
"
"            IF v_ap_po_type = 'Y' THEN
"
"              IF p_type = 'AP' THEN
"
"                v_ap_po_amt := -p_vou_amt;
"
"              ELSIF p_type = 'APR' THEN
"
"                v_ap_po_amt := p_vou_amt;
"
"              END IF;
"
"            END IF;
"
"
"
"      END IF;
"
"
"
"      IF pkg_budget.func_get_budget_type (p_bu, p_acct) <> 'CWP'
"
"      THEN
"
"         IF pkg_budget.func_chk_budget_type (p_bu) = 'A'
"
"            AND pkg_budget.func_get_acct_bud_req (p_bu, p_acct) = 'Y'
"
"         THEN
"
"            OPEN c_gl (v_bud_type,
"
"                       p_plnt,
"
"                       NULL,
"
"                       p_acct,
"
"                       p_cc_code);
"
"
"
"            FETCH c_gl INTO r_gl;
"
"
"
"            IF c_gl%FOUND
"
"            THEN
"
"               IF r_gl.gxbl_allw_exc_flag = 'N'
"
"                  AND r_gl.gxbl_bud_amt <
"
"                         (  NVL (v_act_amt, 0)
"
"                          + r_gl.gxbl_pr_amt
"
"                          + r_gl.gxbl_po_amt
"
"                          + r_gl.gxbl_grn_amt
"
"                          + r_gl.gxbl_mr_amt
"
"                          + r_gl.gxbl_amt_all_fm_proj
"
"                          + r_gl.gxbl_free_amt
"
"                          + r_gl.gxbl_ss_amt
"
"                          + p_vou_amt
"
"                          - (  NVL (v_pr_amt, 0)
"
"                             + NVL (v_po_amt, 0)
"
"                             + NVL (v_ss_amt, 0)
"
"                             + CASE WHEN p_type IN ('AP','APR') AND v_source = 'W' THEN p_vou_amt ELSE 0 END))
"
"               THEN
"
"                  Raise_Application_Error (
"
"                     -20500,
"
"                     'BUD' || '~' || r_gl.gxbl_bud_amt || '~'
"
"                     || (  NVL (v_act_amt, 0)
"
"                         + r_gl.gxbl_pr_amt
"
"                         + r_gl.gxbl_po_amt
"
"                         + r_gl.gxbl_grn_amt
"
"                         + r_gl.gxbl_mr_amt
"
"                         + r_gl.gxbl_amt_all_fm_proj
"
"                         + r_gl.gxbl_free_amt
"
"                         + r_gl.gxbl_ss_amt
"
"                         + p_vou_amt
"
"                         - (  NVL (v_pr_amt, 0)
"
"                            + NVL (v_po_amt, 0)
"
"                            + NVL (v_ss_amt, 0)
"
"                            + CASE WHEN p_type IN ('AP','APR') AND v_source = 'W' THEN p_vou_amt ELSE 0 END)));
"
"               ELSE
"
"               --raise_application_error(-20999,p_vou_amt);
"
"                  UPDATE gl_xpns_bud_ln
"
"                     SET gxbl_pr_amt =
"
"                            gxbl_pr_amt
"
"                            + CASE
"
"                                 WHEN p_type = 'PR' AND v_source = 'M'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type = 'PC'
"
"                                 THEN
"
"                                    -p_vou_amt
"
"                                 WHEN p_type = 'PO'
"
"                                      AND v_source IN ('P', 'R', 'F')
"
"                                 THEN
"
"                                    -v_pr_amt
"
"                                 WHEN p_type = 'PA'
"
"                                 THEN
"
"                                    v_pa_cls_amt
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_po_amt =
"
"                            gxbl_po_amt
"
"                            + CASE
"
"                                 WHEN p_type = 'PO'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type = 'GRN' AND v_source = 'PO'
"
"                                 THEN
"
"                                    -v_po_amt
"
"                                 WHEN p_type = 'GRNR' AND v_source = 'PO'
"
"                                 THEN
"
"                                    -p_vou_amt
"
"                                 WHEN p_type = 'PA'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                WHEN p_type IN ('AP','APR') THEN
"
"                                 NVL(v_ap_po_amt,0)
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_ss_amt =
"
"                            gxbl_ss_amt
"
"                            + CASE
"
"                                 WHEN p_type = 'SS'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type = 'GRN' AND v_source = 'SS'
"
"                                 THEN
"
"                                    -v_ss_amt
"
"                                 WHEN p_type = 'GRNR' AND v_source = 'SS'
"
"                                 THEN
"
"                                    -p_vou_amt
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_grn_amt =
"
"                            gxbl_grn_amt
"
"                            + CASE
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T'
"
"                                      AND p_type IN ('GRN','GRNR') AND func_find_glmctrl_ps_type(p_bu) <> 'G'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T'
"
"                                      AND p_type = 'AP' AND v_source = 'W'
"
"                                 THEN
"
"                                    CASE WHEN v_ap_po_type = 'Y' THEN 0 ELSE -p_vou_amt END
"
"                                        WHEN p_type = 'APR' AND v_source = 'W' THEN CASE WHEN v_ap_po_type = 'Y' THEN 0 ELSE p_vou_amt END
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_upd_vou_type = CASE WHEN p_type = 'GRNR' THEN 'GRN' ELSE p_type END,
"
"                         gxbl_upd_vou_pfx = p_vou_pfx,
"
"                         gxbl_upd_vou_no = p_vou_no,
"
"                         gxbl_upd_vou_line_no = p_vou_line_no,
"
"                         gxbl_upd_amt = p_vou_amt,
"
"                         gxbl_upd_vou_date = p_doc_date
"
"                   WHERE     gxbl_bu = p_bu
"
"                         AND gxbl_doc_no = r_gl.gxbl_doc_no
"
"                         AND gxbl_seq_no = r_gl.gxbl_seq_no;
"
"               END IF;
"
"            ELSE
"
"               Raise_Application_Error (
"
"                  -20074,
"
"                     'GLM'
"
"                  || '~'
"
"                  || v_bud_type
"
"                  || '~'
"
"                  || p_plnt
"
"                  || '~'
"
"                  || p_acct);
"
"            END IF;
"
"
"
"            CLOSE c_gl;
"
"         ELSIF     pkg_budget.func_chk_budget_type (p_bu) = 'B'
"
"               AND pkg_budget.func_get_acct_bud_req (p_bu, p_acct) = 'Y'
"
"               AND pkg_budget.func_get_plnt_bud_req (p_bu, p_plnt) = 'Y'
"
"         THEN
"
"            OPEN c_gl (v_bud_type,
"
"                       p_plnt,
"
"                       NULL,
"
"                       p_acct,
"
"                       p_cc_code);
"
"
"
"            FETCH c_gl INTO r_gl;
"
"
"
"            IF c_gl%FOUND
"
"            THEN
"
"               IF r_gl.gxbl_allw_exc_flag = 'N'
"
"                  AND r_gl.gxbl_bud_amt <
"
"                         (  NVL (v_act_amt, 0)
"
"                          + r_gl.gxbl_pr_amt
"
"                          + r_gl.gxbl_po_amt
"
"                          + r_gl.gxbl_grn_amt
"
"                          + r_gl.gxbl_mr_amt
"
"                          + r_gl.gxbl_amt_all_fm_proj
"
"                          + r_gl.gxbl_free_amt
"
"                          + r_gl.gxbl_ss_amt
"
"                          + p_vou_amt
"
"                          - (  NVL (v_pr_amt, 0)
"
"                             + NVL (v_po_amt, 0)
"
"                             + NVL (v_ss_amt, 0)
"
"                              + CASE WHEN p_type IN ('AP','APR') AND v_source = 'W' THEN p_vou_amt ELSE 0 END))
"
"               THEN
"
"                  Raise_Application_Error (
"
"                     -20500,
"
"                     'BUD' || '~' || r_gl.gxbl_bud_amt || '~'
"
"                     || (  NVL (v_act_amt, 0)
"
"                         + r_gl.gxbl_pr_amt
"
"                         + r_gl.gxbl_po_amt
"
"                         + r_gl.gxbl_grn_amt
"
"                         + r_gl.gxbl_mr_amt
"
"                         + r_gl.gxbl_amt_all_fm_proj
"
"                         + r_gl.gxbl_free_amt
"
"                         + r_gl.gxbl_ss_amt
"
"                         + p_vou_amt
"
"                         - (  NVL (v_pr_amt, 0)
"
"                            + NVL (v_po_amt, 0)
"
"                            + NVL (v_ss_amt, 0))));
"
"               ELSE
"
"                  UPDATE gl_xpns_bud_ln
"
"                     SET gxbl_pr_amt =
"
"                            gxbl_pr_amt
"
"                            + CASE
"
"                                 WHEN p_type = 'PR' AND v_source = 'M'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type = 'PC'
"
"                                 THEN
"
"                                    -p_vou_amt
"
"                                 WHEN p_type = 'PO'
"
"                                      AND v_source IN ('P', 'R', 'F')
"
"                                 THEN
"
"                                    -v_pr_amt
"
"                                 WHEN p_type = 'PA'
"
"                                 THEN
"
"                                    v_pa_cls_amt
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_po_amt =
"
"                            gxbl_po_amt
"
"                            + CASE
"
"                                 WHEN p_type = 'PO'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type IN ('GRN') AND v_source = 'PO'
"
"                                 THEN
"
"                                    -v_po_amt
"
"                                 WHEN p_type IN ('GRNR') AND v_source = 'PO'
"
"                                 THEN
"
"                                    -p_vou_amt
"
"                                 WHEN p_type = 'PA'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type IN ('AP','APR') THEN
"
"                                 NVL(v_ap_po_amt,0)
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_ss_amt =
"
"                            gxbl_ss_amt
"
"                            + CASE
"
"                                 WHEN p_type = 'SS'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type = 'GRN' AND v_source = 'SS'
"
"                                 THEN
"
"                                    -v_ss_amt
"
"                                 WHEN p_type = 'GRNR' AND v_source = 'SS'
"
"                                 THEN
"
"                                    -p_vou_amt
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_grn_amt =
"
"                            gxbl_grn_amt
"
"                            + CASE
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T' AND func_find_glmctrl_ps_type(p_bu) <> 'G'
"
"                                      AND p_type IN ('GRN','GRNR')
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T'
"
"                                      AND p_type = 'AP' AND v_source = 'W'
"
"                                 THEN
"
"                                     CASE WHEN v_ap_po_type = 'Y' THEN 0 ELSE -p_vou_amt END
"
"                                 WHEN p_type = 'APR' AND v_source = 'W' THEN CASE WHEN v_ap_po_type = 'Y' THEN 0 ELSE p_vou_amt END
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_upd_vou_type = CASE WHEN p_type = 'GRNR' THEN 'GRN' ELSE p_type END,
"
"                         gxbl_upd_vou_pfx = p_vou_pfx,
"
"                         gxbl_upd_vou_no = p_vou_no,
"
"                         gxbl_upd_vou_line_no = p_vou_line_no,
"
"                         gxbl_upd_amt = p_vou_amt,
"
"                         gxbl_upd_vou_date = p_doc_date
"
"                   WHERE     gxbl_bu = p_bu
"
"                         AND gxbl_doc_no = r_gl.gxbl_doc_no
"
"                         AND gxbl_seq_no = r_gl.gxbl_seq_no;
"
"               END IF;
"
"            ELSE
"
"               Raise_Application_Error (
"
"                  -20074,
"
"                     'GLM'
"
"                  || '~'
"
"                  || v_bud_type
"
"                  || '~'
"
"                  || p_plnt
"
"                  || '~'
"
"                  || p_acct);
"
"            END IF;
"
"
"
"            CLOSE c_gl;
"
"         ELSIF pkg_budget.func_chk_budget_type (p_bu) = 'C'
"
"               AND pkg_budget.func_get_acct_bud_req (p_bu, p_acct) = 'Y'
"
"               AND pkg_budget.func_get_cc_code_bud_req (p_bu, p_cc_code) =
"
"                      'Y'
"
"         THEN
"
"            OPEN c_gl (v_bud_type,
"
"                       p_plnt,
"
"                       NULL,
"
"                       p_acct,
"
"                       p_cc_code);
"
"
"
"            FETCH c_gl INTO r_gl;
"
"
"
"            IF c_gl%FOUND
"
"            THEN
"
"               IF r_gl.gxbl_allw_exc_flag = 'N'
"
"                  AND r_gl.gxbl_bud_amt <
"
"                         (  NVL (v_act_amt, 0)
"
"                          + r_gl.gxbl_pr_amt
"
"                          + r_gl.gxbl_po_amt
"
"                          + r_gl.gxbl_grn_amt
"
"                          + r_gl.gxbl_mr_amt
"
"                          + r_gl.gxbl_amt_all_fm_proj
"
"                          + r_gl.gxbl_free_amt
"
"                          + r_gl.gxbl_ss_amt
"
"                          + p_vou_amt
"
"                          - (  NVL (v_pr_amt, 0)
"
"                             + NVL (v_po_amt, 0)
"
"                             + NVL (v_ss_amt, 0)
"
"                             + CASE WHEN p_type IN ('AP','APR') AND v_source = 'W' THEN p_vou_amt ELSE 0 END))
"
"               THEN
"
"                  Raise_Application_Error (
"
"                     -20500,
"
"                        'BUD'
"
"                     || '~'
"
"                     || r_gl.gxbl_bud_amt
"
"                     || '~'
"
"                     || NVL (v_act_amt, 0)
"
"                     || '^'
"
"                     || r_gl.gxbl_grn_amt
"
"                     || '^'
"
"                     || r_gl.gxbl_pr_amt
"
"                     || '~'
"
"                     || r_gl.gxbl_po_amt
"
"                     || '!'
"
"                     || r_gl.gxbl_mr_amt
"
"                     || '~'
"
"                     || r_gl.gxbl_amt_all_fm_proj
"
"                     || '^'
"
"                     || r_gl.gxbl_free_amt
"
"                     || '~'
"
"                     || r_gl.gxbl_ss_amt
"
"                     || '~'
"
"                     || p_vou_amt
"
"                     || '-'
"
"                     || (  NVL (v_act_amt, 0)
"
"                         + r_gl.gxbl_pr_amt
"
"                         + r_gl.gxbl_po_amt
"
"                         + r_gl.gxbl_grn_amt
"
"                         + r_gl.gxbl_mr_amt
"
"                         + r_gl.gxbl_amt_all_fm_proj
"
"                         + r_gl.gxbl_free_amt
"
"                         + r_gl.gxbl_ss_amt
"
"                         + p_vou_amt
"
"                         - (  NVL (v_pr_amt, 0)
"
"                            + NVL (v_po_amt, 0)
"
"                            + NVL (v_ss_amt, 0)))
"
"                     || '~'
"
"                     || p_acct
"
"                     || '~'
"
"                     || p_cc_code
"
"                     || '~'
"
"                     || v_bud_type
"
"                     || p_period
"
"                     || '~'
"
"                     || v_act_amt);
"
"               ELSE
"
"
"
"           BEGIN
"
"
"
"           --PROC_DEBUG_PROC('VASU'||'~'||p_type||'~'||v_pr_amt||'~'||p_vou_amt||'~'||v_pa_cls_amt||'~'||v_source||'/'||CASE
"
"
"
"        /*  Raise_Application_Error(-20999,'HRM'||'~'||p_bu||'~'||r_gl.gxbl_doc_no||'~'||r_gl.gxbl_seq_no
"
"          ||'~'||p_type||'~'||v_source||'~'||p_vou_amt||'~'||v_pr_amt);*/
"
"
"
"
"
"                  UPDATE gl_xpns_bud_ln
"
"                     SET gxbl_pr_amt =
"
"                            gxbl_pr_amt
"
"                            + CASE
"
"                                 WHEN p_type = 'PR' AND v_source = 'M'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type = 'PC'
"
"                                 THEN
"
"                                    -p_vou_amt
"
"                                 WHEN p_type = 'PO'
"
"                                      AND v_source IN ('P', 'R', 'F')
"
"                                 THEN
"
"                                    -v_pr_amt
"
"                                 WHEN p_type = 'PA'
"
"                                 THEN
"
"                                    v_pa_cls_amt
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_po_amt =
"
"                            gxbl_po_amt
"
"                            + CASE
"
"                                 WHEN p_type = 'PO'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type = 'GRN' AND v_source = 'PO'
"
"                                 THEN
"
"                                    -v_po_amt
"
"                                 WHEN p_type = 'GRNR' AND v_source = 'PO'
"
"                                 THEN
"
"                                    -p_vou_amt
"
"                                 WHEN p_type = 'PA'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type IN ('AP','APR') THEN
"
"                                 NVL(v_ap_po_amt,0)
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_ss_amt =
"
"                            gxbl_ss_amt
"
"                            + CASE
"
"                                 WHEN p_type = 'SS'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type = 'GRN' AND v_source = 'SS'
"
"                                 THEN
"
"                                    -v_ss_amt
"
"                                 WHEN p_type = 'GRNR' AND v_source = 'SS'
"
"                                 THEN
"
"                                    -p_vou_amt
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_grn_amt =
"
"                            gxbl_grn_amt
"
"                            + CASE
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T' AND func_find_glmctrl_ps_type(p_bu) <> 'G'
"
"                                      AND p_type IN ('GRN','GRNR')
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T'
"
"                                      AND p_type = 'AP' AND v_source = 'W'
"
"                                 THEN
"
"                                    CASE WHEN v_ap_po_type = 'Y' THEN 0 ELSE -p_vou_amt END
"
"                                 WHEN p_type = 'APR' AND v_source = 'W' THEN CASE WHEN v_ap_po_type = 'Y' THEN 0 ELSE p_vou_amt END
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_upd_vou_type = CASE WHEN p_type = 'GRNR' THEN 'GRN' ELSE p_type END,
"
"                         gxbl_upd_vou_pfx = p_vou_pfx,
"
"                         gxbl_upd_vou_no = p_vou_no,
"
"                         gxbl_upd_vou_line_no = p_vou_line_no,
"
"                         gxbl_upd_amt = p_vou_amt,
"
"                         gxbl_upd_vou_date = p_doc_date
"
"                   WHERE     gxbl_bu = p_bu
"
"                         AND gxbl_doc_no = r_gl.gxbl_doc_no
"
"                         AND gxbl_seq_no = r_gl.gxbl_seq_no;
"
"
"
"         PROC_DEBUG_PROC('VASU'||'~'||p_type||'~'||p_vou_amt||'~'||v_pa_cls_amt);
"
"
"
"        --EXCEPTION WHEN OTHERS THEN
"
"
"
"        --Raise_Application_Error(-20999,'HRM'||'~'||p_bu||'~'||r_gl.gxbl_doc_no||'~'||r_gl.gxbl_seq_no||'~'||p_type||'~'||v_source||'~'||p_vou_amt);
"
"
"
"            END;
"
"               END IF;
"
"            ELSE
"
"               Raise_Application_Error (
"
"                  -20074,
"
"                     'GLM'
"
"                  || '~'
"
"                  || v_bud_type
"
"                  || '~'
"
"                  || p_plnt
"
"                  || '~'
"
"                  || p_acct
"
"                  || '~'
"
"                  || p_cc_code);
"
"            END IF;
"
"
"
"            CLOSE c_gl;
"
"         ELSIF pkg_budget.func_chk_budget_type (p_bu) = 'D'
"
"               AND pkg_budget.func_get_cc_code_bud_req (p_bu, p_cc_code) =
"
"                      'Y'
"
"         THEN
"
"            OPEN c_gl (v_bud_type,
"
"                       p_plnt,
"
"                       NULL,
"
"                       p_acct,
"
"                       p_cc_code);
"
"
"
"            FETCH c_gl INTO r_gl;
"
"
"
"            IF c_gl%FOUND
"
"            THEN
"
"               IF r_gl.gxbl_allw_exc_flag = 'N'
"
"                  AND r_gl.gxbl_bud_amt <
"
"                         (  NVL (v_act_amt, 0)
"
"                          + r_gl.gxbl_pr_amt
"
"                          + r_gl.gxbl_po_amt
"
"                          + r_gl.gxbl_grn_amt
"
"                          + r_gl.gxbl_mr_amt
"
"                          + r_gl.gxbl_amt_all_fm_proj
"
"                          + r_gl.gxbl_free_amt
"
"                          + r_gl.gxbl_ss_amt
"
"                          + p_vou_amt
"
"                          - (  NVL (v_pr_amt, 0)
"
"                             + NVL (v_po_amt, 0)
"
"                             + NVL (v_ss_amt, 0)
"
"                             + CASE WHEN p_type IN ('AP','APR') AND v_source = 'W' THEN p_vou_amt ELSE 0 END))
"
"               THEN
"
"                  Raise_Application_Error (
"
"                     -20500,
"
"                     'BUD' || '~' || r_gl.gxbl_bud_amt || '~'
"
"                     || (  NVL (v_act_amt, 0)
"
"                         + r_gl.gxbl_pr_amt
"
"                         + r_gl.gxbl_po_amt
"
"                         + r_gl.gxbl_grn_amt
"
"                         + r_gl.gxbl_mr_amt
"
"                         + r_gl.gxbl_amt_all_fm_proj
"
"                         + r_gl.gxbl_free_amt
"
"                         + r_gl.gxbl_ss_amt
"
"                         + p_vou_amt
"
"                         - (  NVL (v_pr_amt, 0)
"
"                            + NVL (v_po_amt, 0)
"
"                            + NVL (v_ss_amt, 0)
"
"                            + CASE WHEN p_type IN ('AP','APR') AND v_source = 'W' THEN p_vou_amt ELSE 0 END))||' Act. Amt. '||NVL (v_act_amt, 0)||'~ PR Amt. '||'~'||r_gl.gxbl_pr_amt||' PO Amt. ~ '||r_gl.gxbl_po_amt||' GRN Amt. ~'||r_gl.gxbl_grn_amt);
"
"               ELSE
"
"                  UPDATE gl_xpns_bud_ln
"
"                     SET gxbl_pr_amt =
"
"                            gxbl_pr_amt
"
"                            + CASE
"
"                                 WHEN p_type = 'PR' AND v_source = 'M'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type = 'PC'
"
"                                 THEN
"
"                                    -p_vou_amt
"
"                                 WHEN p_type = 'PO'
"
"                                      AND v_source IN ('P', 'R', 'F')
"
"                                 THEN
"
"                                    -v_pr_amt
"
"                                 WHEN p_type = 'PA'
"
"                                 THEN
"
"                                    v_pa_cls_amt
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_po_amt =
"
"                            gxbl_po_amt
"
"                            + CASE
"
"                                 WHEN p_type = 'PO'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type = 'GRN' AND v_source = 'PO'
"
"                                 THEN
"
"                                    -v_po_amt
"
"                                 WHEN p_type = 'GRNR' AND v_source = 'PO'
"
"                                 THEN
"
"                                    -p_vou_amt
"
"                                 WHEN p_type = 'PA'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                WHEN p_type IN ('AP','APR') THEN
"
"                                 NVL(v_ap_po_amt,0)
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_ss_amt =
"
"                            gxbl_ss_amt
"
"                            + CASE
"
"                                 WHEN p_type = 'SS'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type = 'GRN' AND v_source = 'SS'
"
"                                 THEN
"
"                                    -v_ss_amt
"
"                                 WHEN p_type = 'GRNR' AND v_source = 'SS'
"
"                                 THEN
"
"                                    -p_vou_amt
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_grn_amt =
"
"                            gxbl_grn_amt
"
"                            + CASE
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T' AND func_find_glmctrl_ps_type(p_bu) <> 'G'
"
"                                      AND p_type IN ('GRN','GRNR')
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T'
"
"                                      AND p_type = 'AP' AND v_source = 'W'
"
"                                 THEN
"
"                                    CASE WHEN v_ap_po_type = 'Y' THEN 0 ELSE -p_vou_amt END
"
"                                 WHEN p_type = 'APR' AND v_source = 'W' THEN CASE WHEN v_ap_po_type = 'Y' THEN 0 ELSE p_vou_amt END
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_upd_vou_type = CASE WHEN p_type = 'GRNR' THEN 'GRN' ELSE p_type END,
"
"                         gxbl_upd_vou_pfx = p_vou_pfx,
"
"                         gxbl_upd_vou_no = p_vou_no,
"
"                         gxbl_upd_vou_line_no = p_vou_line_no,
"
"                         gxbl_upd_amt = p_vou_amt,
"
"                         gxbl_upd_vou_date = p_doc_date
"
"                   WHERE     gxbl_bu = p_bu
"
"                         AND gxbl_doc_no = r_gl.gxbl_doc_no
"
"                         AND gxbl_seq_no = r_gl.gxbl_seq_no;
"
"               END IF;
"
"            ELSE
"
"               Raise_Application_Error (
"
"                  -20074,
"
"                     'GLM'
"
"                  || '~'
"
"                  || v_bud_type
"
"                  || '~'
"
"                  || p_plnt
"
"                  || '~'
"
"                  || p_acct
"
"                  || '~'
"
"                  || p_cc_code);
"
"            END IF;
"
"
"
"            CLOSE c_gl;
"
"         ELSIF pkg_budget.func_chk_budget_type (p_bu) = 'G'
"
"               AND pkg_budget.func_get_acct_grp_bud_req (p_bu, p_acct) = 'Y'
"
"         THEN
"
"            v_acct_grp := pkg_budget.func_get_acct_grp (p_bu, p_acct);
"
"
"
"            OPEN c_gl (v_bud_type,
"
"                       p_plnt,
"
"                       v_acct_grp,
"
"                       p_acct,
"
"                       p_cc_code);
"
"
"
"            FETCH c_gl INTO r_gl;
"
"
"
"            IF c_gl%FOUND
"
"            THEN
"
"               IF r_gl.gxbl_allw_exc_flag = 'N'
"
"                  AND r_gl.gxbl_bud_amt <
"
"                         (  NVL (v_act_amt, 0)
"
"                          + r_gl.gxbl_pr_amt
"
"                          + r_gl.gxbl_po_amt
"
"                          + r_gl.gxbl_grn_amt
"
"                          + r_gl.gxbl_mr_amt
"
"                          + r_gl.gxbl_amt_all_fm_proj
"
"                          + r_gl.gxbl_free_amt
"
"                          + r_gl.gxbl_ss_amt
"
"                          + p_vou_amt
"
"                          - (  NVL (v_pr_amt, 0)
"
"                             + NVL (v_po_amt, 0)
"
"                             + NVL (v_ss_amt, 0)
"
"                             + CASE WHEN p_type IN ('AP','APR') AND v_source = 'W' THEN p_vou_amt ELSE 0 END ))
"
"               THEN
"
"                  Raise_Application_Error (
"
"                     -20500,
"
"                     'BUD' || '~' || r_gl.gxbl_bud_amt || '~'
"
"                     || (  NVL (v_act_amt, 0)
"
"                         + r_gl.gxbl_pr_amt
"
"                         + r_gl.gxbl_po_amt
"
"                         + r_gl.gxbl_grn_amt
"
"                         + r_gl.gxbl_mr_amt
"
"                         + r_gl.gxbl_amt_all_fm_proj
"
"                         + r_gl.gxbl_free_amt
"
"                         + r_gl.gxbl_ss_amt
"
"                         + p_vou_amt
"
"                         - (  NVL (v_pr_amt, 0)
"
"                            + NVL (v_po_amt, 0)
"
"                            + NVL (v_ss_amt, 0))));
"
"               ELSE
"
"                  UPDATE gl_xpns_bud_ln
"
"                     SET gxbl_pr_amt =
"
"                            gxbl_pr_amt
"
"                            + CASE
"
"                                 WHEN p_type = 'PR' AND v_source = 'M'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type = 'PC'
"
"                                 THEN
"
"                                    -p_vou_amt
"
"                                 WHEN p_type = 'PO'
"
"                                      AND v_source IN ('P', 'R', 'F')
"
"                                 THEN
"
"                                    -v_pr_amt
"
"                                 WHEN p_type = 'PA'
"
"                                 THEN
"
"                                    v_pa_cls_amt
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_po_amt =
"
"                            gxbl_po_amt
"
"                            + CASE
"
"                                 WHEN p_type = 'PO'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type = 'GRN' AND v_source = 'PO'
"
"                                 THEN
"
"                                    -v_po_amt
"
"                                 WHEN p_type = 'GRNR' AND v_source = 'PO'
"
"                                 THEN
"
"                                    -p_vou_amt
"
"                                 WHEN p_type = 'PA'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                WHEN p_type IN ('AP','APR') THEN
"
"                                 NVL(v_ap_po_amt,0)
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_ss_amt =
"
"                            gxbl_ss_amt
"
"                            + CASE
"
"                                 WHEN p_type = 'SS'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type = 'GRN' AND v_source = 'SS'
"
"                                 THEN
"
"                                    -v_ss_amt
"
"                                 WHEN p_type = 'GRNR' AND v_source = 'SS'
"
"                                 THEN
"
"                                    -p_vou_amt
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_grn_amt =
"
"                            gxbl_grn_amt
"
"                            + CASE
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T' AND func_find_glmctrl_ps_type(p_bu) <> 'G'
"
"                                      AND p_type IN ('GRN','GRNR')
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T'
"
"                                      AND p_type = 'AP' AND v_source = 'W'
"
"                                 THEN
"
"                                    CASE WHEN v_ap_po_type = 'Y' THEN 0 ELSE -p_vou_amt END
"
"                                 WHEN p_type = 'APR' AND v_source = 'W' THEN
"
"                                    CASE WHEN v_ap_po_type = 'Y' THEN 0 ELSE p_vou_amt END
"
"                                  ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_upd_vou_type = CASE WHEN p_type = 'GRNR' THEN 'GRN' ELSE p_type END,
"
"                         gxbl_upd_vou_pfx = p_vou_pfx,
"
"                         gxbl_upd_vou_no = p_vou_no,
"
"                         gxbl_upd_vou_line_no = p_vou_line_no,
"
"                         gxbl_upd_amt = p_vou_amt,
"
"                         gxbl_upd_vou_date = p_doc_date
"
"                   WHERE     gxbl_bu = p_bu
"
"                         AND gxbl_doc_no = r_gl.gxbl_doc_no
"
"                         AND gxbl_seq_no = r_gl.gxbl_seq_no;
"
"               END IF;
"
"            ELSE
"
"               Raise_Application_Error (
"
"                  -20074,
"
"                     'GLM'
"
"                  || '~'
"
"                  || v_bud_type
"
"                  || '~'
"
"                  || v_acct_grp
"
"                  || '~'
"
"                  || p_plnt
"
"                  || '~'
"
"                  || p_acct
"
"                  || '~'
"
"                  || p_cc_code);
"
"            END IF;
"
"
"
"            CLOSE c_gl;
"
"         ELSIF     pkg_budget.func_chk_budget_type (p_bu) = 'H'
"
"               AND pkg_budget.func_get_acct_grp_bud_req (p_bu, p_acct) = 'Y'
"
"               AND pkg_budget.func_get_plnt_bud_req (p_bu, p_plnt) = 'Y'
"
"         THEN
"
"            v_acct_grp := pkg_budget.func_get_acct_grp (p_bu, p_acct);
"
"
"
"            OPEN c_gl (v_bud_type,
"
"                       p_plnt,
"
"                       v_acct_grp,
"
"                       p_acct,
"
"                       p_cc_code);
"
"
"
"            FETCH c_gl INTO r_gl;
"
"
"
"            IF c_gl%FOUND
"
"            THEN
"
"               IF r_gl.gxbl_allw_exc_flag = 'N'
"
"                  AND r_gl.gxbl_bud_amt <
"
"                         (  NVL (v_act_amt, 0)
"
"                          + r_gl.gxbl_pr_amt
"
"                          + r_gl.gxbl_po_amt
"
"                          + r_gl.gxbl_grn_amt
"
"                          + r_gl.gxbl_mr_amt
"
"                          + r_gl.gxbl_amt_all_fm_proj
"
"                          + r_gl.gxbl_free_amt
"
"                          + r_gl.gxbl_ss_amt
"
"                          + p_vou_amt
"
"                          - (  NVL (v_pr_amt, 0)
"
"                             + NVL (v_po_amt, 0)
"
"                             + NVL (v_ss_amt, 0)
"
"                             + CASE WHEN p_type IN ('AP','APR') AND v_source = 'W' THEN p_vou_amt ELSE 0 END ))
"
"               THEN
"
"                  Raise_Application_Error (
"
"                     -20500,
"
"                     'BUD' || '~' || r_gl.gxbl_bud_amt || '~'
"
"                     || (  NVL (v_act_amt, 0)
"
"                         + r_gl.gxbl_pr_amt
"
"                         + r_gl.gxbl_po_amt
"
"                         + r_gl.gxbl_grn_amt
"
"                         + r_gl.gxbl_mr_amt
"
"                         + r_gl.gxbl_amt_all_fm_proj
"
"                         + r_gl.gxbl_free_amt
"
"                         + r_gl.gxbl_ss_amt
"
"                         + p_vou_amt
"
"                         - (  NVL (v_pr_amt, 0)
"
"                            + NVL (v_po_amt, 0)
"
"                            + NVL (v_ss_amt, 0))));
"
"               ELSE
"
"                  UPDATE gl_xpns_bud_ln
"
"                     SET gxbl_pr_amt =
"
"                            gxbl_pr_amt
"
"                            + CASE
"
"                                 WHEN p_type = 'PR' AND v_source = 'M'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type = 'PC'
"
"                                 THEN
"
"                                    -p_vou_amt
"
"                                 WHEN p_type = 'PO'
"
"                                      AND v_source IN ('P', 'R', 'F')
"
"                                 THEN
"
"                                    -v_pr_amt
"
"                                 WHEN p_type = 'PA'
"
"                                 THEN
"
"                                    v_pa_cls_amt
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_po_amt =
"
"                            gxbl_po_amt
"
"                            + CASE
"
"                                 WHEN p_type = 'PO'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type = 'GRN' AND v_source = 'PO'
"
"                                 THEN
"
"                                    -v_po_amt
"
"                                 WHEN p_type = 'GRNR' AND v_source = 'PO'
"
"                                 THEN
"
"                                    -p_vou_amt
"
"                                 WHEN p_type = 'PA'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                WHEN p_type IN ('AP','APR') THEN
"
"                                 NVL(v_ap_po_amt,0)
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_ss_amt =
"
"                            gxbl_ss_amt
"
"                            + CASE
"
"                                 WHEN p_type = 'SS'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type = 'GRN' AND v_source = 'SS'
"
"                                 THEN
"
"                                    -v_ss_amt
"
"                                 WHEN p_type = 'GRNR' AND v_source = 'SS'
"
"                                 THEN
"
"                                    -p_vou_amt
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_grn_amt =
"
"                            gxbl_grn_amt
"
"                            + CASE
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T' AND func_find_glmctrl_ps_type(p_bu) <> 'G'
"
"                                      AND p_type IN ('GRN','GRNR')
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T'
"
"                                      AND p_type = 'AP' AND v_source = 'W'
"
"                                 THEN
"
"                                    CASE WHEN v_ap_po_type = 'Y' THEN 0 ELSE -p_vou_amt END
"
"                                 WHEN p_type = 'APR' AND v_source = 'W' THEN CASE WHEN v_ap_po_type = 'Y' THEN 0 ELSE p_vou_amt END
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         gxbl_upd_vou_type = CASE WHEN p_type = 'GRNR' THEN 'GRN' ELSE p_type END,
"
"                         gxbl_upd_vou_pfx = p_vou_pfx,
"
"                         gxbl_upd_vou_no = p_vou_no,
"
"                         gxbl_upd_vou_line_no = p_vou_line_no,
"
"                         gxbl_upd_amt = p_vou_amt,
"
"                         gxbl_upd_vou_date = p_doc_date
"
"                   WHERE     gxbl_bu = p_bu
"
"                         AND gxbl_doc_no = r_gl.gxbl_doc_no
"
"                         AND gxbl_seq_no = r_gl.gxbl_seq_no;
"
"               END IF;
"
"            ELSE
"
"               Raise_Application_Error (
"
"                  -20074,
"
"                     'GLM'
"
"                  || '~'
"
"                  || v_bud_type
"
"                  || '~'
"
"                  || v_acct_grp
"
"                  || '~'
"
"                  || p_plnt
"
"                  || '~'
"
"                  || p_acct
"
"                  || '~'
"
"                  || p_cc_code);
"
"            END IF;
"
"
"
"            CLOSE c_gl;
"
"         END IF;
"
"      ELSE
"
"         IF pkg_budget.func_get_acct_bud_req (p_bu, p_acct) = 'Y'
"
"         THEN
"
"            OPEN c_cb;
"
"
"
"            FETCH c_cb INTO r_cb;
"
"
"
"            IF c_cb%FOUND
"
"            THEN
"
"               IF r_cb.cb_bud_amt <
"
"                     (  NVL (v_act_amt, 0)
"
"                      + r_cb.cb_pr_amt
"
"                      + r_cb.cb_po_amt
"
"                      + r_cb.cb_grn_amt
"
"                      + r_cb.cb_miv_amt
"
"                      + p_vou_amt
"
"                      - (  NVL (v_pr_amt, 0)
"
"                         + NVL (v_po_amt, 0)
"
"                         + NVL (v_ss_amt, 0)
"
"                         + CASE WHEN p_type IN ('AP','APR') AND v_source = 'W' THEN p_vou_amt ELSE 0 END ))
"
"               THEN
"
"                  Raise_Application_Error (
"
"                     -20500,
"
"                     'BUD' || '~' || r_cb.cb_bud_amt || '~'
"
"                     || (  NVL (v_act_amt, 0)
"
"                         + r_cb.cb_pr_amt
"
"                         + r_cb.cb_po_amt
"
"                         + r_cb.cb_grn_amt
"
"                         + r_cb.cb_miv_amt
"
"                         + p_vou_amt
"
"                         - (  NVL (v_pr_amt, 0)
"
"                            + NVL (v_po_amt, 0)
"
"                            + NVL (v_ss_amt, 0))));
"
"               ELSE
"
"                  UPDATE cptl_budget
"
"                     SET cb_pr_amt =
"
"                            cb_pr_amt
"
"                            + CASE
"
"                                 WHEN p_type = 'PR'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type = 'PC'
"
"                                 THEN
"
"                                    -p_vou_amt
"
"                                 WHEN p_type = 'PO'
"
"                                      AND v_source IN ('P', 'R', 'F')
"
"                                 THEN
"
"                                    -v_pr_amt
"
"                                 WHEN p_type = 'PA'
"
"                                 THEN
"
"                                    v_pa_cls_amt
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         cb_po_amt =
"
"                            cb_po_amt
"
"                            + CASE
"
"                                 WHEN p_type = 'PO'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN p_type = 'GRN' AND v_source = 'PO'
"
"                                 THEN
"
"                                    -v_po_amt
"
"                                 WHEN p_type = 'GRNR' AND v_source = 'PO'
"
"                                 THEN
"
"                                    -p_vou_amt
"
"                                 WHEN p_type = 'PA'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                WHEN p_type IN ('AP','APR') THEN
"
"                                 NVL(v_ap_po_amt,0)
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         cb_grn_amt =
"
"                            cb_grn_amt
"
"                            + CASE WHEN func_find_glmctrl_ps_type(p_bu) = 'G' THEN 0 ELSE  CASE
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T'
"
"                                      AND p_type IN ('GRN','GRNR')
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T'
"
"                                      AND p_type = 'AP' AND v_source = 'W'
"
"                                 THEN
"
"                                    -p_vou_amt
"
"                                WHEN p_type = 'APR' AND v_source = 'W' THEN CASE WHEN v_ap_po_type = 'Y' THEN 0 ELSE p_vou_amt END
"
"                                 ELSE
"
"                                    0
"
"                              END END,
"
"                         cb_miv_amt =
"
"                            cb_miv_amt
"
"                            + CASE
"
"                                 WHEN p_type = 'MIV' THEN p_vou_amt
"
"                                 ELSE 0
"
"                              END
"
"                   WHERE     cb_bu = p_bu
"
"                         AND cb_doc_no = r_cb.cb_doc_no
"
"                         AND cb_rev_no = r_cb.cb_rev_no
"
"                         AND cb_acct_id = r_cb.cb_acct_id
"
"                         AND cb_sub_proj_id = r_cb.cb_sub_proj_id
"
"                         AND cb_status = 'A';
"
"               END IF;
"
"            ELSE
"
"               Raise_Application_Error (
"
"                  -20074,
"
"                  'GLM' || '~' || p_plnt || '~' || p_acct || '~' || p_cc_code);
"
"            END IF;
"
"
"
"            CLOSE c_cb;
"
"         END IF;
"
"      END IF;
"
"   END proc_upd_val_fr_xpns_cap_budget;
"
"END pkg_budget;"
/
