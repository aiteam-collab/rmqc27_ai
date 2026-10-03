CREATE OR REPLACE
"PACKAGE pkg_daily_trans
"
"AS
"
"
"
"  TYPE Typ_Daily_Trans_Log IS RECORD
"
"  (dtul_bu		VARCHAR2(5),
"
"   dtul_last_year	NUMBER(6),
"
"   dtul_year		NUMBER(6),
"
"   dtul_qtr		VARCHAR2(5),
"
"   dtul_period		NUMBER(2),
"
"   dtul_seq_no		NUMBER(6),
"
"   dtul_sub_vou_type	VARCHAR2(10),
"
"   dtul_vou_type	VARCHAR2(10),
"
"   dtul_plnt		VARCHAR2(10),
"
"   dtul_today_ctn	NUMBER(6),
"
"   dtul_per_ctn		NUMBER(6),
"
"   dtul_qtr_ctn		NUMBER(6),
"
"   dtul_yr_ctn		NUMBER(6),
"
"   dtul_last_yr_ctn	NUMBER(6),
"
"   dtul_lt_dt		DATE,
"
"   dtul_lt_user		VARCHAR2(15)
"
"  );
"
"
"
"  TYPE Typ_Daily_User_Trans_Log IS RECORD
"
"  (dutl_bu		VARCHAR2(5),
"
"   dutl_doc_user	VARCHAR2(15),
"
"   dutl_last_year	NUMBER(6),
"
"   dutl_year		NUMBER(6),
"
"   dutl_qtr		VARCHAR2(5),
"
"   dutl_period		NUMBER(2),
"
"   dutl_seq_no		NUMBER(6),
"
"   dutl_sub_vou_type	VARCHAR2(10),
"
"   dutl_vou_type	VARCHAR2(10),
"
"   dutl_plnt		VARCHAR2(10),
"
"   dutl_today_ctn	NUMBER(6),
"
"   dutl_per_ctn		NUMBER(6),
"
"   dutl_qtr_ctn		NUMBER(6),
"
"   dutl_yr_ctn		NUMBER(6),
"
"   dutl_last_yr_ctn	NUMBER(6),
"
"   dutl_lt_dt		DATE
"
"  );
"
"
"
"  TYPE Typ_Daily_Trans IS TABLE OF Typ_Daily_Trans_Log INDEX BY PLS_INTEGER;
"
"  TYPE Typ_Daily_User_Trans IS TABLE OF Typ_Daily_User_Trans_Log INDEX BY PLS_INTEGER;
"
"  TYPE typ_dt_vou IS TABLE OF dly_user_mod_vou_dtls%ROWTYPE;
"
"
"
"  R_Daily_Trans		Typ_Daily_Trans;
"
"  R_Daily_User_Trans	Typ_Daily_User_Trans;
"
"  r_dt_vou		typ_dt_vou;
"
"
"
"  PROCEDURE proc_ins_daily_trans_log(p_bu	VARCHAR2,
"
"                                     p_fr_date	DATE,
"
"				     p_to_date	DATE,
"
"				     p_user	VARCHAR2
"
"				    );
"
"
"
"END pkg_daily_trans;"
/
