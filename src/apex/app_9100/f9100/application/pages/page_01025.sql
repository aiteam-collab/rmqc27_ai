prompt --application/pages/page_01025
begin
--   Manifest
--     PAGE: 01025
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
 p_id=>1025
,p_name=>'Today Events'
,p_alias=>'TODAY-EVENTS'
,p_step_title=>'Today Events'
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
 p_id=>wwv_flow_imp.id(6773907816223051850)
,p_plug_name=>'<b>Past Events</b>'
,p_static_id=>'b-past-events-b'
,p_parent_plug_id=>wwv_flow_imp.id(6773907069256051842)
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
'       AND TO_CHAR (TRUNC (emp_dob), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 1),''MMDD'')',
'UNION ALL',
'SELECT ''Past Wedding Anniversary'' label,',
'       COUNT (*) VALUE,',
'       ''fa-user-heart'' AS icon,',
'       listagg (emp_first_name1|| '' (''|| emp_emp_id||'') : ''||TO_CHAR (emp_dob, ''MON DD''),'' , '' || CHR (10)) WITHIN GROUP (ORDER BY 1)',
'        card',
'  FROM employees',
' WHERE emp_bu = :global_bu',
'       AND TO_CHAR (TRUNC (emp_dom), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 1),''MMDD'')',
'UNION ALL',
'SELECT ''Past Work Anniversary'' label,',
'       COUNT (*) VALUE,',
'       ''fa-users'' AS icon,',
'       listagg (emp_first_name1||'' (''||emp_emp_id||'') : ''|| emp_start_date|| '' (''|| TRUNC ( (SYSDATE - emp_start_date) / 365)|| '' yrs)'','' , '' || CHR (10))WITHIN GROUP (ORDER BY 1)',
'       card',
'  FROM employees',
' WHERE emp_bu = :global_bu AND TRUNC ( (SYSDATE - emp_start_date) / 365) > 0',
'       AND TO_CHAR (emp_start_date, ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 1),''MMDD'')'))
,p_plug_source_type=>'PLUGIN_COM_ORACLE_APEX_SLIDETOOLTIP'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'ICON',
  'attribute_02', 'LABEL',
  'attribute_03', 'VALUE',
  'attribute_04', 'slide',
  'attribute_05', '#&ENAME.')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6773908274621051854)
,p_name=>'CARD'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'&nbsp;'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6773908192646051853)
,p_name=>'ICON'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Icon'
,p_display_sequence=>30
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6773907941158051851)
,p_name=>'LABEL'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Label'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6773908036501051852)
,p_name=>'VALUE'
,p_data_type=>'NUMBER'
,p_is_visible=>true
,p_heading=>'Value'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6773907128606051843)
,p_plug_name=>'<b>Upcoming Events</b>'
,p_static_id=>'b-upcoming-events-b'
,p_parent_plug_id=>wwv_flow_imp.id(6773907069256051842)
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
'       AND TO_CHAR (TRUNC (emp_dob), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) + 1),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) + 7),''MMDD'')',
'UNION ALL',
'SELECT ''Upcoming Wedding Anniversary'' label,',
'       COUNT (*) VALUE,',
'       ''fa-user-heart'' AS icon,',
'       listagg (emp_first_name1|| '' (''|| emp_emp_id||'') : ''||TO_CHAR (emp_dob, ''MON DD''),'' , '' || CHR (10)) WITHIN GROUP (ORDER BY 1)',
'        card',
'  FROM employees',
' WHERE emp_bu = :global_bu',
'       AND TO_CHAR (TRUNC (emp_dom), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE)+ 1),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) + 7),''MMDD'')',
'UNION ALL',
'SELECT ''Upcoming Work Anniversary'' label,',
'       COUNT (*) VALUE,',
'       ''fa-users'' AS icon,',
'       listagg (emp_first_name1||'' (''||emp_emp_id||'') : ''|| emp_start_date|| '' (''|| TRUNC ( (SYSDATE - emp_start_date) / 365)|| '' yrs)'','' , '' || CHR (10))WITHIN GROUP (ORDER BY 1)',
'       card',
'  FROM employees',
' WHERE emp_bu = :global_bu AND TRUNC ( (SYSDATE - emp_start_date) / 365) > 0',
'       AND TO_CHAR (emp_start_date, ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE)+ 1),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) + 7),''MMDD'')'))
,p_plug_source_type=>'PLUGIN_COM_ORACLE_APEX_SLIDETOOLTIP'
,p_plug_query_headings_type=>'COLON_DELMITED_LIST'
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'ICON',
  'attribute_02', 'LABEL',
  'attribute_03', 'VALUE',
  'attribute_04', 'slide',
  'attribute_05', '#&ENAME.')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6773907619261051848)
