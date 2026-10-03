prompt --application/pages/page_00077
begin
--   Manifest
--     PAGE: 00077
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
 p_id=>77
,p_name=>'Holiday Details'
,p_alias=>'HOLIDAY-DETAILS'
,p_step_title=>'Holiday Details'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Cards--basic .t-Card-titleWrap {',
'    box-shadow: 0 -1px 0 rgba(0, 0, 0, 0.05) inset;',
'    background: #5c1d6e;',
'  //  background: linear-gradient(to right, #601141, #a372a3);',
'}',
'',
'.t-Cards--3cols .t-Cards-item {',
'    width: 23.33%;',
'}',
'',
'.t-Card-title {',
'   ',
'    color: white;',
'}',
'',
'.t-Card-desc {',
'    color: #6a1a1b;',
'}',
'',
'.t-Card-info, .t-Card-subtitle {',
'    color: #6a1a1b;',
'}',
'',
'.t-Cards--basic .t-Card-titleWrap {',
'    display: flex;',
'    flex-direction: column;',
'    justify-content: center;',
'    padding: 12px 64px 12px 16px;',
'    min-height: 52px;',
'    box-shadow: 0 -1px 0 rgba(0,0,0,.05) inset;',
'}',
'',
'.fc .fc-toolbar.fc-header-toolbar {',
'    margin-bottom: -11px;',
'    margin-top: 10px;',
'}',
'',
'.CTS {',
'    margin-top: 4px;',
'    padding-left: 4px;',
'    border: 0px solid #a8c4d0;',
'    box-shadow: 0.5px 0.5px 3.5px rgba(70, 47, 47, 0.66);',
'    box-shadow: -6px -2px 8px rgba(58, 23, 23, 0.37);',
'    border-radius: 6px;',
'    border-spacing: 0;',
'    background: white;',
'    width: auto;',
'    clear: both;',
'    background-repeat: no-repeat;',
'    background-size: 100% 26px;',
'    /* background-image: linear-gradient(to bottom,#f1f3f3 0,#e7ebed 50%,#e3e7e9 100%); */',
'    /* border: 1px solid #c4ced3; */',
'    /* box-shadow: 0 1px 0 0 rgba(255,255,255,.9) inset; */',
'    box-shadow: 0px 0px 0px rgba(58, 23, 23, 0.19);',
'    /* text-shadow: 0 1px 0 rgba(255,255,255,.9); */',
'}',
'',
'.apex-item-display-only {',
'    min-height: 2.4rem;',
'    box-shadow: none;',
'    font-weight: 500;',
'    line-height: 13px;',
'     font-size: 12px;',
'}'))
,p_step_template=>wwv_flow_imp.id(6339300137962061229)
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'Y'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6202168980933379865)
,p_plug_name=>'Calendar'
,p_static_id=>'calendar'
,p_parent_plug_id=>wwv_flow_imp.id(6202168312726379858)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6202168422141379859)
,p_plug_name=>'Calendar'
,p_static_id=>'calendar-2'
,p_parent_plug_id=>wwv_flow_imp.id(6202168980933379865)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--showIcon:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--noPadding'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>50
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rowid,''fa-calendar-o'' card_icon,',
'          Holiday_Description CARD_TITLE,',
'          ''<font color="blue";>''',
'       || ''Zone :''',
'       || ''</font>''',
'       || '' ''',
'       || Zone',
'       || ''<br>''||',
'          --CARD_TEXT,',
'          ''<font color="blue";>''',
'       || ''Date :''',
'       || ''</font>''',
'       || '' ''',
'       || Holiday_Date',
'       || ''<br>''',
'          CARD_TEXT,',
'          null card_subtext,',
'        ZWCLN_DATE,',
'        css_class      /*,   ',
'          ''<font color="blue";>''',
'       || ''Reason :''',
'       || ''</font>''',
'       || '' ''',
'       || Holiday_Description',
'       || ''<br>''',
'          CARD_SUBTEXT */',
'  FROM (  SELECT TO_DATE (ZWCLN_DATE, ''DD-MON-YYYY'') Holiday_Date,',
'                 ZWCLN_DATE,',
'                 ZWCLN_REF Holiday_Description,',
'                 ZWCHD_YEAR,',
'                 (SELECT pc_clndr_name',
'                    FROM pyrl_clndr',
'                   WHERE pc_bu = :global_bu AND pc_clndr_id = ZWCHD_CLNDR_ID)',
'                    Calendar,',
'                 (SELECT hz_desc1',
'                    FROM holiday_zones',
'                   WHERE hz_bu = :global_bu AND hz_zone_id = ZWCHD_ZONE_ID)',
'                    Zone,',
'                    case zwcln_holiday',
'                    when ''H'' then ''apex-cal-green''',
'                    when ''B'' then ''apex-cal-yellow''',
'                    --when ''Closed''  then ''apex-cal-red''',
'                    --when ''On-Hold'' then ''apex-cal-black''',
'                  end as css_class',
'            FROM zone_workday_calendar_hd, zone_workday_calendar_ln',
'           WHERE     zwchd_bu = zwcln_bu',
'                 AND zwchd_clndr_no = zwcln_clndr_no',
'                 AND zwchd_year = zwcln_year',
'                 AND zwchd_zone_id = zwcln_zone_id',
'                 AND zwchd_bu = :global_bu',
'                 AND zwchd_status = ''A''',
'                 AND zwcln_holiday IN (''H'', ''B'')',
'                 AND zwchd_zone_id IN',
'                        (SELECT emp_zone',
'                           FROM employees',
'                          WHERE emp_bu = :global_bu',
'                                AND emp_emp_id = :global_emp_id)',
'                 --and trunc(ZWCLN_DATE) between  trunc(sysdate,''year'') and trunc(add_months(trunc(sysdate,''year''),12)-1)',
'                 AND TRUNC (SYSDATE) BETWEEN TRUNC (zwchd_start_date)',
'                                         AND TRUNC (zwchd_end_date)',
'        ORDER BY 1 ASC)'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_calendar_views', 'list:navigation',
  'css_class', 'CSS_CLASS',
  'display_column', 'CARD_TITLE',
  'drag_and_drop', 'N',
  'event_sorting', 'AUTOMATIC',
  'maximum_events_day', '10',
  'multiple_line_event', 'Y',
  'primary_key_column', 'ROWID',
  'responsive_list_view', 'Y',
  'show_time', 'N',
  'show_tooltip', 'Y',
  'show_weekend', 'Y',
  'start_date_column', 'ZWCLN_DATE')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6165366017561751205)
