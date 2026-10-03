CREATE OR REPLACE
"PACKAGE pkg_ai_sales AUTHID DEFINER AS
"
"
"
"    c_fy_start_month CONSTANT PLS_INTEGER := 4;
"
"
"
"    FUNCTION to_fin_year( p_cal_year IN NUMBER ) RETURN NUMBER;
"
"
"
"    FUNCTION resolve_period(
"
"        p_period_type IN VARCHAR2,
"
"        p_month       IN NUMBER   DEFAULT NULL,
"
"        p_year        IN NUMBER   DEFAULT NULL,
"
"        p_from_date   IN VARCHAR2 DEFAULT NULL,
"
"        p_to_date     IN VARCHAR2 DEFAULT NULL
"
"    ) RETURN t_ai_period_tab PIPELINED;
"
"
"
"    FUNCTION create_export_request(
"
"        p_dataset   IN VARCHAR2,
"
"        p_filters   IN CLOB,
"
"        p_row_count IN NUMBER
"
"    ) RETURN NUMBER;
"
"
"
"    FUNCTION create_chart_request(
"
"        p_chart_type  IN VARCHAR2,
"
"        p_dataset     IN VARCHAR2,
"
"        p_dimension   IN VARCHAR2,
"
"        p_granularity IN VARCHAR2,
"
"        p_title       IN VARCHAR2,
"
"        p_filters     IN CLOB
"
"    ) RETURN NUMBER;
"
"
"
"END pkg_ai_sales;"
/
