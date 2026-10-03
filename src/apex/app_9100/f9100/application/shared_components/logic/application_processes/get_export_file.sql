prompt --application/shared_components/logic/application_processes/get_export_file
begin
--   Manifest
--     APPLICATION PROCESS: GET_EXPORT_FILE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(5634755948117930224)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_name=>'GET_EXPORT_FILE'
,p_static_id=>'get-export-file'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :GLOBAL_FILE_NAME NOT LIKE ''%sql%'' THEN',
'proc_apex_down_temp_blob(:GLOBAL_FILE_NAME);',
'ELSE ',
'proc_apex_down_temp_clob(:GLOBAL_FILE_NAME);',
'END IF;',
'',
'--RAISE_APPLICATION_ERROR(-20999,:GLOBAL_FILE_NAME);',
'-- proc_apex_down_temp_blob(:GLOBAL_FILE_NAME); old'))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>'23710764442'
);
wwv_flow_imp.component_end;
end;
/
