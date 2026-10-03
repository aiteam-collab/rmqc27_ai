prompt --application/shared_components/user_interface/lovs/lov_to_mail_unsent
begin
--   Manifest
--     LOV_TO_MAIL_UNSENT
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
 p_id=>wwv_flow_imp.id(6924819377859033059)
,p_lov_name=>'LOV_TO_MAIL_UNSENT'
,p_static_id=>'lov-to-mail-unsent'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    mr_receiver_email',
'FROM',
'    wfm_mail_report',
'WHERE',
'    mr_seq_no = :P1900043_EOH_DOC_NO;'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_query_owner=>'BCCHIPS'
,p_return_column_name=>'MR_RECEIVER_EMAIL'
,p_display_column_name=>'MR_RECEIVER_EMAIL'
,p_default_sort_column_name=>'MR_RECEIVER_EMAIL'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'23806865497'
);
wwv_flow_imp.component_end;
end;
/