,p_name=>'CARD'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'&nbsp;'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6773907528314051847)
,p_name=>'ICON'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Icon'
,p_display_sequence=>30
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6773907333197051845)
,p_name=>'LABEL'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Label'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6773907480889051846)
,p_name=>'VALUE'
,p_data_type=>'NUMBER'
,p_is_visible=>true
,p_heading=>'Value'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6542461168659954279)
,p_name=>'Birthdays'
,p_static_id=>'birthdays'
,p_parent_plug_id=>wwv_flow_imp.id(6542462007013954288)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  emp_first_name1|| '' (''|| emp_emp_id|| '') '' name,TO_CHAR (emp_dob, ''MON - DD'') dob',
'  FROM employees',
' WHERE emp_bu = :global_bu',
'       AND TO_CHAR (TRUNC (emp_dob), ''MMDD'') BETWEEN TO_CHAR (',
'                                                        TRUNC (',
'                                                           TO_DATE (SYSDATE)',
'                                                           + 1),',
'                                                        ''MMDD'')',
'                                                 AND TO_CHAR (',
'                                                        TRUNC (',
'                                                           TO_DATE (SYSDATE)',
'                                                           + 7),',
'                                                        ''MMDD'')'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335801482345682553)
,p_query_column_id=>2
,p_column_alias=>'DOB'
,p_column_display_sequence=>2
,p_column_heading=>'Day'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335801098283682551)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Name'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6542462860909954296)
,p_name=>'Birthdays'
,p_static_id=>'birthdays-2'
,p_parent_plug_id=>wwv_flow_imp.id(6542462786200954295)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  emp_first_name1|| '' (''|| emp_emp_id|| '') '' name,TO_CHAR (emp_dob, ''MON - DD'') dob',
' FROM employees',
' WHERE emp_bu = :global_bu',
'       AND TO_CHAR (TRUNC (emp_dob), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 1),''MMDD'')'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335805414340682561)
,p_query_column_id=>2
,p_column_alias=>'DOB'
,p_column_display_sequence=>2
,p_column_heading=>'Day'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335804976289682561)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Name'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6570057448221753319)
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
 p_id=>wwv_flow_imp.id(6844435333812725519)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_parent_plug_id=>wwv_flow_imp.id(6570057448221753319)
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_plug_display_column=>5
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<center><b style="font-size:2.0em;color:#096640;">Events</b><center>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6764505363532756567)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6542461078261954278)
,p_plug_name=>'Past Events'
,p_static_id=>'past-events'
,p_parent_plug_id=>wwv_flow_imp.id(6773907069256051842)
,p_icon_css_classes=>'fa-calendar-clock'
,p_region_template_options=>'#DEFAULT#:t-Region--showIcon:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6542462786200954295)
,p_plug_name=>'Past Tab'
,p_static_id=>'past-tab'
,p_parent_plug_id=>wwv_flow_imp.id(6542461078261954278)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_imp.id(10650524481825505371)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6875885329814111133)
,p_name=>'Recent Birthdays'
,p_static_id=>'recent-birthdays'
,p_parent_plug_id=>wwv_flow_imp.id(6764505363532756567)
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
 p_id=>wwv_flow_imp.id(6335794888387682536)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335794488533682536)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335794061522682536)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6875885720572111137)
,p_name=>'Recent Wedding Anniversary'
,p_static_id=>'recent-wedding-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(6764505363532756567)
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
 p_id=>wwv_flow_imp.id(6335796426537682539)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335796024845682539)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335795594309682537)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6888205462763652291)
,p_name=>'Recent Work Anniversary'
,p_static_id=>'recent-work-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(6764505363532756567)
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
 p_id=>wwv_flow_imp.id(6335797914709682542)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335797104183682540)
