prompt --application/shared_components/user_interface/lovs/lov_unit_emp_hier
begin
--   Manifest
--     LOV_UNIT_EMP_HIER
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
 p_id=>wwv_flow_imp.id(6527464680236078413)
,p_lov_name=>'LOV_UNIT_EMP_HIER'
,p_static_id=>'lov-unit-emp-hier'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT bup_plant_id, ',
'       bup_name1 ',
'FROM  bus_unit_plants,',
'     appl_user_plant_access,',
'     appl_users',
'WHERE bup_bu = auba_bu ',
'AND bup_plant_id = auba_plant ',
'AND bup_bu = appluser_bu',
'AND auba_user_id = appluser_id',
'AND (TRUNC(SYSDATE) BETWEEN auba_from AND auba_to) ',
'AND bup_bu = :WEH_APPR_BU',
'GROUP BY bup_plant_id,bup_name1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'BUP_PLANT_ID'
,p_display_column_name=>'BUP_PLANT_ID'
,p_default_sort_column_name=>'BUP_PLANT_ID'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6527471310034087287)
,p_query_column_name=>'BUP_NAME1'
,p_heading=>'Unit Desc.'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6527471711270087287)
,p_query_column_name=>'BUP_PLANT_ID'
,p_heading=>'Unit'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
