prompt --application/shared_components/user_interface/lovs/esphd_pyrl_year_period
begin
--   Manifest
--     ESPHD_PYRL_YEAR_PERIOD
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(5780258525413698294)
,p_lov_name=>'ESPHD_PYRL_YEAR_PERIOD'
,p_static_id=>'esphd-pyrl-year-period'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT pcp_period,',
'	    pcp_long_desc,',
'	    pcp_start_date,',
'	    pcp_end_date',
'  FROM payroll_cal_period',
' WHERE pcp_bu    = :GLOBAL_bu',
'   AND pcp_clndr_id  = :P160_ESPHD_CLNDR',
'   AND pcp_year  = :P160_ESPHD_YEAR',
' ORDER BY pcp_period'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'PCP_PERIOD'
,p_display_column_name=>'PCP_LONG_DESC'
,p_version_scn=>'22342246487'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5780264018677703686)
,p_query_column_name=>'PCP_END_DATE'
,p_heading=>'End Date'
,p_display_sequence=>40
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5780263238715703686)
,p_query_column_name=>'PCP_LONG_DESC'
,p_heading=>'Description'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5780262795981703684)
,p_query_column_name=>'PCP_PERIOD'
,p_heading=>'Period'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(5780263650348703686)
,p_query_column_name=>'PCP_START_DATE'
,p_heading=>'Start Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp.component_end;
end;
/
