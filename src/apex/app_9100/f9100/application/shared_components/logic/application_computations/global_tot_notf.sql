prompt --application/shared_components/logic/application_computations/global_tot_notf
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_TOT_NOTF
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
 p_id=>wwv_flow_imp.id(7704449507294334511)
,p_computation_sequence=>807
,p_computation_item=>'GLOBAL_TOT_NOTF'
,p_static_id=>'global-tot-notf'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'SELECT &GLOBAL_APPR_CNT. + &GLOBAL_TASK_CNT. + &GLOBAL_MSG_CNT. + &GLOBAL_NOT_CNT. + &GLOBAL_MAIL_UNSENT_CNT. + &GLOBAL_SMS_UNSENT_CNT. FROM DUAL'
,p_compute_when_type=>'NEVER'
,p_version_scn=>'23552439494'
);
wwv_flow_imp.component_end;
end;
/
