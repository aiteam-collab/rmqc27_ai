CREATE OR REPLACE
"PACKAGE BODY pkg_upload_assembly
"
"IS
"
"
"
"	PROCEDURE proc_upload_asmbly_drwg (
"
"	   p_bu              VARCHAR2,
"
"	   p_plnt            VARCHAR2,
"
"	   p_doc_no	     VARCHAR2,
"
"	   p_dir             VARCHAR2,
"
"	   p_file_name       VARCHAR2,
"
"	   p_user            VARCHAR2,
"
"	   p_variant     OUT VARCHAR2)
"
"	IS
"
"	   v_create_tab   VARCHAR2 (4000);
"
"	   v_excep_tab    VARCHAR2 (4000);
"
"
"
"	CURSOR c1
"
"	    IS
"
"	SELECT table_name
"
"	  FROM user_tables
"
"	 WHERE table_name = 'ENGG_MIG_DRWG_LN_MIGR';
"
"
"
"
"
"	CURSOR c2
"
"	    IS
"
"	SELECT COUNT (*) v_cnt
"
"	  FROM engg_mig_drwg_ln_tmp
"
"	 WHERE emdlnt_bu = p_bu
"
"	   AND emdlnt_plnt = p_plnt
"
"	   AND emdlnt_doc_no = p_doc_no;
"
"
"
"
"
"	   cr1            c1%ROWTYPE;
"
"	   cr2            c2%ROWTYPE;
"
"
"
"	   v_result       VARCHAR2 (1) := 'N';
"
"	   p_status       VARCHAR2 (1) := 'N';
"
"	BEGIN
"
"
"
"	   OPEN c1;
"
"	   FETCH c1 INTO cr1;
"
"		   IF c1%FOUND THEN
"
"		      EXECUTE IMMEDIATE 'DROP TABLE ENGG_MIG_DRWG_LN_MIGR';
"
"		   END IF;
"
"	   CLOSE c1;
"
"
"
"	   DELETE ENGG_MIG_DRWG_LN_TMP
"
"	    WHERE emdlnt_bu = p_bu
"
"	      AND emdlnt_plnt = p_plnt
"
"	      AND emdlnt_doc_no = p_doc_no;
"
"
"
"	   v_create_tab :=  'CREATE TABLE ENGG_MIG_DRWG_LN_MIGR (emdlnm_zone                   VARCHAR2(15),
"
"								emdlnm_proj_title              VARCHAR2(200),
"
"								emdlnm_drg_no                  VARCHAR2(15),
"
"								emdlnm_paper_size              VARCHAR2(5),
"
"								emdlnm_member_desc             VARCHAR2(150),
"
"							        emdlnm_uom		       VARCHAR2(5),
"
"								emdlnm_qty                     NUMBER(12,3),
"
"								emdlnm_member_size             VARCHAR2(150),
"
"								emdlnm_member_len              NUMBER(12,3),
"
"								emdlnm_unit_wgt                NUMBER(12,3),
"
"								emdlnm_total_wgt               NUMBER(12,3),
"
"								emdlnm_paint_area              NUMBER(12,3),
"
"								emdlnm_rev0_date               DATE,
"
"								emdlnm_rev1_date               DATE,
"
"								emdlnm_rev2_date               DATE,
"
"								emdlnm_rev3_date               DATE,
"
"								emdlnm_rev4_date               DATE,
"
"								emdlnm_rev5_date               DATE,
"
"								emdlnm_rev6_date               DATE,
"
"								emdlnm_reference               VARCHAR2(200)
"
"							    )
"
"					ORGANIZATION EXTERNAL
"
"					  (  TYPE ORACLE_LOADER
"
"					     DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"					     ACCESS PARAMETERS
"
"					       ( RECORDS DELIMITED BY NEWLINE
"
"							      SKIP 1
"
"							     FIELDS TERMINATED BY  ''|''
"
"							     MISSING FIELD VALUES ARE NULL
"
"							     REJECT ROWS WITH ALL NULL FIELDS
"
"							       (emdlnm_zone                    CHAR(255),
"
"								emdlnm_proj_title              CHAR(255),
"
"								emdlnm_drg_no                  CHAR(255),
"
"								emdlnm_paper_size              CHAR(255),
"
"								emdlnm_member_desc             CHAR(255),
"
"								emdlnm_uom		       CHAR(255),
"
"								emdlnm_qty                     CHAR(255),
"
"								emdlnm_member_size             CHAR(255),
"
"								emdlnm_member_len              CHAR(255),
"
"								emdlnm_unit_wgt                CHAR(255),
"
"								emdlnm_total_wgt               CHAR(255),
"
"								emdlnm_paint_area              CHAR(255),
"
"								emdlnm_rev0_date               CHAR(255) DATE_FORMAT DATE MASK ""DD-MON-YY"",
"
"								emdlnm_rev1_date               CHAR(255) DATE_FORMAT DATE MASK ""DD-MON-YY"",
"
"								emdlnm_rev2_date               CHAR(255) DATE_FORMAT DATE MASK ""DD-MON-YY"",
"
"								emdlnm_rev3_date               CHAR(255) DATE_FORMAT DATE MASK ""DD-MON-YY"",
"
"								emdlnm_rev4_date               CHAR(255) DATE_FORMAT DATE MASK ""DD-MON-YY"",
"
"								emdlnm_rev5_date               CHAR(255) DATE_FORMAT DATE MASK ""DD-MON-YY"",
"
"								emdlnm_rev6_date               CHAR(255) DATE_FORMAT DATE MASK ""DD-MON-YY"",
"
"								emdlnm_reference               CHAR(255)
"
"								 ))
"
"							     LOCATION ('
"
"								      || p_dir
"
"								      || ':'
"
"								      || CHR (39)
"
"								      || p_file_name
"
"								      || CHR (39)
"
"								      || ')
"
"								  )
"
"								';
"
"
"
"	   EXECUTE IMMEDIATE v_create_tab;
"
"
"
"			--raise_application_error(-20999,'HRM');
"
"
"
"	   v_excep_tab :=	 'INSERT INTO ENGG_MIG_DRWG_LN_TMP (SELECT ' || CHR (39)|| p_bu|| CHR (39)|| ','|| '
"
"									   ' || CHR (39)|| p_plnt|| CHR (39)|| ','|| '
"
"									   ' || CHR (39)|| p_doc_no|| CHR (39)|| ','|| '
"
"								      NULL,
"
"								   UPPER(TRIM(emdlnm_zone)),
"
"								   UPPER(TRIM(emdlnm_proj_title)),
"
"								   UPPER(TRIM(emdlnm_drg_no)),
"
"								   UPPER(TRIM(emdlnm_paper_size)),
"
"								   UPPER(TRIM(emdlnm_member_desc)),
"
"								   emdlnm_uom,
"
"								   emdlnm_qty,
"
"								   UPPER(TRIM(emdlnm_member_size)),
"
"								   emdlnm_member_len,
"
"								   emdlnm_unit_wgt,
"
"								   emdlnm_total_wgt,
"
"								   emdlnm_paint_area,
"
"								   emdlnm_rev0_date,
"
"								   emdlnm_rev1_date,
"
"								   emdlnm_rev2_date,
"
"								   emdlnm_rev3_date,
"
"								   emdlnm_rev4_date,
"
"								   emdlnm_rev5_date,
"
"								   emdlnm_rev6_date,
"
"								   emdlnm_reference,
"
"								   NULL
"
"								   FROM ENGG_MIG_DRWG_LN_MIGR
"
"									)';
"
"
"
"	   EXECUTE IMMEDIATE v_excep_tab;
"
"
"
"	   EXECUTE IMMEDIATE 'DROP TABLE ENGG_MIG_DRWG_LN_MIGR';
"
"
"
"	   OPEN c2;
"
"	   FETCH c2 INTO cr2;
"
"		   IF cr2.v_cnt = 0 THEN
"
"		      v_result := 'N';
"
"		   ELSE
"
"		      v_result := 'Y';
"
"		   END IF;
"
"	   CLOSE c2;
"
"
"
"	   p_variant := v_result;
"
"
"
"	END proc_upload_asmbly_drwg;
"
"
"
"
"
"	/*  Check Assembly Drawing Exception */
"
"
"
"PROCEDURE proc_chk_asmbly_drwg (p_bu         VARCHAR2,
"
"		      p_plnt       VARCHAR2,
"
"		      p_doc_no     VARCHAR2,
"
"		      p_user       VARCHAR2,
"
"		      p_fail   OUT VARCHAR2)
"
"IS
"
"CURSOR C1
"
"    IS
"
"SELECT *
"
"  FROM engg_mig_drwg_ln_tmp
"
" WHERE emdlnt_bu = p_bu
"
"   AND emdlnt_plnt = p_plnt
"
"   AND emdlnt_doc_no = p_doc_no;
"
"
"
"
"
"CURSOR C2(c_zone               VARCHAR2,
"
"	   c_proj_title 	VARCHAR2,
"
"	   c_drg_no     	VARCHAR2,
"
"	   c_paper_size 	VARCHAR2,
"
"	   c_member_desc	VARCHAR2,
"
"	   c_uom		VARCHAR2,
"
"	   c_qty        	NUMBER,
"
"	   c_member_size	VARCHAR2,
"
"	   c_member_len 	VARCHAR2,
"
"	   c_unit_wgt   	NUMBER,
"
"	   c_total_wgt  	NUMBER,
"
"	   c_paint_area 	NUMBER,
"
"	   c_rev0_date		DATE,
"
"	   c_rev1_date		DATE,
"
"	   c_rev2_date		DATE,
"
"	   c_rev3_date		DATE,
"
"	   c_rev4_date		DATE,
"
"	   c_rev5_date		DATE,
"
"	   c_rev6_date		DATE,
"
"	   c_reference		VARCHAR2)
"
"    IS
"
"SELECT  emdlnt_zone        ,
"
"	emdlnt_proj_title  ,
"
"	emdlnt_drg_no      ,
"
"	emdlnt_paper_size  ,
"
"	emdlnt_member_desc ,
"
"	emdlnt_uom	   ,
"
"	emdlnt_qty         ,
"
"	emdlnt_member_size ,
"
"	emdlnt_member_len  ,
"
"	emdlnt_unit_wgt    ,
"
"	emdlnt_total_wgt   ,
"
"	emdlnt_paint_area  ,
"
"	emdlnt_rev0_date   ,
"
"	emdlnt_rev1_date   ,
"
"	emdlnt_rev2_date   ,
"
"	emdlnt_rev3_date   ,
"
"	emdlnt_rev4_date   ,
"
"	emdlnt_rev5_date   ,
"
"	emdlnt_rev6_date   ,
"
"	emdlnt_reference,
"
"        COUNT (*)
"
"  FROM engg_mig_drwg_ln_tmp
"
" WHERE emdlnt_bu = p_bu
"
"   AND emdlnt_plnt = p_plnt
"
"   AND emdlnt_doc_no = p_doc_no
"
"   AND emdlnt_zone        = c_zone
"
"   AND emdlnt_proj_title  = c_proj_title
"
"   AND emdlnt_drg_no      = c_drg_no
"
"   AND emdlnt_paper_size  = c_paper_size
"
"   AND emdlnt_member_desc = c_member_desc
"
"   AND emdlnt_uom         = c_uom
"
"   AND emdlnt_qty         = c_qty
"
"   AND emdlnt_member_size = c_member_size
"
"   AND emdlnt_member_len  = c_member_len
"
"   AND emdlnt_unit_wgt    = c_unit_wgt
"
"   AND emdlnt_total_wgt   = c_total_wgt
"
"   AND emdlnt_paint_area  = c_paint_area
"
"   AND (TRUNC(emdlnt_rev0_date) = TRUNC(c_rev0_date) OR c_rev0_date IS NULL)
"
"   AND (TRUNC(emdlnt_rev1_date) = TRUNC(c_rev1_date) OR c_rev1_date IS NULL)
"
"   AND (TRUNC(emdlnt_rev2_date) = TRUNC(c_rev2_date) OR c_rev2_date IS NULL)
"
"   AND (TRUNC(emdlnt_rev3_date) = TRUNC(c_rev3_date) OR c_rev3_date IS NULL)
"
"   AND (TRUNC(emdlnt_rev4_date) = TRUNC(c_rev4_date) OR c_rev4_date IS NULL)
"
"   AND (TRUNC(emdlnt_rev5_date) = TRUNC(c_rev5_date) OR c_rev5_date IS NULL)
"
"   AND (TRUNC(emdlnt_rev6_date) = TRUNC(c_rev6_date) OR c_rev6_date IS NULL)
"
"   AND (emdlnt_reference = c_reference OR c_reference IS NULL)
"
"GROUP BY emdlnt_zone        ,
"
"	emdlnt_proj_title  ,
"
"	emdlnt_drg_no      ,
"
"	emdlnt_paper_size  ,
"
"	emdlnt_member_desc ,
"
"	emdlnt_uom	   ,
"
"	emdlnt_qty         ,
"
"	emdlnt_member_size ,
"
"	emdlnt_member_len  ,
"
"	emdlnt_unit_wgt    ,
"
"	emdlnt_total_wgt   ,
"
"	emdlnt_paint_area  ,
"
"	emdlnt_rev0_date   ,
"
"	emdlnt_rev1_date   ,
"
"	emdlnt_rev2_date   ,
"
"	emdlnt_rev3_date   ,
"
"	emdlnt_rev4_date   ,
"
"	emdlnt_rev5_date   ,
"
"	emdlnt_rev6_date   ,
"
"	emdlnt_reference
"
"HAVING COUNT (*) > 1;
"
"
"
"
"
"CURSOR C4 (c_zone               VARCHAR2,
"
"	   c_proj_title 	VARCHAR2,
"
"	   c_drg_no     	VARCHAR2,
"
"	   c_paper_size 	VARCHAR2,
"
"	   c_member_desc	VARCHAR2,
"
"	   c_uom		VARCHAR2,
"
"	   c_qty        	NUMBER,
"
"	   c_member_size	VARCHAR2,
"
"	   c_member_len 	VARCHAR2,
"
"	   c_unit_wgt   	NUMBER,
"
"	   c_total_wgt  	NUMBER,
"
"	   c_paint_area 	NUMBER,
"
"	   c_rev0_date		DATE,
"
"	   c_rev1_date		DATE,
"
"	   c_rev2_date		DATE,
"
"	   c_rev3_date		DATE,
"
"	   c_rev4_date		DATE,
"
"	   c_rev5_date		DATE,
"
"	   c_rev6_date		DATE,
"
"	   c_reference		VARCHAR2)
"
"    IS
"
"SELECT *
"
"  FROM engg_mig_drwg_ln
"
" WHERE emdln_bu     = p_bu
"
"   AND emdln_plnt   = p_plnt
"
"   AND emdln_doc_no = p_doc_no
"
"   AND emdln_zone        = c_zone
"
"   AND emdln_proj_title  = c_proj_title
"
"   AND emdln_drg_no      = c_drg_no
"
"   AND emdln_paper_size  = c_paper_size
"
"   AND emdln_member_desc = c_member_desc
"
"   AND emdln_uom         = c_uom
"
"   AND emdln_qty         = c_qty
"
"   AND emdln_member_size = c_member_size
"
"   AND emdln_member_len  = c_member_len
"
"   AND emdln_unit_wgt    = c_unit_wgt
"
"   AND emdln_total_wgt   = c_total_wgt
"
"   AND emdln_paint_area  = c_paint_area
"
"   AND (TRUNC(emdln_rev0_date) = TRUNC(c_rev0_date) OR c_rev0_date IS NULL)
"
"   AND (TRUNC(emdln_rev1_date) = TRUNC(c_rev1_date) OR c_rev1_date IS NULL)
"
"   AND (TRUNC(emdln_rev2_date) = TRUNC(c_rev2_date) OR c_rev2_date IS NULL)
"
"   AND (TRUNC(emdln_rev3_date) = TRUNC(c_rev3_date) OR c_rev3_date IS NULL)
"
"   AND (TRUNC(emdln_rev4_date) = TRUNC(c_rev4_date) OR c_rev4_date IS NULL)
"
"   AND (TRUNC(emdln_rev5_date) = TRUNC(c_rev5_date) OR c_rev5_date IS NULL)
"
"   AND (TRUNC(emdln_rev6_date) = TRUNC(c_rev6_date) OR c_rev6_date IS NULL)
"
"   AND (emdln_reference = c_reference OR c_reference IS NULL);
"
"
"
"CURSOR c3(c_uom   VARCHAR2)
"
"    IS
"
"SELECT uom_uom ,
"
"       uom_desc1
"
"  FROM unit_of_measures
"
" WHERE uom_bu = p_bu
"
"   AND uom_uom = c_uom;
"
"
"
"   cr1   c1%ROWTYPE;
"
"   cr2   c2%ROWTYPE;
"
"   cr3   c3%ROWTYPE;
"
"   CR4   C4%ROWTYPE;
"
"BEGIN
"
"   p_fail := 'Y';
"
"
"
"   UPDATE engg_mig_drwg_ln_tmp
"
"      SET emdlnt_excp_reference = ''
"
"    WHERE emdlnt_bu = p_bu
"
"      AND emdlnt_plnt = p_plnt
"
"      AND emdlnt_doc_no = p_doc_no;
"
"
"
"   FOR cr1 IN c1
"
"   LOOP
"
"
"
"
"
"      IF cr1.emdlnt_zone IS NULL
"
"      THEN
"
"
"
"         UPDATE engg_mig_drwg_ln_tmp
"
"            SET emdlnt_excp_reference = 'Zone must be entered.'
"
"          WHERE emdlnt_bu = p_bu
"
"      	    AND emdlnt_plnt = p_plnt
"
"      	    AND emdlnt_doc_no = p_doc_no
"
"            AND emdlnt_zone IS NULL;
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"      IF cr1.emdlnt_proj_title   IS NULL
"
"      THEN
"
"
"
"         UPDATE engg_mig_drwg_ln_tmp
"
"            SET emdlnt_excp_reference = 'Project Title must be entered.'
"
"          WHERE emdlnt_bu = p_bu
"
"      	    AND emdlnt_plnt = p_plnt
"
"      	    AND emdlnt_doc_no = p_doc_no
"
"            AND emdlnt_proj_title   IS NULL;
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"      IF cr1.emdlnt_drg_no   IS NULL
"
"      THEN
"
"
"
"         UPDATE engg_mig_drwg_ln_tmp
"
"            SET emdlnt_excp_reference = 'Drawing No. must be entered.'
"
"          WHERE emdlnt_bu = p_bu
"
"      	    AND emdlnt_plnt = p_plnt
"
"      	    AND emdlnt_doc_no = p_doc_no
"
"            AND emdlnt_drg_no IS NULL;
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"
"
"      IF cr1.emdlnt_paper_size  IS NULL
"
"      THEN
"
"
"
"         UPDATE engg_mig_drwg_ln_tmp
"
"            SET emdlnt_excp_reference = 'Paper Size must be entered.'
"
"          WHERE emdlnt_bu = p_bu
"
"      	    AND emdlnt_plnt = p_plnt
"
"      	    AND emdlnt_doc_no = p_doc_no
"
"            AND emdlnt_paper_size IS NULL;
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"      IF cr1.emdlnt_member_desc IS NULL
"
"      THEN
"
"
"
"         UPDATE engg_mig_drwg_ln_tmp
"
"            SET emdlnt_excp_reference = 'Memeber Desc. must be entered.'
"
"          WHERE emdlnt_bu = p_bu
"
"      	    AND emdlnt_plnt = p_plnt
"
"      	    AND emdlnt_doc_no = p_doc_no
"
"            AND emdlnt_member_desc IS NULL;
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"      IF cr1.emdlnt_uom IS NULL
"
"      THEN
"
"
"
"         UPDATE engg_mig_drwg_ln_tmp
"
"            SET emdlnt_excp_reference = 'UOM must be entered.'
"
"          WHERE emdlnt_bu = p_bu
"
"      	    AND emdlnt_plnt = p_plnt
"
"      	    AND emdlnt_doc_no = p_doc_no
"
"            AND emdlnt_uom IS NULL;
"
"
"
"         p_fail := 'N';
"
"      ELSE
"
"
"
"      	  OPEN c3(cr1.emdlnt_uom);
"
"      	  FETCH c3 INTO cr3;
"
"		   IF c3%NOTFOUND THEN
"
"
"
"			 UPDATE engg_mig_drwg_ln_tmp
"
"			    SET emdlnt_excp_reference = 'UOM Not Found .'
"
"			  WHERE emdlnt_bu = p_bu
"
"			    AND emdlnt_plnt = p_plnt
"
"			    AND emdlnt_doc_no = p_doc_no
"
"			    AND emdlnt_uom = cr1.emdlnt_uom;
"
"
"
"			p_fail := 'N';
"
"		   END IF;
"
"          CLOSE c3;
"
"
"
"      END IF;
"
"
"
"      IF (cr1.emdlnt_qty IS NULL OR cr1.emdlnt_qty < 0 OR cr1.emdlnt_qty = 0 )
"
"      THEN
"
"
"
"         UPDATE engg_mig_drwg_ln_tmp
"
"            SET emdlnt_excp_reference = 'Qty. should be greater than zero.'
"
"          WHERE emdlnt_bu = p_bu
"
"      	    AND emdlnt_plnt = p_plnt
"
"      	    AND emdlnt_doc_no = p_doc_no
"
"            AND (emdlnt_qty IS NULL OR emdlnt_qty < 0 OR emdlnt_qty = 0);
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"      IF cr1.emdlnt_member_size IS NULL
"
"      THEN
"
"
"
"         UPDATE engg_mig_drwg_ln_tmp
"
"            SET emdlnt_excp_reference = 'Memeber Size must be entered.'
"
"          WHERE emdlnt_bu = p_bu
"
"      	    AND emdlnt_plnt = p_plnt
"
"      	    AND emdlnt_doc_no = p_doc_no
"
"            AND emdlnt_member_size IS NULL;
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"      IF (cr1.emdlnt_member_len IS NULL OR cr1.emdlnt_member_len < 0 OR cr1.emdlnt_member_len = 0)
"
"      THEN
"
"
"
"         UPDATE engg_mig_drwg_ln_tmp
"
"            SET emdlnt_excp_reference = 'Length should be greater than zero.'
"
"          WHERE emdlnt_bu = p_bu
"
"      	    AND emdlnt_plnt = p_plnt
"
"      	    AND emdlnt_doc_no = p_doc_no
"
"      	    AND (emdlnt_member_len IS NULL OR emdlnt_member_len < 0 OR emdlnt_member_len = 0);
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"      IF (cr1.emdlnt_unit_wgt IS NULL OR cr1.emdlnt_unit_wgt < 0 OR cr1.emdlnt_unit_wgt = 0)
"
"      THEN
"
"
"
"         UPDATE engg_mig_drwg_ln_tmp
"
"            SET emdlnt_excp_reference = 'Unit weight should be greater than zero.'
"
"          WHERE emdlnt_bu = p_bu
"
"      	    AND emdlnt_plnt = p_plnt
"
"      	    AND emdlnt_doc_no = p_doc_no
"
"      	    AND (emdlnt_unit_wgt IS NULL OR emdlnt_unit_wgt < 0 OR emdlnt_unit_wgt = 0);
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"      IF (cr1.emdlnt_total_wgt IS NULL OR cr1.emdlnt_total_wgt < 0 OR cr1.emdlnt_total_wgt = 0)
"
"      THEN
"
"
"
"         UPDATE engg_mig_drwg_ln_tmp
"
"            SET emdlnt_excp_reference = 'Total weight should be greater than zero.'
"
"          WHERE emdlnt_bu = p_bu
"
"      	    AND emdlnt_plnt = p_plnt
"
"      	    AND emdlnt_doc_no = p_doc_no
"
"      	    AND (emdlnt_total_wgt IS NULL OR emdlnt_total_wgt < 0 OR emdlnt_total_wgt = 0);
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"      IF (cr1.emdlnt_paint_area IS NULL OR cr1.emdlnt_paint_area < 0 OR cr1.emdlnt_paint_area = 0)
"
"      THEN
"
"
"
"         UPDATE engg_mig_drwg_ln_tmp
"
"            SET emdlnt_excp_reference = 'Paint Area should be greater than zero.'
"
"          WHERE emdlnt_bu = p_bu
"
"      	    AND emdlnt_plnt = p_plnt
"
"      	    AND emdlnt_doc_no = p_doc_no
"
"      	    AND (emdlnt_paint_area IS NULL OR emdlnt_paint_area < 0 OR emdlnt_paint_area = 0);
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"      IF (cr1.emdlnt_paint_area IS NULL OR cr1.emdlnt_paint_area < 0 OR cr1.emdlnt_paint_area = 0)
"
"      THEN
"
"
"
"         UPDATE engg_mig_drwg_ln_tmp
"
"            SET emdlnt_excp_reference = 'Paint Area should be greater than zero.'
"
"          WHERE emdlnt_bu = p_bu
"
"      	    AND emdlnt_plnt = p_plnt
"
"      	    AND emdlnt_doc_no = p_doc_no
"
"      	    AND (emdlnt_paint_area IS NULL OR emdlnt_paint_area < 0 OR emdlnt_paint_area = 0);
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"      IF cr1.emdlnt_zone 	IS NOT NULL AND
"
"	 cr1.emdlnt_proj_title  IS NOT NULL AND
"
"	 cr1.emdlnt_drg_no      IS NOT NULL AND
"
"	 cr1.emdlnt_paper_size  IS NOT NULL AND
"
"	 cr1.emdlnt_member_desc IS NOT NULL AND
"
"	 cr1.emdlnt_uom         IS NOT NULL AND
"
"	 cr1.emdlnt_qty         > 0 AND
"
"	 cr1.emdlnt_member_size IS NOT NULL AND
"
"	 cr1.emdlnt_member_len  > 0 AND
"
"	 cr1.emdlnt_unit_wgt    > 0 AND
"
"	 cr1.emdlnt_total_wgt   > 0 AND
"
"	 cr1.emdlnt_paint_area  > 0  THEN
"
"
"
"         OPEN C4 (cr1.emdlnt_zone 	,
"
"		cr1.emdlnt_proj_title ,
"
"		cr1.emdlnt_drg_no     ,
"
"		cr1.emdlnt_paper_size ,
"
"		cr1.emdlnt_member_desc,
"
"		cr1.emdlnt_uom        ,
"
"		cr1.emdlnt_qty        ,
"
"		cr1.emdlnt_member_size,
"
"		cr1.emdlnt_member_len  ,
"
"		cr1.emdlnt_unit_wgt    ,
"
"		cr1.emdlnt_total_wgt   ,
"
"		cr1.emdlnt_paint_area  ,
"
"		cr1.emdlnt_rev0_date   ,
"
"		cr1.emdlnt_rev1_date   ,
"
"		cr1.emdlnt_rev2_date   ,
"
"		cr1.emdlnt_rev3_date   ,
"
"		cr1.emdlnt_rev4_date   ,
"
"		cr1.emdlnt_rev5_date   ,
"
"		cr1.emdlnt_rev6_date   ,
"
"		cr1.emdlnt_reference
"
"                  );
"
"         FETCH C4 INTO CR4;
"
"
"
"		 IF C4%FOUND THEN
"
"
"
"			 UPDATE engg_mig_drwg_ln_tmp
"
"			    SET emdlnt_excp_reference = 'Record Already Exists.'
"
"			  WHERE emdlnt_bu 		= p_bu
"
"			    AND emdlnt_plnt 		= p_plnt
"
"			    AND emdlnt_doc_no 		= p_doc_no
"
"			    AND emdlnt_zone        	= cr1.emdlnt_zone
"
"			    AND emdlnt_proj_title  	= cr1.emdlnt_proj_title
"
"			    AND emdlnt_drg_no      	= cr1.emdlnt_drg_no
"
"			    AND emdlnt_paper_size  	= cr1.emdlnt_paper_size
"
"			    AND emdlnt_member_desc 	= cr1.emdlnt_member_desc
"
"			    AND emdlnt_uom         	= cr1.emdlnt_uom
"
"			    AND emdlnt_qty         	= cr1.emdlnt_qty
"
"			    AND emdlnt_member_size 	= cr1.emdlnt_member_size
"
"			    AND emdlnt_member_len  	= cr1.emdlnt_member_len
"
"			    AND emdlnt_unit_wgt    	= cr1.emdlnt_unit_wgt
"
"			    AND emdlnt_total_wgt   	= cr1.emdlnt_total_wgt
"
"			    AND emdlnt_paint_area  	= cr1.emdlnt_paint_area
"
"			    AND (TRUNC(emdlnt_rev0_date) = TRUNC(cr1.emdlnt_rev0_date) OR cr1.emdlnt_rev0_date IS NULL)
"
"			    AND (TRUNC(emdlnt_rev1_date) = TRUNC(cr1.emdlnt_rev1_date) OR cr1.emdlnt_rev1_date IS NULL)
"
"			    AND (TRUNC(emdlnt_rev2_date) = TRUNC(cr1.emdlnt_rev2_date) OR cr1.emdlnt_rev2_date IS NULL)
"
"			    AND (TRUNC(emdlnt_rev3_date) = TRUNC(cr1.emdlnt_rev3_date) OR cr1.emdlnt_rev3_date IS NULL)
"
"			    AND (TRUNC(emdlnt_rev4_date) = TRUNC(cr1.emdlnt_rev4_date) OR cr1.emdlnt_rev4_date IS NULL)
"
"			    AND (TRUNC(emdlnt_rev5_date) = TRUNC(cr1.emdlnt_rev5_date) OR cr1.emdlnt_rev5_date IS NULL)
"
"			    AND (TRUNC(emdlnt_rev6_date) = TRUNC(cr1.emdlnt_rev6_date) OR cr1.emdlnt_rev6_date IS NULL)
"
"			    AND (emdlnt_reference 	= cr1.emdlnt_reference OR cr1.emdlnt_reference IS NULL);
"
"
"
"			    p_fail := 'N';
"
"
"
"		 ELSIF C4%NOTFOUND THEN
"
"
"
"			    OPEN C2(cr1.emdlnt_zone 	,
"
"				cr1.emdlnt_proj_title ,
"
"				cr1.emdlnt_drg_no     ,
"
"				cr1.emdlnt_paper_size ,
"
"				cr1.emdlnt_member_desc,
"
"				cr1.emdlnt_uom        ,
"
"				cr1.emdlnt_qty        ,
"
"				cr1.emdlnt_member_size,
"
"				cr1.emdlnt_member_len  ,
"
"				cr1.emdlnt_unit_wgt    ,
"
"				cr1.emdlnt_total_wgt   ,
"
"				cr1.emdlnt_paint_area  ,
"
"				cr1.emdlnt_rev0_date   ,
"
"				cr1.emdlnt_rev1_date   ,
"
"				cr1.emdlnt_rev2_date   ,
"
"				cr1.emdlnt_rev3_date   ,
"
"				cr1.emdlnt_rev4_date   ,
"
"				cr1.emdlnt_rev5_date   ,
"
"				cr1.emdlnt_rev6_date   ,
"
"				cr1.emdlnt_reference
"
"				  );
"
"			    FETCH c2 INTO cr2;
"
"				    IF C2%FOUND THEN
"
"
"
"				        UPDATE engg_mig_drwg_ln_tmp
"
"					    SET emdlnt_excp_reference = 'Duplicate Record.'
"
"					  WHERE emdlnt_bu 		= p_bu
"
"					    AND emdlnt_plnt 		= p_plnt
"
"					    AND emdlnt_doc_no 		= p_doc_no
"
"					    AND emdlnt_zone        	= cr1.emdlnt_zone
"
"					    AND emdlnt_proj_title  	= cr1.emdlnt_proj_title
"
"					    AND emdlnt_drg_no      	= cr1.emdlnt_drg_no
"
"					    AND emdlnt_paper_size  	= cr1.emdlnt_paper_size
"
"					    AND emdlnt_member_desc 	= cr1.emdlnt_member_desc
"
"					    AND emdlnt_uom         	= cr1.emdlnt_uom
"
"					    AND emdlnt_qty         	= cr1.emdlnt_qty
"
"					    AND emdlnt_member_size 	= cr1.emdlnt_member_size
"
"					    AND emdlnt_member_len  	= cr1.emdlnt_member_len
"
"					    AND emdlnt_unit_wgt    	= cr1.emdlnt_unit_wgt
"
"					    AND emdlnt_total_wgt   	= cr1.emdlnt_total_wgt
"
"					    AND emdlnt_paint_area  	= cr1.emdlnt_paint_area
"
"					    AND (TRUNC(emdlnt_rev0_date) = TRUNC(cr1.emdlnt_rev0_date) OR cr1.emdlnt_rev0_date IS NULL)
"
"					    AND (TRUNC(emdlnt_rev1_date) = TRUNC(cr1.emdlnt_rev1_date) OR cr1.emdlnt_rev1_date IS NULL)
"
"					    AND (TRUNC(emdlnt_rev2_date) = TRUNC(cr1.emdlnt_rev2_date) OR cr1.emdlnt_rev2_date IS NULL)
"
"					    AND (TRUNC(emdlnt_rev3_date) = TRUNC(cr1.emdlnt_rev3_date) OR cr1.emdlnt_rev3_date IS NULL)
"
"					    AND (TRUNC(emdlnt_rev4_date) = TRUNC(cr1.emdlnt_rev4_date) OR cr1.emdlnt_rev4_date IS NULL)
"
"					    AND (TRUNC(emdlnt_rev5_date) = TRUNC(cr1.emdlnt_rev5_date) OR cr1.emdlnt_rev5_date IS NULL)
"
"					    AND (TRUNC(emdlnt_rev6_date) = TRUNC(cr1.emdlnt_rev6_date) OR cr1.emdlnt_rev6_date IS NULL)
"
"					    AND (emdlnt_reference 	= cr1.emdlnt_reference OR cr1.emdlnt_reference IS NULL);
"
"
"
"				       p_fail := 'N';
"
"				    END IF;
"
"			    CLOSE c2;
"
"		 ELSE
"
"
"
"				        UPDATE engg_mig_drwg_ln_tmp
"
"					    SET emdlnt_excp_reference = ' '
"
"					  WHERE emdlnt_bu 	   = p_bu
"
"					    AND emdlnt_plnt 	   = p_plnt
"
"					    AND emdlnt_doc_no 	   = p_doc_no
"
"					    AND emdlnt_zone        = cr1.emdlnt_zone
"
"					    AND emdlnt_proj_title  = cr1.emdlnt_proj_title
"
"					    AND emdlnt_drg_no      = cr1.emdlnt_drg_no
"
"					    AND emdlnt_paper_size  = cr1.emdlnt_paper_size
"
"					    AND emdlnt_member_desc = cr1.emdlnt_member_desc
"
"					    AND emdlnt_uom         = cr1.emdlnt_uom
"
"					    AND emdlnt_qty         = cr1.emdlnt_qty
"
"					    AND emdlnt_member_size = cr1.emdlnt_member_size
"
"					    AND emdlnt_member_len  = cr1.emdlnt_member_len
"
"					    AND emdlnt_unit_wgt    = cr1.emdlnt_unit_wgt
"
"					    AND emdlnt_total_wgt   = cr1.emdlnt_total_wgt
"
"					    AND emdlnt_paint_area  = cr1.emdlnt_paint_area
"
"					    AND (TRUNC(emdlnt_rev0_date) = TRUNC(cr1.emdlnt_rev0_date) OR cr1.emdlnt_rev0_date IS NULL)
"
"					    AND (TRUNC(emdlnt_rev1_date) = TRUNC(cr1.emdlnt_rev1_date) OR cr1.emdlnt_rev1_date IS NULL)
"
"					    AND (TRUNC(emdlnt_rev2_date) = TRUNC(cr1.emdlnt_rev2_date) OR cr1.emdlnt_rev2_date IS NULL)
"
"					    AND (TRUNC(emdlnt_rev3_date) = TRUNC(cr1.emdlnt_rev3_date) OR cr1.emdlnt_rev3_date IS NULL)
"
"					    AND (TRUNC(emdlnt_rev4_date) = TRUNC(cr1.emdlnt_rev4_date) OR cr1.emdlnt_rev4_date IS NULL)
"
"					    AND (TRUNC(emdlnt_rev5_date) = TRUNC(cr1.emdlnt_rev5_date) OR cr1.emdlnt_rev5_date IS NULL)
"
"					    AND (TRUNC(emdlnt_rev6_date) = TRUNC(cr1.emdlnt_rev6_date) OR cr1.emdlnt_rev6_date IS NULL)
"
"					    AND (emdlnt_reference 	= cr1.emdlnt_reference OR cr1.emdlnt_reference IS NULL);
"
"
"
"			    p_fail := 'Y';
"
"		 END IF;
"
"
"
"         CLOSE C4;
"
"
"
"      END IF;
"
"   END LOOP c1;
"
"END proc_chk_asmbly_drwg;
"
"
"
"
"
"		/* Insert Assembly Drawing */
"
"
"
"PROCEDURE proc_ins_asmbly_drwg (p_bu 	VARCHAR2,
"
"		      p_plnt  	VARCHAR2,
"
"		      p_doc_no  VARCHAR2,
"
"		      p_user 	VARCHAR2)
"
"IS
"
"CURSOR C1
"
"    IS
"
"SELECT  emdlnt_bu	   ,
"
"        emdlnt_zone        ,
"
"	emdlnt_proj_title  ,
"
"	emdlnt_drg_no      ,
"
"	emdlnt_paper_size  ,
"
"	emdlnt_member_desc ,
"
"	emdlnt_uom         ,
"
"	emdlnt_qty         ,
"
"	emdlnt_member_size ,
"
"	emdlnt_member_len  ,
"
"	emdlnt_unit_wgt    ,
"
"	emdlnt_total_wgt   ,
"
"	emdlnt_paint_area  ,
"
"	emdlnt_rev0_date   ,
"
"	emdlnt_rev1_date   ,
"
"	emdlnt_rev2_date   ,
"
"	emdlnt_rev3_date   ,
"
"	emdlnt_rev4_date   ,
"
"	emdlnt_rev5_date   ,
"
"	emdlnt_rev6_date   ,
"
"	emdlnt_reference
"
"  FROM engg_mig_drwg_ln_tmp
"
" WHERE emdlnt_bu = p_bu
"
"   AND emdlnt_plnt = p_plnt
"
"   AND emdlnt_doc_no = p_doc_no;
"
"
"
"
"
"   v_seq_no  NUMBER(5);
"
"
"
"BEGIN
"
"   FOR cr1 IN c1
"
"   LOOP
"
"
"
"
"
"	SELECT NVL(MAX(emdln_seq_no),0)+1
"
"	  INTO v_seq_no
"
"	  FROM engg_mig_drwg_ln
"
"	 WHERE emdln_bu = p_bu
"
"	   AND emdln_plnt = p_plnt
"
"	   AND emdln_doc_no = p_doc_no;
"
"
"
" 		--RAISE_APPLICATION_ERROR(-20999,'HRM'||p_bu||'/'||p_plnt||'/'||p_doc_no||'/'||v_seq_no);
"
"
"
"           INSERT INTO engg_mig_drwg_ln(emdln_bu            ,
"
"					emdln_plnt          ,
"
"					emdln_doc_no        ,
"
"					emdln_seq_no        ,
"
"					emdln_zone          ,
"
"					emdln_proj_title    ,
"
"					emdln_drg_no        ,
"
"					emdln_paper_size    ,
"
"					emdln_member_desc   ,
"
"					emdln_uom	    ,
"
"					emdln_qty           ,
"
"					emdln_member_size   ,
"
"					emdln_member_len    ,
"
"					emdln_unit_wgt      ,
"
"					emdln_total_wgt     ,
"
"					emdln_paint_area    ,
"
"					emdln_rev0_date     ,
"
"					emdln_rev1_date     ,
"
"					emdln_rev2_date     ,
"
"					emdln_rev3_date     ,
"
"					emdln_rev4_date     ,
"
"					emdln_rev5_date     ,
"
"					emdln_rev6_date     ,
"
"					emdln_reference     ,
"
"					emdln_cre_by        ,
"
"					emdln_cre_emp_id    ,
"
"					emdln_cre_ip_addr   ,
"
"					emdln_cre_os_user   ,
"
"					emdln_cre_date )
"
"				   VALUES (p_bu,					--emdln_bu
"
"					   p_plnt,					--emdln_plnt
"
"					   p_doc_no,					--emdln_doc_no
"
"					   v_seq_no            ,			--emdln_seq_no
"
"					   cr1.emdlnt_zone          ,			--emdln_zone
"
"					   cr1.emdlnt_proj_title    ,			--emdln_proj_title
"
"					   cr1.emdlnt_drg_no        ,			--emdln_drg_no
"
"					   cr1.emdlnt_paper_size    ,			--emdln_paper_size
"
"					   cr1.emdlnt_member_desc   ,			--emdln_member_desc
"
"					   cr1.emdlnt_uom           ,			--emdln_uom
"
"					   cr1.emdlnt_qty           ,			--emdln_qty
"
"					   cr1.emdlnt_member_size   ,			--emdln_member_size
"
"					   cr1.emdlnt_member_len    ,			--emdln_member_len
"
"					   cr1.emdlnt_unit_wgt      ,			--emdln_unit_wgt
"
"					   cr1.emdlnt_total_wgt     ,			--emdln_total_wgt
"
"					   cr1.emdlnt_paint_area    ,			--emdln_paint_area
"
"					   cr1.emdlnt_rev0_date     ,			--emdln_rev0_date
"
"					   cr1.emdlnt_rev1_date     ,			--emdln_rev1_date
"
"					   cr1.emdlnt_rev2_date     ,			--emdln_rev2_date
"
"					   cr1.emdlnt_rev3_date     ,			--emdln_rev3_date
"
"					   cr1.emdlnt_rev4_date     ,			--emdln_rev4_date
"
"					   cr1.emdlnt_rev5_date     ,			--emdln_rev5_date
"
"					   cr1.emdlnt_rev6_date     ,			--emdln_rev6_date
"
"					   cr1.emdlnt_reference     ,			--emdln_reference
"
"					   p_user,  					--emdln_cre_by
"
"					   func_find_emp_id(p_bu,p_user),		--emdln_cre_emp_id
"
"					   audit_info.get_ip_address,			--emdln_cre_ip_addr
"
"					   audit_info.get_os_user,			--emdln_cre_os_user
"
"   					   SYSDATE);					--emdln_cre_date
"
"
"
"       END LOOP;
"
"
"
"        DELETE engg_mig_drwg_ln_tmp
"
"	 WHERE emdlnt_bu = p_bu
"
"	   AND emdlnt_plnt = p_plnt
"
"	   AND emdlnt_doc_no = p_doc_no;
"
"
"
"END proc_ins_asmbly_drwg;
"
"
"
"		/*  Upload Assembly Part */
"
"
"
"PROCEDURE proc_upload_asmbly_part (
"
"				   p_bu              VARCHAR2,
"
"				   p_plnt            VARCHAR2,
"
"				   p_doc_no	     VARCHAR2,
"
"				   p_dir             VARCHAR2,
"
"				   p_file_name       VARCHAR2,
"
"				   p_user            VARCHAR2,
"
"				   p_variant     OUT VARCHAR2)
"
"IS
"
"   v_create_tab   VARCHAR2 (4000);
"
"   v_excep_tab    VARCHAR2 (4000);
"
"
"
"CURSOR c1
"
"    IS
"
"SELECT table_name
"
"  FROM user_tables
"
" WHERE table_name = 'ENGG_MIG_PART_LN_MIGR';
"
"
"
"
"
"CURSOR c2
"
"    IS
"
"SELECT COUNT (*) v_cnt
"
"  FROM engg_mig_part_ln_tmp
"
" WHERE emplt_bu = p_bu
"
"   AND emplt_plnt = p_plnt
"
"   AND emplt_doc_no = p_doc_no;
"
"
"
"
"
"   cr1            c1%ROWTYPE;
"
"   cr2            c2%ROWTYPE;
"
"
"
"   v_result       VARCHAR2 (1) := 'N';
"
"   p_status       VARCHAR2 (1) := 'N';
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
"   IF c1%FOUND
"
"   THEN
"
"      EXECUTE IMMEDIATE 'DROP TABLE ENGG_MIG_PART_LN_MIGR';
"
"   END IF;
"
"
"
"   CLOSE c1;
"
"
"
"
"
"   DELETE engg_mig_part_ln_tmp
"
"    WHERE emplt_bu = p_bu
"
"      AND emplt_plnt = p_plnt
"
"      AND emplt_doc_no = p_doc_no;
"
"
"
"
"
"   v_create_tab :=  'CREATE TABLE ENGG_MIG_PART_LN_MIGR(emplm_sub_seq_no           NUMBER(5),
"
"							emplm_zone                 VARCHAR2(25),
"
"							emplm_assy_mark            VARCHAR2(150),
"
"							emplm_part_mark            VARCHAR2(25),
"
"							emplm_membr_desc           VARCHAR2(150),
"
"							emplm_uom		   VARCHAR2(5),
"
"							emplm_qty                  NUMBER(12,3),
"
"							emplm_member_size          VARCHAR2(150),
"
"							emplm_length               NUMBER(12,3),
"
"							emplm_material             VARCHAR2(30),
"
"							emplm_unit_wgt             NUMBER(12,3),
"
"							emplm_total_wgt            NUMBER(12,3),
"
"							emplm_unit_pnt_area        NUMBER(12,3),
"
"							emplm_total_pnt_area       NUMBER(12,3),
"
"							emplm_reference            VARCHAR2(200)
"
"                                                    )
"
"				ORGANIZATION EXTERNAL
"
"				  (  TYPE ORACLE_LOADER
"
"				     DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"				     ACCESS PARAMETERS
"
"				       ( RECORDS DELIMITED BY NEWLINE
"
"						      SKIP 1
"
"						     FIELDS TERMINATED BY  ''|''
"
"						     MISSING FIELD VALUES ARE NULL
"
"						     REJECT ROWS WITH ALL NULL FIELDS
"
"                             			       (emplm_sub_seq_no                 CHAR(255),
"
"							emplm_zone                       CHAR(255),
"
"							emplm_assy_mark                  CHAR(255),
"
"							emplm_part_mark                  CHAR(255),
"
"							emplm_membr_desc                 CHAR(255),
"
"							emplm_uom		   	 CHAR(255),
"
"							emplm_qty                        CHAR(255),
"
"							emplm_member_size                CHAR(255),
"
"							emplm_length                     CHAR(255),
"
"							emplm_material                   CHAR(255),
"
"							emplm_unit_wgt                   CHAR(255),
"
"							emplm_total_wgt                  CHAR(255),
"
"							emplm_unit_pnt_area              CHAR(255),
"
"							emplm_total_pnt_area             CHAR(255),
"
"							emplm_reference                  CHAR(255)
"
"				                         ))
"
"						     LOCATION ('
"
"							      || p_dir
"
"							      || ':'
"
"							      || CHR (39)
"
"							      || p_file_name
"
"							      || CHR (39)
"
"							      || ')
"
"							  )
"
"							';
"
"
"
"   EXECUTE IMMEDIATE v_create_tab;
"
"
"
"
"
"
"
"   v_excep_tab :=	 'INSERT INTO ENGG_MIG_PART_LN_TMP (SELECT ' || CHR (39)|| p_bu|| CHR (39)|| ','|| '
"
"   								   ' || CHR (39)|| p_plnt|| CHR (39)|| ','|| '
"
"   								   ' || CHR (39)|| p_doc_no|| CHR (39)|| ','|| '
"
"							   emplm_sub_seq_no ,
"
"							   UPPER(TRIM(emplm_zone))       ,
"
"							   UPPER(TRIM(emplm_assy_mark))  ,
"
"							   UPPER(TRIM(emplm_part_mark))  ,
"
"							   UPPER(TRIM(emplm_membr_desc)) ,
"
"							   emplm_uom	    ,
"
"							   emplm_qty        ,
"
"							   UPPER(TRIM(emplm_member_size)),
"
"							   emplm_length     ,
"
"							   UPPER(TRIM(emplm_material))   ,
"
"							   emplm_unit_wgt   ,
"
"							   emplm_total_wgt  ,
"
"							   emplm_unit_pnt_area,
"
"							   emplm_total_pnt_area,
"
"							   emplm_reference,
"
"							   NULL
"
"							   FROM ENGG_MIG_PART_LN_MIGR
"
"								)';
"
"
"
"   EXECUTE IMMEDIATE v_excep_tab;
"
"
"
"   EXECUTE IMMEDIATE 'DROP TABLE ENGG_MIG_PART_LN_MIGR';
"
"
"
"   OPEN c2;
"
"   FETCH c2 INTO cr2;
"
"	   IF cr2.v_cnt = 0
"
"	   THEN
"
"	      v_result := 'N';
"
"	   ELSE
"
"	      v_result := 'Y';
"
"	   END IF;
"
"   CLOSE c2;
"
"
"
"   p_variant := v_result;
"
"
"
"END proc_upload_asmbly_part;
"
"
"
"
"
"		/* Check Assembly Part Exceptions */
"
"
"
"PROCEDURE proc_chk_asmbly_part (p_bu         VARCHAR2,
"
"					          p_plnt       VARCHAR2,
"
"					          p_doc_no     VARCHAR2,
"
"					          p_user       VARCHAR2,
"
"					          p_fail   OUT VARCHAR2)
"
"IS
"
"CURSOR C1
"
"    IS
"
"SELECT  emplt_bu               ,
"
"	emplt_plnt             ,
"
"	emplt_doc_no           ,
"
"	emplt_sub_seq_no       ,
"
"	emplt_zone             ,
"
"	emplt_assy_mark        ,
"
"	emplt_part_mark        ,
"
"	emplt_membr_desc       ,
"
"	emplt_uom	       ,
"
"	emplt_qty              ,
"
"	emplt_member_size      ,
"
"	emplt_length           ,
"
"	emplt_material         ,
"
"	emplt_unit_wgt         ,
"
"	emplt_total_wgt        ,
"
"	emplt_unit_pnt_area    ,
"
"	emplt_total_pnt_area,
"
"	emplt_reference
"
"  FROM engg_mig_part_ln_tmp
"
" WHERE emplt_bu = p_bu
"
"   AND emplt_plnt = p_plnt
"
"   AND emplt_doc_no = p_doc_no;
"
"
"
"CURSOR C2(c_sub_seq_no          NUMBER,
"
"	  c_zone   		VARCHAR2,
"
"	  c_assy_mark    	VARCHAR2,
"
"	  c_part_mark    	VARCHAR2,
"
"	  c_membr_desc    	VARCHAR2,
"
"	  c_uom   		VARCHAR2,
"
"	  c_qty   		NUMBER,
"
"	  c_member_size   	VARCHAR2,
"
"	  c_length    		NUMBER,
"
"	  c_material		VARCHAR2,
"
"	  c_unit_wgt    	NUMBER,
"
"	  c_total_wgt    	NUMBER,
"
"	  c_unit_pnt_area 	NUMBER,
"
"	  c_total_pnt_area	NUMBER,
"
"	  c_reference		VARCHAR2)
"
"    IS
"
"SELECT  emplt_sub_seq_no    ,
"
"	emplt_zone          ,
"
"	emplt_assy_mark     ,
"
"	emplt_part_mark     ,
"
"	emplt_membr_desc    ,
"
"	emplt_qty           ,
"
"	emplt_member_size   ,
"
"	emplt_length        ,
"
"	emplt_material      ,
"
"	emplt_unit_wgt      ,
"
"	emplt_total_wgt     ,
"
"	emplt_unit_pnt_area ,
"
"	emplt_total_pnt_area,
"
"	emplt_reference,
"
"        COUNT (*)
"
"  FROM engg_mig_part_ln_tmp
"
" WHERE emplt_bu 	 = p_bu
"
"   AND emplt_plnt 	 = p_plnt
"
"   AND emplt_doc_no 	 = p_doc_no
"
"   AND emplt_sub_seq_no  = c_sub_seq_no
"
"   AND emplt_zone        = c_zone
"
"   AND emplt_assy_mark   = c_assy_mark
"
"   AND emplt_part_mark   = c_part_mark
"
"   AND emplt_membr_desc  = c_membr_desc
"
"   AND emplt_uom         = c_uom
"
"   AND emplt_qty         = c_qty
"
"   AND (emplt_member_size = c_member_size OR c_member_size IS NULL)
"
"   AND (emplt_length  	 = c_length	 OR c_length IS NULL)
"
"   AND emplt_material    = c_material
"
"   AND emplt_unit_wgt    = c_unit_wgt
"
"   AND emplt_total_wgt   = c_total_wgt
"
"   AND (emplt_unit_pnt_area   = c_unit_pnt_area  OR c_unit_pnt_area IS NULL)
"
"   AND (emplt_total_pnt_area  = c_total_pnt_area OR c_total_pnt_area IS NULL)
"
"   AND (emplt_reference      = c_reference OR c_reference IS NULL)
"
"GROUP BY emplt_sub_seq_no    ,
"
"	emplt_zone          ,
"
"	emplt_assy_mark     ,
"
"	emplt_part_mark     ,
"
"	emplt_membr_desc    ,
"
"	emplt_uom           ,
"
"	emplt_qty           ,
"
"	emplt_member_size   ,
"
"	emplt_length        ,
"
"	emplt_material      ,
"
"	emplt_unit_wgt      ,
"
"	emplt_total_wgt     ,
"
"	emplt_unit_pnt_area ,
"
"	emplt_total_pnt_area,
"
"	emplt_reference
"
"HAVING COUNT (*) > 1;
"
"
"
"
"
"CURSOR C4(c_sub_seq_no          NUMBER,
"
"	  c_zone   		VARCHAR2,
"
"	  c_assy_mark    	VARCHAR2,
"
"	  c_part_mark    	VARCHAR2,
"
"	  c_membr_desc    	VARCHAR2,
"
"	  c_uom   		VARCHAR2,
"
"	  c_qty   		NUMBER,
"
"	  c_member_size   	VARCHAR2,
"
"	  c_length    		NUMBER,
"
"	  c_material		VARCHAR2,
"
"	  c_unit_wgt    	NUMBER,
"
"	  c_total_wgt    	NUMBER,
"
"	  c_unit_pnt_area 	NUMBER,
"
"	  c_total_pnt_area	NUMBER,
"
"	  c_reference		VARCHAR2)
"
"    IS
"
"SELECT *
"
"  FROM engg_mig_part_ln
"
" WHERE empl_bu 	 = p_bu
"
"   AND empl_plnt 	 = p_plnt
"
"   AND empl_doc_no 	 = p_doc_no
"
"   AND empl_sub_seq_no  = c_sub_seq_no
"
"   AND empl_zone        = c_zone
"
"   AND empl_assy_mark   = c_assy_mark
"
"   AND empl_part_mark   = c_part_mark
"
"   AND empl_membr_desc  = c_membr_desc
"
"   AND empl_uom         = c_uom
"
"   AND empl_qty         = c_qty
"
"   AND (empl_member_size = c_member_size OR c_member_size IS NULL)
"
"   AND (empl_length  	 = c_length      OR c_length IS NULL)
"
"   AND empl_material    = c_material
"
"   AND empl_unit_wgt    = c_unit_wgt
"
"   AND empl_total_wgt   = c_total_wgt
"
"   AND (empl_unit_pnt_area   = c_unit_pnt_area  OR c_unit_pnt_area IS NULL)
"
"   AND (empl_total_pnt_area  = c_total_pnt_area OR c_total_pnt_area IS NULL)
"
"   AND (empl_reference      = c_reference OR c_reference IS NULL);
"
"
"
"CURSOR c3(c_uom   VARCHAR2)
"
"    IS
"
"SELECT uom_uom ,
"
"       uom_desc1
"
"  FROM unit_of_measures
"
" WHERE uom_bu = p_bu
"
"   AND uom_uom = c_uom;
"
"
"
"   cr1   c1%ROWTYPE;
"
"   cr2   c2%ROWTYPE;
"
"   cr3   c3%ROWTYPE;
"
"   CR4   C4%ROWTYPE;
"
"BEGIN
"
"   p_fail := 'Y';
"
"
"
"   UPDATE engg_mig_part_ln_tmp
"
"      SET emplt_excp_reference = ''
"
"    WHERE emplt_bu = p_bu
"
"      AND emplt_plnt = p_plnt
"
"      AND emplt_doc_no = p_doc_no;
"
"
"
"   FOR cr1 IN c1
"
"   LOOP
"
"
"
"      IF cr1.emplt_sub_seq_no IS NULL
"
"      THEN
"
"
"
"         UPDATE engg_mig_part_ln_tmp
"
"            SET emplt_excp_reference = 'Sub Seq. No. must be entered.'
"
"          WHERE emplt_bu = p_bu
"
"      	    AND emplt_plnt = p_plnt
"
"      	    AND emplt_doc_no = p_doc_no
"
"            AND emplt_sub_seq_no IS NULL;
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"      /*IF cr1.emplt_zone IS NULL
"
"      THEN
"
"
"
"         UPDATE engg_mig_part_ln_tmp
"
"            SET emplt_excp_reference = 'Zone must be entered.'
"
"          WHERE emplt_bu = p_bu
"
"      	    AND emplt_plnt = p_plnt
"
"      	    AND emplt_doc_no = p_doc_no
"
"            AND emplt_zone IS NULL;
"
"
"
"         p_fail := 'N';
"
"      END IF;*/
"
"
"
"
"
"      IF cr1.emplt_assy_mark   IS NULL
"
"      THEN
"
"
"
"         UPDATE engg_mig_part_ln_tmp
"
"            SET emplt_excp_reference = 'Assy. Mark must be entered.'
"
"          WHERE emplt_bu = p_bu
"
"      	    AND emplt_plnt = p_plnt
"
"      	    AND emplt_doc_no = p_doc_no
"
"            AND emplt_assy_mark   IS NULL;
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"      IF cr1.emplt_part_mark   IS NULL
"
"      THEN
"
"
"
"         UPDATE engg_mig_part_ln_tmp
"
"            SET emplt_excp_reference = 'Part Mark must be entered.'
"
"          WHERE emplt_bu = p_bu
"
"      	    AND emplt_plnt = p_plnt
"
"      	    AND emplt_doc_no = p_doc_no
"
"            AND emplt_part_mark IS NULL;
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"
"
"      IF cr1.emplt_membr_desc IS NULL
"
"      THEN
"
"
"
"         UPDATE engg_mig_part_ln_tmp
"
"            SET emplt_excp_reference = 'Memeber Desc. must be entered.'
"
"          WHERE emplt_bu = p_bu
"
"      	    AND emplt_plnt = p_plnt
"
"      	    AND emplt_doc_no = p_doc_no
"
"            AND emplt_membr_desc IS NULL;
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"      IF cr1.emplt_uom IS NULL
"
"      THEN
"
"
"
"         UPDATE engg_mig_part_ln_tmp
"
"            SET emplt_excp_reference = 'UOM must be entered.'
"
"          WHERE emplt_bu = p_bu
"
"      	    AND emplt_plnt = p_plnt
"
"      	    AND emplt_doc_no = p_doc_no
"
"            AND emplt_uom IS NULL;
"
"
"
"         p_fail := 'N';
"
"
"
"      ELSE
"
"
"
"      	  OPEN c3(cr1.emplt_uom);
"
"      	  FETCH c3 INTO cr3;
"
"		   IF c3%NOTFOUND THEN
"
"
"
"			 UPDATE engg_mig_part_ln_tmp
"
"			    SET emplt_excp_reference = 'UOM Not Found .'
"
"			  WHERE emplt_bu = p_bu
"
"			    AND emplt_plnt = p_plnt
"
"			    AND emplt_doc_no = p_doc_no
"
"			    AND emplt_uom = cr1.emplt_uom;
"
"
"
"			p_fail := 'N';
"
"		   END IF;
"
"          CLOSE c3;
"
"
"
"      END IF;
"
"
"
"      IF (cr1.emplt_qty IS NULL OR cr1.emplt_qty < 0 OR cr1.emplt_qty = 0 )
"
"      THEN
"
"
"
"         UPDATE engg_mig_part_ln_tmp
"
"            SET emplt_excp_reference = 'Qty. should be greater than zero.'
"
"          WHERE emplt_bu = p_bu
"
"      	    AND emplt_plnt = p_plnt
"
"      	    AND emplt_doc_no = p_doc_no
"
"            AND (emplt_qty IS NULL OR emplt_qty < 0 OR emplt_qty = 0);
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"      IF cr1.emplt_member_size IS NULL
"
"      THEN
"
"
"
"         UPDATE engg_mig_part_ln_tmp
"
"            SET emplt_excp_reference = 'Memeber Size must be entered.'
"
"          WHERE emplt_bu = p_bu
"
"      	    AND emplt_plnt = p_plnt
"
"      	    AND emplt_doc_no = p_doc_no
"
"            AND emplt_member_size IS NULL;
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"      /*IF (cr1.emplt_length IS NULL OR cr1.emplt_length < 0 OR cr1.emplt_length = 0)
"
"      THEN
"
"
"
"         UPDATE engg_mig_part_ln_tmp
"
"            SET emplt_excp_reference = 'Length should be greater than zero.'
"
"          WHERE emplt_bu = p_bu
"
"      	    AND emplt_plnt = p_plnt
"
"      	    AND emplt_doc_no = p_doc_no
"
"      	    AND (emplt_length IS NULL OR emplt_length < 0 OR emplt_length = 0);
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"      IF cr1.emplt_material IS NULL
"
"      THEN
"
"
"
"         UPDATE engg_mig_part_ln_tmp
"
"            SET emplt_excp_reference = 'Material must be entered'
"
"          WHERE emplt_bu = p_bu
"
"      	    AND emplt_plnt = p_plnt
"
"      	    AND emplt_doc_no = p_doc_no
"
"      	    AND emplt_material IS NULL;
"
"
"
"         p_fail := 'N';
"
"      END IF;   */
"
"
"
"      IF (cr1.emplt_unit_wgt IS NULL OR cr1.emplt_unit_wgt < 0 OR cr1.emplt_unit_wgt = 0)
"
"      THEN
"
"
"
"         UPDATE engg_mig_part_ln_tmp
"
"            SET emplt_excp_reference = 'Unit weight should be greater than zero.'
"
"          WHERE emplt_bu = p_bu
"
"      	    AND emplt_plnt = p_plnt
"
"      	    AND emplt_doc_no = p_doc_no
"
"      	    AND (emplt_unit_wgt IS NULL OR emplt_unit_wgt < 0 OR emplt_unit_wgt = 0);
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"
"
"      IF (cr1.emplt_total_wgt IS NULL OR cr1.emplt_total_wgt < 0 OR cr1.emplt_total_wgt = 0)
"
"      THEN
"
"
"
"         UPDATE engg_mig_part_ln_tmp
"
"            SET emplt_excp_reference = 'Total weight should be greater than zero.'
"
"          WHERE emplt_bu = p_bu
"
"      	    AND emplt_plnt = p_plnt
"
"      	    AND emplt_doc_no = p_doc_no
"
"      	    AND (emplt_total_wgt IS NULL OR emplt_total_wgt < 0 OR emplt_total_wgt = 0);
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"      /*IF (cr1.emplt_unit_pnt_area IS NULL OR cr1.emplt_unit_pnt_area < 0 OR cr1.emplt_unit_pnt_area = 0)
"
"      THEN
"
"
"
"         UPDATE engg_mig_part_ln_tmp
"
"            SET emplt_excp_reference = 'Paint Area should be greater than zero.'
"
"          WHERE emplt_bu = p_bu
"
"      	    AND emplt_plnt = p_plnt
"
"      	    AND emplt_doc_no = p_doc_no
"
"      	    AND (emplt_unit_pnt_area IS NULL OR emplt_unit_pnt_area < 0 OR emplt_unit_pnt_area = 0);
"
"
"
"         p_fail := 'N';
"
"      END IF;
"
"
"
"      IF (cr1.emplt_total_pnt_area IS NULL OR cr1.emplt_total_pnt_area < 0 OR cr1.emplt_total_pnt_area = 0)
"
"      THEN
"
"
"
"         UPDATE engg_mig_part_ln_tmp
"
"            SET emplt_excp_reference = 'Paint Area should be greater than zero.'
"
"          WHERE emplt_bu = p_bu
"
"      	    AND emplt_plnt = p_plnt
"
"      	    AND emplt_doc_no = p_doc_no
"
"      	    AND (emplt_total_pnt_area IS NULL OR emplt_total_pnt_area < 0 OR emplt_total_pnt_area = 0);
"
"
"
"         p_fail := 'N';
"
"      END IF;  */
"
"
"
"      IF cr1.emplt_sub_seq_no  		IS NOT NULL AND
"
"         cr1.emplt_zone        		IS NOT NULL AND
"
"	 cr1.emplt_assy_mark   		IS NOT NULL AND
"
"	 cr1.emplt_part_mark   		IS NOT NULL AND
"
"	 cr1.emplt_membr_desc 		IS NOT NULL AND
"
"	 cr1.emplt_uom			IS NOT NULL AND
"
"	 cr1.emplt_qty         		> 0 AND
"
"	 cr1.emplt_member_size 		IS NOT NULL AND
"
"	 --cr1.emplt_length  			> 0 AND
"
"	 --cr1.emplt_material    		IS NOT NULL AND
"
"	 cr1.emplt_unit_wgt    		> 0 AND
"
"	 cr1.emplt_total_wgt   		> 0 --AND
"
"	 --cr1.emplt_unit_pnt_area  		> 0 AND
"
"	 --cr1.emplt_total_pnt_area   		> 0
"
"	 THEN
"
"
"
"         OPEN C4(cr1.emplt_sub_seq_no  	,
"
"		 cr1.emplt_zone        	,
"
"		 cr1.emplt_assy_mark   	,
"
"		 cr1.emplt_part_mark   	,
"
"		 cr1.emplt_membr_desc 	,
"
"		 cr1.emplt_uom		,
"
"		 cr1.emplt_qty         	,
"
"		 cr1.emplt_member_size 	,
"
"		 cr1.emplt_length  	 ,
"
"		 cr1.emplt_material    	 ,
"
"		 cr1.emplt_unit_wgt    	 ,
"
"		 cr1.emplt_total_wgt   	 ,
"
"		 cr1.emplt_unit_pnt_area  ,
"
"		 cr1.emplt_total_pnt_area ,
"
"		 cr1.emplt_reference
"
"                  );
"
"         FETCH C4 INTO CR4;
"
"
"
"		 IF C4%FOUND THEN
"
"
"
"			 UPDATE engg_mig_part_ln_tmp
"
"			    SET emplt_excp_reference = 'Record Already Exists.'
"
"			  WHERE emplt_bu 		= p_bu
"
"			    AND emplt_plnt 		= p_plnt
"
"			    AND emplt_doc_no 		= p_doc_no
"
"			    AND emplt_sub_seq_no        = cr1.emplt_sub_seq_no
"
"			    AND emplt_zone        	= cr1.emplt_zone
"
"			    AND emplt_assy_mark  	= cr1.emplt_assy_mark
"
"			    AND emplt_part_mark      	= cr1.emplt_part_mark
"
"			    AND emplt_membr_desc  	= cr1.emplt_membr_desc
"
"			    AND emplt_uom         	= cr1.emplt_uom
"
"			    AND emplt_qty         	= cr1.emplt_qty
"
"			    AND (emplt_member_size 	= cr1.emplt_member_size OR cr1.emplt_member_size IS NULL)
"
"			    AND (emplt_length  		= cr1.emplt_length 	OR cr1.emplt_length IS NULL)
"
"			    AND emplt_unit_wgt    	= cr1.emplt_unit_wgt
"
"			    AND emplt_total_wgt   	= cr1.emplt_total_wgt
"
"			    AND (emplt_unit_pnt_area  	= cr1.emplt_unit_pnt_area  OR cr1.emplt_unit_pnt_area IS NULL)
"
"			    AND (emplt_total_pnt_area  	= cr1.emplt_total_pnt_area OR cr1.emplt_total_pnt_area IS NULL)
"
"			    AND (emplt_reference 	= cr1.emplt_reference OR cr1.emplt_reference IS NULL);
"
"
"
"			    p_fail := 'N';
"
"
"
"		 ELSIF C4%NOTFOUND THEN
"
"
"
"			    OPEN C2(cr1.emplt_sub_seq_no  	,
"
"				 cr1.emplt_zone        	,
"
"				 cr1.emplt_assy_mark   	,
"
"				 cr1.emplt_part_mark   	,
"
"				 cr1.emplt_membr_desc 	,
"
"				 cr1.emplt_uom		,
"
"				 cr1.emplt_qty         	,
"
"				 cr1.emplt_member_size 	,
"
"				 cr1.emplt_length  	 ,
"
"				 cr1.emplt_material    	 ,
"
"				 cr1.emplt_unit_wgt    	 ,
"
"				 cr1.emplt_total_wgt   	 ,
"
"				 cr1.emplt_unit_pnt_area  ,
"
"				 cr1.emplt_total_pnt_area ,
"
"				 cr1.emplt_reference
"
"				  );
"
"			    FETCH c2 INTO cr2;
"
"				    IF C2%FOUND THEN
"
"
"
"				        UPDATE engg_mig_part_ln_tmp
"
"					    SET emplt_excp_reference = 'Duplicate Record.'
"
"					  WHERE emplt_bu 		= p_bu
"
"					    AND emplt_plnt 		= p_plnt
"
"					    AND emplt_doc_no 		= p_doc_no
"
"					    AND emplt_sub_seq_no        = cr1.emplt_sub_seq_no
"
"					    AND emplt_zone        	= cr1.emplt_zone
"
"					    AND emplt_assy_mark  	= cr1.emplt_assy_mark
"
"					    AND emplt_part_mark      	= cr1.emplt_part_mark
"
"					    AND emplt_membr_desc  	= cr1.emplt_membr_desc
"
"					    AND emplt_uom         	= cr1.emplt_uom
"
"					    AND emplt_qty         	= cr1.emplt_qty
"
"					    AND (emplt_member_size 	= cr1.emplt_member_size OR cr1.emplt_member_size IS NULL)
"
"					    AND (emplt_length  		= cr1.emplt_length      OR cr1.emplt_length IS NULL)
"
"					    AND emplt_unit_wgt    	= cr1.emplt_unit_wgt
"
"					    AND emplt_total_wgt   	= cr1.emplt_total_wgt
"
"					    AND (emplt_unit_pnt_area  	= cr1.emplt_unit_pnt_area  OR cr1.emplt_unit_pnt_area IS NULL)
"
"					    AND (emplt_total_pnt_area  	= cr1.emplt_total_pnt_area OR cr1.emplt_total_pnt_area IS NULL)
"
"					    AND (emplt_reference 	= cr1.emplt_reference OR cr1.emplt_reference IS NULL);
"
"
"
"				       p_fail := 'N';
"
"				    END IF;
"
"			    CLOSE c2;
"
"		 ELSE
"
"
"
"				        UPDATE engg_mig_part_ln_tmp
"
"					    SET emplt_excp_reference = ' '
"
"					  WHERE emplt_bu 		= p_bu
"
"					    AND emplt_plnt 		= p_plnt
"
"					    AND emplt_doc_no 		= p_doc_no
"
"					    AND emplt_sub_seq_no       = cr1.emplt_sub_seq_no
"
"					    AND emplt_zone        	= cr1.emplt_zone
"
"					    AND emplt_assy_mark  	= cr1.emplt_assy_mark
"
"					    AND emplt_part_mark      	= cr1.emplt_part_mark
"
"					    AND emplt_membr_desc  	= cr1.emplt_membr_desc
"
"					    AND emplt_uom         	= cr1.emplt_uom
"
"					    AND emplt_qty         	= cr1.emplt_qty
"
"					    AND (emplt_member_size 	= cr1.emplt_member_size OR cr1.emplt_member_size IS NULL)
"
"					    AND (emplt_length  		= cr1.emplt_length OR cr1.emplt_length IS NULL)
"
"					    AND emplt_unit_wgt    	= cr1.emplt_unit_wgt
"
"					    AND emplt_total_wgt   	= cr1.emplt_total_wgt
"
"					    AND (emplt_unit_pnt_area  	= cr1.emplt_unit_pnt_area  OR cr1.emplt_unit_pnt_area IS NULL)
"
"					    AND (emplt_total_pnt_area  	= cr1.emplt_total_pnt_area OR cr1.emplt_total_pnt_area IS NULL)
"
"					    AND (emplt_reference 	= cr1.emplt_reference OR cr1.emplt_reference IS NULL);
"
"
"
"			    p_fail := 'Y';
"
"		 END IF;
"
"
"
"         CLOSE C4;
"
"
"
"      END IF;
"
"   END LOOP c1;
"
"END proc_chk_asmbly_part;
"
"
"
"
"
"		/* Insert Assembly Part */
"
"
"
"PROCEDURE proc_ins_asmbly_part (p_bu 		VARCHAR2,
"
"  					          p_plnt  	VARCHAR2,
"
"  					          p_doc_no  	VARCHAR2,
"
"						  p_user 	VARCHAR2)
"
"IS
"
"CURSOR C1
"
"    IS
"
"SELECT  emplt_bu               ,
"
"	emplt_plnt             ,
"
"	emplt_doc_no           ,
"
"	emplt_sub_seq_no       ,
"
"	emplt_zone             ,
"
"	emplt_assy_mark        ,
"
"	emplt_part_mark        ,
"
"	emplt_membr_desc       ,
"
"	emplt_uom	       ,
"
"	emplt_qty              ,
"
"	emplt_member_size      ,
"
"	emplt_length           ,
"
"	emplt_material         ,
"
"	emplt_unit_wgt         ,
"
"	emplt_total_wgt        ,
"
"	emplt_unit_pnt_area    ,
"
"	emplt_total_pnt_area   ,
"
"	emplt_reference
"
"  FROM engg_mig_part_ln_tmp
"
" WHERE emplt_bu = p_bu
"
"   AND emplt_plnt = p_plnt
"
"   AND emplt_doc_no = p_doc_no;
"
"
"
"
"
"   v_seq_no  NUMBER(5);
"
"
"
"BEGIN
"
"   FOR cr1 IN c1
"
"   LOOP
"
"
"
"
"
"	SELECT NVL(MAX(empl_seq_no),0)+1
"
"	  INTO v_seq_no
"
"	  FROM engg_mig_part_ln
"
"	 WHERE empl_bu = p_bu
"
"	   AND empl_plnt = p_plnt
"
"	   AND empl_doc_no = p_doc_no;
"
"
"
"
"
"           INSERT INTO engg_mig_part_ln(empl_bu                ,
"
"					empl_plnt              ,
"
"					empl_doc_no            ,
"
"					empl_seq_no            ,
"
"					empl_sub_seq_no        ,
"
"					empl_zone              ,
"
"					empl_assy_mark         ,
"
"					empl_part_mark         ,
"
"					empl_membr_desc        ,
"
"					empl_uom	       ,
"
"					empl_qty               ,
"
"					empl_member_size       ,
"
"					empl_length            ,
"
"					empl_material          ,
"
"					empl_unit_wgt          ,
"
"					empl_total_wgt         ,
"
"					empl_unit_pnt_area     ,
"
"					empl_total_pnt_area    ,
"
"					empl_reference         ,
"
"					empl_cre_by            ,
"
"					empl_cre_emp_id        ,
"
"					empl_cre_ip_addr       ,
"
"					empl_cre_os_user       ,
"
"					empl_cre_date  )
"
"				   VALUES (p_bu,					--empl_bu
"
"					   p_plnt,					--empl_plnt
"
"					   p_doc_no,					--empl_doc_no
"
"					   v_seq_no,					--empl_seq_no
"
"					   cr1.emplt_sub_seq_no          ,		--empl_sub_seq_no
"
"					   cr1.emplt_zone    ,				--empl_zone
"
"					   cr1.emplt_assy_mark        ,			--empl_assy_mark
"
"					   cr1.emplt_part_mark    ,			--empl_part_mark
"
"					   cr1.emplt_membr_desc   ,			--empl_membr_desc
"
"					   cr1.emplt_uom           ,			--empl_uom
"
"					   NVL(cr1.emplt_qty,0)           ,		--empl_qty
"
"					   cr1.emplt_member_size   ,			--empl_member_size
"
"					   NVL(cr1.emplt_length,0)    ,			--empl_length
"
"					   cr1.emplt_material      ,			--empl_material
"
"					   NVL(cr1.emplt_unit_wgt,0)     ,		--empl_unit_wgt
"
"					   NVL(cr1.emplt_total_wgt,0)    ,		--empl_total_wgt
"
"					   NVL(cr1.emplt_unit_pnt_area,0)     ,		--empl_unit_pnt_area
"
"					   NVL(cr1.emplt_total_pnt_area,0)     ,	--empl_total_pnt_area
"
"					   cr1.emplt_reference     ,			--empl_reference
"
"					   p_user,  					--empl_cre_by
"
"					   func_find_emp_id(p_bu,p_user),		--empl_cre_emp_id
"
"					   audit_info.get_ip_address,			--empl_cre_ip_addr
"
"					   audit_info.get_os_user,			--empl_cre_os_user
"
"					   SYSDATE);					--empl_cre_date
"
"
"
"       END LOOP;
"
"
"
"        DELETE engg_mig_part_ln_tmp
"
"	 WHERE emplt_bu = p_bu
"
"	   AND emplt_plnt = p_plnt
"
"	   AND emplt_doc_no = p_doc_no;
"
"
"
"END proc_ins_asmbly_part;
"
"
"
"END pkg_upload_assembly;
"
/
