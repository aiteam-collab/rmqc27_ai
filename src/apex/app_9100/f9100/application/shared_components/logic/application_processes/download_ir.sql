prompt --application/shared_components/logic/application_processes/download_ir
begin
--   Manifest
--     APPLICATION PROCESS: DOWNLOAD_IR
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
 p_id=>wwv_flow_imp.id(6183240348633759863)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_name=>'DOWNLOAD_IR'
,p_static_id=>'download-ir'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_file   VARCHAR2(4000);',
'BEGIN',
'proc_web_down_ir_rpt(:global_bu,',
'                     :global_user,',
'                     :app_id,',
'                     :app_page_id,',
'                     :app_session,',
'                     :GLOBAL_FILE_NAME);                 ',
'HTP.P(''success'');                ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>'18492159859'
);
wwv_flow_imp.component_end;
end;
/
