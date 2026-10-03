CREATE OR REPLACE
"PACKAGE BODY pkg_fin_doc_rev
"
"AS
"
"   PROCEDURE proc_fin_doc_rev (p_bu          VARCHAR2,
"
"                               p_vou_type    VARCHAR2,
"
"                               p_vou_pfx     VARCHAR2,
"
"                               p_vou_no      VARCHAR2,
"
"                               p_ref         VARCHAR2,
"
"                               p_user        VARCHAR2)
"
"   IS
"
"      CURSOR c1
"
"      IS
"
"         SELECT *
"
"           FROM bank_trans_hist
"
"          WHERE     btransh_bu = p_bu
"
"                AND btransh_ord_pfx = p_vou_pfx
"
"                AND btransh_ord_no = p_vou_no;
"
"
"
"      CURSOR c3
"
"      IS
"
"         SELECT *
"
"           FROM suplr_doc_hd_hist
"
"          WHERE     suphdh_bu = p_bu
"
"                AND suphdh_pfx = p_vou_pfx
"
"                AND suphdh_doc_no = p_vou_no
"
"                AND p_vou_type IN( 'APD','ARD');
"
"
"
"     CURSOR c4
"
"     IS
"
"     SELECT sihd_plant,
"
"                 sihd_doc_no
"
"       FROM sales_invoices_hd
"
"    WHERE sihd_bu = p_bu
"
"        AND sihd_inv_pfx = p_vou_pfx
"
"        AND sihd_inv_no = p_vou_no;
"
"
"
"
"
"      v_rcrg_jv_cnt   NUMBER (5);
"
"      cr4                  c4%ROWTYPE;
"
"
"
"   BEGIN
"
" --RAISE_APPLICATION_ERROR(-20999,'HRM'||'/'||p_vou_type);
"
"      --RAISE_APPLICATION_ERROR(-20999,'GLM');
"
"      FOR cr3 IN c3
"
"      LOOP
"
"
"
"
"
"         FOR cr03
"
"            IN (SELECT *
"
"                  FROM par_doc_offsets
"
"                 WHERE pdo_bu = p_bu AND pdo_auto_offset = 'N'
"
"                       AND ( (pdo_cr_doc_pfx = cr3.suphdh_pfx
"
"                              AND pdo_cr_doc_no = cr3.suphdh_doc_no)
"
"                            OR (pdo_db_doc_pfx = cr3.suphdh_pfx
"
"                                AND pdo_db_doc_no = cr3.suphdh_doc_no)))
"
"         LOOP
"
"            proc_del_par_doc_offsets (cr03.pdo_bu,
"
"                                      cr03.pdo_doc_no,
"
"                                      cr03.pdo_src_off_doc_no,
"
"                                      TRUNC (cr03.pdo_doc_date),
"
"                                      'D',
"
"                                      p_user);
"
"            DELETE from appl_journals_hist
"
"                where ajh_bu=p_bu
"
"                and ajh_vou_no=cr03.pdo_doc_no;
"
"
"
"             UPDATE gl_jrnl_hd_hist
"
"                SET gjhh_status='C'
"
"                WHERE gjhh_bu= p_bu
"
"                AND gjhh_vou_no=cr03.pdo_doc_no;
"
"         END LOOP;
"
"
"
"                UPDATE suplr_doc_hd_hist
"
"               SET suphdh_rev_last_reason = p_ref
"
"             WHERE     suphdh_bu = p_bu
"
"                   AND suphdh_pfx = cr3.suphdh_pfx
"
"                   AND suphdh_doc_no = cr3.suphdh_doc_no;
"
"
"
"         proc_cre_audit_trial_doc (p_bu,
"
"                                  p_vou_type,-- 'APD',
"
"                                   NULL,--cr3.suphdh_pfx,
"
"                                   cr3.suphdh_doc_no,
"
"                                   'R',
"
"                                   p_user);
"
"
"
"         proc_cre_audit_trial_doc_aj_gj (p_bu,
"
"                                   'GLJ',
"
"                                   p_vou_type,-- 'APD',
"
"                                   cr3.suphdh_pfx,
"
"                                   cr3.suphdh_doc_no,
"
"                                   'R',
"
"                                   p_user);
"
"
"
"         proc_ins_ap_doc_hist_rev (p_bu,
"
"                                   cr3.suphdh_plant,
"
"                                   cr3.suphdh_pfx,
"
"                                   cr3.suphdh_doc_no,
"
"                                   p_user--p_ref
"
"                                   );
"
"
"
"         proc_ins_ap_doc_rev (p_bu,
"
"                              cr3.suphdh_plant,
"
"                              cr3.suphdh_pfx,
"
"                              cr3.suphdh_doc_no,
"
"                              p_user,
"
"                              TRUNC (SYSDATE));
"
"
"
"
"
"
"
"
"
"         /*/proc_ins_doc_rev_audit (
"
"            p_bu,
"
"            cr3.suphdh_plant,
"
"            'APD',
"
"            cr3.suphdh_pfx,
"
"            cr3.suphdh_doc_no,
"
"            cr3.suphdh_doc_date,
"
"            p_user,
"
"            SYSDATE,
"
"            NULL,
"
"            cr3.suphdh_sc_tot_amt * cr3.suphdh_exchange_rate,
"
"            cr3.suphdh_status,
"
"            p_ref);*/
"
"      END LOOP;
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"         IF p_vou_type = 'BPV'
"
"         THEN
"
"               UPDATE bank_trans_hist
"
"                  SET btransh_rev_last_reason = p_ref
"
"                WHERE     btransh_bu = p_bu
"
"                      AND btransh_ord_pfx = cr1.btransh_ord_pfx
"
"                      AND btransh_ord_no = cr1.btransh_ord_no;
"
"
"
"
"
"               proc_upd_bank_rct_amt_reverse (p_bu,
"
"                                              cr1.btransh_bank_id,
"
"                                              cr1.btransh_ord_no,
"
"                                              cr1.btransh_ord_pfx,
"
"                                              'B');
"
"               proc_cre_audit_trial_doc (p_bu,
"
"                                         'BPV',
"
"                                         NULL,--cr1.btransh_ord_pfx,
"
"                                         cr1.btransh_ord_no,
"
"                                         'R',
"
"                                         p_user);
"
"
"
"               proc_cre_audit_trial_doc_aj_gj (p_bu,
"
"                                         'GLJ',
"
"                                         'BPV',
"
"                                         cr1.btransh_ord_pfx,
"
"                                         cr1.btransh_ord_no,
"
"                                         'R',
"
"                                         p_user);
"
"
"
"               proc_rev_bank_trans (p_bu,
"
"                                    cr1.btransh_ord_pfx,
"
"                                    cr1.btransh_ord_no,
"
"                                    p_user,
"
"                                    SYSDATE);
"
"
"
"               proc_ins_doc_rev_audit (
"
"                  p_bu,
"
"                  cr1.btransh_plant,
"
"                  'BPV',
"
"                  cr1.btransh_ord_pfx,
"
"                  cr1.btransh_ord_no,
"
"                  cr1.btransh_trans_date,
"
"                  p_user,
"
"                  SYSDATE,
"
"                  NULL,
"
"                  ROUND (
"
"                     (cr1.btransh_bank_net_amt * cr1.btransh_bank_base_exrate),
"
"                     func_find_appl_rnddigit (p_bu)),
"
"                  cr1.btransh_status,
"
"                  p_ref);
"
"
"
"               proc_upd_bcl (p_bu,
"
"                             cr1.btransh_bank_id,
"
"                             cr1.btransh_ord_pfx,
"
"                             cr1.btransh_ord_no,
"
"                             'R',
"
"                             'P');
"
"
"
"               UPDATE adv_pay_rqst_hd
"
"                  SET aprh_vou_status = 'N'
"
"                WHERE     aprh_bu = p_bu
"
"                      AND aprh_vou_pfx = cr1.btransh_ord_pfx
"
"                      AND aprh_vou_no = cr1.btransh_ord_no;
"
"
"
"
"
"               --reversing from History Screen
"
"               proc_ins_bank_trans_hist_rev (p_bu,
"
"                                             cr1.btransh_ord_pfx,
"
"                                             cr1.btransh_ord_no);
"
"            --END IF;
"
"         ELSIF p_vou_type = 'BRV'
"
"         THEN
"
"            UPDATE bank_trans_hist
"
"               SET btransh_rev_last_reason = p_ref
"
"             WHERE     btransh_bu = p_bu
"
"                   AND btransh_ord_pfx = cr1.btransh_ord_pfx
"
"                   AND btransh_ord_no = cr1.btransh_ord_no;
"
"
"
"            proc_upd_bank_rct_amt_reverse (p_bu,
"
"                                           cr1.btransh_bank_id,
"
"                                           cr1.btransh_ord_no,
"
"                                           cr1.btransh_ord_pfx,
"
"                                           'R');
"
"
"
"            proc_cre_audit_trial_doc (p_bu,
"
"                                      'BRV',
"
"                                      NULL,--cr1.btransh_ord_pfx,
"
"                                      cr1.btransh_ord_no,
"
"                                      'R',
"
"                                      p_user);
"
"
"
"            proc_cre_audit_trial_doc_aj_gj (p_bu,
"
"                                      'GLJ',
"
"                                      'BRV',
"
"                                      cr1.btransh_ord_pfx,
"
"                                      cr1.btransh_ord_no,
"
"                                      'R',
"
"                                      p_user);
"
"
"
"            proc_rev_bank_trans (p_bu,
"
"                                 cr1.btransh_ord_pfx,
"
"                                 cr1.btransh_ord_no,
"
"                                 p_user,
"
"                                 SYSDATE);
"
"
"
"            proc_ins_doc_rev_audit (
"
"               p_bu,
"
"               cr1.btransh_plant,
"
"               'BRV',
"
"               cr1.btransh_ord_pfx,
"
"               cr1.btransh_ord_no,
"
"               cr1.btransh_trans_date,
"
"               p_user,
"
"               SYSDATE,
"
"               NULL,
"
"               ROUND (
"
"                  cr1.btransh_bank_net_amt * (cr1.btransh_bank_base_exrate),
"
"                  func_find_appl_rnddigit (p_bu)),
"
"               cr1.btransh_status,
"
"               p_ref);
"
"
"
"
"
"            proc_upd_bcl (p_bu,
"
"                          cr1.btransh_bank_id,
"
"                          cr1.btransh_ord_pfx,
"
"                          cr1.btransh_ord_no,
"
"                          'R',
"
"                          'R');
"
"
"
"            proc_ins_bank_trans_hist_rev (p_bu,
"
"                                          cr1.btransh_ord_pfx,
"
"                                          cr1.btransh_ord_no
"
"                                          );
"
"
"
"         ELSIF p_vou_type = 'CPV'
"
"         THEN
"
"
"
"               UPDATE bank_trans_hist
"
"                  SET btransh_rev_last_reason = p_ref
"
"                WHERE     btransh_bu = p_bu
"
"                      AND btransh_ord_pfx = cr1.btransh_ord_pfx
"
"                      AND btransh_ord_no = cr1.btransh_ord_no;
"
"
"
"               proc_cre_audit_trial_doc (p_bu,
"
"                                         'CPV',
"
"                                         NULL,--cr1.btransh_ord_pfx,
"
"                                         cr1.btransh_ord_no,
"
"                                         'R',
"
"                                         p_user);
"
"
"
"               proc_cre_audit_trial_doc_aj_gj (p_bu,
"
"                                         'GLJ',
"
"                                         'CPV',
"
"                                         cr1.btransh_ord_pfx,
"
"                                         cr1.btransh_ord_no,
"
"                                         'R',
"
"                                         p_user);
"
"
"
"               proc_rev_bank_trans (p_bu,
"
"                                    cr1.btransh_ord_pfx,
"
"                                    cr1.btransh_ord_no,
"
"                                    p_user,
"
"                                    SYSDATE);
"
"
"
"               proc_ins_doc_rev_audit (
"
"                  p_bu,
"
"                  cr1.btransh_plant,
"
"                  'CPV',
"
"                  cr1.btransh_ord_pfx,
"
"                  cr1.btransh_ord_no,
"
"                  cr1.btransh_trans_date,
"
"                  p_user,
"
"                  SYSDATE,
"
"                  NULL,
"
"                  ROUND (
"
"                     (cr1.btransh_bank_net_amt * cr1.btransh_bank_base_exrate),
"
"                     func_find_appl_rnddigit (p_bu)),
"
"                  cr1.btransh_status,
"
"                  p_ref);
"
"
"
"               UPDATE adv_pay_rqst_hd
"
"                  SET aprh_vou_status = 'N'
"
"                WHERE     aprh_bu = p_bu
"
"                      AND aprh_vou_pfx = cr1.btransh_ord_pfx
"
"                      AND aprh_vou_no = cr1.btransh_ord_no;
"
"
"
"               proc_ins_bank_trans_hist_rev (p_bu,
"
"                                             cr1.btransh_ord_pfx,
"
"                                             cr1.btransh_ord_no
"
"                                             );
"
"               --KESAVAN FOR UPDATING emp_wfm_wp_flag IN LABOUR MASTER
"
"/*
"
"               UPDATE employees
"
"                  SET emp_wfm_wp_flag = 'W'
"
"                WHERE emp_emp_id IN
"
"                         (  SELECT emp_emp_id
"
"                              FROM wfm_wp_sadad_hd,
"
"                                   wfm_wp_sadad_ln,
"
"                                   employees,
"
"                                   bank_trans
"
"                             WHERE     wwpshd_bu = p_bu
"
"                                   AND wwpsln_bu = emp_bu
"
"                                   AND wwpsln_emp_id = emp_emp_id
"
"                                   AND wwpsln_vou_pfx = cr1.btransh_ord_pfx
"
"                                   AND wwpsln_vou_no = cr1.btransh_ord_no
"
"                          GROUP BY emp_emp_id);
"
"
"
"               --Kesavan FOR UPDATING emp_wfm_iq_flag IN labour MASTER
"
"               UPDATE employees
"
"                  SET emp_wfm_iq_flag = 'W'
"
"                WHERE emp_emp_id IN
"
"                         (  SELECT emp_emp_id
"
"                              FROM wfm_iqama_sadad_hd,
"
"                                   wfm_iqama_sadad_ln,
"
"                                   employees,
"
"                                   bank_trans
"
"                             WHERE     wiqshd_bu = p_bu
"
"                                   AND wiqshd_plnt = wiqsln_plnt
"
"                                   AND wiqshd_doc_no = wiqsln_doc_no
"
"                                   AND wiqsln_bu = emp_bu
"
"                                   AND wiqsln_emp_id = emp_emp_id
"
"                                   AND wiqsln_vou_pfx = cr1.btransh_ord_pfx
"
"                                   AND wiqsln_vou_no = cr1.btransh_ord_no
"
"                                   AND emp_wfm_iq_flag = 'P'
"
"                          GROUP BY emp_emp_id);*/
"
"         --   END IF;
"
"         ELSIF p_vou_type = 'CRV'
"
"         THEN
"
"            UPDATE bank_trans_hist
"
"               SET btransh_rev_last_reason = p_ref
"
"             WHERE     btransh_bu = p_bu
"
"                   AND btransh_ord_pfx = cr1.btransh_ord_pfx
"
"                   AND btransh_ord_no = cr1.btransh_ord_no;
"
"
"
"            proc_cre_audit_trial_doc (p_bu,
"
"                                      'CRV',
"
"                                      NULL,--cr1.btransh_ord_pfx,
"
"                                      cr1.btransh_ord_no,
"
"                                      'R',
"
"                                      p_user);
"
"
"
"               proc_cre_audit_trial_doc_aj_gj (p_bu,
"
"                                         'GLJ',
"
"                                         'CRV',
"
"                                         cr1.btransh_ord_pfx,
"
"                                         cr1.btransh_ord_no,
"
"                                         'R',
"
"                                         p_user);
"
"
"
"            proc_rev_bank_trans (p_bu,
"
"                                 cr1.btransh_ord_pfx,
"
"                                 cr1.btransh_ord_no,
"
"                                 p_user,
"
"                                 SYSDATE);
"
"
"
"            proc_ins_doc_rev_audit (
"
"               p_bu,
"
"               cr1.btransh_plant,
"
"               'CRV',
"
"               cr1.btransh_ord_pfx,
"
"               cr1.btransh_ord_no,
"
"               cr1.btransh_trans_date,
"
"               p_user,
"
"               SYSDATE,
"
"               NULL,
"
"               ROUND (
"
"                  cr1.btransh_bank_net_amt * (cr1.btransh_trans_base_exrate),
"
"                  func_find_appl_rnddigit (p_bu)),
"
"               cr1.btransh_status,
"
"               p_ref);
"
"
"
"            --KESAVAN FOR UPDATING emp_wfm_wp_flag IN LABOUR MASTER
"
"/*
"
"            UPDATE employees
"
"               SET emp_wfm_wp_flag = 'W'
"
"             WHERE emp_emp_id IN
"
"                      (  SELECT emp_emp_id
"
"                           FROM wfm_wp_sadad_hd,
"
"                                wfm_wp_sadad_ln,
"
"                                employees,
"
"                                bank_trans
"
"                          WHERE     wwpshd_bu = p_bu
"
"                                AND wwpsln_bu = emp_bu
"
"                                AND wwpsln_emp_id = emp_emp_id
"
"                                AND wwpsln_vou_pfx = cr1.btransh_ord_pfx
"
"                                AND wwpsln_vou_no = cr1.btransh_ord_no
"
"                       GROUP BY emp_emp_id);
"
"
"
"            --KESAVAN FOR UPDATING emp_wfm_iq_flag IN LABOUR MASTER
"
"            UPDATE employees
"
"               SET emp_wfm_iq_flag = 'W'
"
"             WHERE emp_emp_id IN
"
"                      (  SELECT emp_emp_id
"
"                           FROM wfm_iqama_sadad_hd,
"
"                                wfm_iqama_sadad_ln,
"
"                                employees,
"
"                                bank_trans
"
"                          WHERE     wiqshd_bu = p_bu
"
"                                AND wiqshd_plnt = wiqsln_plnt
"
"                                AND wiqshd_doc_no = wiqsln_doc_no
"
"                                AND wiqsln_bu = emp_bu
"
"                                AND wiqsln_emp_id = emp_emp_id
"
"                                AND wiqsln_vou_pfx = cr1.btransh_ord_pfx
"
"                                AND wiqsln_vou_no = cr1.btransh_ord_no
"
"                                AND emp_wfm_iq_flag = 'P'
"
"                       GROUP BY emp_emp_id);*/
"
"         ELSIF p_vou_type = 'JV'
"
"         THEN
"
"
"
"            UPDATE bank_trans_hist
"
"               SET btransh_rev_last_reason = p_ref
"
"             WHERE     btransh_bu = p_bu
"
"                   AND btransh_ord_pfx = cr1.btransh_ord_pfx
"
"                   AND btransh_ord_no = cr1.btransh_ord_no;
"
"
"
"            proc_cre_audit_trial_doc (p_bu,
"
"                                      'JV',
"
"                                      NULL,--cr1.btransh_ord_pfx,
"
"                                      cr1.btransh_ord_no,
"
"                                      'R',
"
"                                      p_user);
"
"
"
"            proc_cre_audit_trial_doc_aj_gj (p_bu,
"
"                                      'GLJ',
"
"                                      'JV',
"
"                                      cr1.btransh_ord_pfx,
"
"                                      cr1.btransh_ord_no,
"
"                                      'R',
"
"                                      p_user);
"
"
"
"            proc_rev_jrnl_vouch (p_bu,
"
"                                 cr1.btransh_ord_pfx,
"
"                                 cr1.btransh_ord_no,
"
"                                 p_user,
"
"                                 cr1.btransh_trans_date);
"
"
"
"            proc_ins_doc_rev_audit (
"
"               p_bu,
"
"               cr1.btransh_plant,
"
"               'JV',
"
"               cr1.btransh_ord_pfx,
"
"               cr1.btransh_ord_no,
"
"               cr1.btransh_trans_date,
"
"               p_user,
"
"               SYSDATE,
"
"               NULL,
"
"               ROUND (
"
"                  (cr1.btransh_bank_net_amt * cr1.btransh_bank_base_exrate),
"
"                  func_find_appl_rnddigit (p_bu)),
"
"               cr1.btransh_status,
"
"               p_ref);
"
"         ELSIF p_vou_type = 'CV'
"
"         THEN
"
"            UPDATE bank_trans_hist
"
"               SET btransh_rev_last_reason = p_ref
"
"             WHERE     btransh_bu = p_bu
"
"                   AND btransh_ord_pfx = p_vou_pfx
"
"                   AND btransh_ord_no = p_vou_no;
"
"
"
"            proc_upd_bank_rct_amt_reverse (p_bu,
"
"                                           cr1.btransh_bank_id,
"
"                                           cr1.btransh_ord_no,
"
"                                           cr1.btransh_ord_pfx,
"
"                                           'F');
"
"
"
"            proc_cre_audit_trial_doc (p_bu,
"
"                                      'CV',
"
"                                      NULL,--cr1.btransh_ord_pfx,
"
"                                      cr1.btransh_ord_no,
"
"                                      'R',
"
"                                      p_user);
"
"
"
"            proc_cre_audit_trial_doc_aj_gj (p_bu,
"
"                                      'GLJ',
"
"                                      'CV',
"
"                                      cr1.btransh_ord_pfx,
"
"                                      cr1.btransh_ord_no,
"
"                                      'R',
"
"                                      p_user);
"
"
"
"            proc_rev_bank_trans (p_bu,
"
"                                 cr1.btransh_ord_pfx,
"
"                                 cr1.btransh_ord_no,
"
"                                 p_user,
"
"                                 SYSDATE);
"
"
"
"            proc_ins_doc_rev_audit (
"
"               p_bu,
"
"               cr1.btransh_plant,
"
"               'CV',
"
"               cr1.btransh_ord_pfx,
"
"               cr1.btransh_ord_no,
"
"               cr1.btransh_trans_date,
"
"               p_user,
"
"               SYSDATE,
"
"               NULL,
"
"               ROUND (
"
"                  (cr1.btransh_bank_net_amt * cr1.btransh_bank_base_exrate),
"
"                  func_find_appl_rnddigit (p_bu)),
"
"               cr1.btransh_status,
"
"               p_ref);
"
"
"
"            proc_ins_bank_trans_hist_rev (p_bu,
"
"                                          cr1.btransh_ord_pfx,
"
"                                          cr1.btransh_ord_no
"
"                                          );
"
"         END IF;
"
"      END LOOP;
"
"
"
"      IF p_vou_type IN ('SI','CN','DN')
"
"      THEN
"
"         OPEN c4;
"
"         FETCH c4 INTO cr4;
"
"         CLOSE c4;
"
"
"
"         proc_cre_audit_trial_doc (p_bu,
"
"                                   'SI',
"
"                                   cr4.sihd_plant,
"
"                                   cr4.sihd_doc_no,
"
"                                   'R',
"
"                                   p_user);
"
"
"
"         FOR r_hd
"
"            IN (SELECT *
"
"                  FROM sales_invoices_hd
"
"                 WHERE     sihd_bu = p_bu
"
"                       AND sihd_inv_pfx = p_vou_pfx
"
"                       AND sihd_inv_no = p_vou_no)
"
"         LOOP
"
"
"
"         proc_cre_audit_trial_doc_aj_gj (p_bu,
"
"                                   'GLJ',
"
"                                   'SI',
"
"                                   r_hd.sihd_inv_pfx,
"
"                                   r_hd.sihd_inv_no,
"
"                                   'R',
"
"                                   p_user);
"
"
"
"            proc_reverse_sales_invoice (r_hd.sihd_bu,
"
"                                        r_hd.sihd_plant,
"
"                                        r_hd.sihd_inv_pfx,
"
"                                        r_hd.sihd_inv_no,
"
"                                        r_hd.sihd_doc_no,
"
"                                        p_user);
"
"         END LOOP;
"
"      END IF;
"
"
"
"      IF p_vou_type = 'GRN'
"
"      THEN
"
"      --RAISE_APPLICATION_ERROR(-20999,'GRN');
"
"         proc_cre_audit_trial_doc (p_bu,
"
"                                   'GRN',
"
"                                   NULL,--p_vou_pfx,
"
"                                   p_vou_no,
"
"                                   'R',
"
"                                   p_user);
"
"
"
"         proc_cre_audit_trial_doc_aj_gj (p_bu,
"
"                                   'GLJ',
"
"                                   'GRN',
"
"                                   p_vou_pfx,
"
"                                   p_vou_no,
"
"                                   'R',
"
"                                   p_user);
"
"
"
"         pkg_pur_rcpt.proc_corr_pur_rcpt (p_bu,
"
"                                          p_vou_pfx,
"
"                                          p_vou_no,
"
"                                          p_user);
"
"      END IF;
"
"   END;
"
"END pkg_fin_doc_rev;"
/
