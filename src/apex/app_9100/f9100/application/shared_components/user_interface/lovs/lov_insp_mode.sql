prompt --application/shared_components/user_interface/lovs/lov_insp_mode
begin
--   Manifest
--     LOV_INSP_MODE
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
 p_id=>wwv_flow_imp.id(11144036843476035942)
,p_lov_name=>'LOV_INSP_MODE'
,p_static_id=>'lov-insp-mode'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Goods Receipt Note(PR)'' d,',
'	   ''PR'' r',
'  FROM dual',
'UNION ALL',
'SELECT ''Shop Floor Transfer'' d,',
'	   ''SF'' r',
'  FROM dual',
'UNION ALL',
'SELECT ''Sales Return'' d,',
'	   ''SR'' r',
'  FROM dual',
'UNION ALL',
'SELECT ''Material Transfer'' d,',
'	   ''MT'' r',
'  FROM dual',
'UNION ALL',
'SELECT ''Material Return'' d,',
'	   ''ME'' r',
'  FROM dual',
'UNION ALL',
'SELECT ''Pre Dispatch'' d,',
'	   ''PD'' r',
'  FROM dual',
'UNION ALL',
'SELECT ''Rework Order(IS/OS)'' d,',
'	   ''RW'' r',
'  FROM dual',
'UNION ALL',
'SELECT ''Service Work Order'' d,',
'	   ''SO'' r',
'  FROM dual',
'UNION ALL',
'SELECT ''External QC'' d,',
'	   ''EQ'' r',
'  FROM dual',
'UNION ALL',
'SELECT ''Stock'' d,',
'	   ''ST'' r',
'  FROM dual',
'UNION ALL',
'SELECT ''Stock - Customer'' d,',
'	   ''CS'' r',
'  FROM dual',
'UNION ALL',
'SELECT ''Stock - Third Party '' d,',
'	   ''TP'' r',
'  FROM dual',
'UNION ALL',
'SELECT ''Shearing'' d,',
'	   ''SH'' r',
'  FROM dual',
'UNION ALL',
'SELECT ''Stamping'' d,',
'	   ''SP'' r',
'  FROM dual'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp.component_end;
end;
/
