prompt --application/pages/page_00035
begin
--   Manifest
--     PAGE: 00035
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
 p_id=>35
,p_name=>'Events (WOP)'
,p_alias=>'EVENTS-WOP'
,p_step_title=>'Events (WOP)'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Region .t-Region-body {',
'    padding: 1px;',
'}',
'',
'',
'',
'#ANMT .t-MediaList--showIcons .t-MediaList-icon {',
'    width: 55px;',
'    height: 34px;',
'    background-color: #badbfb;',
'    color: #ffffff;',
'     color: inherit;',
'    display: flex;',
'    justify-content: center;',
'    border-radius: 7px;',
'}',
'',
'#DOB .u-colors > :nth-child(45n + 1) .u-color {',
'    background-color: #309fdb66;',
'    fill: #309FDB;',
'    color: #1d80d4;',
'    border-radius: 31px;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6182576467303825595)
,p_name=>'Announcement'
,p_static_id=>'announcement'
,p_region_name=>'ANMT'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody:margin-left-none:margin-right-none'
,p_component_template_options=>'t-MediaList--showIcons:t-MediaList--showDesc:t-MediaList--stack:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select GN_BU,',
'       GN_DOC_NO,',
'       GN_DOC_DATE ,',
'       ''fa fa-check'' icon_class, --''<span >''|| || ''</span>''   to_char(GN_DOC_DATE,''MON DD'') ',
'       GN_NOTI_HD list_title,',
'       GN_NOTI list_text,',
'       GN_NOTI_BY,',
'       GN_EFF_TO,',
'       GN_EFF_FROM,',
'       GN_DUE_DATE,',
'       GN_STATUS,',
'       GN_VISIBLITY,',
'       GN_CRE_BY,',
'       GN_CRE_IP_ADDR,',
'       GN_CRE_OS_USER,',
'       GN_CRE_DATE,',
'       GN_UPD_BY,',
'       GN_UPD_IP_ADDR,',
'       GN_UPD_OS_USER,',
'       GN_UPD_DATE,',
'       GN_CRE_EMP_ID,',
'       GN_UPD_EMP_ID,',
'       GN_ATTACH,',
'       GN_FILE_NAME,',
'       GN_MIME_TYPE',
'  from GROUP_NOTIFICATION',
'  --WHERE GN_BU = :global_bu'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6191426186316747068)
,p_query_column_id=>23
,p_column_alias=>'GN_ATTACH'
,p_column_display_sequence=>220
,p_column_heading=>'Gn Attach'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188305745087052697)
,p_query_column_id=>1
,p_column_alias=>'GN_BU'
,p_column_display_sequence=>10
,p_column_heading=>'Gn Bu'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6191425167128747058)
,p_query_column_id=>13
,p_column_alias=>'GN_CRE_BY'
,p_column_display_sequence=>120
,p_column_heading=>'Gn Cre By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6191425474021747061)
,p_query_column_id=>16
,p_column_alias=>'GN_CRE_DATE'
,p_column_display_sequence=>150
,p_column_heading=>'Gn Cre Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6191425974342747066)
,p_query_column_id=>21
,p_column_alias=>'GN_CRE_EMP_ID'
,p_column_display_sequence=>200
,p_column_heading=>'Gn Cre Emp Id'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6191425322959747059)
,p_query_column_id=>14
,p_column_alias=>'GN_CRE_IP_ADDR'
,p_column_display_sequence=>130
,p_column_heading=>'Gn Cre Ip Addr'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6191425356380747060)
,p_query_column_id=>15
,p_column_alias=>'GN_CRE_OS_USER'
,p_column_display_sequence=>140
,p_column_heading=>'Gn Cre Os User'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6191426927305747075)
,p_query_column_id=>3
,p_column_alias=>'GN_DOC_DATE'
,p_column_display_sequence=>280
,p_column_heading=>'Gn Doc Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188305918175052698)
,p_query_column_id=>2
,p_column_alias=>'GN_DOC_NO'
,p_column_display_sequence=>20
,p_column_heading=>'Gn Doc No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188306572279052705)
,p_query_column_id=>10
,p_column_alias=>'GN_DUE_DATE'
,p_column_display_sequence=>90
,p_column_heading=>'Gn Due Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188306503713052704)
,p_query_column_id=>9
,p_column_alias=>'GN_EFF_FROM'
,p_column_display_sequence=>80
,p_column_heading=>'Gn Eff From'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188306356012052703)
,p_query_column_id=>8
,p_column_alias=>'GN_EFF_TO'
,p_column_display_sequence=>70
,p_column_heading=>'Gn Eff To'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6191426323962747069)
,p_query_column_id=>24
,p_column_alias=>'GN_FILE_NAME'
,p_column_display_sequence=>230
,p_column_heading=>'Gn File Name'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6191426413149747070)
,p_query_column_id=>25
,p_column_alias=>'GN_MIME_TYPE'
,p_column_display_sequence=>240
,p_column_heading=>'Gn Mime Type'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188306292582052702)
,p_query_column_id=>7
,p_column_alias=>'GN_NOTI_BY'
,p_column_display_sequence=>60
,p_column_heading=>'Gn Noti By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188306684448052706)
,p_query_column_id=>11
,p_column_alias=>'GN_STATUS'
,p_column_display_sequence=>100
,p_column_heading=>'Gn Status'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6191425552876747062)
,p_query_column_id=>17
,p_column_alias=>'GN_UPD_BY'
,p_column_display_sequence=>160
,p_column_heading=>'Gn Upd By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6191425909816747065)
,p_query_column_id=>20
,p_column_alias=>'GN_UPD_DATE'
,p_column_display_sequence=>190
,p_column_heading=>'Gn Upd Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6191426109159747067)
,p_query_column_id=>22
,p_column_alias=>'GN_UPD_EMP_ID'
,p_column_display_sequence=>210
,p_column_heading=>'Gn Upd Emp Id'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6191425656409747063)
,p_query_column_id=>18
,p_column_alias=>'GN_UPD_IP_ADDR'
,p_column_display_sequence=>170
,p_column_heading=>'Gn Upd Ip Addr'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6191425831304747064)
,p_query_column_id=>19
,p_column_alias=>'GN_UPD_OS_USER'
,p_column_display_sequence=>180
,p_column_heading=>'Gn Upd Os User'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188306776456052707)
,p_query_column_id=>12
,p_column_alias=>'GN_VISIBLITY'
,p_column_display_sequence=>110
,p_column_heading=>'Gn Visiblity'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6191426672937747073)
,p_query_column_id=>4
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>270
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6191426534976747072)
,p_query_column_id=>6
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>260
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6191426517315747071)
,p_query_column_id=>5
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>250
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6191426830878747074)
,p_plug_name=>'Announcement'
,p_static_id=>'announcement-2'
,p_region_template_options=>'#DEFAULT#:margin-bottom-md'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>4
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<img src=#APP_IMAGES#loudspeaker.png alt="Img" width="50" height="50"> <span style = "font-size: 40px;"> Announcement</span>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7704776009499753860)
,p_plug_name=>'<b>Past Events</b>'
,p_static_id=>'b-past-events-b'
,p_parent_plug_id=>wwv_flow_imp.id(7704775262532753852)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_display_column=>6
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
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'ICON',
  'attribute_02', 'LABEL',
  'attribute_03', 'VALUE',
  'attribute_04', 'slide',
  'attribute_05', '#&ENAME.')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7704776467897753864)
