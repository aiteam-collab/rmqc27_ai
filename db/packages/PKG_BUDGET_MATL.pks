CREATE OR REPLACE
"PACKAGE pkg_budget_matl
"
"AS
"
"   FUNCTION func_chk_budget_type (p_bu VARCHAR2)
"
"      RETURN VARCHAR2;
"
"
"
"   FUNCTION func_get_budget_type (p_bu VARCHAR2, p_acct VARCHAR2)
"
"      RETURN VARCHAR2;
"
"
"
"   FUNCTION func_get_plnt_bud_req (p_bu VARCHAR2, p_plnt VARCHAR2)
"
"      RETURN VARCHAR2;
"
"
"
"   FUNCTION func_get_acct_bud_req (p_bu VARCHAR2, p_acct VARCHAR2)
"
"      RETURN VARCHAR2;
"
"
"
"   FUNCTION func_get_cc_code_bud_req (p_bu VARCHAR2, p_cc_code VARCHAR2)
"
"      RETURN VARCHAR2;
"
"
"
"   FUNCTION func_get_acct_grp_bud_req (p_bu VARCHAR2, p_acct VARCHAR2)
"
"      RETURN VARCHAR2;
"
"
"
"   FUNCTION func_get_acct_grp (p_bu VARCHAR2, p_acct VARCHAR2)
"
"      RETURN VARCHAR2;
"
"
"
"   PROCEDURE proc_chk_val_fr_matl_budget (
"
"      p_bu             VARCHAR2,
"
"      p_plnt           VARCHAR2,
"
"      p_plnt_loc_id    VARCHAR2,
"
"      p_year           NUMBER,
"
"      p_period         NUMBER,
"
"      p_type           VARCHAR2,
"
"      --p_acct           VARCHAR2,
"
"      --p_cc_code        VARCHAR2,
"
"	   p_cls_or_grp_id  VARCHAR2,
"
"      p_vou_amt        NUMBER,
"
"      p_user           VARCHAR2,
"
"      p_proj_id        VARCHAR2 DEFAULT NULL,
"
"      p_sou_doc_amt    NUMBER DEFAULT 0);
"
"
"
"   PROCEDURE proc_upd_val_fr_matl_budget (
"
"      p_bu             VARCHAR2,
"
"      p_plnt           VARCHAR2,
"
"      p_doc_date       DATE,
"
"      p_year           NUMBER,
"
"      p_period         NUMBER,
"
"      p_type           VARCHAR2,
"
"      p_acct           VARCHAR2,
"
"      --p_cc_code        VARCHAR2,
"
"	  p_cls_or_grp_id  VARCHAR2,
"
"      p_vou_pfx        VARCHAR2,
"
"      p_vou_no         VARCHAR2,
"
"      p_vou_line_no    NUMBER,
"
"      p_vou_amt        NUMBER,
"
"      p_user           VARCHAR2,
"
"      p_proj_id        VARCHAR2 DEFAULT NULL);
"
"END pkg_budget_matl;
"
/
