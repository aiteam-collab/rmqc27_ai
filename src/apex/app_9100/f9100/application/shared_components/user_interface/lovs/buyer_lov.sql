prompt --application/shared_components/user_interface/lovs/buyer_lov
begin
--   Manifest
--     BUYER_LOV
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(11127192409421147903)
,p_lov_name=>'BUYER_LOV'
,p_static_id=>'buyer-lov'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT',
'         DECODE (',
'            applctrl_desc_level,',
'            1,    emp_first_name1',
'               || '' ''',
'               || emp_middle_name1',
'               || '' ''',
'               || emp_last_name1,',
'            NVL (',
'                  emp_first_name2',
'               || '' ''',
'               || emp_middle_name2',
'               || '' ''',
'               || emp_last_name2,',
'                  emp_first_name1',
'               || '' ''',
'               || emp_middle_name1',
'               || '' ''',
'               || emp_last_name1))',
'            AS buyer_desc,',
'             buyer_id',
'    FROM buyers, employees, appl_control',
'   WHERE     buyer_bu = emp_bu',
'         AND buyer_emp_id = emp_emp_id',
'         AND buyer_bu = applctrl_bu',
'         AND buyer_bu = :GLOBAL_BU',
'ORDER BY 2 ASC'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'BUYER_ID'
,p_display_column_name=>'BUYER_DESC'
,p_version_scn=>'1'
);
wwv_flow_imp.component_end;
end;
/