,p_query_column_id=>1
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>1
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335797500665682542)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>2
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6848526504815050814)
,p_plug_name=>'Today Birthday'
,p_static_id=>'today-birthday'
,p_parent_plug_id=>wwv_flow_imp.id(6570057448221753319)
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
 p_id=>wwv_flow_imp.id(6848526144962050811)
,p_name=>'Today Birthday'
,p_static_id=>'today-birthday-2'
,p_parent_plug_id=>wwv_flow_imp.id(6848526504815050814)
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
 p_id=>wwv_flow_imp.id(6335812675800682578)
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
 p_id=>wwv_flow_imp.id(6848614922143445028)
,p_plug_name=>'Today Birthday'
,p_static_id=>'today-birthday-3'
,p_parent_plug_id=>wwv_flow_imp.id(6848526504815050814)
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
'ORDER BY EMP_FIRST_NAME1 asc /*to_char(EMP_DOB,''DDMM'') asc*/'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_num_rows=>5
,p_plug_query_no_data_found=>'&nbsp;'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_column', 'CARD_TITLE')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6848523884225050788)
,p_name=>'TodayWedding'
,p_static_id=>'todaywedding'
,p_parent_plug_id=>wwv_flow_imp.id(6848526647196050816)
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
 p_id=>wwv_flow_imp.id(6335814283998682582)
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
 p_id=>wwv_flow_imp.id(6848526801258050817)
,p_plug_name=>'TodayWedding'
,p_static_id=>'todaywedding-2'
,p_parent_plug_id=>wwv_flow_imp.id(6848526647196050816)
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
'ORDER BY EMP_FIRST_NAME1 /*to_char(EMP_DOM,''DDMM'') asc*/'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_num_rows=>5
,p_plug_query_no_data_found=>'&nbsp;'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_column', 'EMP_FIRST_NAME1')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6764504907243756563)
,p_name=>'Upcoming Birthdays'
,p_static_id=>'upcoming-birthdays'
,p_parent_plug_id=>wwv_flow_imp.id(6764505363532756567)
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
 p_id=>wwv_flow_imp.id(6335791915294682531)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335791498634682529)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335791107811682529)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6773907069256051842)
,p_plug_name=>'Upcoming Events'
,p_static_id=>'upcoming-events'
,p_parent_plug_id=>wwv_flow_imp.id(6570057448221753319)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6542460897841954277)
,p_plug_name=>'Upcoming Events'
,p_static_id=>'upcoming-events-2'
,p_parent_plug_id=>wwv_flow_imp.id(6773907069256051842)
,p_icon_css_classes=>'fa-calendar-o'
,p_region_template_options=>'#DEFAULT#:t-Region--showIcon:t-Region--scrollBody'
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
 p_id=>wwv_flow_imp.id(6542462007013954288)
,p_plug_name=>'Upcoming Tab'
,p_static_id=>'upcoming-tab'
,p_parent_plug_id=>wwv_flow_imp.id(6542460897841954277)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_imp.id(10650524481825505371)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6848524179016050791)
,p_name=>'Upcoming Wedding Anniversary'
,p_static_id=>'upcoming-wedding-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(6764505363532756567)
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
 p_id=>wwv_flow_imp.id(6335793402339682534)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335793022489682534)
