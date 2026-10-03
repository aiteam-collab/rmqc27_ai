prompt --application/pages/page_00192
begin
--   Manifest
--     PAGE: 00192
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
 p_id=>192
,p_name=>'LOAD'
,p_alias=>'LOAD2'
,p_page_mode=>'MODAL'
,p_step_title=>'LOAD'
,p_allow_duplicate_submissions=>'N'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_imp.id(9502541045092720517)
,p_name=>'EMP_IMG'
,p_static_id=>'emp-img'
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>50
,p_region_css_classes=>'hover-img'
,p_region_template_options=>'#DEFAULT#:t-Form--large:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_grid_column_span=>4
,p_display_column=>5
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
'AND dm_vou_no =:P192_EMP_ID',
'AND dm_vou_type =''E_IMG''',
'    '))
,p_display_when_condition=>'P192_TYPE'
,p_display_when_cond2=>'IMG'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P192_DM_VOU_NO'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6796857013228137925)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6796858604084137928)
,p_query_column_id=>5
,p_column_alias=>'CARD_TITLE1'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6796859846770137928)
,p_query_column_id=>8
,p_column_alias=>'DM_FILE_NAME'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6796859454493137928)
,p_query_column_id=>7
,p_column_alias=>'DM_MIME_TYPE'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6796858236634137927)
,p_query_column_id=>4
,p_column_alias=>'DOWNLOAD_IMAGE'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6796857877881137927)
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
 p_id=>wwv_flow_imp.id(6796859027030137928)
,p_query_column_id=>6
,p_column_alias=>'ROWID'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6796857392821137927)
,p_query_column_id=>2
,p_column_alias=>'recon_no'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(10819207556724571637)
,p_name=>'EMP_IMG'
,p_static_id=>'emp-img-2'
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>80
,p_region_css_classes=>'hover-img'
,p_region_template_options=>'#DEFAULT#:t-Form--large:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_grid_column_span=>4
,p_display_column=>5
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
'AND dm_vou_no =:P192_EMP_ID',
'AND dm_vou_type =''E_IMG''',
'    '))
,p_display_when_condition=>'P192_TYPE'
,p_display_when_cond2=>'IMG'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P192_DM_VOU_NO'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6796922211427137986)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6796923862228137987)
,p_query_column_id=>5
,p_column_alias=>'CARD_TITLE1'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6796925022264137987)
,p_query_column_id=>8
,p_column_alias=>'DM_FILE_NAME'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6796924678200137987)
,p_query_column_id=>7
,p_column_alias=>'DM_MIME_TYPE'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6796923391014137987)
,p_query_column_id=>4
,p_column_alias=>'DOWNLOAD_IMAGE'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6796922985549137987)
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
 p_id=>wwv_flow_imp.id(6796924211035137987)
,p_query_column_id=>6
,p_column_alias=>'ROWID'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6796922621636137986)
,p_query_column_id=>2
,p_column_alias=>'recon_no'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8110818716455369993)
,p_plug_name=>'Image Upload'
,p_static_id=>'image-upload'
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
,p_plug_display_condition_type=>'NOT_EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT * FROM doc_mgmt',
'WHERE dm_bu = :GLOBAL_BU',
'AND dm_vou_no =:P192_EMP_ID',
'AND dm_vou_type =''E_IMG'''))
,p_plug_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span style="color:tomato;">Note: *</span>&nbsp;Image should be in jpg/jpeg/png format.',
'',
'',
'',
''))
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12797451462234066346)
,p_plug_name=>'Image Upload'
,p_static_id=>'image-upload-2'
,p_region_template_options=>'#DEFAULT#:margin-top-none'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'DOC_MGMT'
,p_include_rowid_column=>true
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P192_TYPE'
,p_plug_display_when_cond2=>'IMG'
,p_plug_footer=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!-- <b><span style="color:tomato;">Note: *</span>&nbsp;Image should be in jpg/jpeg/png format.</b>',
'',
'',
'',
' -->'))
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12800679970920351857)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12799404470325916764)
,p_plug_name=>'Sign Upload'
,p_static_id=>'sign-upload'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'DOC_MGMT'
,p_include_rowid_column=>true
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P192_TYPE = ''SIGN'' AND :P192_CNT = 0'
,p_plug_display_when_cond2=>'PLSQL'
,p_plug_footer=>'<b>Image should be in jpg/jpeg/png format.</b>'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(14310914053607315489)
,p_name=>'Signature'
,p_static_id=>'signature'
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Cards--featured force-fa-lg:t-Cards--spanHorizontally:t-Cards--hideBody:t-Cards--iconsSquare:t-Cards--animColorFill'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DECODE(NVL(dbms_lob.getlength(dm_blob),0),0,NULL,',
'        ''<img alt="''||apex_escape.html_attribute(dm_vou_no)||''"style="border: 0px; " ''||'' src = "''||apex_util.get_blob_file_src(''P192_DM_BLOB_SG'', ROWID)||''" height = "125" width = "125" />'')',
'        CARD_TITLE,',
'        ROWID',
'FROM doc_mgmt',
'WHERE dm_bu = :Global_bu',
'AND dm_vou_no =:P192_DM_VOU_NO_SG',
'AND dm_vou_type =''E_SIG'';',
''))
,p_display_when_condition=>':P192_ROWID_SG IS NOT NULL AND :P192_TYPE = ''SIGN'' AND :P192_CNT = 1'
,p_display_when_cond2=>'PLSQL'
,p_display_condition_type=>'EXPRESSION'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P192_DM_VOU_NO_SG'
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
 p_id=>wwv_flow_imp.id(6796860594206137934)
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
 p_id=>wwv_flow_imp.id(6796861058542137934)
