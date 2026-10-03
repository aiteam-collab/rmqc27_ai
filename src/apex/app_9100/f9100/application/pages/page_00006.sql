prompt --application/pages/page_00006
begin
--   Manifest
--     PAGE: 00006
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
 p_id=>6
,p_name=>'LOAD'
,p_alias=>'LOAD1'
,p_page_mode=>'MODAL'
,p_step_title=>'Capture Image'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//apex.util.getTopApex().jQuery(".ui-dialog-content").dialog("option", "title", "&P6_TITLE.");',
'',
'',
'//apex.util.getTopApex().jQuery(".ui-dialog-content").dialog("option", "title", "&P6_TITLE.");',
'  var blobData = result.download_image;  // Assuming ''download_image'' holds the Blob data',
'  var mimeType = result.DM_MIME_TYPE;',
'  var fileName = result.DM_FILE_NAME;',
'',
'  var blob = new Blob([blobData], { type: mimeType });',
'  var link = document.createElement(''a'');',
'  link.href = URL.createObjectURL(blob);',
'  link.download = fileName;',
'link.click();',
'',
'window.onbeforeunload = null;'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'img {',
'   // border-style: none;',
'    height: 200px;',
'    width: 100%;',
'    }',
'',
'',
'',
'',
'.t-Report-cell {',
'   border-style: none;',
'     //margin-right: 150px;',
'    margin-left: 1px;',
'    /* font-size: var(--ut-report-cell-font-size, 12px);',
'    line-height: var(--ut-report-cell-line-height, 10px);',
'    padding-top: var(--ut-report-cell-padding-y, 8px);',
'    padding-bottom: var(--ut-report-cell-padding-y, 8px);',
'    padding-left: var(--ut-report-cell-padding-x, 12px);',
'    padding-right: var(--ut-report-cell-padding-x, 12px); */',
'    border-hight: var(--ut-report-cell-border-width, 5px);',
'    border-width: var(--ut-report-cell-border-width, 10px);',
'  //  border-color: var(--ut-report-cell-border-color, var(--ut-component-inner-border-color));',
'   // background-color: var(--ut-report-cell-background-color, transparent);',
'}',
'',
'',
'#Clear{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   /*background-color: rgba(0, 0, 0, 0.15);*/',
'   background-size: 25px;',
'   width: 25px;',
'   height: 19px;',
'   top: -1px;',
' }',
'',
'',
'.hover-img > table > img{',
'    width: 200px;',
'    transition: transform 0.5s ease;',
' }',
'.hover-img:hover {',
'  transform: scale(1.5);',
'}',
'',
''))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'900'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6793483412597152305)
,p_name=>'EMP_IMG'
,p_static_id=>'emp-img'
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DECODE(NVL(dbms_lob.getlength(dm_blob),0),0,null,',
'        ''<center><img alt="''||apex_escape.html_attribute(dm_vou_no)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src = "''||apex_util.get_blob_file_src(''dm_blob'', ROWID)||''" height = "110" width = "110"/></center'
||'>'')',
'        CARD_TITLE,       ',
'        ROWID "recon_no",',
'         dbms_lob.getlength(dm_blob) image,',
'         dbms_lob.getlength(dm_blob) download_image,',
'         --<img src="dbms_lob.getlength(dm_blob)" width="500" height="600">,',
'        ''<center><img alt="''||apex_escape.html_attribute(dm_vou_no)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src = "''||apex_util.get_blob_file_src(''dm_blob'', ROWID)||''" height = "110" width = "110"/></center'
||'>'' CARD_TITLE1,',
'        rowid,',
'        DM_MIME_TYPE,',
'        DM_FILE_NAME',
'FROM doc_mgmt',
'WHERE dm_bu = :Global_bu',
'AND dm_vou_no =:P6_EMP_ID',
'AND dm_vou_type =''E_IMG''',
'    '))
,p_display_when_condition=>'P6_TYPE'
,p_display_when_cond2=>'IMG'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6793483498945152306)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6793483921885152310)
,p_query_column_id=>5
,p_column_alias=>'CARD_TITLE1'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6793484238260152313)
,p_query_column_id=>8
,p_column_alias=>'DM_FILE_NAME'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6793484133091152312)
,p_query_column_id=>7
,p_column_alias=>'DM_MIME_TYPE'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6793483823389152309)
,p_query_column_id=>4
,p_column_alias=>'DOWNLOAD_IMAGE'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6793483759704152308)
,p_query_column_id=>3
,p_column_alias=>'IMAGE'
,p_column_display_sequence=>30
,p_column_heading=>'Image'
,p_column_format=>'IMAGE:DOC_MGMT:DM_BLOB:ROWID::::::::'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6793484052574152311)
,p_query_column_id=>6
,p_column_alias=>'ROWID'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6793483584645152307)
,p_query_column_id=>2
,p_column_alias=>'recon_no'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6793483326340152304)
,p_plug_name=>'Image Upload'
,p_static_id=>'image-upload'
,p_region_template_options=>'#DEFAULT#:margin-top-none'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'DOC_MGMT'
,p_include_rowid_column=>true
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT * FROM doc_mgmt',
'WHERE dm_bu = :GLOBAL_BU',
'AND dm_vou_no =:P6_EMP_ID',
'AND dm_vou_type =''E_IMG'''))
,p_plug_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span style="color:tomato;">Note: *</span>&nbsp;Image should be in jpg/jpeg/png format.',
'',
''))
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13114619394445873763)
,p_plug_name=>'Image Upload'
,p_static_id=>'image-upload-2'
,p_region_template_options=>'#DEFAULT#:margin-top-none'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'DOC_MGMT'
,p_include_rowid_column=>true
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P6_TYPE'
,p_plug_display_when_cond2=>'IMG'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13117847903132159274)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13116572402537724181)
,p_plug_name=>'Sign Upload'
,p_static_id=>'sign-upload'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'DOC_MGMT'
,p_include_rowid_column=>true
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P6_TYPE = ''SIGN'' AND :P6_CNT = 0'
,p_plug_display_when_cond2=>'PLSQL'
,p_plug_footer=>'<b>Image should be in jpg/jpeg/png format.</b>'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(14628081985819122906)
,p_name=>'Signature'
,p_static_id=>'signature'
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Cards--featured force-fa-lg:t-Cards--spanHorizontally:t-Cards--hideBody:t-Cards--iconsSquare:t-Cards--animColorFill'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DECODE(NVL(dbms_lob.getlength(dm_blob),0),0,null,',
'        ''<img alt="''||apex_escape.html_attribute(dm_vou_no)||''"style="border: 0px; " ''||'' src = "''||apex_util.get_blob_file_src(''P6_DM_BLOB_SG'', ROWID)||''" height = "125" width = "125" />'')',
'        CARD_TITLE,',
'        ROWID',
'FROM doc_mgmt',
'WHERE dm_bu = :Global_bu',
'AND dm_vou_no =:P6_DM_VOU_NO_SG',
'AND dm_vou_type =''E_SIG'';',
''))
,p_display_when_condition=>':P6_ROWID_SG IS NOT NULL AND :P6_TYPE = ''SIGN'' AND :P6_CNT = 1'
,p_display_when_cond2=>'PLSQL'
,p_display_condition_type=>'EXPRESSION'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P6_DM_VOU_NO_SG'
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
 p_id=>wwv_flow_imp.id(7116904400541670285)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_column_format=>'PCT_GRAPH:::'