,p_name=>'CARD'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'&nbsp;'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7704776385922753863)
,p_name=>'ICON'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Icon'
,p_display_sequence=>30
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7704776134434753861)
,p_name=>'LABEL'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Label'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7704776229777753862)
,p_name=>'VALUE'
,p_data_type=>'NUMBER'
,p_is_visible=>true
,p_heading=>'Value'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7704775321882753853)
,p_plug_name=>'<b>Upcoming Events</b>'
,p_static_id=>'b-upcoming-events-b'
,p_parent_plug_id=>wwv_flow_imp.id(7704775262532753852)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_display_column=>6
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
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'ICON',
  'attribute_02', 'LABEL',
  'attribute_03', 'VALUE',
  'attribute_04', 'slide',
  'attribute_05', '#&ENAME.')).to_clob
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7704775812537753858)
,p_name=>'CARD'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'&nbsp;'
,p_display_sequence=>40
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7704775721590753857)
,p_name=>'ICON'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Icon'
,p_display_sequence=>30
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7704775526473753855)
,p_name=>'LABEL'
,p_data_type=>'VARCHAR2'
,p_is_visible=>true
,p_heading=>'Label'
,p_display_sequence=>10
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7704775674165753856)
,p_name=>'VALUE'
,p_data_type=>'NUMBER'
,p_is_visible=>true
,p_heading=>'Value'
,p_display_sequence=>20
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6182576825798825598)
,p_name=>'Birthday'
,p_static_id=>'birthday'
,p_region_name=>'DOB'
,p_parent_plug_id=>wwv_flow_imp.id(6182576585192825596)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:u-colors:t-BadgeList--medium:t-BadgeList--dash:t-BadgeList--cols t-BadgeList--3cols:t-Report--hideNoPagination'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ''<table>',
'    <tr>',
'            <td><img src=#APP_IMAGES#cake.png alt="Img" width="50" height="50"></td>',
'            <td>''||''<div> <span style = "font-size: 40px;">''|| COUNT(emp_first_name1) || ''</span> </br>',
'	        <span style = "font-size: 20px; color: #262626;">''||''Birthday''||''</span>''||''</td>',
'        </tr>',
'        </table>'' "Birthday"',
'FROM',
'    employees',
'WHERE',
'        emp_bu = :global_bu',
'    AND to_char(trunc(emp_dob), ''MMDD'') = to_char(trunc(to_date(sysdate)), ''MMDD'')',
'ORDER BY',
'    to_char(emp_dob, ''DDMM'') ASC'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650529557729505378)
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
 p_id=>wwv_flow_imp.id(6182576851083825599)
