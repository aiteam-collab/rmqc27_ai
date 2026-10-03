CREATE OR REPLACE
"PACKAGE body fin_stat_monthly
"
"AS
"
"   PROCEDURE proc_ins_mon_pnl_sub_sch (
"
"      p_bu         VARCHAR,
"
"      p_doc_no     VARCHAR,
"
"      p_year       NUMBER,
"
"      p_from    number,
"
"      p_to        number,
"
"      p_cre_by     VARCHAR,
"
"      p_cre_date   DATE
"
"   )
"
"   IS
"
"      CURSOR c1
"
"      IS
"
"SELECT   pfsmab_cls_id,
"
"         func_find_gl_class_desc (p_bu, pfsmab_cls_id) class_desc,
"
"         SUM (pfsmab_fp_01_amt)  pfsmab_fp_01_amt,
"
"         SUM (pfsmab_fp_02_amt) pfsmab_fp_02_amt,
"
"         SUM (pfsmab_fp_03_amt)  pfsmab_fp_03_amt,
"
"         SUM (pfsmab_fp_04_amt) pfsmab_fp_04_amt,
"
"         SUM (pfsmab_fp_05_amt) pfsmab_fp_05_amt,
"
"         SUM (pfsmab_fp_06_amt) pfsmab_fp_06_amt,
"
"         SUM (pfsmab_fp_07_amt) pfsmab_fp_07_amt,
"
"         SUM (pfsmab_fp_08_amt) pfsmab_fp_08_amt,
"
"         SUM (pfsmab_fp_09_amt) pfsmab_fp_09_amt,
"
"         SUM (pfsmab_fp_10_amt) pfsmab_fp_10_amt,
"
"         SUM (pfsmab_fp_11_amt)  pfsmab_fp_11_amt,
"
"         SUM (pfsmab_fp_12_amt) pfsmab_fp_12_amt,
"
"         SUM (pfsmab_q1_amt)  pfsmab_q1_amt,
"
"         SUM (pfsmab_q2_amt) pfsmab_q2_amt,
"
"         SUM (pfsmab_q3_amt)  pfsmab_q3_amt,
"
"         SUM (pfsmab_q4_amt) pfsmab_q4_amt,
"
"         pfsmab_acct_type
"
"    FROM per_fin_stat_mon_acct_bal
"
"   WHERE pfsmab_bu = p_bu AND pfsmab_doc_no = p_doc_no
"
"GROUP BY pfsmab_cls_id, pfsmab_acct_type
"
"ORDER BY pfsmab_acct_type;
"
"
"
"      v_par_cls_id   VARCHAR2(20);
"
"   BEGIN
"
"      DELETE FROM per_fin_stat_mon_pnl_sub_sch
"
"            WHERE pfsmpss_bu = p_bu AND pfsmpss_doc_no = p_doc_no;
"
"
"
"      DELETE FROM per_fin_stat_mon_bs_sub_sch
"
"            WHERE pfsmbss_bu = p_bu AND pfsmbss_doc_no = p_doc_no;
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"         SELECT gacl_prim_id
"
"           INTO v_par_cls_id
"
"           FROM gl_account_classes
"
"          WHERE gacl_id = cr1.pfsmab_cls_id AND gacl_bu = p_bu;
"
"
"
"         IF cr1.pfsmab_acct_type IN ('E', 'R')
"
"         THEN
"
"            INSERT INTO per_fin_stat_mon_pnl_sub_sch
"
"                        (pfsmpss_bu, pfsmpss_doc_no, pfsmpss_cls_id,
"
"                         pfsmpss_pcls_id, pfsmpss_sch_no, pfsmpss_fp_01_amt,
"
"                         pfsmpss_fp_02_amt, pfsmpss_fp_03_amt,
"
"                         pfsmpss_fp_04_amt, pfsmpss_fp_05_amt,
"
"                         pfsmpss_fp_06_amt, pfsmpss_fp_07_amt,
"
"                         pfsmpss_fp_08_amt, pfsmpss_fp_09_amt,
"
"                         pfsmpss_fp_10_amt, pfsmpss_fp_11_amt,
"
"                         pfsmpss_fp_12_amt, pfsmpss_q1_amt,
"
"                         pfsmpss_q2_amt, pfsmpss_q3_amt,
"
"                         pfsmpss_q4_amt, pfsmpss_acct_type, pfsmpss_cre_by,
"
"                         pfsmpss_cre_date, pfsmpss_upd_by, pfsmpss_upd_date)
"
"                 VALUES (p_bu, p_doc_no, cr1.pfsmab_cls_id,
"
"                         v_par_cls_id, NULL, cr1.pfsmab_fp_01_amt,
"
"                         cr1.pfsmab_fp_02_amt, cr1.pfsmab_fp_03_amt,
"
"                         cr1.pfsmab_fp_04_amt, cr1.pfsmab_fp_05_amt,
"
"                         cr1.pfsmab_fp_06_amt, cr1.pfsmab_fp_07_amt,
"
"                         cr1.pfsmab_fp_08_amt, cr1.pfsmab_fp_09_amt,
"
"                         cr1.pfsmab_fp_10_amt, cr1.pfsmab_fp_11_amt,
"
"                         cr1.pfsmab_fp_12_amt, cr1.pfsmab_q1_amt,
"
"                         cr1.pfsmab_q2_amt, cr1.pfsmab_q3_amt,
"
"                         cr1.pfsmab_q4_amt, cr1.pfsmab_acct_type, p_cre_by,
"
"                         p_cre_date, NULL, NULL);
"
"         ELSIF cr1.pfsmab_acct_type IN ('A', 'L', 'Q')
"
"         THEN
"
"            INSERT INTO per_fin_stat_mon_bs_sub_sch
"
"                        (pfsmbss_bu, pfsmbss_doc_no, pfsmbss_cls_id,
"
"                         pfsmbss_pcls_id, pfsmbss_sch_no, pfsmbss_fp_01_amt,
"
"                         pfsmbss_fp_02_amt, pfsmbss_fp_03_amt,
"
"                         pfsmbss_fp_04_amt, pfsmbss_fp_05_amt,
"
"                         pfsmbss_fp_06_amt, pfsmbss_fp_07_amt,
"
"                         pfsmbss_fp_08_amt, pfsmbss_fp_09_amt,
"
"                         pfsmbss_fp_10_amt, pfsmbss_fp_11_amt,
"
"                         pfsmbss_fp_12_amt, pfsmbss_q1_amt,
"
"                         pfsmbss_q2_amt, pfsmbss_q3_amt,
"
"                         pfsmbss_q4_amt, pfsmbss_acct_type, pfsmbss_cre_by,
"
"                         pfsmbss_cre_date, pfsmbss_upd_by, pfsmbss_upd_date)
"
"                 VALUES (p_bu, p_doc_no, cr1.pfsmab_cls_id,
"
"                         v_par_cls_id, NULL, cr1.pfsmab_fp_01_amt,
"
"                         cr1.pfsmab_fp_02_amt, cr1.pfsmab_fp_03_amt,
"
"                         cr1.pfsmab_fp_04_amt, cr1.pfsmab_fp_05_amt,
"
"                         cr1.pfsmab_fp_06_amt, cr1.pfsmab_fp_07_amt,
"
"                         cr1.pfsmab_fp_08_amt, cr1.pfsmab_fp_09_amt,
"
"                         cr1.pfsmab_fp_10_amt, cr1.pfsmab_fp_11_amt,
"
"                         cr1.pfsmab_fp_12_amt, cr1.pfsmab_q1_amt,
"
"                         cr1.pfsmab_q2_amt, cr1.pfsmab_q3_amt,
"
"                         cr1.pfsmab_q4_amt, cr1.pfsmab_acct_type, p_cre_by,
"
"                         p_cre_date, NULL, NULL);
"
"         END IF;
"
"      END LOOP;
"
"       --raise_application_error(-20999,'TEST');
"
"   END proc_ins_mon_pnl_sub_sch;
"
"
"
"END fin_stat_monthly;"
/
