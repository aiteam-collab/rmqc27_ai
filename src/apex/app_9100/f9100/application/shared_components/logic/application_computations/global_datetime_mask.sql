prompt --application/shared_components/logic/application_computations/global_datetime_mask
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_DATETIME_MASK
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
 p_id=>wwv_flow_imp.id(7065133166023905098)
,p_computation_sequence=>10
,p_computation_item=>'GLOBAL_DATETIME_MASK'
,p_static_id=>'global-datetime-mask'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL((select distinct APPLCTRL_DF from Appl_control',
'where APPLCTRL_BU = :global_bu)||'' HH24:MI:SS'',1)  DF',
'FROM DUAL'))
);
wwv_flow_imp.component_end;
end;
/
