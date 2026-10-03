prompt --application/shared_components/logic/application_processes/view_attac_email
begin
--   Manifest
--     APPLICATION PROCESS: view_attac_email
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
 p_id=>wwv_flow_imp.id(5633117830679703634)
,p_process_sequence=>5
,p_process_point=>'ON_DEMAND'
,p_process_name=>'view_attac_email'
,p_static_id=>'view-attac-email'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_blob        blob;',
'  v_mime_type   varchar2(50);',
'BEGIN',
'',
' SELECT eoa_doc,eoa_mail_type',
'   INTO v_blob,v_mime_type',
'   FROM email_outbox_attach',
'  WHERE eoa_bu     = :GLOBAL_BU ',
'    AND eoa_doc_no = V(''P118_P_DOC_NO'')',
'    AND eoa_seq_no = V(''P118_P_SEQ_NO'');',
'',
'  owa_util.mime_header(v_mime_type,false);',
'  htp.p(''Content-Length: '' || dbms_lob.getlength(v_blob)); ',
'  owa_util.http_header_close;  ',
'  wpg_docload.download_file(v_blob);',
'  exception when no_data_found then',
'  null;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>'17681287207'
);
wwv_flow_imp.component_end;
end;
/
