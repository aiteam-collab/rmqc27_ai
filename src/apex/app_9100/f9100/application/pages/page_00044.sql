prompt --application/pages/page_00044
begin
--   Manifest
--     PAGE: 00044
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
 p_id=>44
,p_name=>'Holiday Details'
,p_alias=>'PAYROLL-CALENDAR'
,p_step_title=>'Holiday Details'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#Z1',
'{',
'    margin-left :300px;',
'    margin-right:300px;',
'',
'}',
'',
'#Z1 .a-IRR-table tr td:first-child, .a-IRR-table tr th:first-child {',
'           box-shadow: none;',
'           width: 10px;',
'           }',
'#Z1 .a-IRR-table tr td:last-child, .a-IRR-table tr th:last-child {',
'           box-shadow: none;',
'           width: 10px;',
'           }',
'',
'#WL',
'{',
'    margin-left :50px;',
'    margin-right:50px;',
'',
'}',
'',
'',
'#CL',
'{',
'    margin-left :300px;',
'    margin-right:300px;',
'}',
'',
'#CL .a-IRR-table tr td:first-child, .a-IRR-table tr th:first-child {',
'           box-shadow: none;',
'           width: 10px;',
'           }',
'',
'',
'.a-IG-controls-cell, .a-IRR-controls-cell {',
'    display: none;',
'}',
'',
'.a-IRR-headerLink, .a-IRR-headerLink:hover {',
'    text-decoration: none;',
'    background: linear-gradient(90deg,#1c53a3,#1c53a3) !important;',
'    font-family: Arial !important;',
'    color: white !important;',
'}',
'/*',
'.a-IRR-headerLink {',
'    background: #8ab6aa !important;',
'    color: black;',
'}*/',
'',
'#price1 .a-IRR-header {',
'    --a-gv-header-cell-border-color: #e6e6e6;',
'    background-color: #8ab6aa;',
'    border-top: 1px solid #e6e6e6;',
'    color: rgba(0, 0, 0, 0.95);',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19919885323937262036)
,p_plug_name=>'Calendar HD'
,p_static_id=>'calendar-hd'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ROWID,',
'       ZWCHD_BU,',
'       ZWCHD_PLNT,',
'       ZWCHD_CLNDR_NO,',
'       ZWCHD_ZONE_ID,',
'       (SELECT hz_desc1',
'          FROM holiday_zones',
'         WHERE hz_bu = zwchd_bu',
'           AND hz_zone_id = zwchd_zone_id) zwchd_zone_desc,',
'       ZWCHD_YEAR,',
'       ZWCHD_START_DATE,',
'       ZWCHD_END_DATE,              ',
'       DECODE(ZWCHD_STATUS,''N'',''New'',''A'',''Active'',''I'',''Inactive'') ZWCHD_STATUS_DESC,       ',
'       CASE WHEN ZWCHD_STATUS = ''N'' THEN ''Green''',
'            WHEN ZWCHD_STATUS = ''A'' THEN ''Blue''',
'            WHEN ZWCHD_STATUS = ''I'' THEN ''Red''            ',
'       END  "ZWCHD_STATUS_COLOR",',
'              ''<span class="fa fa-eye" aria-hidden="true" style = "color:red;"></span>'' zwchd_view_ln,',
'       CASE WHEN ZWCHD_STATUS NOT IN (''I'') THEN ''<span class="fa fa-eye" aria-hidden="true" style = "color:red;"></span>''',
'            ELSE ''<span class="fa fa-eye" aria-hidden="true" style = "color:red;cursor:no-drop;"></span>'' ',
'       END "ZWCHD_VIEW_WEEK",',
'       CASE WHEN ZWCHD_STATUS NOT IN (''I'') THEN ''<span class="fa fa-eye" aria-hidden="true" style = "color:red;"></span>''',
'            ELSE ''<span class="fa fa-eye" aria-hidden="true" style = "color:red;cursor:no-drop;"></span>'' ',
'       END "ZWCHD_VIEW_HOLIDAY",',
'       CASE WHEN ZWCHD_STATUS = ''N'' THEN ''<span class="fa fa-check-circle-o" style = "color:green;"></span>'' ',
'            WHEN ZWCHD_STATUS = ''A'' THEN ''<span class="fa fa-check-circle-o" style = "color:blue;"></span>'' ',
'            ELSE ''<span class="fa fa-times-circle-o" style = "color:red;cursor:no-drop;"></span>'' ',
'       END "ZWCHD_VIEW_STATUS",',
'       CASE WHEN ZWCHD_GEN_CLNDR_FLAG = ''N'' AND ZWCHD_STATUS = ''N'' THEN ''Calendar is till not Generated for ''||ZWCHD_CLNDR_NO ',
'            WHEN ZWCHD_GEN_CLNDR_FLAG = ''Y'' AND ZWCHD_STATUS = ''N'' THEN ''Do you want to Active Calendar No. ''||ZWCHD_CLNDR_NO || '' ?.''',
'            WHEN ZWCHD_GEN_CLNDR_FLAG = ''Y'' AND ZWCHD_STATUS = ''A'' THEN ''Do you want to Inactive Calendar No. ''||ZWCHD_CLNDR_NO || '' ?.''  ',
'       END "ZWCHD_VIEW_STATUS_MSG",',
'       CASE WHEN ZWCHD_STATUS <> ''N'' THEN ''NO_LINK'' END "NO_LINK",              ',
'       ZWCHD_CLNDR_ID,',
'       (SELECT pc_clndr_name',
'         FROM pyrl_clndr',
'        WHERE pc_bu = zwchd_bu',
'          AND pc_clndr_id = zwchd_clndr_id',
'       ) ZWCHD_CLNDR_DESC,',
'       ZWCHD_GEN_CLNDR_FLAG,',
'       CASE WHEN  ZWCHD_GEN_CLNDR_FLAG = ''Y'' THEN ''<span aria-hidden="true" class="fa fa-check-square-o" style = "color:green;cursor:no-drop;"></span>'' ',
'            WHEN  ZWCHD_GEN_CLNDR_FLAG <>''Y'' THEN ''<span aria-hidden="true" class="fa fa-stop" style = "color:red"></span>'' ',
'       END ZWCHD_GEN_FLAG1,',
'       ZWCHD_CRE_BY,',
'       ZWCHD_CRE_IP_ADDR,',
'       ZWCHD_CRE_OS_USER,',
'       ZWCHD_CRE_DATE,',
'       ZWCHD_UPD_BY,',
'       ZWCHD_UPD_IP_ADDR,',
'       ZWCHD_UPD_OS_USER,',
'       ZWCHD_UPD_DATE,',
'       ZWCHD_CRE_EMP_ID,',
'       ZWCHD_UPD_EMP_ID,',
'       (SELECT COUNT(zwcw_clndr_no) ',
'          FROM zone_workday_calendar_weekends  ',
'          WHERE zwcw_bu = :GLOBAL_BU',
'            AND zwcw_clndr_no = ZWCHD_CLNDR_NO) "ZWCHD_CNT"          ',
'  FROM ZONE_WORKDAY_CALENDAR_HD',
' WHERE ZWCHD_BU = :GLOBAL_BU',
' ORDER BY ZWCHD_CLNDR_NO DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Calendar HD'
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
 p_id=>wwv_flow_imp.id(19919885218883262035)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:55:&SESSION.::&DEBUG.::P55_ROWID:#ROWID#'
