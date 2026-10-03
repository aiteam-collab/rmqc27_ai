prompt --application/shared_components/logic/application_computations/global_rpt_date_mask
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_RPT_DATE_MASK
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
 p_id=>wwv_flow_imp.id(5800236217500328117)
,p_computation_sequence=>5
,p_computation_item=>'GLOBAL_RPT_DATE_MASK'
,p_static_id=>'global-rpt-date-mask'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL ( (SELECT DISTINCT applctrl_excel_df',
'                FROM Appl_control',
'               WHERE applctrl_bu = :global_bu),',
'            1)',
'          DF',
'  FROM DUAL'))
,p_version_scn=>'26681171319'
);
wwv_flow_imp.component_end;
end;
/