,p_query_column_id=>1
,p_column_alias=>'Birthday'
,p_column_display_sequence=>10
,p_column_heading=>'&nbsp;'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7500925641498455329)
,p_plug_name=>'Body'
,p_static_id=>'body'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6182576585192825596)
,p_plug_name=>'Events'
,p_static_id=>'events'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7775303527089427529)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_parent_plug_id=>wwv_flow_imp.id(7500925641498455329)
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_plug_display_column=>5
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<center><b style="font-size:2.0em;color:#096640;">Events (WOP)</b><center>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12258579677595213687)
,p_plug_name=>'&P35_EMP_NAME.'
,p_static_id=>'p35-emp-name'
,p_parent_plug_id=>wwv_flow_imp.id(12258579606018213686)
,p_region_template_options=>'#DEFAULT#:t-HeroRegion--hideIcon'
,p_plug_template=>wwv_flow_imp.id(11196068840915939571)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6188303949714052679)
,p_name=>'Past Birthdays'
,p_static_id=>'past-birthdays'
,p_parent_plug_id=>wwv_flow_imp.id(6188301869740052658)
,p_template=>wwv_flow_imp.id(10650500665378505339)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--hideShowIconsMath:t-Region--controlsPosEnd:is-collapsed:t-Region--accent2:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--stack'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Upcoming Birthdays'' label,',
'       ''fa fa-birthday-cake''  ICON_CLASS,',
'       emp_first_name1||'' ''||'' ''||''(''||emp_emp_id||'')'' list_title,',
'       emp_emp_id,',
'       TO_CHAR (emp_dob, ''MONTH DD'') LIST_BADGE,',
'       (',
'        SELECT',
'            dept_name1',
'        FROM',
'            departments',
'        WHERE',
'                dept_bu = :global_bu',
'            AND dept_id = (',
'                SELECT',
'                    empai_dept_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) ||''-''||',
'    (',
'        SELECT',
'            hrpos_pos_name1',
'        FROM',
'            hr_positions',
'        WHERE',
'                hrpos_bu = :global_bu',
'            AND hrpos_pos_id = (',
'                SELECT',
'                    empai_pos_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) LIST_TEXT',
'  FROM employees',
' WHERE   EMP_BU = :global_bu',
'AND TO_CHAR (TRUNC (emp_dob), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 1),''MMDD'')'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>6
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188304379380052683)
,p_query_column_id=>4
,p_column_alias=>'EMP_EMP_ID'
,p_column_display_sequence=>40
,p_column_heading=>'Emp Emp Id'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188304218162052681)
,p_query_column_id=>2
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>20
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188304067629052680)
,p_query_column_id=>1
,p_column_alias=>'LABEL'
,p_column_display_sequence=>10
,p_column_heading=>'Label'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188304504876052684)
,p_query_column_id=>5
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>50
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188304554905052685)
,p_query_column_id=>6
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>60
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188304263021052682)
,p_query_column_id=>3
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6188301869740052658)
,p_plug_name=>'Past Events'
,p_static_id=>'past-events'
,p_parent_plug_id=>wwv_flow_imp.id(6182576585192825596)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<center><b style="font-size:19px;color:#096640;">Past Events</b><center>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6188302032919052660)
,p_name=>'Past Wedding Anniversary'
,p_static_id=>'past-wedding-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(6188301869740052658)
,p_template=>wwv_flow_imp.id(10650500665378505339)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--hideShowIconsMath:t-Region--controlsPosEnd:is-collapsed:t-Region--accent2:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--stack'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'       ''fa fa-user-heart'' ICON_CLASS,',
'       emp_first_name1||'' ''||'' ''||''(''||emp_emp_id||'')'' list_title,',
'       TO_CHAR (emp_dob, ''MONTH DD'') LIST_BADGE,',
'       (',
'        SELECT',
'            dept_name1',
'        FROM',
'            departments',
'        WHERE',
'                dept_bu = :global_bu',
'            AND dept_id = (',
'                SELECT',
'                    empai_dept_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) ||''-''||',
'    (',
'        SELECT',
'            hrpos_pos_name1',
'        FROM',
'            hr_positions',
'        WHERE',
'                hrpos_bu = :global_bu',
'            AND hrpos_pos_id = (',
'                SELECT',
'                    empai_pos_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) LIST_TEXT',
'  FROM employees',
' WHERE emp_bu = :global_bu',
'  AND TO_CHAR (TRUNC (emp_dom), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 1),''MMDD'')',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>6
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188304670612052686)
,p_query_column_id=>1
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>10
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188304840721052688)
,p_query_column_id=>3
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>30
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188305023184052689)
,p_query_column_id=>4
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188304817374052687)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6188302146115052661)
,p_name=>'Past Work Anniversary'
,p_static_id=>'past-work-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(6188301869740052658)
,p_template=>wwv_flow_imp.id(10650500665378505339)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--hideShowIconsMath:t-Region--controlsPosEnd:is-collapsed:t-Region--accent2:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ''fa fa-users''                              icon_class,',
'    emp_first_name1',
'    || '' ''',
'    || '' ''',
'    || ''(''',
'    || emp_emp_id',
'    || '')''                                     list_title,',
'    emp_start_date',
'    || '' (''',
'    || trunc((sysdate - emp_start_date) / 365)||'' ''||''Yrs.''||'')'' list_badge,',
'    (',
'        SELECT',
'            dept_name1',
'        FROM',
'            departments',
'        WHERE',
'                dept_bu = :global_bu',
'            AND dept_id = (',
'                SELECT',
'                    empai_dept_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = emp_emp_id',
'            )',
'    )',
'    || ''-''',
'    || (',
'        SELECT',
'            hrpos_pos_name1',
'        FROM',
'            hr_positions',
'        WHERE',
'                hrpos_bu = :global_bu',
'            AND hrpos_pos_id = (',
'                SELECT',
'                    empai_pos_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = emp_emp_id',
'            )',
'    )                                          list_text',
'FROM',
'    employees',
'WHERE',
'        emp_bu = :global_bu',
'    AND TRUNC ( (SYSDATE - emp_start_date) / 365) > 0',
'       AND TO_CHAR (emp_start_date, ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 7),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) - 1),''MMDD'')'))
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
 p_id=>wwv_flow_imp.id(6188305093603052690)
