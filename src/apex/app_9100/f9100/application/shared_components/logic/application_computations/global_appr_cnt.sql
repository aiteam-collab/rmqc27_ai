prompt --application/shared_components/logic/application_computations/global_appr_cnt
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_APPR_CNT
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
 p_id=>wwv_flow_imp.id(11144165476004109968)
,p_computation_sequence=>10
,p_computation_item=>'GLOBAL_APPR_CNT'
,p_static_id=>'global-appr-cnt'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH user_emp',
'     AS (SELECT appluser_emp_id',
'           FROM appl_users',
'          WHERE appluser_bu = :GLOBAL_BU AND appluser_id = :GLOBAL_USER),',
'     user_pos',
'     AS (SELECT e.empai_pos_id',
'           FROM    emp_active_infos e',
'                JOIN',
'                   user_emp u',
'                ON u.appluser_emp_id = e.empai_emp_id',
'          WHERE e.empai_bu = :GLOBAL_BU),',
'     latest_wf',
'     AS (SELECT a.wfaa_wf_id, a.wfaa_status',
'           FROM work_flow_appr_actvt a',
'          WHERE a.wfaa_bu = :GLOBAL_BU',
'                AND (a.wfaa_wf_id, a.wfaa_seq_no) IN',
'                       (  SELECT wfaa_wf_id, MAX (wfaa_seq_no)',
'                            FROM work_flow_appr_actvt',
'                           WHERE wfaa_bu = :GLOBAL_BU',
'                        GROUP BY wfaa_wf_id))',
'SELECT COUNT (1)',
'  FROM work_flow_doc_control w',
' WHERE w.wfdc_bu = :GLOBAL_BU',
'       AND ( (w.wfdc_auth_type = ''P''',
'              AND w.wfdc_ctrl_person IN (SELECT empai_pos_id FROM user_pos))',
'            OR (w.wfdc_auth_type = ''E''',
'                AND w.wfdc_ctrl_person IN',
'                       (SELECT appluser_emp_id FROM user_emp)))',
'       AND (w.wfdc_type, w.wfdc_status) NOT IN',
'              (SELECT wfaa_wf_id, wfaa_status FROM latest_wf)',
'       AND w.wfdc_status NOT IN (''R'', ''C'')'))
,p_version_scn=>'26807054339'
);
wwv_flow_imp.component_end;
end;
/
