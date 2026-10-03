prompt --application/shared_components/logic/application_computations/global_emp_id
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_EMP_ID
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
 p_id=>wwv_flow_imp.id(11152848156518672767)
,p_computation_sequence=>10
,p_computation_item=>'GLOBAL_EMP_ID'
,p_static_id=>'global-emp-id'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'SELECT CASE WHEN :GLOBAL_CC_EMP_ID IS NULL THEN APPLUSER_EMP_ID ELSE :GLOBAL_CC_EMP_ID END FROM APPL_USERS WHERE APPLUSER_BU = :global_bu AND APPLUSER_ID = v(''app_user'');'
,p_version_scn=>'1'
);
wwv_flow_imp.component_end;
end;
/
