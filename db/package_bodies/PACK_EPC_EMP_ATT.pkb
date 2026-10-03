CREATE OR REPLACE
"PACKAGE BODY pack_epc_emp_att
"
"AS
"
"   PROCEDURE proc_load_prj_emp(p_bu			VARCHAR2,
"
"   			       p_plnt					VARCHAR2,
"
"   			       p_doc_no					VARCHAR2,
"
"   			       p_user					VARCHAR2,
"
"   			       p_res			OUT		VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM epc_monthly_prj_time_card_hd
"
"    WHERE emptch_bu     = p_bu
"
"      AND emptch_plnt   = p_plnt
"
"      AND emptch_doc_no = p_doc_no;
"
"
"
"      cr1					c1%ROWTYPE;
"
"
"
"   CURSOR c2(c_proj_id				VARCHAR2,
"
"             c_date_from			DATE,
"
"             c_date_to				DATE)
"
"       IS
"
"   SELECT eemddv_emp_id
"
"     FROM epc_emp_mob_demob_dtl_vw
"
"    WHERE eemddv_bu      = p_bu
"
"      AND eemddv_plnt    = p_plnt
"
"      AND eemddv_proj_id = c_proj_id
"
"      AND (TRUNC(eemddv_demob_date) BETWEEN c_date_from AND c_date_to
"
"       OR ((TRUNC(eemddv_demob_date) IS NULL OR TRUNC(eemddv_demob_date) > c_date_to) AND TRUNC(eemddv_depl_date) <= c_date_to))
"
"    GROUP BY eemddv_emp_id
"
"    ORDER BY eemddv_emp_id;
"
"
"
"   CURSOR c3
"
"       IS
"
"   SELECT emptcl_seq_no,
"
"          emptcl_emp_id
"
"     FROM epc_monthly_prj_time_card_ln
"
"    WHERE emptcl_bu     = p_bu
"
"      AND emptcl_plnt   = p_plnt
"
"      AND emptcl_doc_no = p_doc_no
"
"    ORDER BY emptcl_seq_no;
"
"
"
"   CURSOR c4(c_proj_id				VARCHAR2,
"
"             c_date_from			DATE,
"
"             c_date_to				DATE,
"
"             c_emp_id				VARCHAR2,
"
"             c_date				DATE)
"
"       IS
"
"   SELECT eemddv_emp_id,
"
"          eemddv_depl_date,
"
"          eemddv_demob_date
"
"     FROM (SELECT eemddv_emp_id,
"
"		  CASE WHEN TRUNC(eemddv_depl_date) <= c_date_from THEN
"
"		       c_date_from
"
"		  ELSE
"
"		       TRUNC(eemddv_depl_date)
"
"		  END eemddv_depl_date,
"
"	          CASE WHEN (TRUNC(eemddv_demob_date) >= c_date_to OR TRUNC(eemddv_demob_date) IS NULL) THEN
"
"		       c_date_to
"
"	          ELSE
"
"		       TRUNC(eemddv_demob_date)
"
"	          END eemddv_demob_date
"
"	     FROM epc_emp_mob_demob_dtl_vw
"
"	    WHERE eemddv_bu      = p_bu
"
"	      AND eemddv_plnt    = p_plnt
"
"	      AND eemddv_proj_id = c_proj_id
"
"	      AND (TRUNC(eemddv_demob_date) BETWEEN c_date_from AND c_date_to
"
"	       OR ((TRUNC(eemddv_demob_date) IS NULL OR TRUNC(eemddv_demob_date) > c_date_to) AND TRUNC(eemddv_depl_date) <= c_date_to)))
"
"    WHERE eemddv_emp_id = c_emp_id
"
"      AND c_date BETWEEN eemddv_depl_date AND eemddv_demob_date;
"
"
"
"      cr4					c4%ROWTYPE;
"
"
"
"   CURSOR c5(c_proj_id				VARCHAR2)
"
"       IS
"
"   SELECT prj_wrkg_hrs
"
"     FROM projects
"
"    WHERE prj_bu      = p_bu
"
"      AND prj_plnt    = p_plnt
"
"      AND prj_proj_id = c_proj_id;
"
"
"
"      cr5					c5%ROWTYPE;
"
"
"
"      v_seq_no					NUMBER(5) := 1;
"
"      v_tot_days				NUMBER(5) := 0;
"
"      v_date					DATE;
"
"      v_avail_flag 				VARCHAR2(1)  := 'N';
"
"      v_att_log					VARCHAR2(1)  := 'N';
"
"      v_prj_wrk_hrs				NUMBER(7, 2) := 0;
"
"      v_emp_wrk_hrs				NUMBER(7, 2) := 0;
"
"      v_ip_addr					VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"      v_os_user					VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"      v_os_emp					VARCHAR2(50) := func_find_emp_id(p_bu, p_user);
"
"      v_res					VARCHAR2(1) := 'N';
"
"
"
"   BEGIN
"
"
"
"      OPEN c1;
"
"      FETCH c1 iNTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20072, 'HRM'||'~'||p_bu||'~'||p_plnt||'~'||p_doc_no);
"
"         ELSE
"
"
"
"            DELETE
"
"              FROM epc_monthly_prj_time_card_ln
"
"	     WHERE emptcl_bu     = p_bu
"
"               AND emptcl_plnt   = p_plnt
"
"               AND emptcl_doc_no = p_doc_no;
"
"
"
"            v_tot_days := (TRUNC(cr1.emptch_date_to) - TRUNC(cr1.emptch_date_from)) + 1;
"
"
"
"            OPEN c5(cr1.emptch_proj_id);
"
"            FETCH c5 INTO cr5;
"
"
"
"               IF c5%NOTFOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20651, 'PRJ'||'~'||p_bu||'~'||p_plnt||'~'||cr1.emptch_proj_id);
"
"               ELSE
"
"                  v_prj_wrk_hrs := NVL(cr5.prj_wrkg_hrs, 0);
"
"               END IF;
"
"
"
"            CLOSE c5;
"
"
"
"            v_res := 'N';
"
"            v_seq_no := 1;
"
"
"
"            FOR cr2 IN c2(cr1.emptch_proj_id, TRUNC(cr1.emptch_date_from), TRUNC(cr1.emptch_date_to))
"
"            LOOP
"
"
"
"               INSERT INTO epc_monthly_prj_time_card_ln(emptcl_bu	  ,
"
"							emptcl_plnt	  ,
"
"							emptcl_doc_no	  ,
"
"							emptcl_seq_no	  ,
"
"							emptcl_emp_id	  ,
"
"							emptcl_status	  ,
"
"							emptcl_cre_by	  ,
"
"							emptcl_cre_ip_addr,
"
"							emptcl_cre_os_user,
"
"							emptcl_cre_emp_id ,
"
"							emptcl_cre_date   )
"
"					         VALUES(p_bu		  ,			--emptclbu
"
"					         	p_plnt		  ,			--emptclplnt
"
"					         	p_doc_no	  ,			--emptcldoc_no
"
"					         	v_seq_no	  ,			--emptclseq_no
"
"					         	cr2.eemddv_emp_id ,			--emptclemp_id
"
"					         	'N'		  ,			--emptclstatus
"
"					         	p_user		  ,			--emptclcre_by
"
"					         	v_ip_addr	  ,			--emptclcre_ip_addr
"
"					         	v_os_user	  ,			--emptclcre_os_user
"
"					         	v_os_emp	  ,			--emptclcre_emp_id
"
"					         	SYSDATE		  );			--emptclcre_date
"
"
"
"               v_seq_no:= v_seq_no + 1;
"
"               v_res   := 'Y';
"
"
"
"            END LOOP c2;
"
"
"
"            FOR cr3 IN c3
"
"            LOOP
"
"
"
"               v_date := TRUNC(cr1.emptch_date_from);
"
"
"
"               FOR i IN 1..v_tot_days
"
"               LOOP
"
"
"
"                  OPEN c4(cr1.emptch_proj_id, TRUNC(cr1.emptch_date_from), TRUNC(cr1.emptch_date_to), cr3.emptcl_emp_id, v_date);
"
"                  FETCH c4 INTO cr4;
"
"
"
"                     IF c4%FOUND THEN
"
"                        v_avail_flag  := 'Y';
"
"                        v_att_log     := 'P';
"
"                        v_emp_wrk_hrs := v_prj_wrk_hrs;
"
"                     ELSE
"
"                        v_avail_flag  := 'N';
"
"                        v_att_log     := 'N';
"
"                        v_emp_wrk_hrs := 0;
"
"                     END IF;
"
"
"
"                  CLOSE c4;
"
"
"
"                  UPDATE epc_monthly_prj_time_card_ln
"
"                     SET emptcl_avail_flag_1   = DECODE(i, 1, v_avail_flag, emptcl_avail_flag_1),
"
"			 emptcl_att_log_1      = DECODE(i, 1, v_att_log, emptcl_att_log_1),
"
"			 emptcl_wrkd_hrs_1     = DECODE(i, 1, v_emp_wrk_hrs, emptcl_wrkd_hrs_1),
"
"			 emptcl_avail_flag_2   = DECODE(i, 2, v_avail_flag, emptcl_avail_flag_2),
"
"			 emptcl_att_log_2      = DECODE(i, 2, v_att_log, emptcl_att_log_2),
"
"			 emptcl_wrkd_hrs_2     = DECODE(i, 2, v_emp_wrk_hrs, emptcl_wrkd_hrs_2),
"
"			 emptcl_avail_flag_3   = DECODE(i, 3, v_avail_flag, emptcl_avail_flag_3),
"
"			 emptcl_att_log_3      = DECODE(i, 3, v_att_log, emptcl_att_log_3),
"
"			 emptcl_wrkd_hrs_3     = DECODE(i, 3, v_emp_wrk_hrs, emptcl_wrkd_hrs_3),
"
"			 emptcl_avail_flag_4   = DECODE(i, 4, v_avail_flag, emptcl_avail_flag_4),
"
"			 emptcl_att_log_4      = DECODE(i, 4, v_att_log, emptcl_att_log_4),
"
"			 emptcl_wrkd_hrs_4     = DECODE(i, 4, v_emp_wrk_hrs, emptcl_wrkd_hrs_4),
"
"			 emptcl_avail_flag_5   = DECODE(i, 5, v_avail_flag, emptcl_avail_flag_5),
"
"			 emptcl_att_log_5      = DECODE(i, 5, v_att_log, emptcl_att_log_5),
"
"			 emptcl_wrkd_hrs_5     = DECODE(i, 5, v_emp_wrk_hrs, emptcl_wrkd_hrs_5),
"
"			 emptcl_avail_flag_6   = DECODE(i, 6, v_avail_flag, emptcl_avail_flag_6),
"
"			 emptcl_att_log_6      = DECODE(i, 6, v_att_log, emptcl_att_log_6),
"
"			 emptcl_wrkd_hrs_6     = DECODE(i, 6, v_emp_wrk_hrs, emptcl_wrkd_hrs_6),
"
"			 emptcl_avail_flag_7   = DECODE(i, 7, v_avail_flag, emptcl_avail_flag_7),
"
"			 emptcl_att_log_7      = DECODE(i, 7, v_att_log, emptcl_att_log_7),
"
"			 emptcl_wrkd_hrs_7     = DECODE(i, 7, v_emp_wrk_hrs, emptcl_wrkd_hrs_7),
"
"			 emptcl_avail_flag_8   = DECODE(i, 8, v_avail_flag, emptcl_avail_flag_8),
"
"			 emptcl_att_log_8      = DECODE(i, 8, v_att_log, emptcl_att_log_8),
"
"			 emptcl_wrkd_hrs_8     = DECODE(i, 8, v_emp_wrk_hrs, emptcl_wrkd_hrs_8),
"
"			 emptcl_avail_flag_9   = DECODE(i, 9, v_avail_flag, emptcl_avail_flag_9),
"
"			 emptcl_att_log_9      = DECODE(i, 9, v_att_log, emptcl_att_log_9),
"
"			 emptcl_wrkd_hrs_9     = DECODE(i, 9, v_emp_wrk_hrs, emptcl_wrkd_hrs_9),
"
"			 emptcl_avail_flag_10  = DECODE(i, 10, v_avail_flag, emptcl_avail_flag_10),
"
"			 emptcl_att_log_10     = DECODE(i, 10, v_att_log, emptcl_att_log_10),
"
"			 emptcl_wrkd_hrs_10    = DECODE(i, 10, v_emp_wrk_hrs, emptcl_wrkd_hrs_10),
"
"			 emptcl_avail_flag_11  = DECODE(i, 11, v_avail_flag, emptcl_avail_flag_11),
"
"			 emptcl_att_log_11     = DECODE(i, 11, v_att_log, emptcl_att_log_11),
"
"			 emptcl_wrkd_hrs_11    = DECODE(i, 11, v_emp_wrk_hrs, emptcl_wrkd_hrs_11),
"
"			 emptcl_avail_flag_12  = DECODE(i, 12, v_avail_flag, emptcl_avail_flag_12),
"
"			 emptcl_att_log_12     = DECODE(i, 12, v_att_log, emptcl_att_log_12),
"
"			 emptcl_wrkd_hrs_12    = DECODE(i, 12, v_emp_wrk_hrs, emptcl_wrkd_hrs_12),
"
"			 emptcl_avail_flag_13  = DECODE(i, 13, v_avail_flag, emptcl_avail_flag_13),
"
"			 emptcl_att_log_13     = DECODE(i, 13, v_att_log, emptcl_att_log_13),
"
"			 emptcl_wrkd_hrs_13    = DECODE(i, 13, v_emp_wrk_hrs, emptcl_wrkd_hrs_13),
"
"			 emptcl_avail_flag_14  = DECODE(i, 14, v_avail_flag, emptcl_avail_flag_14),
"
"			 emptcl_att_log_14     = DECODE(i, 14, v_att_log, emptcl_att_log_14),
"
"			 emptcl_wrkd_hrs_14    = DECODE(i, 14, v_emp_wrk_hrs, emptcl_wrkd_hrs_14),
"
"			 emptcl_avail_flag_15  = DECODE(i, 15, v_avail_flag, emptcl_avail_flag_15),
"
"			 emptcl_att_log_15     = DECODE(i, 15, v_att_log, emptcl_att_log_15),
"
"			 emptcl_wrkd_hrs_15    = DECODE(i, 15, v_emp_wrk_hrs, emptcl_wrkd_hrs_15),
"
"			 emptcl_avail_flag_16  = DECODE(i, 16, v_avail_flag, emptcl_avail_flag_16),
"
"			 emptcl_att_log_16     = DECODE(i, 16, v_att_log, emptcl_att_log_16),
"
"			 emptcl_wrkd_hrs_16    = DECODE(i, 16, v_emp_wrk_hrs, emptcl_wrkd_hrs_16),
"
"			 emptcl_avail_flag_17  = DECODE(i, 17, v_avail_flag, emptcl_avail_flag_17),
"
"			 emptcl_att_log_17     = DECODE(i, 17, v_att_log, emptcl_att_log_17),
"
"			 emptcl_wrkd_hrs_17    = DECODE(i, 17, v_emp_wrk_hrs, emptcl_wrkd_hrs_17),
"
"			 emptcl_avail_flag_18  = DECODE(i, 18, v_avail_flag, emptcl_avail_flag_18),
"
"			 emptcl_att_log_18     = DECODE(i, 18, v_att_log, emptcl_att_log_18),
"
"			 emptcl_wrkd_hrs_18    = DECODE(i, 18, v_emp_wrk_hrs, emptcl_wrkd_hrs_18),
"
"			 emptcl_avail_flag_19  = DECODE(i, 19, v_avail_flag, emptcl_avail_flag_19),
"
"			 emptcl_att_log_19     = DECODE(i, 19, v_att_log, emptcl_att_log_19),
"
"			 emptcl_wrkd_hrs_19    = DECODE(i, 19, v_emp_wrk_hrs, emptcl_wrkd_hrs_19),
"
"			 emptcl_avail_flag_20  = DECODE(i, 20, v_avail_flag, emptcl_avail_flag_20),
"
"			 emptcl_att_log_20     = DECODE(i, 20, v_att_log, emptcl_att_log_20),
"
"			 emptcl_wrkd_hrs_20    = DECODE(i, 20, v_emp_wrk_hrs, emptcl_wrkd_hrs_20),
"
"			 emptcl_avail_flag_21  = DECODE(i, 21, v_avail_flag, emptcl_avail_flag_21),
"
"			 emptcl_att_log_21     = DECODE(i, 21, v_att_log, emptcl_att_log_21),
"
"			 emptcl_wrkd_hrs_21    = DECODE(i, 21, v_emp_wrk_hrs, emptcl_wrkd_hrs_21),
"
"			 emptcl_avail_flag_22  = DECODE(i, 22, v_avail_flag, emptcl_avail_flag_22),
"
"			 emptcl_att_log_22     = DECODE(i, 22, v_att_log, emptcl_att_log_22),
"
"			 emptcl_wrkd_hrs_22    = DECODE(i, 22, v_emp_wrk_hrs, emptcl_wrkd_hrs_22),
"
"			 emptcl_avail_flag_23  = DECODE(i, 23, v_avail_flag, emptcl_avail_flag_23),
"
"			 emptcl_att_log_23     = DECODE(i, 23, v_att_log, emptcl_att_log_23),
"
"			 emptcl_wrkd_hrs_23    = DECODE(i, 23, v_emp_wrk_hrs, emptcl_wrkd_hrs_23),
"
"			 emptcl_avail_flag_24  = DECODE(i, 24, v_avail_flag, emptcl_avail_flag_24),
"
"			 emptcl_att_log_24     = DECODE(i, 24, v_att_log, emptcl_att_log_24),
"
"			 emptcl_wrkd_hrs_24    = DECODE(i, 24, v_emp_wrk_hrs, emptcl_wrkd_hrs_24),
"
"			 emptcl_avail_flag_25  = DECODE(i, 25, v_avail_flag, emptcl_avail_flag_25),
"
"			 emptcl_att_log_25     = DECODE(i, 25, v_att_log, emptcl_att_log_25),
"
"			 emptcl_wrkd_hrs_25    = DECODE(i, 25, v_emp_wrk_hrs, emptcl_wrkd_hrs_25),
"
"			 emptcl_avail_flag_26  = DECODE(i, 26, v_avail_flag, emptcl_avail_flag_26),
"
"			 emptcl_att_log_26     = DECODE(i, 26, v_att_log, emptcl_att_log_26),
"
"			 emptcl_wrkd_hrs_26    = DECODE(i, 26, v_emp_wrk_hrs, emptcl_wrkd_hrs_26),
"
"			 emptcl_avail_flag_27  = DECODE(i, 27, v_avail_flag, emptcl_avail_flag_27),
"
"			 emptcl_att_log_27     = DECODE(i, 27, v_att_log, emptcl_att_log_27),
"
"			 emptcl_wrkd_hrs_27    = DECODE(i, 27, v_emp_wrk_hrs, emptcl_wrkd_hrs_27),
"
"			 emptcl_avail_flag_28  = DECODE(i, 28, v_avail_flag, emptcl_avail_flag_28),
"
"			 emptcl_att_log_28     = DECODE(i, 28, v_att_log, emptcl_att_log_28),
"
"			 emptcl_wrkd_hrs_28    = DECODE(i, 28, v_emp_wrk_hrs, emptcl_wrkd_hrs_28),
"
"			 emptcl_avail_flag_29  = DECODE(i, 29, v_avail_flag, emptcl_avail_flag_29),
"
"			 emptcl_att_log_29     = DECODE(i, 29, v_att_log, emptcl_att_log_29),
"
"			 emptcl_wrkd_hrs_29    = DECODE(i, 29, v_emp_wrk_hrs, emptcl_wrkd_hrs_29),
"
"			 emptcl_avail_flag_30  = DECODE(i, 30, v_avail_flag, emptcl_avail_flag_30),
"
"			 emptcl_att_log_30     = DECODE(i, 30, v_att_log, emptcl_att_log_30),
"
"			 emptcl_wrkd_hrs_30    = DECODE(i, 30, v_emp_wrk_hrs, emptcl_wrkd_hrs_30),
"
"			 emptcl_avail_flag_31  = DECODE(i, 31, v_avail_flag, emptcl_avail_flag_31),
"
"			 emptcl_att_log_31     = DECODE(i, 31, v_att_log, emptcl_att_log_31),
"
"			 emptcl_wrkd_hrs_31    = DECODE(i, 31, v_emp_wrk_hrs, emptcl_wrkd_hrs_31),
"
"			 emptcl_upd_by         = p_user,
"
"			 emptcl_upd_ip_addr    = v_ip_addr,
"
"			 emptcl_upd_os_user    = v_os_user,
"
"			 emptcl_upd_emp_id     = v_os_emp,
"
"			 emptcl_upd_date       = SYSDATE
"
"                   WHERE emptcl_bu     = p_bu
"
"                     AND emptcl_plnt   = p_plnt
"
"                     AND emptcl_doc_no = p_doc_no
"
"                     AND emptcl_seq_no = cr3.emptcl_seq_no;
"
"
"
"                  v_date := v_date + 1;
"
"
"
"               END LOOP i;
"
"
"
"            END LOOP c3;
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
"   END proc_load_prj_emp;
"
"
"
"   PROCEDURE proc_post_prj_att(p_bu					VARCHAR2,
"
"   			       p_plnt					VARCHAR2,
"
"   			       p_doc_no					VARCHAR2,
"
"   			       p_user					VARCHAR2,
"
"   			       p_res			OUT		VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM epc_monthly_prj_time_card_hd
"
"    WHERE emptch_bu     = p_bu
"
"      AND emptch_plnt   = p_plnt
"
"      AND emptch_doc_no = p_doc_no;
"
"
"
"      cr1					c1%ROWTYPE;
"
"
"
"   CURSOR c2(i					NUMBER)
"
"       IS
"
"   SELECT emptcl_seq_no,
"
"          emptcl_emp_id,
"
"          emptcl_att_log,
"
"          emptcl_wrkd_hrs,
"
"          emptcl_ot_hrs
"
"     FROM (SELECT emptcl_seq_no,
"
"	          emptcl_emp_id,
"
"   	          DECODE(i, 1, emptcl_att_log_1,
"
"		            2, emptcl_att_log_2,
"
"		 	    3, emptcl_att_log_3,
"
"			    4, emptcl_att_log_4,
"
"			    5, emptcl_att_log_5,
"
"			    6, emptcl_att_log_6,
"
"			    7, emptcl_att_log_7,
"
"			    8, emptcl_att_log_8,
"
"			    9, emptcl_att_log_9,
"
"			    10, emptcl_att_log_10,
"
"			    11, emptcl_att_log_11,
"
"			    12, emptcl_att_log_12,
"
"			    13, emptcl_att_log_13,
"
"			    14, emptcl_att_log_14,
"
"			    15, emptcl_att_log_15,
"
"			    16, emptcl_att_log_16,
"
"			    17, emptcl_att_log_17,
"
"			    18, emptcl_att_log_18,
"
"			    19, emptcl_att_log_19,
"
"			    20, emptcl_att_log_20,
"
"			    21, emptcl_att_log_21,
"
"			    22, emptcl_att_log_22,
"
"			    23, emptcl_att_log_23,
"
"			    24, emptcl_att_log_24,
"
"			    25, emptcl_att_log_25,
"
"			    26, emptcl_att_log_26,
"
"			    27, emptcl_att_log_27,
"
"			    28, emptcl_att_log_28,
"
"			    29, emptcl_att_log_29,
"
"			    30, emptcl_att_log_30,
"
"			    31, emptcl_att_log_31,
"
"			    'N') emptcl_att_log,
"
"	          DECODE(i, 1, emptcl_wrkd_hrs_1,
"
"			    2, emptcl_wrkd_hrs_2,
"
"			    3, emptcl_wrkd_hrs_3,
"
"			    4, emptcl_wrkd_hrs_4,
"
"			    5, emptcl_wrkd_hrs_5,
"
"			    6, emptcl_wrkd_hrs_6,
"
"			    7, emptcl_wrkd_hrs_7,
"
"			    8, emptcl_wrkd_hrs_8,
"
"			    9, emptcl_wrkd_hrs_9,
"
"			    10, emptcl_wrkd_hrs_10,
"
"			    11, emptcl_wrkd_hrs_11,
"
"			    12, emptcl_wrkd_hrs_12,
"
"			    13, emptcl_wrkd_hrs_13,
"
"			    14, emptcl_wrkd_hrs_14,
"
"			    15, emptcl_wrkd_hrs_15,
"
"			    16, emptcl_wrkd_hrs_16,
"
"			    17, emptcl_wrkd_hrs_17,
"
"			    18, emptcl_wrkd_hrs_18,
"
"			    19, emptcl_wrkd_hrs_19,
"
"			    20, emptcl_wrkd_hrs_20,
"
"			    21, emptcl_wrkd_hrs_21,
"
"			    22, emptcl_wrkd_hrs_22,
"
"			    23, emptcl_wrkd_hrs_23,
"
"			    24, emptcl_wrkd_hrs_24,
"
"			    25, emptcl_wrkd_hrs_25,
"
"			    26, emptcl_wrkd_hrs_26,
"
"			    27, emptcl_wrkd_hrs_27,
"
"			    28, emptcl_wrkd_hrs_28,
"
"			    29, emptcl_wrkd_hrs_29,
"
"			    30, emptcl_wrkd_hrs_30,
"
"			    31, emptcl_wrkd_hrs_31,
"
"			    0) emptcl_wrkd_hrs,
"
"	          DECODE(i, 1, emptcl_ot_hrs_1,
"
"		   	    2, emptcl_ot_hrs_2,
"
"			    3, emptcl_ot_hrs_3,
"
"			    4, emptcl_ot_hrs_4,
"
"			    5, emptcl_ot_hrs_5,
"
"			    6, emptcl_ot_hrs_6,
"
"			    7, emptcl_ot_hrs_7,
"
"			    8, emptcl_ot_hrs_8,
"
"			    9, emptcl_ot_hrs_9,
"
"			    10, emptcl_ot_hrs_10,
"
"			    11, emptcl_ot_hrs_11,
"
"			    12, emptcl_ot_hrs_12,
"
"			    13, emptcl_ot_hrs_13,
"
"			    14, emptcl_ot_hrs_14,
"
"			    15, emptcl_ot_hrs_15,
"
"			    16, emptcl_ot_hrs_16,
"
"			    17, emptcl_ot_hrs_17,
"
"			    18, emptcl_ot_hrs_18,
"
"			    19, emptcl_ot_hrs_19,
"
"			    20, emptcl_ot_hrs_20,
"
"			    21, emptcl_ot_hrs_21,
"
"			    22, emptcl_ot_hrs_22,
"
"			    23, emptcl_ot_hrs_23,
"
"			    24, emptcl_ot_hrs_24,
"
"			    25, emptcl_ot_hrs_25,
"
"			    26, emptcl_ot_hrs_26,
"
"			    27, emptcl_ot_hrs_27,
"
"			    28, emptcl_ot_hrs_28,
"
"			    29, emptcl_ot_hrs_29,
"
"			    30, emptcl_ot_hrs_30,
"
"			    31, emptcl_ot_hrs_31,
"
"			    0) emptcl_ot_hrs
"
"	     FROM epc_monthly_prj_time_card_ln
"
"	    WHERE emptcl_bu     = p_bu
"
"	      AND emptcl_plnt   = p_plnt
"
"	      AND emptcl_doc_no = p_doc_no)
"
"    WHERE emptcl_att_log <> 'N'
"
"    ORDER BY emptcl_seq_no;
"
"
"
"   CURSOR c3(c_proj_id				VARCHAR2)
"
"       IS
"
"   SELECT prj_wrkg_hrs
"
"     FROM projects
"
"    WHERE prj_bu      = p_bu
"
"      AND prj_plnt    = p_plnt
"
"      AND prj_proj_id = c_proj_id;
"
"
"
"      cr3					c3%ROWTYPE;
"
"
"
"      v_tot_days				NUMBER(5) := 0;
"
"      v_date					DATE;
"
"      v_doc_no					VARCHAR2(15);
"
"      v_seq_no					NUMBER(5);
"
"      v_ip_addr					VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;
"
"      v_os_user					VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;
"
"      v_os_emp					VARCHAR2(50) := func_find_emp_id(p_bu, p_user);
"
"      v_prj_wrk_hrs				NUMBER(7, 2) := 0;
"
"      v_res					VARCHAR2(1)  := 'N';
"
"
"
"   BEGIN
"
"      OPEN c1;
"
"      FETCH c1 iNTO cr1;
"
"
"
"         IF c1%NOTFOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20072, 'HRM'||'~'||p_bu||'~'||p_plnt||'~'||p_doc_no);
"
"         ELSE
"
"
"
"            OPEN c3(cr1.emptch_proj_id);
"
"            FETCH c3 INTO cr3;
"
"
"
"               IF c3%NOTFOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20651, 'PRJ'||'~'||p_bu||'~'||p_plnt||'~'||cr1.emptch_proj_id);
"
"               ELSE
"
"                  v_prj_wrk_hrs := NVL(cr3.prj_wrkg_hrs, 0);
"
"               END IF;
"
"
"
"            CLOSE c3;
"
"
"
"            v_tot_days := (TRUNC(cr1.emptch_date_to) - TRUNC(cr1.emptch_date_from)) + 1;
"
"            v_date := TRUNC(cr1.emptch_date_from);
"
"
"
"            v_res := 'N';
"
"
"
"            FOR i IN 1..v_tot_days
"
"            LOOP
"
"
"
"               SELECT NVL(MAX(TO_NUMBER(eptchd_doc_no)), 1000000000) + 1
"
"	         INTO v_doc_no
"
"	         FROM epc_prj_time_card_hd
"
"	        WHERE eptchd_bu   = p_bu
"
"   		  AND eptchd_plnt = p_plnt;
"
"
"
"               INSERT INTO epc_prj_time_card_hd(eptchd_bu	  ,
"
"						eptchd_plnt	  ,
"
"						eptchd_doc_no	  ,
"
"						eptchd_doc_date	  ,
"
"						eptchd_proj_id	  ,
"
"						eptchd_att_date	  ,
"
"						eptchd_ref	  ,
"
"						eptchd_status	  ,
"
"						eptchd_cre_by	  ,
"
"						eptchd_cre_ip_addr,
"
"						eptchd_cre_os_user,
"
"						eptchd_cre_emp_id ,
"
"						eptchd_cre_date   )
"
"					 VALUES(p_bu		  ,							--eptchd_bu
"
"					        p_plnt		  ,							--eptchd_plnt
"
"					        v_doc_no	  ,							--eptchd_doc_no
"
"					        TRUNC(SYSDATE)	  ,							--eptchd_doc_date
"
"					        cr1.emptch_proj_id,							--eptchd_proj_id
"
"					        v_date		  ,							--eptchd_att_date
"
"					        'ATTENDANCE POST FROM MONTHLY BASIS. DOC. NO. : '||p_doc_no,		--eptchd_ref
"
"					        'P'		  ,							--eptchd_status
"
"					        p_user		  ,							--eptchd_cre_by
"
"					        v_ip_addr	  ,							--eptchd_cre_ip_addr
"
"					        v_os_user	  ,							--eptchd_cre_os_user
"
"					        v_os_emp	  ,							--eptchd_cre_emp_id
"
"					        SYSDATE		  );							--eptchd_cre_date
"
"
"
"               FOR cr2 IN c2(i)
"
"               LOOP
"
"
"
"                  SELECT NVL(MAX(eptcln_seq_no), 0) + 1
"
"                    INTO v_seq_no
"
"                    FROM epc_prj_time_card_ln
"
"                   WHERE eptcln_bu     = p_bu
"
"                     AND eptcln_plnt   = p_plnt
"
"                     AND eptcln_doc_no = v_doc_no;
"
"
"
"                  INSERT INTO epc_prj_time_card_ln(eptcln_bu		,
"
"					           eptcln_plnt		,
"
"					           eptcln_doc_no	,
"
"					           eptcln_seq_no	,
"
"					           eptcln_emp_id	,
"
"					           eptcln_att_log	,
"
"					           eptcln_wrkd_hrs	,
"
"					           eptcln_ot_hrs	,
"
"					           eptcln_prj_wrkd_hrs	,
"
"					           eptcln_cre_by	,
"
"					           eptcln_cre_ip_addr	,
"
"					           eptcln_cre_os_user	,
"
"					           eptcln_cre_emp_id	,
"
"					           eptcln_cre_date	)
"
"					    VALUES(p_bu			,			--eptcln_bu
"
"					           p_plnt		,			--eptcln_plnt
"
"					           v_doc_no		,			--eptcln_doc_no
"
"					           v_seq_no		,			--eptcln_seq_no
"
"					           cr2.emptcl_emp_id	,			--eptcln_emp_id
"
"					           cr2.emptcl_att_log	,			--eptcln_att_log
"
"					           cr2.emptcl_wrkd_hrs	,			--eptcln_wrkd_hrs
"
"					           cr2.emptcl_ot_hrs	,			--eptcln_ot_hrs
"
"					           v_prj_wrk_hrs	,			--eptcln_prj_wrkd_hrs
"
"					           p_user		,			--eptcln_cre_by
"
"					           v_ip_addr		,			--eptcln_cre_ip_addr
"
"					           v_os_user		,			--eptcln_cre_os_user
"
"					           v_os_emp		,			--eptcln_cre_emp_id
"
"					           SYSDATE		);			--eptcln_cre_date
"
"
"
"                  v_res := 'Y';
"
"
"
"               END LOOP c2;
"
"
"
"               v_date := v_date + 1;
"
"
"
"            END LOOP i;
"
"
"
"            UPDATE epc_monthly_prj_time_card_ln
"
"               SET emptcl_status      = 'P',
"
"                   emptcl_upd_by      = p_user,
"
"		   emptcl_upd_ip_addr = v_ip_addr,
"
"		   emptcl_upd_os_user = v_os_user,
"
"		   emptcl_upd_emp_id  = v_os_emp,
"
"		   emptcl_upd_date     = SYSDATE
"
"	     WHERE emptcl_bu     = p_bu
"
"	       AND emptcl_plnt   = p_plnt
"
"	       AND emptcl_doc_no = p_doc_no;
"
"
"
"            UPDATE epc_monthly_prj_time_card_hd
"
"               SET emptch_status      = 'P',
"
"                   emptch_upd_by      = p_user,
"
"		   emptch_upd_ip_addr = v_ip_addr,
"
"		   emptch_upd_os_user = v_os_user,
"
"		   emptch_upd_emp_id  = v_os_emp,
"
"		   emptch_upd_date     = SYSDATE
"
"	     WHERE emptch_bu     = p_bu
"
"	       AND emptch_plnt   = p_plnt
"
"	       AND emptch_doc_no = p_doc_no;
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
"   END proc_post_prj_att;
"
"
"
"END  pack_epc_emp_att;"
/
