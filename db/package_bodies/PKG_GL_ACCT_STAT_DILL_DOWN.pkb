CREATE OR REPLACE
"PACKAGE BODY pkg_gl_acct_stat_dill_down
"
"AS
"
"   PROCEDURE proc_gl_acct_dill_down (p_bu                  VARCHAR2,
"
"                                     p_doc_pfx             VARCHAR2,
"
"                                     p_doc_no              VARCHAR2,
"
"                                     p_where               VARCHAR2,
"
"                                     p_session             VARCHAR2,
"
"                                     p_global_user         VARCHAR2,
"
"                                     p_global_p            VARCHAR2,
"
"                                     p_global_schema       VARCHAR2,
"
"                                     p_url             OUT VARCHAR2)
"
"   IS
"
"      CURSOR c1
"
"      IS
"
"           SELECT GLBD_VOU_TYPE,
"
"                  GLBD_VOU_NO,
"
"                  GLBD_VOU_PFX,
"
"                  GLBD_ACCT_PLANT
"
"             FROM gl_ldgr_bal_dw
"
"            WHERE glbd_bu = p_bu AND glbd_cre_by = p_global_user --:GLOBAL_user
"
"         ORDER BY glbd_seq_no;
"
"
"
"      cr1              c1%ROWTYPE;
"
"
"
"      v_doc_type       VARCHAR2 (10);
"
"      v_pfx_type       VARCHAR2 (10);
"
"      v_apex_page_no   NUMBER;
"
"      v_apex_appl_no   NUMBER;
"
"      v_param_id       VARCHAR2 (2000);
"
"      v_param_val      VARCHAR2 (2000);
"
"      v_ord_pfx        VARCHAR2 (10);
"
"      v_ord_no         VARCHAR2 (40);
"
"      v_plant          VARCHAR2 (10);
"
"      v_link           VARCHAR2 (2000);
"
"      v_app_no         NUMBER (5);
"
"      v_page_alias     VARCHAR2 (2000);
"
"      v_app_alias      VARCHAR2 (2000);
"
"      v_checksum       VARCHAR2 (4000);
"
"      v_string         VARCHAR2 (2000);
"
"      v_raw            RAW (2000);
"
"      v_hash           RAW (2000);
"
"   BEGIN
"
"      OPEN c1;
"
"
"
"      FETCH c1 INTO cr1;
"
"
"
"      IF c1%FOUND
"
"      THEN
"
"         IF (cr1.GLBD_VOU_TYPE IN ('BPV', 'BRV', 'CPV', 'CRV', 'JV'))
"
"         THEN
"
"            BEGIN
"
"               SELECT btrans_type || btrans_trans_mode,
"
"                      btrans_ord_pfx,
"
"                      btrans_ord_no
"
"                 INTO v_doc_type, v_ord_pfx, v_ord_no
"
"                 FROM bank_trans_hist_vw
"
"                WHERE     btrans_bu = p_bu
"
"                      AND btrans_ord_pfx = cr1.GLBD_VOU_PFX
"
"                      AND btrans_ord_no = cr1.GLBD_VOU_NO;
"
"
"
"               IF v_doc_type = 'BTP'
"
"               THEN
"
"                  v_pfx_type := 'BPV';
"
"                  v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                  v_param_val := v_ord_pfx || ',' || v_ord_no || ',NAV';
"
"               ELSIF v_doc_type = 'BTR'
"
"               THEN
"
"                  v_pfx_type := 'BRV';
"
"                  v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                  v_param_val := v_ord_pfx || ',' || v_ord_no || ',NAV';
"
"               ELSIF v_doc_type = 'CTP'
"
"               THEN
"
"                  v_pfx_type := 'CPV';
"
"                  v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                  v_param_val := v_ord_pfx || ',' || v_ord_no || ',NAV';
"
"               ELSIF v_doc_type = 'CTR'
"
"               THEN
"
"                  v_pfx_type := 'CRV';
"
"                  v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                  v_param_val := v_ord_pfx || ',' || v_ord_no || ',NAV';
"
"               ELSIF v_doc_type = 'JTP'
"
"               THEN
"
"                  v_pfx_type := 'JV';
"
"                  v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                  v_param_val := v_ord_pfx || ',' || v_ord_no || ',NAV';
"
"               ELSIF v_doc_type = 'CVI'
"
"               THEN
"
"                  v_pfx_type := 'CV';
"
"                  v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                  v_param_val := v_ord_pfx || ',' || v_ord_no || ',NAV';
"
"               ELSIF v_doc_type = 'CVO'
"
"               THEN
"
"                  v_pfx_type := 'CV';
"
"                  v_param_id := 'BTRANS_ORD_PFX,BTRANS_ORD_NO,PAGE_NAV';
"
"                  v_param_val := v_ord_pfx || ',' || v_ord_no || ',NAV';
"
"               END IF;
"
"            EXCEPTION
"
"               WHEN NO_DATA_FOUND
"
"               THEN
"
"                  v_doc_type := NULL;
"
"            END;
"
"         ELSIF cr1.GLBD_VOU_TYPE IN ('SB')
"
"         THEN
"
"            BEGIN
"
"               SELECT suphd_doc_type, suphd_pfx, suphd_doc_no
"
"                 INTO v_doc_type, v_ord_pfx, v_ord_no
"
"                 FROM suplr_doc_hd_hist_vw1
"
"                WHERE     suphd_bu = p_bu
"
"                      AND suphd_pfx = cr1.GLBD_VOU_PFX
"
"                      AND suphd_doc_no = cr1.GLBD_VOU_NO;
"
"
"
"               IF v_doc_type = 'SB'
"
"               THEN
"
"                  v_pfx_type := 'SB';
"
"                  v_param_id := 'SUPHD_PFX,SUPHD_DOC_NO';
"
"                  v_param_val := v_ord_pfx || ',' || v_ord_no;
"
"               ELSIF v_doc_type = 'CN'
"
"               THEN
"
"                  v_pfx_type := 'CN';
"
"                  v_param_id := 'SIHD_PLANT,SIHD_DOC_NO,PAGE_NAVI';
"
"                  v_param_val :=
"
"                        cr1.GLBD_ACCT_PLANT
"
"                     || ','
"
"                     || cr1.GLBD_VOU_NO
"
"                     || ','
"
"                     || 'CREDIT_NOTE';
"
"               ELSIF v_doc_type = 'DN'
"
"               THEN
"
"                  v_pfx_type := 'DN';
"
"                  v_param_id := 'SIHD_PLANT,SIHD_DOC_NO,PAGE_NAVI';
"
"                  v_param_val :=
"
"                        cr1.GLBD_ACCT_PLANT
"
"                     || ','
"
"                     || cr1.GLBD_VOU_NO
"
"                     || ','
"
"                     || 'DEBIT NOTE';
"
"               END IF;
"
"            EXCEPTION
"
"               WHEN NO_DATA_FOUND
"
"               THEN
"
"                  v_doc_type := NULL;
"
"            END;
"
"         ELSIF cr1.GLBD_VOU_TYPE IN ('SI', 'CN', 'DN')
"
"         THEN
"
"            v_doc_type := 'SI';
"
"            v_pfx_type := 'SI';
"
"            --v_param_id := 'sihd_plant='||cr1.pdd_plant||',sihd_doc_no='||cr1.par_src_doc_no||',page_navi=INVOICE';
"
"            v_param_id := 'SIHD_PLANT,SIHD_DOC_NO,PAGE_NAVI';
"
"            v_param_val :=
"
"                  cr1.GLBD_ACCT_PLANT
"
"               || ','
"
"               || cr1.GLBD_VOU_NO
"
"               || ','
"
"               || 'INVOICE';
"
"         END IF;
"
"
"
"         CLOSE c1;
"
"
"
"         IF v_pfx_type IS NOT NULL
"
"         THEN
"
"            BEGIN
"
"               SELECT apt_appl_no, apt_page_no
"
"                 INTO v_apex_appl_no, v_apex_page_no
"
"                 FROM appl_pfx_types
"
"                WHERE APT_BU = p_bu AND apt_pfx_type = v_pfx_type;
"
"
"
"               --PROC_DEBUG_PROC ('Prefix Type is ' || v_pfx_type);
"
"
"
"            EXCEPTION
"
"               WHEN NO_DATA_FOUND
"
"               THEN
"
"                  v_apex_appl_no := NULL;
"
"                  v_apex_page_no := NULL;
"
"            END;
"
"
"
"            IF v_apex_appl_no IS NULL OR v_apex_page_no IS NULL
"
"            THEN
"
"               RAISE_APPLICATION_ERROR (
"
"                  -20999,
"
"                     'Application no. or Page no. not defined'
"
"                  || '/'
"
"                  || v_apex_appl_no
"
"                  || '/'
"
"                  || v_apex_page_no
"
"                  || '/'
"
"                  || v_pfx_type);
"
"            END IF;
"
"
"
"            v_param_id :=
"
"                  'P'
"
"               || v_apex_page_no
"
"               || '_'
"
"               || REPLACE (v_param_id, ',', ',P' || v_apex_page_no || '_');
"
"
"
"            --proc_debug_proc (v_param_id || ':' || v_param_val);
"
"
"
"            IF v_apex_appl_no IS NOT NULL AND v_apex_page_no IS NOT NULL
"
"            THEN
"
"               p_url :=
"
"                  APEX_UTIL.PREPARE_URL (
"
"                        'f?p='
"
"                     || v_apex_appl_no
"
"                     || ':'
"
"                     || v_apex_page_no
"
"                     || ':'
"
"                     || p_session
"
"                     || '::::'
"
"                     || v_param_id
"
"                     || ':'
"
"                     || v_param_val);
"
"
"
"               --p_url :=owa_util.get_cgi_env('REQUEST_PROTOCOL')||'://'||owa_util.get_cgi_env('HTTP_HOST')||'/ords/r/'||LOWER(p_global_schema)||'/'||v_app_alias||'/'||v_page_alias||'?'||v_param_id||'='||v_apex_page_no||'='||p_session||'='||v_checksum;
"
"               --proc_debug_proc (p_url);
"
"            END IF;
"
"         END IF;
"
"      END IF;
"
"   END proc_gl_acct_dill_down;
"
"END pkg_gl_acct_stat_dill_down;"
/
