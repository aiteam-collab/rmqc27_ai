CREATE OR REPLACE
"PACKAGE BODY        pack_suplr_upd
"
"AS
"
"
"
"  PROCEDURE proc_ins_upd_addr(p_bu         VARCHAR2,
"
"                              p_suplr_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_party_type VARCHAR2,
"
"                              p_upd_type   VARCHAR2)
"
"    IS
"
"  v_doc_no suplr_edit_hd.sehd_doc_no%TYPE;
"
"
"
"  BEGIN
"
"
"
"--  rAISE_APPLICATION_ERROR(-20999,'HRM');
"
"  commit;
"
"
"
"  DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"      AND sehd_status  ='E'
"
"     AND sehd_upd_type = p_upd_type;
"
"
"
" IF sql%FOUND THEN
"
"    ROLLBACK;
"
"  BEGIN
"
"    SELECT TO_NUMBER (sehd_doc_no)
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN v_doc_no :=NULL;
"
"END;
"
" DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"END IF;
"
"IF v_doc_no IS NULL THEN
"
"if  p_party_type in ('S','C') THEN
"
"
"
"  SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id
"
"--     AND sehd_status <> 'E'
"
"     AND sehd_party_type = p_party_type;
"
"ELSE
"
" SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id;
"
"END IF;
"
"END IF;
"
"
"
"--raise_application_error(-20999,v_doc_no);
"
"
"
"            INSERT INTO suplr_edit_hd(sehd_bu,
"
"                                      sehd_doc_no,
"
"                                      sehd_doc_date,
"
"                                      sehd_suplr_id,
"
"                                      sehd_status,
"
"                                      sehd_cre_by,
"
"                                      sehd_cre_ip_addr,
"
"                                      sehd_cre_os_user,
"
"                                      sehd_cre_date,
"
"                                      sehd_party_type,
"
"                                      sehd_upd_type)
"
"                               VALUES(p_bu,
"
"                                      v_doc_no,
"
"                                      SYSDATE,
"
"                                      p_suplr_id,
"
"                                      'E',
"
"                                      p_user,
"
"                                      audit_info.get_ip_address,
"
"                                      audit_info.get_os_user,
"
"                                      SYSDATE,
"
"                                      p_party_type,
"
"                                      p_upd_type
"
"                                     );
"
"  END proc_ins_upd_addr;
"
"
"
"
"
"  PROCEDURE proc_ins_upd_loc(p_bu         VARCHAR2,
"
"                             p_party_type VARCHAR2,
"
"                             p_suplr_id   VARCHAR,
"
"                             p_user       VARCHAR2,
"
"                             p_upd_type   VARCHAR2)
"
"    IS
"
"  v_doc_no suplr_edit_hd.sehd_doc_no%TYPE;
"
"  BEGIN
"
"
"
"COMMIT;
"
"
"
"  DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     --AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type =p_upd_type;
"
"
"
" IF sql%FOUND THEN
"
"    ROLLBACK;
"
"  BEGIN
"
"    SELECT TO_NUMBER (sehd_doc_no)
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN v_doc_no :=NULL;
"
"END;
"
" DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"END IF;
"
"IF v_doc_no IS NULL THEN
"
" if  p_party_type in ('S','C') THEN
"
"  SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id
"
"     AND sehd_party_type = p_party_type;
"
"ELSE
"
"    SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id;
"
"END IF;
"
"END IF;
"
"            INSERT INTO suplr_edit_hd(sehd_bu,
"
"                                      sehd_doc_no,
"
"                                      sehd_doc_date,
"
"                                      sehd_suplr_id,
"
"                                      sehd_status,
"
"                                      sehd_cre_by,
"
"                                      sehd_cre_ip_addr,
"
"                                      sehd_cre_os_user,
"
"                                      sehd_cre_date,
"
"                                      sehd_party_type,
"
"                                      sehd_upd_type)
"
"                               VALUES(p_bu,
"
"                                      v_doc_no,
"
"                                      SYSDATE,
"
"                                      p_suplr_id,
"
"                                      'E',
"
"                                      p_user,
"
"                                      audit_info.get_ip_address,
"
"                                      audit_info.get_os_user,
"
"                                      SYSDATE,
"
"                                      p_party_type,
"
"                                      p_upd_type
"
"                                     );
"
"--      PROC_DEBUG_PROC('LOCATION'||'/'||p_party_type);
"
"        COMMIT;
"
"  END proc_ins_upd_loc;
"
"
"
"  PROCEDURE proc_ins_upd_gl_grp(p_bu         VARCHAR2,
"
"                                p_suplr_id   VARCHAR,
"
"                                p_user       VARCHAR2,
"
"                                p_party_type VARCHAR2,
"
"                                p_upd_type   VARCHAR2)
"
"    IS
"
"  v_doc_no suplr_edit_hd.sehd_doc_no%TYPE;
"
"  BEGIN
"
"  COMMIT;
"
"  DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type =p_upd_type;
"
"
"
"
"
" IF sql%FOUND THEN
"
"    ROLLBACK;
"
"  BEGIN
"
"    SELECT TO_NUMBER (sehd_doc_no)
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN v_doc_no :=NULL;
"
"END;
"
" DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
" --     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"END IF;
"
"
"
"IF v_doc_no IS NULL THEN
"
"  if  p_party_type in ('S','C') THEN
"
"  SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id
"
"     AND sehd_party_type = p_party_type;
"
"ELSE
"
"    SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id;
"
"END IF;
"
"END IF;
"
"            INSERT INTO suplr_edit_hd(sehd_bu,
"
"                                      sehd_doc_no,
"
"                                      sehd_doc_date,
"
"                                      sehd_suplr_id,
"
"                                      sehd_status,
"
"                                      sehd_cre_by,
"
"                                      sehd_cre_ip_addr,
"
"                                      sehd_cre_os_user,
"
"                                      sehd_cre_date,
"
"                                      sehd_party_type,
"
"                                      sehd_upd_type)
"
"                               VALUES(p_bu,
"
"                                      v_doc_no,
"
"                                      SYSDATE,
"
"                                      p_suplr_id,
"
"                                      'E',
"
"                                      p_user,
"
"                                      audit_info.get_ip_address,
"
"                                      audit_info.get_os_user,
"
"                                      SYSDATE,
"
"                                      p_party_type,
"
"                                      p_upd_type
"
"                                     );
"
"  END proc_ins_upd_gl_grp;
"
"
"
"
"
"  PROCEDURE proc_ins_upd_gl_acct(p_bu         VARCHAR2,
"
"                                 p_suplr_id   VARCHAR,
"
"                                 p_user       VARCHAR2,
"
"                                 p_party_type VARCHAR2,
"
"                                 p_upd_type   VARCHAR2)
"
"    IS
"
"  v_doc_no suplr_edit_hd.sehd_doc_no%TYPE;
"
"  BEGIN
"
"COMMIT;
"
"  DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type =p_upd_type;
"
"
"
"
"
" IF sql%FOUND THEN
"
"    ROLLBACK;
"
"  BEGIN
"
"    SELECT TO_NUMBER (sehd_doc_no)
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN v_doc_no :=NULL;
"
"END;
"
" DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"END IF;
"
"
"
" IF v_doc_no IS NULL THEN
"
" if  p_party_type in ('S','C') THEN
"
"  SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id
"
"     AND sehd_party_type = p_party_type;
"
"ELSE
"
"    SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id;
"
"END IF;
"
"END IF;
"
"--    Raise_application_error(-20999,v_doc_no||'/'||p_party_type||'/'||p_suplr_id);
"
"            INSERT INTO suplr_edit_hd(sehd_bu,
"
"                                      sehd_doc_no,
"
"                                      sehd_doc_date,
"
"                                      sehd_suplr_id,
"
"                                      sehd_status,
"
"                                      sehd_cre_by,
"
"                                      sehd_cre_ip_addr,
"
"                                      sehd_cre_os_user,
"
"                                      sehd_cre_date,
"
"                                      sehd_party_type,
"
"                                      sehd_upd_type)
"
"                               VALUES(p_bu,
"
"                                      v_doc_no,
"
"                                      SYSDATE,
"
"                                      p_suplr_id,
"
"                                      'E',
"
"                                      p_user,
"
"                                      audit_info.get_ip_address,
"
"                                      audit_info.get_os_user,
"
"                                      SYSDATE,
"
"                                      p_party_type,
"
"                                      p_upd_type
"
"                                     );
"
"
"
"--           raise_application_error(-20999,p_suplr_id||'/'||p_party_type||'/'||v_doc_no);
"
"
"
"  END proc_ins_upd_gl_acct;
"
"
"
"  PROCEDURE proc_ins_upd_curr(p_bu         VARCHAR2,
"
"                              p_suplr_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_party_type VARCHAR2,
"
"                              p_upd_type   VARCHAR2)
"
"    IS
"
"  v_doc_no suplr_edit_hd.sehd_doc_no%TYPE;
"
"  BEGIN
"
"COMMIT;
"
"
"
"  DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type =p_upd_type;
"
"
"
" IF sql%FOUND THEN
"
"    ROLLBACK;
"
"  BEGIN
"
"    SELECT TO_NUMBER (sehd_doc_no)
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN v_doc_no :=NULL;
"
"END;
"
" DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"END IF;
"
"
"
"IF v_doc_no IS NULL THEN
"
"  if  p_party_type in ('S','C') THEN
"
"  SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id
"
"     AND sehd_party_type = p_party_type;
"
"ELSE
"
"    SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id;
"
"END IF;
"
"END IF;
"
"
"
"   INSERT INTO suplr_edit_hd(sehd_bu,
"
"                                      sehd_doc_no,
"
"                                      sehd_doc_date,
"
"                                      sehd_suplr_id,
"
"                                      sehd_status,
"
"                                      sehd_cre_by,
"
"                                      sehd_cre_ip_addr,
"
"                                      sehd_cre_os_user,
"
"                                      sehd_cre_date,
"
"                                      sehd_party_type,
"
"                                      sehd_upd_type)
"
"                               VALUES(p_bu,
"
"                                      v_doc_no,
"
"                                      SYSDATE,
"
"                                      p_suplr_id,
"
"                                      'E',
"
"                                      p_user,
"
"                                      audit_info.get_ip_address,
"
"                                      audit_info.get_os_user,
"
"                                      SYSDATE,
"
"                                      p_party_type,
"
"                                      p_upd_type
"
"                                     );
"
"  END proc_ins_upd_curr;
"
"
"
"
"
"  PROCEDURE proc_ins_upd_bnk_acct(p_bu         VARCHAR2,
"
"                                  p_suplr_id   VARCHAR,
"
"                                  p_user       VARCHAR2,
"
"                                  p_party_type VARCHAR2,
"
"                                  p_upd_type   VARCHAR2)
"
"    IS
"
"  v_doc_no suplr_edit_hd.sehd_doc_no%TYPE;
"
"  BEGIN
"
"
"
"COMMIT;
"
"
"
"  DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type =p_upd_type;
"
"
"
"
"
" IF sql%FOUND THEN
"
"    ROLLBACK;
"
"  BEGIN
"
"    SELECT TO_NUMBER (sehd_doc_no)
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN v_doc_no :=NULL;
"
"END;
"
" DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"END IF;
"
"
"
" IF v_doc_no  IS NULL THEN
"
"  if  p_party_type in ('S','C') THEN
"
"  SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id
"
"     AND sehd_party_type = p_party_type;
"
"ELSE
"
"    SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id;
"
"END IF;
"
"END IF;
"
"            INSERT INTO suplr_edit_hd(sehd_bu,
"
"                                      sehd_doc_no,
"
"                                      sehd_doc_date,
"
"                                      sehd_suplr_id,
"
"                                      sehd_status,
"
"                                      sehd_cre_by,
"
"                                      sehd_cre_ip_addr,
"
"                                      sehd_cre_os_user,
"
"                                      sehd_cre_date,
"
"                                      sehd_party_type,
"
"                                      sehd_upd_type)
"
"                               VALUES(p_bu,
"
"                                      v_doc_no,
"
"                                      SYSDATE,
"
"                                      p_suplr_id,
"
"                                      'E',
"
"                                      p_user,
"
"                                      audit_info.get_ip_address,
"
"                                      audit_info.get_os_user,
"
"                                      SYSDATE,
"
"                                      p_party_type,
"
"                                      p_upd_type
"
"                                     );
"
"  END proc_ins_upd_bnk_acct;
"
"
"
"  PROCEDURE proc_ins_upd_contact(p_bu         VARCHAR2,
"
"                                 p_suplr_id   VARCHAR,
"
"                                 p_user       VARCHAR2,
"
"                                 p_party_type VARCHAR2,
"
"                                 p_upd_type   VARCHAR2)
"
"    IS
"
"  v_doc_no suplr_edit_hd.sehd_doc_no%TYPE;
"
"  BEGIN
"
"
"
"COMMIT;
"
"
"
"  DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type =p_upd_type;
"
"
"
"
"
" IF sql%FOUND THEN
"
"    ROLLBACK;
"
"  BEGIN
"
"    SELECT TO_NUMBER (sehd_doc_no)
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN v_doc_no :=NULL;
"
"END;
"
" DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"END IF;
"
"
"
"IF v_doc_no IS NULL THEN
"
"  if  p_party_type in ('S','C') THEN
"
"  SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id
"
"     AND sehd_party_type = p_party_type;
"
"ELSE
"
"    SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id;
"
"END IF;
"
"END IF;
"
"            INSERT INTO suplr_edit_hd(sehd_bu,
"
"                                      sehd_doc_no,
"
"                                      sehd_doc_date,
"
"                                      sehd_suplr_id,
"
"                                      sehd_status,
"
"                                      sehd_cre_by,
"
"                                      sehd_cre_ip_addr,
"
"                                      sehd_cre_os_user,
"
"                                      sehd_cre_date,
"
"                                      sehd_party_type,
"
"                                      sehd_upd_type)
"
"                               VALUES(p_bu,
"
"                                      v_doc_no,
"
"                                      SYSDATE,
"
"                                      p_suplr_id,
"
"                                      'E',
"
"                                      p_user,
"
"                                      audit_info.get_ip_address,
"
"                                      audit_info.get_os_user,
"
"                                      SYSDATE,
"
"                                      p_party_type,
"
"                                      p_upd_type
"
"                                     );
"
"  END proc_ins_upd_contact;
"
"
"
"  PROCEDURE proc_ins_upd_others(p_bu         VARCHAR2,
"
"                                p_suplr_id   VARCHAR,
"
"                                p_user       VARCHAR2,
"
"                                p_party_type VARCHAR2,
"
"                                p_upd_type   VARCHAR2)
"
"    IS
"
"  v_doc_no suplr_edit_hd.sehd_doc_no%TYPE;
"
"  BEGIN
"
"
"
" COMMIT;
"
"
"
"  DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type =p_upd_type;
"
"
"
"
"
" IF sql%FOUND THEN
"
"    ROLLBACK;
"
"  BEGIN
"
"    SELECT TO_NUMBER (sehd_doc_no)
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN v_doc_no :=NULL;
"
"END;
"
" DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"END IF;
"
"
"
"IF v_doc_no IS NULL THEN
"
"  if  p_party_type in ('S','C') THEN
"
"  SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id
"
"     AND sehd_party_type = p_party_type;
"
"ELSE
"
"    SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id;
"
"END IF;
"
"END IF;
"
"            INSERT INTO suplr_edit_hd(sehd_bu,
"
"                                      sehd_doc_no,
"
"                                      sehd_doc_date,
"
"                                      sehd_suplr_id,
"
"                                      sehd_status,
"
"                                      sehd_cre_by,
"
"                                      sehd_cre_ip_addr,
"
"                                      sehd_cre_os_user,
"
"                                      sehd_cre_date,
"
"                                      sehd_party_type,
"
"                                      sehd_upd_type)
"
"                               VALUES(p_bu,
"
"                                      v_doc_no,
"
"                                      SYSDATE,
"
"                                      p_suplr_id,
"
"                                      'E',
"
"                                      p_user,
"
"                                      audit_info.get_ip_address,
"
"                                      audit_info.get_os_user,
"
"                                      SYSDATE,
"
"                                      p_party_type,
"
"                                      p_upd_type
"
"                                     );
"
"  END proc_ins_upd_others;
"
"
"
"  PROCEDURE proc_ins_upd_msme(p_bu         VARCHAR2,
"
"                              p_suplr_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_party_type VARCHAR2,
"
"                              p_upd_type   VARCHAR2)
"
"    IS
"
"  v_doc_no suplr_edit_hd.sehd_doc_no%TYPE;
"
"  BEGIN
"
"
"
" COMMIT;
"
"
"
"  DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type =p_upd_type;
"
"
"
"
"
" IF sql%FOUND THEN
"
"    ROLLBACK;
"
"  BEGIN
"
"    SELECT TO_NUMBER (sehd_doc_no)
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN v_doc_no :=NULL;
"
"END;
"
"
"
" DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"END IF;
"
"
"
"IF v_doc_no IS NULL THEN
"
" if  p_party_type in ('S','C') THEN
"
"  SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id
"
"     AND sehd_party_type = p_party_type;
"
"ELSE
"
"    SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id;
"
"END IF;
"
"END IF;
"
"            INSERT INTO suplr_edit_hd(sehd_bu,
"
"                                      sehd_doc_no,
"
"                                      sehd_doc_date,
"
"                                      sehd_suplr_id,
"
"                                      sehd_status,
"
"                                      sehd_cre_by,
"
"                                      sehd_cre_ip_addr,
"
"                                      sehd_cre_os_user,
"
"                                      sehd_cre_date,
"
"                                      sehd_party_type,
"
"                                      sehd_upd_type)
"
"                               VALUES(p_bu,
"
"                                      v_doc_no,
"
"                                      SYSDATE,
"
"                                      p_suplr_id,
"
"                                      'E',
"
"                                      p_user,
"
"                                      audit_info.get_ip_address,
"
"                                      audit_info.get_os_user,
"
"                                      SYSDATE,
"
"                                      p_party_type,
"
"                                      p_upd_type
"
"                                     );
"
"  END proc_ins_upd_msme;
"
"
"
"  PROCEDURE proc_ins_upd_credit(p_bu         VARCHAR2,
"
"                              p_suplr_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_party_type VARCHAR2,
"
"                              p_upd_type   VARCHAR2)
"
"    IS
"
"  v_doc_no suplr_edit_hd.sehd_doc_no%TYPE;
"
"  BEGIN
"
"
"
" COMMIT;
"
"
"
"  DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type =p_upd_type;
"
"
"
"
"
" IF sql%FOUND THEN
"
"    ROLLBACK;
"
"  BEGIN
"
"    SELECT TO_NUMBER (sehd_doc_no)
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN v_doc_no :=NULL;
"
"END;
"
"
"
" DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"END IF;
"
"
"
"IF v_doc_no IS NULL THEN
"
" if  p_party_type in ('S','C') THEN
"
"  SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id
"
"     AND sehd_party_type = p_party_type;
"
"ELSE
"
"    SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id;
"
"END IF;
"
"END IF;
"
"            INSERT INTO suplr_edit_hd(sehd_bu,
"
"                                      sehd_doc_no,
"
"                                      sehd_doc_date,
"
"                                      sehd_suplr_id,
"
"                                      sehd_status,
"
"                                      sehd_cre_by,
"
"                                      sehd_cre_ip_addr,
"
"                                      sehd_cre_os_user,
"
"                                      sehd_cre_date,
"
"                                      sehd_party_type,
"
"                                      sehd_upd_type)
"
"                               VALUES(p_bu,
"
"                                      v_doc_no,
"
"                                      SYSDATE,
"
"                                      p_suplr_id,
"
"                                      'E',
"
"                                      p_user,
"
"                                      audit_info.get_ip_address,
"
"                                      audit_info.get_os_user,
"
"                                      SYSDATE,
"
"                                      p_party_type,
"
"                                      p_upd_type
"
"                                     );
"
"  END proc_ins_upd_credit;
"
"
"
"  PROCEDURE proc_ins_upd_ITR(p_bu         VARCHAR2,
"
"                              p_suplr_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_party_type VARCHAR2,
"
"                              p_upd_type   VARCHAR2)
"
"    IS
"
"  v_doc_no suplr_edit_hd.sehd_doc_no%TYPE;
"
"  BEGIN
"
"
"
" COMMIT;
"
"
"
"  DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type =p_upd_type;
"
"
"
"
"
" IF sql%FOUND THEN
"
"    ROLLBACK;
"
"  BEGIN
"
"    SELECT TO_NUMBER (sehd_doc_no)
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN v_doc_no :=NULL;
"
"END;
"
"
"
" DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"END IF;
"
"
"
"IF v_doc_no IS NULL THEN
"
" if  p_party_type in ('S','C') THEN
"
"  SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id
"
"     AND sehd_party_type = p_party_type;
"
"ELSE
"
"    SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id;
"
"END IF;
"
"END IF;
"
"            INSERT INTO suplr_edit_hd(sehd_bu,
"
"                                      sehd_doc_no,
"
"                                      sehd_doc_date,
"
"                                      sehd_suplr_id,
"
"                                      sehd_status,
"
"                                      sehd_cre_by,
"
"                                      sehd_cre_ip_addr,
"
"                                      sehd_cre_os_user,
"
"                                      sehd_cre_date,
"
"                                      sehd_party_type,
"
"                                      sehd_upd_type)
"
"                               VALUES(p_bu,
"
"                                      v_doc_no,
"
"                                      SYSDATE,
"
"                                      p_suplr_id,
"
"                                      'E',
"
"                                      p_user,
"
"                                      audit_info.get_ip_address,
"
"                                      audit_info.get_os_user,
"
"                                      SYSDATE,
"
"                                      p_party_type,
"
"                                      p_upd_type
"
"                                     );
"
"  END proc_ins_upd_ITR;
"
"
"
"
"
"PROCEDURE proc_ins_upd_unit(p_bu         VARCHAR2,
"
"                              p_suplr_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_party_type VARCHAR2,
"
"                              p_upd_type   VARCHAR2)
"
"    IS
"
"  v_doc_no suplr_edit_hd.sehd_doc_no%TYPE;
"
"  BEGIN
"
"
"
" COMMIT;
"
"
"
"  DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type =p_upd_type;
"
"
"
"
"
" IF sql%FOUND THEN
"
"    ROLLBACK;
"
"  BEGIN
"
"    SELECT TO_NUMBER (sehd_doc_no)
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN v_doc_no :=NULL;
"
"END;
"
"
"
" DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"END IF;
"
"
"
"IF v_doc_no IS NULL THEN
"
" if  p_party_type in ('S','C') THEN
"
"  SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id
"
"     AND sehd_party_type = p_party_type;
"
"ELSE
"
"    SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id;
"
"END IF;
"
"END IF;
"
"            INSERT INTO suplr_edit_hd(sehd_bu,
"
"                                      sehd_doc_no,
"
"                                      sehd_doc_date,
"
"                                      sehd_suplr_id,
"
"                                      sehd_status,
"
"                                      sehd_cre_by,
"
"                                      sehd_cre_ip_addr,
"
"                                      sehd_cre_os_user,
"
"                                      sehd_cre_date,
"
"                                      sehd_party_type,
"
"                                      sehd_upd_type)
"
"                               VALUES(p_bu,
"
"                                      v_doc_no,
"
"                                      SYSDATE,
"
"                                      p_suplr_id,
"
"                                      'E',
"
"                                      p_user,
"
"                                      audit_info.get_ip_address,
"
"                                      audit_info.get_os_user,
"
"                                      SYSDATE,
"
"                                      p_party_type,
"
"                                      p_upd_type
"
"                                     );
"
"  END proc_ins_upd_unit;
"
"
"
"  PROCEDURE proc_ins_upd_unit_loc(p_bu         VARCHAR2,
"
"                              p_suplr_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_party_type VARCHAR2,
"
"                              p_upd_type   VARCHAR2)
"
"    IS
"
"  v_doc_no suplr_edit_hd.sehd_doc_no%TYPE;
"
"  BEGIN
"
"--  raise_application_error(-20999,'hrm'||'/'||v_doc_no||'/'||p_suplr_id);
"
" COMMIT;
"
"
"
"  DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type =p_upd_type;
"
"
"
"
"
" IF sql%FOUND THEN
"
"
"
"    ROLLBACK;
"
"  BEGIN
"
"    SELECT TO_NUMBER (sehd_doc_no)
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN v_doc_no :=NULL;
"
"END;
"
"
"
" DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"END IF;
"
"--raise_application_error(-20999,'hrm1'||'/' ||v_doc_no);
"
"IF v_doc_no IS NULL THEN
"
"--raise_application_error(-20999,'hrm1'||'/' ||v_doc_no);
"
" if  p_party_type in ('S','C') THEN
"
"  SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id
"
"     AND sehd_party_type = p_party_type;
"
"
"
"--      raise_application_error(-20999,'hrm'||'/' ||v_doc_no);
"
"ELSE
"
"    SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id;
"
"END IF;
"
"END IF;
"
"            INSERT INTO suplr_edit_hd(sehd_bu,
"
"                                      sehd_doc_no,
"
"                                      sehd_doc_date,
"
"                                      sehd_suplr_id,
"
"                                      sehd_status,
"
"                                      sehd_cre_by,
"
"                                      sehd_cre_ip_addr,
"
"                                      sehd_cre_os_user,
"
"                                      sehd_cre_date,
"
"                                      sehd_party_type,
"
"                                      sehd_upd_type)
"
"                               VALUES(p_bu,
"
"                                      v_doc_no,
"
"                                      SYSDATE,
"
"                                      p_suplr_id,
"
"                                      'E',
"
"                                      p_user,
"
"                                      audit_info.get_ip_address,
"
"                                      audit_info.get_os_user,
"
"                                      SYSDATE,
"
"                                      p_party_type,
"
"                                      p_upd_type
"
"                                     );
"
"
"
"--   raise_application_error(-20999,'hrm1'||'/' ||v_doc_no);
"
"  END proc_ins_upd_unit_loc;
"
"
"
"  PROCEDURE proc_ins_upd_T_C(p_bu         VARCHAR2,
"
"                              p_party_type VARCHAR2,
"
"                              p_suplr_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_upd_type   VARCHAR2)
"
"    IS
"
"    v_doc_no suplr_edit_hd.sehd_doc_no%TYPE;
"
"  BEGIN
"
"
"
" COMMIT;
"
"
"
"  DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type =p_upd_type;
"
"
"
"
"
" IF sql%FOUND THEN
"
"    ROLLBACK;
"
"  BEGIN
"
"    SELECT TO_NUMBER (sehd_doc_no)
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN v_doc_no :=NULL;
"
"END;
"
"
"
" DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"END IF;
"
"
"
"IF v_doc_no IS NULL THEN
"
" if  p_party_type in ('S','C') THEN
"
"  SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id
"
"     AND sehd_party_type = p_party_type;
"
"ELSE
"
"    SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id;
"
"END IF;
"
"END IF;
"
"
"
"            INSERT INTO suplr_edit_hd(sehd_bu,
"
"                                      sehd_doc_no,
"
"                                      sehd_doc_date,
"
"                                      sehd_suplr_id,
"
"                                      sehd_status,
"
"                                      sehd_cre_by,
"
"                                      sehd_cre_ip_addr,
"
"                                      sehd_cre_os_user,
"
"                                      sehd_cre_date,
"
"                                      sehd_party_type,
"
"                                      sehd_upd_type)
"
"                               VALUES(p_bu,
"
"                                      v_doc_no,
"
"                                      SYSDATE,
"
"                                      p_suplr_id,
"
"                                      'E',
"
"                                      p_user,
"
"                                      audit_info.get_ip_address,
"
"                                      audit_info.get_os_user,
"
"                                      SYSDATE,
"
"                                      p_party_type,
"
"                                      p_upd_type
"
"                                     );
"
"  COMMIT;
"
"  END proc_ins_upd_T_C;
"
"
"
"  PROCEDURE proc_ins_upd_esi(p_bu         VARCHAR2,
"
"                              p_party_type VARCHAR2,
"
"                              p_suplr_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_upd_type   VARCHAR2)
"
"    IS
"
"    v_doc_no suplr_edit_hd.sehd_doc_no%TYPE;
"
"  BEGIN
"
"
"
" COMMIT;
"
"
"
"  DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type =p_upd_type;
"
"
"
"
"
" IF sql%FOUND THEN
"
"    ROLLBACK;
"
"  BEGIN
"
"    SELECT TO_NUMBER (sehd_doc_no)
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN v_doc_no :=NULL;
"
"END;
"
"
"
" DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"END IF;
"
"
"
"IF v_doc_no IS NULL THEN
"
" if  p_party_type in ('S','C') THEN
"
"  SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id
"
"     AND sehd_party_type = p_party_type;
"
"ELSE
"
"    SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id;
"
"END IF;
"
"END IF;
"
"--raise_application_error(-20999,p_bu||'/'||v_doc_no||'/'||p_suplr_id||'/'||p_user||'/'||audit_info.get_ip_address||'/'||audit_info.get_os_user||'/'||p_party_type||'/'||p_upd_type);
"
"            INSERT INTO suplr_edit_hd(sehd_bu,
"
"                                      sehd_doc_no,
"
"                                      sehd_doc_date,
"
"                                      sehd_suplr_id,
"
"                                      sehd_status,
"
"                                      sehd_cre_by,
"
"                                      sehd_cre_ip_addr,
"
"                                      sehd_cre_os_user,
"
"                                      sehd_cre_date,
"
"                                      sehd_party_type,
"
"                                      sehd_upd_type)
"
"                               VALUES(p_bu,
"
"                                      v_doc_no,
"
"                                      SYSDATE,
"
"                                      p_suplr_id,
"
"                                      'E',
"
"                                      p_user,
"
"                                      audit_info.get_ip_address,
"
"                                      audit_info.get_os_user,
"
"                                      SYSDATE,
"
"                                      p_party_type,
"
"                                      p_upd_type
"
"                                     );
"
"  END proc_ins_upd_esi;
"
"
"
"   PROCEDURE proc_ins_upd_tds(p_bu         VARCHAR2,
"
"                              p_party_type VARCHAR2,
"
"                              p_suplr_id   VARCHAR,
"
"                              p_user       VARCHAR2,
"
"                              p_upd_type   VARCHAR2)
"
"    IS
"
"    v_doc_no suplr_edit_hd.sehd_doc_no%TYPE;
"
"  BEGIN
"
"
"
" COMMIT;
"
"
"
"  DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type =p_upd_type;
"
"
"
"
"
" IF sql%FOUND THEN
"
"    ROLLBACK;
"
"  BEGIN
"
"    SELECT TO_NUMBER (sehd_doc_no)
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN v_doc_no :=NULL;
"
"END;
"
"
"
" DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"--     AND sehd_party_type = p_party_type
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"END IF;
"
"
"
"IF v_doc_no IS NULL THEN
"
" if  p_party_type in ('S','C') THEN
"
"  SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id
"
"     AND sehd_party_type = p_party_type;
"
"ELSE
"
"    SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id;
"
"END IF;
"
"END IF;
"
"--raise_application_error(-20999,p_bu||'/'||v_doc_no||'/'||p_suplr_id||'/'||p_user||'/'||audit_info.get_ip_address||'/'||audit_info.get_os_user||'/'||p_party_type||'/'||p_upd_type);
"
"            INSERT INTO suplr_edit_hd(sehd_bu,
"
"                                      sehd_doc_no,
"
"                                      sehd_doc_date,
"
"                                      sehd_suplr_id,
"
"                                      sehd_status,
"
"                                      sehd_cre_by,
"
"                                      sehd_cre_ip_addr,
"
"                                      sehd_cre_os_user,
"
"                                      sehd_cre_date,
"
"                                      sehd_party_type,
"
"                                      sehd_upd_type)
"
"                               VALUES(p_bu,
"
"                                      v_doc_no,
"
"                                      SYSDATE,
"
"                                      p_suplr_id,
"
"                                      'E',
"
"                                      p_user,
"
"                                      audit_info.get_ip_address,
"
"                                      audit_info.get_os_user,
"
"                                      SYSDATE,
"
"                                      p_party_type,
"
"                                      p_upd_type
"
"                                     );
"
"  END proc_ins_upd_tds;
"
"
"
"  PROCEDURE proc_ins_upd_stat_athu(p_bu         VARCHAR2,
"
"                                      p_suplr_id   VARCHAR,
"
"                                      p_user       VARCHAR2,
"
"                                      p_party_type VARCHAR2,
"
"                                      p_upd_type   VARCHAR2)
"
"    IS
"
"  v_doc_no suplr_edit_hd.sehd_doc_no%TYPE;
"
"  BEGIN
"
"
"
"  COMMIT;
"
"
"
"  DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type =p_upd_type;
"
"
"
"  IF sql%FOUND THEN
"
"    ROLLBACK;
"
"  BEGIN
"
"    SELECT TO_NUMBER (sehd_doc_no)
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     --AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN v_doc_no :=NULL;
"
"END;
"
" DELETE suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_status  ='E'
"
"     AND sehd_suplr_id = p_suplr_id
"
"     AND sehd_upd_type = p_upd_type;
"
"END IF;
"
"
"
"IF v_doc_no IS NULL THEN
"
"if  p_party_type in ('S','C') THEN
"
"   SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id
"
"     AND sehd_party_type = p_party_type;
"
"ELSE
"
"    SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"    INTO v_doc_no
"
"    FROM suplr_edit_hd
"
"   WHERE sehd_bu         = p_bu
"
"     AND sehd_suplr_id   = p_suplr_id;
"
"END IF;
"
"END IF;
"
"--RAISE_APPLICATION_ERROR(-20999,v_doc_no);
"
"
"
"            INSERT INTO suplr_edit_hd(sehd_bu,
"
"                                      sehd_doc_no,
"
"                                      sehd_doc_date,
"
"                                      sehd_suplr_id,
"
"                                      sehd_status,
"
"                                      sehd_cre_by,
"
"                                      sehd_cre_ip_addr,
"
"                                      sehd_cre_os_user,
"
"                                      sehd_cre_date,
"
"                                      sehd_party_type,
"
"                                      sehd_upd_type)
"
"                               VALUES(p_bu,
"
"                                      v_doc_no,
"
"                                      SYSDATE,
"
"                                      p_suplr_id,
"
"                                      'E',
"
"                                      p_user,
"
"                                      audit_info.get_ip_address,
"
"                                      audit_info.get_os_user,
"
"                                      SYSDATE,
"
"                                      p_party_type,
"
"                                      p_upd_type
"
"                                     );
"
"  END proc_ins_upd_stat_athu;
"
"
"
"  PROCEDURE proc_ins_suplr_edit_temp(p_bu          VARCHAR2,
"
"                                     p_suplr_id    VARCHAR2,
"
"                                     p_doc_no      VARCHAR2,
"
"                                     p_user        VARCHAR2,
"
"                                     p_lang        VARCHAR2,
"
"                                     p_user_sid    NUMBER,
"
"                                     p_particular  VARCHAR2,
"
"                                     p_select      VARCHAR2,
"
"                                     p_unit        VARCHAR2)
"
"IS
"
"   CURSOR c1
"
"   IS
"
"      SELECT *
"
"        FROM suppliers
"
"       WHERE suplr_bu = p_bu
"
"         AND suplr_suplr_id = p_suplr_id
"
"--         AND suplr_party_type ='S'
"
"         AND suplr_status = 'A';
"
"   CURSOR c2
"
"   IS
"
"      SELECT *
"
"        FROM suplr_ship_loc
"
"       WHERE ssl_bu = p_bu
"
"         AND ssl_suplr_id = p_suplr_id
"
"         AND ssl_loc_name1 = p_select ;
"
"   CURSOR c3
"
"   IS
"
"      SELECT *
"
"        FROM suplr_gl_group
"
"       WHERE sgg_bu = p_bu
"
"         AND sgg_suplr_id = p_suplr_id
"
"         AND (sgg_cl_id = p_select OR p_select IS NULL);
"
"  CURSOR c4
"
"   IS
"
"      SELECT *
"
"        FROM suplr_plant_accts
"
"       WHERE spla_bu = p_bu
"
"         AND spla_suplr_id = p_suplr_id
"
"         AND (spla_acct||spla_plnt = p_select OR p_select IS NULL)
"
"         AND (spla_plnt = p_unit OR p_unit IS NULL);
"
"
"
"  CURSOR c5
"
"   IS
"
"      SELECT *
"
"        FROM suplr_curr_bal
"
"       WHERE scb_bu = p_bu
"
"         AND scb_suplr_id = p_suplr_id
"
"         AND (scb_currency = p_select OR p_select IS NULL);
"
"  CURSOR c6
"
"   IS
"
"      SELECT *
"
"        FROM suplr_pay_bank_dtls
"
"         WHERE spbd_bu = p_bu
"
"         AND spbd_suplr_id = p_suplr_id
"
"         AND (SPBD_PAY_BANK_NAME||SPBD_SUPLR_ID||SPBD_BRANCH_DESC = p_select OR p_select IS NULL);
"
"  CURSOR c7
"
"   IS
"
"      SELECT *
"
"        FROM suplr_contact_info
"
"       WHERE sci_bu = p_bu
"
"         AND sci_suplr_id = p_suplr_id
"
"         AND (sci_seq_id = p_select OR p_select IS NULL);
"
"
"
"  CURSOR C9
"
"    IS
"
"     SELECT *
"
"     FROM cust_suplr_bl_doc
"
"    WHERE csbd_bu     = p_bu
"
"      AND csbd_doc_no = p_doc_no
"
"      AND csbd_cs_id  = p_suplr_id;
"
"
"
"   CURSOR C10
"
"     IS
"
"     SELECT *
"
"      FROM suplr_ded_exempt_dtls
"
"     WHERE sded_bu=p_bu
"
"      AND sded_suplr_id =p_suplr_id
"
"      AND (sded_exempt_cert_no||sded_seq_no=p_select or p_select is null);
"
"
"
"  CURSOR C11
"
"  IS
"
"  SELECT *
"
"   FROM upd_cust_cr_limit
"
"   WHERE uccl_bu=p_bu
"
"   AND uccl_cust_id=p_suplr_id
"
"   AND (uccl_doc_no =p_select or p_select is null);
"
"
"
" CURSOR C12
"
"  IS
"
"  SELECT *
"
"   FROM suplr_itr_dtls
"
"   WHERE sid_bu=p_bu
"
"     AND sid_suplr_id=p_suplr_id
"
"     AND (Sid_Fin_Year =p_select or p_select is null);
"
"
"
"
"
"  CURSOR C13
"
"  IS
"
"  SELECT *
"
"   FROM SUPLR_PLANT_ASSO
"
"   WHERE SPA_BU=p_bu
"
"     AND SPA_CUST_ID=p_suplr_id
"
"     AND (SPA_PLANT_ID =p_unit or p_unit is null);
"
"
"
" CURSOR C14
"
"  IS
"
"  SELECT *
"
"   FROM SUPLR_PLANT_LOC_SUB_ASSO
"
"   WHERE SPLSA_BU=p_bu
"
"     AND SPLSA_CUST_ID=p_suplr_id
"
"     AND (SPLSA_PLANT_LOC_ID =p_select or p_select is null);
"
"
"
" CURSOR C15
"
"  IS
"
"  SELECT *
"
"   FROM SUPLR_TNC_ATTR
"
"   WHERE STA_BU=p_bu
"
"     AND STA_SUPLR_ID=p_suplr_id
"
"     AND (STA_ATTR_ID =p_select or p_select is null);
"
"
"
"CURSOR C15a  (c_SEQ_NO NUMBER)
"
"  IS
"
"  SELECT *
"
"   FROM SUPLR_TNC_ATTR_VAL
"
"   WHERE STAV_BU =p_bu
"
"     AND STAV_SUPLR_ID = p_suplr_id
"
"     AND STAV_SEQ_NO = c_SEQ_NO;
"
"  v_seq_no NUMBER(5);
"
"
"
"   CURSOR C16
"
"  IS
"
"    SELECT *
"
" FROM suplr_bill_ded
"
"  WHERE sbd_bu  = p_bu
"
"    --AND sbd_ded_type = 'T'
"
"    AND sbd_ded_suplr_id||sbd_fin_year = p_select
"
"    AND sbd_suplr_id = p_suplr_id;
"
"BEGIN
"
"
"
"   DELETE FROM suppliers_edit_temp
"
"         WHERE suplr_bu = p_bu
"
"               AND suplr_suplr_id = p_suplr_id
"
"               AND suplr_doc_no = p_doc_no;
"
"
"
"   DELETE FROM suplr_ship_loc_edit_temp
"
"         WHERE  ssl_bu = p_bu
"
"               AND ssl_suplr_id = p_suplr_id
"
"               AND ssl_doc_no = p_doc_no;
"
"
"
"   DELETE FROM suplr_gl_group_edit_temp
"
"         WHERE  sgg_bu = p_bu
"
"               AND sgg_suplr_id = p_suplr_id
"
"               AND sgg_doc_no = p_doc_no;
"
"
"
"   DELETE FROM suplr_plant_accts_edit_temp
"
"         WHERE  spla_bu = p_bu
"
"               AND spla_suplr_id = p_suplr_id
"
"               AND spla_doc_no = p_doc_no;
"
"
"
"   DELETE FROM suplr_curr_bal_edit_temp
"
"         WHERE  scb_bu = p_bu
"
"               AND scb_suplr_id = p_suplr_id
"
"               AND scb_doc_no = p_doc_no;
"
"
"
"   DELETE FROM suplr_pay_bank_dtls_ed_temp
"
"         WHERE  spbd_bu = p_bu
"
"               AND spbd_suplr_id = p_suplr_id
"
"               AND spbd_doc_no = p_doc_no;
"
"
"
"   DELETE FROM suplr_contact_info_edit_temp
"
"         WHERE  sci_bu = p_bu
"
"               AND sci_suplr_id = p_suplr_id
"
"               AND sci_doc_no = p_doc_no;
"
"
"
"   DELETE FROM cust_suplr_bl_doc_edit_temp
"
"         WHERE  csbd_bu = p_bu
"
"               AND csbd_cs_id = p_suplr_id
"
"               AND csbdT_doc_no = p_doc_no;
"
"
"
"   DELETE FROM suplr_ded_exempt_dtls_ed_temp
"
"         WHERE  sded_bu = p_bu
"
"               AND sded_suplr_id = p_suplr_id
"
"               AND sded_doc_no = p_doc_no;
"
"
"
"    DELETE FROM upd_cust_cr_limit_ed_temp
"
"         WHERE  uccl_bu = p_bu
"
"               AND uccl_cust_id = p_suplr_id
"
"               AND UCCL_TEMP_DOC_NO = p_doc_no ;
"
"
"
"   DELETE FROM SUPLR_ITR_DTLS_edit_temp
"
"         WHERE sid_bu  = p_bu
"
"           AND sid_suplr_id = p_suplr_id
"
"           AND SID_TEMP_DOC_NO = p_doc_no;
"
"
"
"      DELETE FROM SUPLR_PLANT_ASSO_EDIT_TEMP
"
"         WHERE SPA_BU  = p_bu
"
"           AND SPA_CUST_ID = p_suplr_id
"
"           AND SPA_DOC_NO = p_doc_no;
"
"
"
"          DELETE FROM SUPLR_PLANT_LOC_SUB_ASSO_ED_TEMP
"
"         WHERE SPLSA_BU  = p_bu
"
"           AND SPLSA_CUST_ID = p_suplr_id
"
"           AND SPLSA_DOC_NO = p_doc_no;
"
"
"
"      DELETE FROM SUPLR_TNC_ATTR_EDIT_TEMP
"
"         WHERE STA_BU  = p_bu
"
"           AND STA_SUPLR_ID = p_suplr_id
"
"           AND STA_DOC_NO = p_doc_no;
"
"
"
"
"
"   DELETE FROM SUPLR_TNC_ATTR_VAL_EDIT_TEMP
"
"         WHERE STAV_BU  = p_bu
"
"           AND STAV_SUPLR_ID = p_suplr_id
"
"           AND STAV_DOC_NO = p_doc_no;
"
"
"
"   DELETE FROM suplr_bill_ded_edit
"
"         WHERE SBD_BU  = p_bu
"
"           AND SBD_SUPLR_ID = p_suplr_id
"
"           AND SBD_DOC_NO = p_doc_no;
"
"
"
"   DELETE FROM suplr_bill_ded_temp
"
"         WHERE SBD_BU  = p_bu
"
"           AND SBD_SUPLR_ID = p_suplr_id
"
"           AND SBD_DOC_NO = p_doc_no;
"
"
"
"--RAISE_APPLICATION_ERROR(-20999,p_suplr_id);
"
"IF p_particular IN ('ADDRESS','OTHERS','MSME','Stat. Authority') THEN
"
"
"
"    FOR cr1 IN c1
"
"     LOOP
"
"       INSERT INTO suppliers_edit_temp(suplr_bu,
"
"                                       suplr_suplr_id,
"
"                                       suplr_doc_no,
"
"                                       suplr_status,
"
"                                       suplr_name1,
"
"                                       suplr_name2,
"
"                                       suplr_currency,
"
"                                       suplr_group_id,
"
"                                       suplr_subgroup,
"
"                                       suplr_fob_id,
"
"                                       suplr_term_id,
"
"                                       suplr_shipvia_id,
"
"                                       suplr_credit_limit,
"
"                                       suplr_cust_code,
"
"                                       suplr_parent_suplr_id,
"
"                                       suplr_addr1,
"
"                                       suplr_addr2,
"
"                                       suplr_addr3,
"
"                                       suplr_city,
"
"                                       suplr_state,
"
"                                       suplr_country,
"
"                                       suplr_zip,
"
"                                       suplr_tele1,
"
"                                       suplr_tele2,
"
"                                       suplr_fax1,
"
"                                       suplr_fax2,
"
"                                       suplr_email1,
"
"                                       suplr_email2,
"
"                                       suplr_web_site1,
"
"                                       suplr_web_site2,
"
"                                       suplr_pay_mode,
"
"                                       suplr_class,
"
"                                       suplr_vat,
"
"                                       suplr_terr_id,
"
"                                       suplr_ra_status,
"
"                                       suplr_transport_flag,
"
"                                       suplr_price_basis,
"
"                                       suplr_mode_pur,
"
"                                       suplr_mode_sc,
"
"                                       suplr_mode_gen,
"
"                                       suplr_svt,
"
"                                       suplr_allw_cr_bal_flag,
"
"                                       suplr_pay_acct_type,
"
"                                       suplr_part_flag,
"
"                                       suplr_gst_rof,
"
"                                       suplr_wfr_tckng_agency,
"
"                                       suplr_wfr_rcrtng_agency,
"
"                                       suplr_wfr_mpw_agncy,
"
"                                       suplr_rnd_digit,
"
"                                       suplr_patner_flg,
"
"                                       suplr_ded_rnd_type,
"
"                                       suplr_gst_edit_flag,
"
"                                       suplr_max_disc_amt,
"
"                                       suplr_black_list_flg,
"
"                                       suplr_disallow_adv_flag,
"
"                                       suplr_tds_tl_chk_flag,
"
"                                       suplr_cash_indvl_txn_amt,
"
"                                       suplr_cash_dly_pymnt_flag,
"
"                                       suplr_cash_dly_pymnt_amt,
"
"                                       suplr_cash_max_limit_flag,
"
"                                       suplr_cash_max_limit_amt,
"
"                                       suplr_msme_type,
"
"                                       suplr_msme_appl_flag,
"
"                                       suplr_msme_no,
"
"                                       suplr_msme_decl_flag,
"
"                                       suplr_cash_dly_pymnt_suplr,
"
"                                       suplr_cash_dly_pymnt_cust,
"
"                                       suplr_cash_dly_pymnt_emp,
"
"                                       suplr_cash_dly_pymnt_pyrl,
"
"                                       suplr_cha_flg,
"
"                                       suplr_frwd_flg,
"
"                                       suplr_cash_indvl_rcpt_amt,
"
"                                       suplr_cash_dly_rcpt_suplr,
"
"                                       suplr_cash_dly_rcpt_cust,
"
"                                       suplr_edit_flg,
"
"                                       suplr_pf_flag,
"
"                                       suplr_esi_flag,
"
"                                       suplr_bill_rnd,
"
"                                       suplr_tcs_rof,
"
"                                       suplr_tcs_ded_flg,
"
"                                       suplr_cre_by,
"
"                                       suplr_cre_date,
"
"                                       suplr_user_sid,
"
"                                       suplr_temp_status,
"
"                                       suplr_mode_sal,
"
"                                       suplr_hold_flag,
"
"                                       suplr_hold_reason,
"
"                                       suplr_ord_hold_flag,
"
"                                       suplr_prnt_capn,
"
"                                       suplr_party_type,
"
"                                       suplr_tcs_appl,
"
"                                       suplr_tds_appl,
"
"                                       suplr_auto_sco_bill_book_flag,
"
"                                       suplr_auto_pur_bill_flag,
"
"                                       suplr_auto_lc_bill_book_flag,
"
"                                       suplr_so_inv_merge_type,
"
"                                       suplr_suppl_inv_type,
"
"                                       suplr_sal_contr_price_src_type,
"
"                                       suplr_lo_dc_cons_type,
"
"                                       suplr_sales_price_source,
"
"                                       suplr_sal_inv_rnd_off,
"
"                                       suplr_ar_term_id,
"
"                                       suplr_sales_person,
"
"                                       suplr_sub_terr_id,
"
"                                       suplr_sales_area,
"
"                                       suplr_sales_terr,
"
"                                       suplr_reference,
"
"                                       suplr_pur_price_basis_source,
"
"                                       suplr_msme_date_frm,
"
"                                       suplr_msme_date_to,
"
"                                       suplr_tcs_acct,
"
"                                       suplr_pan_no,
"
"                                       suplr_doc_class,
"
"                                       suplr_bank_id,
"
"                                       suplr_lgr_grp,
"
"                                       suplr_inc_tax_assese_flag,
"
"                                       suplr_sun_flag,
"
"                                       suplr_mon_flag,
"
"                                       suplr_tue_flag,
"
"                                       suplr_wed_flag,
"
"                                       suplr_thu_flag,
"
"                                       suplr_fri_flag,
"
"                                       suplr_sat_flag,
"
"                                       suplr_cat_id,
"
"                                       suplr_aadhar_no,
"
"                                       SUPLR_ALLOW_DUP_PAN,
"
"                                       SUPLR_TCS_TL_CHK_FLAG,
"
"                                       SUPLR_AADHAAR_NO,
"
"                                       SUPLR_SCO_PRICE_BASIC_SOURCE,
"
"                                       suplr_insured_flag,
"
"                                       suplr_ie_code,
"
"                                       suplr_gst_file_type,
"
"                                       suplr_latitude,
"
"                                       suplr_longitude)
"
"            VALUES(cr1.suplr_bu,
"
"                   cr1.suplr_suplr_id,
"
"                   p_doc_no,
"
"                   'E',
"
"                   cr1.suplr_name1,
"
"                   cr1.suplr_name2,
"
"                   cr1.suplr_currency,
"
"                   cr1.suplr_group_id,
"
"                   cr1.suplr_subgroup,
"
"                   cr1.suplr_fob_id,
"
"                   cr1.suplr_term_id,
"
"                   cr1.suplr_shipvia_id,
"
"                   cr1.suplr_credit_limit,
"
"                   cr1.suplr_cust_code,
"
"                   cr1.suplr_parent_suplr_id,
"
"                   cr1.suplr_addr1,
"
"                   cr1.suplr_addr2,
"
"                   cr1.suplr_addr3,
"
"                   cr1.suplr_city,
"
"                   cr1.suplr_state,
"
"                   cr1.suplr_country,
"
"                   cr1.suplr_zip,
"
"                   cr1.suplr_tele1,
"
"                   cr1.suplr_tele2,
"
"                   cr1.suplr_fax1,
"
"                   cr1.suplr_fax2,
"
"                   cr1.suplr_email1,
"
"                   cr1.suplr_email2,
"
"                   cr1.suplr_web_site1,
"
"                   cr1.suplr_web_site2,
"
"                   cr1.suplr_pay_mode,
"
"                   'N', --cr1.suplr_class,
"
"                    0, --cr1.suplr_vat,
"
"                   cr1.suplr_terr_id,
"
"                   'N', --cr1.suplr_ra_status,
"
"                   cr1.suplr_transport_flag,
"
"                   cr1.suplr_price_basis,
"
"                   cr1.suplr_mode_pur,
"
"                   cr1.suplr_mode_sc,
"
"                   cr1.suplr_mode_gen,
"
"                   cr1.suplr_svt,
"
"                   cr1.suplr_allw_cr_bal_flag,
"
"                   cr1.suplr_pay_acct_type,
"
"                   cr1.suplr_part_flag,
"
"                   cr1.suplr_gst_rof,
"
"                   cr1.suplr_wfr_tckng_agency,
"
"                   cr1.suplr_wfr_rcrtng_agency,
"
"                   cr1.suplr_wfr_mpw_agncy,
"
"                   cr1.suplr_rnd_digit,
"
"                   'N',--cr1.suplr_patner_flg,
"
"                   cr1.suplr_ded_rnd_type,
"
"                   cr1.suplr_gst_edit_flag,
"
"                   cr1.suplr_max_disc_amt,
"
"                   cr1.suplr_black_list_flg,
"
"                   cr1.suplr_disallow_adv_flag,
"
"                   cr1.suplr_tds_tl_chk_flag,
"
"                   cr1.suplr_cash_indvl_txn_amt,
"
"                   cr1.suplr_cash_dly_pymnt_flag,
"
"                   cr1.suplr_cash_dly_pymnt_amt,
"
"                   cr1.suplr_cash_max_limit_flag,
"
"                   cr1.suplr_cash_max_limit_amt,
"
"                   cr1.suplr_msme_type,
"
"                   cr1.suplr_msme_appl_flag,
"
"                   cr1.suplr_msme_no,
"
"                   cr1.suplr_msme_decl_flag,
"
"                   cr1.suplr_cash_dly_pymnt_suplr,
"
"                   cr1.suplr_cash_dly_pymnt_cust,
"
"                   cr1.suplr_cash_dly_pymnt_emp,
"
"                   cr1.suplr_cash_dly_pymnt_pyrl,
"
"                   'N',  --cr1.suplr_cha_flg,
"
"                   cr1.suplr_frwd_flg,
"
"                   cr1.suplr_cash_indvl_rcpt_amt,
"
"                   cr1.suplr_cash_dly_rcpt_suplr,
"
"                   cr1.suplr_cash_dly_rcpt_cust,
"
"                   cr1.suplr_edit_flg,
"
"                   cr1.suplr_pf_flag,
"
"                   cr1.suplr_esi_flag,
"
"                   cr1.suplr_bill_rnd,
"
"                   cr1.suplr_tcs_rof,
"
"                   cr1.suplr_tcs_ded_flg,
"
"                   p_user,
"
"                   SYSDATE,
"
"                   p_user_sid,
"
"                   'C',
"
"                   cr1.suplr_mode_sal,
"
"                   cr1.suplr_hold_flag,
"
"                   cr1.suplr_hold_reason,
"
"                   cr1.suplr_ord_hold_flag,
"
"                   cr1.suplr_prnt_capn,
"
"                   cr1.suplr_party_type,
"
"                   cr1.suplr_tcs_appl,
"
"                   cr1.suplr_tds_appl,
"
"                   cr1.suplr_auto_sco_bill_book_flag,
"
"                   cr1.suplr_auto_pur_bill_flag,
"
"                   cr1.suplr_auto_lc_bill_book_flag,
"
"                   cr1.suplr_so_inv_merge_type,
"
"                   cr1.suplr_suppl_inv_type,
"
"                   cr1.suplr_sal_contr_price_src_type,
"
"                   cr1.suplr_lo_dc_cons_type,
"
"                   cr1.suplr_sales_price_source,
"
"                   cr1.suplr_sal_inv_rnd_off,
"
"                   cr1.suplr_ar_term_id,
"
"                   cr1.suplr_sales_person,
"
"                   cr1.suplr_sub_terr_id,
"
"                   cr1.suplr_sales_area,
"
"                   cr1.suplr_sales_terr,
"
"                   cr1.suplr_reference,
"
"                   cr1.suplr_pur_price_basis_source,
"
"                   cr1.suplr_msme_date_frm,
"
"                   cr1.suplr_msme_date_to,
"
"                   cr1.suplr_tcs_acct,
"
"                   cr1.suplr_pan_no,
"
"                   CR1.suplr_doc_class,
"
"                   cr1.suplr_bank_id,
"
"                   cr1.suplr_lgr_grp,
"
"                   CR1.suplr_inc_tax_assese_flag,
"
"                   CR1.suplr_sun_flag,
"
"                   CR1.suplr_mon_flag,
"
"                   CR1.suplr_tue_flag,
"
"                   CR1.suplr_wed_flag,
"
"                   CR1.suplr_thu_flag,
"
"                   CR1.suplr_fri_flag,
"
"                   CR1.suplr_sat_flag,
"
"                   CR1.suplr_cat_id,
"
"                   cr1.suplr_aadhar_no,
"
"                   cr1.suplr_allow_dup_pan,
"
"                   CR1.SUPLR_TCS_TL_CHK_FLAG,
"
"                   cr1.SUPLR_AADHAAR_NO,
"
"                   CR1.SUPLR_SCO_PRICE_BASIS_SOURCE,
"
"                   cr1.suplr_insured_flag,
"
"                   cr1.suplr_ie_code,
"
"                   cr1.suplr_gst_file_type,
"
"                   cr1.suplr_latitude,
"
"                   cr1.suplr_longitude);
"
"
"
"        INSERT INTO suppliers_edit_temp(suplr_bu,
"
"                                       suplr_suplr_id,
"
"                                       suplr_doc_no,
"
"                                       suplr_status,
"
"                                       suplr_name1,
"
"                                       suplr_name2,
"
"                                       suplr_currency,
"
"                                       suplr_group_id,
"
"                                       suplr_subgroup,
"
"                                       suplr_fob_id,
"
"                                       suplr_term_id,
"
"                                       suplr_shipvia_id,
"
"                                       suplr_credit_limit,
"
"                                       suplr_cust_code,
"
"                                       suplr_parent_suplr_id,
"
"                                       suplr_addr1,
"
"                                       suplr_addr2,
"
"                                       suplr_addr3,
"
"                                       suplr_city,
"
"                                       suplr_state,
"
"                                       suplr_country,
"
"                                       suplr_zip,
"
"                                       suplr_tele1,
"
"                                       suplr_tele2,
"
"                                       suplr_fax1,
"
"                                       suplr_fax2,
"
"                                       suplr_email1,
"
"                                       suplr_email2,
"
"                                       suplr_web_site1,
"
"                                       suplr_web_site2,
"
"                                       suplr_pay_mode,
"
"                                       suplr_class,
"
"                                       suplr_vat,
"
"                                       suplr_terr_id,
"
"                                       suplr_ra_status,
"
"                                       suplr_transport_flag,
"
"                                       suplr_price_basis,
"
"                                       suplr_mode_pur,
"
"                                       suplr_mode_sc,
"
"                                       suplr_mode_gen,
"
"                                       suplr_svt,
"
"                                       suplr_allw_cr_bal_flag,
"
"                                       suplr_pay_acct_type,
"
"                                       suplr_part_flag,
"
"                                       suplr_gst_rof,
"
"                                       suplr_wfr_tckng_agency,
"
"                                       suplr_wfr_rcrtng_agency,
"
"                                       suplr_wfr_mpw_agncy,
"
"                                       suplr_rnd_digit,
"
"                                       suplr_patner_flg,
"
"                                       suplr_ded_rnd_type,
"
"                                       suplr_gst_edit_flag,
"
"                                       suplr_max_disc_amt,
"
"                                       suplr_black_list_flg,
"
"                                       suplr_disallow_adv_flag,
"
"                                       suplr_tds_tl_chk_flag,
"
"                                       suplr_cash_indvl_txn_amt,
"
"                                       suplr_cash_dly_pymnt_flag,
"
"                                       suplr_cash_dly_pymnt_amt,
"
"                                       suplr_cash_max_limit_flag,
"
"                                       suplr_cash_max_limit_amt,
"
"                                       suplr_msme_type,
"
"                                       suplr_msme_appl_flag,
"
"                                       suplr_msme_no,
"
"                                       suplr_msme_decl_flag,
"
"                                       suplr_cash_dly_pymnt_suplr,
"
"                                       suplr_cash_dly_pymnt_cust,
"
"                                       suplr_cash_dly_pymnt_emp,
"
"                                       suplr_cash_dly_pymnt_pyrl,
"
"                                       suplr_cha_flg,
"
"                                       suplr_frwd_flg,
"
"                                       suplr_cash_indvl_rcpt_amt,
"
"                                       suplr_cash_dly_rcpt_suplr,
"
"                                       suplr_cash_dly_rcpt_cust,
"
"                                       suplr_edit_flg,
"
"                                       suplr_pf_flag,
"
"                                       suplr_esi_flag,
"
"                                       suplr_bill_rnd,
"
"                                       suplr_tcs_rof,
"
"                                       suplr_tcs_ded_flg,
"
"                                       suplr_cre_by,
"
"                                       suplr_cre_date,
"
"                                       suplr_user_sid,
"
"                                       suplr_temp_status,
"
"                                       suplr_mode_sal,
"
"                                       suplr_hold_flag,
"
"                                       suplr_hold_reason,
"
"                                       suplr_ord_hold_flag,
"
"                                       suplr_prnt_capn,
"
"                                       suplr_party_type,
"
"                                       suplr_tcs_appl,
"
"                                       suplr_tds_appl,
"
"                                       suplr_auto_sco_bill_book_flag,
"
"                                       suplr_auto_pur_bill_flag,
"
"                                       suplr_auto_lc_bill_book_flag,
"
"                                       suplr_so_inv_merge_type,
"
"                                       suplr_suppl_inv_type,
"
"                                       suplr_sal_contr_price_src_type,
"
"                                       suplr_lo_dc_cons_type,
"
"                                       suplr_sales_price_source,
"
"                                       suplr_sal_inv_rnd_off,
"
"                                       suplr_ar_term_id,
"
"                                       suplr_sales_person,
"
"                                       suplr_sub_terr_id,
"
"                                       suplr_sales_area,
"
"                                       suplr_sales_terr,
"
"                                       suplr_reference,
"
"                                       suplr_pur_price_basis_source,
"
"                                       suplr_msme_date_frm,
"
"                                       suplr_msme_date_to,
"
"                                       suplr_tcs_acct,
"
"                                       suplr_pan_no,
"
"                                       suplr_doc_class,
"
"                                       suplr_bank_id,
"
"                                       suplr_lgr_grp,
"
"                                       suplr_inc_tax_assese_flag,
"
"                                       suplr_aadhar_no,
"
"                                        suplr_sun_flag,
"
"                                       suplr_mon_flag,
"
"                                       suplr_tue_flag,
"
"                                       suplr_wed_flag,
"
"                                       suplr_thu_flag,
"
"                                       suplr_fri_flag,
"
"                                       suplr_sat_flag,
"
"                                       suplr_cat_id,
"
"                                       SUPLR_ALLOW_DUP_PAN,
"
"                                       SUPLR_TCS_TL_CHK_FLAG,
"
"                                       SUPLR_AADHAAR_NO,
"
"                                       SUPLR_SCO_PRICE_BASIC_SOURCE,
"
"                                       suplr_insured_flag,
"
"                                       suplr_ie_code,
"
"                                       suplr_gst_file_type,
"
"                                       suplr_latitude,
"
"                                       suplr_longitude)
"
"           VALUES (cr1.suplr_bu,
"
"                   cr1.suplr_suplr_id,
"
"                   p_doc_no,
"
"                   'E',
"
"                   cr1.suplr_name1,
"
"                   cr1.suplr_name2,
"
"                   cr1.suplr_currency,
"
"                   cr1.suplr_group_id,
"
"                   cr1.suplr_subgroup,
"
"                   cr1.suplr_fob_id,
"
"                   cr1.suplr_term_id,
"
"                   cr1.suplr_shipvia_id,
"
"                   cr1.suplr_credit_limit,
"
"                   cr1.suplr_cust_code,
"
"                   cr1.suplr_parent_suplr_id,
"
"                   cr1.suplr_addr1,
"
"                   cr1.suplr_addr2,
"
"                   cr1.suplr_addr3,
"
"                   cr1.suplr_city,
"
"                   cr1.suplr_state,
"
"                   cr1.suplr_country,
"
"                   cr1.suplr_zip,
"
"                   cr1.suplr_tele1,
"
"                   cr1.suplr_tele2,
"
"                   cr1.suplr_fax1,
"
"                   cr1.suplr_fax2,
"
"                   cr1.suplr_email1,
"
"                   cr1.suplr_email2,
"
"                   cr1.suplr_web_site1,
"
"                   cr1.suplr_web_site2,
"
"                   cr1.suplr_pay_mode,
"
"                   'N', ---cr1.suplr_class,
"
"                    0, --cr1.suplr_vat,
"
"                   cr1.suplr_terr_id,
"
"                   'N', --cr1.suplr_ra_status,
"
"                   cr1.suplr_transport_flag,
"
"                   cr1.suplr_price_basis,
"
"                   cr1.suplr_mode_pur,
"
"                   cr1.suplr_mode_sc,
"
"                   cr1.suplr_mode_gen,
"
"                   cr1.suplr_svt,
"
"                   cr1.suplr_allw_cr_bal_flag,
"
"                   cr1.suplr_pay_acct_type,
"
"                   cr1.suplr_part_flag,
"
"                   cr1.suplr_gst_rof,
"
"                   cr1.suplr_wfr_tckng_agency,
"
"                   cr1.suplr_wfr_rcrtng_agency,
"
"                   cr1.suplr_wfr_mpw_agncy,
"
"                   cr1.suplr_rnd_digit,
"
"                   'N',--cr1.suplr_patner_flg,
"
"                   cr1.suplr_ded_rnd_type,
"
"                   cr1.suplr_gst_edit_flag,
"
"                   cr1.suplr_max_disc_amt,
"
"                   cr1.suplr_black_list_flg,
"
"                   cr1.suplr_disallow_adv_flag,
"
"                   cr1.suplr_tds_tl_chk_flag,
"
"                   cr1.suplr_cash_indvl_txn_amt,
"
"                   cr1.suplr_cash_dly_pymnt_flag,
"
"                   cr1.suplr_cash_dly_pymnt_amt,
"
"                   cr1.suplr_cash_max_limit_flag,
"
"                   cr1.suplr_cash_max_limit_amt,
"
"                   cr1.suplr_msme_type,
"
"                   cr1.suplr_msme_appl_flag,
"
"                   cr1.suplr_msme_no,
"
"                   cr1.suplr_msme_decl_flag,
"
"                   cr1.suplr_cash_dly_pymnt_suplr,
"
"                   cr1.suplr_cash_dly_pymnt_cust,
"
"                   cr1.suplr_cash_dly_pymnt_emp,
"
"                   cr1.suplr_cash_dly_pymnt_pyrl,
"
"                   'N', --cr1.suplr_cha_flg,
"
"                   cr1.suplr_frwd_flg,
"
"                   cr1.suplr_cash_indvl_rcpt_amt,
"
"                   cr1.suplr_cash_dly_rcpt_suplr,
"
"                   cr1.suplr_cash_dly_rcpt_cust,
"
"                   cr1.suplr_edit_flg,
"
"                   cr1.suplr_pf_flag,
"
"                   cr1.suplr_esi_flag,
"
"                   cr1.suplr_bill_rnd,
"
"                   cr1.suplr_tcs_rof,
"
"                   cr1.suplr_tcs_ded_flg,
"
"                   p_user,
"
"                   SYSDATE,
"
"                   p_user_sid,
"
"                   'N',
"
"                   cr1.suplr_mode_sal,
"
"                   cr1.suplr_hold_flag,
"
"                   cr1.suplr_hold_reason,
"
"                   cr1.suplr_ord_hold_flag,
"
"                   cr1.suplr_prnt_capn,
"
"                   cr1.suplr_party_type,
"
"                   cr1.suplr_tcs_appl,
"
"                   cr1.suplr_tds_appl,
"
"                   cr1.suplr_auto_sco_bill_book_flag,
"
"                   cr1.suplr_auto_pur_bill_flag,
"
"                   cr1.suplr_auto_lc_bill_book_flag,
"
"                   cr1.suplr_so_inv_merge_type,
"
"                   cr1.suplr_suppl_inv_type,
"
"                   cr1.suplr_sal_contr_price_src_type,
"
"                   cr1.suplr_lo_dc_cons_type,
"
"                   cr1.suplr_sales_price_source,
"
"                   cr1.suplr_sal_inv_rnd_off,
"
"                   cr1.suplr_ar_term_id,
"
"                   cr1.suplr_sales_person,
"
"                   cr1.suplr_sub_terr_id,
"
"                   cr1.suplr_sales_area,
"
"                   cr1.suplr_sales_terr,
"
"                   cr1.suplr_reference,
"
"                   cr1.suplr_pur_price_basis_source,
"
"                   cr1.suplr_msme_date_frm,
"
"                   cr1.suplr_msme_date_to,
"
"                   cr1.suplr_tcs_acct,
"
"                   cr1.suplr_pan_no,
"
"                   cr1.suplr_doc_class,
"
"                   cr1.suplr_bank_id,
"
"                   cr1.suplr_lgr_grp,
"
"                   CR1.suplr_inc_tax_assese_flag,
"
"                   cr1.Suplr_Aadhar_No,
"
"                   cr1.suplr_sun_flag,
"
"                    cr1.suplr_mon_flag,
"
"                    cr1.suplr_tue_flag,
"
"                    cr1.suplr_wed_flag,
"
"                    cr1.suplr_thu_flag,
"
"                    cr1.suplr_fri_flag,
"
"                    cr1.suplr_sat_flag,
"
"                    cr1.suplr_cat_id,
"
"                    cr1.suplr_allow_dup_pan,
"
"                    CR1.SUPLR_TCS_TL_CHK_FLAG,
"
"                    cr1.SUPLR_AADHAAR_NO,
"
"                    CR1.SUPLR_SCO_PRICE_BASIS_SOURCE,
"
"                    cr1.suplr_insured_flag,
"
"                    cr1.suplr_ie_code,
"
"                    cr1.suplr_gst_file_type,
"
"                    cr1.suplr_latitude,
"
"                    cr1.suplr_longitude);
"
"
"
"  END LOOP;
"
"
"
"ELSIF p_particular ='LOCATION' THEN
"
"--
"
"    FOR cr2 IN c2
"
"     LOOP
"
"
"
"
"
"             SELECT NVL (MAX (ssl_seq_no), 0) + 1
"
"                INTO v_seq_no
"
"              FROM suplr_ship_loc_edit_temp
"
"           WHERE ssl_bu = cr2.ssl_bu
"
"             AND ssl_suplr_id = cr2.ssl_suplr_id
"
"             AND ssl_doc_no = p_doc_no;
"
"
"
"      INSERT INTO suplr_ship_loc_edit_temp (ssl_bu,
"
"                                            ssl_suplr_id,
"
"                                            ssl_doc_no,
"
"                                            --ssl_loc_id,
"
"                                            ssl_loc_name1,
"
"                                            SSL_LOC_NAME1_OLD,
"
"                                            ssl_loc_name2,
"
"                                            ssl_addr1,
"
"                                            ssl_addr2,
"
"                                            ssl_addr3,
"
"                                            ssl_po_box,
"
"                                            ssl_city,
"
"                                            ssl_state,
"
"                                            ssl_country,
"
"                                            ssl_zip,
"
"                                            ssl_tele,
"
"                                            ssl_mob_no,
"
"                                            ssl_fax,
"
"                                            ssl_email,
"
"                                            ssl_website,
"
"                                            ssl_port,
"
"                                            ssl_tin_no,
"
"                                            ssl_ecc_no,
"
"                                            ssl_ser_tax,
"
"                                            ssl_comm_rate,
"
"                                            ssl_ref1,
"
"                                            ssl_ref2,
"
"                                            ssl_cons,
"
"                                            ssl_cre_by,
"
"                                            ssl_cre_date,
"
"                                            ssl_upd_by,
"
"                                            ssl_upd_date,
"
"                                            ssl_cst,
"
"                                            ssl_dflt_flg,
"
"                                            SSL_DFLT_FLG_OLD,
"
"                                            ssl_gst_no,
"
"                                            ssl_gst_type,
"
"                                            ssl_type,
"
"                                            ssl_scheme,
"
"                                            ssl_vat_clsfn,
"
"                                            ssl_vat_type,
"
"                                            ssl_pin_no,
"
"                                            ssl_user_sid,
"
"                                            ssl_trk_type,
"
"                                            --ssl_doc_no,
"
"                                            ssl_seq_no,
"
"                                            ssl_temp_status,
"
"                                            ssl_ln_seq_no,
"
"                                            ssl_active_flag,
"
"                                            ssl_port_of_load,
"
"                                            ssl_port_of_disch,
"
"                                            ssl_fin_dest,
"
"                                            ssl_latitude,
"
"                                            ssl_longitude)
"
"           VALUES (cr2.ssl_bu,
"
"                   cr2.ssl_suplr_id,
"
"                   p_doc_no,
"
"                   --cr2.ssl_loc_id,
"
"                   cr2.ssl_loc_name1,
"
"                   cr2.SSL_LOC_NAME1,
"
"                   cr2.ssl_loc_name2,
"
"                   cr2.ssl_addr1,
"
"                   cr2.ssl_addr2,
"
"                   cr2.ssl_addr3,
"
"                   cr2.ssl_po_box,
"
"                   cr2.ssl_city,
"
"                   cr2.ssl_state,
"
"                   cr2.ssl_country,
"
"                   cr2.ssl_zip,
"
"                   cr2.ssl_tele,
"
"                   cr2.ssl_mob_no,
"
"                   cr2.ssl_fax,
"
"                   cr2.ssl_email,
"
"                   cr2.ssl_website,
"
"                   cr2.ssl_port,
"
"                   cr2.ssl_tin_no,
"
"                   cr2.ssl_ecc_no,
"
"                   cr2.ssl_ser_tax,
"
"                   cr2.ssl_comm_rate,
"
"                   cr2.ssl_ref1,
"
"                   cr2.ssl_ref2,
"
"                   cr2.ssl_cons,
"
"                   p_user,
"
"                   SYSDATE,
"
"                   NULL,
"
"                   NULL,
"
"                   cr2.ssl_cst,
"
"                   cr2.ssl_dflt_flg,
"
"                   CR2.SSL_DFLT_FLG,
"
"                   cr2.ssl_gst_no,
"
"                   cr2.ssl_gst_type,
"
"                   cr2.ssl_type,
"
"                   cr2.ssl_scheme,
"
"                   cr2.ssl_vat_clsfn,
"
"                   cr2.ssl_vat_type,
"
"                   cr2.ssl_pin_no,
"
"                   p_user_sid,
"
"                   'M',
"
"                   --p_doc_no,
"
"                   v_seq_no,
"
"                   'C',
"
"                   cr2.ssl_ln_seq_no,
"
"                   cr2.ssl_active_flag,
"
"                   cr2.ssl_port_of_load,
"
"                   cr2.ssl_port_of_disch,
"
"                   cr2.ssl_fin_dest,
"
"                   cr2.ssl_latitude,
"
"                   cr2.ssl_longitude);
"
"
"
"
"
"      INSERT INTO suplr_ship_loc_edit_temp (ssl_bu,
"
"                                            ssl_suplr_id,
"
"                                            ssl_doc_no,
"
"                                            --ssl_loc_id,
"
"                                            ssl_loc_name1,
"
"                                            ssl_loc_name1_OLD,
"
"                                            ssl_loc_name2,
"
"                                            ssl_addr1,
"
"                                            ssl_addr2,
"
"                                            ssl_addr3,
"
"                                            ssl_po_box,
"
"                                            ssl_city,
"
"                                            ssl_state,
"
"                                            ssl_country,
"
"                                            ssl_zip,
"
"                                            ssl_tele,
"
"                                            ssl_mob_no,
"
"                                            ssl_fax,
"
"                                            ssl_email,
"
"                                            ssl_website,
"
"                                            ssl_port,
"
"                                            ssl_tin_no,
"
"                                            ssl_ecc_no,
"
"                                            ssl_ser_tax,
"
"                                            ssl_comm_rate,
"
"                                            ssl_ref1,
"
"                                            ssl_ref2,
"
"                                            ssl_cons,
"
"                                            ssl_cre_by,
"
"                                            ssl_cre_date,
"
"                                            ssl_upd_by,
"
"                                            ssl_upd_date,
"
"                                            ssl_cst,
"
"                                            ssl_dflt_flg,
"
"                                            SSL_DFLT_FLG_OLD,
"
"                                            ssl_gst_no,
"
"                                            ssl_gst_type,
"
"                                            ssl_type,
"
"                                            ssl_scheme,
"
"                                            ssl_vat_clsfn,
"
"                                            ssl_vat_type,
"
"                                            ssl_pin_no,
"
"                                            ssl_user_sid,
"
"                                            ssl_trk_type,
"
"                                            --ssl_doc_no,
"
"                                            ssl_seq_no,
"
"                                            ssl_temp_status,
"
"                                            ssl_ln_seq_no,
"
"                                            ssl_active_flag,
"
"                                            ssl_port_of_load,
"
"                                            ssl_port_of_disch,
"
"                                            ssl_fin_dest,
"
"                                            ssl_latitude,
"
"                                            ssl_longitude
"
"                                             )
"
"           VALUES (cr2.ssl_bu,
"
"                   cr2.ssl_suplr_id,
"
"                   p_doc_no,
"
"                   --cr2.ssl_loc_id,
"
"                   cr2.ssl_loc_name1,
"
"                   cr2. ssl_loc_name1,
"
"                   cr2.ssl_loc_name2,
"
"                   cr2.ssl_addr1,
"
"                   cr2.ssl_addr2,
"
"                   cr2.ssl_addr3,
"
"                   cr2.ssl_po_box,
"
"                   cr2.ssl_city,
"
"                   cr2.ssl_state,
"
"                   cr2.ssl_country,
"
"                   cr2.ssl_zip,
"
"                   cr2.ssl_tele,
"
"                   cr2.ssl_mob_no,
"
"                   cr2.ssl_fax,
"
"                   cr2.ssl_email,
"
"                   cr2.ssl_website,
"
"                   cr2.ssl_port,
"
"                   cr2.ssl_tin_no,
"
"                   cr2.ssl_ecc_no,
"
"                   cr2.ssl_ser_tax,
"
"                   cr2.ssl_comm_rate,
"
"                   cr2.ssl_ref1,
"
"                   cr2.ssl_ref2,
"
"                   cr2.ssl_cons,
"
"                   p_user,
"
"                   SYSDATE,
"
"                   NULL,
"
"                   NULL,
"
"                   cr2.ssl_cst,
"
"                   cr2.ssl_dflt_flg,
"
"                   CR2.SSL_DFLT_FLG,
"
"                   cr2.ssl_gst_no,
"
"                   cr2.ssl_gst_type,
"
"                   cr2.ssl_type,
"
"                   cr2.ssl_scheme,
"
"                   cr2.ssl_vat_clsfn,
"
"                   cr2.ssl_vat_type,
"
"                   cr2.ssl_pin_no,
"
"                   p_user_sid,
"
"                   'M',
"
"                   --p_doc_no,
"
"                   v_seq_no,
"
"                   'N',
"
"                   cr2.ssl_ln_seq_no,
"
"                   cr2.ssl_active_flag,
"
"                   cr2.ssl_port_of_load,
"
"                   cr2.ssl_port_of_disch,
"
"                   cr2.ssl_fin_dest,
"
"                   cr2.ssl_latitude,
"
"                   cr2.ssl_longitude);
"
"   END LOOP;
"
"
"
"ELSIF  p_particular = 'GL GROUP' THEN
"
"
"
"  FOR cr3 IN c3
"
"    LOOP
"
"               SELECT NVL (MAX (sgg_seq_no), 0) + 1
"
"                  INTO v_seq_no
"
"                FROM suplr_gl_group_edit_temp
"
"              WHERE  sgg_bu = cr3.sgg_bu
"
"                AND sgg_suplr_id = cr3.sgg_suplr_id
"
"                AND sgg_doc_no = p_doc_no;
"
"
"
"    INSERT INTO suplr_gl_group_edit_temp (sgg_bu,
"
"                                            sgg_suplr_id,
"
"                                            sgg_doc_no,
"
"                                            sgg_code,
"
"                                            sgg_cl_id,
"
"                                            sgg_seq_no,
"
"                                            sgg_temp_status,
"
"                                            sgg_trk_type,
"
"                                            sgg_cre_by,
"
"                                            sgg_cre_ip_addr,
"
"                                            sgg_cre_os_user,
"
"                                            sgg_cre_date,
"
"                                            sgg_code_old,
"
"                                            sgg_cl_id_old,
"
"                                            spla_user_sid,
"
"                                            SGG_ACTIVE_FLAG,
"
"                                            SGG_ACTIVE_FLAG_OLD)
"
"           VALUES (cr3.sgg_bu,
"
"                   cr3.sgg_suplr_id,
"
"                   p_doc_no,
"
"                   cr3.sgg_code,
"
"                   cr3.sgg_cl_id,
"
"                   NULL, --v_seq_no,
"
"                   'C',
"
"                   'N',
"
"                   p_user,
"
"                   NULL,
"
"                   NULL,
"
"                   SYSDATE,
"
"                   cr3.sgg_code,
"
"                   cr3.sgg_cl_id,
"
"                   p_user_sid,
"
"                   cr3.SGG_ACTIVE_FLAG,
"
"                   CR3.SGG_ACTIVE_FLAG);
"
"
"
"      INSERT INTO suplr_gl_group_edit_temp (sgg_bu,
"
"                                            sgg_suplr_id,
"
"                                            sgg_doc_no,
"
"                                            sgg_code,
"
"                                            sgg_cl_id,
"
"                                            sgg_seq_no,
"
"                                            sgg_temp_status,
"
"                                            sgg_trk_type,
"
"                                            sgg_cre_by,
"
"                                            sgg_cre_ip_addr,
"
"                                            sgg_cre_os_user,
"
"                                            sgg_cre_date,
"
"                                            sgg_code_old,
"
"                                            sgg_cl_id_old,
"
"                                            spla_user_sid,
"
"                                            SGG_ACTIVE_FLAG,
"
"                                            SGG_ACTIVE_FLAG_OLD)
"
"           VALUES (cr3.sgg_bu,
"
"                   cr3.sgg_suplr_id,
"
"                   p_doc_no,
"
"                   cr3.sgg_code,
"
"                   cr3.sgg_cl_id,
"
"                   NULL, --v_seq_no,
"
"                   'N',
"
"                   'M',
"
"                   p_user,
"
"                   NULL,
"
"                   NULL,
"
"                   SYSDATE,
"
"                   cr3.sgg_code,
"
"                   cr3.sgg_cl_id,
"
"                   p_user_sid,
"
"                   cr3.SGG_ACTIVE_FLAG,
"
"                    cr3.SGG_ACTIVE_FLAG);
"
"     --   Raise_Application_Error(-20999, cr3.sgg_suplr_id);
"
"
"
"  END LOOP;
"
"
"
"ELSIF  p_particular = 'GL ACCOUNT' THEN  --GL ACCOUNT
"
"    --Raise_Application_Error(-20999,p_particular);
"
"
"
"        --raise_application_error(-20999,p_doc_no);
"
"
"
"   FOR cr4 IN c4
"
"     LOOP
"
"     --raise_application_error(-20999,p_doc_no);
"
"            SELECT NVL (MAX (spla_seq_no), 0) + 1
"
"              INTO v_seq_no
"
"              FROM suplr_plant_accts_edit_temp
"
"             WHERE spla_bu = cr4.spla_bu
"
"               AND spla_suplr_id = cr4.spla_suplr_id
"
"               AND spla_doc_no = p_doc_no;
"
"
"
"     --Raise_Application_Error(-20999,p_particular||'~'||cr4.spla_bu||'~'||cr4.spla_suplr_id||'~'||p_doc_no);
"
"
"
"     INSERT INTO suplr_plant_accts_edit_temp (spla_bu,
"
"                                               spla_suplr_id,
"
"                                               spla_doc_no,
"
"                                               spla_lgr_type,
"
"                                               spla_acct,
"
"                                               spla_cre_by,
"
"                                               spla_cre_date,
"
"                                               spla_upd_by,
"
"                                               spla_upd_date,
"
"                                               spla_flag,
"
"                                               spla_cl_id,
"
"                                               spla_plnt,
"
"                                               spla_user_sid,
"
"                                               spla_trk_type,
"
"                                               spla_seq_no,
"
"                                               spla_temp_status,
"
"                                               spla_ln_seq_no,
"
"                                               spla_lgr_type_old,
"
"                                               spla_acct_old,
"
"                                               spla_flag_old,
"
"                                               spla_cl_id_old,
"
"                                               spla_plnt_old,
"
"                                               SPLA_ACTIVE_FLAG,
"
"                                               SPLA_ACTIVE_FLAG_OLD)
"
"           VALUES (cr4.spla_bu,
"
"                   cr4.spla_suplr_id,
"
"                   p_doc_no,
"
"                   cr4.spla_lgr_type,
"
"                   cr4.spla_acct,
"
"                   p_user,
"
"                   SYSDATE,
"
"                   NULL,
"
"                   NULL,
"
"                   cr4.spla_flag,
"
"                   cr4.spla_cl_id,
"
"                   cr4.spla_plnt,
"
"                   p_user_sid,
"
"                   'M',
"
"                   v_seq_no,
"
"                   'C',
"
"                   cr4.spla_ln_seq_no,
"
"                   cr4.spla_lgr_type,
"
"                   cr4.spla_acct,
"
"                   cr4.spla_flag,
"
"                   cr4.spla_cl_id,
"
"                   cr4.spla_plnt,
"
"                   cr4.SPLA_ACTIVE_FLAG,
"
"                   cr4.SPLA_ACTIVE_FLAG);
"
"
"
"      INSERT INTO suplr_plant_accts_edit_temp (spla_bu,
"
"                                               spla_suplr_id,
"
"                                               spla_doc_no,
"
"                                               spla_lgr_type,
"
"                                               spla_acct,
"
"                                               spla_cre_by,
"
"                                               spla_cre_date,
"
"                                               spla_upd_by,
"
"                                               spla_upd_date,
"
"                                               spla_flag,
"
"                                               spla_cl_id,
"
"                                               spla_plnt,
"
"                                               spla_user_sid,
"
"                                               spla_trk_type,
"
"                                               spla_seq_no,
"
"                                               spla_temp_status,
"
"                                               spla_ln_seq_no,
"
"                                               spla_lgr_type_old,
"
"                                               spla_acct_old,
"
"                                               spla_flag_old,
"
"                                               spla_cl_id_old,
"
"                                               spla_plnt_old,
"
"                                               SPLA_ACTIVE_FLAG,
"
"                                               SPLA_ACTIVE_FLAG_OLD)
"
"           VALUES (cr4.spla_bu,
"
"                   cr4.spla_suplr_id,
"
"                   p_doc_no,
"
"                   cr4.spla_lgr_type,
"
"                   cr4.spla_acct,
"
"                   p_user,
"
"                   SYSDATE,
"
"                   NULL,
"
"                   NULL,
"
"                   cr4.spla_flag,
"
"                   cr4.spla_cl_id,
"
"                   cr4.spla_plnt,
"
"                   p_user_sid,
"
"                   'M',
"
"                   v_seq_no,
"
"                   'N',
"
"                   cr4.spla_ln_seq_no,
"
"                   cr4.spla_lgr_type,
"
"                   cr4.spla_acct,
"
"                   cr4.spla_flag,
"
"                   cr4.spla_cl_id,
"
"                   cr4.spla_plnt,
"
"                   cr4.SPLA_ACTIVE_FLAG,
"
"                   cr4.SPLA_ACTIVE_FLAG);
"
"   END LOOP;
"
"
"
"ELSIF  p_particular = 'CURRENCY' THEN
"
"
"
"   FOR cr5 IN c5
"
"     LOOP
"
"                   SELECT NVL (MAX (scb_seq_no), 0) + 1
"
"                       INTO v_seq_no
"
"                     FROM suplr_curr_bal_edit_temp
"
"                  WHERE  scb_bu = cr5.scb_bu
"
"                       AND scb_suplr_id = cr5.scb_suplr_id
"
"                       AND scb_doc_no = p_doc_no;
"
"
"
"           INSERT INTO suplr_curr_bal_edit_temp (scb_bu,
"
"                                            scb_suplr_id,
"
"                                            scb_doc_no,
"
"                                            scb_currency,
"
"                                            scb_currency_old,
"
"                                            scb_crd_lmt,
"
"                                            scb_pend_inv_amt,
"
"                                            scb_cur_bal,
"
"                                            scb_unapp_amt,
"
"                                            scb_adv_amt,
"
"                                            scb_cre_by,
"
"                                            scb_cre_date,
"
"                                            scb_upd_by,
"
"                                            scb_upd_date,
"
"                                            scb_trk_type,
"
"                                            scb_seq_no,
"
"                                            scb_temp_status,
"
"                                            scb_ln_seq_no,
"
"                                            SCB_ACTIVE_FLAG)
"
"           VALUES (cr5.scb_bu,
"
"                   cr5.scb_suplr_id,
"
"                   p_doc_no,
"
"                   cr5.scb_currency,
"
"                   cr5.scb_currency,
"
"                   cr5.scb_crd_lmt,
"
"                   cr5.scb_pend_inv_amt,
"
"                   cr5.scb_cur_bal,
"
"                   cr5.scb_unapp_amt,
"
"                   cr5.scb_adv_amt,
"
"                   p_user,
"
"                   SYSDATE,
"
"                   NULL,
"
"                   NULL,
"
"                   'N',
"
"                   v_seq_no,
"
"                   'C',
"
"                   cr5.scb_ln_seq_no,
"
"                   cr5.SCB_ACTIVE_FLAG);
"
"
"
"      INSERT INTO suplr_curr_bal_edit_temp (scb_bu,
"
"                                            scb_suplr_id,
"
"                                            scb_doc_no,
"
"                                            scb_currency,
"
"                                            scb_currency_old,
"
"                                            scb_crd_lmt,
"
"                                            scb_pend_inv_amt,
"
"                                            scb_cur_bal,
"
"                                            scb_unapp_amt,
"
"                                            scb_adv_amt,
"
"                                            scb_cre_by,
"
"                                            scb_cre_date,
"
"                                            scb_upd_by,
"
"                                            scb_upd_date,
"
"                                            scb_trk_type,
"
"                                            scb_seq_no,
"
"                                            scb_temp_status,
"
"                                            scb_ln_seq_no,
"
"                                            SCB_ACTIVE_FLAG)
"
"           VALUES (cr5.scb_bu,
"
"                   cr5.scb_suplr_id,
"
"                   p_doc_no,
"
"                   cr5.scb_currency,
"
"                   cr5.scb_currency,
"
"                   cr5.scb_crd_lmt,
"
"                   cr5.scb_pend_inv_amt,
"
"                   cr5.scb_cur_bal,
"
"                   cr5.scb_unapp_amt,
"
"                   cr5.scb_adv_amt,
"
"                   p_user,
"
"                   SYSDATE,
"
"                   NULL,
"
"                   NULL,
"
"                   'M',
"
"                   v_seq_no,
"
"                   'N',
"
"                   cr5.scb_ln_seq_no,
"
"                   cr5.SCB_ACTIVE_FLAG);
"
"   END LOOP;
"
"
"
"ELSIF p_particular ='BANK A/C' THEN
"
"
"
"   FOR cr6 IN c6
"
"      LOOP
"
"
"
"      SELECT NVL (MAX (spbd_seq_no), 0) + 1
"
"          INTO v_seq_no
"
"         FROM suplr_pay_bank_dtls_ed_temp
"
"       WHERE spbd_bu = cr6.spbd_bu
"
"         AND spbd_suplr_id = cr6.spbd_suplr_id
"
"         AND spbd_doc_no = p_doc_no;
"
"
"
"      INSERT INTO suplr_pay_bank_dtls_ed_temp (spbd_bu,
"
"                                               spbd_doc_no,
"
"                                               --spbd_pay_bank,
"
"                                               spbd_branch_desc,
"
"                                               spbd_bank_city,
"
"                                               spbd_bank_addr1,
"
"                                               spbd_bank_addr2,
"
"                                               spbd_bank_ifsc_code,
"
"                                               spbd_bank_acc_no,
"
"                                               spbd_cre_by,
"
"                                               spbd_cre_date,
"
"                                               spbd_upd_by,
"
"                                               spbd_upd_date,
"
"                                               spbd_dflt_flag,
"
"                                               spbd_suplr_id,
"
"                                               spbd_pay_acct_type,
"
"                                               spbd_swift_bic,
"
"                                               spbd_iban_no,
"
"                                               spbd_pay_bank_name,
"
"                                               spbd_pay_to_name,
"
"                                               spbd_city_id,
"
"                                               spbd_user_sid,
"
"                                               spbd_trk_type,
"
"                                               --spbd_doc_no,
"
"                                               spbd_seq_no,
"
"                                               spbd_temp_status,
"
"                                               spbd_ln_seq_no,
"
"                                               SPBD_ACTIVE_FLAG)
"
"           VALUES (cr6.spbd_bu,
"
"                   p_doc_no,
"
"                   --cr6.spbd_pay_bank,
"
"                   cr6.spbd_branch_desc,
"
"                   cr6.spbd_bank_city,
"
"                   cr6.spbd_bank_addr1,
"
"                   cr6.spbd_bank_addr2,
"
"                   cr6.spbd_bank_ifsc_code,
"
"                   cr6.spbd_bank_acc_no,
"
"                   p_user,
"
"                   SYSDATE,
"
"                   NULL,
"
"                   NULL,
"
"                   cr6.spbd_dflt_flag,
"
"                   cr6.spbd_suplr_id,
"
"                   cr6.spbd_pay_acct_type,
"
"                   cr6.spbd_swift_bic,
"
"                   cr6.spbd_iban_no,
"
"                   cr6.spbd_pay_bank_name,
"
"                   cr6.spbd_pay_to_name,
"
"                   cr6.spbd_city_id,
"
"                   p_user_sid,
"
"                   'N',
"
"                   --p_doc_no,
"
"                   v_seq_no,
"
"                   'C',
"
"                   cr6.spbd_ln_seq_no,
"
"                   cr6.SPBD_ACTIVE_FLAG);
"
"
"
"      INSERT INTO suplr_pay_bank_dtls_ed_temp (spbd_bu,
"
"                                               spbd_doc_no,
"
"                                               --spbd_pay_bank,
"
"                                               spbd_branch_desc,
"
"                                               spbd_bank_city,
"
"                                               spbd_bank_addr1,
"
"                                               spbd_bank_addr2,
"
"                                               spbd_bank_ifsc_code,
"
"                                               spbd_bank_acc_no,
"
"                                               spbd_cre_by,
"
"                                               spbd_cre_date,
"
"                                               spbd_upd_by,
"
"                                               spbd_upd_date,
"
"                                               spbd_dflt_flag,
"
"                                               spbd_suplr_id,
"
"                                               spbd_pay_acct_type,
"
"                                               spbd_swift_bic,
"
"                                               spbd_iban_no,
"
"                                               spbd_pay_bank_name,
"
"                                               spbd_pay_to_name,
"
"                                               spbd_city_id,
"
"                                               spbd_user_sid,
"
"                                               spbd_trk_type,
"
"                                               --spbd_doc_no,
"
"                                               spbd_seq_no,
"
"                                               spbd_temp_status,
"
"                                               spbd_ln_seq_no,
"
"                                               SPBD_ACTIVE_FLAG)
"
"           VALUES (cr6.spbd_bu,
"
"                   p_doc_no,
"
"                   --cr6.spbd_pay_bank,
"
"                   cr6.spbd_branch_desc,
"
"                   cr6.spbd_bank_city,
"
"                   cr6.spbd_bank_addr1,
"
"                   cr6.spbd_bank_addr2,
"
"                   cr6.spbd_bank_ifsc_code,
"
"                   cr6.spbd_bank_acc_no,
"
"                   p_user,
"
"                   SYSDATE,
"
"                   NULL,
"
"                   NULL,
"
"                   cr6.spbd_dflt_flag,
"
"                   cr6.spbd_suplr_id,
"
"                   cr6.spbd_pay_acct_type,
"
"                   cr6.spbd_swift_bic,
"
"                   cr6.spbd_iban_no,
"
"                   cr6.spbd_pay_bank_name,
"
"                   cr6.spbd_pay_to_name,
"
"                   cr6.spbd_city_id,
"
"                   p_user_sid,
"
"                   'M',
"
"                   --p_doc_no,
"
"                   v_seq_no,
"
"                   'N',
"
"                   cr6.spbd_ln_seq_no,
"
"                   cr6.SPBD_ACTIVE_FLAG);
"
"   END LOOP;
"
"
"
"ELSIF p_particular = 'CONTACT' THEN
"
"
"
"   FOR cr7 IN c7
"
"     LOOP
"
"          SELECT NVL (MAX (sci_seq_no), 0) + 1
"
"            INTO v_seq_no
"
"           FROM suplr_contact_info_edit_temp
"
"         WHERE   sci_bu = cr7.sci_bu
"
"             AND sci_suplr_id = cr7.sci_suplr_id
"
"             AND sci_doc_no = p_doc_no;
"
"
"
"      INSERT INTO suplr_contact_info_edit_temp (sci_bu,
"
"                                                sci_suplr_id,
"
"                                                sci_doc_no,
"
"                                                sci_seq_id,
"
"                                                sci_person_pfx,
"
"                                                sci_person_first_name1,
"
"                                                sci_person_first_name1_OLD,
"
"                                                sci_person_middle_name1,
"
"                                                sci_person_last_name1,
"
"                                                sci_person_first_name2,
"
"                                                sci_person_middle_name2,
"
"                                                sci_person_last_name2,
"
"                                                sci_addr1,
"
"                                                sci_addr2,
"
"                                                sci_addr3,
"
"                                                sci_po_box,
"
"                                                sci_city,
"
"                                                sci_state,
"
"                                                sci_country,
"
"                                                sci_zip,
"
"                                                sci_tele1,
"
"                                                sci_tele2,
"
"                                                sci_fax1,
"
"                                                sci_fax2,
"
"                                                sci_email1,
"
"                                                sci_email2,
"
"                                                sci_position_name,
"
"                                                SCI_POSITION_NAME_OLD,
"
"                                                sci_priority,
"
"                                                sci_cre_by,
"
"                                                sci_cre_date,
"
"                                                sci_upd_by,
"
"                                                sci_upd_date,
"
"                                                sci_mail_flag,
"
"                                                sci_key_person_flag,
"
"                                                sci_department,
"
"                                                sci_user_sid,
"
"                                                sci_trk_type,
"
"                                                --sci_doc_no,
"
"                                                sci_seq_no,
"
"                                                sci_temp_status,
"
"                                                sci_ln_seq_no,
"
"                                                SCI_ACTIVE_FLAG)
"
"           VALUES (cr7.sci_bu,
"
"                   cr7.sci_suplr_id,
"
"                   p_doc_no,
"
"                   cr7.sci_seq_id,
"
"                   cr7.sci_person_pfx,
"
"                   cr7.sci_person_first_name1,
"
"                   cr7.sci_person_first_name1,
"
"                   cr7.sci_person_middle_name1,
"
"                   cr7.sci_person_last_name1,
"
"                   cr7.sci_person_first_name2,
"
"                   cr7.sci_person_middle_name2,
"
"                   cr7.sci_person_last_name2,
"
"                   cr7.sci_addr1,
"
"                   cr7.sci_addr2,
"
"                   cr7.sci_addr3,
"
"                   cr7.sci_po_box,
"
"                   cr7.sci_city,
"
"                   cr7.sci_state,
"
"                   cr7.sci_country,
"
"                   cr7.sci_zip,
"
"                   cr7.sci_tele1,
"
"                   cr7.sci_tele2,
"
"                   cr7.sci_fax1,
"
"                   cr7.sci_fax2,
"
"                   cr7.sci_email1,
"
"                   cr7.sci_email2,
"
"                   cr7.sci_position_name,
"
"                    cr7.sci_position_name,
"
"                   cr7.sci_priority,
"
"                   p_user,
"
"                   SYSDATE,
"
"                   NULL,
"
"                   NULL,
"
"                   cr7.sci_mail_flag,
"
"                   cr7.sci_key_person_flag,
"
"                   cr7.sci_department,
"
"                   p_user_sid,
"
"                   'M',
"
"                   --p_doc_no,
"
"                   v_seq_no,
"
"                   'C',
"
"                   cr7.sci_ln_seq_no,
"
"                   cr7.SCI_ACTIVE_FLAG);
"
"
"
"      INSERT INTO suplr_contact_info_edit_temp (sci_bu,
"
"                                                sci_suplr_id,
"
"                                                sci_doc_no,
"
"                                                sci_seq_id,
"
"                                                sci_person_pfx,
"
"                                                sci_person_first_name1,
"
"                                                 sci_person_first_name1_OLD,
"
"                                                sci_person_middle_name1,
"
"                                                sci_person_last_name1,
"
"                                                sci_person_first_name2,
"
"                                                sci_person_middle_name2,
"
"                                                sci_person_last_name2,
"
"                                                sci_addr1,
"
"                                                sci_addr2,
"
"                                                sci_addr3,
"
"                                                sci_po_box,
"
"                                                sci_city,
"
"                                                sci_state,
"
"                                                sci_country,
"
"                                                sci_zip,
"
"                                                sci_tele1,
"
"                                                sci_tele2,
"
"                                                sci_fax1,
"
"                                                sci_fax2,
"
"                                                sci_email1,
"
"                                                sci_email2,
"
"                                                sci_position_name,
"
"                                                sci_position_name_OLD,
"
"                                                sci_priority,
"
"                                                sci_cre_by,
"
"                                                sci_cre_date,
"
"                                                sci_upd_by,
"
"                                                sci_upd_date,
"
"                                                sci_mail_flag,
"
"                                                sci_key_person_flag,
"
"                                                sci_department,
"
"                                                sci_user_sid,
"
"                                                sci_trk_type,
"
"                                                --sci_doc_no,
"
"                                                sci_seq_no,
"
"                                                sci_temp_status,
"
"                                                sci_ln_seq_no,
"
"                                                SCI_ACTIVE_FLAG)
"
"           VALUES (cr7.sci_bu,
"
"                   cr7.sci_suplr_id,
"
"                   p_doc_no,
"
"                   cr7.sci_seq_id,
"
"                   cr7.sci_person_pfx,
"
"                   cr7.sci_person_first_name1,
"
"                   cr7.sci_person_first_name1,
"
"                   cr7.sci_person_middle_name1,
"
"                   cr7.sci_person_last_name1,
"
"                   cr7.sci_person_first_name2,
"
"                   cr7.sci_person_middle_name2,
"
"                   cr7.sci_person_last_name2,
"
"                   cr7.sci_addr1,
"
"                   cr7.sci_addr2,
"
"                   cr7.sci_addr3,
"
"                   cr7.sci_po_box,
"
"                   cr7.sci_city,
"
"                   cr7.sci_state,
"
"                   cr7.sci_country,
"
"                   cr7.sci_zip,
"
"                   cr7.sci_tele1,
"
"                   cr7.sci_tele2,
"
"                   cr7.sci_fax1,
"
"                   cr7.sci_fax2,
"
"                   cr7.sci_email1,
"
"                   cr7.sci_email2,
"
"                   cr7.sci_position_name,
"
"                   cr7.sci_position_name,
"
"                   cr7.sci_priority,
"
"                   p_user,
"
"                   SYSDATE,
"
"                   NULL,
"
"                   NULL,
"
"                   cr7.sci_mail_flag,
"
"                   cr7.sci_key_person_flag,
"
"                   cr7.sci_department,
"
"                   p_user_sid,
"
"                   'M',
"
"                   --p_doc_no,
"
"                   v_seq_no,
"
"                   'N',
"
"                   cr7.sci_ln_seq_no,
"
"                   cr7.SCI_ACTIVE_FLAG);
"
"   END LOOP;
"
"
"
"ELSIF p_particular = 'Black List' THEN
"
"     FOR cr9 in c9
"
"      loop
"
"       insert into cust_suplr_bl_doc_edit_temp(csbd_bu,
"
"                                        csbd_doc_no,
"
"                                        csbd_doc_date,
"
"                                        csbd_cs_type,
"
"                                        csbd_mode,
"
"                                        csbd_cs_id,
"
"                                        csbd_reco_by,
"
"                                        csbd_reason,
"
"                                        csbd_status,
"
"                                        csbd_cre_by,
"
"                                        csbd_cre_ip_addr,
"
"                                        csbd_cre_os_user,
"
"                                        csbd_cre_date,
"
"                                        csbd_upd_by,
"
"                                        csbd_upd_ip_addr,
"
"                                        csbd_upd_os_user,
"
"                                        csbd_upd_date,
"
"                                        csbd_cre_emp_id,
"
"                                        csbd_upd_emp_id,
"
"                                        csbd_cur_mod_bal,
"
"                                        csbdt_doc_no)
"
"                                 VALUES(cr9.csbd_bu,
"
"                                        cr9.csbd_doc_no,
"
"                                        cr9.csbd_doc_date,
"
"                                        cr9.csbd_cs_type,
"
"                                        cr9.csbd_mode,
"
"                                        cr9.csbd_cs_id,
"
"                                        cr9.csbd_reco_by,
"
"                                        cr9.csbd_reason,
"
"                                        cr9.csbd_status,
"
"                                        p_user,
"
"                                        cr9.csbd_cre_ip_addr,
"
"                                        cr9.csbd_cre_os_user,
"
"                                        SYSDATE,
"
"                                        cr9.csbd_upd_by,
"
"                                        cr9.csbd_upd_ip_addr,
"
"                                        cr9.csbd_upd_os_user,
"
"                                        cr9.csbd_upd_date,
"
"                                        cr9.csbd_cre_emp_id,
"
"                                        cr9.csbd_upd_emp_id,
"
"                                        cr9.csbd_cur_mod_bal,
"
"                                        p_doc_no);
"
"    END LOOP;
"
" ELSIF p_particular = 'EXEMPTED DETAILS' THEN
"
"     FOR cr10 in c10
"
"     LOOP
"
"     SELECT NVL (MAX (sded_doc_no), 0) + 1
"
"          INTO v_seq_no
"
"         FROM suplr_ded_exempt_dtls_ed_temp
"
"       WHERE sded_bu = cr10.sded_bu
"
"         AND sded_suplr_id = cr10.sded_suplr_id
"
"         AND sded_doc_no = p_doc_no;
"
"
"
"    INSERT INTO  suplr_ded_exempt_dtls_ed_temp( SDED_BU,
"
"                                            SDED_SUPLR_ID,
"
"                                            SDED_DED_TYPE,
"
"                                            SDED_DED_SUPLR_ID,
"
"                                            SDED_FIN_YEAR,
"
"                                            SDED_SEQ_NO,
"
"                                            SDED_DATE_FROM,
"
"                                            SDED_DATE_TO,
"
"                                            SDED_EXEMPT_CERT_NO,
"
"                                            SDED_TDS_PCT,
"
"                                            SDED_TYPE,
"
"                                            SDED_LIMIT_AMT,
"
"                                            SDED_INPROG_AMT,
"
"                                            SDED_UTILZED_AMT,
"
"                                            SDED_CRE_BY,
"
"                                            SDED_CRE_IP_ADDR,
"
"                                            SDED_CRE_OS_USER,
"
"                                            SDED_CRE_DATE,
"
"                                            SDED_UPD_BY,
"
"                                            SDED_UPD_IP_ADDR,
"
"                                            SDED_UPD_OS_USER,
"
"                                            SDED_UPD_DATE,
"
"                                            SDED_CRE_EMP_ID,
"
"                                            SDED_UPD_EMP_ID,
"
"                                            SDED_EX_CERT_TYPE,
"
"                                            SDED_TEMP_STATUS,
"
"                                            SDED_DOC_NO,
"
"                                            SDED_TRK_TYPE,
"
"                                           SDED_ACTIVE_FLAG)
"
"                                VALUES    (cr10.SDED_BU,
"
"                                            cr10.SDED_SUPLR_ID,
"
"                                            cr10.SDED_DED_TYPE,
"
"                                            cr10.SDED_DED_SUPLR_ID,
"
"                                            cr10.SDED_FIN_YEAR,
"
"                                            v_seq_no,
"
"                                            cr10.SDED_DATE_FROM,
"
"                                            cr10.SDED_DATE_TO,
"
"                                            cr10.SDED_EXEMPT_CERT_NO,
"
"                                            cr10.SDED_TDS_PCT,
"
"                                            cr10.SDED_TYPE,
"
"                                            cr10.SDED_LIMIT_AMT,
"
"                                            cr10.SDED_INPROG_AMT,
"
"                                            cr10.SDED_UTILZED_AMT,
"
"                                            p_user,
"
"                                            cr10.SDED_CRE_IP_ADDR,
"
"                                            cr10.SDED_CRE_OS_USER,
"
"                                            sysdate,
"
"                                            cr10.SDED_UPD_BY,
"
"                                            cr10.SDED_UPD_IP_ADDR,
"
"                                            cr10.SDED_UPD_OS_USER,
"
"                                            cr10.SDED_UPD_DATE,
"
"                                            cr10.SDED_CRE_EMP_ID,
"
"                                            cr10.SDED_UPD_EMP_ID,
"
"                                            cr10.SDED_EX_CERT_TYPE,
"
"                                            'N',
"
"                                            p_doc_no,
"
"                                            'M',
"
"                                            cr10.SDED_ACTIVE_FLAG);
"
"
"
"INSERT INTO  suplr_ded_exempt_dtls_ed_temp( SDED_BU,
"
"                                            SDED_SUPLR_ID,
"
"                                            SDED_DED_TYPE,
"
"                                            SDED_DED_SUPLR_ID,
"
"                                            SDED_FIN_YEAR,
"
"                                            SDED_SEQ_NO,
"
"                                            SDED_DATE_FROM,
"
"                                            SDED_DATE_TO,
"
"                                            SDED_EXEMPT_CERT_NO,
"
"                                            SDED_TDS_PCT,
"
"                                            SDED_TYPE,
"
"                                            SDED_LIMIT_AMT,
"
"                                            SDED_INPROG_AMT,
"
"                                            SDED_UTILZED_AMT,
"
"                                            SDED_CRE_BY,
"
"                                            SDED_CRE_IP_ADDR,
"
"                                            SDED_CRE_OS_USER,
"
"                                            SDED_CRE_DATE,
"
"                                            SDED_UPD_BY,
"
"                                            SDED_UPD_IP_ADDR,
"
"                                            SDED_UPD_OS_USER,
"
"                                            SDED_UPD_DATE,
"
"                                            SDED_CRE_EMP_ID,
"
"                                            SDED_UPD_EMP_ID,
"
"                                            SDED_EX_CERT_TYPE,
"
"                                            SDED_TEMP_STATUS,
"
"                                            SDED_DOC_NO,
"
"                                            SDED_TRK_TYPE,
"
"                                            SDED_ACTIVE_FLAG)
"
"                                VALUES    (cr10.SDED_BU,
"
"                                            cr10.SDED_SUPLR_ID,
"
"                                            cr10.SDED_DED_TYPE,
"
"                                            cr10.SDED_DED_SUPLR_ID,
"
"                                            cr10.SDED_FIN_YEAR,
"
"                                            v_seq_no,
"
"                                            cr10.SDED_DATE_FROM,
"
"                                            cr10.SDED_DATE_TO,
"
"                                            cr10.SDED_EXEMPT_CERT_NO,
"
"                                            cr10.SDED_TDS_PCT,
"
"                                            cr10.SDED_TYPE,
"
"                                            cr10.SDED_LIMIT_AMT,
"
"                                            cr10.SDED_INPROG_AMT,
"
"                                            cr10.SDED_UTILZED_AMT,
"
"                                            p_user,
"
"                                            cr10.SDED_CRE_IP_ADDR,
"
"                                            cr10.SDED_CRE_OS_USER,
"
"                                            sysdate,
"
"                                            cr10.SDED_UPD_BY,
"
"                                            cr10.SDED_UPD_IP_ADDR,
"
"                                            cr10.SDED_UPD_OS_USER,
"
"                                            cr10.SDED_UPD_DATE,
"
"                                            cr10.SDED_CRE_EMP_ID,
"
"                                            cr10.SDED_UPD_EMP_ID,
"
"                                            cr10.SDED_EX_CERT_TYPE,
"
"                                            'C',
"
"                                            p_doc_no,
"
"                                             'N',
"
"                                            cr10.SDED_ACTIVE_FLAG);
"
"END LOOP;
"
"--  RAISE_APPLICATION_ERROR(-20999,p_particular);
"
"ELSIF p_particular='CREDIT LIMIT' THEN
"
"
"
" FOR cr11 IN c11
"
"     LOOP
"
"      INSERT INTO UPD_CUST_CR_LIMIT_ED_TEMP(UCCL_BU,
"
"                                        UCCL_DOC_NO,
"
"                                        UCCL_DOC_DATE,
"
"                                        UCCL_CUST_ID,
"
"                                        UCCL_CURCY_ID,
"
"                                        UCCL_CUR_CR_LMT_BASIS,
"
"                                        UCCL_CUR_CR_LIMIT,
"
"                                        UCCL_CUR_DUE_DAYS,
"
"                                        UCCL_CUR_NO_OF_INV,
"
"                                        UCCL_NEW_CR_LIMIT,
"
"                                        UCCL_NEW_DUE_DAYS,
"
"                                        UCCL_NEW_NO_OF_INV,
"
"                                        UCCL_STATUS,
"
"                                        UCCL_CRE_BY,
"
"                                        UCCL_CRE_DATE,
"
"                                        UCCL_CRE_OS_USER,
"
"                                        UCCL_CRE_IP_ADDR,
"
"                                        UCCL_CRE_EMP_ID,
"
"                                        UCCL_UPD_BY,
"
"                                        UCCL_UPD_DATE,
"
"                                        UCCL_UPD_OS_USER,
"
"                                        UCCL_UPD_IP_ADDR,
"
"                                        UCCL_UPD_EMP_ID,
"
"                                        UCCL_REF,
"
"                                        UCCL_EFF_FRM,
"
"                                        UCCL_EFF_TO,
"
"                                        UCCL_TEMP_STATUS,
"
"                                        UCCL_TEMP_DOC_NO,
"
"                                        UCCL_TRK_TYPE,
"
"                                        UCCL_NEW_CR_LMT_BASIS)
"
"                             VALUES(      CR11.UCCL_BU,
"
"                                        CR11.UCCL_DOC_NO,
"
"                                        CR11.UCCL_DOC_DATE,
"
"                                        CR11.UCCL_CUST_ID,
"
"                                        CR11.UCCL_CURCY_ID,
"
"                                        CR11.UCCL_CUR_CR_LMT_BASIS,
"
"                                        CR11.UCCL_CUR_CR_LIMIT,
"
"                                        CR11.UCCL_CUR_DUE_DAYS,
"
"                                        CR11.UCCL_CUR_NO_OF_INV,
"
"                                        CR11.UCCL_NEW_CR_LIMIT,
"
"                                        CR11.UCCL_NEW_DUE_DAYS,
"
"                                        CR11.UCCL_NEW_NO_OF_INV,
"
"                                        CR11.UCCL_STATUS,
"
"                                        p_user,
"
"                                        sysdate,
"
"                                        CR11.UCCL_CRE_OS_USER,
"
"                                        CR11.UCCL_CRE_IP_ADDR,
"
"                                        CR11.UCCL_CRE_EMP_ID,
"
"                                        CR11. UCCL_UPD_BY,
"
"                                        CR11.UCCL_UPD_DATE,
"
"                                        CR11.UCCL_UPD_OS_USER,
"
"                                        CR11.UCCL_UPD_IP_ADDR,
"
"                                        CR11.UCCL_UPD_EMP_ID,
"
"                                        CR11.UCCL_REF,
"
"                                        CR11.UCCL_EFF_FRM,
"
"                                        CR11.UCCL_EFF_TO,
"
"                                        'N',
"
"                                        p_doc_no,
"
"                                        'M',
"
"                                        CR11.UCCL_NEW_CR_LMT_BASIS);
"
"    INSERT INTO UPD_CUST_CR_LIMIT_ED_TEMP(UCCL_BU,
"
"                                        UCCL_DOC_NO,
"
"                                        UCCL_DOC_DATE,
"
"                                        UCCL_CUST_ID,
"
"                                        UCCL_CURCY_ID,
"
"                                        UCCL_CUR_CR_LMT_BASIS,
"
"                                        UCCL_CUR_CR_LIMIT,
"
"                                        UCCL_CUR_DUE_DAYS,
"
"                                        UCCL_CUR_NO_OF_INV,
"
"                                        UCCL_NEW_CR_LIMIT,
"
"                                        UCCL_NEW_DUE_DAYS,
"
"                                        UCCL_NEW_NO_OF_INV,
"
"                                        UCCL_STATUS,
"
"                                        UCCL_CRE_BY,
"
"                                        UCCL_CRE_DATE,
"
"                                        UCCL_CRE_OS_USER,
"
"                                        UCCL_CRE_IP_ADDR,
"
"                                        UCCL_CRE_EMP_ID,
"
"                                        UCCL_UPD_BY,
"
"                                        UCCL_UPD_DATE,
"
"                                        UCCL_UPD_OS_USER,
"
"                                        UCCL_UPD_IP_ADDR,
"
"                                        UCCL_UPD_EMP_ID,
"
"                                        UCCL_REF,
"
"                                        UCCL_EFF_FRM,
"
"                                        UCCL_EFF_TO,
"
"                                        UCCL_TEMP_STATUS,
"
"                                        UCCL_TEMP_DOC_NO,
"
"                                        UCCL_TRK_TYPE,
"
"                                        UCCL_NEW_CR_LMT_BASIS)
"
"                             VALUES(      CR11.UCCL_BU,
"
"                                        CR11.UCCL_DOC_NO,
"
"                                        CR11.UCCL_DOC_DATE,
"
"                                        CR11.UCCL_CUST_ID,
"
"                                        CR11.UCCL_CURCY_ID,
"
"                                        CR11.UCCL_CUR_CR_LMT_BASIS,
"
"                                        CR11.UCCL_CUR_CR_LIMIT,
"
"                                        CR11.UCCL_CUR_DUE_DAYS,
"
"                                        CR11.UCCL_CUR_NO_OF_INV,
"
"                                        CR11.UCCL_NEW_CR_LIMIT,
"
"                                        CR11.UCCL_NEW_DUE_DAYS,
"
"                                        CR11.UCCL_NEW_NO_OF_INV,
"
"                                        CR11.UCCL_STATUS,
"
"                                        p_user,
"
"                                        sysdate,
"
"                                        CR11.UCCL_CRE_OS_USER,
"
"                                        CR11.UCCL_CRE_IP_ADDR,
"
"                                        CR11.UCCL_CRE_EMP_ID,
"
"                                        CR11. UCCL_UPD_BY,
"
"                                        CR11.UCCL_UPD_DATE,
"
"                                        CR11.UCCL_UPD_OS_USER,
"
"                                        CR11.UCCL_UPD_IP_ADDR,
"
"                                        CR11.UCCL_UPD_EMP_ID,
"
"                                        CR11.UCCL_REF,
"
"                                        CR11.UCCL_EFF_FRM,
"
"                                        CR11.UCCL_EFF_TO,
"
"                                        'C',
"
"                                        p_doc_no,
"
"                                        'N',
"
"                                        CR11.UCCL_NEW_CR_LMT_BASIS);
"
" END LOOP;
"
"
"
" ELSIF p_particular='ITR DETAILS' THEN
"
"--raise_Application_error(-20999,p_doc_no);
"
" FOR cr12 IN c12
"
"     LOOP
"
"      INSERT INTO SUPLR_ITR_DTLS_edit_temp(SID_BU,
"
"                                            SID_SUPLR_ID,
"
"                                            SID_FIN_YEAR,
"
"                                            SID_TURNOVER,
"
"                                            SID_ITR_FILED,
"
"                                            SID_ITR_FILED_DATE,
"
"                                            SID_ITR_REF_NO,
"
"                                            SID_CRE_BY,
"
"                                            SID_CRE_IP_ADDR,
"
"                                            SID_CRE_OS_USER,
"
"                                            SID_CRE_EMP_ID,
"
"                                            SID_CRE_DATE,
"
"                                            SID_UPD_BY,
"
"                                            SID_UPD_IP_ADDR,
"
"                                            SID_UPD_OS_USER,
"
"                                            SID_UPD_EMP_ID,
"
"                                            SID_UPD_DATE,
"
"                                            SID_DATE_INCORP_FLAG,
"
"                                            SID_TDS_TCS_GT50K,
"
"                                            SID_SPEC_PERSON,
"
"                                            SID_TEMP_DOC_NO,
"
"                                            SID_TEMP_STATUS,
"
"                                            SID_TRK_TYPE)
"
"                             VALUES(CR12.SID_BU,
"
"                                    CR12.SID_SUPLR_ID,
"
"                                    CR12.SID_FIN_YEAR,
"
"                                    CR12.SID_TURNOVER,
"
"                                    CR12.SID_ITR_FILED,
"
"                                    CR12.SID_ITR_FILED_DATE,
"
"                                    CR12.SID_ITR_REF_NO,
"
"                                    p_user,
"
"                                    CR12.SID_CRE_IP_ADDR,
"
"                                    CR12.SID_CRE_OS_USER,
"
"                                    CR12.SID_CRE_EMP_ID,
"
"                                    SYSDATE,
"
"                                    CR12.SID_UPD_BY,
"
"                                    CR12.SID_UPD_IP_ADDR,
"
"                                    CR12.SID_UPD_OS_USER,
"
"                                    CR12.SID_UPD_EMP_ID,
"
"                                    CR12.SID_UPD_DATE,
"
"                                    CR12.SID_DATE_INCORP_FLAG,
"
"                                    CR12.SID_TDS_TCS_GT50K,
"
"                                    CR12.SID_SPEC_PERSON,
"
"                                    p_doc_no,
"
"                                    'C',
"
"                                    'N');
"
"    INSERT INTO SUPLR_ITR_DTLS_edit_temp(SID_BU,
"
"                                            SID_SUPLR_ID,
"
"                                            SID_FIN_YEAR,
"
"                                            SID_TURNOVER,
"
"                                            SID_ITR_FILED,
"
"                                            SID_ITR_FILED_DATE,
"
"                                            SID_ITR_REF_NO,
"
"                                            SID_CRE_BY,
"
"                                            SID_CRE_IP_ADDR,
"
"                                            SID_CRE_OS_USER,
"
"                                            SID_CRE_EMP_ID,
"
"                                            SID_CRE_DATE,
"
"                                            SID_UPD_BY,
"
"                                            SID_UPD_IP_ADDR,
"
"                                            SID_UPD_OS_USER,
"
"                                            SID_UPD_EMP_ID,
"
"                                            SID_UPD_DATE,
"
"                                            SID_DATE_INCORP_FLAG,
"
"                                            SID_TDS_TCS_GT50K,
"
"                                            SID_SPEC_PERSON,
"
"                                            SID_TEMP_DOC_NO,
"
"                                            SID_TEMP_STATUS,
"
"                                            SID_TRK_TYPE)
"
"                             VALUES(CR12.SID_BU,
"
"                                    CR12.SID_SUPLR_ID,
"
"                                    CR12.SID_FIN_YEAR,
"
"                                    CR12.SID_TURNOVER,
"
"                                    CR12.SID_ITR_FILED,
"
"                                    CR12.SID_ITR_FILED_DATE,
"
"                                    CR12.SID_ITR_REF_NO,
"
"                                    p_user,
"
"                                    CR12.SID_CRE_IP_ADDR,
"
"                                    CR12.SID_CRE_OS_USER,
"
"                                    CR12.SID_CRE_EMP_ID,
"
"                                    SYSDATE,
"
"                                    CR12.SID_UPD_BY,
"
"                                    CR12.SID_UPD_IP_ADDR,
"
"                                    CR12.SID_UPD_OS_USER,
"
"                                    CR12.SID_UPD_EMP_ID,
"
"                                    CR12.SID_UPD_DATE,
"
"                                    CR12.SID_DATE_INCORP_FLAG,
"
"                                    CR12.SID_TDS_TCS_GT50K,
"
"                                    CR12.SID_SPEC_PERSON,
"
"                                    p_doc_no,
"
"                                    'N',
"
"                                    'M');
"
"
"
"
"
" END LOOP;
"
"
"
" ELSIF p_particular='UNIT' THEN
"
"--raise_Application_error(-20999,p_doc_no);
"
" FOR cr13 IN c13
"
"     LOOP
"
"      INSERT INTO SUPLR_PLANT_ASSO_EDIT_TEMP(SPA_BU,
"
"                                            SPA_PLANT_ID,
"
"                                            SPA_CUST_ID,
"
"                                            SPA_DFLT_PLANT,
"
"                                            SPA_CRE_BY,
"
"                                            SPA_CRE_IP_ADDR,
"
"                                            SPA_CRE_OS_USER,
"
"                                            SPA_CRE_DATE,
"
"                                            SPA_UPD_BY,
"
"                                            SPA_UPD_IP_ADDR,
"
"                                            SPA_UPD_OS_USER,
"
"                                            SPA_UPD_DATE,
"
"                                            SPA_CRE_EMP_ID,
"
"                                            SPA_UPD_EMP_ID,
"
"                                            SPA_DOC_NO,
"
"                                            SPA_TEMP_STATUS,
"
"                                            SPA_TRK_TYPE)
"
"                                     VALUES(cr13.SPA_BU,
"
"                                            cr13.SPA_PLANT_ID,
"
"                                            cr13.SPA_CUST_ID,
"
"                                            cr13.SPA_DFLT_PLANT,
"
"                                            P_USER,
"
"                                            cr13.SPA_CRE_IP_ADDR,
"
"                                            cr13.SPA_CRE_OS_USER,
"
"                                            SYSDATE,
"
"                                            cr13.SPA_UPD_BY,
"
"                                            cr13.SPA_UPD_IP_ADDR,
"
"                                            cr13.SPA_UPD_OS_USER,
"
"                                            cr13.SPA_UPD_DATE,
"
"                                            cr13.SPA_CRE_EMP_ID,
"
"                                            cr13.SPA_UPD_EMP_ID,
"
"                                            p_doc_no,
"
"                                            'C',
"
"                                            'N');
"
"    INSERT INTO SUPLR_PLANT_ASSO_EDIT_TEMP(SPA_BU,
"
"                                            SPA_PLANT_ID,
"
"                                            SPA_CUST_ID,
"
"                                            SPA_DFLT_PLANT,
"
"                                            SPA_CRE_BY,
"
"                                            SPA_CRE_IP_ADDR,
"
"                                            SPA_CRE_OS_USER,
"
"                                            SPA_CRE_DATE,
"
"                                            SPA_UPD_BY,
"
"                                            SPA_UPD_IP_ADDR,
"
"                                            SPA_UPD_OS_USER,
"
"                                            SPA_UPD_DATE,
"
"                                            SPA_CRE_EMP_ID,
"
"                                            SPA_UPD_EMP_ID,
"
"                                            SPA_DOC_NO,
"
"                                            SPA_TEMP_STATUS,
"
"                                            SPA_TRK_TYPE)
"
"                                     VALUES(cr13.SPA_BU,
"
"                                            cr13.SPA_PLANT_ID,
"
"                                            cr13.SPA_CUST_ID,
"
"                                            cr13.SPA_DFLT_PLANT,
"
"                                            P_USER,
"
"                                            cr13.SPA_CRE_IP_ADDR,
"
"                                            cr13.SPA_CRE_OS_USER,
"
"                                            SYSDATE,
"
"                                            cr13.SPA_UPD_BY,
"
"                                            cr13.SPA_UPD_IP_ADDR,
"
"                                            cr13.SPA_UPD_OS_USER,
"
"                                            cr13.SPA_UPD_DATE,
"
"                                            cr13.SPA_CRE_EMP_ID,
"
"                                            cr13.SPA_UPD_EMP_ID,
"
"                                            p_doc_no,
"
"                                            'N',
"
"                                            'M');
"
"END LOOP;
"
"
"
"ELSIF p_particular='UNIT LOCATION' THEN
"
"  --  RAISE_APPLICATION_ERROR(-20999,p_particular);
"
" FOR cr14 IN c14
"
"     LOOP
"
"--     RAISE_APPLICATION_ERROR(-20999,p_select);
"
"--     raise_Application_error(-20999,p_doc_no);
"
"      INSERT INTO SUPLR_PLANT_LOC_SUB_ASSO_ED_TEMP(SPLSA_BU,
"
"                                                SPLSA_PLANT_ID,
"
"                                                SPLSA_PLANT_LOC_ID,
"
"                                                SPLSA_CUST_ID,
"
"                                                SPLSA_CUST_LOC_ID,
"
"                                                SPLSA_CRE_BY,
"
"                                                SPLSA_CRE_IP_ADDR,
"
"                                                SPLSA_CRE_OS_USER,
"
"                                                SPLSA_CRE_DATE,
"
"                                                SPLSA_UPD_BY,
"
"                                                SPLSA_UPD_IP_ADDR,
"
"                                                SPLSA_UPD_OS_USER,
"
"                                                SPLSA_UPD_DATE,
"
"                                                SPLSA_CRE_EMP_ID,
"
"                                                SPLSA_UPD_EMP_ID,
"
"                                                SPLSA_SHIP_DIST,
"
"                                                SPLSA_LEAD_TIME,
"
"                                                SPLSA_CUST_LOC_NAME,
"
"                                                SPLSA_DOC_NO,
"
"                                                SPLSA_TEMP_STATUS,
"
"                                                SPLSA_TRK_TYPE,
"
"                                                SPLSA_ACTIVE_FLAG)
"
"                                         VALUES(CR14.SPLSA_BU,
"
"                                                CR14.SPLSA_PLANT_ID,
"
"                                                CR14.SPLSA_PLANT_LOC_ID,
"
"                                               CR14.SPLSA_CUST_ID,
"
"                                                CR14.SPLSA_CUST_LOC_ID,
"
"                                                P_USER,
"
"                                                CR14.SPLSA_CRE_IP_ADDR,
"
"                                                CR14.SPLSA_CRE_OS_USER,
"
"                                                SYSDATE,
"
"                                                CR14.SPLSA_UPD_BY,
"
"                                                CR14.SPLSA_UPD_IP_ADDR,
"
"                                                CR14.SPLSA_UPD_OS_USER,
"
"                                                CR14.SPLSA_UPD_DATE,
"
"                                                CR14.SPLSA_CRE_EMP_ID,
"
"                                                CR14.SPLSA_UPD_EMP_ID,
"
"                                                CR14.SPLSA_SHIP_DIST,
"
"                                                CR14.SPLSA_LEAD_TIME,
"
"                                                CR14.SPLSA_CUST_LOC_NAME,
"
"                                                p_doc_no,
"
"                                                'C',
"
"                                                'N',
"
"                                                cr14.SPLSA_ACTIVE_FLAG);
"
"       INSERT INTO SUPLR_PLANT_LOC_SUB_ASSO_ED_TEMP(SPLSA_BU,
"
"                                                SPLSA_PLANT_ID,
"
"                                                SPLSA_PLANT_LOC_ID,
"
"                                                SPLSA_CUST_ID,
"
"                                                SPLSA_CUST_LOC_ID,
"
"                                                SPLSA_CRE_BY,
"
"                                                SPLSA_CRE_IP_ADDR,
"
"                                                SPLSA_CRE_OS_USER,
"
"                                                SPLSA_CRE_DATE,
"
"                                                SPLSA_UPD_BY,
"
"                                                SPLSA_UPD_IP_ADDR,
"
"                                                SPLSA_UPD_OS_USER,
"
"                                                SPLSA_UPD_DATE,
"
"                                                SPLSA_CRE_EMP_ID,
"
"                                                SPLSA_UPD_EMP_ID,
"
"                                                SPLSA_SHIP_DIST,
"
"                                                SPLSA_LEAD_TIME,
"
"                                                SPLSA_CUST_LOC_NAME,
"
"                                                SPLSA_DOC_NO,
"
"                                                SPLSA_TEMP_STATUS,
"
"                                                SPLSA_TRK_TYPE,
"
"                                                SPLSA_ACTIVE_FLAG)
"
"                                         VALUES(CR14.SPLSA_BU,
"
"                                                CR14.SPLSA_PLANT_ID,
"
"                                                CR14.SPLSA_PLANT_LOC_ID,
"
"                                               CR14.SPLSA_CUST_ID,
"
"                                                CR14.SPLSA_CUST_LOC_ID,
"
"                                                P_USER,
"
"                                                CR14.SPLSA_CRE_IP_ADDR,
"
"                                                CR14.SPLSA_CRE_OS_USER,
"
"                                                SYSDATE,
"
"                                                CR14.SPLSA_UPD_BY,
"
"                                                CR14.SPLSA_UPD_IP_ADDR,
"
"                                                CR14.SPLSA_UPD_OS_USER,
"
"                                                CR14.SPLSA_UPD_DATE,
"
"                                                CR14.SPLSA_CRE_EMP_ID,
"
"                                                CR14.SPLSA_UPD_EMP_ID,
"
"                                                CR14.SPLSA_SHIP_DIST,
"
"                                                CR14.SPLSA_LEAD_TIME,
"
"                                                CR14.SPLSA_CUST_LOC_NAME,
"
"                                                p_doc_no,
"
"                                                'N',
"
"                                                'M',
"
"                                                cr14.SPLSA_ACTIVE_FLAG);
"
"END LOOP;
"
"
"
"ELSIF p_particular='T&C' THEN
"
"
"
" FOR cr15 IN c15
"
"     LOOP
"
"
"
"
"
"      INSERT INTO SUPLR_TNC_ATTR_EDIT_TEMP(STA_BU,
"
"                                            STA_ATTR_ID,
"
"                                            STA_PRINT_SEQ,
"
"                                            STA_SUPLR_ID,
"
"                                            STA_CUST_ID,
"
"                                            STA_CRE_BY,
"
"                                            STA_CRE_IP_ADDR,
"
"                                            STA_CRE_OS_USER,
"
"                                            STA_CRE_DATE,
"
"                                            STA_UPD_BY,
"
"                                            STA_UPD_IP_ADDR,
"
"                                            STA_UPD_OS_USER,
"
"                                            STA_UPD_DATE,
"
"                                            STA_CRE_EMP_ID,
"
"                                            STA_UPD_EMP_ID,
"
"                                            STA_DOC_NO,
"
"                                            STA_TEMP_STATUS,
"
"                                            STA_TRK_TYPE)
"
"                                         VALUES(CR15.STA_BU,
"
"                                            CR15.STA_ATTR_ID,
"
"                                            CR15.STA_PRINT_SEQ,
"
"                                            CR15.STA_SUPLR_ID,
"
"                                            CR15.STA_CUST_ID,
"
"                                            P_USER,
"
"                                            CR15.STA_CRE_IP_ADDR,
"
"                                            CR15.STA_CRE_OS_USER,
"
"                                            SYSDATE,
"
"                                            CR15.STA_UPD_BY,
"
"                                            CR15.STA_UPD_IP_ADDR,
"
"                                            CR15.STA_UPD_OS_USER,
"
"                                            CR15.STA_UPD_DATE,
"
"                                            CR15.STA_CRE_EMP_ID,
"
"                                            CR15.STA_UPD_EMP_ID,
"
"                                            p_doc_no,
"
"                                            'C',
"
"                                            'N');
"
"       INSERT INTO SUPLR_TNC_ATTR_EDIT_TEMP(STA_BU,
"
"                                            STA_ATTR_ID,
"
"                                            STA_PRINT_SEQ,
"
"                                            STA_SUPLR_ID,
"
"                                            STA_CUST_ID,
"
"                                            STA_CRE_BY,
"
"                                            STA_CRE_IP_ADDR,
"
"                                            STA_CRE_OS_USER,
"
"                                            STA_CRE_DATE,
"
"                                            STA_UPD_BY,
"
"                                            STA_UPD_IP_ADDR,
"
"                                            STA_UPD_OS_USER,
"
"                                            STA_UPD_DATE,
"
"                                            STA_CRE_EMP_ID,
"
"                                            STA_UPD_EMP_ID,
"
"                                            STA_DOC_NO,
"
"                                            STA_TEMP_STATUS,
"
"                                            STA_TRK_TYPE)
"
"                                         VALUES(CR15.STA_BU,
"
"                                            CR15.STA_ATTR_ID,
"
"                                            CR15.STA_PRINT_SEQ,
"
"                                            CR15.STA_SUPLR_ID,
"
"                                            CR15.STA_CUST_ID,
"
"                                            P_USER,
"
"                                            CR15.STA_CRE_IP_ADDR,
"
"                                            CR15.STA_CRE_OS_USER,
"
"                                            SYSDATE,
"
"                                            CR15.STA_UPD_BY,
"
"                                            CR15.STA_UPD_IP_ADDR,
"
"                                            CR15.STA_UPD_OS_USER,
"
"                                            CR15.STA_UPD_DATE,
"
"                                            CR15.STA_CRE_EMP_ID,
"
"                                            CR15.STA_UPD_EMP_ID,
"
"                                            p_doc_no,
"
"                                            'N',
"
"                                            'M');
"
"             FOR cr15a IN c15a(cr15.STA_PRINT_SEQ)
"
"     LOOP
"
"            IF CR15a.STAV_SUB_SEQ_NO IS NOT NULL THEN
"
"             INSERT INTO SUPLR_TNC_ATTR_VAL_EDIT_TEMP(STAV_BU,
"
"                                                        STAV_SEQ_NO,
"
"                                                        STAV_ATTR_VAL,
"
"                                                        STAV_SUPLR_ID,
"
"                                                        STAV_CUST_ID,
"
"                                                        STAV_SUB_SEQ_NO,
"
"                                                        STAV_CRE_BY,
"
"                                                        STAV_CRE_IP_ADDR,
"
"                                                        STAV_CRE_OS_USER,
"
"                                                        STAV_CRE_DATE,
"
"                                                        STAV_UPD_BY,
"
"                                                        STAV_UPD_IP_ADDR,
"
"                                                        STAV_UPD_OS_USER,
"
"                                                        STAV_UPD_DATE,
"
"                                                        STAV_CRE_EMP_ID,
"
"                                                        STAV_UPD_EMP_ID,
"
"                                                        STAV_DOC_NO,
"
"                                                        STAV_TEMP_STATUS,
"
"                                                        STAV_TRK_TYPE,
"
"                                                        STAV_ACTIVE_FLAG)
"
"                                         VALUES(CR15a.STAV_BU,
"
"                                                CR15a.STAV_SEQ_NO,
"
"                                                CR15a.STAV_ATTR_VAL,
"
"                                                CR15a.STAV_SUPLR_ID,
"
"                                                CR15a.STAV_CUST_ID,
"
"                                                CR15a.STAV_SUB_SEQ_NO,
"
"                                                P_USER,
"
"                                                CR15a.STAV_CRE_IP_ADDR,
"
"                                                CR15a.STAV_CRE_OS_USER,
"
"                                                SYSDATE,
"
"                                                CR15a.STAV_UPD_BY,
"
"                                                CR15a.STAV_UPD_IP_ADDR,
"
"                                                CR15a.STAV_UPD_OS_USER,
"
"                                                CR15a.STAV_UPD_DATE,
"
"                                                CR15a.STAV_CRE_EMP_ID,
"
"                                                CR15a.STAV_UPD_EMP_ID,
"
"                                                p_doc_no,
"
"                                                'C',
"
"                                                'N',
"
"                                                cr15a.STAV_ACTIVE_FLAG);
"
"                  INSERT INTO SUPLR_TNC_ATTR_VAL_EDIT_TEMP(STAV_BU,
"
"                                                        STAV_SEQ_NO,
"
"                                                        STAV_ATTR_VAL,
"
"                                                        STAV_SUPLR_ID,
"
"                                                        STAV_CUST_ID,
"
"                                                        STAV_SUB_SEQ_NO,
"
"                                                        STAV_CRE_BY,
"
"                                                        STAV_CRE_IP_ADDR,
"
"                                                        STAV_CRE_OS_USER,
"
"                                                        STAV_CRE_DATE,
"
"                                                        STAV_UPD_BY,
"
"                                                        STAV_UPD_IP_ADDR,
"
"                                                        STAV_UPD_OS_USER,
"
"                                                        STAV_UPD_DATE,
"
"                                                        STAV_CRE_EMP_ID,
"
"                                                        STAV_UPD_EMP_ID,
"
"                                                        STAV_DOC_NO,
"
"                                                        STAV_TEMP_STATUS,
"
"                                                        STAV_TRK_TYPE,
"
"                                                        STAV_ACTIVE_FLAG)
"
"                                         VALUES(CR15a.STAV_BU,
"
"                                                CR15a.STAV_SEQ_NO,
"
"                                                CR15a.STAV_ATTR_VAL,
"
"                                                CR15a.STAV_SUPLR_ID,
"
"                                                CR15a.STAV_CUST_ID,
"
"                                                CR15a.STAV_SUB_SEQ_NO,
"
"                                                P_USER,
"
"                                                CR15a.STAV_CRE_IP_ADDR,
"
"                                                CR15a.STAV_CRE_OS_USER,
"
"                                                SYSDATE,
"
"                                                CR15a.STAV_UPD_BY,
"
"                                                CR15a.STAV_UPD_IP_ADDR,
"
"                                                CR15a.STAV_UPD_OS_USER,
"
"                                                CR15a.STAV_UPD_DATE,
"
"                                                CR15a.STAV_CRE_EMP_ID,
"
"                                                CR15a.STAV_UPD_EMP_ID,
"
"                                                p_doc_no,
"
"                                                'N',
"
"                                                'M',
"
"                                                cr15a.STAV_ACTIVE_FLAG);
"
"               END IF;
"
"           END LOOP;
"
"END LOOP;
"
"
"
"
"
"ELSIF p_particular='ESI' AND 1=2THEN
"
"
"
" FOR i IN (SELECT * FROM suplr_bill_ded WHERE SBD_BU = p_bu AND SBD_SUPLR_ID = p_suplr_id AND SBD_DED_TYPE = 'E' AND SBD_DED_SUPLR_ID||SBD_FIN_YEAR = p_select)
"
"     LOOP
"
"     INSERT INTO suplr_bill_ded_edit(SBD_BU,
"
"                                                SBD_DOC_NO,
"
"                                                SBD_STATUS,
"
"                                                SBD_SUPLR_ID,
"
"                                                SBD_DED_TYPE,
"
"                                                SBD_OLD_DED_SUPLR_ID,
"
"                                                SBD_NEW_DED_SUPLR_ID,
"
"                                                SBD_OLD_FIN_YEAR,
"
"                                                SBD_NEW_FIN_YEAR,
"
"                                                SBD_LIMIT_AMT,
"
"                                                SBD_BILLS_ACNTD,
"
"                                                SBD_DED_PCT,
"
"                                                SBD_EXEMPT_DT_FROM,
"
"                                                SBD_EXEMPT_DT_TO,
"
"                                                SBD_EXMPT_CERT_NO,
"
"                                                SBD_ASSBL_VAL_PCT,
"
"                                                SBD_RND_DGT,
"
"                                                SBD_ASSBL_VAL_ON,
"
"                                                SBD_PUR_FLAG,
"
"                                                SBD_SCO_FLAG,
"
"                                                SBD_EXP_FLAG,
"
"                                                SBD_LIMIT_OVER_FLAG,
"
"                                                SBD_BILLS_INPROG,
"
"                                                SBD_BILLS_UN_ACNTD,
"
"                                                SBD_BILLS_UN_ACNTD_IN_PROG,
"
"                                                SBD_DED_APPL_AMT,
"
"                                                SBD_DED_APPL_INPROG,
"
"                                                SBD_TDS_US_ID,
"
"                                                SBD_INC_TAX_FLAG,
"
"                                                SBD_MAX_INDV_TRANS_AMT,
"
"                                                SBD_BILL_DED_DATE,
"
"                                                SBD_ADV_DED_INPROG_AMT,
"
"                                                SBD_ADV_DED_AMT,
"
"                                                SBD_OLD_TDS_DED_AMT,
"
"                                                SBD_NEW_TDS_DED_AMT,
"
"                                                SBD_APPL_TDS_DED_FLAG,
"
"                                                SBD_OLD_TDS_DED_INPROG,
"
"                                                SBD_NEW_TDS_DED_INPROG,
"
"                                                SBD_DED_SUPLR_CURR,
"
"                                                SBD_PAN_AVL_FLAG,
"
"                                                SBD_DED_START_DATE,
"
"                                                SBD_DED_START_DOC_PFX,
"
"                                                SBD_DED_START_DOC_NO,
"
"                                                SBD_CRE_BY,
"
"                                                SBD_CRE_IP_ADDR,
"
"                                                SBD_CRE_OS_USER,
"
"                                                SBD_CRE_DATE,
"
"                                                SBD_CRE_EMP_ID,
"
"                                                SBD_OLD_PLNT,
"
"                                                SBD_NEW_PLNT,
"
"                                                SBD_ADV_DED_PAID_AMT,
"
"                                                SBD_TDS_TL_CHK_FLAG)
"
"                                  VALUES(p_bu,
"
"                                                p_doc_no,
"
"                                                'C',
"
"                                                i.SBD_SUPLR_ID,
"
"                                                'E',
"
"                                                i.SBD_DED_SUPLR_ID,
"
"                                                i.SBD_DED_SUPLR_ID,
"
"                                                i.SBD_FIN_YEAR,
"
"                                                i.SBD_FIN_YEAR,
"
"                                                i.SBD_LIMIT_AMT,
"
"                                                i.SBD_BILLS_ACNTD,
"
"                                                i.SBD_DED_PCT,
"
"                                                i.SBD_EXEMPT_DT_FROM,
"
"                                                i.SBD_EXEMPT_DT_TO,
"
"                                                i.SBD_EXMPT_CERT_NO,
"
"                                                i.SBD_ASSBL_VAL_PCT,
"
"                                                i.SBD_RND_DGT,
"
"                                                i.SBD_ASSBL_VAL_ON,
"
"                                                i.SBD_PUR_FLAG,
"
"                                                i.SBD_SCO_FLAG,
"
"                                                i.SBD_EXP_FLAG,
"
"                                                i.SBD_LIMIT_OVER_FLAG,
"
"                                                i.SBD_BILLS_INPROG,
"
"                                                i.SBD_BILLS_UN_ACNTD,
"
"                                                i.SBD_BILLS_UN_ACNTD_IN_PROG,
"
"                                                i.SBD_DED_APPL_AMT,
"
"                                                i.SBD_DED_APPL_INPROG,
"
"                                                i.SBD_TDS_US_ID,
"
"                                                i.SBD_INC_TAX_FLAG,
"
"                                                i.SBD_MAX_INDV_TRANS_AMT,
"
"                                                i.SBD_BILL_DED_DATE,
"
"                                                i.SBD_ADV_DED_INPROG_AMT,
"
"                                                i.SBD_ADV_DED_AMT,
"
"                                                i.SBD_TDS_DED_AMT,
"
"                                                i.SBD_TDS_DED_AMT,
"
"                                                i.SBD_APPL_TDS_DED_FLAG,
"
"                                                i.SBD_TDS_DED_INPROG,
"
"                                                i.SBD_TDS_DED_INPROG,
"
"                                                i.SBD_DED_SUPLR_CURR,
"
"                                                i.SBD_PAN_AVL_FLAG,
"
"                                                i.SBD_DED_START_DATE,
"
"                                                i.SBD_DED_START_DOC_PFX,
"
"                                                i.SBD_DED_START_DOC_NO,
"
"                                                p_user,
"
"                                                audit_info.get_ip_address,
"
"                                                audit_info.get_os_user,
"
"                                                sysdate,
"
"                                                i.SBD_CRE_EMP_ID,
"
"                                                i.SBD_PLNT,
"
"                                                i.SBD_PLNT,
"
"                                                i.SBD_ADV_DED_PAID_AMT,
"
"                                                i.SBD_TDS_TL_CHK_FLAG);
"
"
"
"      INSERT INTO suplr_bill_ded_edit(SBD_BU,
"
"                                                SBD_DOC_NO,
"
"                                                SBD_STATUS,
"
"                                                SBD_SUPLR_ID,
"
"                                                SBD_DED_TYPE,
"
"                                                SBD_OLD_DED_SUPLR_ID,
"
"                                                SBD_NEW_DED_SUPLR_ID,
"
"                                                SBD_OLD_FIN_YEAR,
"
"                                                SBD_NEW_FIN_YEAR,
"
"                                                SBD_LIMIT_AMT,
"
"                                                SBD_BILLS_ACNTD,
"
"                                                SBD_DED_PCT,
"
"                                                SBD_EXEMPT_DT_FROM,
"
"                                                SBD_EXEMPT_DT_TO,
"
"                                                SBD_EXMPT_CERT_NO,
"
"                                                SBD_ASSBL_VAL_PCT,
"
"                                                SBD_RND_DGT,
"
"                                                SBD_ASSBL_VAL_ON,
"
"                                                SBD_PUR_FLAG,
"
"                                                SBD_SCO_FLAG,
"
"                                                SBD_EXP_FLAG,
"
"                                                SBD_LIMIT_OVER_FLAG,
"
"                                                SBD_BILLS_INPROG,
"
"                                                SBD_BILLS_UN_ACNTD,
"
"                                                SBD_BILLS_UN_ACNTD_IN_PROG,
"
"                                                SBD_DED_APPL_AMT,
"
"                                                SBD_DED_APPL_INPROG,
"
"                                                SBD_TDS_US_ID,
"
"                                                SBD_INC_TAX_FLAG,
"
"                                                SBD_MAX_INDV_TRANS_AMT,
"
"                                                SBD_BILL_DED_DATE,
"
"                                                SBD_ADV_DED_INPROG_AMT,
"
"                                                SBD_ADV_DED_AMT,
"
"                                                SBD_OLD_TDS_DED_AMT,
"
"                                                SBD_NEW_TDS_DED_AMT,
"
"                                                SBD_APPL_TDS_DED_FLAG,
"
"                                                SBD_OLD_TDS_DED_INPROG,
"
"                                                SBD_NEW_TDS_DED_INPROG,
"
"                                                SBD_DED_SUPLR_CURR,
"
"                                                SBD_PAN_AVL_FLAG,
"
"                                                SBD_DED_START_DATE,
"
"                                                SBD_DED_START_DOC_PFX,
"
"                                                SBD_DED_START_DOC_NO,
"
"                                                SBD_CRE_BY,
"
"                                                SBD_CRE_IP_ADDR,
"
"                                                SBD_CRE_OS_USER,
"
"                                                SBD_CRE_DATE,
"
"                                                SBD_CRE_EMP_ID,
"
"                                                SBD_OLD_PLNT,
"
"                                                SBD_NEW_PLNT,
"
"                                                SBD_ADV_DED_PAID_AMT,
"
"                                                SBD_TDS_TL_CHK_FLAG)
"
"                                  VALUES(p_bu,
"
"                                                p_doc_no,
"
"                                                'N',
"
"                                                i.SBD_SUPLR_ID,
"
"                                                'E',
"
"                                                i.SBD_DED_SUPLR_ID,
"
"                                                i.SBD_DED_SUPLR_ID,
"
"                                                i.SBD_FIN_YEAR,
"
"                                                i.SBD_FIN_YEAR,
"
"                                                i.SBD_LIMIT_AMT,
"
"                                                i.SBD_BILLS_ACNTD,
"
"                                                i.SBD_DED_PCT,
"
"                                                i.SBD_EXEMPT_DT_FROM,
"
"                                                i.SBD_EXEMPT_DT_TO,
"
"                                                i.SBD_EXMPT_CERT_NO,
"
"                                                i.SBD_ASSBL_VAL_PCT,
"
"                                                i.SBD_RND_DGT,
"
"                                                i.SBD_ASSBL_VAL_ON,
"
"                                                i.SBD_PUR_FLAG,
"
"                                                i.SBD_SCO_FLAG,
"
"                                                i.SBD_EXP_FLAG,
"
"                                                i.SBD_LIMIT_OVER_FLAG,
"
"                                                i.SBD_BILLS_INPROG,
"
"                                                i.SBD_BILLS_UN_ACNTD,
"
"                                                i.SBD_BILLS_UN_ACNTD_IN_PROG,
"
"                                                i.SBD_DED_APPL_AMT,
"
"                                                i.SBD_DED_APPL_INPROG,
"
"                                                i.SBD_TDS_US_ID,
"
"                                                i.SBD_INC_TAX_FLAG,
"
"                                                i.SBD_MAX_INDV_TRANS_AMT,
"
"                                                i.SBD_BILL_DED_DATE,
"
"                                                i.SBD_ADV_DED_INPROG_AMT,
"
"                                                i.SBD_ADV_DED_AMT,
"
"                                                i.SBD_TDS_DED_AMT,
"
"                                                i.SBD_TDS_DED_AMT,
"
"                                                i.SBD_APPL_TDS_DED_FLAG,
"
"                                                i.SBD_TDS_DED_INPROG,
"
"                                                i.SBD_TDS_DED_INPROG,
"
"                                                i.SBD_DED_SUPLR_CURR,
"
"                                                i.SBD_PAN_AVL_FLAG,
"
"                                                i.SBD_DED_START_DATE,
"
"                                                i.SBD_DED_START_DOC_PFX,
"
"                                                i.SBD_DED_START_DOC_NO,
"
"                                                p_user,
"
"                                                audit_info.get_ip_address,
"
"                                                audit_info.get_os_user,
"
"                                                sysdate,
"
"                                                i.SBD_CRE_EMP_ID,
"
"                                                i.SBD_PLNT,
"
"                                                i.SBD_PLNT,
"
"                                                i.SBD_ADV_DED_PAID_AMT,
"
"                                                i.SBD_TDS_TL_CHK_FLAG);
"
"
"
"END LOOP;
"
"ELSIF p_particular IN ('TDS SECTION','ESI','PF') THEN
"
"
"
"  FOR cr16 IN c16
"
"LOOP
"
"
"
"    INSERT INTO suplr_bill_ded_temp(sbd_bu,
"
"                                    sbd_suplr_id,
"
"                                    sbd_ded_suplr_id,
"
"                                    sbd_fin_year,
"
"                                    sbd_tds_us_id,
"
"                                    sbd_cre_by,
"
"                                    sbd_cre_ip_addr,
"
"                                    sbd_cre_os_user,
"
"                                    sbd_cre_date,
"
"                                    sbd_temp_status,
"
"                                    sbd_tds_tl_chk_flag,
"
"                                    sbd_doc_no,
"
"                                    sbd_trk_type,
"
"                                    sbd_plnt)
"
"                 VALUES(cr16.sbd_bu,
"
"                        cr16.sbd_suplr_id,
"
"                        cr16.sbd_ded_suplr_id,
"
"                        cr16.sbd_fin_year,
"
"                        cr16.sbd_tds_us_id,
"
"                        p_user,
"
"                        audit_info.get_ip_address,
"
"                        audit_info.get_os_user,
"
"                        SYSDATE,
"
"                        'C',
"
"                        cr16.sbd_tds_tl_chk_flag,
"
"                        p_doc_no,
"
"                        'M',
"
"                        cr16.sbd_plnt);
"
"
"
"    INSERT INTO suplr_bill_ded_temp(sbd_bu,
"
"                                    sbd_suplr_id,
"
"                                    sbd_ded_suplr_id,
"
"                                    sbd_fin_year,
"
"                                    sbd_tds_us_id,
"
"                                    sbd_cre_by,
"
"                                    sbd_cre_ip_addr,
"
"                                    sbd_cre_os_user,
"
"                                    sbd_cre_date,
"
"                                    sbd_temp_status,
"
"                                    sbd_tds_tl_chk_flag,
"
"                                    sbd_doc_no,
"
"                                    sbd_trk_type,
"
"                                    sbd_plnt)
"
"                 VALUES(cr16.sbd_bu,
"
"                        cr16.sbd_suplr_id,
"
"                        cr16.sbd_ded_suplr_id,
"
"                        cr16.sbd_fin_year,
"
"                        cr16.sbd_tds_us_id,
"
"                        p_user,
"
"                        audit_info.get_ip_address,
"
"                        audit_info.get_os_user,
"
"                        SYSDATE,
"
"                        'N',
"
"                        cr16.sbd_tds_tl_chk_flag,
"
"                        p_doc_no,
"
"                        'M',
"
"                        cr16.sbd_plnt);
"
"END LOOP;
"
"END IF;
"
"END proc_ins_suplr_edit_temp;
"
"
"
"PROCEDURE proc_upd_is_vaid(p_bu         VARCHAR2,
"
"                           p_suplr_id   VARCHAR2,
"
"                           p_user       VARCHAR2,
"
"                           p_session    VARCHAR2,
"
"                           p_upd_type   VARCHAR2,
"
"                           p_party_type VARCHAR2,
"
"                           p_search     VARCHAR2,
"
"                           p_doc_no OUT VARCHAR2)
"
"  IS
"
"v_count  NUMBER(5);
"
"v_status VARCHAR2(1);
"
"v_doc_no suplr_edit_hd.sehd_doc_no%TYPE;
"
"
"
"BEGIN
"
"
"
"IF p_party_type IN ('S','C') THEN
"
"SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"  INTO v_doc_no
"
"  FROM suplr_edit_hd
"
" WHERE sehd_bu         = p_bu
"
"   AND sehd_suplr_id   = p_suplr_id
"
"   AND sehd_party_type = p_party_type;
"
"ELSE
"
"SELECT NVL (MAX (TO_NUMBER (sehd_doc_no)),1000000000) + 1
"
"  INTO v_doc_no
"
"  FROM suplr_edit_hd
"
" WHERE sehd_bu         = p_bu
"
"   AND sehd_suplr_id   = p_suplr_id;
"
" END IF;
"
"p_doc_no := v_doc_no;
"
"IF p_upd_type = 'ADDRESS' THEN
"
"    BEGIN
"
"    SELECT COUNT(*),sehd_status
"
"      INTO v_count,v_status
"
"      FROM suplr_edit_hd
"
"     WHERE sehd_bu = p_bu
"
"       AND sehd_suplr_id = p_suplr_id
"
"       AND sehd_upd_type = 'ADDRESS'
"
"       AND sehd_status IN ('N','E')
"
"       GROUP BY sehd_status;
"
"    EXCEPTION WHEN OTHERS THEN
"
"      v_count := 0;
"
"    END;
"
"    IF v_count > 0 THEN
"
"       IF v_status = 'N' THEN
"
"        RAISE_APPLICATION_ERROR(-20999,'Document already forwaded for Approval');
"
"       ELSIF v_status ='E' THEN
"
"        RAISE_APPLICATION_ERROR(-20999,'Document already in Draft Status');
"
"       END IF;
"
"    ELSE
"
"
"
"         pack_suplr_upd.proc_ins_suplr_edit_temp(p_bu,
"
"                                                 p_suplr_id,
"
"                                                 v_doc_no,
"
"                                                 p_user,
"
"                                                 1,
"
"                                                 p_session,
"
"                                                 'ADDRESS',
"
"                                                 NULL,
"
"                                                 NULL
"
"                                                 );
"
"  END IF;
"
"
"
"ELSIF p_upd_type = 'LOCATION' THEN
"
"
"
"   BEGIN
"
"    SELECT COUNT(*),sehd_status
"
"      INTO v_count,v_status
"
"      FROM suplr_edit_hd
"
"     WHERE sehd_bu = p_bu
"
"       AND sehd_suplr_id = p_suplr_id
"
"       AND sehd_upd_type = 'LOCATION'
"
"       AND sehd_status IN ('N','E')
"
"    GROUP BY sehd_status;
"
"  EXCEPTION WHEN OTHERS THEN
"
"      v_count := 0;
"
"  END;
"
"    IF v_count > 0 THEN
"
"        IF v_status = 'N' THEN
"
"           RAISE_APPLICATION_ERROR(-20999,'Document already forwaded for Approval');
"
"       ELSIF v_status ='E' THEN
"
"           RAISE_APPLICATION_ERROR(-20999,'Document already in Draft Status');
"
"       END IF;
"
"    ELSE
"
"--  RAISE_APPLICATION_ERROR(-20999,p_upd_type||'/'||p_bu||'/'||p_suplr_id||'/'||v_doc_no||'/'||p_user||'/'||p_session||'/'||p_search);
"
"      pack_suplr_upd.proc_ins_suplr_edit_temp(p_bu,
"
"                                              p_suplr_id,
"
"                                                v_doc_no,
"
"                                              p_user,
"
"                                              1,
"
"                                              p_session,
"
"                                              p_upd_type,
"
"                                              p_search,
"
"                                              NULL);
"
"
"
"--         RAISE_APPLICATION_ERROR(-20999,p_upd_type||'/'||p_bu||'/'||p_suplr_id||'/'||v_doc_no||'/'||p_user||'/'||p_session||'/'||p_search);
"
"      END IF;
"
"
"
"ELSIF p_upd_type = 'GL GROUP' THEN
"
"  BEGIN
"
"    SELECT COUNT(*),sehd_status
"
"      INTO v_count,v_status
"
"      FROM suplr_edit_hd
"
"     WHERE sehd_bu = p_bu
"
"       AND sehd_suplr_id = p_suplr_id
"
"       AND sehd_upd_type = 'GL GROUP'
"
"       AND sehd_status IN ('N','E')
"
"    GROUP BY sehd_status;
"
"    EXCEPTION WHEN OTHERS THEN
"
"      v_count := 0;
"
"  END;
"
"    IF v_count > 0 THEN
"
"         IF v_status = 'N' THEN
"
"           RAISE_APPLICATION_ERROR(-20999,'Document already forwaded for Approval');
"
"         ELSIF v_status ='E' THEN
"
"           RAISE_APPLICATION_ERROR(-20999,'Document already in Draft Status');
"
"         END IF;
"
"        ELSE
"
"
"
"      pack_suplr_upd.proc_ins_suplr_edit_temp(p_bu,
"
"                                              p_suplr_id,
"
"                                              v_doc_no,
"
"                                              p_user,
"
"                                              1,
"
"                                              p_session,
"
"                                              p_upd_type,
"
"                                              p_search,
"
"                                              NULL);
"
"    END IF;
"
"ELSIF p_upd_type = 'GL ACCOUNT' THEN
"
"  BEGIN
"
"    SELECT COUNT(*),sehd_status
"
"      INTO v_count,v_status
"
"      FROM suplr_edit_hd
"
"     WHERE sehd_bu = p_bu
"
"       AND sehd_suplr_id = p_suplr_id
"
"       AND sehd_upd_type = 'GL ACCOUNT'
"
"       AND sehd_status IN ('N','E')
"
"    GROUP BY sehd_status;
"
"  EXCEPTION WHEN OTHERS THEN
"
"      v_count := 0;
"
"  END;
"
"    IF v_count > 0 THEN
"
"         IF v_status = 'N' THEN
"
"           RAISE_APPLICATION_ERROR(-20999,'Document already forwaded for Approval');
"
"         ELSIF v_status ='E' THEN
"
"           RAISE_APPLICATION_ERROR(-20999,'Document already in Draft Status');
"
"         END IF;
"
"        ELSE
"
"
"
"      pack_suplr_upd.proc_ins_suplr_edit_temp(p_bu,
"
"                                              p_suplr_id,
"
"                                              v_doc_no,
"
"                                              p_user,
"
"                                              1,
"
"                                              p_session,
"
"                                              p_upd_type,
"
"                                              p_search,
"
"                                              NULL);
"
"   END IF;
"
"ELSIF p_upd_type = 'CURRENCY' THEN
"
"  BEGIN
"
"    SELECT COUNT(*),sehd_status
"
"      INTO v_count,v_status
"
"      FROM suplr_edit_hd
"
"     WHERE sehd_bu = p_bu
"
"       AND sehd_suplr_id = p_suplr_id
"
"       AND sehd_upd_type = 'CURRENCY'
"
"       AND sehd_status IN ('N','E')
"
"    GROUP BY sehd_status;
"
"  EXCEPTION WHEN OTHERS THEN
"
"      v_count := 0;
"
"  END;
"
"    IF v_count > 0 THEN
"
"         IF v_status = 'N' THEN
"
"           RAISE_APPLICATION_ERROR(-20999,'Document already forwaded for Approval');
"
"         ELSIF v_status ='E' THEN
"
"           RAISE_APPLICATION_ERROR(-20999,'Document already in Draft Status');
"
"         END IF;
"
"        ELSE
"
"
"
"      pack_suplr_upd.proc_ins_suplr_edit_temp(p_bu,
"
"                                              p_suplr_id,
"
"                                              v_doc_no,
"
"                                              p_user,
"
"                                              1,
"
"                                              p_session,
"
"                                              p_upd_type,
"
"                                              p_search,
"
"                                              NULL);
"
"    END IF;
"
"ELSIF p_upd_type = 'BANK A/C' THEN
"
"   BEGIN
"
"    SELECT COUNT(*),sehd_status
"
"      INTO v_count,v_status
"
"      FROM suplr_edit_hd
"
"     WHERE sehd_bu = p_bu
"
"       AND sehd_suplr_id = p_suplr_id
"
"       AND sehd_upd_type = 'BANK A/C'
"
"       AND sehd_status IN ('N','E')
"
"    GROUP BY sehd_status;
"
"   EXCEPTION WHEN OTHERS THEN
"
"      v_count := 0;
"
"   END;
"
"    IF v_count > 0 THEN
"
"         IF v_status = 'N' THEN
"
"           RAISE_APPLICATION_ERROR(-20999,'Document already forwaded for Approval');
"
"         ELSIF v_status ='E' THEN
"
"           RAISE_APPLICATION_ERROR(-20999,'Document already in Draft Status');
"
"         END IF;
"
"        ELSE
"
"
"
"      pack_suplr_upd.proc_ins_suplr_edit_temp(p_bu,
"
"                                              p_suplr_id,
"
"                                              v_doc_no,
"
"                                              p_user,
"
"                                              1,
"
"                                              p_session,
"
"                                              p_upd_type,
"
"                                              p_search,
"
"                                              NULL);
"
"    END IF;
"
"ELSIF p_upd_type = 'CONTACT' THEN
"
"   BEGIN
"
"    SELECT COUNT(*),sehd_status
"
"      INTO v_count,v_status
"
"      FROM suplr_edit_hd
"
"     WHERE sehd_bu = p_bu
"
"       AND sehd_suplr_id = p_suplr_id
"
"       AND sehd_upd_type = 'CONTACT'
"
"       AND sehd_status IN ('N','E')
"
"    GROUP BY sehd_status;
"
"    EXCEPTION WHEN OTHERS THEN
"
"      v_count := 0;
"
"    END;
"
"        IF v_count > 0 THEN
"
"         IF v_status = 'N' THEN
"
"           RAISE_APPLICATION_ERROR(-20999,'Document already forwaded for Approval');
"
"         ELSIF v_status ='E' THEN
"
"           RAISE_APPLICATION_ERROR(-20999,'Document already in Draft Status');
"
"         END IF;
"
"        ELSE
"
"
"
"      pack_suplr_upd.proc_ins_suplr_edit_temp(p_bu,
"
"                                              p_suplr_id,
"
"                                              v_doc_no,
"
"                                              p_user,
"
"                                              1,
"
"                                              p_session,
"
"                                              p_upd_type,
"
"                                              p_search,
"
"                                              NULL);
"
"    END IF;
"
"ELSIF p_upd_type = 'OTHERS' THEN
"
"    BEGIN
"
"    SELECT COUNT(*),sehd_status
"
"      INTO v_count,v_status
"
"      FROM suplr_edit_hd
"
"     WHERE sehd_bu = p_bu
"
"       AND sehd_suplr_id = p_suplr_id
"
"       AND sehd_upd_type = 'OTHERS'
"
"       AND sehd_status IN ('N','E')
"
"    GROUP BY sehd_status;
"
"    EXCEPTION WHEN OTHERS THEN
"
"      v_count := 0;
"
"    END;
"
"        IF v_count > 0 THEN
"
"         IF v_status = 'N' THEN
"
"           RAISE_APPLICATION_ERROR(-20999,'Document already forwaded for Approval');
"
"         ELSIF v_status ='E' THEN
"
"           RAISE_APPLICATION_ERROR(-20999,'Document already in Draft Status');
"
"         END IF;
"
"        ELSE
"
"
"
"      pack_suplr_upd.proc_ins_suplr_edit_temp(p_bu,
"
"                                              p_suplr_id,
"
"                                              v_doc_no,
"
"                                              p_user,
"
"                                              1,
"
"                                              p_session,
"
"                                              p_upd_type,
"
"                                              NULL,
"
"                                              NULL);
"
"        END IF;
"
"
"
"ELSIF p_upd_type = 'OTHERS' THEN
"
"    BEGIN
"
"    SELECT COUNT(*),sehd_status
"
"      INTO v_count,v_status
"
"      FROM suplr_edit_hd
"
"     WHERE sehd_bu = p_bu
"
"       AND sehd_suplr_id = p_suplr_id
"
"       AND sehd_upd_type = 'OTHERS'
"
"       AND sehd_status IN ('N','E')
"
"    GROUP BY sehd_status;
"
"    EXCEPTION WHEN OTHERS THEN
"
"      v_count := 0;
"
"    END;
"
"        IF v_count > 0 THEN
"
"         IF v_status = 'N' THEN
"
"           RAISE_APPLICATION_ERROR(-20999,'Document already forwaded for Approval');
"
"         ELSIF v_status ='E' THEN
"
"           RAISE_APPLICATION_ERROR(-20999,'Document already in Draft Status');
"
"         END IF;
"
"        ELSE
"
"
"
"      pack_suplr_upd.proc_ins_suplr_edit_temp(p_bu,
"
"                                              p_suplr_id,
"
"                                              v_doc_no,
"
"                                              p_user,
"
"                                              1,
"
"                                              p_session,
"
"                                              p_upd_type,
"
"                                              NULL,
"
"                                              NULL);
"
"        END IF;
"
"ELSIF p_upd_type ='Stat. Authority' THEN
"
"    BEGIN
"
"    SELECT COUNT(*),sehd_status
"
"      INTO v_count,v_status
"
"      FROM suplr_edit_hd
"
"     WHERE sehd_bu = p_bu
"
"       AND sehd_suplr_id = p_suplr_id
"
"       AND sehd_upd_type ='Stat. Authority'
"
"       AND sehd_status IN ('N','E')
"
"    GROUP BY sehd_status;
"
"    EXCEPTION WHEN OTHERS THEN
"
"      v_count := 0;
"
"    END;
"
"        IF v_count > 0 THEN
"
"         IF v_status = 'N' THEN
"
"           RAISE_APPLICATION_ERROR(-20999,'Document already forwaded for Approval');
"
"         ELSIF v_status ='E' THEN
"
"           RAISE_APPLICATION_ERROR(-20999,'Document already in Draft Status');
"
"         END IF;
"
"        ELSE
"
"
"
"      pack_suplr_upd.proc_ins_suplr_edit_temp(p_bu,
"
"                                              p_suplr_id,
"
"                                              v_doc_no,
"
"                                              p_user,
"
"                                              1,
"
"                                              p_session,
"
"                                              p_upd_type,
"
"                                              NULL,
"
"                                              NULL);
"
"        END IF;
"
"ELSIF p_upd_type = 'MSME' THEN
"
"    BEGIN
"
"    SELECT COUNT(*),sehd_status
"
"      INTO v_count,v_status
"
"      FROM suplr_edit_hd
"
"     WHERE sehd_bu = p_bu
"
"       AND sehd_suplr_id = p_suplr_id
"
"       AND sehd_upd_type = 'MSME'
"
"       AND sehd_status IN ('N','E')
"
"    GROUP BY sehd_status;
"
"    EXCEPTION WHEN OTHERS THEN
"
"      v_count := 0;
"
"    END;
"
"        IF v_count > 0 THEN
"
"         IF v_status = 'N' THEN
"
"           RAISE_APPLICATION_ERROR(-20999,'Document already forwaded for Approval');
"
"         ELSIF v_status ='E' THEN
"
"           RAISE_APPLICATION_ERROR(-20999,'Document already in Draft Status');
"
"         END IF;
"
"        ELSE
"
"
"
"      pack_suplr_upd.proc_ins_suplr_edit_temp(p_bu,
"
"                                              p_suplr_id,
"
"                                              v_doc_no,
"
"                                              p_user,
"
"                                              1,
"
"                                              p_session,
"
"                                              p_upd_type,
"
"                                              NULL,
"
"                                              NULL);
"
"        END IF;
"
"ELSIF p_upd_type = 'EXEMPTED DETAILS' THEN
"
"  BEGIN
"
"    SELECT COUNT(*),sehd_status
"
"      INTO v_count,v_status
"
"      FROM suplr_edit_hd
"
"     WHERE sehd_bu = p_bu
"
"       AND sehd_suplr_id = p_suplr_id
"
"       AND sehd_upd_type = 'EXEMPTED DETAILS'
"
"       AND sehd_status IN ('N','E')
"
"    GROUP BY sehd_status;
"
"  EXCEPTION WHEN OTHERS THEN
"
"      v_count := 0;
"
"  END;
"
"        IF v_count > 0 THEN
"
"          IF v_status = 'N' THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'Document already forwaded for Approval');
"
"          ELSIF v_status ='E' THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'Document already in Draft Status');
"
"          END IF;
"
"        ELSE
"
"
"
"          pack_suplr_upd.proc_ins_suplr_edit_temp(p_bu,
"
"                                                  p_suplr_id,
"
"                                                  v_doc_no,
"
"                                                  p_user,
"
"                                                  1,
"
"                                                  p_session,
"
"                                                  p_upd_type,
"
"                                                  p_search,
"
"                                                  NULL);
"
"   END IF;
"
"
"
"ELSIF p_upd_type = 'CREDIT LIMIT' THEN
"
"  BEGIN
"
"    SELECT COUNT(*),sehd_status
"
"      INTO v_count,v_status
"
"      FROM suplr_edit_hd
"
"     WHERE sehd_bu = p_bu
"
"       AND sehd_suplr_id = p_suplr_id
"
"       AND sehd_upd_type = 'CREDIT LIMIT'
"
"       AND sehd_status IN ('N','E')
"
"    GROUP BY sehd_status;
"
"  EXCEPTION WHEN OTHERS THEN
"
"      v_count := 0;
"
"  END;
"
"        IF v_count > 0 THEN
"
"          IF v_status = 'N' THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'Document already forwaded for Approval');
"
"          ELSIF v_status ='E' THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'Document already in Draft Status');
"
"          END IF;
"
"        ELSE
"
"--RAISE_APPLICATION_ERROR(-20999,p_upd_type||'/'||p_bu||'/'||p_suplr_id||'/'||v_doc_no||'/'||p_user||'/'||p_session||'/'||p_search);
"
"          pack_suplr_upd.proc_ins_suplr_edit_temp(p_bu,
"
"                                                  p_suplr_id,
"
"                                                  v_doc_no,
"
"                                                  p_user,
"
"                                                  1,
"
"                                                  p_session,
"
"                                                  p_upd_type,
"
"                                                  p_search,
"
"                                                  NULL);
"
"   END IF;
"
"
"
"   ELSIF p_upd_type = 'ITR DETAILS' THEN
"
"  BEGIN
"
"    SELECT COUNT(*),sehd_status
"
"      INTO v_count,v_status
"
"      FROM suplr_edit_hd
"
"     WHERE sehd_bu = p_bu
"
"       AND sehd_suplr_id = p_suplr_id
"
"       AND sehd_upd_type = 'ITR DETAILS'
"
"       AND sehd_status IN ('N','E')
"
"    GROUP BY sehd_status;
"
"  EXCEPTION WHEN OTHERS THEN
"
"      v_count := 0;
"
"  END;
"
"        IF v_count > 0 THEN
"
"          IF v_status = 'N' THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'Document already forwaded for Approval');
"
"          ELSIF v_status ='E' THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'Document already in Draft Status');
"
"          END IF;
"
"        ELSE
"
"--RAISE_APPLICATION_ERROR(-20999,p_upd_type||'/'||p_bu||'/'||p_suplr_id||'/'||v_doc_no||'/'||p_user||'/'||p_session||'/'||p_search);
"
"          pack_suplr_upd.proc_ins_suplr_edit_temp(p_bu,
"
"                                                  p_suplr_id,
"
"                                                  v_doc_no,
"
"                                                  p_user,
"
"                                                  1,
"
"                                                  p_session,
"
"                                                  p_upd_type,
"
"                                                  p_search,
"
"                                                  NULL);
"
"   END IF;
"
"
"
"  ELSIF p_upd_type = 'UNIT' THEN
"
"  BEGIN
"
"    SELECT COUNT(*),sehd_status
"
"      INTO v_count,v_status
"
"      FROM suplr_edit_hd
"
"     WHERE sehd_bu = p_bu
"
"       AND sehd_suplr_id = p_suplr_id
"
"       AND sehd_upd_type = 'UNIT'
"
"       AND sehd_status IN ('N','E')
"
"    GROUP BY sehd_status;
"
"  EXCEPTION WHEN OTHERS THEN
"
"      v_count := 0;
"
"  END;
"
"        IF v_count > 0 THEN
"
"          IF v_status = 'N' THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'Document already forwaded for Approval');
"
"          ELSIF v_status ='E' THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'Document already in Draft Status');
"
"          END IF;
"
"        ELSE
"
"
"
"          pack_suplr_upd.proc_ins_suplr_edit_temp(p_bu,
"
"                                                  p_suplr_id,
"
"                                                  v_doc_no,
"
"                                                  p_user,
"
"                                                  1,
"
"                                                  p_session,
"
"                                                  p_upd_type,
"
"                                                  p_search,
"
"                                                  p_search);
"
"   END IF;
"
"
"
"ELSIF p_upd_type = 'T&C' THEN
"
"  BEGIN
"
"    SELECT COUNT(*),sehd_status
"
"      INTO v_count,v_status
"
"      FROM suplr_edit_hd
"
"     WHERE sehd_bu = p_bu
"
"       AND sehd_suplr_id = p_suplr_id
"
"       AND sehd_upd_type = 'T&C'
"
"       AND sehd_status IN ('N','E')
"
"    GROUP BY sehd_status;
"
"  EXCEPTION WHEN OTHERS THEN
"
"      v_count := 0;
"
"  END;
"
"        IF v_count > 0 THEN
"
"          IF v_status = 'N' THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'Document already forwaded for Approval');
"
"          ELSIF v_status ='E' THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'Document already in Draft Status');
"
"          END IF;
"
"        ELSE
"
"
"
"          pack_suplr_upd.proc_ins_suplr_edit_temp(p_bu,
"
"                                                  p_suplr_id,
"
"                                                  v_doc_no,
"
"                                                  p_user,
"
"                                                  1,
"
"                                                  p_session,
"
"                                                  p_upd_type,
"
"                                                  p_search,
"
"                                                  NULL);
"
"   END IF;
"
"
"
"   ELSIF p_upd_type = 'ESI' THEN
"
"  BEGIN
"
"    SELECT COUNT(*),sehd_status
"
"      INTO v_count,v_status
"
"      FROM suplr_edit_hd
"
"     WHERE sehd_bu = p_bu
"
"       AND sehd_suplr_id = p_suplr_id
"
"       AND sehd_upd_type = 'ESI'
"
"       AND sehd_status IN ('N','E')
"
"    GROUP BY sehd_status;
"
"  EXCEPTION WHEN OTHERS THEN
"
"      v_count := 0;
"
"  END;
"
"        IF v_count > 0 THEN
"
"          IF v_status = 'N' THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'Document already forwaded for Approval');
"
"          ELSIF v_status ='E' THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'Document already in Draft Status');
"
"          END IF;
"
"        ELSE
"
"
"
"          pack_suplr_upd.proc_ins_suplr_edit_temp(p_bu,
"
"                                                  p_suplr_id,
"
"                                                  v_doc_no,
"
"                                                  p_user,
"
"                                                  1,
"
"                                                  p_session,
"
"                                                  p_upd_type,
"
"                                                  p_search,
"
"                                                  NULL);
"
"   END IF;
"
"    ELSIF p_upd_type = 'UNIT LOCATION' THEN
"
"  BEGIN
"
"    SELECT COUNT(*),sehd_status
"
"      INTO v_count,v_status
"
"      FROM suplr_edit_hd
"
"     WHERE sehd_bu = p_bu
"
"       AND sehd_suplr_id = p_suplr_id
"
"       AND sehd_upd_type = 'UNIT LOCATION'
"
"       AND sehd_status IN ('N','E')
"
"    GROUP BY sehd_status;
"
"  EXCEPTION WHEN OTHERS THEN
"
"      v_count := 0;
"
"  END;
"
"        IF v_count > 0 THEN
"
"          IF v_status = 'N' THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'Document already forwaded for Approval');
"
"          ELSIF v_status ='E' THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'Document already in Draft Status');
"
"          END IF;
"
"        ELSE
"
"
"
"          pack_suplr_upd.proc_ins_suplr_edit_temp(p_bu,
"
"                                                  p_suplr_id,
"
"                                                  v_doc_no,
"
"                                                  p_user,
"
"                                                  1,
"
"                                                  p_session,
"
"                                                  p_upd_type,
"
"                                                  p_search,
"
"                                                  NULL);
"
"   END IF;
"
"   ELSIF p_upd_type IN ('TDS SECTION','ESI','PF') THEN
"
"  BEGIN
"
"    SELECT COUNT(*),sehd_status
"
"      INTO v_count,v_status
"
"      FROM suplr_edit_hd
"
"     WHERE sehd_bu = p_bu
"
"       AND sehd_suplr_id = p_suplr_id
"
"       AND sehd_upd_type IN ('TDS SECTION','ESI','PF')
"
"       AND sehd_status IN ('N','E')
"
"    GROUP BY sehd_status;
"
"  EXCEPTION WHEN OTHERS THEN
"
"      v_count := 0;
"
"  END;
"
"        IF v_count > 0 THEN
"
"          IF v_status = 'N' THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'Document already forwaded for Approval');
"
"          ELSIF v_status ='E' THEN
"
"            RAISE_APPLICATION_ERROR(-20999,'Document already in Draft Status');
"
"          END IF;
"
"        ELSE
"
"
"
"          pack_suplr_upd.proc_ins_suplr_edit_temp(p_bu,
"
"                                                  p_suplr_id,
"
"                                                  v_doc_no,
"
"                                                  p_user,
"
"                                                  1,
"
"                                                  p_session,
"
"                                                  p_upd_type,
"
"                                                  p_search,
"
"                                                  NULL);
"
"   END IF;
"
"END IF;
"
"
"
"END proc_upd_is_vaid;
"
"
"
"END pack_suplr_upd;"
/
