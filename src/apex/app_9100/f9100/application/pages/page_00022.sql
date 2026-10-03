prompt --application/pages/page_00022
begin
--   Manifest
--     PAGE: 00022
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
 p_id=>22
,p_name=>'Events(Old)'
,p_alias=>'EVENTS-OLD'
,p_step_title=>'Events(Old)'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*BG*/',
'body {',
'    background: url(#APP_IMAGES#balloon1.jpg) no-repeat 50% 50%;',
'    color: #242424;',
'    font-weight: bolder;',
'}',
'.t-BadgeList--dash .t-BadgeList-label {',
'    font-size: 1.4rem;',
'    line-height: 2rem;',
'    font-weight: bolder;',
'}',
'/*BADGE*/',
'.a-DetailedContentList-badge {',
'    -webkit-text-overflow: ellipsis;',
'    -moz-text-overflow: ellipsis;',
'    -ms-text-overflow: ellipsis;',
'    -o-text-overflow: ellipsis;',
'    text-align: right;',
'    font-size: 15px;',
'    color: #004e61;',
'    white-space: nowrap;',
'    padding-right: 12px;',
'    width: 15%;',
'    font-weight: bolder;',
'}',
'.a-DetailedContentList-title {',
'    width: 90%;',
'    font-size: 14px;',
'    font-weight: 400;',
'    color: #404040;',
'    padding-left: 12px;',
'    font-weight: bolder;',
'}',
'body .a-DetailedContentList-icon {',
'    width: 1%;',
'    text-align: center;',
'    color: #004e61;',
'    padding-left: 12px;',
'    height: 40px;',
'    vertical-align: middle;',
'}',
'/*ANIM*/',
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'Y'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7284692858624128247)
,p_plug_name=>'<b>Past Events</b>'
,p_static_id=>'b-past-events-b'
,p_parent_plug_id=>wwv_flow_imp.id(7284692111657128239)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Past Birthdays'' label,',
'       COUNT (*) VALUE,',
'       ''fa-birthday-cake'' AS icon,',
'       listagg (emp_first_name1|| '' (''||emp_emp_id||'') : ''|| TO_CHAR (emp_dob, ''MON DD''),'' , '' || CHR (10)) WITHIN GROUP (ORDER BY 1)',
'        card',
'  FROM employees',
' WHERE emp_bu = :global_bu',
'       AND TO_CHAR (TRUNC (emp_dob), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 3),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 1),''MMDD'')',
'UNION ALL',
'SELECT ''Past Wedding Anniversary'' label,',
'       COUNT (*) VALUE,',
'       ''fa-user-heart'' AS icon,',
'       listagg (emp_first_name1|| '' (''|| emp_emp_id||'') : ''||TO_CHAR (emp_dob, ''MON DD''),'' , '' || CHR (10)) WITHIN GROUP (ORDER BY 1)',
'        card',
'  FROM employees',
' WHERE emp_bu = :global_bu',
'       AND TO_CHAR (TRUNC (emp_dom), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 3),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 1),''MMDD'')',
'UNION ALL',
'SELECT ''Past Work Anniversary'' label,',
'       COUNT (*) VALUE,',
'       ''fa-users'' AS icon,',
'       listagg (emp_first_name1||'' (''||emp_emp_id||'') : ''|| emp_start_date|| '' (''|| TRUNC ( (SYSDATE - emp_start_date) / 365)|| '' yrs)'','' , '' || CHR (10))WITHIN GROUP (ORDER BY 1)',
'       card',
'  FROM employees',
' WHERE emp_bu = :global_bu AND TRUNC ( (SYSDATE - emp_start_date) / 365) > 0',
'       AND TO_CHAR (emp_start_date, ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 3),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 1),''MMDD'')'))
,p_plug_source_type=>'PLUGIN_COM_ORACLE_APEX_SLIDETOOLTIP'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'ICON',
  'attribute_02', 'LABEL',
  'attribute_03', 'VALUE',
  'attribute_04', 'slide',
  'attribute_05', '#&ENAME.')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7284693317022128251)
