prompt --application/pages/page_00026
begin
--   Manifest
--     PAGE: 00026
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
 p_id=>26
,p_name=>'Mail Read'
,p_alias=>'MAIL-READ'
,p_page_mode=>'MODAL'
,p_step_title=>'Mail Read'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Cards--cols .t-Cards-item {',
'    width: 100%;',
'}',
'',
'.t-BadgeList--dash .t-BadgeList-label {',
'    font-size: 1.4rem;',
'    line-height: 2rem;',
'    font-weight: bolder;',
'}',
'',
'.t-Region--accent8 > .t-Region-header {',
'    /* background-color: #79CBCA; */',
'    color: #fdfdfd;',
'    background: linear-gradient(to right, #2948ff, #396afc);',
'    --background: linear-gradient(to right, #1D2671, #C33764);',
'}',
'',
'/*',
'body {',
'    --background: url(#APP_IMAGES#balloon1.jpg) no-repeat 50% 50%;',
'    background-color:#f7c6b424;',
'    color: #242424;',
'    font-weight: bolder;',
'}*/',
'',
'.t-Cards--basic .t-Card-title {',
'    font-size: 1.9rem;',
'    line-height: 3rem;',
'    margin: 0;',
'    font-weight: 500;',
'    overflow: hidden;',
'    text-overflow: ellipsis;',
'}',
'',
'.t-Card-title {',
'    color: #c73b08;',
'}',
'',
'.t-Region-headerItems--title {',
'    flex-grow: 1;',
'    flex-shrink: 0;',
'    flex-basis: auto;',
'    text-align: left;',
'    padding: 0.8rem;',
'    display: flex;',
'    align-items: center;',
'}',
'',
'element.style {',
'    font-size: 9px;',
'    font-family: verdana;',
'    color: #ffffff;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'Y'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6319970563183188965)
,p_name=>'Compose Mail'
,p_static_id=>'compose-mail'
,p_parent_plug_id=>wwv_flow_imp.id(11856319451522554029)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow:t-Form--stretchInputs:t-Form--leftLabels:margin-left-md'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--basic:t-Cards--displayIcons:t-Cards--spanHorizontally:t-Cards--animColorFill'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 12/27/2021 3:16:57 PM (QP5 v5.163.1008.3004) */',
'SELECT ''fa-envelope-x'' card_icon,',
'          ''<font color=#14a800;>''',
'       || ''Subject:''',
'       || ''</font>''',
'       || '' ''',
'       || subject',
'       || ''<br>''',
'          card_title,',
'          ''<font color="darkmagenta">''',
'       || '' <b> From  :</b>''',
'       || ''</font>''',
'       || '' ''',
'       || from1       ',
'       ||''<br>''',
'       || ''<font color="darkmagenta">''',
'       || '' <b> To  :</b>''',
'       || ''</font>''',
'       || '' ''',
'       || to1',
'       || ''<br>''',
'       || ''<font color="black";>''',
'       || '' <b> CC :</b>''',
'       || ''</font>''',
'       || '' ''',
'       || cc',
'       || ''<br>''',
'       || ''<font color="royalblue";>''',
'       || ''  <b> Body : </b>''',
'       || ''</font>''',
'       || '' ''',
'       || body',
'          card_text,',
'       --card_text,',
'       /*   CASE WHEN FY_YEAR = :Global_year THEN',
'         ''<a href="''|| apex_util.prepare_url(''f?p=&APP_ID.:16151904911901:&SESSION.::&DEBUG.::''',
'         || ''P16151904911901_ROWID:''',
'         || ROWID)',
'         || ''"> <B><SPAN STYLE="font-size:10px; font-family:verdana; color:  #28a745;class=fa fa-edit; "> Edit UPI''||''</SPAN></B></a>''',
'         ||''|''||',
'         ''<a href="''|| apex_util.prepare_url(''f?p=&APP_ID.:161519049119:&SESSION.::&DEBUG.::''',
'         || ''P161519049119_YEAR:''',
'         || FY_YEAR)',
'         || ''"> <B><SPAN STYLE="font-size:10px; font-family:verdana; color:  Orange;class=fa fa-edit; "> View Shop Details''||''</SPAN></B></a>''',
'         ELSE NULL',
'         END */',
'       NULL',
'          "CARD_SUBTEXT",',
'       ''color'' card_color',
'  FROM (  SELECT eoh_doc_date doc_date,',
'                 eoh_unit unit,',
'                 func_find_plnt_desc (NVL (eoh_bu, :global_bu), eoh_unit, 1)',
'                    unit1,',
'                 eoh_vou_pfx || ''-'' || eoh_vou_no doc_no,',
'                 eoh_sndr_email from1,',
'                 eorl_rcvr_email to1,',
'                 eorl_cc_email cc,',
'                 DECODE (eorl_rcvr_type,',
'                         ''S'', ''Supplier'',',
'                         ''C'', ''Customer'',',
'                         ''E'', ''Employee'')',
'                    receiver_type,',
'                 eoh_subj subject,',
'                 eoh_body body,',
'                 eorl_status unsend_reason,',
'                 func_find_bu_desc (:global_bu, 1) business_unit,',
'                 func_find_wf_type_desc (:global_bu, eoh_wf_type, 1)',
'                    document_type',
'            FROM email_outbox_vw',
'           WHERE eoh_bu = :global_bu',
'           and EOH_DOC_NO = :P26_DOC_NO',
'                 AND (eorl_status IS NULL OR eorl_status NOT LIKE (''Message %''))',
'        ORDER BY eoh_doc_date DESC, eoh_doc_no DESC)'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6319971054315188970)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6319970724374188966)
,p_query_column_id=>1
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>10
,p_column_heading=>'Card Icon'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6319971022151188969)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Subtext'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6319970838271188968)
,p_query_column_id=>3
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>30
,p_column_heading=>'Card Text'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6319970776842188967)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Title'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11856319451522554029)
,p_plug_name=>'Sent'
,p_static_id=>'sent'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--accent8:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6320743228272072742)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6319970563183188965)
,p_button_name=>'BTN_ARCHIVE'
,p_static_id=>'btn-archive'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Attachment'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-paperclip'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6320742783870072736)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6319970563183188965)
,p_button_name=>'BTN_BACK'
,p_static_id=>'btn-back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--warning'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Back'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6320743616993072743)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11856319451522554029)
,p_button_name=>'BTN_DELETE'
,p_static_id=>'btn-delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Delete'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-trash'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6319971320624188972)
,p_name=>'P26_DOC_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11856319451522554029)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320743974985072745)
,p_name=>'P26_MSG_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11856319451522554029)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6320744340371072750)
,p_name=>'P26_MSG_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11856319451522554029)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6320745036053072756)
,p_name=>'Page Update'
,p_static_id=>'page-update'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6320745563570072757)
,p_event_id=>wwv_flow_imp.id(6320745036053072756)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P26_MSG_TYPE = ''I'' THEN',
    '',
    '   UPDATE int_msg_receivers',
    '      SET imsrcvr_read_flag = ''Y''',
    '    WHERE imsrcvr_bu        = :GLOBAL_BU',
    '      AND imsrcvr_rcvr_id   = :GLOBAL_USER',
    '      AND imsrcvr_msg_id    = :P26_MSG_ID',
    '      AND imsrcvr_read_flag = ''N'';',
    '    ',
    '   COMMIT;',
    '',
    'END IF;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6319971440018188974)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Doc. No.'
,p_static_id=>'doc-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct eoh_doc_no into :P26_DOC_NO',
'from email_outbox_vw',
'where eoh_bu  = :global_bu;',
''))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>838009604474577946
);
wwv_flow_imp.component_end;
end;
/