,p_query_column_id=>2
,p_column_alias=>'ROWID'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6796893169119137966)
,p_button_sequence=>460
,p_button_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_button_name=>'Camera'
,p_static_id=>'camera'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Camera'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:88:&SESSION.::&DEBUG.:88:P88_P_EMP_ID,P88_ROWID:&P192_DM_VOU_NO.,&P192_EMP_ROWID.'
,p_icon_css_classes=>'fa-camera'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6796893564354137966)
,p_button_sequence=>450
,p_button_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_button_name=>'Clear'
,p_static_id=>'clear'
,p_button_static_id=>'Clear'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P192_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6796891919603137964)
,p_button_sequence=>470
,p_button_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_button_name=>'Download'
,p_static_id=>'download'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT * FROM doc_mgmt',
'WHERE dm_bu = :GLOBAL_BU',
'AND dm_vou_no =:P192_EMP_ID',
'AND dm_vou_type =''E_IMG'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6796892703973137964)
,p_button_sequence=>430
,p_button_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_button_name=>'Insert'
,p_static_id=>'insert'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P192_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-upload'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6796864432917137942)
,p_button_sequence=>440
,p_button_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_button_name=>'Insert_sign'
,p_static_id=>'insert-sign'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P192_ROWID_SG'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6796893921696137966)
,p_button_sequence=>440
,p_button_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_button_name=>'Update'
,p_static_id=>'update'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P192_ROWID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-upload'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6796861450223137934)
,p_button_sequence=>470
,p_button_plug_id=>wwv_flow_imp.id(14310914053607315489)
,p_button_name=>'Update_delete'
,p_static_id=>'update-delete'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P192_ROWID_SG'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6796864825460137942)
,p_button_sequence=>460
,p_button_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_button_name=>'Update_sign'
,p_static_id=>'update-sign'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P192_ROWID_SG'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6796892349009137964)
,p_button_sequence=>480
,p_button_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_button_name=>'View_Image'
,p_static_id=>'view-image'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'View Image'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:87:&SESSION.::&DEBUG.::P87_EMP_ID,P87_ROWID:&P192_EMP_ID.,&P192_ROWID.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT * FROM doc_mgmt',
'WHERE dm_bu = :GLOBAL_BU',
'AND dm_vou_no =:P192_EMP_ID',
'AND dm_vou_type =''E_IMG'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-eye'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6796935882507138016)
,p_branch_name=>'Go To Page 81861111'
,p_branch_action=>'f?p=&APP_ID.:&P192_RETURN_PAGE_NO.:&SESSION.::&DEBUG.::P8186111101_EMP_ROWID_3,P2111300151_ROWID,P21113001502_ROWID:&P192_EMP_ROWID.,&P192_EMP_ROWID.,&P192_EMP_ROWID.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800801069872352158)
,p_name=>'P192_CNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12800679970920351857)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799380344390859931)
,p_name=>'P192_DM_ATTACH_DIR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_ATTACH_DIR'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800748367542352049)
,p_name=>'P192_DM_ATTACH_DIR_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_ATTACH_DIR'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797494856496066473)
,p_name=>'P192_DM_ATTACH_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_ATTACH_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800747512003352041)
,p_name=>'P192_DM_ATTACH_ID_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_ATTACH_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799380948199859937)
,p_name=>'P192_DM_ATT_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_ATT_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800748899501352055)
,p_name=>'P192_DM_ATT_SEQ_NO_SG'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_ATT_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797493792785066462)
,p_name=>'P192_DM_BLOB'
,p_source_data_type=>'BLOB'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_prompt=>'&nbsp;'
,p_source=>'DM_BLOB'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_colspan=>12
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT * FROM doc_mgmt',
'WHERE dm_bu = :GLOBAL_BU',
'AND dm_vou_no =:P192_EMP_ID',
'AND dm_vou_type =''E_IMG'''))
,p_display_when_type=>'NOT_EXISTS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-none'
,p_warn_on_unsaved_changes=>'I'
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
 p_id=>wwv_flow_imp.id(12800746470205352030)