,p_query_column_id=>1
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>10
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188305323101052692)
,p_query_column_id=>3
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>30
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188305369682052693)
,p_query_column_id=>4
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188305217894052691)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12258579606018213686)
,p_plug_name=>'Profile'
,p_static_id=>'profile'
,p_region_name=>'PROFILE'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size720x480:margin-top-none:margin-bottom-none:margin-left-none'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7779394698091752824)
,p_plug_name=>'Today Birthday'
,p_static_id=>'today-birthday'
,p_parent_plug_id=>wwv_flow_imp.id(7500925641498455329)
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
 p_id=>wwv_flow_imp.id(7779394338238752821)
,p_name=>'Today Birthday'
,p_static_id=>'today-birthday-2'
,p_parent_plug_id=>wwv_flow_imp.id(7779394698091752824)
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
 p_id=>wwv_flow_imp.id(6188221751726581813)
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
 p_id=>wwv_flow_imp.id(7779483115420147038)
,p_plug_name=>'Today Birthday'
,p_static_id=>'today-birthday-3'
,p_parent_plug_id=>wwv_flow_imp.id(7779394698091752824)
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_display_column=>2
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
 p_id=>wwv_flow_imp.id(7779392077501752798)
,p_name=>'TodayWedding'
,p_static_id=>'todaywedding'
,p_parent_plug_id=>wwv_flow_imp.id(7779394840472752826)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--xxlarge:t-BadgeList--dash:t-BadgeList--stacked'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    COUNT(emp_first_name1) "Wedding Anniversary"',
'FROM',
'    employees',
'WHERE',
'        emp_bu = :global_bu',
'    AND to_char(trunc(emp_dom), ''MMDD'') = to_char(trunc(to_date(sysdate)), ''MMDD'')',
'ORDER BY',
'    to_char(emp_dom, ''DDMM'') ASC'))
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
 p_id=>wwv_flow_imp.id(6188222954383581816)
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
 p_id=>wwv_flow_imp.id(7779394994534752827)
