prompt --application/pages/page_00200
begin
--   Manifest
--     PAGE: 00200
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
 p_id=>200
,p_name=>'Scheduler Jobs'
,p_alias=>'SCHEDULER-JOBS1'
,p_step_title=>'Scheduler Jobs'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'  }',
'',
'.t-fht-thead {',
'           overflow: auto !important;',
'       } '))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7227542091752358403)
,p_plug_name=>'<b>Result(s)</b>'
,p_static_id=>'b-result-s-b'
,p_region_name=>'sch'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style=''display:none;'''
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ROWID,',
'       RSJ_BU,',
'       RSJ_ID,',
'       RSJ_NAME,',
'       RSJ_ACTION,',
'       RSJ_START_DATE,',
'       RSJ_END_DATE,',
'       DECODE(RSJ_STATUS,''N'',''Draft'',''A'',''Active'',''D'',''Deactive'',''C'',''Cancelled'')RSJ_STATUS,',
'       DECODE(RSJ_STATUS,''N'',''Blue'',''A'',''Green'',''D'',''Brown'',''C'',''Red'')COLOR,',
'       RSJ_COMMENTS,',
'       RSJ_MAIL_SUB,',
'       RSJ_MAIL_BODY,',
'       RSJ_CRE_BY,',
'       RSJ_CRE_DATE,',
'       RSJ_UPD_BY,',
'       RSJ_UPD_DATE,',
'       RSJ_TYPE,',
'       RSJ_REP_INTERV_NORMAL,',
'       RSJ_REP_INTERV_REPORT,',
'       RSJ_RUN_TIME,',
'       DECODE(RSJ_SCHEDULE_TYPE,''P'',''PL/Sql Block'',''E'',''Executable'',''S'',''Stored Procedure'')RSJ_SCHEDULE_TYPE',
'  FROM RM_SCHEDULE_JOBS',
'  WHERE RSJ_BU = :GLOBAL_BU',
'    AND (RSJ_ID = :P200_SCH_ID OR :P200_SCH_ID IS NULL)',
'    AND (RSJ_START_DATE = TO_DATE(:P200_START_DATE,:GLOBAL_RPT_DATE_MASK) OR TO_DATE(:P200_START_DATE,:GLOBAL_RPT_DATE_MASK) IS NULL)',
'    AND (RSJ_END_DATE = TO_DATE(:P200_END_DATE,:GLOBAL_RPT_DATE_MASK) OR TO_DATE(:P200_END_DATE,:GLOBAL_RPT_DATE_MASK) IS NULL)',
'    AND (RSJ_RUN_TIME = TO_DATE(:P200_RUN_TIME,:GLOBAL_RPT_DATE_MASK) OR TO_DATE(:P200_RUN_TIME,:GLOBAL_RPT_DATE_MASK) IS NULL)',
'    AND (RSJ_SCHEDULE_TYPE = :P200_SCH_TYPE OR :P200_SCH_TYPE IS NULL)',
'    AND (RSJ_STATUS = :P200_STATUS OR :P200_STATUS IS NULL)',
'    ORDER BY RSJ_ID DESC;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P200_SCH_ID,P200_SCH_NAME,P200_START_DATE,P200_END_DATE,P200_RUN_TIME,P200_SCH_TYPE,P200_STATUS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(7227542231264358404)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1748021247479438202
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7241529840428878405)
,p_db_column_name=>'COLOR'
,p_display_order=>220
,p_column_identifier=>'W'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7227544195621358424)
,p_db_column_name=>'ROWID'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Rowid'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7227542677262358408)
,p_db_column_name=>'RSJ_ACTION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Action'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7227542328022358405)
,p_db_column_name=>'RSJ_BU'
,p_display_order=>10
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Rsj Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7227543018022358412)
,p_db_column_name=>'RSJ_COMMENTS'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Comments'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7227543361555358415)
,p_db_column_name=>'RSJ_CRE_BY'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7227543406692358416)
,p_db_column_name=>'RSJ_CRE_DATE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7227542872368358410)
,p_db_column_name=>'RSJ_END_DATE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'End Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7227542411562358406)
,p_db_column_name=>'RSJ_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Scheduler ID'
,p_column_link=>'f?p=&APP_ID.:198:&SESSION.::&DEBUG.::P198_ROWID,P198_RSJ_ID:#ROWID#,#RSJ_ID#'
,p_column_linktext=>'#RSJ_ID#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7227543259734358414)
,p_db_column_name=>'RSJ_MAIL_BODY'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Mail Body'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7227543154264358413)
,p_db_column_name=>'RSJ_MAIL_SUB'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Mail Sub.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7227542517995358407)
,p_db_column_name=>'RSJ_NAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Scheduler Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7227543848640358420)
,p_db_column_name=>'RSJ_REP_INTERV_NORMAL'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Normal'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7227543925506358421)
,p_db_column_name=>'RSJ_REP_INTERV_REPORT'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Report'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7227543993350358422)
,p_db_column_name=>'RSJ_RUN_TIME'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Run Time'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7241529771104878404)
,p_db_column_name=>'RSJ_SCHEDULE_TYPE'
,p_display_order=>210
,p_column_identifier=>'V'
,p_column_label=>'Rsj Schedule Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7227542727925358409)
,p_db_column_name=>'RSJ_START_DATE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Start Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7227542893822358411)
,p_db_column_name=>'RSJ_STATUS'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#RSJ_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7227543781667358419)
,p_db_column_name=>'RSJ_TYPE'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7227543571575358417)
,p_db_column_name=>'RSJ_UPD_BY'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7227543625567358418)
,p_db_column_name=>'RSJ_UPD_DATE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Upd Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7227930823817515058)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'17484099'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'RSJ_ID:RSJ_NAME:RSJ_START_DATE:RSJ_END_DATE:RSJ_COMMENTS:RSJ_REP_INTERV_NORMAL:RSJ_REP_INTERV_REPORT:RSJ_RUN_TIME:RSJ_STATUS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7227544510789358427)
,p_plug_name=>'Find Scheduler Jobs'
,p_static_id=>'find-scheduler-jobs'
,p_region_name=>'FIND'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--controlsPosEnd:is-expanded:t-Region--scrollBody:t-Form--slimPadding'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7227545719608358439)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(7227544510789358427)
,p_button_name=>'CLEAR'
,p_static_id=>'clear'
,p_button_static_id=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Clear'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7227545804292358440)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(7227544510789358427)
,p_button_name=>'CLOSE'
,p_static_id=>'close'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Close'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_button_css_classes=>'closebtn'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7227545546116358437)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(7227544510789358427)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapLeft:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Create'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:198:&SESSION.::&DEBUG.:::'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7227545887233358441)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(7227544510789358427)
,p_button_name=>'Favorite'
,p_static_id=>'favorite'
,p_button_static_id=>'F'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Favorite'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'closebtn'
,p_icon_css_classes=>'t-Icon'
,p_button_cattributes=>'onclick="global_fav()";'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7227545642954358438)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(7227544510789358427)
,p_button_name=>'FIND'
,p_static_id=>'find'
,p_button_static_id=>'SEARCH'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Search'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7227545069076358432)
,p_name=>'P200_END_DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7227544510789358427)
,p_prompt=>'End Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7227545137262358433)
,p_name=>'P200_RUN_TIME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7227544510789358427)
,p_prompt=>'Run Time'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7227544621464358428)
,p_name=>'P200_SCH_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7227544510789358427)
,p_prompt=>'Scheduler ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT RSJ_ID FROM RM_SCHEDULE_JOBS',
'    WHERE RSJ_BU = :GLOBAL_BU;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Schedule ID')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7227544757235358429)
,p_name=>'P200_SCH_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7227544510789358427)
,p_prompt=>'Scheduler Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT RSJ_NAME FROM RM_SCHEDULE_JOBS',
'    WHERE RSJ_BU = :GLOBAL_BU;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Scheduler Name')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7227545206941358434)
,p_name=>'P200_SCH_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7227544510789358427)
,p_prompt=>'Schedule Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:PL/Sql Block;P,Executable;E,Stored Procedure;S'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7227544911695358431)
,p_name=>'P200_START_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7227544510789358427)
,p_prompt=>'Start Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7227545406265358436)
,p_name=>'P200_STATUS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7227544510789358427)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;D,Active;A,Deactive;D,Cancelled;C'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7227545985478358442)
,p_name=>'Dyn_Clear'
,p_static_id=>'dyn-clear'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7227545719608358439)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7227546102308358443)
,p_event_id=>wwv_flow_imp.id(7227545985478358442)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P200_SCH_ID,P200_SCH_NAME,P200_START_DATE,P200_END_DATE,P200_RUN_TIME,P200_SCH_TYPE,P200_STATUS'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7227546252374358444)
,p_name=>'Generate'
,p_static_id=>'generate'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7227545642954358438)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7227546290814358445)
,p_event_id=>wwv_flow_imp.id(7227546252374358444)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.jQuery(''#sch_ir'').interactiveReport("reset");',
    'apex.item("sch").show();')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7227546437505358446)
,p_event_id=>wwv_flow_imp.id(7227546252374358444)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7227542091752358403)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