,p_name=>'P192_DM_BLOB_SG'
,p_source_data_type=>'BLOB'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_prompt=>'&nbsp;'
,p_source=>'DM_BLOB'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
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
 p_id=>wwv_flow_imp.id(12797495063385066475)
,p_name=>'P192_DM_BLOCK_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_BLOCK_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800747732394352043)
,p_name=>'P192_DM_BLOCK_NAME_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_BLOCK_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797492317416066447)
,p_name=>'P192_DM_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'DM_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797495017602066474)
,p_name=>'P192_DM_BUS_FUN_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_BUS_FUN_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800747597294352042)
,p_name=>'P192_DM_BUS_FUN_ID_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_BUS_FUN_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799473707654916965)
,p_name=>'P192_DM_BU_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'DM_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797493848778066463)
,p_name=>'P192_DM_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'DM_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800746507083352031)
,p_name=>'P192_DM_CRE_BY_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797494169051066466)
,p_name=>'P192_DM_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'DM_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800746810025352034)
,p_name=>'P192_DM_CRE_DATE_SG'
,p_source_data_type=>'DATE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797494662444066471)
,p_name=>'P192_DM_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800747315056352039)
,p_name=>'P192_DM_CRE_EMP_ID_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797493941578066464)
,p_name=>'P192_DM_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800746619386352032)
,p_name=>'P192_DM_CRE_IP_ADDR_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797494027149066465)
,p_name=>'P192_DM_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800746753013352033)
,p_name=>'P192_DM_CRE_OS_USER_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797493693059066461)
,p_name=>'P192_DM_DOC_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_DOC_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800746311989352029)
,p_name=>'P192_DM_DOC_NAME_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_DOC_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797492358628066448)
,p_name=>'P192_DM_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799473793298916966)
,p_name=>'P192_DM_DOC_NO_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797493607555066460)
,p_name=>'P192_DM_DOC_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_DOC_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800746212937352028)
,p_name=>'P192_DM_DOC_TYPE_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_DOC_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799380067477859928)
,p_name=>'P192_DM_FILE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_FILE_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800748068038352046)
,p_name=>'P192_DM_FILE_NAME_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_FILE_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797493472647066459)
,p_name=>'P192_DM_FILE_NARR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_FILE_NARR'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799474955701916977)
,p_name=>'P192_DM_FILE_NARR_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_FILE_NARR'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799380281303859930)
,p_name=>'P192_DM_LOC_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_default=>'D'
,p_source=>'DM_LOC_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800748193611352048)
,p_name=>'P192_DM_LOC_TYPE_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_default=>'D'
,p_source=>'DM_LOC_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799380906223859936)
,p_name=>'P192_DM_MAIL_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_default=>'N'
,p_source=>'DM_MAIL_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800748833449352054)
,p_name=>'P192_DM_MAIL_FLAG_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_default=>'N'
,p_source=>'DM_MAIL_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797495271247066477)
,p_name=>'P192_DM_MIME_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_MIME_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800747945254352045)
,p_name=>'P192_DM_MIME_TYPE_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_MIME_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799380495348859932)
,p_name=>'P192_DM_MODULE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_MODULE'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800748402052352050)
,p_name=>'P192_DM_MODULE_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_MODULE'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797493162593066456)
,p_name=>'P192_DM_PARTY_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_PARTY_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799474605945916974)
,p_name=>'P192_DM_PARTY_ID_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_PARTY_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799380221526859929)
,p_name=>'P192_DM_PARTY_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_PARTY_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800748164653352047)
,p_name=>'P192_DM_PARTY_NAME_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_PARTY_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797493059084066455)
,p_name=>'P192_DM_PARTY_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_default=>'S'
,p_source=>'DM_PARTY_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799474540375916973)
,p_name=>'P192_DM_PARTY_TYPE_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_default=>'S'
,p_source=>'DM_PARTY_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797493257463066457)
,p_name=>'P192_DM_PROD_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_PROD_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799474736739916975)
,p_name=>'P192_DM_PROD_ID_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_PROD_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797493372237066458)
,p_name=>'P192_DM_PROD_REV'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_PROD_REV'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799474872260916976)
,p_name=>'P192_DM_PROD_REV_SG'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_PROD_REV'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797495142700066476)
,p_name=>'P192_DM_TABLE_NAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_TABLE_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800747804905352044)
,p_name=>'P192_DM_TABLE_NAME_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_TABLE_NAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797494239076066467)
,p_name=>'P192_DM_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800746919490352035)
,p_name=>'P192_DM_UPD_BY_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797494592792066470)
,p_name=>'P192_DM_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800747241012352038)
,p_name=>'P192_DM_UPD_DATE_SG'
,p_source_data_type=>'DATE'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797494735680066472)
,p_name=>'P192_DM_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800747417938352040)
,p_name=>'P192_DM_UPD_EMP_ID_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797494371088066468)
,p_name=>'P192_DM_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800747075502352036)
,p_name=>'P192_DM_UPD_IP_ADDR_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797494465262066469)
,p_name=>'P192_DM_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800747179475352037)
,p_name=>'P192_DM_UPD_OS_USER_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797492518375066449)
,p_name=>'P192_DM_VOU_LEVEL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_default=>'O'
,p_source=>'DM_VOU_LEVEL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799473957139916967)
,p_name=>'P192_DM_VOU_LEVEL_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_default=>'O'
,p_source=>'DM_VOU_LEVEL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797492922299066453)
,p_name=>'P192_DM_VOU_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_VOU_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799474304078916971)
,p_name=>'P192_DM_VOU_NO_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_VOU_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797492811190066452)
,p_name=>'P192_DM_VOU_PFX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_VOU_PFX'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799474279393916970)
,p_name=>'P192_DM_VOU_PFX_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_VOU_PFX'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797492662916066451)
,p_name=>'P192_DM_VOU_PLNT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_VOU_PLNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799474103304916969)
,p_name=>'P192_DM_VOU_PLNT_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_VOU_PLNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799380546698859933)
,p_name=>'P192_DM_VOU_SEQ2_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_VOU_SEQ2_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800748493242352051)
,p_name=>'P192_DM_VOU_SEQ2_NO_SG'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_VOU_SEQ2_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799380682237859934)
,p_name=>'P192_DM_VOU_SEQ3_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_VOU_SEQ3_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800748643679352052)
,p_name=>'P192_DM_VOU_SEQ3_NO_SG'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_VOU_SEQ3_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799380734763859935)
,p_name=>'P192_DM_VOU_SEQ4_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'DM_VOU_SEQ4_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800748721900352053)
,p_name=>'P192_DM_VOU_SEQ4_NO_SG'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_VOU_SEQ4_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797492941114066454)
,p_name=>'P192_DM_VOU_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_default=>'1'
,p_source=>'DM_VOU_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799474457166916972)
,p_name=>'P192_DM_VOU_SEQ_NO_SG'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'DM_VOU_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12797492580676066450)
,p_name=>'P192_DM_VOU_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_default=>'E_IMG'
,p_source=>'DM_VOU_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799474043963916968)
,p_name=>'P192_DM_VOU_TYPE_SG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_default=>'E_SIG'
,p_source=>'DM_VOU_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9508083061205342216)
,p_name=>'P192_EMP_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(12800679970920351857)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799411904692916822)
,p_name=>'P192_EMP_ROWID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12800679970920351857)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11476355545843689187)
,p_name=>'P192_RETURN_PAGE_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12800679970920351857)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799381057614859938)
,p_name=>'P192_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_item_source_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800749225524352058)
,p_name=>'P192_ROWID_SG'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_item_source_plug_id=>wwv_flow_imp.id(12799404470325916764)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12799444421963916856)
,p_name=>'P192_TITLE'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(12797451462234066346)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12800799783306352145)
,p_name=>'P192_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12800679970920351857)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7186471317163378026)
,p_name=>'P192_VOU_NO_SG'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12800679970920351857)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6796925729835138006)
,p_validation_name=>'P192_DM_BLOB'
,p_static_id=>'p192-dm-blob'
,p_validation_sequence=>10
,p_validation=>'P192_DM_BLOB'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Image file should not be null.'
,p_when_button_pressed=>wwv_flow_imp.id(6796892703973137964)
,p_associated_item=>wwv_flow_imp.id(12797493792785066462)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6796926543826138006)
,p_validation_name=>'P192_DM_BLOB_1'
,p_static_id=>'p192-dm-blob-2'
,p_validation_sequence=>20
,p_validation=>'P192_DM_BLOB'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Image file should not be null.'
,p_when_button_pressed=>wwv_flow_imp.id(6796893921696137966)
,p_associated_item=>wwv_flow_imp.id(12797493792785066462)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6796926096046138006)
,p_validation_name=>'P192_DM_BLOB_SG'
,p_static_id=>'p192-dm-blob-sg'
,p_validation_sequence=>30
,p_validation=>'P192_DM_BLOB_SG'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Signature file should not be null.'
,p_when_button_pressed=>wwv_flow_imp.id(6796864432917137942)
,p_associated_item=>wwv_flow_imp.id(12800746470205352030)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(6796926913122138008)
,p_validation_name=>'P192_DM_BLOB_SG_1'
,p_static_id=>'p192-dm-blob-sg-2'
,p_validation_sequence=>40
,p_validation=>'P192_DM_BLOB_SG'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Signature file should not be null.'
,p_when_button_pressed=>wwv_flow_imp.id(6796864825460137942)
,p_associated_item=>wwv_flow_imp.id(12800746470205352030)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6796928384865138009)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P192_DM_BLOB'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6796928820379138009)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6796891919603137964)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6796929367257138011)
,p_event_id=>wwv_flow_imp.id(6796928820379138009)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-download'
,p_action=>'NATIVE_DOWNLOAD'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P192_EMP_ID',
  'multiple_files', 'N',
  'single_file_sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT dm_blob AS download_image, ',
    '       DM_FILE_NAME, ',
    '       DM_MIME_TYPE',
    'FROM doc_mgmt',
    'WHERE dm_bu = :Global_bu',
    '  AND dm_vou_no = :P192_EMP_ID',
    '  AND dm_vou_type = ''E_IMG''',
    '  AND LENGTH(dm_blob) > 0;')),
  'view_file_as', 'ATTACHMENT')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6796929698434138011)