,p_plug_name=>'TodayWedding'
,p_static_id=>'todaywedding-2'
,p_parent_plug_id=>wwv_flow_imp.id(7779394840472752826)
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
 p_id=>wwv_flow_imp.id(6182577529525825605)
,p_name=>'Upcoming Birthdays'
,p_static_id=>'upcoming-birthdays'
,p_parent_plug_id=>wwv_flow_imp.id(6182577335180825604)
,p_template=>wwv_flow_imp.id(10650500665378505339)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--hideShowIconsMath:t-Region--controlsPosEnd:is-collapsed:t-Region--accent1:t-Region--scrollBody:t-Form--large:margin-top-none:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--stack'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Upcoming Birthdays'' label,',
'       ''fa fa-birthday-cake''  ICON_CLASS,',
'       emp_first_name1||'' ''||'' ''||''(''||emp_emp_id||'')'' list_title,',
'       emp_emp_id,',
'       TO_CHAR (emp_dob, ''MONTH DD'') LIST_BADGE,',
'       (',
'        SELECT',
'            dept_name1',
'        FROM',
'            departments',
'        WHERE',
'                dept_bu = :global_bu',
'            AND dept_id = (',
'                SELECT',
'                    empai_dept_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) ||''-''||',
'    (',
'        SELECT',
'            hrpos_pos_name1',
'        FROM',
'            hr_positions',
'        WHERE',
'                hrpos_bu = :global_bu',
'            AND hrpos_pos_id = (',
'                SELECT',
'                    empai_pos_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) LIST_TEXT',
'  FROM employees',
' WHERE   EMP_BU = :global_bu',
'AND TO_CHAR (TRUNC (emp_dob), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE) + 1),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) + 7),''MMDD'')'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
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
 p_id=>wwv_flow_imp.id(6188302541178052665)
,p_query_column_id=>4
,p_column_alias=>'EMP_EMP_ID'
,p_column_display_sequence=>40
,p_column_heading=>'Emp Emp Id'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188302419648052663)
,p_query_column_id=>2
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>20
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188302245585052662)
,p_query_column_id=>1
,p_column_alias=>'LABEL'
,p_column_display_sequence=>10
,p_column_heading=>'Label'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188302842117052668)
,p_query_column_id=>5
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>60
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188303063000052670)
,p_query_column_id=>6
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>70
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188302738733052667)
,p_query_column_id=>3
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>50
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6182577335180825604)
,p_plug_name=>'Upcoming Events'
,p_static_id=>'upcoming-events'
,p_parent_plug_id=>wwv_flow_imp.id(6182576585192825596)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<center><b style="font-size:19px;color:#096640;">Upcoming Events</b></center>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7704775262532753852)
,p_plug_name=>'Upcoming Events'
,p_static_id=>'upcoming-events-2'
,p_parent_plug_id=>wwv_flow_imp.id(7500925641498455329)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6182577560703825606)
,p_name=>'Upcoming Wedding Anniversary'
,p_static_id=>'upcoming-wedding-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(6182577335180825604)
,p_template=>wwv_flow_imp.id(10650500665378505339)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--hideShowIconsMath:t-Region--controlsPosEnd:is-collapsed:t-Region--accent1:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--stack'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'       ''fa fa-user-heart'' ICON_CLASS,',
'       emp_first_name1||'' ''||'' ''||''(''||emp_emp_id||'')'' list_title,',
'       TO_CHAR (emp_dob, ''MONTH DD'') LIST_BADGE,',
'       (',
'        SELECT',
'            dept_name1',
'        FROM',
'            departments',
'        WHERE',
'                dept_bu = :global_bu',
'            AND dept_id = (',
'                SELECT',
'                    empai_dept_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) ||''-''||',
'    (',
'        SELECT',
'            hrpos_pos_name1',
'        FROM',
'            hr_positions',
'        WHERE',
'                hrpos_bu = :global_bu',
'            AND hrpos_pos_id = (',
'                SELECT',
'                    empai_pos_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) LIST_TEXT',
'  FROM employees',
' WHERE emp_bu = :global_bu',
'       AND TO_CHAR (TRUNC (emp_dom), ''MMDD'') BETWEEN TO_CHAR (TRUNC (TO_DATE (SYSDATE)+ 1),''MMDD'') AND TO_CHAR (TRUNC (TO_DATE (SYSDATE) + 7),''MMDD'')',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
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
 p_id=>wwv_flow_imp.id(6188303160777052671)