,p_column_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::P6_TYPE,P6_ROWID_SG,P6_CNT:SIGN,#ROWID#,0'
,p_column_linktext=>'#CARD_TITLE#'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7116904744478670287)
,p_query_column_id=>2
,p_column_alias=>'ROWID'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6793484358444152314)
,p_button_sequence=>470
,p_button_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_button_name=>'Camera'
,p_static_id=>'camera'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Camera'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:191:&SESSION.::&DEBUG.::P191_P_EMP_ID,P191_ROWID:&P6_DM_VOU_NO.,&P6_EMP_ROWID.'
,p_icon_css_classes=>'fa-camera'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116875834004670190)
,p_button_sequence=>460
,p_button_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_button_name=>'Clear'
,p_static_id=>'clear'
,p_button_static_id=>'Clear'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Clear'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P6_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116876193700670193)
,p_button_sequence=>430
,p_button_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_button_name=>'Insert'
,p_static_id=>'insert'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P6_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-upload'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116905941804670290)
,p_button_sequence=>440
,p_button_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_button_name=>'Insert_sign'
,p_static_id=>'insert-sign'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P6_ROWID_SG'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116876546924670193)
,p_button_sequence=>450
,p_button_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_button_name=>'Update'
,p_static_id=>'update'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P6_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-upload'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116905165698670287)
,p_button_sequence=>470
,p_button_plug_id=>wwv_flow_imp.id(14628081985819122906)
,p_button_name=>'Update_delete'
,p_static_id=>'update-delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P6_ROWID_SG'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116906414570670292)
,p_button_sequence=>460
,p_button_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_button_name=>'Update_sign'
,p_static_id=>'update-sign'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P6_ROWID_SG'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7116938205861670351)
,p_branch_name=>'Go To Page 81861111'
,p_branch_action=>'f?p=&APP_ID.:&P6_RETURN_PAGE_NO.:&SESSION.::&DEBUG.::P2111300151_ROWID,P21113001502_ROWID:&P6_EMP_ROWID.,&P6_EMP_ROWID.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13118021609894159686)
,p_name=>'P6_CNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(13117847903132159274)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116512234711667282)
,p_name=>'P6_DM_ATTACH_DIR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_ATTACH_DIR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117939143764159521)
,p_name=>'P6_DM_ATTACH_DIR_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_ATTACH_DIR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114626746816873824)
,p_name=>'P6_DM_ATTACH_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_ATTACH_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117938288225159513)
,p_name=>'P6_DM_ATTACH_ID_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_ATTACH_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116512838520667288)
,p_name=>'P6_DM_ATT_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_ATT_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117939675723159527)
,p_name=>'P6_DM_ATT_SEQ_NO_SG'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_ATT_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114625683105873813)
,p_name=>'P6_DM_BLOB'
,p_source_data_type=>'BLOB'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_prompt=>'&nbsp;'
,p_source=>'DM_BLOB'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_colspan=>12
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-none'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'display_as', 'DROPZONE_INLINE',
  'display_download_link', 'N',
  'filename_column', 'DM_DOC_NAME',
  'mime_type_column', 'DM_MIME_TYPE',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117937246427159502)
