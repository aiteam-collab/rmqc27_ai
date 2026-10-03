prompt --application/pages/page_00186
begin
--   Manifest
--     PAGE: 00186
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_page.create_page(
 p_id=>186
,p_name=>'Email Attach Doc. view'
,p_alias=>'EMAIL-ATTACH-DOC-VIEW'
,p_page_mode=>'MODAL'
,p_step_title=>'Email Attach Doc. view'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(function () {',
'    var fileUrl = $v(''P186_LINK'');          // Dynamic file URL',
'    var fileExt = $v(''P186_FILE_EXT'').toUpperCase();  // Dynamic file type',
'    var container = document.getElementById(''viewerContainer'');',
'',
'    container.innerHTML = '''';  // Clear previous content',
'',
'    if (!fileUrl) {',
'        container.innerHTML = ''<p style="color:red;">File URL not found</p>'';',
'        return;',
'    }',
'',
'    // PDF',
'    if (fileExt === ''PDF'') {',
'        var embed = document.createElement(''embed'');',
'        embed.src = fileUrl + ''#toolbar=0'';',
'        embed.type = ''application/pdf'';',
'        embed.style.width = ''100%'';',
'        embed.style.height = ''900px'';',
'        container.appendChild(embed);',
'    }',
'    // Word / Excel',
'    else if ([''DOC'', ''DOCX'', ''XLS'', ''XLSX''].indexOf(fileExt) >= 0) {',
'        var iframe = document.createElement(''iframe'');',
'        iframe.src = ''https://view.officeapps.live.com/op/view.aspx?src='' + encodeURIComponent(fileUrl);',
'        iframe.style.width = ''100%'';',
'        iframe.style.height = ''900px'';',
'        iframe.frameBorder = 0;',
'        container.appendChild(iframe);',
'    }',
'    // Images / TXT',
'    else if ([''JPG'', ''JPEG'', ''PNG'', ''GIF'', ''TXT''].indexOf(fileExt) >= 0) {',
'        var embed = document.createElement(''embed'');',
'        embed.src = fileUrl + ''#toolbar=0'';',
'        embed.style.width = ''100%'';',
'        embed.style.height = ''900px'';',
'        container.appendChild(embed);',
'    }',
'    // Unsupported',
'    else {',
'        container.innerHTML = ''<p style="color:red;">File type not supported for preview</p>'';',
'    }',
'})();'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_dialog_height=>'900'
,p_dialog_width=>'1200'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6745209996687893703)
,p_plug_name=>'View'
,p_static_id=>'view'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<div id="view_pdf"></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6745210443644893707)
,p_plug_name=>'View Attachment'
,p_static_id=>'view-attachment'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!--Refer application process-->',
'<p align="center">',
'    <embed src="&P91_LINK.#toolbar=0" height="1000"  width="100%">',
'</p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6745210260819893705)
,p_name=>'P186_DM_DOC_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6745209996687893703)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6745210284936893706)
,p_name=>'P186_DM_DOC_SEQ'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6745209996687893703)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6745210160819893704)
,p_name=>'P186_LINK'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6745209996687893703)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6787718877120928507)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'VIEW'
,p_static_id=>'view'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_full_path VARCHAR2(4000);',
'    l_filename  VARCHAR2(4000);',
'    l_dir       VARCHAR2(4000);',
'    l_bfile     BFILE;',
'    l_blob      BLOB;',
'    l_mime_type VARCHAR2(100);',
'BEGIN',
'   SELECT CASE ',
'         WHEN REGEXP_SUBSTR(',
'                EOA_FILENAME,',
'                ''^[^\\]+\\([^\\]+)'',',
'                1,',
'                1,',
'                NULL,',
'                1',
'              ) = ''C_DIR''',
'         THEN ''C_DIR''',
'         ELSE ''APEX_ATTACH_DIR'' ',
'       END AS directory_name into l_dir',
'        FROM   EMAIL_OUTBOX_ATTACH',
'        WHERE  eoa_bu     = :GLOBAL_BU',
'        AND    eoa_doc_no = :P186_DM_DOC_NO',
'        AND    eoa_seq_no =',
':p186_dm_doc_seq;',
'    -- Get full path from table',
'SELECT',
'    eoa_filename',
'INTO l_full_path',
'FROM',
'    email_outbox_attach',
'WHERE',
'        eoa_bu = :global_bu',
'    AND eoa_doc_no = :p186_dm_doc_no',
'        AND eoa_seq_no = :p186_dm_doc_seq;',
'',
'    ',
'',
'    -- Extract file name from Windows path',
'l_filename := regexp_substr(:p186_link, ''[^\\]+$'');',
'',
'    -- Read file via Oracle DIRECTORY',
'l_bfile := bfilename(L_DIR, l_filename);',
'',
'dbms_lob.open(l_bfile, dbms_lob.lob_readonly);',
'',
'dbms_lob.createtemporary(l_blob, true);',
'',
'dbms_lob.loadfromfile(l_blob, l_bfile, dbms_lob.getlength(l_bfile));',
'',
'dbms_lob.close(l_bfile);',
'',
'    -- MIME type (manual, safe)',
'CASE lower(regexp_substr(l_filename, ''\.[^.]+$''))',
'    WHEN ''.pdf'' THEN',
'        l_mime_type := ''application/pdf'';',
'    WHEN ''.jpg'' THEN',
'        l_mime_type := ''image/jpeg'';',
'    WHEN ''.jpeg'' THEN',
'        l_mime_type := ''image/jpeg'';',
'    WHEN ''.png'' THEN',
'        l_mime_type := ''image/png'';',
'    ELSE',
'        l_mime_type := ''application/octet-stream'';',
'END CASE;',
'',
'    -- Inline display',
'owa_util.mime_header(l_mime_type, false);',
'',
'htp.p(''Content-Disposition: inline; filename="''',
'      || l_filename',
'      || ''"'');',
'',
'owa_util.http_header_close;',
'',
'wpg_docload.download_file(l_blob);',
'',
'apex_application.stop_apex_engine;',
'',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1308197893336008305
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6787718986787928509)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'VIEW AFTER'
,p_static_id=>'view-after'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_full_path VARCHAR2(4000);',
'    l_filename  VARCHAR2(4000);',
'    l_dir       VARCHAR2(4000);',
'    l_bfile     BFILE;',
'    l_blob      BLOB;',
'    l_mime_type VARCHAR2(100);',
'BEGIN',
'   SELECT CASE ',
'         WHEN REGEXP_SUBSTR(',
'                EOA_FILENAME,',
'                ''^[^\\]+\\([^\\]+)'',',
'                1,',
'                1,',
'                NULL,',
'                1',
'              ) = ''C_DIR''',
'         THEN ''C_DIR''',
'         ELSE ''APEX_ATTACH_DIR'' ',
'       END AS directory_name into l_dir',
'        FROM   EMAIL_OUTBOX_ATTACH',
'        WHERE  eoa_bu     = :GLOBAL_BU',
'        AND    eoa_doc_no = :P186_DM_DOC_NO',
'        AND    eoa_seq_no =',
':p186_dm_doc_seq;',
'    -- Get full path from table',
'SELECT',
'    eoa_filename',
'INTO l_full_path',
'FROM',
'    email_outbox_attach',
'WHERE',
'        eoa_bu = :global_bu',
'    AND eoa_doc_no = :p186_dm_doc_no',
'        AND eoa_seq_no = :p186_dm_doc_seq;',
'',
'    ',
'',
'    -- Extract file name from Windows path',
'l_filename := regexp_substr(:p186_link, ''[^\\]+$'');',
'',
'    -- Read file via Oracle DIRECTORY',
'l_bfile := bfilename(L_DIR, l_filename);',
'',
'dbms_lob.open(l_bfile, dbms_lob.lob_readonly);',
'',
'dbms_lob.createtemporary(l_blob, true);',
'',
'dbms_lob.loadfromfile(l_blob, l_bfile, dbms_lob.getlength(l_bfile));',
'',
'dbms_lob.close(l_bfile);',
'',
'    -- MIME type (manual, safe)',
'CASE lower(regexp_substr(l_filename, ''\.[^.]+$''))',
'    WHEN ''.pdf'' THEN',
'        l_mime_type := ''application/pdf'';',
'    WHEN ''.jpg'' THEN',
'        l_mime_type := ''image/jpeg'';',
'    WHEN ''.jpeg'' THEN',
'        l_mime_type := ''image/jpeg'';',
'    WHEN ''.png'' THEN',
'        l_mime_type := ''image/png'';',
'    ELSE',
'        l_mime_type := ''application/octet-stream'';',
'END CASE;',
'',
'    -- Inline display',
'owa_util.mime_header(l_mime_type, false);',
'',
'htp.p(''Content-Disposition: inline; filename="''',
'      || l_filename',
'      || ''"'');',
'',
'owa_util.http_header_close;',
'',
'wpg_docload.download_file(l_blob);',
'',
'apex_application.stop_apex_engine;',
'',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>1308198003003008307
);
wwv_flow_imp.component_end;
end;
/
