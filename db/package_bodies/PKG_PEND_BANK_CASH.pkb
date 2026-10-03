CREATE OR REPLACE
"PACKAGE BODY        pkg_pend_bank_cash AS
"
"
"
"    PROCEDURE proc_get_pend_rec (p_bu           VARCHAR2,
"
"                                 p_user         VARCHAR2,
"
"                                 p_doc_gen_flag VARCHAR2,
"
"                                 p_vou_type     VARCHAR2,
"
"                                 p_suphd_type   VARCHAR2,
"
"                                 p_ord_pfx      VARCHAR2,
"
"                                 p_ord_no       VARCHAR2,
"
"                                 p_seq_no       VARCHAR2)
"
"       IS
"
"
"
"        global_bs_lvl VARCHAR2(1);
"
"        CURSOR c3 IS
"
"        SELECT par_pfx,
"
"               par_doc_no,
"
"               pdd_seq_no
"
"          FROM pending_receivable_vw_hist_rev
"
"         WHERE ( par_sc_bal_amt - par_sc_proc_amt ) > 0
"
"           AND ( pdd_bal_amt - pdd_in_progress ) > 0
"
"           AND pdd_check_flag = 'Y'
"
"           AND par_status = 'P'
"
"           AND par_bu = p_bu
"
"           AND pdd_user = p_user
"
"           AND pdd_temp_pay_amt > ( pdd_bal_amt - pdd_in_progress )
"
"           AND pdd_temp_pay_amt > 0;
"
"
"
"        cr3           c3%rowtype;
"
"        v_pv_date     DATE;
"
"    BEGIN
"
"        SELECT glmctrl_bs_level
"
"          INTO global_bs_lvl
"
"          FROM glm_control
"
"         WHERE glmctrl_bu = p_bu;
"
"
"
"        BEGIN
"
"            OPEN c3;
"
"            FETCH c3 INTO cr3;
"
"            IF c3%found THEN
"
"                raise_application_error(-20999, 'Incorrect Receipt Amount.'
"
"                                                || chr(10)
"
"                                                || 'Doc. Pfx/No/Due No.: '
"
"                                                || cr3.par_pfx
"
"                                                || '/'
"
"                                                || cr3.par_doc_no
"
"                                                || '/'
"
"                                                || cr3.pdd_seq_no);
"
"            END IF;
"
"
"
"            CLOSE c3;
"
"               ---------------------------
"
"            proc_upd_due_pay_amt_hist(p_bu, p_user);
"
"            DECLARE
"
"                CURSOR c2 (c_pfx      VARCHAR2,
"
"                           c_doc_no   VARCHAR2,
"
"                           c_due_date DATE,
"
"                           c_due_no   NUMBER) IS
"
"                SELECT 1
"
"                  FROM pending_receivable_vw_hist_rev
"
"                 WHERE ( par_sc_bal_amt - par_sc_proc_amt ) > 0
"
"                   AND ( pdd_bal_amt - pdd_in_progress ) > 0
"
"                   AND pdd_due_date IS NOT NULL
"
"                   AND par_bu = p_bu
"
"                   AND par_pfx = c_pfx
"
"                   AND par_doc_no = c_doc_no
"
"                   AND ( ( trunc(pdd_due_date) < trunc(c_due_date) )
"
"                         OR ( trunc(pdd_due_date) = trunc(c_due_date)
"
"                              AND pdd_seq_no < c_due_no ) )
"
"                   AND par_status = 'P'
"
"                   AND pdd_check_flag = 'N';
"
"
"
"                CURSOR c3 IS
"
"                SELECT par_pfx,
"
"                       par_doc_no,
"
"                       pdd_seq_no
"
"                  FROM pending_receivable_vw_hist_rev
"
"                 WHERE ( par_sc_bal_amt - par_sc_proc_amt ) > 0
"
"                   AND ( pdd_bal_amt - pdd_in_progress ) > 0
"
"                   AND pdd_check_flag = 'Y'
"
"                   AND par_status = 'P'
"
"                   AND par_bu = p_bu
"
"                   AND pdd_user = p_user
"
"                   AND pdd_pay_amt > ( pdd_bal_amt - pdd_in_progress )
"
"                   AND pdd_pay_amt > 0;
"
"
"
"                cr2 c2%rowtype;
"
"                cr3 c3%rowtype;
"
"            BEGIN
"
"                OPEN c3;
"
"                FETCH c3 INTO cr3;
"
"                IF c3%found THEN
"
"                    raise_application_error(-20999, 'Incorrect Receipt Amount.'
"
"                                                    || chr(10)
"
"                                                    || 'Doc. Pfx/No/Due No.: '
"
"                                                    || cr3.par_pfx
"
"                                                    || '/'
"
"                                                    || cr3.par_doc_no
"
"                                                    || '/'
"
"                                                    || cr3.pdd_seq_no);
"
"                END IF;
"
"
"
"                CLOSE c3;
"
"            END;
"
"               ------------------------------------
"
"            SELECT btrans_pv_date
"
"              INTO v_pv_date
"
"              FROM bank_trans
"
"             WHERE btrans_bu = p_bu
"
"               AND btrans_ord_pfx = p_ord_pfx
"
"               AND btrans_ord_no = p_ord_no;
"
"            FOR i IN(SELECT DISTINCT PAR_DOC_NO,SUPHDH_REV_DATE --PAR_PFX,
"
"                       FROM pending_receivable_vw_hist_rev,appl_control,suplr_doc_hd_hist
"
"                      WHERE (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"                        AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                        AND pdd_check_flag = 'Y'
"
"                        AND par_status = 'P'
"
"                        AND par_bu = applctrl_bu
"
"                        AND par_bu = suphdh_bu
"
"                        AND par_doc_no = suphdh_doc_no
"
"                        AND suphdh_revalu_flg = 'Y'
"
"                        AND par_bu = p_bu
"
"                        AND pdd_user = p_user
"
"                        AND par_currency <> applctrl_base_currency
"
"                        AND ((p_seq_no IS NOT NULL AND p_seq_no IN (SELECT btdln_seq_no
"
"                                                                                   FROM bank_trans_dist_ln,
"
"                                                                                        acct_type_codes
"
"                                                                                  WHERE btdln_bu = p_bu
"
"                                                                                    AND btdln_ord_no = p_ord_no
"
"                                                                                    AND btdln_seq_no = p_seq_no
"
"                                                                                     --AND btdln_acct_plant = par_plant
"
"                                                                                    AND btdln_bu = atc_bu
"
"                                                                                    AND btdln_bfcry_type = atc_sup_cust_type
"
"                                                                                    AND btdln_acct_type = atc_code
"
"                                                                                    AND ((atc_rqrd_type ='S' AND btdln_acct_type = par_acct_type) OR (atc_rqrd_type <>'S'))
"
"                                                                                    AND btdln_lgr_bfcry_id = par_suplr_id))
"
"                             OR p_seq_no IS NULL)
"
"                         AND ((p_ord_no IS NOT NULL AND EXISTS (SELECT 1
"
"                                                         FROM bank_trans
"
"                                                        WHERE btrans_bu = p_bu
"
"                                                          AND btrans_ord_no = p_ord_no
"
"                                                          AND btrans_ord_pfx = p_ord_pfx
"
"                                                          AND btrans_trans_curcy = par_currency
"
"                                                          AND TRUNC(btrans_pv_date) >= TRUNC(PAR_SUPLR_DOC_DATE))) OR (p_ord_no IS NULL)))
"
"            LOOP
"
"                IF TRUNC (i.SUPHDH_REV_DATE) >= TRUNC (v_pv_date) THEN
"
"                    Raise_Application_Error(-20999,'Bill Date should be greater than revaluation date');
"
"            END IF;
"
"            END LOOP;
"
"
"
"            DECLARE
"
"                CURSOR c1 IS
"
"                SELECT 1
"
"                  FROM pending_receivable_vw_hist_rev
"
"                 WHERE ( par_sc_bal_amt - par_sc_proc_amt ) > 0
"
"                   AND ( pdd_bal_amt - pdd_in_progress ) > 0
"
"                   AND pdd_check_flag = 'Y'
"
"                   AND par_status = 'P';
"
"
"
"                CURSOR c2 IS
"
"                SELECT par_suplr_id,
"
"                       par_currency,
"
"                       SUM(db_amt - cr_amt) amt
"
"                  FROM(SELECT SUM(CASE WHEN par_dr_cr = 'DR' THEN pdd_pay_amt
"
"                                       ELSE                       0
"
"                                  END) db_amt,
"
"                              SUM(CASE WHEN par_dr_cr = 'CR' THEN pdd_pay_amt
"
"                                       ELSE                       0
"
"                                  END) cr_amt,
"
"                            par_currency,
"
"                            par_suplr_id
"
"                        FROM
"
"                            pending_receivable_vw_hist_rev,
"
"                            suplr_cust_ledger_vw_rev,
"
"                            acct_type_codes
"
"                        WHERE
"
"                                par_bu = glal_bu
"
"                            AND par_bu = atc_bu
"
"                            AND par_acct_type = atc_code
"
"                            AND ( ( glal_plant = par_plant
"
"                                    AND glal_plant = glal_party_plant
"
"                                    AND global_bs_lvl = 'U' )
"
"                                  OR ( global_bs_lvl = 'E' ) )
"
"                            AND ( ( glal_suplr_id = par_suplr_id
"
"                                    AND par_bfcry_type = 'S' )
"
"                                  OR ( glal_cust_id = par_suplr_id
"
"                                       AND par_bfcry_type = 'C' ) )
"
"                            AND ((par_acct_type IN ('AP', 'AR' ) AND par_bfcry_type IN ('S', 'C') AND gacl_lgr_sub_cls_type IN ('SAP','TDS','TCS','SVT','ESI','CASH','IMP','CAR','PF'))
"
"                              OR (par_acct_type IN ('CAD' ,'SAD') AND par_bfcry_type IN ('S', 'C') AND gacl_lgr_sub_cls_type IN ('TDS','TCS','SVT','ESI','CASH','IMP','CAD','PF'))
"
"                              OR (par_acct_type IN ('SSD') AND par_bfcry_type IN ('S', 'C') AND gacl_lgr_sub_cls_type IN ('SSD') )/*Changes By Dinesh*/
"
"                                       OR ((par_bfcry_type IN ('S') AND ((par_acct_type = 'SAD'  AND ((gacl_lgr_sub_cls_type IN ('SAP','CAR') AND atc_rqrd_type = 'N')
"
"                                                                                               OR (gacl_lgr_sub_cls_type IN ('SAD','CAD') AND glac_acct_type_code = atc_code AND atc_rqrd_type <> 'N')))
"
"                                                                    OR (par_acct_type = 'SSD' AND ((gacl_lgr_sub_cls_type IN ('SAP','CAR') AND atc_rqrd_type = 'N')
"
"                                                                                               OR (gacl_lgr_sub_cls_type IN ('SSD','CSD') AND glac_acct_type_code = atc_code AND atc_rqrd_type <> 'N'))))
"
"                                       OR (par_acct_type NOT IN ('AP','SAD','SSD') AND par_acct_type = atc_code  AND   atc_sup_cust_type  = 'S' AND ((gacl_lgr_sub_cls_type IN ('SAP') AND atc_rqrd_type = 'N')
"
"                                                                                               OR (atc_rqrd_type <> 'N' AND glac_acct_type_code = atc_code))))
"
"                                       OR ((par_bfcry_type IN ('C') AND ((par_acct_type = 'CAD' AND ((gacl_lgr_sub_cls_type IN ('SAP','CAR') AND atc_rqrd_type = 'N')
"
"                                                                                               OR (gacl_lgr_sub_cls_type IN ('SAD','CAD') AND glac_acct_type_code = atc_code AND atc_rqrd_type <> 'N')))
"
"                                                                    OR (par_acct_type = 'CSD' AND ((gacl_lgr_sub_cls_type IN ('SAP','CAR') AND atc_rqrd_type = 'N')
"
"                                                                                               OR (gacl_lgr_sub_cls_type IN ('SSD','CSD') AND glac_acct_type_code = atc_code AND atc_rqrd_type <> 'N')))
"
"                                                                    OR (par_acct_type = 'EMD' AND ((gacl_lgr_sub_cls_type IN ('SAP','CAR') AND atc_rqrd_type = 'N')
"
"                                                                                               OR (gacl_lgr_sub_cls_type IN ('SEMD','CEMD') AND glac_acct_type_code = atc_code AND atc_rqrd_type <> 'N')))
"
"                                                                    OR (par_acct_type = 'PBG' AND ((gacl_lgr_sub_cls_type IN ('SAP','CAR') AND atc_rqrd_type = 'N')
"
"                                                                                               OR (gacl_lgr_sub_cls_type IN ('SPBG','CPBG') AND glac_acct_type_code = atc_code AND atc_rqrd_type <> 'N')))
"
"                                                                    OR (par_acct_type = 'RET' AND ((gacl_lgr_sub_cls_type IN ('SAP','CAR') AND atc_rqrd_type = 'N')
"
"                                                                                               OR (gacl_lgr_sub_cls_type IN ('SRET','CRET') AND glac_acct_type_code = atc_code AND atc_rqrd_type <> 'N'))))
"
"                                                                    OR (par_acct_type NOT IN ('AR','CAD','CSD','EMD','PBG','RET') AND par_acct_type = atc_code  AND   atc_sup_cust_type  = 'C' AND ((gacl_lgr_sub_cls_type IN ('CAR') AND atc_rqrd_type = 'N')
"
"                                                                                       OR (atc_rqrd_type <> 'N' AND glac_acct_type_code = atc_code)))))))
"
"                            AND ( par_sc_bal_amt - par_sc_proc_amt ) > 0
"
"                            AND ( pdd_bal_amt - pdd_in_progress ) > 0
"
"                            AND pdd_check_flag = 'Y'
"
"                            AND par_status = 'P'
"
"                            AND par_bu = p_bu
"
"                            AND pdd_user = p_user
"
"                        GROUP BY
"
"                            par_currency,
"
"                            par_bfcry_type,
"
"                            par_suplr_id
"
"                    )
"
"                GROUP BY
"
"                    par_currency,
"
"                    par_suplr_id
"
"                HAVING  SUM(db_amt - cr_amt) > 0;
"
"
"
"                CURSOR c3 IS
"
"                SELECT MAX(par_doc_date) doc_date
"
"                  FROM pending_receivable_vw_hist_rev
"
"                 WHERE ( par_sc_bal_amt - par_sc_proc_amt ) > 0
"
"                   AND ( pdd_bal_amt - pdd_in_progress ) > 0
"
"                   AND pdd_check_flag = 'Y'
"
"                   AND par_status = 'P'
"
"                   AND par_bu = p_bu
"
"                   AND pdd_user = p_user;
"
"
"
"                CURSOR c4 IS
"
"                SELECT *
"
"                FROM pending_receivable_vw_hist_rev
"
"               WHERE (par_sc_bal_amt - par_sc_proc_amt ) > 0
"
"                 AND ( pdd_bal_amt - pdd_in_progress ) > 0
"
"                 AND pdd_check_flag = 'Y'
"
"                 AND par_status = 'P'
"
"                 AND par_bu = p_bu
"
"                 AND pdd_user = p_user;
"
"
"
"                cr1          c1%rowtype;
"
"                cr2          c2%rowtype;
"
"                cr3          c3%rowtype;
"
"                cancel_alert NUMBER;
"
"                v_cnt        NUMBER;
"
"            BEGIN
"
"                FOR cr4 IN c4 LOOP
"
"                    IF cr4.par_bfcry_type = 'I' AND p_vou_type <> 'JV' THEN
"
"                        raise_application_error(-20999, 'Imprestor not allowed for Payment / Receipt');
"
"                    END IF;
"
"                END LOOP;
"
"
"
"                OPEN c1;
"
"                FETCH c1 INTO cr1;
"
"                IF c1%notfound THEN
"
"                    raise_application_error(-20999, 'Please select the document');
"
"                END IF;
"
"                CLOSE c1;
"
"                IF p_doc_gen_flag IN ( 'Y', 'A' ) THEN
"
"                    IF p_bu = 'TVSA' THEN
"
"                    proc_cre_ln_frm_pend_pay_rec1(p_bu,
"
"                                                 p_ord_pfx,
"
"                                                 p_ord_no,
"
"                                                 CASE p_suphd_type WHEN 'B' THEN 'BT' WHEN 'C' THEN 'CT' END,
"
"                                                 'R',
"
"                                                 'M',
"
"                                                 func_find_glm_bs_lvl(p_bu),
"
"                                                 p_seq_no,
"
"                                                 'F',
"
"                                                 p_user);
"
"                 ELSE
"
"                 --raise_application_error(-20999,'before proc');
"
"                 proc_cre_ln_frm_pend_pay_rec(p_bu,
"
"                                                 p_ord_pfx,
"
"                                                 p_ord_no,
"
"                                                 CASE p_suphd_type WHEN 'B' THEN 'BT' WHEN 'C' THEN 'CT' END,
"
"                                                 'R',
"
"                                                 'M',
"
"                                                 func_find_glm_bs_lvl(p_bu),
"
"                                                 p_seq_no,
"
"                                                 'F',
"
"                                                 p_user);
"
"                 END IF;
"
"                END IF;
"
"
"
"            END;
"
"
"
"        END;
"
"
"
"    END proc_get_pend_rec;
"
"
"
"    PROCEDURE proc_get_pend_pay(p_bu            VARCHAR2,
"
"                                p_user          VARCHAR2,
"
"                                p_doc_gen_flag  VARCHAR2,
"
"                                p_ord_pfx       VARCHAR2,
"
"                                p_ord_no        VARCHAR2,
"
"                                p_seq_no        VARCHAR2,
"
"                                p_trans_curr    VARCHAR2,
"
"                                p_due_date_from DATE,
"
"                                p_due_date_to   DATE,
"
"                                p_vou_type      VARCHAR2,
"
"                                p_show_my_doc   VARCHAR2,
"
"                                p_fetch_line    VARCHAR2,
"
"                                p_type_param    VARCHAR2)
"
"  IS
"
"
"
"  v_arm_prj_req     arm_control.armc_prj_req_recev%TYPE;
"
"  v_apm_prj_flag    VARCHAR2(1) := func_find_apm_prj_req_flag(p_bu);
"
"  v_cnt             NUMBER;
"
"  v_trans_type      VARCHAR2(30);
"
"  v_pv_date         DATE;
"
"  v_bs_level        VARCHAR2(5);
"
"BEGIN
"
"  BEGIN
"
"  SELECT armc_prj_req_recev
"
"    INTO v_arm_prj_req
"
"    FROM arm_control
"
"   WHERE armc_bu = p_bu;
"
"  EXCEPTION WHEN no_data_found THEN
"
"    v_arm_prj_req := 'N';
"
"   END;
"
"
"
"
"
"
"
"   BEGIN
"
"     SELECT glmctrl_bs_level
"
"       INTO  v_bs_level
"
"       FROM glm_control
"
"     WHERE glmctrl_bu=p_bu;
"
"     EXCEPTION WHEN NO_DATA_FOUND THEN
"
"     v_bs_level :=NULL;
"
"   END;
"
"
"
"  BEGIN
"
"  SELECT btrans_type,btrans_pv_date
"
"    INTO v_trans_type,v_pv_date
"
"    FROM bank_trans
"
"   WHERE btrans_bu = p_bu
"
"     AND btrans_ord_pfx = p_ord_pfx
"
"     AND btrans_ord_no  = p_ord_no;
"
"   EXCEPTION WHEN no_data_found THEN
"
"    v_trans_type := NULL;
"
"   END;
"
"BEGIN
"
"FOR cr1 IN ( SELECT par_suplr_id,par_plant
"
"                  FROM pending_payables_vw_hist_rev
"
"                 WHERE (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"                   AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                   AND pdd_check_flag = 'Y'
"
"                   AND par_status = 'P'
"
"                   AND par_bu = p_bu
"
"                   AND pdd_user = p_user
"
"                   AND ((par_bfcry_type IN ('C','S') AND p_fetch_line IN ('F','N')) OR  (((par_bfcry_type IN ('C') AND par_doc_type ='SB') OR par_bfcry_type IN ('S')) AND p_fetch_line ='A'))
"
"                   AND ((p_seq_no IS NOT NULL AND EXISTS (SELECT 1
"
"                                                                      FROM bank_trans_dist_ln
"
"                                                                     WHERE btdln_bu = p_bu
"
"                                                                       AND btdln_ord_no = p_ord_no
"
"                                                                       AND btdln_seq_no = p_seq_no
"
"                                                                       --AND btdln_acct_plant = par_plant
"
"                                                                       AND (btdln_acct_type=par_acct_type OR func_find_code_req(btdln_bu,btdln_bfcry_type,'SAD') ='N')
"
"                                                                       AND ((v_bs_level = 'U' AND btdln_acct_plant = par_plant) OR (v_bs_level ='E'))
"
"                                                                       AND btdln_lgr_bfcry_id = par_suplr_id
"
"                                                                       AND ((BTDLN_BFCRY_TYPE = 'S' AND ((func_find_code_req(BTDLN_BU,BTDLN_BFCRY_TYPE,'SAD') ='S' AND BTDLN_ACCT_TYPE = PAR_ACCT_TYPE) OR (func_find_code_req(BTDLN_BU,BTDLN_BFCRY_TYPE,'SAD') <>'S')))
"
"                                                                         OR (BTDLN_BFCRY_TYPE = 'C' AND ((func_find_code_req(BTDLN_BU,BTDLN_BFCRY_TYPE,'CAD') ='S' AND BTDLN_ACCT_TYPE = PAR_ACCT_TYPE) OR (func_find_code_req(BTDLN_BU,BTDLN_BFCRY_TYPE,'CAD') <>'S'))))
"
"                                                                        AND (btdln_bfcry_type = 'S' AND ((v_apm_prj_flag = 'C' AND par_proj_id = btdln_cc_code) OR (v_apm_prj_flag = 'Y' AND btdln_lvl_prj = PAR_PROJ_ID) OR v_apm_prj_flag = 'N')
"
"                                                                         OR (btdln_bfcry_type = 'C' AND ((v_arm_prj_req = 'C' AND par_proj_id = btdln_cc_code) OR (v_arm_prj_req = 'Y' AND btdln_lvl_prj = PAR_PROJ_ID) OR v_arm_prj_req = 'N')))
"
"                                                                       ))
"
"                       OR p_seq_no IS NULL)
"
"                   AND (p_fetch_line  IN ('F','N') AND (par_currency = p_trans_curr OR p_trans_curr IS NULL) OR p_fetch_line = 'A'))
"
"   LOOP
"
"      SELECT COUNT(*)
"
"        INTO v_cnt
"
"        FROM suplr_cust_ledger_vw_rev
"
"       WHERE GLAL_BU = p_bu
"
"         AND GLAL_SUPLR_ID = cr1.par_suplr_id
"
"         AND ((v_bs_level = 'U' AND glal_plant = cr1.par_plant) OR (v_bs_level ='E'));
"
"
"
"      IF v_cnt = 0 THEN
"
"         RAISE_APPLICATION_ERROR(-20999,'Party Not found  -  ' || cr1.par_suplr_id );
"
"      END IF;
"
"   END LOOP;
"
"END;
"
"
"
"DECLARE
"
"  CURSOR c1
"
"    IS
"
"  SELECT par_suplr_id,suplr_status,suplr_name1,suplr_party_type
"
"    FROM pending_payables_vw_hist_rev,suppliers
"
"   WHERE par_bu = p_bu
"
"     AND suplr_bu = par_bu
"
"     AND suplr_suplr_id = par_suplr_id
"
"     AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"     AND (pdd_bal_amt - pdd_in_progress) > 0
"
"     AND pdd_check_flag = 'Y'
"
"     AND pdd_user = p_user;
"
"
"
"BEGIN
"
"  FOR cr1 IN c1
"
"    LOOP
"
"
"
"      IF cr1.suplr_status <> 'A' THEN
"
"         RAISE_APPLICATION_ERROR(-20999,'Supplier not in Active Status '||cr1.suplr_name1) ;
"
"      END IF;
"
"      IF cr1.suplr_party_type IN ('P','I') AND v_trans_type IN ('BT','CT') THEN
"
"        RAISE_APPLICATION_ERROR(-20999,'Cashier/Imprestor not allowed for Payment');
"
"      END IF;
"
"     END LOOP;
"
"END;
"
"DECLARE
"
"  CURSOR c1
"
"    IS
"
"  SELECT par_suplr_id,suplr_status,suplr_name1,suplr_party_type
"
"    FROM pending_payables_vw_hist_rev,suppliers
"
"   WHERE par_bu = p_bu
"
"     AND suplr_bu = par_bu
"
"     AND suplr_suplr_id = par_suplr_id
"
"     AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"     AND (pdd_bal_amt - pdd_in_progress) > 0
"
"     AND pdd_check_flag = 'Y'
"
"     AND pdd_user = p_user
"
"     AND ((p_doc_gen_flag IN ('Y','A') AND EXISTS (SELECT 1
"
"                                                         FROM bank_trans
"
"                                                        WHERE btrans_bu = p_bu
"
"                                                          AND btrans_ord_no = p_ord_no
"
"                                                          AND btrans_ord_pfx = p_ord_pfx
"
"                                                          AND btrans_trans_curcy = par_currency
"
"                                                          AND TRUNC(btrans_pv_date) >= TRUNC(PAR_SUPLR_DOC_DATE))) OR (p_doc_gen_flag ='N'))
"
"     AND ((p_seq_no IS NOT NULL AND EXISTS (SELECT 1
"
"                                                        FROM bank_trans_dist_ln,
"
"                                                             glm_control
"
"                                                       WHERE btdln_bu = p_bu
"
"                                                         AND btdln_bu = glmctrl_bu
"
"                                                         AND btdln_lgr_bfcry_id = par_suplr_id
"
"                                                         AND ((func_find_code_req(BTDLN_BU,BTDLN_BFCRY_TYPE,BTDLN_ACCT_TYPE) ='S' AND BTDLN_ACCT_TYPE = PAR_ACCT_TYPE) OR (func_find_code_req(BTDLN_BU,BTDLN_BFCRY_TYPE,BTDLN_ACCT_TYPE) <>'S'))
"
"                                                         AND btdln_ord_no = p_ord_no
"
"                                                         AND btdln_seq_no = p_seq_no
"
"                                                         AND ((v_arm_prj_req ='Y' AND BTDLN_LVL_PRJ = PAR_PROJ_ID) OR (v_arm_prj_req ='N'))
"
"                                                         AND ((glmctrl_bs_level = 'U' AND btdln_acct_plant = par_plant) OR (glmctrl_bs_level ='E'))))
"
"         OR p_seq_no IS NULL)
"
"     AND (((PAR_BFCRY_TYPE IN ('C','S') AND p_doc_gen_flag IN ('Y','A')) OR  (((PAR_BFCRY_TYPE IN ('C') AND par_doc_type IN ('SB','SI')) OR PAR_BFCRY_TYPE IN ('S')) AND p_doc_gen_flag ='N')) OR (p_vou_type ='JV' OR ((PAR_BFCRY_TYPE IN ('C','S') AND p_doc_gen_flag IN ('Y','A')) OR  (((PAR_BFCRY_TYPE IN ('C') AND par_doc_type IN ('SB','SI','P','R','JV','CN')) OR (PAR_BFCRY_TYPE IN ('S'))AND par_doc_type IN ('SB','SI','P','R','JV','CN')) AND p_doc_gen_flag IN ('N','A')))))
"
"     AND ((pdd_due_date BETWEEN TO_DATE(p_due_date_from) AND TO_DATE(p_due_date_to)) OR (TO_DATE(p_due_date_from) IS NULL AND TO_DATE(p_due_date_to) IS NULL))
"
"     AND (p_doc_gen_flag  IN ('Y','A') AND (par_currency = p_trans_curr OR p_trans_curr IS NULL) OR p_doc_gen_flag = 'N')
"
"     AND ((pdd_check_flag = 'Y' AND pdd_user = p_user AND p_show_my_doc ='Y') OR (p_show_my_doc ='N'));
"
"
"
"BEGIN
"
"  FOR cr1 IN c1
"
"    LOOP
"
"    --RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"      IF cr1.suplr_status <> 'A' THEN
"
"         RAISE_APPLICATION_ERROR(-20999,'Supplier not in Active Status '||cr1.suplr_name1) ;
"
"      END IF;
"
"      IF cr1.suplr_party_type = 'I' AND p_vou_type <> 'JV'  THEN
"
"        RAISE_APPLICATION_ERROR(-20999,'Imprestor not allowed for Payment / Receipt');
"
"      END IF;
"
"     END LOOP;
"
"END;
"
"
"
"proc_upd_due_pay_amt_hist(p_bu,
"
"                          p_user);
"
"
"
"DECLARE
"
"    v_valid_part      VARCHAR2(2);
"
"    v_suplr_name      VARCHAR2(100);
"
"    v_suplr_doc_no    VARCHAR2(30);
"
"    v_pfx                        VARCHAR2(50);
"
"    v_doc_no                VARCHAR2(50);
"
"    v_pfx10                    VARCHAR2(50);
"
"  v_suphd_doc_no10  VARCHAR2(50);
"
"  v_pfx11                      VARCHAR2(50);
"
"  v_pfx12                      VARCHAR2(50);
"
"  v_suphd_doc_no12  VARCHAR2(50);
"
"  v_suphd_doc_no14  VARCHAR2(50);
"
"BEGIN
"
"
"
"proc_check_db_doc_pend_payab (p_bu,
"
"                              p_user,
"
"                              p_trans_curr,
"
"                              p_ord_no,
"
"                              p_seq_no,
"
"                              p_fetch_line,
"
"                              v_valid_part,
"
"                              v_suplr_name,
"
"                              v_suplr_doc_no,
"
"                              v_pfx,
"
"                              v_doc_no,
"
"                              v_pfx10,
"
"                              v_suphd_doc_no10,
"
"                              v_pfx11,
"
"                              v_pfx12,
"
"                              v_suphd_doc_no12,
"
"                              v_suphd_doc_no14);
"
"
"
"IF v_valid_part = 'P1' AND v_suplr_name IS NOT NULL THEN
"
"    Raise_Application_Error(-20999,'Debit Doc. exists for this Party ('||v_suplr_name||')');
"
"ELSIF v_valid_part = 'P2' AND v_suplr_name IS NOT NULL THEN
"
"    Raise_Application_Error(-20999,'Debit Doc. exists for this Supplier('||v_suplr_name||')');
"
"ELSIF v_valid_part = 'P3' AND v_suplr_doc_no IS NOT NULL THEN
"
"    Raise_Application_Error(-20999,'Debit document exists against the Bill No. '||v_suplr_doc_no);
"
"ELSIF v_valid_part = 'P4' AND v_pfx IS NOT NULL AND v_doc_no IS NOT NULL THEN
"
"    Raise_Application_Error(-20999,'TDS Debit Doc. '||v_pfx||'-'||v_doc_no||' can be adjusted only against the bill.');
"
"ELSIF v_valid_part = 'P5' AND v_pfx10 IS NOT NULL AND v_pfx11 IS NOT NULL THEN
"
"    Raise_Application_Error(-20999,'Select the Debit Document against'||'-'||v_pfx10||'-'||'DB Doc.Pfx.No.'||v_pfx11|| CHR (10));
"
"ELSIF v_valid_part = 'P6' AND v_pfx10 IS NOT NULL AND v_suphd_doc_no10 IS NOT NULL THEN
"
"    Raise_Application_Error(-20999,'Debit Doc. Not Yet Created for the Rjct.Qty- Rcpt Pfx/no: '||v_pfx10||'-'||'Bill No.:'||v_suphd_doc_no10);
"
"ELSIF v_valid_part = 'P7' AND v_pfx12 IS NOT NULL AND v_pfx11 IS NOT NULL THEN
"
"    Raise_Application_Error(-20999,'Select the Debit Document against'||'-'||v_pfx12||'-'||'DB Doc.Pfx.No.'||v_pfx11|| CHR (10));
"
"ELSIF v_valid_part = 'P8' AND v_pfx12 IS NOT NULL AND v_suphd_doc_no12 IS NOT NULL THEN
"
"    Raise_Application_Error(-20999,'Debit Doc. Not Yet Created for Rjct.Qty- Rcpt Pfx/no: '||v_pfx12||'-'||'Bill No.: '||v_suphd_doc_no12);
"
"ELSIF v_valid_part = 'P9' AND  v_suphd_doc_no14 IS NOT NULL THEN
"
"    Raise_Application_Error(-20999,'Please select the TDS document against the Bill No. '||v_suphd_doc_no14);
"
"END IF;
"
"
"
"
"
"END;
"
"
"
"DECLARE
"
"    CURSOR c1
"
"    IS
"
"     SELECT /*+ INDEX(SUPLR_DOC_DISC_HIST SDDH_USER_IDX) */
"
"          NVL(SUM(DECODE(par_dflt_pay_thru, 'B', 1, 0)), 0) bank_cnt,
"
"          NVL(SUM(DECODE(par_dflt_pay_thru, 'C', 1, 0)), 0) cash_cnt,
"
"          NVL(SUM(DECODE(par_dflt_pay_thru, 'A', 1, 0)), 0) any_cnt
"
"     FROM pending_payables_vw_hist_rev
"
"    WHERE pdd_bu = p_bu
"
"      AND pdd_check_flag = 'Y'
"
"      AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"      AND (pdd_bal_amt - pdd_in_progress) > 0
"
"      AND par_status = 'P'
"
"      AND pdd_user = p_user
"
"      AND ((par_bfcry_type IN ('C','S') AND p_fetch_line IN ('F','N')) OR  (((par_bfcry_type IN ('C') AND par_doc_type IN ('SB','SI')) OR par_bfcry_type IN ('S')) AND p_fetch_line ='A'))
"
"     AND ((p_seq_no IS NOT NULL AND EXISTS (SELECT 1
"
"                                                        FROM bank_trans_dist_ln
"
"                                                       WHERE btdln_bu = p_bu
"
"                                                         AND btdln_ord_no = p_ord_no
"
"                                                         AND btdln_seq_no = p_seq_no
"
"                                                         AND btdln_acct_plant = par_plant
"
"                                                         AND btdln_lgr_bfcry_id = par_suplr_id))
"
"         OR p_seq_no IS NULL)
"
"     AND (p_fetch_line  IN ('F','N') AND (par_currency = p_trans_curr OR p_trans_curr IS NULL) OR p_fetch_line = 'A');
"
"
"
"  cr1    c1%ROWTYPE;
"
"
"
"BEGIN
"
"
"
"    OPEN c1;
"
"    FETCH c1 INTO cr1;
"
"
"
"      IF cr1.bank_cnt > 0 AND cr1.cash_cnt > 0 AND cr1.any_cnt > 0 THEN
"
"           Raise_Application_Error(-20999,'Different Pay Thru. not allowed.');
"
"      ELSIF cr1.bank_cnt > 0 AND cr1.cash_cnt > 0 AND cr1.any_cnt = 0 THEN
"
"         Raise_Application_Error(-20999,'Different Pay Thru. not allowed.');
"
"      END IF;
"
"    CLOSE c1;
"
"
"
"END;
"
"
"
"DECLARE
"
"   CURSOR c1
"
"   IS
"
"    SELECT /*+ INDEX(SUPLR_DOC_DISC_HIST SDDH_USER_IDX) */
"
"                PAR_DOC_NO
"
"      FROM pending_payables_vw_hist_rev
"
"     WHERE pdd_bu = p_bu
"
"       AND pdd_check_flag = 'Y'
"
"       AND par_user = p_user
"
"       AND ((par_bfcry_type IN ('C','S') AND p_fetch_line IN ('F','N')) OR  (((par_bfcry_type IN ('C') AND par_doc_type IN ('SB','SI')) OR par_bfcry_type IN ('S')) AND p_fetch_line ='A'))
"
"       AND ((p_seq_no IS NOT NULL AND EXISTS (SELECT 1
"
"                                                FROM bank_trans_dist_ln
"
"                                               WHERE btdln_bu = p_bu
"
"                                                 AND btdln_ord_no = p_ord_no
"
"                                                 AND btdln_seq_no = p_seq_no
"
"                                                 AND btdln_acct_plant = par_plant
"
"                                                 AND btdln_lgr_bfcry_id = par_suplr_id))
"
"            OR p_seq_no IS NULL)
"
"       AND (p_fetch_line  IN ('F','N') AND (par_currency = p_trans_curr OR p_trans_curr IS NULL) OR p_fetch_line = 'A');
"
"
"
"   CURSOR c2 (--c_inv_pfx    VARCHAR2,
"
"              c_inv_no     VARCHAR2)
"
"   IS
"
"    SELECT *
"
"      FROM boe_hd, boe_ln
"
"     WHERE boehd_bu = boeln_bu
"
"       AND boehd_doc_no = boeln_doc_no
"
"       AND boehd_bu = p_bu
"
"       AND boeln_inv_no = c_inv_no
"
"       AND boehd_status = 'N';
"
"
"
"   cr2   c2%ROWTYPE;
"
"BEGIN
"
"   FOR cr1 IN c1
"
"   LOOP
"
"
"
"      OPEN c2 ( cr1.PAR_DOC_NO);
"
"      FETCH c2 INTO cr2;
"
"
"
"        IF c2%FOUND THEN
"
"           Raise_Application_Error(-20999,'Document Already fetch in BOE.'||' # '||cr2.boehd_doc_no);
"
"        END IF;
"
"
"
"      CLOSE c2;
"
"   END LOOP;
"
"END;
"
"
"
"FOR i IN(
"
"SELECT DISTINCT par_doc_no,suphdh_rev_date --PAR_PFX,
"
"        FROM pending_payables_vw_hist_rev,appl_control,suplr_doc_hd_hist
"
"       WHERE     (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"             AND (pdd_bal_amt - pdd_in_progress) > 0
"
"             AND pdd_check_flag = 'Y'
"
"             AND par_status = 'P'
"
"             AND par_bu = applctrl_bu
"
"             AND par_bu = suphdh_bu
"
"             AND par_doc_no = suphdh_doc_no
"
"             AND suphdh_revalu_flg = 'Y'
"
"             AND par_bu = p_bu
"
"             AND pdd_user = p_user
"
"             AND par_currency <> applctrl_base_currency
"
"             AND ((p_seq_no IS NOT NULL AND EXISTS (SELECT 1
"
"                                                FROM bank_trans_dist_ln
"
"                                               WHERE btdln_bu = p_bu
"
"                                                 AND btdln_ord_no = p_ord_no
"
"                                                 AND btdln_seq_no = p_seq_no
"
"                                                 AND btdln_acct_plant = par_plant
"
"                                                 AND btdln_lgr_bfcry_id = par_suplr_id))
"
"            OR p_seq_no IS NULL)
"
"       AND (p_fetch_line  IN ('F','N') AND (par_currency = p_trans_curr OR p_trans_curr IS NULL) OR p_fetch_line = 'A'))
"
"LOOP
"
"  IF TRUNC (i.SUPHDH_REV_DATE) >= TRUNC (v_pv_date)
"
"   THEN
"
"        Raise_Application_Error(-20999,'Bill Date should be greater than revaluation date');
"
"      END IF;
"
"   END LOOP;
"
"
"
"/* Deviation Exists Validation - Start */
"
"DECLARE
"
"    CURSOR c1
"
"    IS
"
"     SELECT par_doc_no     --par_pfx,
"
"   FROM pending_payables_vw_hist_rev
"
"  WHERE par_bu = p_bu
"
"    AND pdd_check_flag = 'Y'
"
"    AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"    AND (pdd_bal_amt - pdd_in_progress) > 0
"
"    AND par_status = 'P'
"
"    AND pdd_user = p_user
"
"    AND par_dev_exists = 'Y'
"
"    AND ((par_bfcry_type IN ('C','S') AND p_fetch_line IN ('F','N')) OR  (((par_bfcry_type IN ('C') AND par_doc_type IN ('SB','SI')) OR par_bfcry_type IN ('S')) AND p_fetch_line ='A'))
"
"    AND ((p_seq_no IS NOT NULL AND EXISTS (SELECT 1
"
"                                             FROM bank_trans_dist_ln
"
"                                            WHERE btdln_bu = p_bu
"
"                                                AND btdln_ord_no = p_ord_no
"
"                                              AND btdln_seq_no = p_seq_no
"
"                                              AND btdln_acct_plant = par_plant
"
"                                              AND btdln_lgr_bfcry_id = par_suplr_id))
"
"        OR p_seq_no IS NULL)
"
"    AND (p_fetch_line  IN ('F','N') AND (par_currency = p_trans_curr OR p_trans_curr IS NULL) OR p_fetch_line = 'A')
"
"    AND par_dev_status IN ('NH');
"
"
"
"cr1        c1%ROWTYPE;
"
"BEGIN
"
"    OPEN c1;
"
"    FETCH c1 INTO cr1;
"
"
"
"      IF c1%FOUND THEN
"
"          Raise_Application_Error(-20999,'Cannot make Payment for the Document '||'-'||cr1.par_doc_no||' since Deviation exists.'); --cr1.par_pfx||
"
"      END IF;
"
"
"
"    CLOSE c1;
"
"END;
"
"/* Deviation Exists Validation - End */
"
"
"
"
"
"DECLARE
"
"   CURSOR c1
"
"   IS
"
"    SELECT 1
"
"      FROM pending_payables_vw_hist_rev
"
"     WHERE (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"       AND (pdd_bal_amt - pdd_in_progress) > 0
"
"       AND pdd_check_flag = 'Y'
"
"       AND par_status = 'P'
"
"       AND par_bu = p_bu
"
"       AND pdd_user = p_user
"
"       AND ((par_bfcry_type IN ('C','S') AND p_fetch_line IN ('F','N')) OR  (((par_bfcry_type IN ('C') AND par_doc_type ='SB') OR par_bfcry_type IN ('S')) AND p_fetch_line ='A'))
"
"       AND ((p_seq_no IS NOT NULL AND EXISTS (SELECT 1
"
"                                                          FROM bank_trans_dist_ln,glm_control
"
"                                                         WHERE btdln_bu = p_bu
"
"                                                           AND btdln_bu = glmctrl_bu
"
"                                                           AND btdln_ord_no = p_ord_no
"
"                                                           AND btdln_seq_no = p_seq_no
"
"                                                           AND ((glmctrl_bs_level = 'U' AND btdln_acct_plant = par_plant) OR (glmctrl_bs_level ='E'))
"
"                                                           AND btdln_lgr_bfcry_id = par_suplr_id))
"
"           OR p_seq_no IS NULL)
"
"       AND (p_fetch_line  IN ('F','N') AND (par_currency = p_trans_curr OR p_trans_curr IS NULL) OR p_fetch_line = 'A');
"
"
"
"   CURSOR c10
"
"   IS
"
"    SELECT par_suplr_id
"
"      FROM pending_payables_vw_hist_rev
"
"     WHERE (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"       AND (pdd_bal_amt - pdd_in_progress) > 0
"
"       AND pdd_check_flag = 'Y'
"
"       AND (par_hold_pay = 'Y' OR par_hold_party = 'Y')
"
"       AND par_bfcry_type = 'S'
"
"       AND par_status = 'P'
"
"       AND par_bu = p_bu
"
"       AND pdd_user = p_user
"
"       AND ((par_bfcry_type IN ('C','S') AND p_fetch_line IN ('F','N')) OR  (((par_bfcry_type IN ('C') AND par_doc_type ='SB') OR par_bfcry_type IN ('S')) AND p_fetch_line ='A'))
"
"       AND ((p_seq_no IS NOT NULL AND EXISTS (SELECT 1
"
"                                                          FROM bank_trans_dist_ln
"
"                                                         WHERE btdln_bu = p_bu
"
"                                                           AND btdln_ord_no = p_ord_no
"
"                                                           AND btdln_seq_no = p_seq_no
"
"                                                           AND btdln_acct_plant = par_plant
"
"                                                           AND btdln_lgr_bfcry_id = par_suplr_id))
"
"           OR p_seq_no IS NULL)
"
"       AND (p_fetch_line  IN ('F','N') AND (par_currency = p_trans_curr OR p_trans_curr IS NULL) OR p_fetch_line = 'A');
"
"
"
"
"
"   CURSOR c2
"
"   IS
"
"    SELECT par_currency, SUM (cr_amt - db_amt) amt
"
"      FROM (SELECT SUM (CASE WHEN par_dr_cr = 'DR' THEN pdd_pay_amt
"
"                         ELSE 0
"
"                         END) db_amt,
"
"               SUM (CASE WHEN par_dr_cr = 'CR' THEN pdd_pay_amt
"
"                         ELSE 0
"
"                         END) cr_amt,
"
"               par_currency,
"
"               par_bfcry_type /* (CASE WHEN par_bfcry_type = 'S' THEN par_suplr_id
"
"                     WHEN par_bfcry_type = 'C' THEN func_find_partner_id (:global.bu,par_suplr_id,'C')
"
"                     END) par_suplr_id */
"
"          FROM pending_payables_vw_hist_rev,
"
"               suplr_cust_ledger_vw_rev,
"
"               acct_type_codes,
"
"               glm_control
"
"         WHERE par_bu = glal_bu
"
"           AND atc_bu = par_bu
"
"           AND atc_code = par_acct_type
"
"           AND glmctrl_bu = par_bu
"
"           AND ((glal_plant = par_plant AND glmctrl_bs_level = 'U' AND glal_party_plant = par_plant)
"
"                    OR glmctrl_bs_level = 'E')
"
"           AND ((glal_suplr_id = par_suplr_id AND par_bfcry_type = 'S')
"
"                    OR (glal_cust_id = par_suplr_id AND par_bfcry_type = 'C'))
"
"           AND ((par_acct_type IN ('AP', 'AR') AND par_bfcry_type IN ('S', 'C') AND gacl_lgr_sub_cls_type IN ('SAP','TDS','TCS','SVT','ESI','CASH','IMP','CAR'))
"
"                           OR ((par_bfcry_type IN ('S') AND ((par_acct_type = 'SAD'  AND ((gacl_lgr_sub_cls_type IN ('SAP','CAR') AND atc_rqrd_type = 'N')
"
"                                                                                   OR (gacl_lgr_sub_cls_type IN ('SAD','CAD') AND glac_acct_type_code = atc_code AND atc_rqrd_type <> 'N')))
"
"                                                        OR (par_acct_type = 'SSD' AND ((gacl_lgr_sub_cls_type IN ('SAP','CAR') AND atc_rqrd_type = 'N')
"
"                                                                                   OR (gacl_lgr_sub_cls_type IN ('SSD','CSD') AND glac_acct_type_code = atc_code AND atc_rqrd_type <> 'N'))))
"
"                           OR (par_acct_type NOT IN ('AP','SAD','SSD') AND par_acct_type = atc_code  AND   atc_sup_cust_type  = 'S' AND ((gacl_lgr_sub_cls_type IN ('SAP') AND atc_rqrd_type = 'N')
"
"                                                                                   OR (atc_rqrd_type <> 'N' AND glac_acct_type_code = atc_code))))
"
"                           OR ((par_bfcry_type IN ('C') AND ((par_acct_type = 'CAD' AND ((gacl_lgr_sub_cls_type IN ('SAP','CAR') AND atc_rqrd_type = 'N')
"
"                                                                                   OR (gacl_lgr_sub_cls_type IN ('SAD','CAD') AND glac_acct_type_code = atc_code AND atc_rqrd_type <> 'N')))
"
"                                                        OR (par_acct_type = 'CSD' AND ((gacl_lgr_sub_cls_type IN ('SAP','CAR') AND atc_rqrd_type = 'N')
"
"                                                                                   OR (gacl_lgr_sub_cls_type IN ('SSD','CSD') AND glac_acct_type_code = atc_code AND atc_rqrd_type <> 'N')))
"
"                                                        OR (par_acct_type = 'EMD' AND ((gacl_lgr_sub_cls_type IN ('SAP','CAR') AND atc_rqrd_type = 'N')
"
"                                                                                   OR (gacl_lgr_sub_cls_type IN ('SEMD','CEMD') AND glac_acct_type_code = atc_code AND atc_rqrd_type <> 'N')))
"
"                                                        OR (par_acct_type = 'PBG' AND ((gacl_lgr_sub_cls_type IN ('SAP','CAR') AND atc_rqrd_type = 'N')
"
"                                                                                   OR (gacl_lgr_sub_cls_type IN ('SPBG','CPBG') AND glac_acct_type_code = atc_code AND atc_rqrd_type <> 'N')))
"
"                                                        OR (par_acct_type = 'RET' AND ((gacl_lgr_sub_cls_type IN ('SAP','CAR') AND atc_rqrd_type = 'N')
"
"                                                                                   OR (gacl_lgr_sub_cls_type IN ('SRET','CRET') AND glac_acct_type_code = atc_code AND atc_rqrd_type <> 'N'))))
"
"                                                        OR (par_acct_type NOT IN ('AR','CAD','CSD','EMD','PBG','RET') AND par_acct_type = atc_code  AND   atc_sup_cust_type  = 'C' AND ((gacl_lgr_sub_cls_type IN ('CAR') AND atc_rqrd_type = 'N')
"
"                                                                                   OR (atc_rqrd_type <> 'N' AND glac_acct_type_code = atc_code)))))))
"
"           AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"           AND (pdd_bal_amt - pdd_in_progress) > 0
"
"           AND par_hold_pay = 'N'
"
"           AND par_hold_party = 'N'
"
"           AND pdd_check_flag = 'Y'
"
"           AND par_status = 'P'
"
"           AND par_bu = p_bu
"
"           AND pdd_user = p_user
"
"           AND ((par_bfcry_type IN ('C','S') AND p_fetch_line IN ('F','N')) OR  (((par_bfcry_type IN ('C') AND par_doc_type ='SB') OR par_bfcry_type IN ('S')) AND p_fetch_line ='A'))
"
"           AND ((p_seq_no IS NOT NULL AND EXISTS (SELECT 1
"
"                                                              FROM bank_trans_dist_ln
"
"                                                             WHERE btdln_bu = p_bu
"
"                                                               AND btdln_ord_no = p_ord_no
"
"                                                               AND btdln_seq_no = p_seq_no
"
"                                                               AND btdln_acct_plant = par_plant
"
"                                                               AND btdln_lgr_bfcry_id = par_suplr_id))
"
"               OR p_seq_no IS NULL)
"
"           AND (p_fetch_line  IN ('F','N') AND (par_currency = p_trans_curr OR p_trans_curr IS NULL) OR p_fetch_line = 'A')
"
"         GROUP BY par_currency, par_bfcry_type, par_suplr_id)
"
"  GROUP BY par_currency
"
" HAVING SUM (cr_amt - db_amt) > 0;
"
"
"
"   CURSOR c3
"
"   IS
"
"    SELECT MAX (par_doc_date) doc_date
"
"      FROM pending_payables_vw_hist_rev
"
"     WHERE (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"       AND (pdd_bal_amt - pdd_in_progress) > 0
"
"       AND pdd_check_flag = 'Y'
"
"       AND par_status = 'P'
"
"       AND par_bu = p_bu
"
"       AND pdd_user = p_user
"
"       AND ((par_bfcry_type IN ('C','S') AND p_fetch_line IN ('F','N')) OR  (((par_bfcry_type IN ('C') AND par_doc_type ='SB') OR par_bfcry_type IN ('S')) AND p_fetch_line ='A'))
"
"       AND ((p_seq_no IS NOT NULL AND EXISTS (SELECT 1
"
"                                                          FROM bank_trans_dist_ln
"
"                                                         WHERE btdln_bu = p_bu
"
"                                                           AND btdln_ord_no = p_ord_no
"
"                                                           AND btdln_seq_no = p_seq_no
"
"                                                           AND btdln_acct_plant = par_plant
"
"                                                           AND btdln_lgr_bfcry_id = par_suplr_id))
"
"           OR p_seq_no IS NULL)
"
"       AND (p_fetch_line  IN ('F','N') AND (par_currency = p_trans_curr OR p_trans_curr IS NULL) OR p_fetch_line = 'A');
"
"
"
"   cr1            c1%ROWTYPE;
"
"   cr10           c10%ROWTYPE;
"
"   cr2            c2%ROWTYPE;
"
"   cr3            c3%ROWTYPE;
"
"   cancel_alert   NUMBER;
"
"
"
"BEGIN
"
"
"
"   OPEN c1;
"
"   FETCH c1 INTO cr1;
"
"
"
"     IF c1%NOTFOUND THEN
"
"        Raise_Application_Error(-20999,'Please select the document');
"
"     END IF;
"
"
"
"   CLOSE c1;
"
"
"
"   OPEN c10;
"
"   FETCH c10 INTO cr10;
"
"
"
"     IF c10%FOUND THEN
"
"        Raise_Application_Error(-20999,'Bill / Supplier is in Hold for Payment,'
"
"                     || CHR (10)|| 'Partner :' || cr10.par_suplr_id || '-'
"
"                     || func_find_party_name ( p_bu,cr10.par_suplr_id,1));
"
"     END IF;
"
"
"
"   CLOSE c10;
"
"
"
"   OPEN c2;
"
"   FETCH c2 INTO cr2;
"
"
"
"     IF c2%NOTFOUND AND  p_doc_gen_flag NOT IN ('Y','A') THEN
"
"        Raise_Application_Error(-20999,'Credit amount should be Greater than the Debit amount');
"
"     END IF;
"
"
"
"   CLOSE c2;
"
"
"
"   OPEN c3;
"
"   FETCH c3 INTO cr3;
"
"
"
"   CLOSE c3;
"
"
"
"   IF p_doc_gen_flag IN ('Y','A') THEN
"
"--raise_application_error(-20999,'HRM1');
"
"      IF p_bu = 'TVSA' THEN
"
"       proc_cre_ln_frm_pend_pay_rec1 (p_bu,
"
"                                     p_ord_pfx,
"
"                                     p_ord_no,
"
"                                     p_type_param,                  --- BT - BANK, 'CT' - CASH
"
"                                     'P', --- P - Payables, R - Receivables,S - Statutory
"
"                                     'M',                   --- S - Single, M - Merge
"
"                                     func_find_glm_bs_lvl (p_bu),                    --- E - Entity, U - Unit
"
"                                     p_seq_no,
"
"                                     p_fetch_line,--'F',
"
"                                     p_user,
"
"                                     p_trans_curr);
"
"        ELSE
"
"        --raise_application_error(-20999,'HRM1');
"
"        proc_cre_ln_frm_pend_pay_rec (p_bu,
"
"                                     p_ord_pfx,
"
"                                     p_ord_no,
"
"                                     p_type_param,                  --- BT - BANK, 'CT' - CASH
"
"                                     'P', --- P - Payables, R - Receivables,S - Statutory
"
"                                     'M',                   --- S - Single, M - Merge
"
"                                     func_find_glm_bs_lvl (p_bu),                    --- E - Entity, U - Unit
"
"                                     p_seq_no,
"
"                                     p_fetch_line,--'F',
"
"                                     p_user,
"
"                                     p_trans_curr);
"
"      END IF;
"
"
"
"
"
"
"
"   END IF;
"
"END;
"
"
"
"END proc_get_pend_pay;
"
"
"
"  PROCEDURE proc_get_pend_rec_adv(p_bu               VARCHAR2,
"
"                                P_user             VARCHAR2,
"
"                                p_ord_pfx          VARCHAR2,
"
"                                p_ord_no           VARCHAR2,
"
"                                p_btdln_seq_no     NUMBER,
"
"                                p_fetch_line       VARCHAR2)
"
"
"
"IS
"
"v_prj_req   arm_control.armc_prj_req_recev%TYPE;
"
"BEGIN
"
"   BEGIN
"
"   SELECT ARMC_PRJ_REQ_RECEV
"
"     INTO v_prj_req
"
"     FROM arm_control
"
"    WHERE armc_bu = p_bu;
"
"   EXCEPTION WHEN no_data_found THEN
"
"   v_prj_req := 'N';
"
"   END;
"
"DECLARE
"
"    CURSOR C1
"
"      IS
"
"    SELECT 1
"
"      FROM adv_rcpt_doc_vw
"
"     WHERE PARD_BU = p_bu
"
"       AND (ARRL_SO_ADV_AMT - (ARRL_INPRG_AMT+ARRL_PYMNT_AMT)) > 0
"
"       -- AND PARD_STATUS ='P'
"
"       AND arrl_sel_flag = 'Y';
"
"
"
"    CURSOR c4
"
"IS
"
"    SELECT pard_party_type
"
"     FROM adv_rcpt_doc_vw
"
"     WHERE PARD_BU =p_bu
"
"       --AND (ARRL_SO_ADV_AMT - (ARRL_INPRG_AMT+ARRL_PYMNT_AMT)) > 0
"
"       --AND pard_status ='P'
"
"       AND (pard_status = 'P' OR pard_status='C' AND (pard_prop_adv_amt - ( pard_rct_amt + pard_rct_inprog_amt + pard_close_amt) ) > 0
"
"       )
"
"       AND ((p_btdln_seq_no IS NOT NULL AND EXISTS (SELECT 1
"
"                                                   FROM bank_trans_dist_ln,glm_control
"
"                                                  WHERE btdln_bu = pard_bu
"
"                                                    AND btdln_bu = glmctrl_bu
"
"                                                    AND btdln_ord_no = p_ord_no
"
"                                                    AND btdln_seq_no = p_btdln_seq_no
"
"                                                    AND btdln_lgr_bfcry_id = pard_party_id
"
"                                                    --AND BTDLN_PLNT_LOC_ID = PARD_PLNT_LOC_ID
"
"                                                   -- AND ((func_find_code_req(BTDLN_BU,BTDLN_BFCRY_TYPE,BTDLN_ACCT_TYPE) ='S' AND BTDLN_ACCT_TYPE IN ('CAD','SAD')) OR (func_find_code_req(BTDLN_BU,BTDLN_BFCRY_TYPE,BTDLN_ACCT_TYPE) <>'S'))
"
"                                                   AND ((BTDLN_BFCRY_TYPE = 'S' AND --func_find_code_req(BTDLN_BU,BTDLN_BFCRY_TYPE,'SAD')
"
"                                                                      (SELECT atc_rqrd_type
"
"                                                                          FROM acct_type_codes
"
"                                                                         WHERE atc_bu = BTDLN_BU
"
"                                                                           AND atc_code = 'SAD'
"
"                                                                           AND atc_sup_cust_type = BTDLN_BFCRY_TYPE
"
"                                                                           AND atc_active_flag = 'Y') ='S' AND BTDLN_ACCT_TYPE IN ('SAD'))
"
"                                                                      OR (BTDLN_BFCRY_TYPE = 'C' AND --func_find_code_req(BTDLN_BU,BTDLN_BFCRY_TYPE,'CAD') ='S'
"
"                                                                      ((SELECT atc_rqrd_type
"
"                                                                          FROM acct_type_codes
"
"                                                                         WHERE atc_bu = BTDLN_BU
"
"                                                                           AND atc_code = 'CAD'
"
"                                                                           AND atc_sup_cust_type = BTDLN_BFCRY_TYPE
"
"                                                                           AND atc_active_flag = 'Y'))='S'
"
"                                                                      AND BTDLN_ACCT_TYPE IN ('CAD'))
"
"                                                                      OR (BTDLN_BFCRY_TYPE = 'S' AND --func_find_code_req(BTDLN_BU,BTDLN_BFCRY_TYPE,'SAD') <>'S'
"
"                                                                            (SELECT atc_rqrd_type
"
"                                                                          FROM acct_type_codes
"
"                                                                         WHERE atc_bu = BTDLN_BU
"
"                                                                           AND atc_code = 'SAD'
"
"                                                                           AND atc_sup_cust_type = BTDLN_BFCRY_TYPE
"
"                                                                           AND atc_active_flag = 'Y')<>'S'
"
"                                                                           )
"
"                                                                      OR (BTDLN_BFCRY_TYPE = 'C' AND --func_find_code_req(BTDLN_BU,BTDLN_BFCRY_TYPE,'CAD') <> 'S'
"
"                                                                      (SELECT atc_rqrd_type
"
"                                                                          FROM acct_type_codes
"
"                                                                         WHERE atc_bu = BTDLN_BU
"
"                                                                           AND atc_code = 'CAD'
"
"                                                                           AND atc_sup_cust_type = BTDLN_BFCRY_TYPE
"
"                                                                           AND atc_active_flag = 'Y')<>'S'
"
"                                                                      )
"
"                                                         )
"
"                                                    AND ((glmctrl_bs_level = 'U' AND btdln_acct_plant = pard_plnt) OR (glmctrl_bs_level ='E'))
"
"                                                    AND ((v_prj_req ='Y' AND PARD_LVL_PROJ_ID = BTDLN_LVL_PRJ) OR (v_prj_req ='N') OR ((v_prj_req ='C' AND arrl_cc_code = BTDLN_CC_CODE))
"
"                                                    )
"
"                                                    ))
"
"             OR (p_btdln_seq_no IS NULL))
"
"       AND ((p_fetch_line IN ('A','Y') AND EXISTS(SELECT 1
"
"                                                    FROM bank_trans
"
"                                                   WHERE btrans_bu = p_bu
"
"                                                     AND btrans_ord_pfx = p_ord_pfx
"
"                                                     AND btrans_ord_no  = p_ord_no
"
"                                                     AND BTRANS_TRANS_CURCY = PARD_CURCY_ID
"
"                                                     AND TRUNC(btrans_pv_date) >= TRUNC(PARD_DOC_DATE)))
"
"            OR (p_fetch_line ='N'));
"
"
"
"    CR1 C1%ROWTYPE;
"
"BEGIN
"
"   FOR cr4 IN c4
"
"   LOOP
"
"      IF cr4.pard_party_type = 'I' THEN
"
"        RAISE_APPLICATION_ERROR(-20999,'Imprestor not allowed for Payment / Receipt');
"
"      END IF;
"
"   END LOOP;
"
"    OPEN C1;
"
"     FETCH C1 INTO CR1;
"
"     IF C1%NOTFOUND THEN
"
"          RAISE_APPLICATION_ERROR(-20999,'Please select the docuement');
"
"      END IF;
"
"    CLOSE C1;
"
"
"
"END;
"
"DECLARE
"
"  v_plnt   VARCHAR2(20);
"
"  global_bs_lvl   glm_control.glmctrl_bs_level%TYPE;
"
"BEGIN
"
"  SELECT glmctrl_bs_level
"
"          INTO global_bs_lvl
"
"          FROM glm_control
"
"         WHERE glmctrl_bu = p_bu;
"
"IF global_bs_lvl ='E' THEN
"
"SELECT bedscc_ac_plnt
"
"     INTO v_plnt
"
"     FROM be_dflt_sc_cc
"
"    WHERE bedscc_bu = p_bu;
"
"END IF;
"
"--RAISE_APPLICATION_ERROR(-20999,v_plnt);
"
"     proc_ins_bt_ct_adv_rec (p_bu,
"
"                            p_ord_pfx,
"
"                            p_ord_no,
"
"                            p_user,
"
"                            CASE p_fetch_line WHEN 'Y' THEN 'F' ELSE 'A' END,
"
"                            p_btdln_seq_no,
"
"                            v_plnt);
"
"
"
"END;
"
"END proc_get_pend_rec_adv;
"
"PROCEDURE proc_valid_pay_stat(p_bu         VARCHAR2,
"
"                                                p_user       VARCHAR2,
"
"                                                p_suphd_type VARCHAR2,
"
"                                                p_bank_id    VARCHAR2,
"
"                                                p_unit       VARCHAR2,
"
"                                                p_unit_loc   VARCHAR2,
"
"                                                p_date       DATE,
"
"                                                p_screen     VARCHAr2,
"
"                                                p_rowid      OUT VARCHAR2,
"
"                                                p_doc_no     OUT VARCHAR2)
"
"
"
"
"
"
"
"IS
"
"   CURSOR c1
"
"   IS
"
"      SELECT DISTINCT par_bu, par_currency
"
"        FROM pending_payables_stat_vw_hist
"
"       WHERE     (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"             AND (pdd_bal_amt - pdd_in_progress) > 0
"
"             AND pdd_check_flag = 'Y'
"
"             AND par_status = 'P'
"
"             AND par_bu = p_bu
"
"             AND pdd_user = p_user
"
"             AND par_currency <> func_find_base_currency ( p_bu);
"
"
"
"   CURSOR c2
"
"   IS
"
"      SELECT DISTINCT par_plant
"
"        FROM pending_payables_stat_vw_hist
"
"       WHERE     (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"             AND (pdd_bal_amt - pdd_in_progress) > 0
"
"             AND pdd_check_flag = 'Y'
"
"             AND par_status = 'P'
"
"             AND par_bu = p_bu
"
"             AND pdd_user = p_user;
"
"
"
"   p_merge_doc_no VARCHAR2 (500);
"
"   v_date     DATE;
"
"   v_bs_lvl   VARCHAR2 (1);
"
"   v_dflt_unit VARCHAR2(20);
"
"   v_res      VARCHAR2 (2);
"
"   v_bank_unit  VARCHAR2(10);
"
"BEGIN
"
"  -- raise_application_error(-20999,'HRM'||p_suphd_type||p_screen);
"
"   FOR cr2 IN c2
"
"   LOOP
"
"
"
"      IF p_suphd_type = 'B' AND p_bank_id IS NULL
"
"   THEN
"
"      RAISE_APPLICATION_ERROR(-20999,'Bank must be entered.');
"
"   ELSIF p_suphd_type = 'A' AND p_unit_loc IS NULL THEN
"
"      RAISE_APPLICATION_ERROR(-20999,'Unit Location must be entered.');
"
"
"
"   ELSIF p_suphd_type = 'B' AND p_bank_id IS NOT NULL
"
"   THEN
"
"      DECLARE
"
"         v_clr_flag      VARCHAR2 (1);
"
"         v_void_flag     VARCHAR2 (1);
"
"         v_cancel_flag   VARCHAR2 (1);
"
"         v_acc_flag      VARCHAR2 (1);
"
"         v_admin         VARCHAR2 (1);
"
"      BEGIN
"
"         proc_find_bank_oper_access ( p_bu,
"
"                                     p_user,
"
"                                     p_bank_id,
"
"                                     'P',
"
"                                     v_clr_flag,
"
"                                     v_void_flag,
"
"                                     v_cancel_flag,
"
"                                     v_acc_flag,
"
"                                     v_admin);
"
"
"
"         IF v_acc_flag NOT IN ('E', 'B') AND v_admin = 'N'
"
"         THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'You dont have an access to do Payment Entry to this bank.');
"
"         END IF;
"
"      END;
"
"   ELSIF p_suphd_type = 'C' AND p_bank_id IS NULL
"
"   THEN
"
"      RAISE_APPLICATION_ERROR(-20999,'Cash must be entered');
"
"   ELSIF p_suphd_type = 'C' AND p_bank_id IS NOT NULL
"
"   THEN
"
"      DECLARE
"
"         var_access   VARCHAR2 (2);
"
"         var_admin    VARCHAR2 (1);
"
"      BEGIN
"
"         proc_find_cash_oprn_access ( p_bu,
"
"                                     p_user,
"
"                                     p_bank_id,
"
"                                     'P',
"
"                                     'E',
"
"                                     var_access,
"
"                                     var_admin);
"
"
"
"         IF     var_access <> 'E'
"
"            AND var_access <> 'B'
"
"            AND var_access <> 'R'
"
"            AND var_admin <> 'N'
"
"         THEN
"
"            RAISE_APPLICATION_ERROR (-20999,'You don''t have an access to do Transaction for this Cashier.');
"
"         ELSIF     var_access <> 'E'
"
"               AND var_access <> 'B'
"
"               AND var_access = 'N'
"
"               AND var_access <> 'R'
"
"         THEN
"
"            RAISE_APPLICATION_ERROR (-20999,'You don''t have an access to do Payment Entry for this Cashier.');
"
"         ELSIF     var_access <> 'E'
"
"               AND var_access <> 'B'
"
"               AND var_access <> 'N'
"
"               AND var_access = 'R'
"
"         THEN
"
"            RAISE_APPLICATION_ERROR (-20999,'You don''t have an access to do Payment Entry for this Cashier.');
"
"         ELSIF var_access = 'NF' AND var_admin = 'N'
"
"         THEN
"
"            RAISE_APPLICATION_ERROR (-20999,'You don''t have an access to do Transaction for this Cashier.');
"
"         END IF;
"
"      END;
"
"   -- updated on 22.06.2015
"
"   END IF;
"
"
"
"       IF p_suphd_type = 'B' THEN
"
"      v_bank_unit := func_find_bank_unit (p_bu, p_bank_id);
"
"   ELSIF p_suphd_type = 'C' THEN
"
"      v_bank_unit := func_find_cash_unit (p_bu, p_bank_id);
"
"   ELSE
"
"         v_bank_unit := cr2.par_plant;
"
"   END IF;
"
"
"
"         proc_chk_trans_date (p_bu,
"
"                          TO_DATE(p_date),
"
"                          'CDM',
"
"                          v_res,
"
"                          v_bank_unit);
"
"
"
"     proc_date_chk (p_bu,
"
"                    TO_DATE(p_date),
"
"                    'CDM',
"
"                    v_bank_unit);
"
"   END LOOP c2;
"
"
"
"   v_bs_lvl := func_find_glm_bs_lvl ( p_bu);
"
"
"
"  IF v_bs_lvl = 'E' THEN
"
"     SELECT bedscc_ac_plnt   INTO v_dflt_unit FROM be_dflt_sc_cc WHERE bedscc_bu  = p_bu;
"
"   END IF;
"
"
"
"   SELECT MAX (par_doc_date)
"
"     INTO v_date
"
"     FROM pending_payables_stat_vw_hist
"
"    WHERE     (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"          AND (pdd_bal_amt - pdd_in_progress) > 0
"
"          AND pdd_check_flag = 'Y'
"
"          AND par_status = 'P'
"
"          AND par_bu = p_bu
"
"          AND pdd_user = p_user;
"
"
"
"   IF TO_DATE(v_date) > TO_DATE (p_date)
"
"   THEN
"
"      RAISE_APPLICATION_ERROR (-20999,'Voucher Date should be greater than or equal document date');
"
"   END IF;
"
"
"
"   FOR cr1 IN c1
"
"   LOOP
"
"      IF func_find_rev_date ( p_bu, TO_DATE(p_date), cr1.par_currency) = 0
"
"      THEN
"
"         RAISE_APPLICATION_ERROR (-20999,'Voucher Date should be greater than revaluation date');
"
"      END IF;
"
"   END LOOP;
"
"
"
"   FOR i IN(
"
"    SELECT DISTINCT PAR_DOC_NO,SUPHDH_REV_DATE --PAR_PFX,
"
"        FROM pending_payables_stat_vw_hist,appl_control,suplr_doc_hd_hist
"
"       WHERE     (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"             AND (pdd_bal_amt - pdd_in_progress) > 0
"
"             AND pdd_check_flag = 'Y'
"
"             AND par_status = 'P'
"
"             AND par_bu = applctrl_bu
"
"             AND par_bu = suphdh_bu
"
"             AND par_doc_no = suphdh_doc_no
"
"             AND suphdh_revalu_flg = 'Y'
"
"             AND par_bu = p_bu
"
"             AND pdd_user = p_user
"
"             AND par_currency <> applctrl_base_currency)
"
"LOOP
"
"  IF TRUNC (i.SUPHDH_REV_DATE) >= TO_DATE(p_date)
"
"   THEN
"
"        Raise_Application_Error(-20999,'Payment Date should be greater than revaluation date');
"
"      END IF;
"
"END LOOP;
"
"
"
"  --RAISE_APPLICATION_ERROR(-20999,'HRM'||'-'||p_screen||'-'||p_suphd_type);
"
"   IF p_screen = 'S'
"
"   THEN                                                           ----- SINGLE
"
"      IF p_suphd_type = 'B'
"
"      THEN                                                     ---BANK PAYMENT
"
"         DECLARE
"
"            v_clr_flag      VARCHAR2 (1);
"
"            v_void_flag     VARCHAR2 (1);
"
"            v_cancel_flag   VARCHAR2 (1);
"
"            v_prcfe_flag    VARCHAR2 (1);
"
"            v_admin_flag    VARCHAR2 (1);
"
"         BEGIN
"
"            IF p_bank_id IS NOT NULL
"
"            THEN
"
"               proc_find_bank_oper_access ( p_bu,
"
"                                           p_user,
"
"                                           p_bank_id,
"
"                                           'P',
"
"                                           v_clr_flag,
"
"                                           v_void_flag,
"
"                                           v_cancel_flag,
"
"                                           v_prcfe_flag,
"
"                                           v_admin_flag);
"
"
"
"               IF v_prcfe_flag NOT IN ('E', 'B')
"
"               THEN
"
"                  RAISE_APPLICATION_ERROR (-20999,'You dont have an access to do Payment Entry to this bank.');
"
"               END IF;
"
"            END IF;
"
"         END;
"
"
"
"         proc_ins_bank_cash_trans_hist_rev ( p_bu,
"
"                                        'BT',
"
"                                        p_bank_id,
"
"                                        'S',
"
"                                        'S',
"
"                                        v_bs_lvl,
"
"                                        TO_DATE(p_date),
"
"                                        p_user,
"
"                                        p_doc_no,
"
"                                        p_dflt_unit => v_dflt_unit,
"
"                                        p_pfx_no => p_rowid);
"
"         commit;
"
"      ELSIF p_suphd_type = 'C'
"
"      THEN
"
"         proc_ins_bank_cash_trans_hist_rev ( p_bu,
"
"                                        'CT',
"
"                                        p_bank_id,
"
"                                        'S',
"
"                                        'S',
"
"                                        v_bs_lvl,
"
"                                        TO_DATE(p_date),
"
"                                        p_user,
"
"                                        p_doc_no,
"
"                                        p_dflt_unit => v_dflt_unit,
"
"                                        p_pfx_no => p_rowid);
"
"         commit;
"
"         ELSIF p_suphd_type = 'A'
"
"         THEN
"
"        -- RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"                  proc_ins_bank_cash_trans_hist_rev ( p_bu,
"
"                                        'AD',
"
"                                        p_unit,
"
"                                        'S',
"
"                                        'S',
"
"                                        v_bs_lvl,
"
"                                        TO_DATE(p_date),
"
"                                        p_user,
"
"                                        p_doc_no,
"
"                                        p_dflt_unit => p_unit,
"
"                                        p_plnt_loc_id => p_unit_loc,
"
"                                        p_pfx_no => p_rowid);
"
"
"
"      END IF;
"
"   ELSIF p_screen = 'M'
"
"   THEN
"
"      IF p_suphd_type = 'B'
"
"      THEN
"
"         DECLARE
"
"            v_clr_flag      VARCHAR2 (1);
"
"            v_void_flag     VARCHAR2 (1);
"
"            v_cancel_flag   VARCHAR2 (1);
"
"            v_prcfe_flag    VARCHAR2 (1);
"
"            v_admin_flag    VARCHAR2 (1);
"
"         BEGIN
"
"            IF p_bank_id IS NOT NULL
"
"            THEN
"
"               proc_find_bank_oper_access ( p_bu,
"
"                                           p_user,
"
"                                           p_bank_id,
"
"                                           'P',
"
"                                           v_clr_flag,
"
"                                           v_void_flag,
"
"                                           v_cancel_flag,
"
"                                           v_prcfe_flag,
"
"                                           v_admin_flag);
"
"
"
"               IF v_prcfe_flag NOT IN ('E', 'B')
"
"               THEN
"
"                  RAISE_APPLICATION_ERROR (-20999,'You dont have an access to do Payment Entry to this bank.');
"
"               END IF;                                           -- ACCESS CHK
"
"            END IF;
"
"         END;
"
"
"
"         proc_ins_bank_cash_trans_hist_rev ( p_bu,
"
"                                        'BT',
"
"                                        p_bank_id,
"
"                                        'S',
"
"                                        'M',
"
"                                        v_bs_lvl,
"
"                                        TO_DATE(p_date),
"
"                                        p_user,
"
"                                        p_doc_no,
"
"                                        p_dflt_unit => v_dflt_unit,
"
"                                        p_pfx_no => p_rowid);
"
"         commit;
"
"      ELSIF p_suphd_type = 'C'
"
"      THEN
"
"         proc_ins_bank_cash_trans_hist_rev ( p_bu,
"
"                                        'CT',
"
"                                        p_bank_id,
"
"                                        'S',
"
"                                        'M',
"
"                                        v_bs_lvl,
"
"                                        TO_DATE(p_date),
"
"                                        p_user,
"
"                                        p_doc_no,
"
"                                        p_dflt_unit => v_dflt_unit,
"
"                                        p_pfx_no => p_rowid);
"
"       ELSIF p_suphd_type = 'A'
"
"      THEN
"
"         proc_ins_bank_cash_trans_hist_rev ( p_bu,
"
"                                        'AD',
"
"                                        p_unit,
"
"                                        'S',
"
"                                        'M',
"
"                                        v_bs_lvl,
"
"                                        TO_DATE(p_date),
"
"                                        p_user,
"
"                                        p_doc_no,
"
"                                        p_dflt_unit => v_dflt_unit,
"
"                                        p_plnt_loc_id => p_unit_loc,
"
"                                        p_pfx_no => p_rowid,
"
"                                        p_plnt   => p_unit,
"
"                                        p_plnt_loc => p_unit_loc
"
"                                        );
"
"         proc_commit;
"
"
"
"      END IF;
"
"   END IF;
"
"
"
"   UPDATE suplr_doc_disc_hist
"
"      SET sddh_user = NULL,
"
"          sddh_check_flag = 'N',
"
"          sddh_pay_amt = sddh_bal_amt
"
"    WHERE sddh_bu = p_bu
"
"      AND sddh_user = p_user
"
"      AND sddh_check_flag = 'Y'
"
"      AND sddh_bal_amt > 0;
"
"
"
"END proc_valid_pay_stat;
"
" PROCEDURE proc_check_pay_stat(p_bu          VARCHAR2,
"
"                                                p_user        VARCHAR2)
"
"
"
"IS
"
"v_bs_lvl   glm_control.glmctrl_bs_level%TYPE;
"
"BEGIN
"
"   SELECT glmctrl_bs_level
"
"     INTO v_bs_lvl
"
"     FROM glm_control
"
"    WHERE glmctrl_bu = p_bu;
"
"DECLARE
"
"   CURSOR c3
"
"   IS
"
"      SELECT par_pfx, par_doc_no, pdd_seq_no
"
"        FROM pending_payables_stat_vw_hist
"
"       WHERE     (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"             AND (pdd_bal_amt - pdd_in_progress) > 0
"
"             AND pdd_check_flag = 'Y'
"
"             AND par_status = 'P'
"
"             AND par_bu = p_bu
"
"             AND pdd_user = p_user
"
"             AND pdd_temp_pay_amt > (pdd_bal_amt - pdd_in_progress)
"
"             AND pdd_temp_pay_amt > 0;
"
"
"
"   cr3   c3%ROWTYPE;
"
"
"
"BEGIN
"
"
"
"
"
"   OPEN c3;
"
"
"
"   FETCH c3 INTO cr3;
"
"
"
"   IF c3%FOUND
"
"   THEN
"
"      RAISE_APPLICATION_ERROR(-20999,
"
"            'Incorrect Pay Amount.'
"
"         || CHR (10)
"
"         || 'Doc. Pfx/No/Due No.: '
"
"         || cr3.par_pfx
"
"         || '/'
"
"         || cr3.par_doc_no
"
"         || '/'
"
"         || cr3.pdd_seq_no);
"
"   END IF;
"
"
"
"   CLOSE c3;
"
"END;
"
"proc_upd_due_pay_amt_hist(p_bu,p_user);
"
"--proc_check_prev_due_exists;
"
"DECLARE
"
"   CURSOR c2 (
"
"      c_pfx         VARCHAR2,
"
"      c_doc_no      VARCHAR2,
"
"      c_due_date    DATE,
"
"      c_due_no      NUMBER)
"
"   IS
"
"      SELECT 1
"
"        FROM pending_payables_stat_vw_hist
"
"       WHERE     (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"             AND (pdd_bal_amt - pdd_in_progress) > 0
"
"             AND pdd_due_date IS NOT NULL
"
"             AND par_bu = p_bu
"
"             AND par_pfx = c_pfx
"
"             AND par_doc_no = c_doc_no
"
"             AND ( (TO_DATE (pdd_due_date) < TO_DATE (c_due_date))
"
"                  OR (TO_DATE (pdd_due_date) = TO_DATE (c_due_date)
"
"                      AND pdd_seq_no < c_due_no))
"
"             AND par_status = 'P'
"
"             AND pdd_check_flag = 'N';
"
"
"
"   CURSOR c3
"
"   IS
"
"      SELECT par_pfx, par_doc_no, pdd_seq_no
"
"        FROM pending_payables_stat_vw_hist
"
"       WHERE     (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"             AND (pdd_bal_amt - pdd_in_progress) > 0
"
"             AND pdd_check_flag = 'Y'
"
"             AND par_status = 'P'
"
"             AND par_bu = p_bu
"
"             AND pdd_user = p_user
"
"             AND pdd_pay_amt > (pdd_bal_amt - pdd_in_progress)
"
"             AND pdd_pay_amt > 0;
"
"
"
"
"
"   cr2   c2%ROWTYPE;
"
"
"
"   cr3   c3%ROWTYPE;
"
"BEGIN
"
"   FOR cr1
"
"      IN (SELECT par_pfx,
"
"                 par_doc_no,
"
"                 pdd_due_date,
"
"                 pdd_seq_no
"
"            FROM pending_payables_stat_vw_hist
"
"           WHERE     (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"                 AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                 AND pdd_check_flag = 'Y'
"
"                 AND par_status = 'P'
"
"                 AND par_bu = p_bu
"
"                 AND pdd_user = p_user)
"
"   LOOP
"
"      OPEN c2 (cr1.par_pfx,
"
"               cr1.par_doc_no,
"
"               TRUNC (cr1.pdd_due_date),
"
"               cr1.pdd_seq_no);
"
"
"
"      FETCH c2 INTO cr2;
"
"
"
"      IF c2%FOUND
"
"      THEN
"
"         RAISE_APPLICATION_ERROR(-20999,'Select Previous Due Documents - Doc. Pfx/No.:'
"
"            || cr1.par_pfx
"
"            || '/'
"
"            || cr1.par_doc_no);
"
"      END IF;
"
"
"
"      CLOSE c2;
"
"   END LOOP;
"
"
"
"   OPEN c3;
"
"
"
"   FETCH c3 INTO cr3;
"
"
"
"   IF c3%FOUND
"
"   THEN
"
"      RAISE_APPLICATION_ERROR(-20999,
"
"            'Incorrect Pay Amount.'
"
"         || CHR (10)
"
"         || 'Doc. Pfx/No/Due No.: '
"
"         || cr3.par_pfx
"
"         || '/'
"
"         || cr3.par_doc_no
"
"         || '/'
"
"         || cr3.pdd_seq_no);
"
"   END IF;
"
"
"
"   CLOSE c3;
"
"END;
"
"--proc_chk_db_doc;
"
"DECLARE
"
"   CURSOR c7
"
"   IS
"
"      SELECT apmc_pay_offset
"
"        FROM apm_control
"
"       WHERE apmc_bu = p_bu;
"
"
"
"
"
"   CURSOR c8
"
"   IS
"
"      SELECT *
"
"        FROM pending_payables_stat_vw_hist
"
"       WHERE (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"             AND (pdd_bal_amt - pdd_in_progress) > 0
"
"             AND pdd_check_flag = 'N'
"
"             AND par_status = 'P'
"
"             AND par_bu = p_bu
"
"             AND par_doc_type  IN ('CMR', 'DMI', 'II', 'PI')
"
"             AND par_bfcry_type = 'S'
"
"             AND par_suplr_id IN
"
"                    (SELECT DISTINCT par_suplr_id
"
"                       FROM pending_payables_stat_vw_hist
"
"                      WHERE       (par_sc_bal_amt - par_sc_proc_amt > 0)
"
"                            AND (pdd_bal_amt - pdd_in_progress > 0)
"
"                            AND pdd_check_flag = 'Y'
"
"                            AND par_status = 'P'
"
"                            AND par_bu = p_bu
"
"                            AND pdd_user = p_user);
"
"
"
"   cr7      c7%ROWTYPE;
"
"   cr8      c8%ROWTYPE;
"
"   v_year   NUMBER;
"
"   v_per    NUMBER;
"
"BEGIN
"
"   OPEN c8;
"
"
"
"   FETCH c8 INTO cr8;
"
"
"
"   IF c8%FOUND
"
"   THEN
"
"      OPEN c7;
"
"
"
"      FETCH c7 INTO cr7;
"
"
"
"
"
"
"
"      proc_find_year_period (p_bu,
"
"                             SYSDATE,
"
"                             v_year,
"
"                             v_per);
"
"
"
"      IF cr7.apmc_pay_offset = 'P'
"
"      THEN
"
"         IF (func_find_year (p_bu, cr8.par_doc_date) < v_year)
"
"            OR (func_find_year (p_bu, cr8.par_doc_date) = v_year
"
"                AND func_find_period (p_bu, cr8.par_doc_date) <= v_per)
"
"         THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'Payment cannot be made when DB exists in the lesser / same period');
"
"         END IF;
"
"      ELSIF cr7.apmc_pay_offset = 'C'
"
"      THEN
"
"         RAISE_APPLICATION_ERROR(-20999,'Payment cannot be made when DB exists in the any period');
"
"      ELSIF cr7.apmc_pay_offset = 'D'
"
"      THEN
"
"            apex_application.g_print_success_message := '<span style=""color:WHITE""> Debit Doc. exists for this supplier. </span>';
"
"      END IF;
"
"
"
"      CLOSE c7;
"
"   END IF;
"
"   CLOSE c8;
"
"END;
"
"
"
"
"
"
"
"DECLARE
"
"
"
"   CURSOR c1
"
"   IS
"
"      SELECT 1
"
"        FROM pending_payables_stat_vw_hist
"
"       WHERE     (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"             AND (pdd_bal_amt - pdd_in_progress) > 0
"
"             AND pdd_check_flag = 'Y'
"
"             AND par_status = 'P'
"
"             AND par_bu = p_bu
"
"             AND pdd_user = p_user;
"
"
"
"   CURSOR c2
"
"   IS
"
"        SELECT /*+ FIRST_ROWS */ par_suplr_id, par_currency, SUM (cr_amt - db_amt) amt
"
"          FROM (  SELECT /*+ FIRST_ROWS */ SUM (
"
"                            CASE
"
"                               WHEN par_dr_cr = 'DR' THEN pdd_pay_amt
"
"                               ELSE 0
"
"                            END)
"
"                            db_amt,
"
"                         SUM (
"
"                            CASE
"
"                               WHEN par_dr_cr = 'CR' THEN pdd_pay_amt
"
"                               ELSE 0
"
"                            END)
"
"                            cr_amt,
"
"                         par_currency,
"
"                        par_suplr_id
"
"                    FROM pending_payables_stat_vw_hist
"
"                   WHERE (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"                         AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                         AND pdd_check_flag = 'Y'
"
"                         AND par_status = 'P'
"
"                         AND par_bu = p_bu
"
"                         AND pdd_user = p_user
"
"                GROUP BY par_currency, par_bfcry_type, par_suplr_id)
"
"      GROUP BY par_currency, par_suplr_id
"
"        HAVING SUM (cr_amt - db_amt) > 0;
"
"
"
"
"
"   CURSOR c3
"
"   IS
"
"      SELECT MAX (par_doc_date) doc_date
"
"        FROM pending_payables_stat_vw_hist
"
"       WHERE     (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"             AND (pdd_bal_amt - pdd_in_progress) > 0
"
"             AND pdd_check_flag = 'Y'
"
"             AND par_status = 'P'
"
"             AND par_bu = p_bu
"
"             AND pdd_user = p_user;
"
"
"
"
"
"   cr1            c1%ROWTYPE;
"
"   cr2            c2%ROWTYPE;
"
"   cr3            c3%ROWTYPE;
"
"
"
"   cancel_alert   NUMBER;
"
"   v_cnt          NUMBER;
"
"BEGIN
"
"   OPEN c1;
"
"
"
"   FETCH c1 INTO cr1;
"
"
"
"   IF c1%NOTFOUND
"
"   THEN
"
"      raise_application_error(-20999,'Please select the document');
"
"   END IF;
"
"
"
"   CLOSE c1;
"
"
"
"   OPEN c2;
"
"
"
"   FETCH c2 INTO cr2;
"
"
"
"   IF c2%NOTFOUND
"
"   THEN
"
"      raise_application_error(-20999,'Credit amount should be Greater than the Debit amount');
"
"   END IF;
"
"
"
"   CLOSE c2;
"
"
"
"   OPEN c3;
"
"
"
"   FETCH c3 INTO cr3;
"
"
"
"
"
"   CLOSE c3;
"
"END ;
"
"END proc_check_pay_stat;
"
"PROCEDURE proc_valid_prnd_payabl(p_bu          VARCHAR2,
"
"                                 p_user        VARCHAR2,
"
"                                 p_ord_pfx     VARCHAR2,
"
"                                 p_ord_no      VARCHAR2,
"
"                                 p_fetch_line  VARCHAR2,
"
"                                 p_seq_no      NUMBER,
"
"                                 p_trans_curr  VARCHAR2,
"
"                                 p_vou_type      VARCHAR2)
"
"IS
"
"  v_valid_part            VARCHAR2(2);
"
"  v_suplr_name            VARCHAR2(100);
"
"  v_suplr_doc_no          VARCHAR2(30);
"
"  v_pfx                    VARCHAR2(50);
"
"  v_doc_no                VARCHAR2(50);
"
"  v_pfx10                    VARCHAR2(50);
"
"  v_suphd_doc_no10        VARCHAR2(50);
"
"  v_pfx11                    VARCHAR2(50);
"
"  v_pfx12                    VARCHAR2(50);
"
"  v_suphd_doc_no12        VARCHAR2(50);
"
"  v_suphd_doc_no14        VARCHAR2(50);
"
"BEGIN
"
"proc_check_db_doc_payab(p_bu,
"
"                        p_user,
"
"                        v_valid_part,
"
"                        v_suplr_name,
"
"                        v_suplr_doc_no,
"
"                        v_pfx,
"
"                        v_doc_no,
"
"                        v_pfx10,
"
"                        v_suphd_doc_no10,
"
"                        v_pfx11,
"
"                        v_pfx12,
"
"                        v_suphd_doc_no12,
"
"                        v_suphd_doc_no14);
"
"
"
"IF v_valid_part = 'P1' AND v_suplr_name IS NOT NULL THEN
"
"    RAISE_APPLICATION_ERROR(-20999,'Debit Doc. exists for this Party ('||v_suplr_name||')');
"
"ELSIF v_valid_part = 'P2' AND v_suplr_name IS NOT NULL THEN
"
"    RAISE_APPLICATION_ERROR(-20999,'Debit Doc. exists for this Supplier('||v_suplr_name||')');
"
"ELSIF v_valid_part = 'P3' AND v_suplr_doc_no IS NOT NULL THEN
"
"    RAISE_APPLICATION_ERROR(-20999,'Debit document exists against the Bill No. '||v_suplr_doc_no);
"
"ELSIF v_valid_part = 'P4' AND v_pfx IS NOT NULL AND v_doc_no IS NOT NULL THEN
"
"    RAISE_APPLICATION_ERROR(-20999,'TDS Debit Document '||v_pfx||'-'||v_doc_no||' can be adjusted only against the bill.');
"
"ELSIF v_valid_part = 'P5' AND v_pfx10 IS NOT NULL AND v_pfx11 IS NOT NULL THEN
"
"    RAISE_APPLICATION_ERROR(-20999,'Select the Debit Document against'||'-'||v_pfx10||'-'||'DB Doc.Pfx.No.'||v_pfx11|| CHR (10));
"
"ELSIF v_valid_part = 'P6' AND v_pfx10 IS NOT NULL AND v_suphd_doc_no10 IS NOT NULL THEN
"
"    --v_error_text := 'Debit Document Not Yet Created for the Rejected Qty - Rcpt Pfx/no : '||v_pfx10|| ' - '|| 'For Bill No. : '||v_suphd_doc_no10;
"
"    RAISE_APPLICATION_ERROR(-20999,'Debit Document Not Yet Created for the Rejected Qty - Rcpt Pfx/no : '||v_pfx10|| ' - '|| 'For Bill No. : '||v_suphd_doc_no10);
"
"ELSIF v_valid_part = 'P7' AND v_pfx12 IS NOT NULL AND v_pfx11 IS NOT NULL THEN
"
"    RAISE_APPLICATION_ERROR(-20999,'Select the Debit Document against'||'-'||v_pfx12||'-'||'DB Doc.Pfx.No.'||v_pfx11|| CHR (10));
"
"ELSIF v_valid_part = 'P8' AND v_pfx12 IS NOT NULL AND v_suphd_doc_no12 IS NOT NULL THEN
"
"    --v_error_text := 'Debit Document Not Yet Created for the Rejected Qty - Rcpt Pfx/no : '||v_pfx12|| ' - '|| 'For Bill No. : '||v_suphd_doc_no12;
"
"    RAISE_APPLICATION_ERROR(-20999,'Debit Document Not Yet Created for the Rejected Qty - Rcpt Pfx/no : '||v_pfx12|| ' - '|| 'For Bill No. : '||v_suphd_doc_no12);
"
"ELSIF v_valid_part = 'P9' AND  v_suphd_doc_no14 IS NOT NULL THEN
"
"    RAISE_APPLICATION_ERROR(-20999,'Please select the TDS document against the Bill No. '||v_suphd_doc_no14);
"
"END IF;
"
"
"
"
"
"DECLARE
"
"  CURSOR c1
"
"    IS
"
"  SELECT par_suplr_id,suplr_status,suplr_name1,suplr_party_type
"
"    FROM pending_payables_vw_hist_rev,suppliers
"
"   WHERE par_bu = p_bu
"
"     AND suplr_bu = par_bu
"
"     AND suplr_suplr_id = par_suplr_id
"
"     AND (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"     AND (pdd_bal_amt - pdd_in_progress) > 0
"
"     AND pdd_check_flag = 'Y'
"
"     AND pdd_user = p_user;
"
"
"
"BEGIN
"
"  FOR cr1 IN c1
"
"    LOOP
"
"
"
"      IF cr1.suplr_status <> 'A' THEN
"
"         RAISE_APPLICATION_ERROR(-20999,'Supplier not in Active Status '||cr1.suplr_name1) ;
"
"      END IF;
"
"      IF cr1.suplr_party_type IN ('P','I') AND (p_vou_type <> 'JV' OR p_vou_type IS NULL) THEN
"
"        RAISE_APPLICATION_ERROR(-20999,'Cashier/Imprestor not allowed for Payment');
"
"      END IF;
"
"     END LOOP;
"
"END;
"
"DECLARE
"
"  v_cnt   NUMBER;
"
"BEGIN
"
"FOR cr1 IN ( SELECT par_suplr_id,par_plant
"
"                  FROM pending_payables_vw_hist_rev
"
"                 WHERE (par_sc_bal_amt - par_sc_proc_amt) > 0
"
"                   AND (pdd_bal_amt - pdd_in_progress) > 0
"
"                   AND pdd_check_flag = 'Y'
"
"                   AND par_status = 'P'
"
"                   AND par_bu = p_bu
"
"                   AND pdd_user = p_user
"
"                   AND ((par_bfcry_type IN ('C','S') AND p_fetch_line IN ('F','N')) OR  (((par_bfcry_type IN ('C') AND par_doc_type ='SB') OR par_bfcry_type IN ('S')) AND p_fetch_line ='A'))
"
"                   AND ((p_seq_no IS NOT NULL AND EXISTS (SELECT 1
"
"                                                                      FROM bank_trans_dist_ln
"
"                                                                     WHERE btdln_bu = p_bu
"
"                                                                       AND btdln_ord_no = p_ord_no
"
"                                                                       AND btdln_seq_no = p_seq_no
"
"                                                                       AND btdln_acct_plant = par_plant
"
"                                                                       AND btdln_lgr_bfcry_id = par_suplr_id))
"
"                       OR p_seq_no IS NULL)
"
"                   AND (p_fetch_line  IN ('F','N') AND (par_currency = p_trans_curr OR p_trans_curr IS NULL) OR p_fetch_line = 'A'))
"
"   LOOP
"
"      SELECT COUNT(*)
"
"        INTO v_cnt
"
"        FROM suplr_cust_ledger_vw_rev
"
"       WHERE GLAL_BU = p_bu
"
"         AND GLAL_SUPLR_ID = cr1.par_suplr_id
"
"         AND GLAL_PLANT = cr1.par_plant;
"
"
"
"      IF v_cnt = 0 THEN
"
"         RAISE_APPLICATION_ERROR(-20999,'Party Not found  -  ' || cr1.par_suplr_id );
"
"      END IF;
"
"   END LOOP;
"
"END;
"
"END proc_valid_prnd_payabl;
"
"END;"
/
