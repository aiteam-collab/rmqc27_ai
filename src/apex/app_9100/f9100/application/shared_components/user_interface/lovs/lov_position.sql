prompt --application/shared_components/user_interface/lovs/lov_position
begin
--   Manifest
--     LOV_POSITION
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
 p_id=>wwv_flow_imp.id(6525141674430216387)
,p_lov_name=>'LOV_POSITION'
,p_static_id=>'lov-position'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT empai_pos_id position,func_find_employee_desc(:global_bu, empai_emp_id,1) NAME,',
'       func_find_position_desc(:global_bu, empai_pos_id,1) "Position Name",',
'       appluser_id user_id',
'  FROM emp_active_infos,',
'       appl_users',
' WHERE empai_bu = appluser_bu',
'   AND empai_emp_id = appluser_emp_id',
'   AND appluser_status = ''A''',
'   AND TRUNC(SYSDATE) BETWEEN TRUNC(appluser_eff_from) AND TRUNC(',
'                                                                appluser_eff_to',
'                                                           )',
'   AND empai_bu = :GLOBAL_bu',
'	order by position',
'   ',
'   '))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'POSITION'
,p_display_column_name=>'POSITION'
,p_default_sort_column_name=>'NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6525148074850221788)
,p_query_column_name=>'NAME'
,p_heading=>'Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6525147719271221788)
,p_query_column_name=>'POSITION'
,p_heading=>'Position'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6525148441579221788)
,p_query_column_name=>'Position Name'
,p_heading=>'Position Name'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6525148860702221788)
,p_query_column_name=>'USER_ID'
,p_heading=>'User Id'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
