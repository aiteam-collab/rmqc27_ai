prompt --application/shared_components/logic/application_computations/active
begin
--   Manifest
--     APPLICATION COMPUTATION: ACTIVE
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
 p_id=>wwv_flow_imp.id(11668716490380127189)
,p_computation_sequence=>800
,p_computation_item=>'ACTIVE'
,p_static_id=>'active'
,p_computation_point=>'AFTER_FOOTER'
,p_computation_type=>'QUERY_COLON'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ubff_bus_fun_id',
'     FROM user_bus_fun_favourites_apex',
'    WHERE ubff_bu=:global_bu',
'        AND ubff_user_id =:global_user'))
,p_version_scn=>'26773834265'
);
wwv_flow_imp.component_end;
end;
/
