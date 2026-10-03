prompt --application/shared_components/user_interface/lovs/lov_noti_docno
begin
--   Manifest
--     LOV_NOTI_DOCNO
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
 p_id=>wwv_flow_imp.id(6561385996320707661)
,p_lov_name=>'LOV_NOTI_DOCNO'
,p_static_id=>'lov-noti-docno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT wunahd_doc_no ,',
'       DECODE(wunahd_type,''A'',''Add Bus. Fun.'' ,''R'',''Remove Bus. Fun.'') type  ',
'  FROM wa_user_notif_access_hd ',
' WHERE wunahd_user_id IN (SELECT appluser_id ',
'                            FROM appl_users ',
'                           WHERE appluser_bu = :GLOBAL_bu',
'                             AND appluser_status = ''A'')',
'ORDER BY wunahd_doc_no'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'WUNAHD_DOC_NO'
,p_display_column_name=>'WUNAHD_DOC_NO'
,p_default_sort_column_name=>'WUNAHD_DOC_NO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'22802732693'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6561388455968711852)
,p_query_column_name=>'TYPE'
,p_heading=>'Type'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6561388153570711852)
,p_query_column_name=>'WUNAHD_DOC_NO'
,p_heading=>'Doc. No.'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
