prompt --application/pages/page_00111
begin
--   Manifest
--     PAGE: 00111
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
 p_id=>111
,p_name=>'Payroll Details'
,p_alias=>'PAYROLL-DETAILS'
,p_step_title=>'Payroll Details'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(5737223025593288595)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6325503900335264403)
,p_plug_name=>'Payroll_Project_Details'
,p_static_id=>'payroll-project-details'
,p_title=>'Result(s)'
,p_region_name=>'detail'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ROWID,',
'       EPDH_BU,',
'       EPDH_DOC_NO,',
'       EPDH_DOC_DATE,',
'       (SELECT pc_clndr_name ',
'          FROM pyrl_clndr',
'         WHERE pc_bu = :global_bu',
'           AND PC_ACTIVE_FLAG = ''Y''',
'           AND pc_clndr_id = EPDH_CLNDR_ID)HEPDH_CLNDR_ID,',
'       EPDH_YEAR,',
'       DECODE(EPDH_PERIOD,''1'',''April'',',
'                          ''2'',''May'',',
'                          ''3'',''June'',',
'                          ''4'',''July'',',
'                          ''5'',''August'',',
'                          ''6'',''September'',',
'                          ''7'',''October'',',
'                          ''8'',''November'',',
'                          ''9'',''December'',',
'                         ''10'',''January'',',
'                         ''11'',''February'',',
'                         ''12'',''March'' )EPDH_PERIOD,',
'       EPDH_DATE_FROM,',
'       EPDH_DATE_TO,',
'       EPDH_REF,',
'       DECODE(EPDH_STATUS,''N'',''Draft'',''P'',''Posted'',''L'',''Cancelled'')EPDH_STATUS,',
'       DECODE(EPDH_STATUS,''N'',''Blue'',''P'',''Green'',''L'',''Red'') color,',
'       EPDH_CRE_BY,',
'       EPDH_CRE_IP_ADDR,',
'       EPDH_CRE_EMP_ID,',
'       EPDH_CRE_OS_USER,',
'       TO_CHAR(EPDH_CRE_DATE,''DD-MM-RRRR HH12:MI AM'')EPDH_CRE_DATE,',
'       EPDH_UPD_BY,',
'       EPDH_UPD_IP_ADDR,',
'       EPDH_UPD_EMP_ID,',
'       EPDH_UPD_OS_USER,',
'       EPDH_UPD_DATE',
'  FROM EMP_PROJ_DLS_HD',
'  WHERE EPDH_BU = :global_bu ',
'   AND (EPDH_YEAR = :P111_YEAR OR :P111_YEAR IS null)',
'   AND (EPDH_PERIOD = :P111_PERIOD OR :P111_PERIOD IS null)',
'   AND (EPDH_STATUS = :P111_STATUS OR :P111_STATUS IS null)',
'   AND ((trunc(EPDH_DOC_DATE) BETWEEN TO_DATE(:P111_DATE_FROM,''DD-MM-YYYY'') AND TO_DATE(:P111_DATE_TO,''DD-MM-YYYY'') AND :P111_DATE_FROM IS NOT NULL AND :P111_DATE_TO IS NOT NULL)',
'    OR (trunc(EPDH_DOC_DATE) >= TO_DATE(:P111_DATE_FROM,''DD-MM-YYYY'') AND :P111_DATE_FROM IS NOT NULL AND :P111_DATE_TO IS NULL)',
'    OR (trunc(EPDH_DOC_DATE) <= TO_DATE(:P111_DATE_TO,''DD-MM-YYYY'') AND :P111_DATE_TO IS NOT NULL AND :P111_DATE_FROM IS NULL)  ',
'    OR (:P111_DATE_FROM IS NULL AND :P111_DATE_TO IS NULL))',
' '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P111_STATUS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Result(s)'
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
 p_id=>wwv_flow_imp.id(6325504060719264404)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>845983076934344202
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325505257630264416)
,p_db_column_name=>'COLOR'
,p_display_order=>230
,p_column_identifier=>'L'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325504258823264406)
,p_db_column_name=>'EPDH_BU'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Epdh Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325505312360264417)
,p_db_column_name=>'EPDH_CRE_BY'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325505722061264421)
,p_db_column_name=>'EPDH_CRE_DATE'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Created Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325505489454264419)
,p_db_column_name=>'EPDH_CRE_EMP_ID'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Epdh Cre Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325505389669264418)
,p_db_column_name=>'EPDH_CRE_IP_ADDR'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Epdh Cre Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325505595929264420)
,p_db_column_name=>'EPDH_CRE_OS_USER'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Epdh Cre Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325504882758264412)
,p_db_column_name=>'EPDH_DATE_FROM'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Date From'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325504948674264413)
,p_db_column_name=>'EPDH_DATE_TO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Date To'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325504393595264408)
,p_db_column_name=>'EPDH_DOC_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Doc Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325504379303264407)
,p_db_column_name=>'EPDH_DOC_NO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Doc. No'
,p_column_link=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.::P110_ROWID,P110_EPDL_DOC_NO,P110_EPDL_LINE:#ROWID#,,'
,p_column_linktext=>'#EPDH_DOC_NO#'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325506456657264428)
,p_db_column_name=>'EPDH_PERIOD'
,p_display_order=>70
,p_column_identifier=>'W'
,p_column_label=>'Period'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325504995161264414)
,p_db_column_name=>'EPDH_REF'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325505094339264415)
,p_db_column_name=>'EPDH_STATUS'
,p_display_order=>120
,p_column_identifier=>'K'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#EPDH_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325505840697264422)
,p_db_column_name=>'EPDH_UPD_BY'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Epdh Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325506225241264426)
,p_db_column_name=>'EPDH_UPD_DATE'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Epdh Upd Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325506062942264424)
,p_db_column_name=>'EPDH_UPD_EMP_ID'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Epdh Upd Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325505967071264423)
,p_db_column_name=>'EPDH_UPD_IP_ADDR'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Epdh Upd Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325506131181264425)
,p_db_column_name=>'EPDH_UPD_OS_USER'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Epdh Upd Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325504683354264410)
,p_db_column_name=>'EPDH_YEAR'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325504500532264409)
,p_db_column_name=>'HEPDH_CLNDR_ID'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Calendar'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6325504126123264405)
,p_db_column_name=>'ROWID'
,p_display_order=>240
,p_column_identifier=>'A'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6325548887237297186)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'8460280'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EPDH_DOC_NO:EPDH_DOC_DATE:HEPDH_CLNDR_ID:EPDH_YEAR:EPDH_DATE_FROM:EPDH_DATE_TO:EPDH_REF:EPDH_STATUS:EPDH_CRE_BY:EPDH_CRE_DATE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6324436465861787529)
,p_plug_name=>'Search'
,p_static_id=>'search'
,p_title=>'Find Project'
,p_region_name=>'find'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6324438090148787546)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6324436465861787529)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:::'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6324437825088787543)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6324436465861787529)
,p_button_name=>'Clear'
,p_static_id=>'clear'
,p_button_static_id=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6324437768125787542)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6324436465861787529)
,p_button_name=>'Find_Report'
,p_static_id=>'find-report'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6324438005248787545)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6324436465861787529)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Home'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_button_css_classes=>'cancelbtn'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6324436876530787533)
,p_name=>'P111_DATE_FROM'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6324436465861787529)
,p_prompt=>'Date From'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6324436939124787534)
,p_name=>'P111_DATE_TO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6324436465861787529)
,p_prompt=>'Date To'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6324436567673787530)
,p_name=>'P111_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6324436465861787529)
,p_prompt=>'Doc. No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  EPDH_DOC_NO D,',
'        EPDH_DOC_NO R',
'  FROM EMP_PROJ_DLS_HD',
'  WHERE EPDH_BU = :GLOBAL_BU '))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Document',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6324437319938787538)
,p_name=>'P111_DUMMY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6324436465861787529)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6324436775702787532)
,p_name=>'P111_PERIOD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6324436465861787529)
,p_prompt=>'Period'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT(SELECT pcp_long_desc ',
'   FROM PAYROLL_CAL_PERIOD',
' WHERE pcp_bu = epdh_bu',
'   AND pcp_year = epdh_year',
'   AND pcp_period = epdh_period',
'   AND pcp_clndr_id = epdh_clndr_id) D,',
'            epdh_period R',
'  FROM EMP_PROJ_DLS_HD',
'  WHERE EPDH_BU = :GLOBAL_BU ',
'     --and (epdh_year  = :P111_YEAR )'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Period',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6324437150198787536)
,p_name=>'P111_RPT_REF'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6324436465861787529)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6324437253469787537)
,p_name=>'P111_SHOW_DATA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6324436465861787529)
,p_item_default=>'N'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6324437055835787535)
,p_name=>'P111_STATUS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6324436465861787529)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Draft;N,Posted;P,Cancelled;L'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6324436670809787531)
,p_name=>'P111_YEAR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6324436465861787529)
,p_prompt=>'Year'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT distinct epdh_year D,',
'            epdh_year R',
'  FROM EMP_PROJ_DLS_HD',
'  WHERE EPDH_BU = :GLOBAL_BU '))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Year',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6324438199100787547)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6324437768125787542)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6324438470082787549)
,p_event_id=>wwv_flow_imp.id(6324438199100787547)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("detail").show(); ',
    '// apex.item("find").show();')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6324438514084787550)
,p_event_id=>wwv_flow_imp.id(6324438199100787547)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6324436465861787529)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6324438354522787548)
,p_event_id=>wwv_flow_imp.id(6324438199100787547)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P111_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6324438656469787551)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6324437825088787543)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6324438740453787552)
,p_event_id=>wwv_flow_imp.id(6324438656469787551)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P111_DOC_NO,P111_YEAR,P111_PERIOD,P111_DATE_FROM,P111_DATE_TO,P111_STATUS'
);
wwv_flow_imp.component_end;
end;
/
