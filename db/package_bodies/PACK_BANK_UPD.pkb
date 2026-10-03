CREATE OR REPLACE
"PACKAGE BODY        pack_bank_upd
"
"AS
"
"   PROCEDURE proc_ins_upd_addr (p_bu          VARCHAR2,--ADDRESS START
"
"                                p_bank_id     VARCHAR,
"
"                                p_user        VARCHAR2,
"
"                                p_upd_type    VARCHAR2)
"
"   IS
"
"      v_doc_no   BANK_edit_hd.behd_doc_no%TYPE;
"
"   BEGIN
"
"      DELETE BANK_EDIT_HD
"
"       WHERE     behd_bu = p_bu
"
"             AND behd_status = 'E'
"
"             AND behd_bank_id = p_bank_id
"
"             AND behd_upd_type = p_upd_type;
"
"
"
"      IF SQL%FOUND
"
"      THEN
"
"         ROLLBACK;
"
"
"
"         BEGIN
"
"            SELECT TO_NUMBER (BEHD_DOC_NO)
"
"              INTO v_doc_no
"
"              FROM bank_edit_hd
"
"             WHERE behd_bu = p_bu
"
"               AND behd_status = 'E'
"
"               AND behd_bank_id = p_bank_id
"
"               AND behd_upd_type = p_upd_type;
"
"         EXCEPTION
"
"            WHEN NO_DATA_FOUND
"
"            THEN
"
"               v_doc_no := NULL;
"
"         END;
"
"
"
"         DELETE bank_edit_hd
"
"          WHERE behd_bu = p_bu
"
"            AND behd_status = 'E'
"
"            AND behd_bank_id = p_bank_id
"
"            AND behd_upd_type = p_upd_type;
"
"      END IF;
"
"
"
"      IF v_doc_no IS NULL
"
"      THEN
"
"         SELECT NVL (MAX (TO_NUMBER (BEHD_DOC_NO)), 1000000000) + 1
"
"           INTO v_doc_no
"
"           FROM bank_edit_hd
"
"          WHERE behd_bu = p_bu AND behd_bank_id = p_bank_id;
"
"      END IF;
"
"
"
"      INSERT INTO bank_edit_hd (behd_bu,
"
"                                behd_doc_no,
"
"                                behd_doc_date,
"
"                                behd_bank_id,
"
"                                behd_status,
"
"                                behd_cre_by,
"
"                                behd_cre_ip_addr,
"
"                                behd_cre_os_user,
"
"                                behd_cre_date,
"
"                                behd_upd_type)
"
"           VALUES (p_bu,
"
"                   v_doc_no,
"
"                   SYSDATE,
"
"                   p_bank_id,
"
"                   'E',
"
"                   p_user,
"
"                   audit_info.get_ip_address,
"
"                   audit_info.get_os_user,
"
"                   SYSDATE,
"
"                   p_upd_type);
"
"   END proc_ins_upd_addr;
"
"
"
"   --ADDRESS END
"
"   --Prefix START
"
"   PROCEDURE proc_ins_upd_Prefix (p_bu          VARCHAR2,
"
"                                  p_bank_id     VARCHAR,
"
"                                  p_user        VARCHAR2,
"
"                                  p_upd_type    VARCHAR2)
"
"   IS
"
"      v_doc_no   BANK_edit_hd.behd_doc_no%TYPE;
"
"   BEGIN
"
"      DELETE BANK_EDIT_HD
"
"       WHERE     behd_bu = p_bu
"
"             AND behd_status = 'E'
"
"             AND behd_bank_id = p_bank_id
"
"             AND behd_upd_type = p_upd_type;
"
"
"
"      IF SQL%FOUND
"
"      THEN
"
"         ROLLBACK;
"
"
"
"         BEGIN
"
"            SELECT TO_NUMBER (BEHD_DOC_NO)
"
"              INTO v_doc_no
"
"              FROM bank_edit_hd
"
"             WHERE     BEHD_BU = p_bu
"
"                   AND BEHD_STATUS = 'E'
"
"                   AND BEHD_BANK_ID = p_bank_id
"
"                   AND behd_upd_type = p_upd_type;
"
"         EXCEPTION
"
"            WHEN NO_DATA_FOUND
"
"            THEN
"
"               v_doc_no := NULL;
"
"         END;
"
"
"
"         DELETE bank_edit_hd
"
"          WHERE     BEHD_BU = p_bu
"
"                AND BEHD_STATUS = 'E'
"
"                AND BEHD_BANK_ID = p_bank_id
"
"                AND behd_upd_type = p_upd_type;
"
"      END IF;
"
"
"
"      IF v_doc_no IS NULL
"
"      THEN
"
"         SELECT NVL (MAX (TO_NUMBER (BEHD_DOC_NO)), 1000000000) + 1
"
"           INTO v_doc_no
"
"           FROM BANK_EDIT_HD
"
"          WHERE behd_bu = p_bu AND behd_bank_id = p_bank_id;
"
"      END IF;
"
"
"
"      INSERT INTO bank_edit_hd (behd_bu,
"
"                                behd_doc_no,
"
"                                behd_doc_date,
"
"                                behd_bank_id,
"
"                                behd_status,
"
"                                behd_cre_by,
"
"                                behd_cre_ip_addr,
"
"                                behd_cre_os_user,
"
"                                behd_cre_date,
"
"                                behd_upd_type)
"
"           VALUES (p_bu,
"
"                   v_doc_no,
"
"                   SYSDATE,
"
"                   p_bank_id,
"
"                   'E',
"
"                   p_user,
"
"                   audit_info.get_ip_address,
"
"                   audit_info.get_os_user,
"
"                   SYSDATE,
"
"                   p_upd_type);
"
"   END proc_ins_upd_Prefix;
"
"
"
"   --Prefix END
"
"
"
"   --GL ACCOUNT START
"
"   PROCEDURE proc_ins_upd_gl_acct (p_bu          VARCHAR2,
"
"                                   p_bank_id     VARCHAR,
"
"                                   p_user        VARCHAR2,
"
"                                   p_upd_type    VARCHAR2)
"
"   IS
"
"      v_doc_no   BANK_edit_hd.behd_doc_no%TYPE;
"
"   BEGIN
"
"      DELETE BANK_EDIT_HD
"
"       WHERE     behd_bu = p_bu
"
"             AND behd_status = 'E'
"
"             AND behd_bank_id = p_bank_id
"
"             AND behd_upd_type = p_upd_type;
"
"
"
"      IF SQL%FOUND
"
"      THEN
"
"         ROLLBACK;
"
"
"
"         BEGIN
"
"            SELECT TO_NUMBER (BEHD_DOC_NO)
"
"              INTO v_doc_no
"
"              FROM bank_edit_hd
"
"             WHERE     BEHD_BU = p_bu
"
"                   AND BEHD_STATUS = 'E'
"
"                   AND BEHD_BANK_ID = p_bank_id
"
"                   AND behd_upd_type = p_upd_type;
"
"         EXCEPTION
"
"            WHEN NO_DATA_FOUND
"
"            THEN
"
"               v_doc_no := NULL;
"
"         END;
"
"
"
"         DELETE bank_edit_hd
"
"          WHERE     BEHD_BU = p_bu
"
"                AND BEHD_STATUS = 'E'
"
"                AND BEHD_BANK_ID = p_bank_id
"
"                AND behd_upd_type = p_upd_type;
"
"      END IF;
"
"
"
"      IF v_doc_no IS NULL
"
"      THEN
"
"         SELECT NVL (MAX (TO_NUMBER (BEHD_DOC_NO)), 1000000000) + 1
"
"           INTO v_doc_no
"
"           FROM BANK_EDIT_HD
"
"          WHERE behd_bu = p_bu AND behd_bank_id = p_bank_id;
"
"      END IF;
"
"
"
"      INSERT INTO bank_edit_hd (behd_bu,
"
"                                behd_doc_no,
"
"                                behd_doc_date,
"
"                                behd_bank_id,
"
"                                behd_status,
"
"                                behd_cre_by,
"
"                                behd_cre_ip_addr,
"
"                                behd_cre_os_user,
"
"                                behd_cre_date,
"
"                                behd_upd_type)
"
"           VALUES (p_bu,
"
"                   v_doc_no,
"
"                   SYSDATE,
"
"                   p_bank_id,
"
"                   'E',
"
"                   p_user,
"
"                   audit_info.get_ip_address,
"
"                   audit_info.get_os_user,
"
"                   SYSDATE,
"
"                   p_upd_type);
"
"   END proc_ins_upd_gl_acct;
"
"
"
"   --GL ACCOUNT END
"
"
"
"   --CONTACT START
"
"   PROCEDURE proc_ins_upd_contact (p_bu          VARCHAR2,
"
"                                   p_bank_id     VARCHAR,
"
"                                   p_user        VARCHAR2,
"
"                                   p_upd_type    VARCHAR2)
"
"   IS
"
"      v_doc_no   BANK_edit_hd.behd_doc_no%TYPE;
"
"   BEGIN
"
"      DELETE BANK_EDIT_HD
"
"       WHERE     behd_bu = p_bu
"
"             AND behd_status = 'E'
"
"             AND behd_bank_id = p_bank_id
"
"             AND behd_upd_type = p_upd_type;
"
"
"
"      IF SQL%FOUND
"
"      THEN
"
"         ROLLBACK;
"
"
"
"         BEGIN
"
"            SELECT TO_NUMBER (BEHD_DOC_NO)
"
"              INTO v_doc_no
"
"              FROM bank_edit_hd
"
"             WHERE     BEHD_BU = p_bu
"
"                   AND BEHD_STATUS = 'E'
"
"                   AND BEHD_BANK_ID = p_bank_id
"
"                   AND behd_upd_type = p_upd_type;
"
"         EXCEPTION
"
"            WHEN NO_DATA_FOUND
"
"            THEN
"
"               v_doc_no := NULL;
"
"         END;
"
"
"
"         DELETE bank_edit_hd
"
"          WHERE     BEHD_BU = p_bu
"
"                AND BEHD_STATUS = 'E'
"
"                AND BEHD_BANK_ID = p_bank_id
"
"                AND behd_upd_type = p_upd_type;
"
"      END IF;
"
"
"
"      IF v_doc_no IS NULL
"
"      THEN
"
"         SELECT NVL (MAX (TO_NUMBER (BEHD_DOC_NO)), 1000000000) + 1
"
"           INTO v_doc_no
"
"           FROM BANK_EDIT_HD
"
"          WHERE behd_bu = p_bu AND behd_bank_id = p_bank_id;
"
"      END IF;
"
"
"
"      INSERT INTO bank_edit_hd (behd_bu,
"
"                                behd_doc_no,
"
"                                behd_doc_date,
"
"                                behd_bank_id,
"
"                                behd_status,
"
"                                behd_cre_by,
"
"                                behd_cre_ip_addr,
"
"                                behd_cre_os_user,
"
"                                behd_cre_date,
"
"                                behd_upd_type)
"
"           VALUES (p_bu,
"
"                   v_doc_no,
"
"                   SYSDATE,
"
"                   p_bank_id,
"
"                   'E',
"
"                   p_user,
"
"                   audit_info.get_ip_address,
"
"                   audit_info.get_os_user,
"
"                   SYSDATE,
"
"                   p_upd_type);
"
"   END proc_ins_upd_contact;
"
"
"
"   --CONTACT END
"
"
"
"   --Credit_Limit START
"
"   PROCEDURE proc_ins_upd_Credit_Limit (p_bu          VARCHAR2,
"
"                                        p_bank_id     VARCHAR,
"
"                                        p_user        VARCHAR2,
"
"                                        p_upd_type    VARCHAR2)
"
"   IS
"
"      v_doc_no   BANK_edit_hd.behd_doc_no%TYPE;
"
"   BEGIN
"
"      DELETE BANK_EDIT_HD
"
"       WHERE     behd_bu = p_bu
"
"             AND behd_status = 'E'
"
"             AND behd_bank_id = p_bank_id
"
"             AND behd_upd_type = p_upd_type;
"
"
"
"      IF SQL%FOUND
"
"      THEN
"
"         ROLLBACK;
"
"
"
"         BEGIN
"
"            SELECT TO_NUMBER (BEHD_DOC_NO)
"
"              INTO v_doc_no
"
"              FROM bank_edit_hd
"
"             WHERE     BEHD_BU = p_bu
"
"                   AND BEHD_STATUS = 'E'
"
"                   AND BEHD_BANK_ID = p_bank_id
"
"                   AND behd_upd_type = p_upd_type;
"
"         EXCEPTION
"
"            WHEN NO_DATA_FOUND
"
"            THEN
"
"               v_doc_no := NULL;
"
"         END;
"
"
"
"         DELETE bank_edit_hd
"
"          WHERE     BEHD_BU = p_bu
"
"                AND BEHD_STATUS = 'E'
"
"                AND BEHD_BANK_ID = p_bank_id
"
"                AND behd_upd_type = p_upd_type;
"
"      END IF;
"
"
"
"      IF v_doc_no IS NULL
"
"      THEN
"
"         SELECT NVL (MAX (TO_NUMBER (BEHD_DOC_NO)), 1000000000) + 1
"
"           INTO v_doc_no
"
"           FROM BANK_EDIT_HD
"
"          WHERE behd_bu = p_bu AND behd_bank_id = p_bank_id;
"
"      END IF;
"
"
"
"      INSERT INTO bank_edit_hd (behd_bu,
"
"                                behd_doc_no,
"
"                                behd_doc_date,
"
"                                behd_bank_id,
"
"                                behd_status,
"
"                                behd_cre_by,
"
"                                behd_cre_ip_addr,
"
"                                behd_cre_os_user,
"
"                                behd_cre_date,
"
"                                behd_upd_type)
"
"           VALUES (p_bu,
"
"                   v_doc_no,
"
"                   SYSDATE,
"
"                   p_bank_id,
"
"                   'E',
"
"                   p_user,
"
"                   audit_info.get_ip_address,
"
"                   audit_info.get_os_user,
"
"                   SYSDATE,
"
"                   p_upd_type);
"
"   END proc_ins_upd_Credit_Limit;
"
"
"
"   --Credit_Limit END
"
"   --CHEQ START
"
"
"
"   PROCEDURE proc_ins_upd_cheq (p_bu          VARCHAR2,
"
"                                p_bank_id     VARCHAR,
"
"                                p_user        VARCHAR2,
"
"                                p_upd_type    VARCHAR2)
"
"   IS
"
"      v_doc_no   BANK_edit_hd.behd_doc_no%TYPE;
"
"   BEGIN
"
"      DELETE BANK_EDIT_HD
"
"       WHERE     behd_bu = p_bu
"
"             AND behd_status = 'E'
"
"             AND behd_bank_id = p_bank_id
"
"             AND behd_upd_type = p_upd_type;
"
"
"
"      IF SQL%FOUND
"
"      THEN
"
"         ROLLBACK;
"
"
"
"         BEGIN
"
"            SELECT TO_NUMBER (BEHD_DOC_NO)
"
"              INTO v_doc_no
"
"              FROM bank_edit_hd
"
"             WHERE     BEHD_BU = p_bu
"
"                   AND BEHD_STATUS = 'E'
"
"                   AND BEHD_BANK_ID = p_bank_id
"
"                   AND behd_upd_type = p_upd_type;
"
"         EXCEPTION
"
"            WHEN NO_DATA_FOUND
"
"            THEN
"
"               v_doc_no := NULL;
"
"         END;
"
"
"
"         DELETE bank_edit_hd
"
"          WHERE     BEHD_BU = p_bu
"
"                AND BEHD_STATUS = 'E'
"
"                AND BEHD_BANK_ID = p_bank_id
"
"                AND behd_upd_type = p_upd_type;
"
"      END IF;
"
"
"
"      IF v_doc_no IS NULL
"
"      THEN
"
"         SELECT NVL (MAX (TO_NUMBER (BEHD_DOC_NO)), 1000000000) + 1
"
"           INTO v_doc_no
"
"           FROM BANK_EDIT_HD
"
"          WHERE behd_bu = p_bu AND behd_bank_id = p_bank_id;
"
"      END IF;
"
"
"
"      INSERT INTO bank_edit_hd (behd_bu,
"
"                                behd_doc_no,
"
"                                behd_doc_date,
"
"                                behd_bank_id,
"
"                                behd_status,
"
"                                behd_cre_by,
"
"                                behd_cre_ip_addr,
"
"                                behd_cre_os_user,
"
"                                behd_cre_date,
"
"                                behd_upd_type)
"
"           VALUES (p_bu,
"
"                   v_doc_no,
"
"                   SYSDATE,
"
"                   p_bank_id,
"
"                   'E',
"
"                   p_user,
"
"                   audit_info.get_ip_address,
"
"                   audit_info.get_os_user,
"
"                   SYSDATE,
"
"                   p_upd_type);
"
"   END proc_ins_upd_cheq;
"
"
"
"   --CHEQ END
"
"   ---------------------------------------------------------------
"
"   PROCEDURE proc_ins_bank_edit_temp (p_bu            VARCHAR2,
"
"                                      p_bank_id       VARCHAR2,
"
"                                      p_doc_no        VARCHAR2,
"
"                                      p_user          VARCHAR2,
"
"                                      p_lang          VARCHAR2,
"
"                                      p_user_sid      NUMBER,
"
"                                      p_particular    VARCHAR2,
"
"                                      p_select        VARCHAR2,
"
"                                      p_unit          VARCHAR2)
"
"   IS
"
"      CURSOR c1
"
"      IS
"
"         SELECT *
"
"           FROM banks
"
"          WHERE     bank_bu = p_bu
"
"                AND BANK_ID = p_bank_id
"
"                AND BANK_ACTV_FLAG = 'Y';
"
"
"
"      CURSOR C2
"
"      IS
"
"         SELECT *
"
"           FROM bank_contacts
"
"          WHERE     bc_bu = p_bu
"
"                AND bc_bank_id = p_bank_id
"
"                AND (bc_seq_no = p_select OR p_select IS NULL);
"
"
"
"      CURSOR C3
"
"      IS
"
"         SELECT *
"
"           FROM bank_check_book_hd
"
"          WHERE bcbhd_bu = p_bu
"
"            AND bcbhd_bank_id = p_bank_id
"
"            AND (bcbhd_book_no = p_select OR p_select IS NULL);
"
"
"
"      CURSOR C3a(c_bank_id   VARCHAR2,c_book_no  VARCHAR2)
"
"      IS
"
"         SELECT *
"
"           FROM bank_check_book_ln
"
"          WHERE bcbln_bu = p_bu
"
"            AND bcbln_bank_id = c_bank_id
"
"            AND bcbln_book_no = c_book_no
"
"            AND (bcbln_status NOT IN('X','C','D','I','N','V') OR BCBLN_STATUS IS NULL);
"
"
"
"      CURSOR C4
"
"      IS
"
"         SELECT *
"
"           FROM bank_trans_pfx
"
"          WHERE     btp_bu = p_bu
"
"                AND btp_bank_id = p_bank_id
"
"                AND (BTP_TRANS_PFX = p_select OR p_select IS NULL);
"
"
"
"      CURSOR C5
"
"      IS
"
"         SELECT *
"
"           FROM BANK_PLANT_ACCTS
"
"          WHERE BPLA_BU = p_bu AND BPLA_BANK_ID = p_bank_id;
"
"
"
"      CURSOR C6
"
"      IS
"
"         SELECT *
"
"           FROM BANK_CREDIT_LIMITS
"
"          WHERE     BCL_BU = p_bu
"
"          AND BCL_BANK_ID = p_bank_id
"
"          AND (BCL_CURRENCY = p_select OR p_select IS NULL); --p_bank_id;
"
"
"
"
"
"
"
"      v_seq_no   NUMBER (5);
"
"
"
"      cr2        c2%ROWTYPE;
"
"      cr3        c3%ROWTYPE;
"
"      cr4        c4%ROWTYPE;
"
"      cr5        c5%ROWTYPE;
"
"      cr6        c6%ROWTYPE;
"
"   BEGIN
"
"      DELETE FROM bank_edit_temp
"
"            WHERE     bank_bu = p_bu
"
"                  AND bank_id = p_bank_id
"
"                  AND bank_doc_no = p_doc_no;
"
"
"
"      DELETE FROM bank_credit_limits_edit_temp
"
"            WHERE     BCLET_BU = p_bu
"
"                  AND BCLET_BANK_ID = p_bank_id
"
"                  AND BCLET_DOC_NO = p_doc_no;
"
"
"
"      DELETE FROM bank_contact_edit_temp
"
"            WHERE     bced_bu = p_bu
"
"                  AND bced_bank_id = p_bank_id
"
"                  AND bced_doc_no = p_doc_no;
"
"
"
"      DELETE FROM BANK_TRANS_PFX_EDIT_TEMP
"
"            WHERE     BTPET_BU = p_bu
"
"                  AND BTPET_BANK_ID = p_bank_id
"
"                  AND BTPET_DOC_NO = p_doc_no;
"
"
"
"      DELETE FROM bank_check_book_hd_edit_temp
"
"            WHERE     BCBHDET_BU = p_bu
"
"                  AND BCBHDET_BANK_ID = p_bank_id
"
"                  AND BCBHDET_DOC_NO = p_doc_no;
"
"
"
"      DELETE FROM bank_check_book_ln_temp
"
"            WHERE BCBLN_BU = p_bu
"
"              AND BCBLN_BANK_ID = p_bank_id
"
"              AND BCBLN_DOC_NO = p_doc_no;
"
"
"
"      DELETE FROM bank_plant_accts_edit_temp
"
"            WHERE     BPLAET_BU = p_bu
"
"                  AND BPLAET_BANK_ID = p_bank_id
"
"                  AND BPLAET_DOC_NO = p_doc_no;
"
"
"
"      IF p_particular IN ('ADDRESS')
"
"      THEN
"
"         FOR cr1 IN c1
"
"         LOOP
"
"            INSERT INTO bank_edit_temp (BANK_BU,
"
"                                        BANK_ID,
"
"                                        BANK_ACCT_NO,
"
"                                        BANK_NAME1,
"
"                                        BANK_NAME2,
"
"                                        BANK_ADDR1,
"
"                                        BANK_ADDR2,
"
"                                        BANK_ADDR3,
"
"                                        BANK_PO_BOX,
"
"                                        BANK_CITY,
"
"                                        BANK_STATE,
"
"                                        BANK_COUNTRY,
"
"                                        BANK_ZIP,
"
"                                        BANK_CURRENCY,
"
"                                        BANK_TELE1,
"
"                                        BANK_TELE2,
"
"                                        BANK_FAX1,
"
"                                        BANK_FAX2,
"
"                                        BANK_EMAIL1,
"
"                                        BANK_EMAIL2,
"
"                                        BANK_WEBSITE1,
"
"                                        BANK_WEBSITE2,
"
"                                        BANK_NEXT_CHECK_NO,
"
"                                        BANK_CUR_BAL,
"
"                                        BANK_OD_LIMIT,
"
"                                        BANK_RT_PFX,
"
"                                        BANK_PT_PFX,
"
"                                        BANK_OT_PFX,
"
"                                        BANK_VH_PFX,
"
"                                        BANK_BDAVBL_AMT,
"
"                                        BANK_BDAVLD_AMT,
"
"                                        BANK_ACCT_TYPE,
"
"                                        BANK_PAY_BANK,
"
"                                        BANK_PAY_BANK_BR,
"
"                                        BANK_SCS_SOURCE,
"
"                                        BANK_REPORT_ID,
"
"                                        BANK_PLANT,
"
"                                        BANK_CHRG_PFX,
"
"                                        BANK_ERNG_PFX,
"
"                                        BANK_IT_PFX,
"
"                                        BANK_IFSC_CODE,
"
"                                        BANK_SWIFT_BIC_CODE,
"
"                                        BANK_BSR_CODE,
"
"                                        BANK_LGR_GRP,
"
"                                        BANK_OD_DIV_USG_FLAG,
"
"                                        BANK_ACTV_FLAG,
"
"                                        BANK_IN_FAVOR_OF_PFX,
"
"                                        BANK_LGR_GRP_ISU,
"
"                                        BANK_LGR_GRP_RCPT,
"
"                                        BANK_PRNT_CAPN,
"
"                                        BANK_IBAN_NO,
"
"                                        BANK_MICR_CODE,
"
"                                        BANK_CRE_BY,
"
"                                        BANK_CRE_IP_ADDR,
"
"                                        BANK_CRE_OS_USER,
"
"                                        BANK_CRE_DATE,
"
"                                        BANK_UPD_BY,
"
"                                        BANK_UPD_IP_ADDR,
"
"                                        BANK_UPD_OS_USER,
"
"                                        BANK_UPD_DATE,
"
"                                        BANK_CRE_EMP_ID,
"
"                                        BANK_UPD_EMP_ID,
"
"                                        BANK_AUTO_REC_NARR,
"
"                                        BANK_AUTO_REC_REF,
"
"                                        BANK_PLNT_LOC_ID,
"
"                                        BANK_ALLOW_NGV_BAL,
"
"                                        BANK_DOC_NO,
"
"                                        BANK_DOC_STATUS,
"
"                                        BANK_AD_CODE)
"
"                 VALUES (cr1.BANK_BU,
"
"                         cr1.BANK_ID,
"
"                         cr1.BANK_ACCT_NO,
"
"                         cr1.BANK_NAME1,
"
"                         cr1.BANK_NAME2,
"
"                         cr1.BANK_ADDR1,
"
"                         cr1.BANK_ADDR2,
"
"                         cr1.BANK_ADDR3,
"
"                         cr1.BANK_PO_BOX,
"
"                         cr1.BANK_CITY,
"
"                         cr1.BANK_STATE,
"
"                         cr1.BANK_COUNTRY,
"
"                         cr1.BANK_ZIP,
"
"                         cr1.BANK_CURRENCY,
"
"                         cr1.BANK_TELE1,
"
"                         cr1.BANK_TELE2,
"
"                         cr1.BANK_FAX1,
"
"                         cr1.BANK_FAX2,
"
"                         cr1.BANK_EMAIL1,
"
"                         cr1.BANK_EMAIL2,
"
"                         cr1.BANK_WEBSITE1,
"
"                         cr1.BANK_WEBSITE2,
"
"                         cr1.BANK_NEXT_CHECK_NO,
"
"                         cr1.BANK_CUR_BAL,
"
"                         cr1.BANK_OD_LIMIT,
"
"                         cr1.BANK_RT_PFX,
"
"                         cr1.BANK_PT_PFX,
"
"                         cr1.BANK_OT_PFX,
"
"                         cr1.BANK_VH_PFX,
"
"                         cr1.BANK_BDAVBL_AMT,
"
"                         cr1.BANK_BDAVLD_AMT,
"
"                         cr1.BANK_ACCT_TYPE,
"
"                         cr1.BANK_PAY_BANK,
"
"                         cr1.BANK_PAY_BANK_BR,
"
"                         cr1.BANK_SCS_SOURCE,
"
"                         cr1.BANK_REPORT_ID,
"
"                         cr1.BANK_PLANT,
"
"                         cr1.BANK_CHRG_PFX,
"
"                         cr1.BANK_ERNG_PFX,
"
"                         cr1.BANK_IT_PFX,
"
"                         cr1.BANK_IFSC_CODE,
"
"                         cr1.BANK_SWIFT_BIC_CODE,
"
"                         cr1.BANK_BSR_CODE,
"
"                         cr1.BANK_LGR_GRP,
"
"                         cr1.BANK_OD_DIV_USG_FLAG,
"
"                         cr1.BANK_ACTV_FLAG,
"
"                         cr1.BANK_IN_FAVOR_OF_PFX,
"
"                         cr1.BANK_LGR_GRP_ISU,
"
"                         cr1.BANK_LGR_GRP_RCPT,
"
"                         cr1.BANK_PRNT_CAPN,
"
"                         cr1.BANK_IBAN_NO,
"
"                         cr1.BANK_MICR_CODE,
"
"                         cr1.BANK_CRE_BY,
"
"                         cr1.BANK_CRE_IP_ADDR,
"
"                         cr1.BANK_CRE_OS_USER,
"
"                         cr1.BANK_CRE_DATE,
"
"                         cr1.BANK_UPD_BY,
"
"                         cr1.BANK_UPD_IP_ADDR,
"
"                         cr1.BANK_UPD_OS_USER,
"
"                         cr1.BANK_UPD_DATE,
"
"                         cr1.BANK_CRE_EMP_ID,
"
"                         cr1.BANK_UPD_EMP_ID,
"
"                         cr1.BANK_AUTO_REC_NARR,
"
"                         cr1.BANK_AUTO_REC_REF,
"
"                         cr1.BANK_PLNT_LOC_ID,
"
"                         cr1.BANK_ALLOW_NGV_BAL,--cr1.BANK_AUTO_REC_NARR,
"
"                         p_doc_no,
"
"                         'C',                                          --STATUS
"
"                         cr1.BANK_AD_CODE
"
"                            );
"
"
"
"            INSERT INTO bank_edit_temp (BANK_BU,
"
"                                        BANK_ID,
"
"                                        BANK_ACCT_NO,
"
"                                        BANK_NAME1,
"
"                                        BANK_NAME2,
"
"                                        BANK_ADDR1,
"
"                                        BANK_ADDR2,
"
"                                        BANK_ADDR3,
"
"                                        BANK_PO_BOX,
"
"                                        BANK_CITY,
"
"                                        BANK_STATE,
"
"                                        BANK_COUNTRY,
"
"                                        BANK_ZIP,
"
"                                        BANK_CURRENCY,
"
"                                        BANK_TELE1,
"
"                                        BANK_TELE2,
"
"                                        BANK_FAX1,
"
"                                        BANK_FAX2,
"
"                                        BANK_EMAIL1,
"
"                                        BANK_EMAIL2,
"
"                                        BANK_WEBSITE1,
"
"                                        BANK_WEBSITE2,
"
"                                        BANK_NEXT_CHECK_NO,
"
"                                        BANK_CUR_BAL,
"
"                                        BANK_OD_LIMIT,
"
"                                        BANK_RT_PFX,
"
"                                        BANK_PT_PFX,
"
"                                        BANK_OT_PFX,
"
"                                        BANK_VH_PFX,
"
"                                        BANK_BDAVBL_AMT,
"
"                                        BANK_BDAVLD_AMT,
"
"                                        BANK_ACCT_TYPE,
"
"                                        BANK_PAY_BANK,
"
"                                        BANK_PAY_BANK_BR,
"
"                                        BANK_SCS_SOURCE,
"
"                                        BANK_REPORT_ID,
"
"                                        BANK_PLANT,
"
"                                        BANK_CHRG_PFX,
"
"                                        BANK_ERNG_PFX,
"
"                                        BANK_IT_PFX,
"
"                                        BANK_IFSC_CODE,
"
"                                        BANK_SWIFT_BIC_CODE,
"
"                                        BANK_BSR_CODE,
"
"                                        BANK_LGR_GRP,
"
"                                        BANK_OD_DIV_USG_FLAG,
"
"                                        BANK_ACTV_FLAG,
"
"                                        BANK_IN_FAVOR_OF_PFX,
"
"                                        BANK_LGR_GRP_ISU,
"
"                                        BANK_LGR_GRP_RCPT,
"
"                                        BANK_PRNT_CAPN,
"
"                                        BANK_IBAN_NO,
"
"                                        BANK_MICR_CODE,
"
"                                        BANK_CRE_BY,
"
"                                        BANK_CRE_IP_ADDR,
"
"                                        BANK_CRE_OS_USER,
"
"                                        BANK_CRE_DATE,
"
"                                        BANK_UPD_BY,
"
"                                        BANK_UPD_IP_ADDR,
"
"                                        BANK_UPD_OS_USER,
"
"                                        BANK_UPD_DATE,
"
"                                        BANK_CRE_EMP_ID,
"
"                                        BANK_UPD_EMP_ID,
"
"                                        BANK_AUTO_REC_NARR,
"
"                                        BANK_AUTO_REC_REF,
"
"                                        BANK_PLNT_LOC_ID,
"
"                                        BANK_ALLOW_NGV_BAL,
"
"                                        BANK_DOC_NO,
"
"                                        BANK_DOC_STATUS,
"
"                                        BANK_AD_CODE)
"
"                 VALUES (cr1.BANK_BU,
"
"                         cr1.BANK_ID,
"
"                         cr1.BANK_ACCT_NO,
"
"                         cr1.BANK_NAME1,
"
"                         cr1.BANK_NAME2,
"
"                         cr1.BANK_ADDR1,
"
"                         cr1.BANK_ADDR2,
"
"                         cr1.BANK_ADDR3,
"
"                         cr1.BANK_PO_BOX,
"
"                         cr1.BANK_CITY,
"
"                         cr1.BANK_STATE,
"
"                         cr1.BANK_COUNTRY,
"
"                         cr1.BANK_ZIP,
"
"                         cr1.BANK_CURRENCY,
"
"                         cr1.BANK_TELE1,
"
"                         cr1.BANK_TELE2,
"
"                         cr1.BANK_FAX1,
"
"                         cr1.BANK_FAX2,
"
"                         cr1.BANK_EMAIL1,
"
"                         cr1.BANK_EMAIL2,
"
"                         cr1.BANK_WEBSITE1,
"
"                         cr1.BANK_WEBSITE2,
"
"                         cr1.BANK_NEXT_CHECK_NO,
"
"                         cr1.BANK_CUR_BAL,
"
"                         cr1.BANK_OD_LIMIT,
"
"                         cr1.BANK_RT_PFX,
"
"                         cr1.BANK_PT_PFX,
"
"                         cr1.BANK_OT_PFX,
"
"                         cr1.BANK_VH_PFX,
"
"                         cr1.BANK_BDAVBL_AMT,
"
"                         cr1.BANK_BDAVLD_AMT,
"
"                         cr1.BANK_ACCT_TYPE,
"
"                         cr1.BANK_PAY_BANK,
"
"                         cr1.BANK_PAY_BANK_BR,
"
"                         cr1.BANK_SCS_SOURCE,
"
"                         cr1.BANK_REPORT_ID,
"
"                         cr1.BANK_PLANT,
"
"                         cr1.BANK_CHRG_PFX,
"
"                         cr1.BANK_ERNG_PFX,
"
"                         cr1.BANK_IT_PFX,
"
"                         cr1.BANK_IFSC_CODE,
"
"                         cr1.BANK_SWIFT_BIC_CODE,
"
"                         cr1.BANK_BSR_CODE,
"
"                         cr1.BANK_LGR_GRP,
"
"                         cr1.BANK_OD_DIV_USG_FLAG,
"
"                         cr1.BANK_ACTV_FLAG,
"
"                         cr1.BANK_IN_FAVOR_OF_PFX,
"
"                         cr1.BANK_LGR_GRP_ISU,
"
"                         cr1.BANK_LGR_GRP_RCPT,
"
"                         cr1.BANK_PRNT_CAPN,
"
"                         cr1.BANK_IBAN_NO,
"
"                         cr1.BANK_MICR_CODE,
"
"                         cr1.BANK_CRE_BY,
"
"                         cr1.BANK_CRE_IP_ADDR,
"
"                         cr1.BANK_CRE_OS_USER,
"
"                         cr1.BANK_CRE_DATE,
"
"                         cr1.BANK_UPD_BY,
"
"                         cr1.BANK_UPD_IP_ADDR,
"
"                         cr1.BANK_UPD_OS_USER,
"
"                         cr1.BANK_UPD_DATE,
"
"                         cr1.BANK_CRE_EMP_ID,
"
"                         cr1.BANK_UPD_EMP_ID,
"
"                         cr1.BANK_AUTO_REC_NARR,
"
"                         cr1.BANK_AUTO_REC_REF,
"
"                         cr1.BANK_PLNT_LOC_ID,
"
"                         cr1.BANK_AUTO_REC_NARR,
"
"                         p_doc_no,
"
"                         'N',                                          --STATUS
"
"                         cr1.BANK_AD_CODE);
"
"         END LOOP;
"
"      ELSIF p_particular = 'CONTACT'
"
"      THEN
"
"         OPEN C2;
"
"
"
"         FETCH C2 INTO CR2;
"
"
"
"         SELECT NVL (MAX (bced_seq_no), 0) + 1
"
"           INTO v_seq_no
"
"           FROM bank_contact_edit_temp
"
"          WHERE     BCED_BU = cr2.BC_BU
"
"                AND BCED_BANK_ID = cr2.BC_BANK_ID
"
"                AND BCED_DOC_NO = p_doc_no;
"
"
"
"         INSERT INTO bank_contact_edit_temp (bced_bu,
"
"                                             bced_bank_id,
"
"                                             bced_seq_no,
"
"                                             bced_position_name,
"
"                                             bced_tele1,
"
"                                             bced_tele2,
"
"                                             bced_person_pfx,
"
"                                             bced_cont_person,
"
"                                             bced_cre_by,
"
"                                             bced_cre_ip_addr,
"
"                                             bced_cre_os_user,
"
"                                             bced_cre_date,
"
"                                             bced_upd_by,
"
"                                             bced_upd_ip_addr,
"
"                                             bced_upd_os_user,
"
"                                             bced_upd_date,
"
"                                             bced_cre_emp_id,
"
"                                             bced_upd_emp_id,
"
"                                             bced_active_flg,
"
"                                             bced_temp_status,
"
"                                             bced_trk_type,
"
"                                             bced_doc_no)
"
"              VALUES (cr2.bc_bu,
"
"                      cr2.bc_bank_id,
"
"                      CR2.BC_SEQ_NO,                               --v_seq_no,
"
"                      cr2.bc_position_name,
"
"                      cr2.bc_tele1,
"
"                      cr2.bc_tele2,
"
"                      cr2.bc_person_pfx,
"
"                      cr2.bc_cont_person,
"
"                      p_user,
"
"                      cr2.bc_cre_ip_addr,
"
"                      cr2.bc_cre_os_user,
"
"                      SYSDATE,
"
"                      cr2.bc_upd_by,
"
"                      cr2.bc_upd_ip_addr,
"
"                      cr2.bc_upd_os_user,
"
"                      cr2.bc_upd_date,
"
"                      cr2.bc_cre_emp_id,
"
"                      cr2.bc_upd_emp_id,
"
"                      cr2.bc_active_flg,
"
"                      'C',
"
"                      'N',
"
"                      p_doc_no);
"
"
"
"         INSERT INTO bank_contact_edit_temp (bced_bu,
"
"                                             bced_bank_id,
"
"                                             bced_seq_no,
"
"                                             bced_position_name,
"
"                                             bced_tele1,
"
"                                             bced_tele2,
"
"                                             bced_person_pfx,
"
"                                             bced_cont_person,
"
"                                             bced_cre_by,
"
"                                             bced_cre_ip_addr,
"
"                                             bced_cre_os_user,
"
"                                             bced_cre_date,
"
"                                             bced_upd_by,
"
"                                             bced_upd_ip_addr,
"
"                                             bced_upd_os_user,
"
"                                             bced_upd_date,
"
"                                             bced_cre_emp_id,
"
"                                             bced_upd_emp_id,
"
"                                             bced_active_flg,
"
"                                             bced_temp_status,
"
"                                             bced_trk_type,
"
"                                             bced_doc_no)
"
"              VALUES (cr2.bc_bu,
"
"                      cr2.bc_bank_id,
"
"                      CR2.BC_SEQ_NO,
"
"                      cr2.bc_position_name,
"
"                      cr2.bc_tele1,
"
"                      cr2.bc_tele2,
"
"                      cr2.bc_person_pfx,
"
"                      cr2.bc_cont_person,
"
"                      p_user,
"
"                      cr2.bc_cre_ip_addr,
"
"                      cr2.bc_cre_os_user,
"
"                      SYSDATE,
"
"                      cr2.bc_upd_by,
"
"                      cr2.bc_upd_ip_addr,
"
"                      cr2.bc_upd_os_user,
"
"                      cr2.bc_upd_date,
"
"                      cr2.bc_cre_emp_id,
"
"                      cr2.bc_upd_emp_id,
"
"                      cr2.bc_active_flg,
"
"                      'N',
"
"                      'M',
"
"                      p_doc_no);
"
"
"
"         CLOSE C2;
"
"      ELSIF p_particular = 'CHEQUE'
"
"      THEN
"
"         OPEN C3;
"
"
"
"         FETCH C3 INTO CR3;
"
"         IF C3%FOUND THEN
"
"         INSERT INTO BANK_CHECK_BOOK_HD_EDIT_TEMP (bcbhdet_bu,
"
"                                                   bcbhdet_bank_id,
"
"                                                   bcbhdet_book_no,
"
"                                                   bcbhdet_old_book_no,
"
"                                                   bcbhdet_no_leaf,
"
"                                                   bcbhdet_old_no_leaf,
"
"                                                   bcbhdet_start_chk_no,
"
"                                                   bcbhdet_old_start_chk_no,
"
"                                                   bcbhdet_end_chk_no,
"
"                                                   bcbhdet_old_end_chk_no,
"
"                                                   bcbhdet_no_used,
"
"                                                   bcbhdet_old_no_used,
"
"                                                   bcbhdet_acct_no,
"
"                                                   bcbhdet_status,
"
"                                                   bcbhdet_old_status,
"
"                                                   bcbhdet_cre_by,
"
"                                                   bcbhdet_cre_ip_addr,
"
"                                                   bcbhdet_cre_os_user,
"
"                                                   bcbhdet_cre_date,
"
"                                                   bcbhdet_upd_by,
"
"                                                   bcbhdet_upd_ip_addr,
"
"                                                   bcbhdet_upd_os_user,
"
"                                                   bcbhdet_upd_date,
"
"                                                   bcbhdet_cre_emp_id,
"
"                                                   bcbhdet_upd_emp_id,
"
"                                                   bcbhdet_trk_type,
"
"                                                   bcbhdet_doc_no,
"
"                                                   bcbhdet_temp_status)
"
"              VALUES (cr3.bcbhd_bu,
"
"                      cr3.bcbhd_bank_id,
"
"                      cr3.bcbhd_book_no,
"
"                      cr3.bcbhd_book_no,
"
"                      cr3.bcbhd_no_leaf,
"
"                      cr3.bcbhd_no_leaf,
"
"                      cr3.bcbhd_start_chk_no,
"
"                      cr3.bcbhd_start_chk_no,
"
"                      cr3.bcbhd_end_chk_no,
"
"                      cr3.bcbhd_end_chk_no,
"
"                      cr3.bcbhd_no_used,
"
"                      cr3.bcbhd_no_used,
"
"                      cr3.bcbhd_acct_no,
"
"                      cr3.bcbhd_status,
"
"                      cr3.bcbhd_status,
"
"                      p_user,
"
"                      cr3.bcbhd_cre_ip_addr,
"
"                      cr3.bcbhd_cre_os_user,
"
"                      SYSDATE,
"
"                      cr3.bcbhd_upd_by,
"
"                      cr3.bcbhd_upd_ip_addr,
"
"                      cr3.bcbhd_upd_os_user,
"
"                      cr3.bcbhd_upd_date,
"
"                      cr3.bcbhd_cre_emp_id,
"
"                      cr3.bcbhd_upd_emp_id,
"
"                      'N',
"
"                      p_doc_no,
"
"                      'C');
"
"
"
"         INSERT INTO BANK_CHECK_BOOK_HD_EDIT_TEMP (bcbhdet_bu,
"
"                                                   bcbhdet_bank_id,
"
"                                                   bcbhdet_book_no,
"
"                                                   bcbhdet_old_book_no,
"
"                                                   bcbhdet_no_leaf,
"
"                                                   bcbhdet_old_no_leaf,
"
"                                                   bcbhdet_start_chk_no,
"
"                                                   bcbhdet_old_start_chk_no,
"
"                                                   bcbhdet_end_chk_no,
"
"                                                   bcbhdet_old_end_chk_no,
"
"                                                   bcbhdet_no_used,
"
"                                                   bcbhdet_old_no_used,
"
"                                                   bcbhdet_acct_no,
"
"                                                   bcbhdet_status,
"
"                                                   bcbhdet_old_status,
"
"                                                   bcbhdet_cre_by,
"
"                                                   bcbhdet_cre_ip_addr,
"
"                                                   bcbhdet_cre_os_user,
"
"                                                   bcbhdet_cre_date,
"
"                                                   bcbhdet_upd_by,
"
"                                                   bcbhdet_upd_ip_addr,
"
"                                                   bcbhdet_upd_os_user,
"
"                                                   bcbhdet_upd_date,
"
"                                                   bcbhdet_cre_emp_id,
"
"                                                   bcbhdet_upd_emp_id,
"
"                                                   bcbhdet_trk_type,
"
"                                                   bcbhdet_doc_no,
"
"                                                   bcbhdet_temp_status)
"
"              VALUES (cr3.bcbhd_bu,
"
"                      cr3.bcbhd_bank_id,
"
"                      cr3.bcbhd_book_no,
"
"                      cr3.bcbhd_book_no,
"
"                      cr3.bcbhd_no_leaf,
"
"                      cr3.bcbhd_no_leaf,
"
"                      cr3.bcbhd_start_chk_no,
"
"                      cr3.bcbhd_start_chk_no,
"
"                      cr3.bcbhd_end_chk_no,
"
"                      cr3.bcbhd_end_chk_no,
"
"                      cr3.bcbhd_no_used,
"
"                      cr3.bcbhd_no_used,
"
"                      cr3.bcbhd_acct_no,
"
"                      cr3.bcbhd_status,
"
"                      cr3.bcbhd_status,
"
"                      p_user,
"
"                      cr3.bcbhd_cre_ip_addr,
"
"                      cr3.bcbhd_cre_os_user,
"
"                      SYSDATE,
"
"                      cr3.bcbhd_upd_by,
"
"                      cr3.bcbhd_upd_ip_addr,
"
"                      cr3.bcbhd_upd_os_user,
"
"                      cr3.bcbhd_upd_date,
"
"                      cr3.bcbhd_cre_emp_id,
"
"                      cr3.bcbhd_upd_emp_id,
"
"                      'M',
"
"                      p_doc_no,
"
"                      'N');
"
"         FOR cr3a IN c3a(cr3.bcbhd_bank_id,cr3.bcbhd_book_no)
"
"         LOOP
"
"             INSERT INTO bank_check_book_ln_temp(bcbln_bu,
"
"                                                 bcbln_doc_no,
"
"                                                 bcbln_bank_id,
"
"                                                 bcbln_book_no,
"
"                                                 bcbln_seq_no,
"
"                                                 bcbln_chq_no,
"
"                                                 bcbln_date,
"
"                                                 bcbln_in_fvr_of,
"
"                                                 bcbln_chq_amt,
"
"                                                 bcbln_ref,
"
"                                                 bcbln_status,
"
"                                                 bcbln_cre_by,
"
"                                                 bcbln_cre_ip_addr,
"
"                                                 bcbln_cre_os_user,
"
"                                                 bcbln_cre_date,
"
"                                                 bcbln_upd_by,
"
"                                                 bcbln_upd_ip_addr,
"
"                                                 bcbln_upd_os_user,
"
"                                                 bcbln_upd_date,
"
"                                                 bcbln_cre_emp_id,
"
"                                                 bcbln_upd_emp_id,
"
"                                                 bcbln_temp_status
"
"                                                 )
"
"                                    VALUES  (cr3a.bcbln_bu,
"
"                                                 p_doc_no,
"
"                                                 cr3a.bcbln_bank_id,
"
"                                                 cr3a.bcbln_book_no,
"
"                                                 cr3a.bcbln_seq_no,
"
"                                                 cr3a.bcbln_chq_no,
"
"                                                 cr3a.bcbln_date,
"
"                                                 cr3a.bcbln_in_fvr_of,
"
"                                                 cr3a.bcbln_chq_amt,
"
"                                                 cr3a.bcbln_ref,
"
"                                                 cr3a.bcbln_status,
"
"                                                 p_user,
"
"                                                 cr3a.bcbln_cre_ip_addr,
"
"                                                 cr3a.bcbln_cre_os_user,
"
"                                                 SYSDATE,
"
"                                                 cr3a.bcbln_upd_by,
"
"                                                 cr3a.bcbln_upd_ip_addr,
"
"                                                 cr3a.bcbln_upd_os_user,
"
"                                                 cr3a.bcbln_upd_date,
"
"                                                 cr3a.bcbln_cre_emp_id,
"
"                                                 cr3a.bcbln_upd_emp_id,
"
"                                                 'C'
"
"                                                 );
"
"             INSERT INTO bank_check_book_ln_temp(bcbln_bu,
"
"                                                 bcbln_doc_no,
"
"                                                 bcbln_bank_id,
"
"                                                 bcbln_book_no,
"
"                                                 bcbln_seq_no,
"
"                                                 bcbln_chq_no,
"
"                                                 bcbln_date,
"
"                                                 bcbln_in_fvr_of,
"
"                                                 bcbln_chq_amt,
"
"                                                 bcbln_ref,
"
"                                                 bcbln_status,
"
"                                                 bcbln_cre_by,
"
"                                                 bcbln_cre_ip_addr,
"
"                                                 bcbln_cre_os_user,
"
"                                                 bcbln_cre_date,
"
"                                                 bcbln_upd_by,
"
"                                                 bcbln_upd_ip_addr,
"
"                                                 bcbln_upd_os_user,
"
"                                                 bcbln_upd_date,
"
"                                                 bcbln_cre_emp_id,
"
"                                                 bcbln_upd_emp_id,
"
"                                                 bcbln_temp_status
"
"                                                 )
"
"                                  VALUES  (cr3a.bcbln_bu,
"
"                                                 p_doc_no,
"
"                                                 cr3a.bcbln_bank_id,
"
"                                                 cr3a.bcbln_book_no,
"
"                                                 cr3a.bcbln_seq_no,
"
"                                                 cr3a.bcbln_chq_no,
"
"                                                 cr3a.bcbln_date,
"
"                                                 cr3a.bcbln_in_fvr_of,
"
"                                                 cr3a.bcbln_chq_amt,
"
"                                                 cr3a.bcbln_ref,
"
"                                                 cr3a.bcbln_status,
"
"                                                 p_user,
"
"                                                 cr3a.bcbln_cre_ip_addr,
"
"                                                 cr3a.bcbln_cre_os_user,
"
"                                                 SYSDATE,
"
"                                                 cr3a.bcbln_upd_by,
"
"                                                 cr3a.bcbln_upd_ip_addr,
"
"                                                 cr3a.bcbln_upd_os_user,
"
"                                                 cr3a.bcbln_upd_date,
"
"                                                 cr3a.bcbln_cre_emp_id,
"
"                                                 cr3a.bcbln_upd_emp_id,
"
"                                                 'N'
"
"                                                 );
"
"         END LOOP;
"
"         END IF;
"
"         CLOSE C3;
"
"      ELSIF p_particular = 'Prefix'
"
"      THEN
"
"         OPEN C4;
"
"
"
"         FETCH C4 INTO CR4;
"
"
"
"         INSERT INTO BANK_TRANS_PFX_EDIT_TEMP (BTPET_BU,
"
"                                               BTPET_PLNT,
"
"                                               BTPET_BANK_ID,
"
"                                               BTPET_TRANS_PFX,
"
"                                               BTPET_OLD_TRANS_PFX,
"
"                                               BTPET_TYPE,
"
"                                               BTPET_DEF_FLAG,
"
"                                               BTPET_CRE_BY,
"
"                                               BTPET_CRE_IP_ADDR,
"
"                                               BTPET_CRE_OS_USER,
"
"                                               BTPET_CRE_DATE,
"
"                                               BTPET_UPD_BY,
"
"                                               BTPET_UPD_IP_ADDR,
"
"                                               BTPET_UPD_OS_USER,
"
"                                               BTPET_UPD_DATE,
"
"                                               BTPET_CRE_EMP_ID,
"
"                                               BTPET_UPD_EMP_ID,
"
"                                               BTPET_ACTIVE_FLG,
"
"                                               BTPET_OLD_ACTIVE_FLG,
"
"                                               BTPET_TEMP_STATUS,
"
"                                               BTPET_TRK_TYPE,
"
"                                               BTPET_DOC_NO)
"
"              VALUES (cr4.BTP_BU,
"
"                      cr4.BTP_PLNT,
"
"                      cr4.BTP_BANK_ID,
"
"                      cr4.BTP_TRANS_PFX,
"
"                      cr4.BTP_TRANS_PFX,
"
"                      cr4.BTP_TYPE,
"
"                      cr4.BTP_DEF_FLAG,
"
"                      p_user,
"
"                      cr4.BTP_CRE_IP_ADDR,
"
"                      cr4.BTP_CRE_OS_USER,
"
"                      SYSDATE,
"
"                      cr4.BTP_UPD_BY,
"
"                      cr4.BTP_UPD_IP_ADDR,
"
"                      cr4.BTP_UPD_OS_USER,
"
"                      cr4.BTP_UPD_DATE,
"
"                      cr4.BTP_CRE_EMP_ID,
"
"                      cr4.BTP_UPD_EMP_ID,
"
"                     cr4.BTP_ACTIVE_FLG,
"
"                      cr4.BTP_ACTIVE_FLG,
"
"                      'C',
"
"                      'N',
"
"                      p_doc_no);
"
"
"
"         INSERT INTO BANK_TRANS_PFX_EDIT_TEMP (BTPET_BU,
"
"                                               BTPET_PLNT,
"
"                                               BTPET_BANK_ID,
"
"                                               BTPET_TRANS_PFX,
"
"                                               BTPET_OLD_TRANS_PFX,
"
"                                               BTPET_TYPE,
"
"                                               BTPET_DEF_FLAG,
"
"                                               BTPET_CRE_BY,
"
"                                               BTPET_CRE_IP_ADDR,
"
"                                               BTPET_CRE_OS_USER,
"
"                                               BTPET_CRE_DATE,
"
"                                               BTPET_UPD_BY,
"
"                                               BTPET_UPD_IP_ADDR,
"
"                                               BTPET_UPD_OS_USER,
"
"                                               BTPET_UPD_DATE,
"
"                                               BTPET_CRE_EMP_ID,
"
"                                               BTPET_UPD_EMP_ID,
"
"                                               BTPET_ACTIVE_FLG,
"
"                                               BTPET_OLD_ACTIVE_FLG,
"
"                                               BTPET_TEMP_STATUS,
"
"                                               BTPET_TRK_TYPE,
"
"                                               BTPET_DOC_NO)
"
"              VALUES (cr4.BTP_BU,
"
"                      cr4.BTP_PLNT,
"
"                      cr4.BTP_BANK_ID,
"
"                      cr4.BTP_TRANS_PFX,
"
"                      cr4.BTP_TRANS_PFX,
"
"                      cr4.BTP_TYPE,
"
"                      cr4.BTP_DEF_FLAG,
"
"                      p_user,
"
"                      cr4.BTP_CRE_IP_ADDR,
"
"                      cr4.BTP_CRE_OS_USER,
"
"                      SYSDATE,
"
"                      cr4.BTP_UPD_BY,
"
"                      cr4.BTP_UPD_IP_ADDR,
"
"                      cr4.BTP_UPD_OS_USER,
"
"                      cr4.BTP_UPD_DATE,
"
"                      cr4.BTP_CRE_EMP_ID,
"
"                      cr4.BTP_UPD_EMP_ID,
"
"                      cr4.BTP_ACTIVE_FLG,
"
"                      cr4.BTP_ACTIVE_FLG,
"
"                      'N',
"
"                      'M',
"
"                      p_doc_no);
"
"      ELSIF p_particular = 'GL ACCOUNT'
"
"      THEN
"
"         OPEN C5;
"
"
"
"         FETCH C5 INTO CR5;
"
"
"
"         INSERT INTO BANK_PLANT_ACCTS_EDIT_TEMP (BPLAET_BU,
"
"                                                 BPLAET_BANK_ID,
"
"                                                 BPLAET_LGR_TYPE,
"
"                                                 BPLAET_OLD_LGR_TYPE,
"
"                                                 BPLAET_ACCT,
"
"                                                 BPLAET_OLD_ACCT,
"
"                                                 BPLAET_CRE_BY,
"
"                                                 BPLAET_CRE_IP_ADDR,
"
"                                                 BPLAET_CRE_OS_USER,
"
"                                                 BPLAET_CRE_DATE,
"
"                                                 BPLAET_UPD_BY,
"
"                                                 BPLAET_UPD_IP_ADDR,
"
"                                                 BPLAET_UPD_OS_USER,
"
"                                                 BPLAET_UPD_DATE,
"
"                                                 BPLAET_CRE_EMP_ID,
"
"                                                 BPLAET_UPD_EMP_ID,
"
"                                                 BPLAET_ACTIVE_FLAG,
"
"                                                 BPLAET_OLD_ACTIVE_FLAG,
"
"                                                 BPLAET_DOC_NO,
"
"                                                 BCBHDET_TRK_TYPE,
"
"                                                 BCBHDET_TEMP_STATUS)
"
"              VALUES (cr5.BPLA_BU,
"
"                      cr5.BPLA_BANK_ID,
"
"                      cr5.BPLA_LGR_TYPE,
"
"                      cr5.BPLA_LGR_TYPE,
"
"                      cr5.BPLA_ACCT,
"
"                      cr5.BPLA_ACCT,
"
"                      p_user,
"
"                      cr5.BPLA_CRE_IP_ADDR,
"
"                      cr5.BPLA_CRE_OS_USER,
"
"                      SYSDATE,
"
"                      cr5.BPLA_UPD_BY,
"
"                      cr5.BPLA_UPD_IP_ADDR,
"
"                      cr5.BPLA_UPD_OS_USER,
"
"                      cr5.BPLA_UPD_DATE,
"
"                      cr5.BPLA_CRE_EMP_ID,
"
"                      cr5.BPLA_UPD_EMP_ID,
"
"                      cr5.BPLA_ACTIVE_FLAG,
"
"                      cr5.BPLA_ACTIVE_FLAG,
"
"                      p_doc_no,
"
"                      'N',
"
"                      'C');
"
"
"
"         INSERT INTO BANK_PLANT_ACCTS_EDIT_TEMP (BPLAET_BU,
"
"                                                 BPLAET_BANK_ID,
"
"                                                 BPLAET_LGR_TYPE,
"
"                                                 BPLAET_OLD_LGR_TYPE,
"
"                                                 BPLAET_ACCT,
"
"                                                 BPLAET_OLD_ACCT,
"
"                                                 BPLAET_CRE_BY,
"
"                                                 BPLAET_CRE_IP_ADDR,
"
"                                                 BPLAET_CRE_OS_USER,
"
"                                                 BPLAET_CRE_DATE,
"
"                                                 BPLAET_UPD_BY,
"
"                                                 BPLAET_UPD_IP_ADDR,
"
"                                                 BPLAET_UPD_OS_USER,
"
"                                                 BPLAET_UPD_DATE,
"
"                                                 BPLAET_CRE_EMP_ID,
"
"                                                 BPLAET_UPD_EMP_ID,
"
"                                                 BPLAET_ACTIVE_FLAG,
"
"                                                 BPLAET_OLD_ACTIVE_FLAG,
"
"                                                 BPLAET_DOC_NO,
"
"                                                 BCBHDET_TRK_TYPE,
"
"                                                 BCBHDET_TEMP_STATUS)
"
"              VALUES (cr5.BPLA_BU,
"
"                      cr5.BPLA_BANK_ID,
"
"                      cr5.BPLA_LGR_TYPE,
"
"                      cr5.BPLA_LGR_TYPE,
"
"                      cr5.BPLA_ACCT,
"
"                      cr5.BPLA_ACCT,
"
"                      p_user,
"
"                      cr5.BPLA_CRE_IP_ADDR,
"
"                      cr5.BPLA_CRE_OS_USER,
"
"                      SYSDATE,
"
"                      cr5.BPLA_UPD_BY,
"
"                      cr5.BPLA_UPD_IP_ADDR,
"
"                      cr5.BPLA_UPD_OS_USER,
"
"                      cr5.BPLA_UPD_DATE,
"
"                      cr5.BPLA_CRE_EMP_ID,
"
"                      cr5.BPLA_UPD_EMP_ID,
"
"                      cr5.BPLA_ACTIVE_FLAG,
"
"                      cr5.BPLA_ACTIVE_FLAG,
"
"                      p_doc_no,
"
"                      'M',
"
"                      'N');
"
"
"
"         CLOSE C5;
"
"      ELSIF p_particular = 'CREDIT LIMIT'
"
"      THEN
"
"         OPEN C6;
"
"
"
"         FETCH C6 INTO CR6;
"
"
"
"         INSERT INTO BANK_CREDIT_LIMITS_EDIT_TEMP (BCLET_BU,
"
"                                                   BCLET_BANK_ID,
"
"                                                   BCLET_CR_TYPE,
"
"                                                   BCLET_CR_LIMIT,
"
"                                                   BCLET_OLD_CR_LIMIT,
"
"                                                   BCLET_UTILIZED,
"
"                                                   BCLET_OLD_UTILIZED,
"
"                                                   BCLET_LIMIT_REQ_FLAG,
"
"                                                   BCLET_OLD_LIMIT_REQ_FLAG,
"
"                                                   BCLET_CURRENCY,
"
"                                                   BCLET_OLD_CURRENCY,
"
"                                                   BCLET_DEP_LIMIT_PCT,
"
"                                                   BCLET_OLD_DEP_LIMIT_PCT,
"
"                                                   BCLET_DEP_LIMIT_AMT,
"
"                                                   BCLET_OLD_DEP_LIMIT_AMT,
"
"                                                   BCLET_CRE_BY,
"
"                                                   BCLET_CRE_IP_ADDR,
"
"                                                   BCLET_CRE_OS_USER,
"
"                                                   BCLET_CRE_DATE,
"
"                                                   BCLET_UPD_BY,
"
"                                                   BCLET_UPD_IP_ADDR,
"
"                                                   BCLET_UPD_OS_USER,
"
"                                                   BCLET_UPD_DATE,
"
"                                                   BCLET_CR_PC_TYPE,
"
"                                                   BCLET_OLD_CR_PC_TYPE,
"
"                                                   BCLET_CR_BD_TYPE,
"
"                                                   BCLET_OLD_CR_BD_TYPE,
"
"                                                   BCLET_CR_BG_TYPE,
"
"                                                   BCLET_OLD_CR_BG_TYPE,
"
"                                                   BCLET_CR_LC_TYPE,
"
"                                                   BCLET_OLD_CR_LC_TYPE,
"
"                                                   BCLET_CR_CC_TYPE,
"
"                                                   BCLET_OLD_CR_CC_TYPE,
"
"                                                   BCLET_CR_SCS_TYPE,
"
"                                                   BCLET_OLD_CR_SCS_TYPE,
"
"                                                   BCLET_CRE_EMP_ID,
"
"                                                   BCLET_UPD_EMP_ID,
"
"                                                   BCLET_TRK_TYPE,
"
"                                                   BCLET_DOC_NO,
"
"                                                   BCLET_TEMP_STATUS,
"
"                                                   BCLET_CURRENCY_TEMP,
"
"                                                   BCLET_CR_LIMIT_TEMP)
"
"              VALUES (cr6.BCL_BU,
"
"                      cr6.BCL_BANK_ID,
"
"                      cr6.BCL_CR_TYPE,
"
"                      cr6.BCL_CR_LIMIT,
"
"                      cr6.BCL_CR_LIMIT,
"
"                      cr6.BCL_UTILIZED,
"
"                      cr6.BCL_UTILIZED,
"
"                      cr6.BCL_LIMIT_REQ_FLAG,
"
"                      cr6.BCL_LIMIT_REQ_FLAG,
"
"                      cr6.BCL_CURRENCY,
"
"                      cr6.BCL_CURRENCY,
"
"                      cr6.BCL_DEP_LIMIT_PCT,
"
"                      cr6.BCL_DEP_LIMIT_PCT,
"
"                      cr6.BCL_DEP_LIMIT_AMT,
"
"                      cr6.BCL_DEP_LIMIT_AMT,
"
"                      p_user,
"
"                      cr6.BCL_CRE_IP_ADDR,
"
"                      cr6.BCL_CRE_OS_USER,
"
"                      SYSDATE,
"
"                      cr6.BCL_UPD_BY,
"
"                      cr6.BCL_UPD_IP_ADDR,
"
"                      cr6.BCL_UPD_OS_USER,
"
"                      cr6.BCL_UPD_DATE,
"
"                      cr6.BCL_CR_PC_TYPE,
"
"                      cr6.BCL_CR_PC_TYPE,
"
"                      cr6.BCL_CR_BD_TYPE,
"
"                      cr6.BCL_CR_BD_TYPE,
"
"                      cr6.BCL_CR_BG_TYPE,
"
"                      cr6.BCL_CR_BG_TYPE,
"
"                      cr6.BCL_CR_LC_TYPE,
"
"                      cr6.BCL_CR_LC_TYPE,
"
"                      cr6.BCL_CR_CC_TYPE,
"
"                      cr6.BCL_CR_CC_TYPE,
"
"                      cr6.BCL_CR_SCS_TYPE,
"
"                      cr6.BCL_CR_SCS_TYPE,
"
"                      cr6.BCL_CRE_EMP_ID,
"
"                      cr6.BCL_UPD_EMP_ID,
"
"                      'N',
"
"                      p_doc_no,
"
"                      'C',
"
"                      cr6.BCL_CURRENCY,
"
"                      cr6.BCL_CR_LIMIT);
"
"
"
"         INSERT INTO BANK_CREDIT_LIMITS_EDIT_TEMP (BCLET_BU,
"
"                                                   BCLET_BANK_ID,
"
"                                                   BCLET_CR_TYPE,
"
"                                                   BCLET_CR_LIMIT,
"
"                                                   BCLET_OLD_CR_LIMIT,
"
"                                                   BCLET_UTILIZED,
"
"                                                   BCLET_OLD_UTILIZED,
"
"                                                   BCLET_LIMIT_REQ_FLAG,
"
"                                                   BCLET_OLD_LIMIT_REQ_FLAG,
"
"                                                   BCLET_CURRENCY,
"
"                                                   BCLET_OLD_CURRENCY,
"
"                                                   BCLET_DEP_LIMIT_PCT,
"
"                                                   BCLET_OLD_DEP_LIMIT_PCT,
"
"                                                   BCLET_DEP_LIMIT_AMT,
"
"                                                   BCLET_OLD_DEP_LIMIT_AMT,
"
"                                                   BCLET_CRE_BY,
"
"                                                   BCLET_CRE_IP_ADDR,
"
"                                                   BCLET_CRE_OS_USER,
"
"                                                   BCLET_CRE_DATE,
"
"                                                   BCLET_UPD_BY,
"
"                                                   BCLET_UPD_IP_ADDR,
"
"                                                   BCLET_UPD_OS_USER,
"
"                                                   BCLET_UPD_DATE,
"
"                                                   BCLET_CR_PC_TYPE,
"
"                                                   BCLET_OLD_CR_PC_TYPE,
"
"                                                   BCLET_CR_BD_TYPE,
"
"                                                   BCLET_OLD_CR_BD_TYPE,
"
"                                                   BCLET_CR_BG_TYPE,
"
"                                                   BCLET_OLD_CR_BG_TYPE,
"
"                                                   BCLET_CR_LC_TYPE,
"
"                                                   BCLET_OLD_CR_LC_TYPE,
"
"                                                   BCLET_CR_CC_TYPE,
"
"                                                   BCLET_OLD_CR_CC_TYPE,
"
"                                                   BCLET_CR_SCS_TYPE,
"
"                                                   BCLET_OLD_CR_SCS_TYPE,
"
"                                                   BCLET_CRE_EMP_ID,
"
"                                                   BCLET_UPD_EMP_ID,
"
"                                                   BCLET_TRK_TYPE,
"
"                                                   BCLET_DOC_NO,
"
"                                                   BCLET_TEMP_STATUS,
"
"                                                   BCLET_CURRENCY_TEMP,
"
"                                                   BCLET_CR_LIMIT_TEMP)
"
"              VALUES (cr6.BCL_BU,
"
"                      cr6.BCL_BANK_ID,
"
"                      cr6.BCL_CR_TYPE,
"
"                      cr6.BCL_CR_LIMIT,
"
"                      cr6.BCL_CR_LIMIT,
"
"                      cr6.BCL_UTILIZED,
"
"                      cr6.BCL_UTILIZED,
"
"                      cr6.BCL_LIMIT_REQ_FLAG,
"
"                      cr6.BCL_LIMIT_REQ_FLAG,
"
"                      cr6.BCL_CURRENCY,
"
"                      cr6.BCL_CURRENCY,
"
"                      cr6.BCL_DEP_LIMIT_PCT,
"
"                      cr6.BCL_DEP_LIMIT_PCT,
"
"                      cr6.BCL_DEP_LIMIT_AMT,
"
"                      cr6.BCL_DEP_LIMIT_AMT,
"
"                      p_user,
"
"                      cr6.BCL_CRE_IP_ADDR,
"
"                      cr6.BCL_CRE_OS_USER,
"
"                      SYSDATE,
"
"                      cr6.BCL_UPD_BY,
"
"                      cr6.BCL_UPD_IP_ADDR,
"
"                      cr6.BCL_UPD_OS_USER,
"
"                      cr6.BCL_UPD_DATE,
"
"                      cr6.BCL_CR_PC_TYPE,
"
"                      cr6.BCL_CR_PC_TYPE,
"
"                      cr6.BCL_CR_BD_TYPE,
"
"                      cr6.BCL_CR_BD_TYPE,
"
"                      cr6.BCL_CR_BG_TYPE,
"
"                      cr6.BCL_CR_BG_TYPE,
"
"                      cr6.BCL_CR_LC_TYPE,
"
"                      cr6.BCL_CR_LC_TYPE,
"
"                      cr6.BCL_CR_CC_TYPE,
"
"                      cr6.BCL_CR_CC_TYPE,
"
"                      cr6.BCL_CR_SCS_TYPE,
"
"                      cr6.BCL_CR_SCS_TYPE,
"
"                      cr6.BCL_CRE_EMP_ID,
"
"                      cr6.BCL_UPD_EMP_ID,
"
"                      'M',
"
"                      p_doc_no,
"
"                      'N',
"
"                      cr6.BCL_CURRENCY,
"
"                      cr6.BCL_CR_LIMIT
"
"                      );
"
"
"
"         CLOSE C6;
"
"      END IF;
"
"   END proc_ins_bank_edit_temp;
"
"
"
"
"
"   PROCEDURE proc_upd_is_vaid (p_bu             VARCHAR2,
"
"                               p_bank_id        VARCHAR2,
"
"                               p_user           VARCHAR2,
"
"                               p_session        VARCHAR2,
"
"                               p_upd_type       VARCHAR2,
"
"                               p_search         VARCHAR2,
"
"                               p_doc_no     OUT VARCHAR2)
"
"   IS
"
"      v_count    NUMBER (5);
"
"      v_status   VARCHAR2 (1);
"
"      v_doc_no   bank_edit_hd.behd_doc_no%TYPE;
"
"   BEGIN
"
"      SELECT NVL (MAX (TO_NUMBER (behd_doc_no)), 1000000000) + 1
"
"        INTO v_doc_no
"
"        FROM bank_edit_hd
"
"       WHERE behd_bu = p_bu AND behd_bank_id = p_bank_id;
"
"
"
"      p_doc_no := v_doc_no;
"
"
"
"      IF p_upd_type = 'ADDRESS'
"
"      THEN
"
"         BEGIN
"
"              SELECT COUNT (*), behd_status
"
"                INTO v_count, v_status
"
"                FROM bank_edit_hd
"
"               WHERE     behd_bu = p_bu
"
"                     AND behd_bank_id = p_bank_id
"
"                     AND behd_upd_type = 'ADDRESS'
"
"                     AND behd_status IN ('N', 'E')
"
"            GROUP BY behd_status;
"
"         EXCEPTION
"
"            WHEN OTHERS
"
"            THEN
"
"               v_count := 0;
"
"         END;
"
"
"
"         IF v_count > 0
"
"         THEN
"
"            IF v_status = 'N'
"
"            THEN
"
"               RAISE_APPLICATION_ERROR (
"
"                  -20999,
"
"                  'Document already forwaded for Approval');
"
"            ELSIF v_status = 'E'
"
"            THEN
"
"               RAISE_APPLICATION_ERROR (-20999,
"
"                                        'Document already in Draft Status');
"
"            END IF;
"
"         ELSE
"
"            pack_bank_upd.proc_ins_bank_edit_temp (p_bu,
"
"                                                   p_bank_id,
"
"                                                   v_doc_no,
"
"                                                   p_user,
"
"                                                   1,
"
"                                                   p_session,
"
"                                                   'ADDRESS',
"
"                                                   NULL,
"
"                                                   NULL);
"
"         END IF;
"
"      ELSIF p_upd_type = 'CONTACT'
"
"      THEN
"
"         BEGIN
"
"              SELECT COUNT (*), behd_status
"
"                INTO v_count, v_status
"
"                FROM bank_edit_hd
"
"               WHERE     behd_bu = p_bu
"
"                     AND behd_bank_id = p_bank_id
"
"                     AND behd_upd_type = 'CONTACT'
"
"                     AND behd_status IN ('N', 'E')
"
"            GROUP BY behd_status;
"
"         EXCEPTION
"
"            WHEN OTHERS
"
"            THEN
"
"               v_count := 0;
"
"         END;
"
"        -- raise_application_error(-20999,p_upd_type);
"
"         IF v_count > 0
"
"         THEN
"
"            IF v_status = 'N'
"
"            THEN
"
"               RAISE_APPLICATION_ERROR (
"
"                  -20999,
"
"                  'Document already forwaded for Approval');
"
"            ELSIF v_status = 'E'
"
"            THEN
"
"               RAISE_APPLICATION_ERROR (-20999,
"
"                                        'Document already in Draft Status');
"
"            END IF;
"
"         ELSE
"
"            pack_bank_upd.proc_ins_bank_edit_temp (p_bu,
"
"                                                   p_bank_id,
"
"                                                   v_doc_no,
"
"                                                   p_user,
"
"                                                   1,
"
"                                                   p_session,
"
"                                                   'CONTACT',
"
"                                                   p_search,
"
"                                                   NULL);
"
"         END IF;
"
"      ELSIF p_upd_type = 'CHEQUE'
"
"      THEN
"
"         BEGIN
"
"              SELECT COUNT (*), behd_status
"
"                INTO v_count, v_status
"
"                FROM bank_edit_hd
"
"               WHERE     behd_bu = p_bu
"
"                     AND behd_bank_id = p_bank_id
"
"                     AND behd_upd_type = 'CHEQUE'
"
"                     AND behd_status IN ('N', 'E')
"
"            GROUP BY behd_status;
"
"         EXCEPTION
"
"            WHEN OTHERS
"
"            THEN
"
"               v_count := 0;
"
"         END;
"
"
"
"         IF v_count > 0
"
"         THEN
"
"            IF v_status = 'N'
"
"            THEN
"
"               RAISE_APPLICATION_ERROR (
"
"                  -20999,
"
"                  'Document already forwaded for Approval');
"
"            ELSIF v_status = 'E'
"
"            THEN
"
"               RAISE_APPLICATION_ERROR (-20999,
"
"                                        'Document already in Draft Status');
"
"            END IF;
"
"         ELSE
"
"            pack_bank_upd.proc_ins_bank_edit_temp (p_bu,
"
"                                                   p_bank_id,
"
"                                                   v_doc_no,
"
"                                                   p_user,
"
"                                                   1,
"
"                                                   p_session,
"
"                                                   'CHEQUE',
"
"                                                   p_search,
"
"                                                   NULL);
"
"         END IF;
"
"      ELSIF p_upd_type = 'Prefix'
"
"      THEN
"
"         BEGIN
"
"              SELECT COUNT (*), behd_status
"
"                INTO v_count, v_status
"
"                FROM bank_edit_hd
"
"               WHERE     behd_bu = p_bu
"
"                     AND behd_bank_id = p_bank_id
"
"                     AND behd_upd_type = 'Prefix'
"
"                     AND behd_status IN ('N', 'E')
"
"            GROUP BY behd_status;
"
"         EXCEPTION
"
"            WHEN OTHERS
"
"            THEN
"
"               v_count := 0;
"
"         END;
"
"
"
"         IF v_count > 0
"
"         THEN
"
"            IF v_status = 'N'
"
"            THEN
"
"               RAISE_APPLICATION_ERROR (
"
"                  -20999,
"
"                  'Document already forwaded for Approval');
"
"            ELSIF v_status = 'E'
"
"            THEN
"
"               RAISE_APPLICATION_ERROR (-20999,
"
"                                        'Document already in Draft Status');
"
"            END IF;
"
"         ELSE
"
"            pack_bank_upd.proc_ins_bank_edit_temp (p_bu,
"
"                                                   p_bank_id,
"
"                                                   v_doc_no,
"
"                                                   p_user,
"
"                                                   1,
"
"                                                   p_session,
"
"                                                   'Prefix',
"
"                                                   p_search,
"
"                                                   NULL);
"
"         END IF;
"
"      ELSIF p_upd_type = 'GL ACCOUNT'
"
"      THEN
"
"         BEGIN
"
"              SELECT COUNT (*), behd_status
"
"                INTO v_count, v_status
"
"                FROM bank_edit_hd
"
"               WHERE     behd_bu = p_bu
"
"                     AND behd_bank_id = p_bank_id
"
"                     AND behd_upd_type = 'GL ACCOUNT'
"
"                     AND behd_status IN ('N', 'E')
"
"            GROUP BY behd_status;
"
"         EXCEPTION
"
"            WHEN OTHERS
"
"            THEN
"
"               v_count := 0;
"
"         END;
"
"
"
"         IF v_count > 0
"
"         THEN
"
"            IF v_status = 'N'
"
"            THEN
"
"               RAISE_APPLICATION_ERROR (
"
"                  -20999,
"
"                  'Document already forwaded for Approval');
"
"            ELSIF v_status = 'E'
"
"            THEN
"
"               RAISE_APPLICATION_ERROR (-20999,
"
"                                        'Document already in Draft Status');
"
"            END IF;
"
"         ELSE
"
"            pack_bank_upd.proc_ins_bank_edit_temp (p_bu,
"
"                                                   p_bank_id,
"
"                                                   v_doc_no,
"
"                                                   p_user,
"
"                                                   1,
"
"                                                   p_session,
"
"                                                   'GL ACCOUNT',
"
"                                                   p_search,
"
"                                                   NULL);
"
"         END IF;
"
"      ELSIF p_upd_type = 'CREDIT LIMIT'
"
"      THEN
"
"         BEGIN
"
"              SELECT COUNT (*), behd_status
"
"                INTO v_count, v_status
"
"                FROM bank_edit_hd
"
"               WHERE     behd_bu = p_bu
"
"                     AND behd_bank_id = p_bank_id
"
"                     AND behd_upd_type = 'CREDIT LIMIT'
"
"                     AND behd_status IN ('N', 'E')
"
"            GROUP BY behd_status;
"
"         EXCEPTION
"
"            WHEN OTHERS
"
"            THEN
"
"               v_count := 0;
"
"         END;
"
"
"
"         IF v_count > 0
"
"         THEN
"
"            IF v_status = 'N'
"
"            THEN
"
"               RAISE_APPLICATION_ERROR (
"
"                  -20999,
"
"                  'Document already forwaded for Approval');
"
"            ELSIF v_status = 'E'
"
"            THEN
"
"               RAISE_APPLICATION_ERROR (-20999,
"
"                                        'Document already in Draft Status');
"
"            END IF;
"
"         ELSE
"
"            pack_bank_upd.proc_ins_bank_edit_temp (p_bu,
"
"                                                   p_bank_id,
"
"                                                   v_doc_no,
"
"                                                   p_user,
"
"                                                   1,
"
"                                                   p_session,
"
"                                                   'CREDIT LIMIT',
"
"                                                   p_search,           --NULL,
"
"                                                   NULL);
"
"         END IF;
"
"      END IF;
"
"   END proc_upd_is_vaid;
"
"END pack_bank_upd;"
/
