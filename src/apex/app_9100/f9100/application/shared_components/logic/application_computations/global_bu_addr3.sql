prompt --application/shared_components/logic/application_computations/global_bu_addr3
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_BU_ADDR3
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
 p_id=>wwv_flow_imp.id(5759576467973968017)
,p_computation_sequence=>10
,p_computation_item=>'GLOBAL_BU_ADDR3'
,p_static_id=>'global-bu-addr-3'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'select BU_ADDR3 FROM BUSINESS_UNITS where bu_ID=:global_bu;'
,p_version_scn=>'23552572997'
);
wwv_flow_imp.component_end;
end;
/