,p_detail_link_text=>'<span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_internal_uid=>14047542886701410478
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201564702271761727)
,p_db_column_name=>'NO_LINK'
,p_display_order=>360
,p_column_identifier=>'AL'
,p_column_label=>'No Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201562695784761716)
,p_db_column_name=>'ROWID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201562429970761716)
,p_db_column_name=>'ZWCHD_BU'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Zwchd Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201554414538761660)
,p_db_column_name=>'ZWCHD_CLNDR_DESC'
,p_display_order=>320
,p_column_identifier=>'W'
,p_column_label=>'Calendar'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201559595042761700)
,p_db_column_name=>'ZWCHD_CLNDR_ID'
,p_display_order=>290
,p_column_identifier=>'J'
,p_column_label=>'Calendar'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201561622523761710)
,p_db_column_name=>'ZWCHD_CLNDR_NO'
,p_display_order=>210
,p_column_identifier=>'D'
,p_column_label=>'Calendar No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201563922331761722)
,p_db_column_name=>'ZWCHD_CNT'
,p_display_order=>350
,p_column_identifier=>'AF'
,p_column_label=>'Zwchd Cnt'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201558809837761696)
,p_db_column_name=>'ZWCHD_CRE_BY'
,p_display_order=>50
,p_column_identifier=>'L'
,p_column_label=>'Zwchd Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201557565825761675)
,p_db_column_name=>'ZWCHD_CRE_DATE'
,p_display_order=>80
,p_column_identifier=>'O'
,p_column_label=>'Zwchd Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201555628083761664)
,p_db_column_name=>'ZWCHD_CRE_EMP_ID'
,p_display_order=>140
,p_column_identifier=>'T'
,p_column_label=>'Zwchd Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201558355597761689)
,p_db_column_name=>'ZWCHD_CRE_IP_ADDR'
,p_display_order=>60
,p_column_identifier=>'M'
,p_column_label=>'Zwchd Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201558014144761677)
,p_db_column_name=>'ZWCHD_CRE_OS_USER'
,p_display_order=>70
,p_column_identifier=>'N'
,p_column_label=>'Zwchd Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201559972019761703)
,p_db_column_name=>'ZWCHD_END_DATE'
,p_display_order=>250
,p_column_identifier=>'H'
,p_column_label=>'End Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&GLOBAL_DF.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201559173698761697)
,p_db_column_name=>'ZWCHD_GEN_CLNDR_FLAG'
,p_display_order=>300
,p_column_identifier=>'K'
,p_column_label=>'new'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201563518308761719)
,p_db_column_name=>'ZWCHD_GEN_FLAG1'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Generate'
,p_column_link=>'javascript:$s(''P44_CLNDR_NO'',''#ZWCHD_CLNDR_NO#''),$s(''P44_STATUS'',''#ZWCHD_STATUS#''),$s(''P44_GEN_CLNDR_FLAG'',''#ZWCHD_GEN_CLNDR_FLAG#'');apex.confirm(''Do you want to Generate Calendar?.'',''GEN_FLAG'');'
,p_column_linktext=>'#ZWCHD_GEN_FLAG1#'
,p_column_link_attr=>'CLASS = "#NO_LINK#"'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201562031421761711)
,p_db_column_name=>'ZWCHD_PLNT'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Zwchd Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201560428392761705)
,p_db_column_name=>'ZWCHD_START_DATE'
,p_display_order=>240
,p_column_identifier=>'G'
,p_column_label=>'Start Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&GLOBAL_DF.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201564293065761724)
,p_db_column_name=>'ZWCHD_STATUS_COLOR'
,p_display_order=>280
,p_column_identifier=>'AI'
,p_column_label=>'Zwchd Status Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201565035458761727)
,p_db_column_name=>'ZWCHD_STATUS_DESC'
,p_display_order=>370
,p_column_identifier=>'AM'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#ZWCHD_STATUS_COLOR#;font-weight:bold;font-weight: bold; text-align: center; border-radius:12px;">#ZWCHD_STATUS_DESC#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201557199186761674)
,p_db_column_name=>'ZWCHD_UPD_BY'
,p_display_order=>90
,p_column_identifier=>'P'
,p_column_label=>'Zwchd Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201555938438761667)
,p_db_column_name=>'ZWCHD_UPD_DATE'
,p_display_order=>130
,p_column_identifier=>'S'
,p_column_label=>'Zwchd Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201555194138761664)
,p_db_column_name=>'ZWCHD_UPD_EMP_ID'
,p_display_order=>150
,p_column_identifier=>'U'
,p_column_label=>'Zwchd Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201556768529761672)
,p_db_column_name=>'ZWCHD_UPD_IP_ADDR'
,p_display_order=>100
,p_column_identifier=>'Q'
,p_column_label=>'Zwchd Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201556403643761669)
,p_db_column_name=>'ZWCHD_UPD_OS_USER'
,p_display_order=>120
,p_column_identifier=>'R'
,p_column_label=>'Zwchd Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201553208802761649)
,p_db_column_name=>'ZWCHD_VIEW_HOLIDAY'
,p_display_order=>190
,p_column_identifier=>'Z'
,p_column_label=>'Holiday'
,p_column_link=>'f?p=&APP_ID.:367042006:&SESSION.::&DEBUG.::P367042006_CLNDR_NO,P367042006_ZONE_ID:#ZWCHD_CLNDR_NO#,#ZWCHD_ZONE_ID#'
,p_column_linktext=>'#ZWCHD_VIEW_HOLIDAY#'
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
,p_display_condition_type=>'NEVER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201553982684761653)
,p_db_column_name=>'ZWCHD_VIEW_LN'
,p_display_order=>160
,p_column_identifier=>'X'
,p_column_label=>'View'
,p_column_link=>'f?p=&APP_ID.:56:&SESSION.::&DEBUG.::P56_CLNDR_NO:#ZWCHD_CLNDR_NO#'
,p_column_linktext=>'#ZWCHD_VIEW_LN#'
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
,p_static_id=>'price1'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201552801742761647)
,p_db_column_name=>'ZWCHD_VIEW_STATUS'
,p_display_order=>200
,p_column_identifier=>'AA'
,p_column_label=>'Active / Inactive'
,p_column_link=>'javascript:$s(''P44_CLNDR_NO'',''#ZWCHD_CLNDR_NO#''),$s(''P44_ZONE_ID'',''#ZWCHD_ZONE_ID#''),$s(''P44_STATUS'',''#ZWCHD_STATUS_DESC#''),$s(''P44_GEN_CLNDR_FLAG'',''#ZWCHD_GEN_CLNDR_FLAG#'');apex.confirm(''#ZWCHD_VIEW_STATUS_MSG#'',''ACTV_FLAG'');'
,p_column_linktext=>'#ZWCHD_VIEW_STATUS#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201563055348761719)
,p_db_column_name=>'ZWCHD_VIEW_STATUS_MSG'
,p_display_order=>330
,p_column_identifier=>'AC'
,p_column_label=>'Zwchd View Status Msg'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201553578608761652)
,p_db_column_name=>'ZWCHD_VIEW_WEEK'
,p_display_order=>170
,p_column_identifier=>'Y'
,p_column_label=>'Week Off'
,p_column_link=>'f?p=&APP_ID.:367042005:&SESSION.::&DEBUG.::P367042005_CALENDAR_NO,P367042005_ZONE_ID,P367042005_CNT:#ZWCHD_CLNDR_NO#,#ZWCHD_ZONE_ID#,#ZWCHD_CNT#'
,p_column_linktext=>'#ZWCHD_VIEW_WEEK#'
,p_column_link_attr=>'CLASS = "#NO_LINK#"'
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
,p_display_condition_type=>'NEVER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201560751165761707)
,p_db_column_name=>'ZWCHD_YEAR'
,p_display_order=>230
,p_column_identifier=>'F'
,p_column_label=>'Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201554813848761660)
,p_db_column_name=>'ZWCHD_ZONE_DESC'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Zone'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6201561201533761708)
,p_db_column_name=>'ZWCHD_ZONE_ID'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Zwchd Zone Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(19918310958009866661)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'50436654'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'ZWCHD_VIEW_LN:ZWCHD_VIEW_WEEK:ZWCHD_VIEW_HOLIDAY:ZWCHD_CLNDR_DESC:ZWCHD_ZONE_DESC:ZWCHD_YEAR:ZWCHD_START_DATE:ZWCHD_END_DATE:ZWCHD_CLNDR_NO:ZWCHD_GEN_FLAG1:ZWCHD_STATUS_DESC:ZWCHD_VIEW_STATUS'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(6201565813583761733)
,p_report_id=>wwv_flow_imp.id(19918310958009866661)
,p_static_id=>'ir-condition'
,p_name=>'Active/Inactive'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'ZWCHD_STATUS_DESC'
,p_operator=>'='
,p_expr=>'Inactive'
,p_condition_sql=>' (case when ("ZWCHD_STATUS_DESC" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Inactive''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#ffd6d2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6201566178247761735)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(19919885323937262036)
,p_button_name=>'BTN_CRE_CLNDR'
,p_static_id=>'btn-cre-clndr'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Workday Calendar'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:55:&SESSION.::&DEBUG.::P55_ZWCHD_CLNDR_NO,P55_ZWCHD_ZONE_ID:&P44_CLNDR_NO.,&P44_ZONE_ID.'
,p_icon_css_classes=>'fa-plus-circle'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201566986117761735)
,p_name=>'P44_CLNDR_NO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(19919885323937262036)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201567827269761736)
,p_name=>'P44_GEN_CLNDR_FLAG'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(19919885323937262036)
,p_item_default=>'N'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201568161129761736)
,p_name=>'P44_STATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(19919885323937262036)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201566621775761735)
,p_name=>'P44_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(19919885323937262036)
,p_item_default=>'A'
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:All Year;A,Current Year;C'
,p_cHeight=>1
,p_grid_label_column_span=>0
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge:margin-top-none:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6201567383082761736)
,p_name=>'P44_ZONE_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(19919885323937262036)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6201606939624761808)
,p_name=>'CHANGE'
,p_static_id=>'change'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P44_REPORT_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6201607473317761810)
,p_event_id=>wwv_flow_imp.id(6201606939624761808)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6201608821417761811)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6201609271265761811)
,p_event_id=>wwv_flow_imp.id(6201608821417761811)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''a.nolink'').attr("onclick","return false;" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6199754917578497368)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P44_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6199754971417497369)
,p_event_id=>wwv_flow_imp.id(6199754917578497368)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P44_TYPE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6201610609142761813)
,p_name=>'NO_LINK'
,p_static_id=>'no-link'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6201611048633761813)
,p_event_id=>wwv_flow_imp.id(6201610609142761813)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''a.NO_LINK'').attr("onclick","return false;");')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6201605315881761797)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GENERATE_CALENDAR'
,p_static_id=>'generate-calendar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    --raise_application_error(-20999,:P44_CLNDR_NO);',
'    proc_gen_workday_calendar(:GLOBAL_bu,:P44_CLNDR_NO,:GLOBAL_user);',
'    PROC_COMMIT;',
'    ',
'     UPDATE zone_workday_calendar_hd',
'           SET zwchd_gen_clndr_flag = ''Y'',',
'               zwchd_upd_by      = :GLOBAL_bu,',
'               zwchd_upd_date    = SYSDATE,',
'               zwchd_upd_ip_addr = :GLOBAL_IP_ADDR,',
'               zwchd_upd_os_user = :GLOBAL_OS_USER,',
'               zwchd_upd_emp_id  = :GLOBAL_USER_EMP',
'         WHERE zwchd_bu             = :GLOBAL_bu',
'           AND zwchd_clndr_no       = :P44_CLNDR_NO;',
'           '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'GEN_FLAG'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>719643480338150769
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6201604916580761797)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROCESS_ACTIVE_INACTIVE'
,p_static_id=>'process-active-inactive'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    IF  :P44_STATUS like ''N%'' THEN',
'        UPDATE zone_workday_calendar_hd',
'           SET zwchd_status      = ''A'',',
'               zwchd_upd_by      = :GLOBAL_bu,',
'               zwchd_upd_date    = SYSDATE,',
'               zwchd_upd_ip_addr = :GLOBAL_IP_ADDR,',
'               zwchd_upd_os_user = :GLOBAL_OS_USER,',
'               zwchd_upd_emp_id  = :GLOBAL_USER_EMP',
'         WHERE zwchd_bu             = :GLOBAL_bu',
'           AND zwchd_clndr_no       = :P44_CLNDR_NO',
'           AND zwchd_gen_clndr_flag = ''Y'';',
'',
'        COMMIT;  ',
'',
'    ELSIF :P44_STATUS like ''A%'' THEN   ',
'       UPDATE zone_workday_calendar_hd',
'          SET zwchd_status      = ''I'',',
'              zwchd_upd_by      = :GLOBAL_bu,',
'              zwchd_upd_date    = SYSDATE,',
'              zwchd_upd_ip_addr = :GLOBAL_IP_ADDR,',
'              zwchd_upd_os_user = :GLOBAL_OS_USER,',
'              zwchd_upd_emp_id  = :GLOBAL_USER_EMP',
'        WHERE zwchd_bu       = :GLOBAL_bu',
'          AND zwchd_clndr_no = :P44_CLNDR_NO ',
'          AND zwchd_gen_clndr_flag = ''Y'';',
'',
'        COMMIT;  ',
'',
'    END IF ;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ACTV_FLAG'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>719643081037150769
);
wwv_flow_imp.component_end;
end;
/