,p_name=>'CARD'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'&nbsp;'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7284693235047128250)
,p_name=>'ICON'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Icon'
,p_display_sequence=>30
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7284692983559128248)
,p_name=>'LABEL'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Label'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7284693078902128249)
,p_name=>'VALUE'
,p_data_type=>'NUMBER'
,p_is_visible=>true
,p_heading=>'Value'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7284692171007128240)
,p_plug_name=>'<b>Upcoming Events</b>'
,p_static_id=>'b-upcoming-events-b'
,p_parent_plug_id=>wwv_flow_imp.id(7284692111657128239)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>6
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Upcoming Birthdays'' label,',
'       COUNT (*) VALUE,',
'       ''fa-birthday-cake'' AS icon,',
'       listagg (emp_first_name1|| '' (''||emp_emp_id||'') : ''|| TO_CHAR (emp_dob, ''MON DD''),'' , '' || CHR (10)) WITHIN GROUP (ORDER BY 1)',
'        card',
'  FROM employees',
' WHERE emp_bu = :global_bu',
'       AND TO_CHAR (TRUNC (emp_dob), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) + 1),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) + 3),''MMDD'')',
'UNION ALL',
'SELECT ''Upcoming Wedding Anniversary'' label,',
'       COUNT (*) VALUE,',
'       ''fa-user-heart'' AS icon,',
'       listagg (emp_first_name1|| '' (''|| emp_emp_id||'') : ''||TO_CHAR (emp_dob, ''MON DD''),'' , '' || CHR (10)) WITHIN GROUP (ORDER BY 1)',
'        card',
'  FROM employees',
' WHERE emp_bu = :global_bu',
'       AND TO_CHAR (TRUNC (emp_dom), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE)+ 1),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) + 3),''MMDD'')',
'UNION ALL',
'SELECT ''Upcoming Work Anniversary'' label,',
'       COUNT (*) VALUE,',
'       ''fa-users'' AS icon,',
'       listagg (emp_first_name1||'' (''||emp_emp_id||'') : ''|| emp_start_date|| '' (''|| TRUNC ( (SYSDATE - emp_start_date) / 365)|| '' yrs)'','' , '' || CHR (10))WITHIN GROUP (ORDER BY 1)',
'       card',
'  FROM employees',
' WHERE emp_bu = :global_bu AND TRUNC ( (SYSDATE - emp_start_date) / 365) > 0',
'       AND TO_CHAR (emp_start_date, ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE)+ 1),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) + 3),''MMDD'')'))
,p_plug_source_type=>'PLUGIN_COM_ORACLE_APEX_SLIDETOOLTIP'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'ICON',
  'attribute_02', 'LABEL',
  'attribute_03', 'VALUE',
  'attribute_04', 'slide',
  'attribute_05', '#&ENAME.')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7284692661662128245)
