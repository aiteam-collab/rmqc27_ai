prompt --application/shared_components/logic/application_computations/global_not_cnt
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_NOT_CNT
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
 p_id=>wwv_flow_imp.id(11187425382210870492)
,p_computation_sequence=>703
,p_computation_item=>'GLOBAL_NOT_CNT'
,p_static_id=>'global-not-cnt'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT COUNT (cun_notfn_id)',
'  FROM notification_alert',
' WHERE cun_user_id = :global_user'))
,p_compute_when_type=>'NEVER'
,p_version_scn=>'26806734738'
);
wwv_flow_imp.component_end;
end;
/
