prompt --application/shared_components/logic/application_computations/global_mail_unsent_cnt
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_MAIL_UNSENT_CNT
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(11187426357555874150)
,p_computation_sequence=>704
,p_computation_item=>'GLOBAL_MAIL_UNSENT_CNT'
,p_static_id=>'global-mail-unsent-cnt'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT COUNT (1)',
'          FROM email_outbox_vw',
'         WHERE eoh_bu = :global_bu',
'               AND (eorl_status IS NULL',
'                    OR eorl_status NOT LIKE (''%Message %''))'))
,p_compute_when_type=>'NEVER'
,p_version_scn=>'26806730599'
);
wwv_flow_imp.component_end;
end;
/
