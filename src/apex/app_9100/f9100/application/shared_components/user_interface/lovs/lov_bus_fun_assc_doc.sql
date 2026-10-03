prompt --application/shared_components/user_interface/lovs/lov_bus_fun_assc_doc
begin
--   Manifest
--     LOV_BUS_FUN_ASSC_DOC
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
 p_id=>wwv_flow_imp.id(6594765429074750515)
,p_lov_name=>'LOV_BUS_FUN_ASSC_DOC'
,p_static_id=>'lov-bus-fun-assc-doc'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT wbfav_doc_no ,DECODE(wbfav_type,''A'',''Add Bus. Fun.'' ,''R'',''Remove Bus. Fun.'') type  ',
'  FROM wapl_bus_fun_access_view ',
' WHERE wbfav_user_id IN (SELECT appluser_id ',
'                           FROM appl_users ',
'                          WHERE appluser_bu = :GLOBAL_bu',
'                            AND appluser_status = ''A'')',
'ORDER BY wbfav_doc_no'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WBFAV_DOC_NO'
,p_display_column_name=>'WBFAV_DOC_NO'
,p_default_sort_column_name=>'WBFAV_DOC_NO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6594775379916811603)
,p_query_column_name=>'TYPE'
,p_heading=>'Type'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6594775026547811598)
,p_query_column_name=>'WBFAV_DOC_NO'
,p_heading=>'Doc. No.'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
