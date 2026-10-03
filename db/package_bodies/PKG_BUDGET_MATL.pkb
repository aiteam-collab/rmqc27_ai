CREATE OR REPLACE
"PACKAGE BODY        pkg_budget_matl
"
"AS
"
"   FUNCTION func_chk_budget_type (p_bu VARCHAR2)
"
"      RETURN VARCHAR2
"
"   IS
"
"      v_bud_type   VARCHAR2 (2);
"
"   BEGIN
"
"      BEGIN
"
"         SELECT glmctrl_matl_bud_type
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
"   PROCEDURE proc_chk_val_fr_matl_budget (
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
"     -- p_acct           VARCHAR2,
"
"     -- p_cc_code        VARCHAR2,
"
"      p_cls_or_grp_id  VARCHAR2,
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
"         cls_or_grp_id  VARCHAR2)
"
"      IS
"
"         SELECT *
"
"           FROM material_bud
"
"          WHERE     mb_bu = p_bu
"
"                AND mb_status = 'A'
"
"                AND mb_bud_type = c_bud_type
"
"                AND c_bud_type = 'SC'
"
"                AND mb_fin_year = p_year
"
"                AND p_period BETWEEN mb_period_from AND mb_period_to
"
"                AND mb_sub_cls_id = cls_or_grp_id
"
"         UNION
"
"         SELECT *
"
"           FROM material_bud
"
"          WHERE     mb_bu = p_bu
"
"                AND mb_status = 'A'
"
"                AND mb_bud_type = c_bud_type
"
"                AND c_bud_type = 'C'
"
"                AND mb_fin_year = p_year
"
"                AND p_period BETWEEN mb_period_from AND mb_period_to
"
"                AND mb_cls_id = cls_or_grp_id
"
"         UNION
"
"         SELECT *
"
"           FROM material_bud
"
"          WHERE     mb_bu = p_bu
"
"                AND mb_status = 'A'
"
"                AND mb_bud_type = c_bud_type
"
"                AND c_bud_type = 'G'
"
"                AND mb_fin_year = p_year
"
"                AND p_period BETWEEN mb_period_from AND mb_period_to
"
"                AND mb_grp_id = cls_or_grp_id
"
"         UNION
"
"         SELECT *
"
"           FROM material_bud
"
"          WHERE     mb_bu = p_bu
"
"                AND mb_status = 'A'
"
"                AND mb_bud_type = c_bud_type
"
"                AND c_bud_type = 'SG'
"
"                AND mb_fin_year = p_year
"
"                AND p_period BETWEEN mb_period_from AND mb_period_to
"
"                AND mb_sub_grp_id = cls_or_grp_id  ;
"
"        CURSOR C1
"
"        IS
"
"        SELECT subcls_bud_req_flag
"
"             FROM sub_classes
"
"           WHERE subcls_bu=p_bu
"
"               AND subcls_id = p_cls_or_grp_id;
"
"
"
"        CURSOR C2
"
"        IS
"
"        SELECT class_bud_req_flag
"
"             FROM classes
"
"           WHERE class_bu=p_bu
"
"               AND class_id = p_cls_or_grp_id;
"
"
"
"       CURSOR C3
"
"         IS
"
"         SELECT  pgrp_bud_req_flag
"
"             FROM prod_group
"
"           WHERE pgrp_bu=p_bu
"
"               AND pgrp_group_id = p_cls_or_grp_id;
"
"
"
"       CURSOR C4
"
"        IS
"
"        SELECT  psgrp_bud_req_flag
"
"             FROM prod_sub_group
"
"           WHERE psgrp_bu=p_bu
"
"              AND psgrp_subgroup_id = p_cls_or_grp_id;
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
"      v_acct_grp   VARCHAR2 (10);
"
"      r_gl         c_gl%ROWTYPE;
"
"     -- r_cb         c_cb%ROWTYPE;
"
"      v_bud_type   VARCHAR2 (2);
"
"      v_act_amt    NUMBER;
"
"      cr1    c1%ROWTYPE;
"
"      cr2    c2%ROWTYPE;
"
"      cr3    c3%ROWTYPE;
"
"      cr4    c4%ROWTYPE;
"
"   BEGIN
"
"
"
"      v_bud_type := pkg_budget_matl.func_chk_budget_type (p_bu);
"
"      OPEN c1;
"
"      FETCH C1 INTO CR1;
"
"      OPEN C2;
"
"      FETCH C2 INTO CR2;
"
"      OPEN C3;
"
"      FETCH C3 INTO CR3;
"
"     -- OPEN C3;
"
"     -- FETCH C3 INTO CR3;
"
"      OPEN C4;
"
"      FETCH C4 INTO CR4;
"
"
"
"--raise_application_error(-20999,v_bud_type||';'||p_cls_or_grp_id||';'||cr1.subcls_bud_req_flag);
"
"
"
"         IF pkg_budget_matl.func_chk_budget_type (p_bu) = 'SC'  AND CR1.subcls_bud_req_flag ='Y'     THEN
"
"            OPEN c_gl (v_bud_type,
"
"                       p_cls_or_grp_id);
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
"       --raise_Application_error(-20999,NVL(p_sou_doc_amt,0)||'~'||r_gl.mb_pr_amt||'~'||p_vou_amt);
"
"               IF r_gl.mb_allw_exc_flag = 'N'
"
"                  AND r_gl.mb_bud_amt <
"
"                         (  NVL (r_gl.mb_act_amt, 0)
"
"                          + r_gl.mb_pr_amt
"
"                          + r_gl.mb_po_amt
"
"                          + r_gl.mb_grn_amt
"
"                          + r_gl.mb_miv_amt
"
"                          + p_vou_amt
"
"                          - NVL(p_sou_doc_amt,0))
"
"               THEN
"
"                  Raise_Application_Error (
"
"                     -20541,
"
"                     'BUD'||r_gl.mb_sub_cls_id|| '~' || r_gl.mb_bud_amt || '~'
"
"                     || (  NVL (r_gl.mb_act_amt, 0)
"
"                         + r_gl.mb_pr_amt
"
"                         + r_gl.mb_po_amt
"
"                         + r_gl.mb_grn_amt
"
"                         + r_gl.mb_miv_amt
"
"                         + p_vou_amt
"
"                         - NVL(p_sou_doc_amt,0)));
"
"
"
"               END IF;
"
"
"
"            ELSE
"
"               Raise_Application_Error (
"
"                  -20541 ,
"
"                     'GLM'
"
"                  || '~'
"
"                  || v_bud_type
"
"               );
"
"            END IF;
"
"
"
"            CLOSE c_gl;
"
"            CLOSE C1;
"
"
"
"         ELSIF     pkg_budget_matl.func_chk_budget_type (p_bu) = 'C'
"
"                AND CR2.class_bud_req_flag='Y'
"
"         THEN
"
"
"
"            OPEN c_gl (v_bud_type,
"
"                       p_cls_or_grp_id);
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
"               IF r_gl.mb_allw_exc_flag = 'N'
"
"                  AND r_gl.mb_bud_amt <
"
"                         (  NVL (r_gl.mb_act_amt, 0)
"
"                          + r_gl.mb_pr_amt
"
"                          + r_gl.mb_po_amt
"
"                          + r_gl.mb_grn_amt
"
"                          + r_gl.mb_miv_amt
"
"                          + p_vou_amt
"
"                          - NVL(p_sou_doc_amt,0))
"
"               THEN
"
"               --raise_application_error(-20999,p_sou_doc_amt||'~'||p_vou_amt||'~'||r_gl.gxbl_grn_amt);
"
"                  Raise_Application_Error (
"
"                     -20541,
"
"                     'BUD' || '~' || r_gl.mb_bud_amt || '~'
"
"                     || (  NVL (r_gl.mb_act_amt, 0)
"
"                         + r_gl.mb_pr_amt
"
"                         + r_gl.mb_po_amt
"
"                         + r_gl.mb_grn_amt
"
"                         + r_gl.mb_miv_amt
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
"                  -20541 ,
"
"                     'GLM'
"
"                  || '~'
"
"                  || v_bud_type
"
");
"
"            END IF;
"
"
"
"            CLOSE c_gl;
"
"             CLOSE C2;
"
"
"
"         ELSIF pkg_budget_matl.func_chk_budget_type (p_bu) = 'G' AND CR3.pgrp_bud_req_flag='Y' THEN
"
"
"
"            OPEN c_gl (v_bud_type,
"
"                       p_cls_or_grp_id);
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
"               IF r_gl.mb_allw_exc_flag = 'N'
"
"                  AND r_gl.mb_bud_amt <
"
"                         (  NVL (r_gl.mb_act_amt, 0)
"
"                          + r_gl.mb_pr_amt
"
"                          + r_gl.mb_po_amt
"
"                          + r_gl.mb_grn_amt
"
"                          + r_gl.mb_miv_amt
"
"                          + p_vou_amt
"
"                          - NVL(p_sou_doc_amt,0))
"
"               THEN
"
"                  Raise_Application_Error (
"
"                     -20541,
"
"                     'BUD' || '~' || r_gl.mb_bud_amt || '~'
"
"                     || (  NVL (r_gl.mb_act_amt, 0)
"
"                         + r_gl.mb_pr_amt
"
"                         + r_gl.mb_po_amt
"
"                         + r_gl.mb_grn_amt
"
"                         + r_gl.mb_miv_amt
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
"                  -20541 ,
"
"                     'GLM'
"
"                  || '~'
"
"                  || v_bud_type);
"
"            END IF;
"
"
"
"            CLOSE c_gl;
"
"            CLOSE C3;
"
"         ELSIF pkg_budget_matl.func_chk_budget_type (p_bu) = 'SG' AND CR4.psgrp_bud_req_flag='Y' THEN
"
"
"
"            OPEN c_gl (v_bud_type,
"
"                      p_cls_or_grp_id);
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
"               IF r_gl.mb_allw_exc_flag = 'N'
"
"                  AND r_gl.mb_bud_amt <
"
"                         (  NVL (r_gl.mb_act_amt, 0)
"
"                          + r_gl.mb_pr_amt
"
"                          + r_gl.mb_po_amt
"
"                          + r_gl.mb_grn_amt
"
"                          + r_gl.mb_miv_amt
"
"                          + p_vou_amt
"
"                          - NVL(p_sou_doc_amt,0))
"
"               THEN
"
"                  Raise_Application_Error (
"
"                     -20541,
"
"                     'BUD' || '~' || r_gl.mb_bud_amt || '~'
"
"                     || (  NVL (r_gl.mb_act_amt, 0)
"
"                         + r_gl.mb_pr_amt
"
"                         + r_gl.mb_po_amt
"
"                         + r_gl.mb_grn_amt
"
"                         + r_gl.mb_miv_amt
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
"                  -20541 ,
"
"                     'GLM'
"
"                  || '~'
"
"                  || v_bud_type);
"
"            END IF;
"
"
"
"            CLOSE c_gl;
"
"            CLOSE C4;
"
"      END IF;
"
"   END proc_chk_val_fr_matl_budget;
"
"
"
"   PROCEDURE proc_upd_val_fr_matl_budget (
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
"     -- p_cc_code        VARCHAR2,
"
"      p_cls_or_grp_id  VARCHAR2,
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
"         cls_or_grp_id  VARCHAR2)
"
"      IS
"
"         SELECT *
"
"           FROM material_bud
"
"          WHERE     mb_bu = p_bu
"
"                AND mb_status = 'A'
"
"                AND mb_bud_type = c_bud_type
"
"                AND c_bud_type = 'SC'
"
"                AND mb_fin_year = p_year
"
"                AND p_period BETWEEN mb_period_from AND mb_period_to
"
"                AND mb_sub_cls_id = cls_or_grp_id
"
"         UNION
"
"         SELECT *
"
"           FROM material_bud
"
"          WHERE     mb_bu = p_bu
"
"                AND mb_status = 'A'
"
"                AND mb_bud_type = c_bud_type
"
"                AND c_bud_type = 'C'
"
"                AND mb_fin_year = p_year
"
"                AND p_period BETWEEN mb_period_from AND mb_period_to
"
"                AND mb_cls_id = cls_or_grp_id
"
"         UNION
"
"         SELECT *
"
"           FROM material_bud
"
"          WHERE     mb_bu = p_bu
"
"                AND mb_status = 'A'
"
"                AND mb_bud_type = c_bud_type
"
"                AND c_bud_type = 'G'
"
"                AND mb_fin_year = p_year
"
"                AND p_period BETWEEN mb_period_from AND mb_period_to
"
"                AND mb_grp_id = cls_or_grp_id
"
"         UNION
"
"         SELECT *
"
"           FROM material_bud
"
"          WHERE     mb_bu = p_bu
"
"                AND mb_status = 'A'
"
"                AND mb_bud_type = c_bud_type
"
"                AND c_bud_type = 'SG'
"
"                AND mb_fin_year = p_year
"
"                AND p_period BETWEEN mb_period_from AND mb_period_to
"
"                AND mb_sub_grp_id = cls_or_grp_id  ;
"
"
"
"        CURSOR C1
"
"        IS
"
"        SELECT subcls_bud_req_flag
"
"             FROM sub_classes
"
"           WHERE subcls_bu=p_bu
"
"               AND subcls_id = p_cls_or_grp_id;
"
"
"
"        CURSOR C2
"
"        IS
"
"        SELECT class_bud_req_flag
"
"             FROM classes
"
"           WHERE class_bu=p_bu
"
"               AND class_id = p_cls_or_grp_id;
"
"
"
"       CURSOR C3
"
"         IS
"
"         SELECT  pgrp_bud_req_flag
"
"             FROM prod_group
"
"           WHERE pgrp_bu=p_bu
"
"               AND pgrp_group_id = p_cls_or_grp_id;
"
"
"
"       CURSOR C4
"
"        IS
"
"        SELECT  psgrp_bud_req_flag
"
"             FROM prod_sub_group
"
"           WHERE psgrp_bu=p_bu
"
"              AND psgrp_subgroup_id = p_cls_or_grp_id;
"
"
"
"
"
"
"
"      v_acct_grp       VARCHAR2 (10);
"
"      r_gl             c_gl%ROWTYPE;
"
"    --  r_cb             c_cb%ROWTYPE;
"
"      v_bud_type       VARCHAR2 (2);
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
"      v_grn_amt        NUMBER;
"
"      V_MIV_AMT        NUMBER;
"
"      cr1     c1%ROWTYPE;
"
"      cr2     c2%ROWTYPE;
"
"      cr3     c3%ROWTYPE;
"
"      cr4     c4%ROWTYPE;
"
"   BEGIN
"
" --raise_application_error(-20999,p_year);
"
"        v_bud_type := pkg_budget_matl.func_chk_budget_type (p_bu);
"
"
"
"
"
"
"
"      /*  RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||func_find_budget_lgr_bal_new(p_bu,
"
"                                               p_year,
"
"                                               p_acct => CASE WHEN v_bud_type IN ('A','B','C') THEN p_acct ELSE NULL END,
"
"                                               p_acc_grp => CASE WHEN v_bud_type IN ('G','H') AND pkg_budget_matl.func_get_budget_type(p_bu,p_acct) = 'XB' THEN pkg_budget_matl.func_get_acct_grp(p_bu,p_acct) ELSE NULL END,
"
"                                               p_plnt => CASE WHEN v_bud_type IN ('B','H') AND pkg_budget_matl.func_get_budget_type(p_bu,p_acct) = 'XB' THEN p_plnt ELSE NULL END,
"
"                                               p_cc_code => CASE WHEN v_bud_type IN ('C','D') AND pkg_budget_matl.func_get_budget_type(p_bu,p_acct) = 'XB' THEN p_cc_code ELSE NULL END,
"
"                                               p_bud_type => CASE WHEN pkg_budget_matl.func_get_budget_type(p_bu,p_acct) = 'CWP' THEN 'CB' ELSE 'XB' END
"
"                                              ));             */
"
"      --raise_application_error(-20999,p_year||'~'||CASE WHEN v_bud_type IN ('A','B','C') THEN p_acct ELSE NULL END||'~'||CASE WHEN v_bud_type IN ('G','H') AND pkg_budget_matl.func_get_budget_type(p_bu,p_acct) = 'XB' THEN pkg_budget_matl.func_get_acct_grp(p_bu,p_acct) ELSE NULL END||'~'||CASE WHEN v_bud_type IN ('B','H') AND pkg_budget_matl.func_get_budget_type(p_bu,p_acct) = 'XB' THEN p_plnt ELSE NULL END||'~'||CASE WHEN v_bud_type IN ('C','D') AND pkg_budget_matl.func_get_budget_type(p_bu,p_acct) = 'XB' THEN p_cc_code ELSE NULL END||'~'|| CASE WHEN v_bud_type IN ('A','B','C') THEN p_acct ELSE NULL END||'~'||CASE WHEN pkg_budget_matl.func_get_budget_type(p_bu,p_acct) = 'CWP' THEN 'CB' ELSE 'XB' END);
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
"         v_grn_amt:= 0;
"
"         v_miv_amt:= 0;
"
"        -- v_ss_amt := 0;
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
"         IF v_source IN ('P', 'R', 'F') then
"
"            BEGIN
"
"               SELECT NVL (
"
"                         SUM (
"
"                            pol_ordered_qty
"
"                            * (prl_bc_unit_cost * prl_conv_factor)),
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
"      ELSIF p_type = 'GRN'
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
"                WHERE     poh_bu = pol_bu
"
"                      AND poh_order_no = pol_order_no
"
"                      AND pol_bu = porl_bu
"
"                      AND pol_order_no = porl_po_no
"
"                      AND pol_seq_no = porl_po_seq_no
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
"      END IF;
"
"     -- BEGIN
"
"
"
"      OPEN c1;
"
"      FETCH C1 INTO CR1;
"
"      OPEN C2;
"
"      FETCH C2 INTO CR2;
"
"      OPEN C3;
"
"      FETCH C3 INTO CR3;
"
"      OPEN C4;
"
"      FETCH C4 INTO CR4;
"
" --  RAISE_APPLICATION_ERROR(-20999,'HRM'||p_type||'~'||pkg_budget_matl.func_chk_budget_type (p_bu)||'~'||cr1.subcls_bud_req_flag);
"
"         IF pkg_budget_matl.func_chk_budget_type (p_bu) = 'SC'
"
"            AND cr1.subcls_bud_req_flag = 'Y'
"
"         THEN
"
"            OPEN c_gl (v_bud_type,
"
"                       p_cls_or_grp_id);
"
"
"
"            FETCH c_gl INTO r_gl;
"
"            IF c_gl%FOUND
"
"            THEN
"
"               IF r_gl.mb_allw_exc_flag = 'N'
"
"                  AND r_gl.mb_bud_amt <
"
"                         (  NVL (r_gl.mb_act_amt, 0)
"
"                          + r_gl.mb_pr_amt
"
"                          + r_gl.mb_po_amt
"
"                          + r_gl.mb_grn_amt
"
"                          + r_gl.mb_miv_amt
"
"                          + p_vou_amt
"
"                          - (  NVL (v_pr_amt, 0)
"
"                             + NVL (v_po_amt, 0)
"
"                             ))
"
"               THEN
"
"                  Raise_Application_Error (
"
"                     -20541,
"
"                     'BUD' || '~' || r_gl.mb_bud_amt || '~'
"
"                     || (  NVL (r_gl.mb_act_amt, 0)
"
"                         + r_gl.mb_pr_amt
"
"                         + r_gl.mb_po_amt
"
"                         + r_gl.mb_grn_amt
"
"                         + r_gl.mb_miv_amt
"
"                         + p_vou_amt
"
"                         - (  NVL (v_pr_amt, 0)
"
"                            + NVL (v_po_amt, 0)
"
"                            )));
"
"               ELSE
"
"          -- raise_application_error(-20999,r_gl.mb_doc_no||'-'||p_type||'-'||p_vou_amt||'~'||v_source||'~'||func_find_inv_method (p_bu)||'~'||-v_pr_amt);
"
"                  UPDATE material_bud
"
"                     SET mb_pr_amt =
"
"                            mb_pr_amt
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
"                         mb_po_amt =
"
"                            mb_po_amt
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
"                                 WHEN p_type = 'PA'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"                         /*gxbl_ss_amt =
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
"                                 ELSE
"
"                                    0
"
"                              END,*/
"
"                         mb_grn_amt =
"
"                            mb_grn_amt
"
"                            + CASE
"
"                                 WHEN --func_find_inv_method (p_bu) <> 'T' AND
"
"                                      p_type = 'GRN'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN --func_find_inv_method (p_bu) <> 'T'   AND
"
"                                      p_type = 'AP'
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
"                          mb_act_amt=mb_grn_amt
"
"                            + CASE
"
"                                 WHEN --func_find_inv_method (p_bu) <> 'T' AND
"
"                                      p_type = 'GRN'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN --func_find_inv_method (p_bu) <> 'T'   AND
"
"                                      p_type = 'AP'
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
"                        mb_upd_vou_type = p_type,
"
"                         mb_upd_vou_pfx = p_vou_pfx,
"
"                         mb_upd_vou_no = p_vou_no,
"
"                         mb_upd_vou_line_no = p_vou_line_no,
"
"                         mb_upd_amt = p_vou_amt,
"
"                         mb_upd_vou_date = p_doc_date
"
"                   WHERE     mb_bu = p_bu
"
"                         AND mb_doc_no = r_gl.mb_doc_no
"
"                         AND mb_seq_no = r_gl.mb_seq_no;
"
"               END IF;
"
"            ELSE
"
"               Raise_Application_Error (
"
"                  -20541 ,
"
"                     'GLM'
"
"                  || '~'
"
"                  || v_bud_type
"
");
"
"            END IF;
"
"
"
"            CLOSE c_gl;
"
"            CLOSE C1;
"
"         ELSIF     pkg_budget_matl.func_chk_budget_type (p_bu) = 'C'
"
"               AND CR2.class_bud_req_flag='Y'
"
"         THEN
"
"            OPEN c_gl (v_bud_type,
"
"                       p_cls_or_grp_id);
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
"               IF r_gl.mb_allw_exc_flag = 'N'
"
"                  AND r_gl.mb_bud_amt <
"
"                         (  NVL (r_gl.mb_act_amt, 0)
"
"                          + r_gl.mb_pr_amt
"
"                          + r_gl.mb_po_amt
"
"                          + r_gl.mb_grn_amt
"
"                          + r_gl.mb_miv_amt
"
"                          + p_vou_amt
"
"                          - (  NVL (v_pr_amt, 0)
"
"                             + NVL (v_po_amt, 0)
"
"                             ))
"
"               THEN
"
"                  Raise_Application_Error (
"
"                     -20541,
"
"                     'BUD' || '~' || r_gl.mb_bud_amt || '~'
"
"                     || (  NVL (r_gl.mb_act_amt, 0)
"
"                         + r_gl.mb_pr_amt
"
"                         + r_gl.mb_po_amt
"
"                         + r_gl.mb_grn_amt
"
"                         + r_gl.mb_miv_amt
"
"                         + p_vou_amt
"
"                         - (  NVL (v_pr_amt, 0)
"
"                            + NVL (v_po_amt, 0)
"
"                           )));
"
"               ELSE
"
"                  UPDATE material_bud
"
"                     SET mb_pr_amt =
"
"                            mb_pr_amt
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
"                         mb_po_amt =
"
"                            mb_po_amt
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
"                                 WHEN p_type = 'PA'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"
"
"                         mb_grn_amt =
"
"                            mb_grn_amt
"
"                            + CASE
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T'
"
"                                      AND p_type = 'GRN'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T'
"
"                                      AND p_type = 'AP'
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
"                          mb_act_amt=
"
"                            mb_grn_amt
"
"                            + CASE
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T'
"
"                                      AND p_type = 'GRN'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T'
"
"                                      AND p_type = 'AP'
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
"                         mb_upd_vou_type = p_type,
"
"                         mb_upd_vou_pfx = p_vou_pfx,
"
"                         mb_upd_vou_no = p_vou_no,
"
"                         mb_upd_vou_line_no = p_vou_line_no,
"
"                         mb_upd_amt = p_vou_amt,
"
"                         mb_upd_vou_date = p_doc_date
"
"                   WHERE     mb_bu = p_bu
"
"                         AND mb_doc_no = r_gl.mb_doc_no
"
"                         AND mb_seq_no = r_gl.mb_seq_no;
"
"               END IF;
"
"            ELSE
"
"               Raise_Application_Error (
"
"                  -20541 ,
"
"                     'GLM'
"
"                  || '~'
"
"                  || v_bud_type
"
"                );
"
"            END IF;
"
"
"
"            CLOSE c_gl;
"
"            CLOSE c2;
"
"         ELSIF pkg_budget_matl.func_chk_budget_type (p_bu) = 'G'
"
"             AND CR3.pgrp_bud_req_flag='Y'
"
"
"
"         THEN
"
"            OPEN c_gl (v_bud_type,
"
"                       p_cls_or_grp_id);
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
"               IF r_gl.mb_allw_exc_flag = 'N'
"
"                  AND r_gl.mb_bud_amt <
"
"                         (  NVL (r_gl.mb_act_amt, 0)
"
"                          + r_gl.mb_pr_amt
"
"                          + r_gl.mb_po_amt
"
"                          + r_gl.mb_grn_amt
"
"                          + r_gl.mb_miv_amt
"
"                          + p_vou_amt
"
"                          - (  NVL (v_pr_amt, 0)
"
"                             + NVL (v_po_amt, 0)
"
"                             ))
"
"               THEN
"
"                  Raise_Application_Error (
"
"                     -20541,
"
"                        'BUD'
"
"                     || '~'
"
"                     || r_gl.mb_bud_amt
"
"                     || '~'
"
"                     || NVL (r_gl.mb_act_amt, 0)
"
"                     || '^'
"
"                     || r_gl.mb_grn_amt
"
"                     || '^'
"
"                     || r_gl.mb_pr_amt
"
"                     || '~'
"
"                     || r_gl.mb_po_amt
"
"                     || '!'
"
"                     || r_gl.mb_miv_amt
"
"                     || (  NVL (r_gl.mb_act_amt, 0)
"
"                         + r_gl.mb_bud_amt
"
"                         + r_gl.mb_po_amt
"
"                         + r_gl.mb_grn_amt
"
"                         + r_gl.mb_miv_amt
"
"                         + p_vou_amt
"
"                         - (  NVL (v_pr_amt, 0)
"
"                            + NVL (v_po_amt, 0)
"
"                           ))
"
"
"
"                     || v_bud_type
"
"                     || p_period
"
"                     || '~'
"
"                     || r_gl.mb_act_amt);
"
"               ELSE
"
"                  UPDATE material_bud
"
"                     SET mb_pr_amt =
"
"                            mb_pr_amt
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
"                         mb_po_amt =
"
"                            mb_po_amt
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
"                                 WHEN p_type = 'PA'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"
"
"                         mb_grn_amt =
"
"                            mb_grn_amt
"
"                            + CASE
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T'
"
"                                      AND p_type = 'GRN'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T'
"
"                                      AND p_type = 'AP'
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
"                           mb_act_amt=mb_grn_amt
"
"                            + CASE
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T'
"
"                                      AND p_type = 'GRN'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T'
"
"                                      AND p_type = 'AP'
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
"                         mb_upd_vou_type = p_type,
"
"                         mb_upd_vou_pfx = p_vou_pfx,
"
"                         mb_upd_vou_no = p_vou_no,
"
"                         mb_upd_vou_line_no = p_vou_line_no,
"
"                         mb_upd_amt = p_vou_amt,
"
"                         mb_upd_vou_date = p_doc_date
"
"                   WHERE     mb_bu = p_bu
"
"                         AND mb_doc_no = r_gl.mb_doc_no
"
"                         AND mb_seq_no = r_gl.mb_seq_no;
"
"               END IF;
"
"            ELSE
"
"               Raise_Application_Error (
"
"                  -20541 ,
"
"                     'GLM'
"
"                  || '~'
"
"                  || v_bud_type
"
"                  );
"
"            END IF;
"
"
"
"            CLOSE c_gl;
"
"            CLOSE c3;
"
"         ELSIF pkg_budget_matl.func_chk_budget_type (p_bu) = 'SG'
"
"              AND CR4.psgrp_bud_req_flag='Y'
"
"         THEN
"
"            OPEN c_gl (v_bud_type,
"
"                      p_cls_or_grp_id);
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
"               IF r_gl.mb_allw_exc_flag = 'N'
"
"                  AND r_gl.mb_bud_amt <
"
"                         (  NVL (r_gl.mb_act_amt, 0)
"
"                          + r_gl.mb_pr_amt
"
"                          + r_gl.mb_po_amt
"
"                          + r_gl.mb_grn_amt
"
"                          + r_gl.mb_miv_amt
"
"                          + p_vou_amt
"
"                          - (  NVL (v_pr_amt, 0)
"
"                             + NVL (v_po_amt, 0)
"
"                             ))
"
"               THEN
"
"                  Raise_Application_Error (
"
"                     -20541,
"
"                     'BUD' || '~' || r_gl.mb_bud_amt || '~'
"
"                     || (  NVL (r_gl.mb_act_amt, 0)
"
"                         + r_gl.mb_pr_amt
"
"                         + r_gl.mb_po_amt
"
"                         + r_gl.mb_grn_amt
"
"                         + r_gl.mb_miv_amt
"
"                         + p_vou_amt
"
"                         - (  NVL (v_pr_amt, 0)
"
"                            + NVL (v_po_amt, 0)
"
"                           )));
"
"               ELSE
"
"                  UPDATE material_bud
"
"                     SET mb_pr_amt =
"
"                            mb_pr_amt
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
"                         mb_po_amt =
"
"                            mb_po_amt
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
"                                 WHEN p_type = 'PA'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 ELSE
"
"                                    0
"
"                              END,
"
"
"
"                         mb_grn_amt =
"
"                            mb_grn_amt
"
"                            + CASE
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T'
"
"                                      AND p_type = 'GRN'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T'
"
"                                      AND p_type = 'AP'
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
"                              mb_act_amt=mb_grn_amt
"
"                            + CASE
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T'
"
"                                      AND p_type = 'GRN'
"
"                                 THEN
"
"                                    p_vou_amt
"
"                                 WHEN func_find_inv_method (p_bu) <> 'T'
"
"                                      AND p_type = 'AP'
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
"                         mb_upd_vou_type = p_type,
"
"                         mb_upd_vou_pfx = p_vou_pfx,
"
"                         mb_upd_vou_no = p_vou_no,
"
"                         mb_upd_vou_line_no = p_vou_line_no,
"
"                         mb_upd_amt = p_vou_amt,
"
"                         mb_upd_vou_date = p_doc_date
"
"                   WHERE     mb_bu = p_bu
"
"                         AND mb_doc_no = r_gl.mb_doc_no
"
"                         AND mb_seq_no = r_gl.mb_seq_no;
"
"               END IF;
"
"            ELSE
"
"               Raise_Application_Error (
"
"                  -20541 ,
"
"                     'GLM'
"
"                  || '~'
"
"                  || v_bud_type );
"
"            END IF;
"
"
"
"            CLOSE c_gl;
"
"            CLOSE C4;
"
"            --END;
"
"
"
"         END IF;
"
"
"
"    --  END IF;
"
"   END proc_upd_val_fr_matl_budget;
"
"END pkg_budget_matl;"
/
