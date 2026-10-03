prompt --application/pages/page_00204
begin
--   Manifest
--     PAGE: 00204
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
 p_id=>204
,p_name=>'Mail Html Contend'
,p_alias=>'MAIL-HTML-CONTEND'
,p_page_mode=>'MODAL'
,p_step_title=>'Mail Html Contend'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'25'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6757573582180331099)
,p_plug_name=>'html body'
,p_static_id=>'html-body'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'  mr_html clob;',
'begin',
'  SELECT MR_HTML_BODY',
'  INTO mr_html',
'  FROM WFM_MAIL_REPORT ',
'  WHERE MR_SEQ_NO = :P204_NEW_1;',
'',
'  RETURN mr_html;',
'',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN',
'    RETURN NULL;',
'end;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6757573018714331093)
,p_name=>'P204_NEW'
,p_data_type=>'CLOB'
,p_item_sequence=>60
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6757573581773331098)
,p_name=>'P204_NEW_1'
,p_item_sequence=>50
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6757573331194331096)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    SELECT',
'        mr_html_body',
'    INTO :p204_new',
'    FROM',
'        wfm_mail_report',
'    WHERE',
'        mr_seq_no = :P204_NEW_1;',
'',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>3120464649390094412
);
wwv_flow_imp.component_end;
end;
/
