prompt --application/shared_components/logic/application_computations/global_amt_desc
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_AMT_DESC
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
 p_id=>wwv_flow_imp.id(6254428652800361796)
,p_computation_sequence=>10
,p_computation_item=>'GLOBAL_AMT_DESC'
,p_static_id=>'global-amt-desc'
,p_computation_point=>'AFTER_FOOTER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT DECODE(NVL((SELECT mat_amt_type',
'  FROM mis_amt_type',
' WHERE mat_bu=:GLOBAL_BU',
'   AND mat_user=:GLOBAL_USER),''A''),''A'',''Millions'',''L'',''Lakhs'',''T'',''Thousands'')  AMT_TYPE',
'FROM DUAL'))
,p_compute_when_type=>'NEVER'
,p_version_scn=>'26773957240'
);
wwv_flow_imp.component_end;
end;
/