,p_name=>'Holiday Details'
,p_static_id=>'holiday-details'
,p_parent_plug_id=>wwv_flow_imp.id(6202168312726379858)
,p_template=>wwv_flow_imp.id(10650490475667505325)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--basic:t-Cards--displayIcons:t-Cards--3cols:t-Cards--animColorFill'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''fa-calendar-o'' card_icon,',
'          ''<font color="white";>''',
'       --|| ''Reason :''',
'       || ''</font>''',
'       || '' ''',
'       || Holiday_Description',
'       || ''<br>''',
'          CARD_TITLE,',
'          ''<font color="blue";>''',
'       || ''Zone :''',
'       || ''</font>''',
'       || '' ''',
'       || Zone',
'       || ''<br>''||',
'          --CARD_TEXT,',
'          ''<font color="blue";>''',
'       || ''Date :''',
'       || ''</font>''',
'       || '' ''',
'       || Holiday_Date',
'       || ''<br>''',
'          CARD_TEXT,',
'          null card_subtext    /*,   ',
'          ''<font color="blue";>''',
'       || ''Reason :''',
'       || ''</font>''',
'       || '' ''',
'       || Holiday_Description',
'       || ''<br>''',
'          CARD_SUBTEXT */',
'  FROM (  SELECT TO_DATE (ZWCLN_DATE, ''DD-MON-YYYY'') Holiday_Date,',
'                 ZWCLN_REF Holiday_Description,',
'                 ZWCHD_YEAR,',
'                 (SELECT pc_clndr_name',
'                    FROM pyrl_clndr',
'                   WHERE pc_bu = :global_bu AND pc_clndr_id = ZWCHD_CLNDR_ID)',
'                    Calendar,',
'                 (SELECT hz_desc1',
'                    FROM holiday_zones',
'                   WHERE hz_bu = :global_bu AND hz_zone_id = ZWCHD_ZONE_ID)',
'                    Zone',
'            FROM zone_workday_calendar_hd, zone_workday_calendar_ln',
'           WHERE     zwchd_bu = zwcln_bu',
'                 AND zwchd_clndr_no = zwcln_clndr_no',
'                 AND zwchd_year = zwcln_year',
'                 AND zwchd_zone_id = zwcln_zone_id',
'                 AND zwchd_bu = :global_bu',
'                 AND zwchd_status = ''A''',
'                 AND zwcln_holiday IN (''H'', ''B'')',
'                 AND zwchd_zone_id IN',
'                        (SELECT emp_zone',
'                           FROM employees',
'                          WHERE emp_bu = :global_bu',
'                                AND emp_emp_id = :global_emp_id)',
'                 --and trunc(ZWCLN_DATE) between  trunc(sysdate,''year'') and trunc(add_months(trunc(sysdate,''year''),12)-1)',
'                 AND TRUNC (SYSDATE) BETWEEN TRUNC (zwchd_start_date)',
'                                         AND TRUNC (zwchd_end_date)',
'        ORDER BY 1 ASC)'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6199754636233497366)
,p_query_column_id=>1
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>30
,p_column_heading=>'Card Icon'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6199755172238497371)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Subtext'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6199754574414497365)
,p_query_column_id=>3
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>20
,p_column_heading=>'<b>Card Text</b>'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6199754501199497364)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6534766469474387502)
,p_plug_name=>'Holiday Details'
,p_static_id=>'holiday-details-2'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>8
,p_plug_display_column=>3
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_date(ZWCLN_DATE,''DD-MON-YYYY'') "Holiday Date",',
'        ZWCLN_REF "Holiday Description"',
'        from zone_workday_calendar_hd,zone_workday_calendar_ln',
'        where zwchd_bu = zwcln_bu',
'        and zwchd_clndr_no = zwcln_clndr_no',
'        and zwchd_year = zwcln_year',
'        and zwchd_zone_id = zwcln_zone_id',
'        and zwchd_bu = :global_bu',
'        and zwchd_status =''A''',
'        and zwcln_holiday in (''H'',''B'')',
'        and zwchd_zone_id in (select emp_zone from employees ',
'                                    where emp_bu = :global_bu',
'                                        and emp_emp_id = :global_emp_id )',
'        and trunc(ZWCLN_DATE) between  trunc(sysdate,''year'') and trunc(add_months(trunc(sysdate,''year''),12)-1)',
'       order by 1 asc'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'NEVER'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6534766532292387503)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No Data Found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>390924502885866242
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335911638838840786)
,p_db_column_name=>'Holiday Date'
,p_display_order=>10
,p_column_identifier=>'C'
,p_column_label=>'Holiday Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335912104832840789)
,p_db_column_name=>'Holiday Description'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>'Holiday Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6534798143578776933)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'69894'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'Holiday Date:Holiday Description'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6202168312726379858)
,p_plug_name=>'Tabs'
,p_static_id=>'tabs'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_imp.id(10650524481825505371)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6165366092890751206)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6165366017561751205)
,p_button_name=>'back_1'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-arrow-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6202168465395379860)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6202168422141379859)
,p_button_name=>'back_1_1'
,p_static_id=>'back-2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-arrow-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6335912736355840790)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6534766469474387502)
,p_button_name=>'back'
,p_static_id=>'back-3'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-arrow-left'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6202169048341379866)
,p_name=>'P77_NEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6202168980933379865)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="text-align:end;">',
'    <span style="color:yellow;font-size:12px;" class="fa fa-square" aria-hidden="true"></span> - <b>Holiday</b>',
'    <span style="color:green;font-size:12px;" class="fa fa-square" aria-hidden="true"></span> - <b>Both Work Off &Holiday</b>',
'</div>'))
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>10
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_css_classes=>'CTS'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-left-lg'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'format', 'HTML_UNSAFE',
  'send_on_page_submit', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
