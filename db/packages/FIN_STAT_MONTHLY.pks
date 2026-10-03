CREATE OR REPLACE
"PACKAGE  fin_stat_monthly
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
"      p_from       number,
"
"      p_to         number,
"
"      p_cre_by     VARCHAR,
"
"      p_cre_date   DATE
"
"   );
"
"   end fin_stat_monthly ;"
/
