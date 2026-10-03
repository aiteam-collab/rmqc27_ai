prompt --application/shared_components/logic/application_computations/global_ip_addr
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_IP_ADDR
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
 p_id=>wwv_flow_imp.id(7677604824407110817)
,p_computation_sequence=>10
,p_computation_item=>'GLOBAL_IP_ADDR'
,p_static_id=>'global-ip-addr'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    sys_context(''userenv'', ''ip_address'')',
'FROM',
'    dual;'))
,p_version_scn=>'23552420113'
);
wwv_flow_imp.component_end;
end;
/
