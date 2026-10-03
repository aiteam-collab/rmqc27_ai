prompt --application/shared_components/logic/application_computations/emp_cl_count
begin
--   Manifest
--     APPLICATION COMPUTATION: EMP_CL_COUNT
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
 p_id=>wwv_flow_imp.id(6267912672090840459)
,p_computation_sequence=>10
,p_computation_item=>'EMP_CL_COUNT'
,p_static_id=>'emp-cl-count'
,p_computation_point=>'AFTER_FOOTER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT nvl(COUNT(*),0)',
'   FROM daily_emp_att_hd,',
'        daily_emp_att_logs ',
'  WHERE deah_bu = deal_bu',
'    AND deah_doc_no = deal_doc_no',
'    AND deal_status IN (''N'',''I'',''P'')',
'    AND deal_bu = :GLOBAL_BU',
'    AND TRUNC(deal_log_date) = sysdate',
'    AND deal_emp_id IN (SELECT emp_emp_id',
'                          FROM employees',
'                         WHERE emp_bu = deal_bu',
'                           AND emp_emp_id = deal_emp_id',
'                           AND emp_cat_id = ''0005'')'))
,p_compute_when_type=>'NEVER'
,p_version_scn=>'26773955682'
);
wwv_flow_imp.component_end;
end;
/
