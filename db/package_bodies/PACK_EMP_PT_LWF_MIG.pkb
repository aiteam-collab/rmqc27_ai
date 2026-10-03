CREATE OR REPLACE
"PACKAGE BODY pack_emp_pt_lwf_mig
"
"AS
"
"   PROCEDURE proc_upload_emp_pt_lwf_mig(p_bu				VARCHAR2,
"
"   			      		p_type				VARCHAR2,
"
"			      		p_dir				VARCHAR2,
"
"			      		p_file_name			VARCHAR2,
"
"			      		p_user				VARCHAR2,
"
"			      		p_res	     	OUT		VARCHAR2)
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
"    WHERE table_name = 'TEMP_EMP_PT_LWF_EXCEP';
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
"     FROM hrm_emp_pt_lwf_excep
"
"    WHERE heple_bu   = p_bu
"
"      AND heple_type = p_type;
"
"
"
"      cr2				c2%ROWTYPE;
"
"
"
"      v_res				VARCHAR2(1) := 'N';
"
"      v_exp_flag			VARCHAR2(1) := 'N';
"
"      v_status				VARCHAR2(1) := 'N';
"
"
"
"      v_ip_addr				VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;      --added 28-jan-2020 : Ajis
"
"      v_os_user				VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;		--added 28-jan-2020 : Ajis
"
"
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
"            EXECUTE IMMEDIATE 'DROP TABLE TEMP_EMP_PT_LWF_EXCEP';
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
"        FROM hrm_emp_pt_lwf_excep
"
"       WHERE heple_bu  = p_bu
"
"         AND heple_type = p_type;
"
"
"
"      EXECUTE IMMEDIATE 'CREATE TABLE temp_emp_pt_lwf_excep(teple_emp_id		VARCHAR2(500))
"
"		         ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"     					     DEFAULT DIRECTORY '||p_dir||'
"
"     			       ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"     					          SKIP 1
"
"    					          FIELDS TERMINATED BY ''|''
"
"    					          MISSING FIELD VALUES ARE NULL
"
"    					          REJECT ROWS WITH ALL NULL FIELDS
"
"    					    	  (teple_emp_id			CHAR(255)))
"
"  				         LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE 'INSERT INTO hrm_emp_pt_lwf_excep (SELECT '|| CHR(39)||p_bu  ||CHR(39)||','
"
"   							           || CHR(39)||p_type||CHR(39)||',
"
"      							           ROWNUM,
"
"      							           teple_emp_id,
"
"      							           NULL,'
"
"      							           ||CHR(39)||v_exp_flag||CHR(39)||','
"
"      							           ||CHR(39)||p_user||CHR(39)||','
"
"      							           ||CHR(39)||v_ip_addr||CHR(39)||','
"
"      							           ||CHR(39)||v_os_user||CHR(39)||',
"
"      							           SYSDATE,
"
"      							           NULL,
"
"      							           NULL,
"
"      							           NULL,
"
"      							           NULL,
"
"      							           NULL,
"
"      							           NULL
"
"      						              FROM temp_emp_pt_lwf_excep)';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE temp_emp_pt_lwf_excep';
"
"
"
"      UPDATE hrm_emp_pt_lwf_excep
"
"         SET heple_emp_id       = TRIM(heple_emp_id),
"
"             heple_upd_by       = p_user,			--added 28-jan-2020 : Ajis
"
"	     heple_upd_ip_addr  = v_ip_addr,			--added 28-jan-2020 : Ajis
"
"	     heple_upd_os_user  = v_os_user,			--added 28-jan-2020 : Ajis
"
"	     heple_upd_date     = SYSDATE         		--added 28-jan-2020 : Ajis
"
"       WHERE heple_bu   = p_bu
"
"         AND heple_type = p_type;
"
"
"
"      UPDATE hrm_emp_pt_lwf_excep
"
"         SET heple_emp_id       = UPPER(heple_emp_id),
"
"             heple_upd_by       = p_user,			--added 28-jan-2020 : Ajis
"
"	     heple_upd_ip_addr  = v_ip_addr,			--added 28-jan-2020 : Ajis
"
"	     heple_upd_os_user  = v_os_user,			--added 28-jan-2020 : Ajis
"
"	     heple_upd_date     = SYSDATE         		--added 28-jan-2020 : Ajis
"
"       WHERE heple_bu   = p_bu
"
"         AND heple_type = p_type;
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
"            v_res := 'N';
"
"         ELSE
"
"            v_res := 'Y';
"
"         END IF;
"
"
"
"      CLOSE c2;
"
"
"
"      p_res := v_res;
"
"
"
"   END proc_upload_emp_pt_lwf_mig;
"
"
"
"   PROCEDURE proc_chk_emp_pt_lwf_excep(p_bu				VARCHAR2,
"
"   				       p_type				VARCHAR2,
"
"   				       p_user				VARCHAR2,
"
"   				       p_res		OUT		VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM hrm_emp_pt_lwf_excep
"
"    WHERE heple_bu   = p_bu
"
"      AND heple_type = p_type;
"
"
"
"   CURSOR c2(c_emp_id			VARCHAR2)
"
"       IS
"
"   SELECT *
"
"     FROM employees
"
"    WHERE emp_bu              = p_bu
"
"      AND emp_emp_id          = c_emp_id
"
"      AND emp_include_payroll = 'Y'
"
"      AND emp_status          = 'A';
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
"   SELECT COUNT(*)
"
"     FROM hrm_emp_pt_lwf_excep
"
"    WHERE heple_bu     = p_bu
"
"      AND heple_type   = p_type
"
"      AND heple_emp_id = c_emp_id
"
"   HAVING COUNT(*) > 1;
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
"   SELECT *
"
"     FROM hrm_emp_pt_elgbl
"
"    WHERE hepe_bu     = p_bu
"
"      AND hepe_emp_id = c_emp_id
"
"      AND p_type      = 'P'
"
"    UNION
"
"   SELECT *
"
"     FROM hrm_emp_lwf_elgbl
"
"    WHERE hele_bu     = p_bu
"
"      AND hele_emp_id = c_emp_id
"
"      AND p_type      = 'L';
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
"     FROM hrm_emp_pt_lwf_excep
"
"    WHERE heple_bu         = p_bu
"
"      AND heple_type       = p_type
"
"      AND heple_excep_flag = 'Y';
"
"
"
"      cr5				c5%ROWTYPE;
"
"
"
"      v_res				VARCHAR2(1) := 'N';
"
"--      v_os_user				VARCHAR2(50);
"
"--      v_ip_address			VARCHAR2(20);
"
"
"
"      v_ip_addr				VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;      --added 28-jan-2020 : Ajis
"
"      v_os_user				VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;		--added 28-jan-2020 : Ajis
"
"
"
"   BEGIN
"
"
"
"      UPDATE hrm_emp_pt_lwf_excep
"
"         SET heple_excep_flag   = 'N',
"
"             heple_ref	        = NULL,
"
"             heple_upd_by       = p_user,
"
"             heple_upd_ip_addr  = v_ip_addr,		--added 28-jan-2020 : Ajis
"
"	     heple_upd_os_user  = v_os_user,		--added 28-jan-2020 : Ajis
"
"             heple_upd_date   = SYSDATE
"
"       WHERE heple_bu   = p_bu
"
"         AND heple_type = p_type;
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"         OPEN c2(cr1.heple_emp_id);
"
"         FETCH c2 INTO cr2;
"
"
"
"            IF c2%NOTFOUND THEN
"
"
"
"               UPDATE hrm_emp_pt_lwf_excep
"
"                  SET heple_excep_flag   = 'Y',
"
"                      heple_ref	         = heple_ref||' '||'Employee not found. ',
"
"                      heple_upd_by       = p_user,
"
"             	      heple_upd_ip_addr  = v_ip_addr,		--added 28-jan-2020 : Ajis
"
"	              heple_upd_os_user  = v_os_user,		--added 28-jan-2020 : Ajis
"
"                      heple_upd_date     = SYSDATE
"
"                WHERE heple_bu     = p_bu
"
"                  AND heple_type   = p_type
"
"                  AND heple_seq_no = cr1.heple_seq_no;
"
"
"
"            END IF;
"
"
"
"         CLOSE c2;
"
"
"
"         OPEN c3(cr1.heple_emp_id);
"
"         FETCH c3 INTO cr3;
"
"
"
"            IF c3%FOUND THEN
"
"
"
"               UPDATE hrm_emp_pt_lwf_excep
"
"                  SET heple_excep_flag   = 'Y',
"
"                      heple_ref	         = heple_ref||' '||'Duplicate Employee details found. ',
"
"                      heple_upd_by       = p_user,
"
"                      heple_upd_ip_addr  = v_ip_addr,		--added 28-jan-2020 : Ajis
"
"	              heple_upd_os_user  = v_os_user,		--added 28-jan-2020 : Ajis
"
"                      heple_upd_date     = SYSDATE
"
"                WHERE heple_bu     = p_bu
"
"                  AND heple_type   = p_type
"
"                  AND heple_seq_no = cr1.heple_seq_no;
"
"
"
"            END IF;
"
"
"
"         CLOSE c3;
"
"
"
"         OPEN c4(cr1.heple_emp_id);
"
"         FETCH c4 INTO cr4;
"
"
"
"            IF c4%FOUND THEN
"
"
"
"               UPDATE hrm_emp_pt_lwf_excep
"
"                  SET heple_excep_flag   = 'Y',
"
"                      heple_ref	         = heple_ref||' '||'Employee Already linked. ',
"
"                      heple_upd_by       = p_user,
"
"                      heple_upd_ip_addr  = v_ip_addr,		--added 28-jan-2020 : Ajis
"
"	              heple_upd_os_user  = v_os_user,		--added 28-jan-2020 : Ajis
"
"                      heple_upd_date     = SYSDATE
"
"                WHERE heple_bu     = p_bu
"
"                  AND heple_type   = p_type
"
"                  AND heple_seq_no = cr1.heple_seq_no;
"
"
"
"            END IF;
"
"
"
"         CLOSE c4;
"
"
"
"      END LOOP c1;
"
"
"
"      OPEN c5;
"
"      FETCH c5 INTO cr5;
"
"
"
"         IF c5%FOUND THEN
"
"            v_res := 'Y';
"
"         ELSE
"
"            v_res := 'N';
"
"         END IF;
"
"
"
"      CLOSE c5;
"
"
"
"      p_res := v_res;
"
"
"
"   END proc_chk_emp_pt_lwf_excep;
"
"
"
"   PROCEDURE proc_ins_emp_pt_lwf_dtls(p_bu				VARCHAR2,
"
"   				      p_type				VARCHAR2,
"
"   				      p_user				VARCHAR2,
"
"   				      p_res		OUT		VARCHAR2)
"
"   IS
"
"   CURSOR c1
"
"       IS
"
"   SELECT *
"
"     FROM hrm_emp_pt_lwf_excep
"
"    WHERE heple_bu = p_bu
"
"      AND heple_type = p_type;
"
"
"
"      v_res			VARCHAR2(1) := 'N';
"
"
"
"      v_ip_addr			VARCHAR2(50) := AUDIT_INFO.GET_IP_ADDRESS;      --added 28-jan-2020 : Ajis
"
"      v_os_user			VARCHAR2(50) := AUDIT_INFO.GET_OS_USER;		--added 28-jan-2020 : Ajis
"
"
"
"   BEGIN
"
"
"
"--      v_ip_address := audit_info.get_ip_address;
"
"--      v_os_user    := audit_info.get_os_user;
"
"
"
"      IF p_type = 'P' THEN
"
"
"
"         FOR cr1 IN c1
"
"         LOOP
"
"
"
"            INSERT INTO hrm_emp_pt_elgbl(hepe_bu	   ,
"
"                              	         hepe_emp_id	   ,
"
"                              	         hepe_hold_flag	   ,
"
"                              	         hepe_cre_by	   ,
"
"                              	         hepe_cre_date	   ,
"
"                              	         hepe_cre_ip_addr  ,
"
"                              	         hepe_cre_os_user  )
"
"			          VALUES(p_bu		   ,
"
"				         cr1.heple_emp_id  ,
"
"				         'N'		   ,
"
"				         p_user		   ,
"
"				         SYSDATE	   ,
"
"				         v_ip_addr	   ,
"
"				         v_os_user	   );
"
"
"
"            v_res := 'Y';
"
"
"
"         END LOOP c1;
"
"
"
"         IF v_res = 'Y' THEN
"
"
"
"            DELETE hrm_emp_pt_lwf_excep
"
"             WHERE heple_bu   = p_bu
"
"               AND heple_type = p_type;
"
"
"
"         END IF;
"
"
"
"      END IF;
"
"
"
"      IF p_type = 'L' THEN
"
"
"
"         FOR cr1 IN c1
"
"         LOOP
"
"
"
"	    INSERT INTO hrm_emp_lwf_elgbl(hele_bu	  ,
"
"                               		  hele_emp_id	  ,
"
"                               		  hele_hold_flag  ,
"
"                                	  hele_cre_by	  ,
"
"                               		  hele_cre_date	  ,
"
"                              	          hele_cre_ip_addr,
"
"                              	          hele_cre_os_user)
"
"			           VALUES(p_bu		  ,
"
"				          cr1.heple_emp_id,
"
"				     	  'N'		  ,
"
"				          p_user	  ,
"
"				     	  SYSDATE	  ,
"
"				          v_ip_addr	  ,
"
"				          v_os_user	  );
"
"
"
"            v_res := 'Y';
"
"
"
"         END LOOP c1;
"
"
"
"         IF v_res = 'Y' THEN
"
"
"
"            DELETE hrm_emp_pt_lwf_excep
"
"             WHERE heple_bu   = p_bu
"
"               AND heple_type = p_type;
"
"
"
"         END IF;
"
"
"
"      END IF;
"
"
"
"      p_res := v_res;
"
"
"
"   END proc_ins_emp_pt_lwf_dtls;
"
"
"
"END;"
/