,p_name=>'New_2'
,p_static_id=>'new-3'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(12799404470325916764)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6796930266615138011)
,p_event_id=>wwv_flow_imp.id(6796929698434138011)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6796891919603137964)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6796934822447138014)
,p_name=>'New_3'
,p_static_id=>'new-4'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P192_TYPE_DOWN'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6796935311667138014)
,p_event_id=>wwv_flow_imp.id(6796934822447138014)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_name=>'Hide'
,p_static_id=>'hide'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6796891919603137964)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P192_TYPE_DOWN'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6796931991025138012)
,p_name=>'Submit'
,p_static_id=>'submit'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6796864432917137942)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6796932522784138012)
,p_event_id=>wwv_flow_imp.id(6796931991025138012)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'javascript:apex.submit(''Insert_sign'');')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6796933006525138012)
,p_event_id=>wwv_flow_imp.id(6796931991025138012)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'window.onbeforeunload = null; // Disable the "Leave Site" warning')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6796933423185138012)
,p_name=>'Submit2'
,p_static_id=>'submit-2'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6796864825460137942)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6796934451855138014)
,p_event_id=>wwv_flow_imp.id(6796933423185138012)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'javascript:apex.submit(''Update_sign'');')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6796933896932138014)
,p_event_id=>wwv_flow_imp.id(6796933423185138012)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'window.onbeforeunload = null; // Disable the "Leave Site" warning')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6796930673784138012)
,p_name=>'Submit_clear'
,p_static_id=>'submit-clear'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6796861450223137934)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6796931095307138012)
,p_event_id=>wwv_flow_imp.id(6796930673784138012)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'javascript:apex.submit(''Update_delete'');')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6796931613817138012)
,p_event_id=>wwv_flow_imp.id(6796930673784138012)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'window.onbeforeunload = null; // Disable the "Leave Site" warning')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6796891356092137962)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(12799404470325916764)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form LOAD'
,p_static_id=>'initialize-form-load'
,p_internal_uid=>1317370372307217760
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6796919953207137984)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(12797451462234066346)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form SIGN'
,p_static_id=>'initialize-form-sign'
,p_internal_uid=>1317398969422217782
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6796920328076137984)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(12797451462234066346)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Profile Image'
,p_static_id=>'profile-image'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6796892703973137964)
,p_process_success_message=>'Uploaded Successfully.'
,p_internal_uid=>1317399344291217782
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6796920734162137984)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(12797451462234066346)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Profile Image_1'
,p_static_id=>'profile-image-2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6796893921696137966)
,p_process_success_message=>'Uploaded Successfully.'
,p_internal_uid=>1317399750377217782
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6796921139862137984)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(12797451462234066346)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Profile Image_delete'
,p_static_id=>'profile-image-delete'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6796893564354137966)
,p_internal_uid=>1317400156077217782
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6796927205565138008)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Profile_pic_upload'
,p_static_id=>'profile-pic-upload'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P192_ROWID IS NULL THEN ',
'   ',
'   SELECT NVL(MAX(DM_DOC_NO),1000000000) + 1',
'     INTO :P192_DM_DOC_NO',
'     FROM DOC_MGMT',
'    WHERE DM_BU = :GLOBAL_BU;',
'',
'   :P192_DM_CRE_BY      := :GLOBAL_USER;',
'   :P192_DM_CRE_EMP_ID  := :GLOBAL_EMP_ID;',
'   :P192_DM_CRE_DATE    := SYSDATE;',
'   :P192_DM_CRE_IP_ADDR := :GLOBAL_IP;',
'',
'ELSE    ',
'   ',
'   :P192_DM_UPD_BY      := :GLOBAL_USER;',
'   :P192_DM_UPD_DATE    := SYSDATE;',
'   :P192_DM_UPD_EMP_ID  := :GLOBAL_EMP_ID;',
'   :P192_DM_UPD_IP_ADDR := :GLOBAL_IP;',
'',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Insert,Upload'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>1317406221780217806
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6796927616604138008)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Profile_sign_upload'
,p_static_id=>'profile-sign-upload'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P192_ROWID_SG IS NULL THEN ',
'   ',
'   SELECT NVL(MAX(DM_DOC_NO),1000000000) + 1',
'     INTO :P192_DM_DOC_NO_SG',
'     FROM DOC_MGMT',
'    WHERE DM_BU = :GLOBAL_BU;',
'--RAISE_APPLICATION_ERROR(-20999,:P192_DM_DOC_NO_SG);',
'   :P192_DM_CRE_BY_SG      := :GLOBAL_USER;',
'   :P192_DM_CRE_EMP_ID_SG  := :GLOBAL_EMP_ID;',
'   :P192_DM_CRE_DATE_SG    := SYSDATE;',
'   :P192_DM_CRE_IP_ADDR_SG := :GLOBAL_IP;',
'',
'ELSE    ',
'   ',
'   :P192_DM_UPD_BY_SG      := :GLOBAL_USER;',
'   :P192_DM_UPD_DATE_SG    := SYSDATE;',
'   :P192_DM_UPD_EMP_ID_SG  := :GLOBAL_EMP_ID;',
'   :P192_DM_UPD_IP_ADDR_SG := :GLOBAL_IP;',
'',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Insert_sign,Update_sign'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Uploaded Successfully.'
,p_internal_uid=>1317406632819217806
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6796927992113138008)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Sign Delete'
,p_static_id=>'sign-delete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE ',
'  FROM doc_mgmt',
' WHERE dm_bu = :Global_bu',
'   AND dm_vou_no =:P192_VOU_NO_SG',
'   AND dm_vou_type =''E_SIG'';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6796861450223137934)
,p_process_when=>'Update_delete'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>1317407008328217806
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6796890541818137961)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(12799404470325916764)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Sign Upload'
,p_static_id=>'sign-upload'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6796864432917137942)
,p_process_when=>'Insert_sign'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>1317369558033217759
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6796890974660137962)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(12799404470325916764)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Sign Upload_1'
,p_static_id=>'sign-upload-2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6796864825460137942)
,p_process_when=>'Update_sign'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>1317369990875217760
);
wwv_flow_imp.component_end;
end;
/