,p_query_column_id=>1
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>10
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188303332558052673)
,p_query_column_id=>3
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>30
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188303511651052674)
,p_query_column_id=>4
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188303261312052672)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6182577680880825607)
,p_name=>'Upcoming Work Anniversary'
,p_static_id=>'upcoming-work-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(6182577335180825604)
,p_template=>wwv_flow_imp.id(10650500665378505339)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--hideShowIconsMath:t-Region--controlsPosEnd:is-collapsed:t-Region--accent1:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#:t-MediaList--showBadges:u-colors:t-MediaList--stack'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ''fa fa-users''                              icon_class,',
'    emp_first_name1',
'    || '' ''',
'    || '' ''',
'    || ''(''',
'    || emp_emp_id',
'    || '')''                                     list_title,',
'    emp_start_date',
'    || '' (''',
'    || trunc((sysdate - emp_start_date) / 365)||'' ''||''Yrs.''||'')'' list_badge,',
'    (',
'        SELECT',
'            dept_name1',
'        FROM',
'            departments',
'        WHERE',
'                dept_bu = :global_bu',
'            AND dept_id = (',
'                SELECT',
'                    empai_dept_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = emp_emp_id',
'            )',
'    )',
'    || ''-''',
'    || (',
'        SELECT',
'            hrpos_pos_name1',
'        FROM',
'            hr_positions',
'        WHERE',
'                hrpos_bu = :global_bu',
'            AND hrpos_pos_id = (',
'                SELECT',
'                    empai_pos_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = emp_emp_id',
'            )',
'    )                                          list_text',
'FROM',
'    employees',
'WHERE',
'        emp_bu = :global_bu',
'    AND trunc((sysdate - emp_start_date) / 365) > 0',
'    AND to_char(emp_start_date, ''MMDD'') BETWEEN to_char(trunc(to_date(sysdate) + 1), ''MMDD'') AND to_char(trunc(to_date(sysdate) + 7),',
'    ''MMDD'')'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>6
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188303594035052675)
,p_query_column_id=>1
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>10
,p_column_heading=>'Icon Class'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188303745332052677)
,p_query_column_id=>3
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>30
,p_column_heading=>'List Badge'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188303892760052678)
,p_query_column_id=>4
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'List Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6188303645286052676)
,p_query_column_id=>2
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'List Title'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6182577024029825600)
,p_name=>'Wedding'
,p_static_id=>'wedding'
,p_parent_plug_id=>wwv_flow_imp.id(6182576585192825596)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:u-colors:t-BadgeList--large:t-BadgeList--dash:t-BadgeList--cols t-BadgeList--3cols:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ''<table>',
'    <tr>',
'            <td><img src=#APP_IMAGES#anniversary.png alt="Img" width="50" height="50"></td>',
'            <td>''||''<div> <span style = "font-size: 30px;">''|| COUNT(emp_first_name1) || ''</span> </br>',
'	        <span style = "font-size: 15px;">''||''Wedding Anniversary''||''</span>''||''</td>',
'        </tr>',
'        </table>'' "Wedding Anniversary"',
'FROM',
'    employees',
'WHERE',
'        emp_bu = :global_bu',
'    AND to_char(trunc(emp_dom), ''MMDD'') = to_char(trunc(to_date(sysdate)), ''MMDD'')',
'ORDER BY',
'    to_char(emp_dom, ''DDMM'') ASC'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650529557729505378)
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
 p_id=>wwv_flow_imp.id(6182577112361825601)
