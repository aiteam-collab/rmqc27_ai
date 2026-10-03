prompt --application/pages/page_00801
begin
--   Manifest
--     PAGE: 00801
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
 p_id=>801
,p_name=>'View Attachment'
,p_alias=>'VIEW-ATTACHMENT1'
,p_page_mode=>'MODAL'
,p_step_title=>'View Attachment'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(function () {',
'    var fileUrl = $v(''P91_LINK'');          // Dynamic file URL',
'    var fileExt = $v(''P91_FILE_EXT'').toUpperCase();  // Dynamic file type',
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
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'700'
,p_dialog_width=>'1500'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7209524413999358326)
,p_plug_name=>'View'
,p_static_id=>'view'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<div id="view_pdf"></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7209524523823358327)
,p_plug_name=>'View Attachment'
,p_static_id=>'view-attachment'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p align="center">',
'    <embed src="&P801_LINK.#toolbar=0" height="1000"  width="100%">',
'</p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7209525273305358363)
,p_name=>'P801_DM_DOC_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7209524413999358326)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6922339204441082045)
,p_name=>'P801_DM_DOC_NO_VIEW'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7209524413999358326)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7209525224580358362)
,p_name=>'P801_LINK'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7209524413999358326)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''f?p=&APP_ID.:0:&SESSION.:APPLICATION_PROCESS=VIEW_ATTACHMENT:NO'' att',
'  FROM DUAL'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6923555768801941995)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process For Audit'
,p_static_id=>'process-for-audit'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'cursor c1',
'    is',
' SELECT *',
'  FROM DOC_MGMT_ATTACH_VW',
' WHERE DM_BU = :global_bu',
'   AND DM_DOC_NO = :P801_DM_DOC_NO_VIEW;',
'',
'cr1              c1%rowtype;',
'',
'begin',
'',
'',
' OPEN c1;',
'   FETCH c1 INTO cr1;',
'',
'      IF c1%FOUND THEN',
'    ',
'        insert into DOC_MGMT_AUDIT (DMA_BU,',
'                                    DMA_DOC_NO,',
'                                    DMA_DOC_REV,',
'                                    DMA_REQ_DOC_NO,',
'                                    DMA_ACTIVITY_TYPE,',
'                                    DMA_USER_NAME,',
'                                    DMA_CRE_BY,',
'                                    DMA_CRE_DATE,',
'                                    DMA_CRE_EMP_ID,',
'                                    DMA_VOU_PFX,',
'                                    DMA_VOU_NO,',
'                                    DMA_VOU_SEQ_NO,',
'                                    DMA_TYPE_DESC,',
'                                    DMA_SUB_VOU_TYPE,',
'                                    DMA_DOC_DATE,',
'                                    DMA_DOC_NAME,',
'                                    DMA_BLOB,',
'                                    DMA_MIME_TYPE,',
'                                    DMA_FILE_NAME,',
'                                    DMA_FILE_NARR,',
'                                    DMA_ATTACH_DIR,',
'                                    DMA_RET_DATE,',
'                                    DMA_RET_END_DATE,',
'                                    DMA_DUE_DATE,',
'                                    DMA_TAGS,',
'                                    DMA_EMP_ID,',
'                                    DMA_LOC_ID,',
'                                    DMA_PARTY_ID,',
'                                    DMA_PROD_ID,',
'                                    DMA_PROD_REV,',
'                                    DMA_ENTITY,',
'                                    DMA_PLNT_ID,',
'                                    DMA_NOTES,',
'                                    DMA_CPC_ID)',
'                             values(:global_bu,',
'                                    :P801_DM_DOC_NO,                                    ',
'                                     cr1.DM_DOC_REV,',
'                                     cr1.DM_REQ_DOC_NO ,',
'                                    ''V'',',
'                                    :global_user,',
'                                    :global_user,',
'                                    SYSDATE,',
'                                    :global_emp_id,',
'                                    cr1.DM_VOU_PFX,',
'                                    cr1.DM_VOU_NO,',
'                                    cr1.DM_VOU_SEQ_NO,',
'                                    cr1.DM_TYPE_DESC,',
'                                    cr1.DM_SUB_VOU_TYPE,',
'                                    cr1.DM_CRE_DATE,',
'                                    cr1.DM_DOC_NAME,',
'                                    cr1.DM_BLOB,',
'                                    cr1.DM_MIME_TYPE,',
'                                    cr1.DM_FILE_NAME,',
'                                    cr1.DM_FILE_NARR,',
'                                    cr1.DM_ATTACH_DIR,',
'                                    cr1.DM_RET_DATE,',
'                                    cr1.DM_RET_END_DATE,',
'                                    cr1.DM_DUE_DATE,',
'                                    cr1.DM_TAGS,',
'                                    cr1.DM_EMP_ID,',
'                                    cr1.DM_LOC_ID,',
'                                    cr1.DM_PARTY_ID,',
'                                    cr1.DM_PROD_ID,',
'                                    cr1.DM_PROD_REV,',
'                                    cr1.DM_ENTITY,',
'                                    cr1.DM_VOU_PLNT,',
'                                    cr1.DM_NOTES,',
'                                    cr1.DM_CPC_ID);   ',
'    commit;                                    ',
'',
' END IF;',
' ',
'close c1;',
'',
'',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1444034785017021793
);
wwv_flow_imp.component_end;
end;
/