,p_name=>'CARD'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'&nbsp;'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7284692570715128244)
,p_name=>'ICON'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Icon'
,p_display_sequence=>30
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7284692375598128242)
,p_name=>'LABEL'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Label'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7284692523290128243)
,p_name=>'VALUE'
,p_data_type=>'NUMBER'
,p_is_visible=>true
,p_heading=>'Value'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7080842490622829716)
,p_plug_name=>'Body'
,p_static_id=>'body'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>80
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6986531385993011326)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>1010
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7355220376213801916)
,p_plug_name=>'New'
,p_static_id=>'new-2'
,p_parent_plug_id=>wwv_flow_imp.id(7080842490622829716)
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_plug_display_column=>5
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<center><b style="font-size:2.0em;color:#096640;">Events from this day</b><center>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7275290405933832964)
,p_plug_name=>'Overall'
,p_static_id=>'overall'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>1000
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'23=5'
,p_plug_display_when_cond2=>'SQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7386670372215187530)
,p_name=>'Recent Birthdays'
,p_static_id=>'recent-birthdays'
,p_parent_plug_id=>wwv_flow_imp.id(7275290405933832964)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--accent1:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Cards--compact:t-Cards--cols:t-Cards--colorize'
,p_grid_column_span=>4
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT EMP_FIRST_NAME1 || '' - '' || EMP_EMP_ID CARD_TITLE,',
'             to_char(EMP_DOB,''MON DD'') CARD_TEXT,',
'             NULL CARD_SUBTEXT',
'    FROM employees',
'   WHERE EMP_BU = :GLOBAL_BU --AND SE_EMP_STATUS = ''A''',
'         AND TO_CHAR (TRUNC (EMP_DOB), ''MMDD'')  BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE)- 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE)- 1),''MMDD'') ',
'ORDER BY to_char(EMP_DOB,''DDMM'') asc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>4
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Past Birthdays.'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_exp_filename=>'Upcoming'
,p_plug_query_exp_separator=>'|'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335780116030676409)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335779670742676407)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335779256230676407)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7386670762973187534)
,p_name=>'Recent Wedding Anniversary'
,p_static_id=>'recent-wedding-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(7275290405933832964)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#:t-Region--accent2:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Cards--compact:t-Cards--cols:t-Cards--colorize'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT  EMP_FIRST_NAME1|| '' - '' || EMP_EMP_ID CARD_TITLE,',
'             to_char(EMP_DOM,''MON DD'') CARD_TEXT,',
'             NULL CARD_SUBTEXT         ',
'    FROM employees',
'   WHERE EMP_BU = :GLOBAL_BU ',
'         AND TO_CHAR (TRUNC (EMP_DOM), ''MMDD'')  BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE)- 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE)- 1),''MMDD'') ',
'ORDER BY to_char(EMP_DOM,''DDMM'') asc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>4
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Past Wedding Anniversary.'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335783123889676414)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335782716852676414)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335782244174676412)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7398990505164728688)
,p_name=>'Recent Work Anniversary'
,p_static_id=>'recent-work-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(7275290405933832964)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>60
,p_region_template_options=>'#DEFAULT#:t-Region--accent5:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Cards--compact:t-Cards--cols:t-Cards--colorize'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_start_date || '' ('' || TRUNC ( (SYSDATE - emp_start_date) / 365) || '' yrs)'' CARD_TEXT, ',
'       EMP_FIRST_NAME1 || '' - '' || EMP_EMP_ID CARD_TITLE,',
'       NULL CARD_SUBTEXT',
'  FROM employees',
' WHERE     EMP_BU = :GLOBAL_BU',
'       AND TRUNC ( (SYSDATE - emp_start_date) / 365) > 0',
'       AND TO_CHAR (emp_start_date, ''MMDD'')   BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE)- 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE)- 1),''MMDD'') ',
'ORDER BY TRUNC ( (SYSDATE - emp_start_date) / 365) asc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>4
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Past Work Anniversary.'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335784193731676415)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335783776693676415)
,p_query_column_id=>1
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>1
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335784591633676417)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>2
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7359311547216127211)
,p_plug_name=>'Today Birthday'
,p_static_id=>'today-birthday'
,p_parent_plug_id=>wwv_flow_imp.id(7080842490622829716)
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(10650527065007505375)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7359311187363127208)
,p_name=>'Today Birthday'
,p_static_id=>'today-birthday-2'
,p_parent_plug_id=>wwv_flow_imp.id(7359311547216127211)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--xxlarge:t-BadgeList--dash:t-BadgeList--stacked'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT   count(EMP_FIRST_NAME1 )     "Birthday"    ',
'    FROM employees',
'   WHERE EMP_BU = :GLOBAL_BU ',
'         AND TO_CHAR (TRUNC (EMP_DOB), ''MMDD'')  = TO_CHAR (',
'                                                         TRUNC (',
'                                                            TO_DATE (SYSDATE)),',
'                                                         ''MMDD'')',
'ORDER BY to_char(EMP_DOB,''DDMM'') asc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650529557729505378)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335772408706676386)
,p_query_column_id=>1
,p_column_alias=>'Birthday'
,p_column_display_sequence=>1
,p_column_heading=>'Birthday'
,p_column_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::'
,p_column_linktext=>'#Birthday#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7359399964544521425)
,p_plug_name=>'Today Birthday'
,p_static_id=>'today-birthday-3'
,p_parent_plug_id=>wwv_flow_imp.id(7359311547216127211)
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT   EMP_FIRST_NAME1 || '' - '' || EMP_EMP_ID     CARD_TITLE    ',
'    FROM employees',
'   WHERE EMP_BU = :GLOBAL_BU ',
'         AND TO_CHAR (TRUNC (EMP_DOB), ''MMDD'')  = TO_CHAR (',
'                                                         TRUNC (',
'                                                            TO_DATE (SYSDATE)),',
'                                                         ''MMDD'')',
'ORDER BY to_char(EMP_DOB,''DDMM'') asc'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_num_rows=>5
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_column', 'CARD_TITLE')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7359308926626127185)
,p_name=>'TodayWedding'
,p_static_id=>'todaywedding'
,p_parent_plug_id=>wwv_flow_imp.id(7359311689597127213)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--xxlarge:t-BadgeList--dash:t-BadgeList--stacked'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT  count(EMP_FIRST_NAME1 )  "Wedding Anniversary"       ',
'    FROM employees',
'   WHERE EMP_BU = :GLOBAL_BU ',
'         AND TO_CHAR (TRUNC (EMP_DOM), ''MMDD'')  = TO_CHAR (',
'                                                         TRUNC (',
'                                                            TO_DATE (SYSDATE)),',
'                                                         ''MMDD'')',
'ORDER BY to_char(EMP_DOM,''DDMM'') asc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650529557729505378)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No Data Found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335775022925676396)
,p_query_column_id=>1
,p_column_alias=>'Wedding Anniversary'
,p_column_display_sequence=>1
,p_column_heading=>'Wedding anniversary'
,p_column_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::'
,p_column_linktext=>'#Wedding Anniversary#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7359311843659127214)
,p_plug_name=>'TodayWedding'
,p_static_id=>'todaywedding-2'
,p_parent_plug_id=>wwv_flow_imp.id(7359311689597127213)
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT  EMP_FIRST_NAME1  || '' - ''  || EMP_EMP_ID   EMP_FIRST_NAME1   ',
'    FROM employees',
'   WHERE EMP_BU = :GLOBAL_BU ',
'         AND TO_CHAR (TRUNC (EMP_DOM), ''MMDD'')  = TO_CHAR (',
'                                                         TRUNC (',
'                                                            TO_DATE (SYSDATE)),',
'                                                         ''MMDD'')',
'ORDER BY to_char(EMP_DOM,''DDMM'') asc'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_num_rows=>5
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_column', 'EMP_FIRST_NAME1')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7275289949644832960)
,p_name=>'Upcoming Birthdays'
,p_static_id=>'upcoming-birthdays'
,p_parent_plug_id=>wwv_flow_imp.id(7275290405933832964)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--showIcon:t-Region--accent1:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Cards--compact:t-Cards--5cols:t-Cards--animColorFill'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT EMP_FIRST_NAME1 || '' - '' || EMP_EMP_ID CARD_TITLE,',
'             to_char(EMP_DOB,''MON DD'') CARD_TEXT,',
'             NULL CARD_SUBTEXT',
'    FROM employees',
'   WHERE EMP_BU = :GLOBAL_BU --AND SE_EMP_STATUS = ''A''',
'         AND TO_CHAR (TRUNC (EMP_DOB), ''MMDD'') BETWEEN TO_CHAR (',
'                                                         TRUNC (',
'                                                            TO_DATE (SYSDATE) + 1),',
'                                                         ''MMDD'')',
'                                                  AND TO_CHAR (',
'                                                         TRUNC (',
'                                                            TO_DATE (SYSDATE)+ 7),',
'                                                         ''MMDD'')',
'ORDER BY to_char(EMP_DOB,''DDMM'') asc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Upcoming Birthdays.'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_exp_filename=>'Upcoming'
,p_plug_query_exp_separator=>'|'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335777052325676403)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335776697174676403)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335776321189676401)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7284692111657128239)
,p_plug_name=>'Upcoming Events'
,p_static_id=>'upcoming-events'
,p_parent_plug_id=>wwv_flow_imp.id(7080842490622829716)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7359309221417127188)
,p_name=>'Upcoming Wedding Anniversary'
,p_static_id=>'upcoming-wedding-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(7275290405933832964)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--accent2:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Cards--compact:t-Cards--cols:t-Cards--colorize'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT  EMP_FIRST_NAME1|| '' - '' || EMP_EMP_ID CARD_TITLE,',
'             to_char(EMP_DOM,''MON DD'') CARD_TEXT,',
'             NULL CARD_SUBTEXT         ',
'    FROM employees',
'   WHERE EMP_BU = :GLOBAL_BU ',
'         AND TO_CHAR (TRUNC (EMP_DOM), ''MMDD'') BETWEEN TO_CHAR (',
'                                                         TRUNC (',
'                                                            TO_DATE (SYSDATE) + 1),',
'                                                         ''MMDD'')',
'                                                  AND TO_CHAR (',
'                                                         TRUNC (',
'                                                            TO_DATE (SYSDATE)+ 7),',
'                                                         ''MMDD'')',
'ORDER BY to_char(EMP_DOM,''DDMM'') asc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>4
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Upcoming Wedding Anniversary.'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335781612943676412)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335781195107676411)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335780808329676411)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7359310156345127198)
,p_name=>'Upcoming Work Anniversary'
,p_static_id=>'upcoming-work-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(7275290405933832964)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--accent5:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Cards--compact:t-Cards--cols:t-Cards--colorize'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_start_date || '' ('' || TRUNC ( (SYSDATE - emp_start_date) / 365) || '' yrs)'' CARD_TEXT, ',
'       EMP_FIRST_NAME1 || '' - '' || EMP_EMP_ID CARD_TITLE,',
'       NULL CARD_SUBTEXT',
'  FROM employees',
' WHERE     EMP_BU = :GLOBAL_BU',
'       AND TRUNC ( (SYSDATE - emp_start_date) / 365) > 0',
'       AND TO_CHAR (emp_start_date, ''MMDD'')  BETWEEN TO_CHAR (',
'                                                         TRUNC (',
'                                                            TO_DATE (SYSDATE) + 1),',
'                                                         ''MMDD'')',
'                                                  AND TO_CHAR (',
'                                                         TRUNC (',
'                                                            TO_DATE (SYSDATE)+ 7),',
'                                                         ''MMDD'')',
'ORDER BY TRUNC ( (SYSDATE - emp_start_date) / 365) asc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>4
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Upcoming Work Anniversary.'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335778565301676406)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335777749445676404)
,p_query_column_id=>1
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>1
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335778136333676404)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>2
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7359311689597127213)
,p_plug_name=>'Wedding'
,p_static_id=>'wedding'
,p_parent_plug_id=>wwv_flow_imp.id(7080842490622829716)
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(10650527065007505375)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7359365793019349272)
,p_plug_name=>'Work Anniversary'
,p_static_id=>'work-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(7080842490622829716)
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(10650527065007505375)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7359309836849127194)
,p_name=>'Working Anniversary'
,p_static_id=>'working-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(7359365793019349272)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--xxlarge:t-BadgeList--dash:t-BadgeList--stacked'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT count(EMP_FIRST_NAME1) "Work Anniversary"',
'  FROM employees',
' WHERE     EMP_BU = :GLOBAL_BU',
'       AND TRUNC ( (SYSDATE - emp_start_date) / 365) > 0',
'       AND TO_CHAR (emp_start_date, ''MMDD'') = TO_CHAR (SYSDATE, ''MMDD'')',
'--ORDER BY to_char(EMP_DOM,''DDMM'') asc'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650529557729505378)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No Data Found.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335773661263676392)
,p_query_column_id=>1
,p_column_alias=>'Work Anniversary'
,p_column_display_sequence=>1
,p_column_heading=>'Work anniversary'
,p_column_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::'
,p_column_linktext=>'#Work Anniversary#'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7359312159602127218)
,p_plug_name=>'Working Anniversary'
,p_static_id=>'working-anniversary-2'
,p_parent_plug_id=>wwv_flow_imp.id(7359365793019349272)
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_first_name1 || '' - '' || emp_emp_id || ''('' || yrs || '' Yrs)'' name',
'  FROM (SELECT emp_first_name1,',
'               TRUNC ( (SYSDATE - emp_start_date) / 365) yrs,',
'               emp_emp_id',
'          FROM employees',
'         WHERE emp_bu = :global_bu',
'               AND TRUNC ( (SYSDATE - emp_start_date) / 365) > 0',
'               AND TO_CHAR (emp_start_date, ''MMDD'') = TO_CHAR (SYSDATE, ''MMDD''))'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_num_rows=>5
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_column', 'NAME')).to_clob
);
wwv_flow_imp.component_end;
end;
/
