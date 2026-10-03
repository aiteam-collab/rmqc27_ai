prompt --application/shared_components/logic/application_computations/global_vertical
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_VERTICAL
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
 p_id=>wwv_flow_imp.id(11548618403897553946)
,p_computation_sequence=>707
,p_computation_item=>'GLOBAL_VERTICAL'
,p_static_id=>'global-vertical'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT bu_vert_id',
'  FROM business_units',
' WHERE bu_id = :GLOBAL_BU'))
,p_version_scn=>'23552429336'
);
wwv_flow_imp.component_end;
end;
/