,p_query_column_id=>1
,p_column_alias=>'Wedding Anniversary'
,p_column_display_sequence=>10
,p_column_heading=>'&nbsp;'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7779394840472752826)
,p_plug_name=>'Wedding'
,p_static_id=>'wedding-2'
,p_parent_plug_id=>wwv_flow_imp.id(7500925641498455329)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7779448943894974885)
,p_plug_name=>'Work Anniversary'
,p_static_id=>'work-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(7500925641498455329)
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(10650527065007505375)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6182577148665825602)
,p_name=>'Working Anniversary'
,p_static_id=>'working-anniversary'
,p_parent_plug_id=>wwv_flow_imp.id(6182576585192825596)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:u-colors:t-BadgeList--large:t-BadgeList--dash:t-BadgeList--cols t-BadgeList--3cols:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ''<table>',
'    <tr>',
'            <td><img src=#APP_IMAGES#WorkAnniversary.png alt="Img" width="50" height="50"></td>',
'            <td>''||''<div> <span style = "font-size: 30px;">''|| COUNT(emp_first_name1) || ''</span> </br>',
'	        <span style = "font-size: 15px;">''||''Work Anniversary''||''</span>''||''</td>',
'        </tr>',
'        </table>'' "Work Anniversary"',
'FROM',
'    employees',
'WHERE',
'        emp_bu = :global_bu',
'    AND trunc((sysdate - emp_start_date) / 365) > 0',
'    AND to_char(emp_start_date, ''MMDD'') = to_char(sysdate, ''MMDD'')'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650529557729505378)
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
 p_id=>wwv_flow_imp.id(6182577310065825603)
,p_query_column_id=>1
,p_column_alias=>'Work Anniversary'
,p_column_display_sequence=>10
,p_column_heading=>'&nbsp;'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7779392987724752807)
,p_name=>'Working Anniversary'
,p_static_id=>'working-anniversary-2'
,p_parent_plug_id=>wwv_flow_imp.id(7779448943894974885)
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
 p_id=>wwv_flow_imp.id(6188224330643581817)
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
 p_id=>wwv_flow_imp.id(7779395310477752831)
,p_plug_name=>'Working Anniversary'
,p_static_id=>'working-anniversary-3'
,p_parent_plug_id=>wwv_flow_imp.id(7779448943894974885)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6188240541470581864)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12258579677595213687)
,p_button_name=>'Access'
,p_static_id=>'access'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Access Details'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6188240972070581866)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12258579677595213687)
,p_button_name=>'CHNG_PSW'
,p_static_id=>'chng-psw'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Change Password'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6188241346444581866)
,p_name=>'P35_NEW_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12258579677595213687)
,p_prompt=>'New'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6188244092380581877)
,p_name=>'Submit_Page'
,p_static_id=>'submit-page'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P35_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6188244552640581878)
,p_event_id=>wwv_flow_imp.id(6188244092380581877)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6188243708637581877)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Employee_Name'
,p_static_id=>'employee-name'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'BEGIN',
'   SELECT emp_first_name1',
'     INTO :p35_emp_name',
'     FROM employees',
'    WHERE emp_bu=:global_bu',
'      AND emp_emp_id = :global_emp_id;',
'    ',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>706281873093970849
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6188243325257581874)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Menu'
,p_static_id=>'menu'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :p35_search IS NOT NULL THEN',
'',
'DECLARE',
'   v_link   VARCHAR2 (200) := :p35_search;',
'   v_app_no NUMBER(5);',
'   v_node_type VARCHAR2(10);',
'BEGIN',
'',
'SELECT wbf_appl_no,wbf_node_type INTO v_app_no,v_node_type',
'FROM wapl_bus_fun',
'WHERE wbf_page_no=:p35_search;',
'',
'IF v_node_type =''RPT'' THEN ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':777:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:p35_search, 1));',
'   HTMLDB_APPLICATION.g_unrecoverable_error := TRUE;',
'',
'ELSE ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':106:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:p35_search, 1)',
'      || '',''',
'      || :app_session);',
'   HTMLDB_APPLICATION.g_unrecoverable_error := TRUE;',
'',
'END IF;',
'',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'Raise_Application_Error(-20999,''Application not defined for the Page.'');',
'   ',
'END;',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>706281489713970846
);
wwv_flow_imp.component_end;
end;
/
