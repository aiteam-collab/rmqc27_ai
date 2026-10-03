prompt --application/shared_components/user_interface/lovs/lov_doc_no_uam2015
begin
--   Manifest
--     LOV_DOC_NO(UAM2015)
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
 p_id=>wwv_flow_imp.id(6599747729697754570)
,p_lov_name=>'LOV_DOC_NO(UAM2015)'
,p_static_id=>'lov-doc-no-uam'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  distinct wupav_doc_no,',
'DECODE(WUPAV_TYPE,''A'',''Add Bus. Fun.'' ,''R'',''Remove Bus. Fun.'') TYPE from  wapl_user_plnt_access_view',
'WHERE WUPAV_BU = :Global_bu'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'WUPAV_DOC_NO'
,p_display_column_name=>'WUPAV_DOC_NO'
,p_default_sort_column_name=>'WUPAV_DOC_NO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6599748364616754687)
,p_query_column_name=>'TYPE'
,p_heading=>'Type'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6599748013954754667)
,p_query_column_name=>'WUPAV_DOC_NO'
,p_heading=>'Doc. No'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
