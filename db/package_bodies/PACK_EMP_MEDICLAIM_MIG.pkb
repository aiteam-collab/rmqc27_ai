CREATE OR REPLACE
"PACKAGE BODY pack_emp_mediclaim_mig
"
"AS
"
"
"
"  PROCEDURE proc_upload_emp_mediclaim_mig(p_bu                          VARCHAR2,
"
"                                          p_plcy_no                     VARCHAR2,
"
"                                          p_dir                         VARCHAR2,
"
"                                          p_file_name                   VARCHAR2,
"
"                                          p_user                        VARCHAR2,
"
"                                          p_res         OUT             VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT table_name
"
"     FROM user_tables
"
"    WHERE table_name = 'TEMP_EMP_MEDICLAIM_MIG_LN';
"
"
"
"      cr1				c1%ROWTYPE;
"
"
"
"   CURSOR c2
"
"       IS
"
"   SELECT COUNT(*) v_cnt
"
"     FROM emp_mediclaim_mig_ln
"
"    WHERE emmln_bu      = p_bu
"
"      AND emmln_plcy_no = p_plcy_no;
"
"
"
"
"
"      cr2				c2%ROWTYPE;
"
"
"
"      v_result				VARCHAR2(1) := 'N';
"
"      v_exp_flag			VARCHAR2(1) := 'N';
"
"      v_status				VARCHAR2(1) := 'N';
"
"
"
"   BEGIN
"
"
"
"      OPEN c1;
"
"      FETCH c1 INTO cr1;
"
"
"
"         IF c1%FOUND THEN
"
"
"
"            EXECUTE IMMEDIATE 'DROP TABLE TEMP_EMP_MEDICLAIM_MIG_LN';
"
"
"
"         END IF;
"
"
"
"      CLOSE c1;
"
"
"
"      DELETE
"
"        FROM emp_mediclaim_mig_ln
"
"       WHERE emmln_bu      = p_bu
"
"         AND emmln_plcy_no = p_plcy_no;
"
"
"
"      EXECUTE IMMEDIATE 'CREATE TABLE temp_emp_mediclaim_mig_ln(temmln_emp_id			VARCHAR2(500),
"
"                                                                temmln_plcy_hldr_reln   	VARCHAR2(500),
"
"                                                                temmln_plcy_hldr_dob    	VARCHAR2(500),
"
"                                                                temmln_plcy_hldr_age    	VARCHAR2(500),
"
"                                                                temmln_plcy_hldr_gender 	VARCHAR2(500),
"
"                                                                temmln_plcy_hldr_insur_amt    	VARCHAR2(500),
"
"                                                                temmln_plcy_hldr_depnt_tot    	VARCHAR2(500),
"
"                                                                temmln_plcy_hldr_eff_date    	VARCHAR2(500),
"
"                                                                temmln_plcy_hldr_prorate_days  	VARCHAR2(500),
"
"                                                                temmln_plcy_hldr_prorate_prem  	VARCHAR2(500),
"
"                                                                temmln_plcy_hldr_serv_tax  	VARCHAR2(500))
"
"     ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"     DEFAULT DIRECTORY '||p_dir||'
"
"     ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"     SKIP 1
"
"     FIELDS TERMINATED BY ''|''
"
"     MISSING FIELD VALUES ARE NULL
"
"     REJECT ROWS WITH ALL NULL FIELDS
"
"                                                               (temmln_emp_id			CHAR(255),
"
"                                                                temmln_plcy_hldr_reln   	CHAR(255),
"
"                                                                temmln_plcy_hldr_dob    	CHAR(255),
"
"                                                                temmln_plcy_hldr_age    	CHAR(255),
"
"                                                                temmln_plcy_hldr_gender 	CHAR(255),
"
"                                                                temmln_plcy_hldr_insur_amt    	CHAR(255),
"
"                                                                temmln_plcy_hldr_depnt_tot    	CHAR(255),
"
"                                                                temmln_plcy_hldr_eff_date    	CHAR(255),
"
"                                                                temmln_plcy_hldr_prorate_days  	CHAR(255),
"
"                                                                temmln_plcy_hldr_prorate_prem  	CHAR(255),
"
"                                                                temmln_plcy_hldr_serv_tax  	CHAR(255)))
"
"     LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"     EXECUTE IMMEDIATE 'INSERT INTO emp_mediclaim_mig_ln(emmln_bu,
"
"                                                         emmln_plcy_no,
"
"                                                         emmln_seq_no,
"
"                                                         emmln_emp_id,
"
"                                                         emmln_plcy_hldr_reltn,
"
"                                                         emmln_plcy_hldr_dob,
"
"                                                         emmln_plcy_hldr_age,
"
"                                                         emmln_plcy_hldr_gender,
"
"                                                         emmln_plcy_hldr_insur_amt,
"
"                                                         emmln_plcy_hldr_depnd_tot,
"
"                                                         emmln_plcy_hldr_eff_date,
"
"                                                         emmln_plcy_hldr_prorate_days,
"
"                                                         emmln_plcy_hldr_prorate_prem,
"
"                                                         emmln_plcy_hldr_serv_tax,
"
"                                                         emmln_excep_flag,
"
"                                                         emmln_ref,
"
"                                                         emmln_cre_by,
"
"                                                         emmln_cre_date)
"
"							(SELECT '|| CHR(39) || p_bu      || CHR(39) ||','
"
"                                                                 || CHR(39) || p_plcy_no || CHR(39) ||',
"
"                                                                 ROWNUM,
"
"                                                                 temmln_emp_id,
"
"                                                                 ''E'',
"
"                                                                 emp_dob,
"
"                                                                 DECODE(SIGN(sysdate - emp_dob),1,ROUND((sysdate - emp_dob)/365),''''),
"
"                                                                 emp_gender,
"
"                                                                 temmln_plcy_hldr_insur_amt,
"
"                                                                 temmln_plcy_hldr_depnt_tot,
"
"                                                                 temmln_plcy_hldr_eff_date,
"
"                                                                 temmln_plcy_hldr_prorate_days,
"
"                                                                 temmln_plcy_hldr_prorate_prem,
"
"                                                                 temmln_plcy_hldr_serv_tax,'
"
"								 || CHR(39) || v_exp_flag || CHR(39) ||',
"
"								 NULL,'
"
"								 || CHR(39) || p_user || CHR(39) ||',
"
"								 SYSDATE
"
"							    FROM temp_emp_mediclaim_mig_ln,employees
"
"							   WHERE emp_bu     = p_bu
"
"							     AND emp_emp_id = temmln_emp_id)';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE temp_emp_mediclaim_mig_ln';
"
"
"
"      UPDATE emp_mediclaim_mig_ln
"
"         SET emmln_emp_id                   = TRIM(emmln_emp_id),
"
"             emmln_plcy_hldr_reltn          = TRIM(emmln_plcy_hldr_reltn),
"
"             emmln_plcy_hldr_dob            = TRIM(emmln_plcy_hldr_dob),
"
"             emmln_plcy_hldr_age            = TRIM(emmln_plcy_hldr_age),
"
"             emmln_plcy_hldr_gender         = TRIM(emmln_plcy_hldr_gender),
"
"             emmln_plcy_hldr_insur_amt      = TRIM(emmln_plcy_hldr_insur_amt),
"
"             emmln_plcy_hldr_depnd_tot      = TRIM(emmln_plcy_hldr_depnd_tot),
"
"             emmln_plcy_hldr_eff_date       = TRIM(emmln_plcy_hldr_eff_date),
"
"             emmln_plcy_hldr_prorate_days   = TRIM(emmln_plcy_hldr_prorate_days),
"
"             emmln_plcy_hldr_prorate_prem   = TRIM(emmln_plcy_hldr_prorate_prem),
"
"             emmln_plcy_hldr_serv_tax       = TRIM(emmln_plcy_hldr_serv_tax)
"
"       WHERE emmln_bu      = p_bu
"
"         AND emmln_plcy_no = p_plcy_no;
"
"
"
"
"
"      UPDATE emp_mediclaim_mig_ln
"
"         SET emmln_emp_id                   = UPPER(emmln_emp_id),
"
"             emmln_plcy_hldr_reltn          = UPPER(emmln_plcy_hldr_reltn),
"
"             emmln_plcy_hldr_dob            = UPPER(emmln_plcy_hldr_dob),
"
"             emmln_plcy_hldr_age            = UPPER(emmln_plcy_hldr_age),
"
"             emmln_plcy_hldr_gender         = UPPER(emmln_plcy_hldr_gender),
"
"             emmln_plcy_hldr_insur_amt      = UPPER(emmln_plcy_hldr_insur_amt),
"
"             emmln_plcy_hldr_depnd_tot      = UPPER(emmln_plcy_hldr_depnd_tot),
"
"             emmln_plcy_hldr_eff_date       = UPPER(emmln_plcy_hldr_eff_date),
"
"             emmln_plcy_hldr_prorate_days   = UPPER(emmln_plcy_hldr_prorate_days),
"
"             emmln_plcy_hldr_prorate_prem   = UPPER(emmln_plcy_hldr_prorate_prem),
"
"             emmln_plcy_hldr_serv_tax       = UPPER(emmln_plcy_hldr_serv_tax)
"
"       WHERE emmln_bu      = p_bu
"
"         AND emmln_plcy_no = p_plcy_no;
"
"
"
"      OPEN c2;
"
"      FETCH c2 INTO cr2;
"
"
"
"         IF cr2.v_cnt = 0 THEN
"
"            v_result := 'N';
"
"         ELSE
"
"            v_result := 'Y';
"
"         END IF;
"
"
"
"      CLOSE c2;
"
"
"
"      p_res := v_result;
"
"
"
"   END proc_upload_emp_mediclaim_mig;
"
"
"
"
"
"  PROCEDURE proc_emp_mediclaim_mig_excep(p_bu                          VARCHAR2,
"
"                                         p_plcy_no                     VARCHAR2,
"
"                                         p_user                        VARCHAR2,
"
"                                         p_res         OUT             VARCHAR2)
"
"
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM emp_mediclaim_mig_hd
"
"    WHERE emmhd_bu      = p_bu
"
"      AND emmhd_plcy_no = p_plcy_no
"
"      AND emmhd_status  IN ('N');
"
"
"
"      cr1				c1%ROWTYPE;
"
"
"
"   CURSOR c2
"
"       IS
"
"   SELECT *
"
"     FROM emp_mediclaim_mig_ln
"
"    WHERE emmln_bu      = p_bu
"
"      AND emmln_plcy_no = p_plcy_no;
"
"
"
"      cr2				c2%ROWTYPE;
"
"
"
"   CURSOR c3(c_emp_id			VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM employees,
"
"          emp_active_infos
"
"    WHERE emp_bu     = empai_bu
"
"      AND emp_emp_id = empai_emp_id
"
"      AND emp_bu     = p_bu
"
"      AND emp_emp_id = c_emp_id
"
"      AND emp_status = 'A'
"
"      AND emp_include_payroll = 'Y';
"
"
"
"      cr3				c3%ROWTYPE;
"
"
"
"   CURSOR c4(c_emp_id			VARCHAR2)
"
"       IS
"
"   SELECT emmln_emp_id,
"
"          COUNT(*) emmln_cnt
"
"     FROM emp_mediclaim_mig_ln
"
"    WHERE emmln_bu       = p_bu
"
"      AND emmln_plcy_no  = p_plcy_no
"
"      AND emmln_emp_id   = c_emp_id
"
"    GROUP BY emmln_emp_id
"
"   HAVING COUNT(*) > 1;
"
"
"
"      cr4				c4%ROWTYPE;
"
"
"
"   CURSOR c5
"
"       IS
"
"   SELECT *
"
"     FROM hrm_medi_claim_hd
"
"    WHERE hmchd_bu      = p_bu
"
"      AND hmchd_plcy_no = p_plcy_no;
"
"
"
"      cr5				c5%ROWTYPE;
"
"
"
"      v_excep				VARCHAR2(4000);
"
"      v_res				VARCHAR2(1) := 'N';
"
"
"
"   BEGIN
"
"
"
"      OPEN c1;
"
"      FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'HRM'||p_bu||'~'||p_plcy_no);
"
"         ELSE
"
"
"
"            UPDATE emp_mediclaim_mig_ln
"
"               SET emmln_excep_flag = 'N',
"
"                   emmln_ref        = NULL,
"
"                   emmln_upd_by	    = p_user,
"
"                   emmln_upd_date   = SYSDATE
"
"             WHERE emmln_bu = p_bu
"
"               AND emmln_plcy_no = p_plcy_no;
"
"
"
"            v_res := 'N';
"
"
"
"            FOR cr2 IN c2
"
"            LOOP
"
"
"
"	       v_excep := NULL;
"
"
"
"               /*--- Employee ID Checking ---*/
"
"
"
"               IF cr2.emmln_emp_id IS NULL THEN
"
"                  v_excep := v_excep||' EMPLOYEE SHOULD NOT BE NULL.';
"
"               END IF;
"
"
"
"               IF cr2.emmln_emp_id IS NOT NULL THEN
"
"
"
"                  OPEN c3(cr2.emmln_emp_id);
"
"                  FETCH c3 INTO cr3;
"
"
"
"                     IF c3%NOTFOUND THEN
"
"                        v_excep := v_excep||' EMPLOYEE NOT FOUND.';
"
"                     END IF;
"
"
"
"                     IF cr3.emp_esi_elgbl_flag = 'Y' THEN
"
"                        v_excep := v_excep||' EMPLOYEE HAVING ESI ELIGIBLE. MEDICLAIM NOT ALLOWED.';
"
"                     END IF;
"
"
"
"                 CLOSE c3;
"
"
"
"               END IF;
"
"
"
"               /*--- Effective Date Checking ---*/
"
"
"
"               IF cr2.emmln_plcy_hldr_eff_date IS NULL THEN
"
"                  v_excep := v_excep||' EFF.DATE SHOULD NOT BE NULL.';
"
"               END IF;
"
"
"
"               IF cr2.emmln_plcy_hldr_eff_date IS NOT NULL THEN
"
"
"
"                  OPEN c5;
"
"                  FETCH c5 INTO cr5;
"
"
"
"                     IF TRUNC(cr2.emmln_plcy_hldr_eff_date) < TRUNC(cr5.hmchd_plcy_start_date) THEN
"
"                        v_excep := v_excep||' EFF.DATE SHOULD BE GREATER THAN POLICY START DATE.';
"
"                     END IF;
"
"
"
"                     IF TRUNC(cr2.emmln_plcy_hldr_eff_date) > TRUNC(cr5.hmchd_plcy_end_date) THEN
"
"                        v_excep := v_excep||' EFF.DATE SHOULD BE LESSER THAN POLICY END DATE.';
"
"                     END IF;
"
"                 CLOSE c5;
"
"
"
"               END IF;
"
"
"
"               /*--- Insurance Amount Checking ---*/
"
"
"
"               IF cr2.emmln_plcy_hldr_insur_amt IS NULL THEN
"
"                  v_excep := v_excep||' INSURANCE AMOUNT SHOULD NOT BE NULL.';
"
"               END IF;
"
"
"
"               IF cr2.emmln_plcy_hldr_insur_amt = 0 THEN
"
"                  v_excep := v_excep||' INSURANCE AMOUNT SHOULD NOT BE ZERO.';
"
"               END IF;
"
"
"
"               IF cr2.emmln_plcy_hldr_insur_amt < 0 THEN
"
"                  v_excep := v_excep||' INSURANCE AMOUNT SHOULD NOT BE NEGATIVE.';
"
"               END IF;
"
"
"
"               /*--- Dependent Total Checking ---*/
"
"
"
"               IF cr2.emmln_plcy_hldr_depnd_tot IS NULL THEN
"
"                  v_excep := v_excep||' DEPENDENT TOTAL SHOULD NOT BE NULL.';
"
"               END IF;
"
"
"
"               IF cr2.emmln_plcy_hldr_depnd_tot < 0 THEN
"
"                  v_excep := v_excep||' DEPENDENT TOTAL SHOULD NOT BE NEGATIVE.';
"
"               END IF;
"
"
"
"               /*--- Prorate Days Checking ---*/
"
"
"
"               IF cr2.emmln_plcy_hldr_prorate_days IS NULL THEN
"
"                  v_excep := v_excep||' PRORATA DAYS SHOULD NOT BE NULL.';
"
"               END IF;
"
"
"
"               IF cr2.emmln_plcy_hldr_prorate_days = 0 THEN
"
"                  v_excep := v_excep||' PRORATA DAYS SHOULD NOT BE ZERO.';
"
"               END IF;
"
"
"
"	       IF cr2.emmln_plcy_hldr_prorate_days < 0 THEN
"
"                  v_excep := v_excep||' PRORATA DAYS SHOULD NOT BE NEGATIVE.';
"
"               END IF;
"
"
"
"               /*--- Prorata Premium Checking ---*/
"
"
"
"               IF cr2.emmln_plcy_hldr_prorate_prem IS NULL THEN
"
"                  v_excep := v_excep||' PRORATA PREMIUM SHOULD NOT BE NULL.';
"
"               END IF;
"
"
"
"               IF cr2.emmln_plcy_hldr_prorate_prem = 0 THEN
"
"                  v_excep := v_excep||' PRORATA PREMIUM SHOULD NOT BE ZERO.';
"
"               END IF;
"
"
"
"               IF cr2.emmln_plcy_hldr_prorate_prem < 0 THEN
"
"                  v_excep := v_excep||' PRORATA PREMIUM SHOULD NOT BE NEGATIVE.';
"
"               END IF;
"
"
"
"               /*--- Prorata Service Tax Checking ---*/
"
"
"
"               IF cr2.emmln_plcy_hldr_serv_tax IS NULL THEN
"
"                  v_excep := v_excep||' PRORATA SERVICE TAX SHOULD NOT BE NULL.';
"
"               END IF;
"
"
"
"               IF cr2.emmln_plcy_hldr_serv_tax = 0 THEN
"
"                  v_excep := v_excep||' PRORATA SERVICE TAX SHOULD NOT BE ZERO.';
"
"               END IF;
"
"
"
"               IF cr2.emmln_plcy_hldr_serv_tax < 0 THEN
"
"                  v_excep := v_excep||' PRORATA SERVICE TAX SHOULD NOT BE NEGATIVE.';
"
"               END IF;
"
"
"
"
"
"               IF v_excep IS NOT NULL THEN
"
"
"
"                  UPDATE emp_mediclaim_mig_ln
"
"                     SET emmln_excep_flag = 'Y',
"
"                         emmln_ref        = v_excep,
"
"                         emmln_upd_by	  = p_user,
"
"                         emmln_upd_date   = SYSDATE
"
"                   WHERE emmln_bu      = p_bu
"
"                     AND emmln_plcy_no = p_plcy_no
"
"                     AND emmln_seq_no  = cr2.emmln_seq_no;
"
"
"
"	          v_res := 'Y';
"
"
"
"	       END IF;
"
"
"
"            END LOOP c2;
"
"
"
"         END IF;
"
"
"
"      CLOSE c1;
"
"
"
"      p_res := v_res;
"
"
"
"   END proc_emp_mediclaim_mig_excep;
"
"
"
"
"
"  PROCEDURE proc_post_emp_mediclaim_mig(p_bu                           VARCHAR2,
"
"                                        p_plcy_no                      VARCHAR2,
"
"                                        p_user                         VARCHAR2,
"
"                                        p_res          OUT             VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM emp_mediclaim_mig_hd
"
"    WHERE emmhd_bu      = p_bu
"
"      AND emmhd_plcy_no = p_plcy_no
"
"      AND emmhd_status  IN ('N');
"
"
"
"      cr1				c1%ROWTYPE;
"
"
"
"   CURSOR c2
"
"       IS
"
"   SELECT *
"
"     FROM emp_mediclaim_mig_ln
"
"    WHERE emmln_bu      = p_bu
"
"      AND emmln_plcy_no = p_plcy_no
"
"    GROUP BY emmln_emp_id;
"
"
"
"      cr2				c2%ROWTYPE;
"
"
"
"      v_res				VARCHAR2(1) := 'N';
"
"      v_excep_res			VARCHAR2(1) := 'N';
"
"
"
"   BEGIN
"
"
"
"      OPEN c1;
"
"      FETCH c1 INTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'HRM'||p_bu||'~'||p_plcy_no);
"
"         ELSE
"
"
"
"            v_res := 'N';
"
"
"
"            proc_emp_mediclaim_mig_excep(p_bu,
"
"   				     p_plcy_no,
"
"   				     p_user,
"
"   				     v_excep_res);
"
"
"
"	    IF v_excep_res = 'N' THEN
"
"
"
"	       FOR cr2 IN c2
"
"	       LOOP
"
"
"
"	             INSERT INTO hrm_medi_claim_ln(hmcln_bu,
"
"                                                   hmcln_plcy_no,
"
"                                                   hmcln_emp_id,
"
"                                                   hmcln_seq_no,
"
"                                                   hmcln_plcy_hldr_reltn,
"
"                                                   hmcln_plcy_hldr_dob,
"
"                                                   hmcln_plcy_hldr_age,
"
"                                                   hmcln_plcy_hldr_gender,
"
"                                                   hmcln_plcy_hldr_insur_amt,
"
"                                                   hmcln_plcy_hldr_claim_amt,
"
"                                                   hmcln_plcy_hldr_balance_amt,
"
"                                                   hmcln_plcy_hldr_depnd_tot,
"
"                                                   hmcln_plcy_hldr_eff_date,
"
"                                                   hmcln_plcy_hldr_prorate_days,
"
"                                                   hmcln_plcy_hldr_prorate_prem,
"
"                                                   hmcln_plcy_hldr_serv_tax,
"
"                                                   hmcln_plcy_hldr_tot_prem,
"
"                                                   hmcln_cre_by,
"
"                                                   hmcln_cre_date)
"
"					    VALUES(p_bu                             ,           --hmcln_bu
"
"					           p_plcy_no                        ,           --hmcln_plcy_no
"
"                                                   cr2.emmln_emp_id                 ,           --hmcln_emp_id
"
"                                                   cr2.emmln_seq_no                 ,           --hmcln_seq_no
"
"                                                   cr2.emmln_plcy_hldr_reltn        ,           --hmcln_plcy_hldr_reltn
"
"                                                   cr2.emmln_plcy_hldr_dob          ,           --hmcln_plcy_hldr_dob
"
"                                                   cr2.emmln_plcy_hldr_age          ,           --hmcln_plcy_hldr_age
"
"                                                   cr2.emmln_plcy_hldr_gender       ,           --hmcln_plcy_hldr_gender
"
"                                                   cr2.emmln_plcy_hldr_insur_amt    ,           --hmcln_plcy_hldr_insur_amt
"
"                                                   0                                ,           --hmcln_plcy_hldr_claim_amt
"
"                                                   cr2.emmln_plcy_hldr_insur_amt    ,           --hmcln_plcy_hldr_balance_amt
"
"                                                   cr2.emmln_plcy_hldr_depnd_tot    ,           --hmcln_plcy_hldr_depnd_tot
"
"                                                   cr2.emmln_plcy_hldr_eff_date     ,           --hmcln_plcy_hldr_eff_date
"
"                                                   cr2.emmln_plcy_hldr_prorate_days ,           --hmcln_plcy_hldr_prorate_days
"
"                                                   cr2.emmln_plcy_hldr_prorate_prem ,           --hmcln_plcy_hldr_prorate_prem
"
"                                                   cr2.emmln_plcy_hldr_serv_tax     ,           --hmcln_plcy_hldr_serv_tax
"
"                                                   0                                ,           --hmcln_plcy_hldr_tot_prem
"
"					           p_user	    	            ,		--hmcln_cre_by
"
"			      			   SYSDATE   	    	            );		--hmcln_cre_date
"
"	             v_res := 'Y';
"
"
"
"	       END LOOP c2;
"
"
"
"
"
"	       UPDATE hrm_medi_claim_ln
"
"	          SET hmcln_plcy_hldr_tot_prem  = (NVL(hmcln_plcy_hldr_prorate_prem,0) + NVL(hmcln_plcy_hldr_serv_tax,0))
"
"	        WHERE hmcln_bu      = p_bu
"
"	          AND hmcln_plcy_no = p_plcy_no;
"
"
"
"	       UPDATE emp_mediclaim_mig_hd
"
"	          SET emmhd_status   = 'P',
"
"	              emmhd_upd_by   = p_user,
"
"	              emmhd_upd_date = SYSDATE
"
"	        WHERE emmhd_bu      = p_bu
"
"	          AND emmhd_plcy_no = p_plcy_no
"
"   	          AND emmhd_status  IN ('N');
"
"
"
"	    END IF;
"
"
"
"         END IF;
"
"
"
"      CLOSE c1;
"
"
"
"      p_res := v_res;
"
"
"
"   END proc_post_emp_mediclaim_mig;
"
"
"
"END pack_emp_mediclaim_mig;
"
/
