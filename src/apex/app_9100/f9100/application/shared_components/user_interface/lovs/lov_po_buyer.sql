prompt --application/shared_components/user_interface/lovs/lov_po_buyer
begin
--   Manifest
--     LOV_PO_BUYER
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
 p_id=>wwv_flow_imp.id(11145293807946477106)
,p_lov_name=>'LOV_PO_BUYER'
,p_static_id=>'lov-po-buyer'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT buyer_id r,',
'         DECODE (',
'            applctrl_desc_level,',
'            1,    emp_first_name1',
'               || '' ''',
'               || emp_middle_name1',
'               || '' ''',
'               || emp_last_name1,',
'            emp_first_name2 || '' '' || emp_middle_name2 || '' '' || emp_last_name2)',
'            AS d',
'    FROM buyers,',
'         employees,',
'         appl_control,',
'         emp_active_infos,',
'         departments',
'   WHERE     buyer_bu = emp_bu',
'         AND buyer_emp_id = emp_emp_id',
'         AND buyer_bu = applctrl_bu',
'         AND buyer_bu = :global_bu',
'         AND emp_bu = empai_bu',
'         AND emp_emp_id = empai_emp_id',
'         AND empai_bu = dept_bu',
'         AND empai_dept_id = dept_id',
'ORDER BY DECODE (',
'            applctrl_desc_level,',
'            1,    emp_first_name1',
'               || '' ''',
'               || emp_middle_name1',
'               || '' ''',
'               || emp_last_name1,',
'               emp_first_name2',
'            || '' ''',
'            || emp_middle_name2',
'            || '' ''',
'            || emp_last_name2)'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_version_scn=>'1'
);
wwv_flow_imp.component_end;
end;
/