,p_name=>'P6_DM_BLOB_SG'
,p_source_data_type=>'BLOB'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_prompt=>'&nbsp;'
,p_source=>'DM_BLOB'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'display_as', 'DROPZONE_INLINE',
  'display_download_link', 'N',
  'filename_column', 'DM_DOC_NAME',
  'mime_type_column', 'DM_MIME_TYPE',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114626953705873826)
,p_name=>'P6_DM_BLOCK_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_BLOCK_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117938508616159515)
,p_name=>'P6_DM_BLOCK_NAME_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_BLOCK_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114624207736873798)
,p_name=>'P6_DM_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'DM_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114626907922873825)
,p_name=>'P6_DM_BUS_FUN_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_BUS_FUN_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117938373516159514)
,p_name=>'P6_DM_BUS_FUN_ID_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_BUS_FUN_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116664483876724437)
,p_name=>'P6_DM_BU_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'DM_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114625739098873814)
,p_name=>'P6_DM_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'DM_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117937283305159503)
,p_name=>'P6_DM_CRE_BY_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114626059371873817)
,p_name=>'P6_DM_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'DM_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117937586247159506)
,p_name=>'P6_DM_CRE_DATE_SG'
,p_source_data_type=>'DATE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114626552764873822)
,p_name=>'P6_DM_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117938091278159511)
,p_name=>'P6_DM_CRE_EMP_ID_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114625831898873815)
,p_name=>'P6_DM_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117937395608159504)
,p_name=>'P6_DM_CRE_IP_ADDR_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114625917469873816)
,p_name=>'P6_DM_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117937529235159505)
,p_name=>'P6_DM_CRE_OS_USER_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114625583379873812)
,p_name=>'P6_DM_DOC_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_DOC_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117937088211159501)
,p_name=>'P6_DM_DOC_NAME_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_DOC_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114624248948873799)
,p_name=>'P6_DM_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116664569520724438)
,p_name=>'P6_DM_DOC_NO_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114625497875873811)
,p_name=>'P6_DM_DOC_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_DOC_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117936989159159500)
,p_name=>'P6_DM_DOC_TYPE_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_DOC_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116511957798667279)
,p_name=>'P6_DM_FILE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_FILE_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117938844260159518)
,p_name=>'P6_DM_FILE_NAME_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_FILE_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114625362967873810)
,p_name=>'P6_DM_FILE_NARR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_FILE_NARR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116665731923724449)
,p_name=>'P6_DM_FILE_NARR_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_FILE_NARR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116512171624667281)
,p_name=>'P6_DM_LOC_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_default=>'D'
,p_source=>'DM_LOC_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117938969833159520)
,p_name=>'P6_DM_LOC_TYPE_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_default=>'D'
,p_source=>'DM_LOC_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116512796544667287)
,p_name=>'P6_DM_MAIL_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_default=>'N'
,p_source=>'DM_MAIL_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117939609671159526)
,p_name=>'P6_DM_MAIL_FLAG_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_default=>'N'
,p_source=>'DM_MAIL_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114627161567873828)
,p_name=>'P6_DM_MIME_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_MIME_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117938721476159517)
,p_name=>'P6_DM_MIME_TYPE_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_MIME_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116512385669667283)
,p_name=>'P6_DM_MODULE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_MODULE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117939178274159522)
,p_name=>'P6_DM_MODULE_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_MODULE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114625052913873807)
,p_name=>'P6_DM_PARTY_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_PARTY_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116665382167724446)
,p_name=>'P6_DM_PARTY_ID_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_PARTY_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116512111847667280)
,p_name=>'P6_DM_PARTY_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_PARTY_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117938940875159519)
,p_name=>'P6_DM_PARTY_NAME_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_PARTY_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114624949404873806)
,p_name=>'P6_DM_PARTY_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_default=>'S'
,p_source=>'DM_PARTY_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116665316597724445)
,p_name=>'P6_DM_PARTY_TYPE_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_default=>'S'
,p_source=>'DM_PARTY_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114625147783873808)
,p_name=>'P6_DM_PROD_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_PROD_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116665512961724447)
,p_name=>'P6_DM_PROD_ID_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_PROD_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114625262557873809)
,p_name=>'P6_DM_PROD_REV'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_PROD_REV'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116665648482724448)
,p_name=>'P6_DM_PROD_REV_SG'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_PROD_REV'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114627033020873827)
,p_name=>'P6_DM_TABLE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_TABLE_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117938581127159516)
,p_name=>'P6_DM_TABLE_NAME_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_TABLE_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114626129396873818)
,p_name=>'P6_DM_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117937695712159507)
,p_name=>'P6_DM_UPD_BY_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114626483112873821)
,p_name=>'P6_DM_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117938017234159510)
,p_name=>'P6_DM_UPD_DATE_SG'
,p_source_data_type=>'DATE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114626626000873823)
,p_name=>'P6_DM_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117938194160159512)
,p_name=>'P6_DM_UPD_EMP_ID_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114626261408873819)
,p_name=>'P6_DM_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117937851724159508)
,p_name=>'P6_DM_UPD_IP_ADDR_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114626355582873820)
,p_name=>'P6_DM_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117937955697159509)
,p_name=>'P6_DM_UPD_OS_USER_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114624408695873800)
,p_name=>'P6_DM_VOU_LEVEL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_default=>'O'
,p_source=>'DM_VOU_LEVEL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116664733361724439)
,p_name=>'P6_DM_VOU_LEVEL_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_default=>'O'
,p_source=>'DM_VOU_LEVEL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114624812619873804)
,p_name=>'P6_DM_VOU_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_VOU_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116665080300724443)
,p_name=>'P6_DM_VOU_NO_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_VOU_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114624701510873803)
,p_name=>'P6_DM_VOU_PFX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_VOU_PFX'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116665055615724442)
,p_name=>'P6_DM_VOU_PFX_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_VOU_PFX'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114624553236873802)
,p_name=>'P6_DM_VOU_PLNT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_VOU_PLNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116664879526724441)
,p_name=>'P6_DM_VOU_PLNT_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_VOU_PLNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116512437019667284)
,p_name=>'P6_DM_VOU_SEQ2_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_VOU_SEQ2_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117939269464159523)
,p_name=>'P6_DM_VOU_SEQ2_NO_SG'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_VOU_SEQ2_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116512572558667285)
,p_name=>'P6_DM_VOU_SEQ3_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_VOU_SEQ3_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117939419901159524)
,p_name=>'P6_DM_VOU_SEQ3_NO_SG'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_VOU_SEQ3_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116512625084667286)
,p_name=>'P6_DM_VOU_SEQ4_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'DM_VOU_SEQ4_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117939498122159525)
,p_name=>'P6_DM_VOU_SEQ4_NO_SG'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_VOU_SEQ4_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114624831434873805)
,p_name=>'P6_DM_VOU_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_default=>'1'
,p_source=>'DM_VOU_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116665233388724444)
,p_name=>'P6_DM_VOU_SEQ_NO_SG'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'DM_VOU_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13114624470996873801)
,p_name=>'P6_DM_VOU_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_default=>'E_IMG'
,p_source=>'DM_VOU_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116664820185724440)
,p_name=>'P6_DM_VOU_TYPE_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_default=>'E_SIG'
,p_source=>'DM_VOU_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116632444714724350)
,p_name=>'P6_EMP_ROWID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(13117847903132159274)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11793576085865496715)
,p_name=>'P6_RETURN_PAGE_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(13117847903132159274)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116512947935667289)
,p_name=>'P6_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_item_source_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13117940001746159530)
,p_name=>'P6_ROWID_SG'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_item_source_plug_id=>wwv_flow_imp.id(13116572402537724181)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13116576312284724207)
,p_name=>'P6_TITLE'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(13114619394445873763)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13118020323328159673)
,p_name=>'P6_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(13117847903132159274)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7503691857185185554)
,p_name=>'P6_VOU_NO_SG'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(13117847903132159274)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116935374909670348)
,p_validation_name=>'P6_DM_BLOB'
,p_static_id=>'p6-dm-blob'
,p_validation_sequence=>10
,p_validation=>'P6_DM_BLOB'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Image file should not be null.'
,p_when_button_pressed=>wwv_flow_imp.id(7116876193700670193)
,p_associated_item=>wwv_flow_imp.id(13114625683105873813)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116936159922670348)
,p_validation_name=>'P6_DM_BLOB_1'
,p_static_id=>'p6-dm-blob-2'
,p_validation_sequence=>20
,p_validation=>'P6_DM_BLOB'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Image file should not be null.'
,p_when_button_pressed=>wwv_flow_imp.id(7116876546924670193)
,p_associated_item=>wwv_flow_imp.id(13114625683105873813)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116935769247670348)
,p_validation_name=>'P6_DM_BLOB_SG'
,p_static_id=>'p6-dm-blob-sg'
,p_validation_sequence=>30
,p_validation=>'P6_DM_BLOB_SG'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Signature file should not be null.'
,p_when_button_pressed=>wwv_flow_imp.id(7116905941804670290)
,p_associated_item=>wwv_flow_imp.id(13117937246427159502)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116936537480670348)
,p_validation_name=>'P6_DM_BLOB_SG_1'
,p_static_id=>'p6-dm-blob-sg-2'
,p_validation_sequence=>40
,p_validation=>'P6_DM_BLOB_SG'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Signature file should not be null.'
,p_when_button_pressed=>wwv_flow_imp.id(7116906414570670292)
,p_associated_item=>wwv_flow_imp.id(13117937246427159502)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116932057387670338)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(13116572402537724181)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form LOAD'
,p_static_id=>'initialize-form-load'
,p_internal_uid=>1634970221844059310
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116902589313670281)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(13114619394445873763)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form SIGN'
,p_static_id=>'initialize-form-sign'
,p_internal_uid=>1634940753770059253
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116902904568670282)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(13114619394445873763)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Profile Image'
,p_static_id=>'profile-image'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7116876193700670193)
,p_process_success_message=>'Uploaded Successfully.'
,p_internal_uid=>1634941069025059254
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116903292539670282)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(13114619394445873763)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Profile Image_1'
,p_static_id=>'profile-image-2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7116876546924670193)
,p_process_success_message=>'Uploaded Successfully.'
,p_internal_uid=>1634941456996059254
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116903703701670284)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(13114619394445873763)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Profile Image_delete'
,p_static_id=>'profile-image-delete'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7116875834004670190)
,p_internal_uid=>1634941868158059256
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116936924586670349)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Profile_pic_upload'
,p_static_id=>'profile-pic-upload'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P6_ROWID IS NULL THEN ',
'   ',
'   SELECT NVL(MAX(DM_DOC_NO),1000000000) + 1',
'     INTO :P6_DM_DOC_NO',
'     FROM DOC_MGMT',
'    WHERE DM_BU = :GLOBAL_BU;',
'',
'   :P6_DM_CRE_BY      := :GLOBAL_USER;',
'   :P6_DM_CRE_EMP_ID  := :GLOBAL_EMP_ID;',
'   :P6_DM_CRE_DATE    := SYSDATE;',
'   :P6_DM_CRE_IP_ADDR := :GLOBAL_IP;',
'',
'ELSE    ',
'   ',
'   :P6_DM_UPD_BY      := :GLOBAL_USER;',
'   :P6_DM_UPD_DATE    := SYSDATE;',
'   :P6_DM_UPD_EMP_ID  := :GLOBAL_EMP_ID;',
'   :P6_DM_UPD_IP_ADDR := :GLOBAL_IP;',
'',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Insert,Upload'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>1634975089043059321
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116937315797670349)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Profile_sign_upload'
,p_static_id=>'profile-sign-upload'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P6_ROWID_SG IS NULL THEN ',
'   ',
'   SELECT NVL(MAX(DM_DOC_NO),1000000000) + 1',
'     INTO :P6_DM_DOC_NO_SG',
'     FROM DOC_MGMT',
'    WHERE DM_BU = :GLOBAL_BU;',
'',
'   :P6_DM_CRE_BY_SG      := :GLOBAL_USER;',
'   :P6_DM_CRE_EMP_ID_SG  := :GLOBAL_EMP_ID;',
'   :P6_DM_CRE_DATE_SG    := SYSDATE;',
'   :P6_DM_CRE_IP_ADDR_SG := :GLOBAL_IP;',
'',
'ELSE    ',
'   ',
'   :P6_DM_UPD_BY_SG      := :GLOBAL_USER;',
'   :P6_DM_UPD_DATE_SG    := SYSDATE;',
'   :P6_DM_UPD_EMP_ID_SG  := :GLOBAL_EMP_ID;',
'   :P6_DM_UPD_IP_ADDR_SG := :GLOBAL_IP;',
'',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Insert_sign,Update_sign'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Uploaded Successfully.'
,p_internal_uid=>1634975480254059321
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116937646963670349)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Sign Delete'
,p_static_id=>'sign-delete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE ',
'  FROM doc_mgmt',
' WHERE dm_bu = :Global_bu',
'   AND dm_vou_no =:P6_VOU_NO_SG',
'   AND dm_vou_type =''E_SIG'';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7116905165698670287)
,p_internal_uid=>1634975811420059321
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116932491817670338)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(13116572402537724181)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Sign Upload'
,p_static_id=>'sign-upload'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7116905941804670290)
,p_internal_uid=>1634970656274059310
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116932876294670342)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(13116572402537724181)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Sign Upload_1'
,p_static_id=>'sign-upload-2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7116906414570670292)
,p_internal_uid=>1634971040751059314
);
wwv_flow_imp.component_end;
end;
/
