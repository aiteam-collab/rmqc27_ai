prompt --application/pages/page_00500
begin
--   Manifest
--     PAGE: 00500
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
 p_id=>500
,p_name=>'Doc. Mgmt. Access'
,p_alias=>'DOC-MGMT-ACCESS'
,p_step_title=>'Doc.Mgmt.Access'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'ref_fav();',
'slideclose();'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#Clear{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: rgb(255, 250, 250);',
'   background-size: 25px;',
'   width: 25px;',
'   height: 24px;',
'   /* top: 2px; */',
'}',
'#F {',
'color: #ff0000;',
'background-color: #ffffff;',
'}',
'',
'#fav',
'{',
'color: #ff0000;',
'background-color:  #ffffff',
'};',
'',
'/* #addbtn{',
'color: blue;',
'background-color:  #ffffff',
'};',
'',
'#savebtn{',
'         color: green;',
'         background-color:  #ffffff;',
'} */',
'/* #cancelbtn{',
'           color: rgb(214, 19, 29);',
'           background-color:  #ffffff;',
'} */',
'',
'/* #cancelbtn{',
'                color: rgb(214, 19, 29);',
'                background-color: #ffffff;',
'}',
'',
'#cancelbtn1{',
'            color: rgb(214, 19, 29);',
'            background-color:  #ffffff;',
'} */',
'',
'',
'',
'',
'#addbtn{',
'color: blue;',
'background-color: #ffffff;',
'}',
'',
'#SEARCH{',
'                color: green;',
'                background-color: #ffffff;',
'}',
'#cancelbtn{',
'                color: rgb(214, 19, 29);',
'                background-color: #ffffff;',
'}',
'',
'#cancelbtn1{',
'                color: rgb(214, 19, 29);',
'                background-color: #ffffff;',
'}',
'',
'',
'.a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'}',
'',
' .t-fht-thead {',
'    overflow: auto !important;',
' }',
'',
'#addbtn{',
'color: blue;',
'background-color: #ffffff;',
'}',
'',
'#SEARCH{',
'                color: green;',
'                background-color: #ffffff;',
'',
'',
' /* a {',
'    color: #337AC0;',
' } */',
'/* ',
'.a-Button--hot, .t-Button--hot:not(.t-Button--simple), body .ui-button.ui-button--hot, body .ui-state-default.ui-priority-primary {',
'    //background-color: #0b447c;',
'    color: #ffffff;',
'}',
'',
'.a-Button--hot, .t-Button--hot:not(.t-Button--simple), body .ui-button.ui-button--hot, body .ui-state-default.ui-priority-primary {',
'    //background-color: #0b447c;',
'    color: #ffffff;',
'} */',
'',
''))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15130543117986669066)
,p_plug_name=>'<b>Doc. Mgmt. Access Details</b>'
,p_static_id=>'b-doc-mgmt-access-details-b'
,p_title=>'Find Doc. Mgmt. Access'
,p_region_name=>'find'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--controlsPosEnd:is-expanded:t-Form--noPadding'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13629576173885842311)
,p_plug_name=>'User Mgmt. Access'
,p_static_id=>'user-mgmt-access'
,p_title=>'Result(s)'
,p_region_name=>'detail'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_region_attributes=>'style=''display:none;'''
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DMUAH_BU,',
'       DMUAH_DOC_NO,',
'       DMUAH_DOC_DATE,',
'       DMUAH_USER,',
'       DECODE(DMUAH_STATUS,''N'',''Draft'',''C'',''Cancelled'',''A'',''Approved'',''E'',''Entry Completed'') status,',
'       DECODE(DMUAH_STATUS,''N'',''Blue'',''E'',''Purple'',''A'',''GREEN'',''C'',''Orange'')HD_COLORS,',
'       DMUAH_CRE_BY,',
'       DMUAH_CRE_EMP_ID,',
'       DMUAH_CRE_IP_ADDR,',
'       DMUAH_CRE_OS_USER,',
'       DMUAH_CRE_DATE,',
'       DMUAH_UPD_BY,',
'       DMUAH_UPD_EMP_ID,',
'       DMUAH_UPD_IP_ADDR,',
'       DMUAH_UPD_OS_USER,',
'       DMUAH_UPD_DATE,',
'       DMUAL_DOC_TYPE,',
'       ''<span aria-hidden="true" class="fa fa-history" style="color: orange ;font-size : 12px ;font-weight: bold"></span>'' wf_hist',
'  from DOC_MGMT_USER_ACCESS_HD,DOC_MGMT_USER_ACCESS_LN',
'  WHERE DMUAH_BU = :GLOBAL_BU',
'  AND DMUAH_BU = DMUAL_BU(+)',
'  AND DMUAH_DOC_NO = DMUAL_DOC_NO(+)',
'  AND (dmuah_status = :P500_STATUS OR :P500_STATUS IS NULL)',
'  AND (dmuah_doc_no LIKE ''%'' || :P500_DOC_NO || ''%'' OR :P500_DOC_NO IS NULL)',
'  AND (DMUAL_DOC_TYPE LIKE ''%'' || :P500_DOC_TYPE || ''%'' OR :P500_DOC_TYPE IS NULL)',
'  AND (dmuah_user LIKE ''%'' || :P500_USER_ID || ''%'' OR :P500_USER_ID IS NULL)',
'  AND (TRUNC(dmuah_doc_date) <= TO_DATE(:P500_DOC_DATE_FRM,:GLOBAL_DATE_FORMAT) OR :P500_DOC_DATE_FRM IS NULL)',
'  AND (TRUNC(dmuah_doc_date) >= TO_DATE(:P500_DOC_DATE_TO,:GLOBAL_DATE_FORMAT) OR :P500_DOC_DATE_TO IS NULL)',
'  order by DMUAH_CRE_DATE DESC',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P500_USER_ID,P500_DOC_NO,P500_DOC_TYPE,P500_STATUS,P500_DOC_DATE_TO,P500_DOC_DATE_FRM'
,p_prn_page_header=>'User Unit'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(13629576272650842311)
,p_no_data_found_message=>'No Data Found'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>13557472500322654981
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3647179447858146052)
,p_db_column_name=>'DMUAH_BU'
,p_display_order=>10
,p_is_primary_key=>'Y'
,p_column_identifier=>'BN'
,p_column_label=>'Dmuah Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3647180014181146058)
,p_db_column_name=>'DMUAH_CRE_BY'
,p_display_order=>70
,p_column_identifier=>'BT'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3647180403290146062)
,p_db_column_name=>'DMUAH_CRE_DATE'
,p_display_order=>110
,p_column_identifier=>'BX'
,p_column_label=>'Created Date'
,p_column_type=>'DATE'
,p_format_mask=>'&GLOBAL_DATETIME_MASK.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3647180164966146059)
,p_db_column_name=>'DMUAH_CRE_EMP_ID'
,p_display_order=>80
,p_column_identifier=>'BU'
,p_column_label=>'Created Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3647180176724146060)
,p_db_column_name=>'DMUAH_CRE_IP_ADDR'
,p_display_order=>90
,p_column_identifier=>'BV'
,p_column_label=>'Created IP Addr.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3647180334127146061)
,p_db_column_name=>'DMUAH_CRE_OS_USER'
,p_display_order=>100
,p_column_identifier=>'BW'
,p_column_label=>'Created OS User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3647179577759146054)
,p_db_column_name=>'DMUAH_DOC_DATE'
,p_display_order=>30
,p_column_identifier=>'BP'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3647179481965146053)
,p_db_column_name=>'DMUAH_DOC_NO'
,p_display_order=>20
,p_is_primary_key=>'Y'
,p_column_identifier=>'BO'
,p_column_label=>'Doc. No.'
,p_column_link=>'f?p=&APP_ID.:214:&SESSION.::&DEBUG.:214:P214_DMUAH_DOC_NO:#DMUAH_DOC_NO#'
,p_column_linktext=>'#DMUAH_DOC_NO#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3647180512813146063)
,p_db_column_name=>'DMUAH_UPD_BY'
,p_display_order=>120
,p_column_identifier=>'BY'
,p_column_label=>'Dmuah Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3647180900594146067)
,p_db_column_name=>'DMUAH_UPD_DATE'
,p_display_order=>160
,p_column_identifier=>'CC'
,p_column_label=>'Dmuah Upd Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3647180584316146064)
,p_db_column_name=>'DMUAH_UPD_EMP_ID'
,p_display_order=>130
,p_column_identifier=>'BZ'
,p_column_label=>'Dmuah Upd Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3647180765601146065)
,p_db_column_name=>'DMUAH_UPD_IP_ADDR'
,p_display_order=>140
,p_column_identifier=>'CA'
,p_column_label=>'Dmuah Upd Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3647180841028146066)
,p_db_column_name=>'DMUAH_UPD_OS_USER'
,p_display_order=>150
,p_column_identifier=>'CB'
,p_column_label=>'Dmuah Upd Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3647179720223146055)
,p_db_column_name=>'DMUAH_USER'
,p_display_order=>40
,p_column_identifier=>'BQ'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3765765876264435831)
,p_db_column_name=>'DMUAL_DOC_TYPE'
,p_display_order=>200
,p_column_identifier=>'CG'
,p_column_label=>'Doc. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3742970679232649838)
,p_db_column_name=>'HD_COLORS'
,p_display_order=>180
,p_column_identifier=>'CE'
,p_column_label=>'Hd Colors'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3742970658174649837)
,p_db_column_name=>'STATUS'
,p_display_order=>170
,p_column_identifier=>'CD'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="COLOR:#HD_COLORS#;font-weight:bold;font-weight: bold; border-radius:12px;">#STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3755363457567536331)
,p_db_column_name=>'WF_HIST'
,p_display_order=>190
,p_column_identifier=>'CF'
,p_column_label=>'WF Log'
,p_column_link=>'f?p=&GLOBAL_MAIN_APP.:235130060:&SESSION.::&DEBUG.:235130060:P235130060_P_DOC_NO,P235130060_P_WF_TYPE:#DMUAH_DOC_NO#,WF_DMA'
,p_column_linktext=>'#WF_HIST#'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'instr(nvl(:REQUEST,''~''),''XLS'') = 0 and ',
'instr(nvl(:REQUEST,''~''),''PDF'') = 0 and ',
'instr(nvl(:REQUEST,''~''),''HTMLD'') = 0'))
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(13629588354098846279)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'10523865'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WF_HIST:DMUAH_DOC_NO:DMUAL_DOC_TYPE:DMUAH_DOC_DATE:DMUAH_USER:STATUS:DMUAH_CRE_BY:DMUAH_CRE_DATE:DMUAH_CRE_EMP_ID:DMUAH_CRE_IP_ADDR:DMUAH_CRE_OS_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3649388721054199071)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(15130543117986669066)
,p_button_name=>'Add_btn'
,p_static_id=>'add-btn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--gapLeft:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Add'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:213:&SESSION.::&DEBUG.:213::'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3748111014174303331)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(15130543117986669066)
,p_button_name=>'back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--padRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Back'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.:89::'
,p_icon_css_classes=>'fa-box-arrow-in-west'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3746662108635807441)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(15130543117986669066)
,p_button_name=>'Clear_btn'
,p_static_id=>'clear-btn'
,p_button_static_id=>'Clear1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Clear Btn'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3649388637601199070)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(15130543117986669066)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Close'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_button_css_classes=>'closebtn'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3649388101697199065)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(15130543117986669066)
,p_button_name=>'Search_rec'
,p_static_id=>'search-rec'
,p_button_static_id=>'SEARCH'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'<b>Search</b>'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11467577807122210843)
,p_name=>'P500_DOC_DATE_FRM'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(15130543117986669066)
,p_prompt=>'Document From Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3649388849186199072)
,p_name=>'P500_DOC_DATE_TO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(15130543117986669066)
,p_prompt=>'Document  To Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11467577643442210842)
,p_name=>'P500_DOC_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(15130543117986669066)
,p_prompt=>'Doc. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT dmuah_doc_no D, dmuah_doc_no R FROM DOC_MGMT_USER_ACCESS_HD',
'WHERE dmuah_bu = :GLOBAL_BU'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Document',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11467577485079210840)
,p_name=>'P500_DOC_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(15130543117986669066)
,p_prompt=>'Doc.  Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DMUAL_DOC_TYPE ',
'  from DOC_MGMT_USER_ACCESS_LN',
'  WHERE dmual_bu = :GLOBAL_BU'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3776935600359375534)
,p_name=>'P500_REFIND'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(15130543117986669066)
,p_item_default=>'N'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10399310142974694065)
,p_name=>'P500_STATUS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(15130543117986669066)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;N,Entry Completed;E,Approved;A,Cancelled;C'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm:margin-right-sm'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13700164794366295845)
,p_name=>'P500_USER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(15130543117986669066)
,p_prompt=>'User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT appluser_id   ',
'  FROM appl_users,',
'       wapl_user_plnt_access_view',
' WHERE appluser_bu = wupav_bu',
'   AND appluser_id = wupav_user_id',
'   AND appluser_bu = :Global_bu     ',
'   AND  appluser_status = ''A'''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm:margin-left-sm'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the User',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3746661222406807432)
,p_name=>'clear'
,p_static_id=>'clear'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(3746662108635807441)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3746661333135807433)
,p_event_id=>wwv_flow_imp.id(3746661222406807432)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P500_USER_ID,P500_DOC_NO,P500_DOC_TYPE,P500_DOC_DATE_FRM,P500_DOC_DATE_TO,P500_STATUS'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3649388219385199066)
,p_name=>'Find'
,p_static_id=>'find'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(3649388101697199065)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3649388298483199067)
,p_event_id=>wwv_flow_imp.id(3649388219385199066)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(13629576173885842311)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3649388428215199068)
,p_event_id=>wwv_flow_imp.id(3649388219385199066)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(13629576173885842311)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3776935361214375531)
,p_name=>'load'
,p_static_id=>'load'
,p_event_sequence=>100
,p_condition_element=>'P500_REFIND'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3776935727776375535)
,p_event_id=>wwv_flow_imp.id(3776935361214375531)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P500_USER_ID,P500_DOC_NO,P500_DOC_TYPE,P500_DOC_DATE_FRM,P500_DOC_DATE_TO,P500_STATUS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3776935408312375532)
,p_event_id=>wwv_flow_imp.id(3776935361214375531)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(13629576173885842311)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3776935506757375533)
,p_event_id=>wwv_flow_imp.id(3776935361214375531)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(13629576173885842311)
);
wwv_flow_imp.component_end;
end;
/
