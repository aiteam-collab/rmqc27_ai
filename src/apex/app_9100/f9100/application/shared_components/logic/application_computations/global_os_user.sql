prompt --application/shared_components/logic/application_computations/global_os_user
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_OS_USER
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
 p_id=>wwv_flow_imp.id(6633819094493960238)
,p_computation_sequence=>50
,p_computation_item=>'GLOBAL_OS_USER'
,p_static_id=>'global-os-user'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'Audit_Info.Get_Os_user'
,p_version_scn=>'17781132050'
);
wwv_flow_imp.component_end;
end;
/
