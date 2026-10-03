prompt --application/shared_components/logic/application_processes/view_attachment
begin
--   Manifest
--     APPLICATION PROCESS: VIEW_ATTACHMENT
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
 p_id=>wwv_flow_imp.id(6923604833740957381)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_name=>'VIEW_ATTACHMENT'
,p_static_id=>'view-attachment'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_blob      BLOB;',
'  v_mime_type VARCHAR2(100);',
'  v_file_name VARCHAR2(255) := ''document'';',
'  v_seq_no    NUMBER;',
'BEGIN',
'   ',
'   PROC_WEB_FILE_TRANSF_VIEW(:GLOBAL_BU,:P800_DOC_NO,v_seq_no);',
'   COMMIT;',
'',
'  SELECT DOC_BLOB, MIME_TYPE',
'    INTO v_blob, v_mime_type',
'    FROM temp_web_doc_attach_view',
'   WHERE seq_no = (v_seq_no);',
'',
'  owa_util.mime_header(v_mime_type, FALSE);',
'  ',
'  IF v_mime_type IN (''application/pdf'', ''image/png'', ''image/jpeg'', ''image/gif'', ''text/plain'') THEN',
'    htp.p(''Content-Disposition: inline; filename="'' || v_file_name || ''"'');',
'  ELSE',
'    htp.p(''Content-Disposition: inline; filename="'' || v_file_name || ''.xlsx"'');',
'  END IF;',
' owa_util.http_header_close;',
' wpg_docload.download_file(v_blob);',
' htp.p(''success'');',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN',
'    htp.p(''File not found.'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>'26605132830'
);
wwv_flow_imp.component_end;
end;
/