,p_query_column_id=>2
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>2
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335792597082682532)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6848525113944050801)
,p_name=>'Upcoming Work Anniversary'
,p_static_id=>'upcoming-work-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(6764505363532756567)
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
 p_id=>wwv_flow_imp.id(6335790333676682526)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>3
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335789561185682525)
,p_query_column_id=>1
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>1
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335789945319682526)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>2
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6848526647196050816)
,p_plug_name=>'Wedding'
,p_static_id=>'wedding'
,p_parent_plug_id=>wwv_flow_imp.id(6570057448221753319)
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6542461225526954280)
,p_name=>'Wedding Anniversary'
,p_static_id=>'wedding-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(6542462007013954288)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  emp_first_name1|| '' (''|| emp_emp_id|| '') '' name,TO_CHAR (emp_dob, ''MON - DD'') day',
'  FROM employees',
' WHERE emp_bu = :global_bu',
'       AND TO_CHAR (TRUNC (emp_dom), ''MMDD'') BETWEEN TO_CHAR (',
'                                                        TRUNC (',
'                                                           TO_DATE (SYSDATE)',
'                                                           + 1),',
'                                                        ''MMDD'')',
'                                                 AND TO_CHAR (',
'                                                        TRUNC (',
'                                                           TO_DATE (SYSDATE)',
'                                                           + 7),',
'                                                        ''MMDD'')'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335802603725682556)
,p_query_column_id=>2
,p_column_alias=>'DAY'
,p_column_display_sequence=>2
,p_column_heading=>'Day'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335802154519682554)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Name'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6542463162232954299)
,p_name=>'Wedding Anniversary'
,p_static_id=>'wedding-anniversary-2'
,p_parent_plug_id=>wwv_flow_imp.id(6542462786200954295)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  emp_first_name1|| '' (''|| emp_emp_id|| '') '' name,TO_CHAR (emp_dob, ''MON - DD'') day',
'  FROM employees',
' WHERE emp_bu = :global_bu',
'       AND TO_CHAR (TRUNC (emp_dom), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 1),''MMDD'')'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335806458589682564)
,p_query_column_id=>2
,p_column_alias=>'DAY'
,p_column_display_sequence=>2
,p_column_heading=>'Day'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335806080039682564)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Name'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6542461461397954282)
,p_name=>'Work Anniversary'
,p_static_id=>'work-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(6542462007013954288)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>60
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_first_name1|| '' (''|| emp_emp_id|| '') '' name,TO_CHAR (emp_dob, ''MON - DD'') day',
'  FROM employees',
' WHERE emp_bu = :global_bu AND TRUNC ( (SYSDATE - emp_start_date) / 365) > 0',
'       AND TO_CHAR (emp_start_date, ''MMDD'') BETWEEN TO_CHAR (',
'                                                       TRUNC (',
'                                                          TO_DATE (SYSDATE)',
'                                                          + 1),',
'                                                       ''MMDD'')',
'                                                AND TO_CHAR (',
'                                                       TRUNC (',
'                                                          TO_DATE (SYSDATE)',
'                                                          + 7),',
'                                                       ''MMDD'')'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335803633499682557)
,p_query_column_id=>2
,p_column_alias=>'DAY'
,p_column_display_sequence=>2
,p_column_heading=>'Day'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335803277256682557)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Name'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6542463443656954302)
,p_name=>'Work Anniversary'
,p_static_id=>'work-anniversary-2'
,p_parent_plug_id=>wwv_flow_imp.id(6542462786200954295)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_first_name1|| '' (''|| emp_emp_id|| '') '' name,TO_CHAR (emp_dob, ''MON - DD'') day',
'  FROM employees',
' WHERE emp_bu = :global_bu AND TRUNC ( (SYSDATE - emp_start_date) / 365) > 0',
'       AND TO_CHAR (emp_start_date, ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 1),''MMDD'')'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335807618340682567)
,p_query_column_id=>2
,p_column_alias=>'DAY'
,p_column_display_sequence=>2
,p_column_heading=>'Day'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6335807145638682567)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>1
,p_column_heading=>'Name'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6848580750618272875)
,p_plug_name=>'Work Anniversary'
,p_static_id=>'work-anniversary-3'
,p_parent_plug_id=>wwv_flow_imp.id(6570057448221753319)
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
 p_id=>wwv_flow_imp.id(6848524794448050797)
,p_name=>'Working Anniversary'
,p_static_id=>'working-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(6848580750618272875)
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
 p_id=>wwv_flow_imp.id(6335799465946682548)
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
 p_id=>wwv_flow_imp.id(6848527117201050821)
,p_plug_name=>'Working Anniversary'
,p_static_id=>'working-anniversary-2'
,p_parent_plug_id=>wwv_flow_imp.id(6848580750618272875)
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
'               AND TO_CHAR (emp_start_date, ''MMDD'') = TO_CHAR (SYSDATE, ''MMDD''))',
'               order by EMP_FIRST_NAME1  asc'))
,p_plug_source_type=>'NATIVE_JQM_LIST_VIEW'
,p_plug_query_num_rows=>5
,p_plug_query_no_data_found=>'&nbsp;'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_column', 'NAME')).to_clob
);
wwv_flow_imp.component_end;
end;
/
