prompt --application/pages/page_01026
begin
--   Manifest
--     PAGE: 01026
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
 p_id=>1026
,p_name=>'Help Desk Details'
,p_alias=>'HELP-DESK-DETAILS'
,p_step_title=>'Help Desk Details'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Region-headerItems--title {',
'    text-align: left;',
'    padding: 0.8rem 1.2rem;',
'}',
'/*',
'.t-Body-mainContent {',
'    flex-grow: 1;',
'    background-image: url("#APP_IMAGES#Suporte-1024x512.png");',
'    background-size: cover;',
'}*/',
'',
'',
'.a-GV-table, .a-IRR-table, .u-Report, .u-resetTable {',
'    border-spacing: 1px;',
'}',
'',
'',
'.t-Region--accent3 > .t-Region-header {',
'    /* background-color: #2ebfbc; */',
'    color: #f0fcfb;',
'    background: linear-gradient(to bottom, #9e5df3 37%, #9e5df3 95%);',
'}',
'',
'.t-Region-headerItems--title {',
'    padding: 4px;',
'    font-size: 15px;',
'}',
'',
'.t-Region--accent8 > .t-Region-header {',
'    background-color: ORANGE;',
'    color: #ffffff;',
'}',
'',
'/*.btn-large, .a-IRR-toolbar .a-IRR-controlGroup.a-IRR-controlGroup--search button, .a-IRR-toolbar .a-IRR-controlGroup.a-IRR-controlGroup--options button, .a-IRR-toolbar .a-IRR-button.a-IRR-button--reportView {',
'    background-color: deepskyblue;',
'    height: 31px !important;',
'    line-height: 14px !important;',
'}',
'*/',
'',
'.t-Cards--compact.t-Cards--displaySubtitle .t-Card-subtitle {',
'    display: block;',
'    font-size: 13px;',
'    margin: 4px 0 0;',
'    line-height: 12px;',
'    font-weight: 500;',
'}',
'.t-Cards--compact .t-Card-title {',
'    font-size: 13px;',
'    line-height: 1.6rem;',
'    margin: 0;',
'    font-weight: 800;',
'    verflow: hidden;',
'    text-overflow: ellipsis;',
'}',
'.t-Card-title {',
'    color: #bb9300;',
'    font-size: 13px;',
'    font-weight: 800;',
'}',
''))
,p_step_template=>wwv_flow_imp.id(6339300137962061229)
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'Y'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6888739211301145648)
,p_plug_name=>'Closed Request'
,p_static_id=>'closed-request'
,p_icon_css_classes=>'fa-question-square-o fam-clock fam-is-info'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--showIcon:t-Region--accent2:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ROWID",',
'"HHD_DOC_NO",',
'"HHD_TITLE",',
'"HHD_DUE_DATE",',
'DECODE (HHD_CATEGORY,''G'',''General'',''L'',''Lost of Info.'',''I'',''ID Lost'',''A'',''Att. Police Enquiry'') "HHD_CATEGORY",',
'DECODE (HHD_STATUS,''R'',''Raised'',''C'',''Completed'') "HHD_STATUS",',
'"HHD_EMP_NOTES",',
'"HHD_EMP_DESC",',
'dbms_lob.getlength("HHD_EMP_ATT_DOC") "HHD_EMP_ATT_DOC",',
'"HHD_HR_NOTES",',
'"HHD_HR_DESC",',
'dbms_lob.getlength("HHD_HR_ATT_DOC") "HHD_HR_ATT_DOC"',
'from HRM_HELP_DESK',
'WHERE HHD_STATUS=''C''',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
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
 p_id=>wwv_flow_imp.id(6888739437414145651)
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>744897408007624390
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335896137504811825)
,p_db_column_name=>'HHD_CATEGORY'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335895007735811820)
,p_db_column_name=>'HHD_DOC_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Doc. No'
,p_column_html_expression=>'<div style="width:80px; word-wrap: break-word;">#HHD_DOC_NO#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335895746605811823)
,p_db_column_name=>'HHD_DUE_DATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Due Date'
,p_column_html_expression=>'<div style="width:80px; word-wrap: break-word;">#HHD_DUE_DATE#</div>'
,p_allow_hide=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335897740720811829)
,p_db_column_name=>'HHD_EMP_ATT_DOC'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Emp. Attachment'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:HRM_HELP_DESK:HHD_EMP_ATT_DOC:ROWID::::::attachment::'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335897332122811828)
,p_db_column_name=>'HHD_EMP_DESC'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Employee Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335896986772811828)
,p_db_column_name=>'HHD_EMP_NOTES'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Notes'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335899354556811832)
,p_db_column_name=>'HHD_HR_ATT_DOC'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'HR Attachment'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335899005465811832)
,p_db_column_name=>'HHD_HR_DESC'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'HR Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335898563899811831)
,p_db_column_name=>'HHD_HR_NOTES'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'HR Notes'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335896587434811825)
,p_db_column_name=>'HHD_STATUS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335895384290811823)
,p_db_column_name=>'HHD_TITLE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Title'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335898214074811829)
,p_db_column_name=>'ROWID'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6888811679366307022)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'385135'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'HHD_DOC_NO:HHD_DUE_DATE:HHD_TITLE:HHD_CATEGORY:HHD_EMP_NOTES:HHD_EMP_DESC:HHD_EMP_ATT_DOC:HHD_HR_NOTES:HHD_HR_DESC:HHD_HR_ATT_DOC:HHD_STATUS'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6195627626222087084)
,p_name=>'Open Request'
,p_static_id=>'open-request'
,p_template=>wwv_flow_imp.id(10650490475667505325)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--basic:t-Cards--3cols:t-Cards--hideBody:t-Cards--animRaiseCard'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT --''<div> <img src=#APP_IMAGES#helpdesk1.png alt="Img" width="75" height="50">'' ||''</div><br>''CARD_ICON,',
'       ''<div>''||INITCAP(hhd_title)||''</div><br>''',
'	   CARD_TITLE,',
'	   ''<div> <span style="font-weight:700;font-size:13px;color:#7c2a26; padding-right:70px;"> My Desc.  </span>'' ||',
'	   INITCAP(hhd_emp_desc) ||''</div> <br/>''||',
'	   ''<div> <span style="font-weight:700;font-size:13px;color:#7c2a26; padding-right:66px;"> My Notes  </span>'' ||',
'	   INITCAP(hhd_emp_notes) ||''</div> <br/>''||',
'	   ''<div> <span style="font-weight:700;font-size:13px;color:#7c2a26; padding-right:70px;"> Category  </span>'' ||',
'       DECODE (hhd_category,',
'               ''G'', ''General'',',
'               ''L'', ''Lost of Info.'',',
'               ''I'', ''ID Lost'',',
'               ''A'', ''Att. Policy Enquiry'')',
'       ||''</div> <br/>''',
'       CARD_SUBTITLE',
'       /*CASE WHEN hhd_due_date IS NOT NULL THEN',
'	   ''<div> <span style="font-weight:700;font-size:13px;color:#7d3492; padding-right:14px;"> Doc. No/Due Date  </span>'' ||',
'	   hhd_doc_no|| ''/'' || TO_CHAR(hhd_due_date,''dd-mm-yyyy'')||''</div> <br/>''',
'       ELSE',
'       ''<div> <span style="font-weight:700;font-size:13px;color:#7d3492; padding-right:14px;"> Doc. No/Due Date  </span>'' ||',
'        hhd_doc_no ||''</div> <br/>''',
'       END||',
'	   ''<div> <span style="font-weight:700;font-size:13px;color:#7d3492; padding-right:88px;"> Status  </span>'' ||',
'	   DECODE (hhd_status,  ''R'', ''Raised'',  ''C'', ''Completed'') ',
'	   ||''</div> <br/>''*/',
'  FROM "#OWNER#"."HRM_HELP_DESK"',
' WHERE hhd_status NOT IN (''C'')',
' ORDER BY hhd_doc_no desc',
''))
,p_display_when_condition=>':global_user <>''KIRAN'''
,p_display_when_cond2=>'PLSQL'
,p_display_condition_type=>'EXPRESSION'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
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
 p_id=>wwv_flow_imp.id(6202736416130660260)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>30
,p_column_heading=>'Card Subtitle'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6202736240860660259)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Title'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6885188068198365084)
,p_plug_name=>'Open Request'
,p_static_id=>'open-request-2'
,p_icon_css_classes=>'fa-question-square-o fam-clock fam-is-info'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--showIcon:t-Region--accent2:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ROWID",',
'"HHD_DOC_NO",',
'"HHD_TITLE",',
'"HHD_DUE_DATE",',
'DECODE (HHD_CATEGORY,''G'',''General'',''L'',''Lost of Info.'',''I'',''ID Lost'',''A'',''Att. Policy Enquiry'') "HHD_CATEGORY",',
'DECODE (HHD_STATUS,''R'',''Raised'',''C'',''Completed'') "HHD_STATUS",',
'"HHD_EMP_NOTES",',
'"HHD_EMP_DESC",',
'dbms_lob.getlength("HHD_EMP_ATT_DOC") "HHD_EMP_ATT_DOC"',
'from "#OWNER#"."HRM_HELP_DESK" ',
'where  HHD_STATUS not in (''C'')',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':global_user <>''KIRAN'' AND 1=2'
,p_plug_display_when_cond2=>'SQL'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6885188489844365086)
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>741346460437843825
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335891193126811812)
,p_db_column_name=>'HHD_CATEGORY'
,p_display_order=>50
,p_column_identifier=>'G'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335890023661811809)
,p_db_column_name=>'HHD_DOC_NO'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Doc. No'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335890822645811812)
,p_db_column_name=>'HHD_DUE_DATE'
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Due Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335892779696811815)
,p_db_column_name=>'HHD_EMP_ATT_DOC'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'My Attachment'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:HRM_HELP_DESK:HHD_EMP_ATT_DOC:ROWID::::::attachment::'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335892336038811815)
,p_db_column_name=>'HHD_EMP_DESC'
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>'My Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335891978637811814)
,p_db_column_name=>'HHD_EMP_NOTES'
,p_display_order=>70
,p_column_identifier=>'I'
,p_column_label=>'My Notes'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335891575079811814)
,p_db_column_name=>'HHD_STATUS'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335890335462811811)
,p_db_column_name=>'HHD_TITLE'
,p_display_order=>30
,p_column_identifier=>'E'
,p_column_label=>'Title'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335893133596811817)
,p_db_column_name=>'ROWID'
,p_display_order=>10
,p_column_identifier=>'L'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6885196186466365884)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'385072'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'HHD_DOC_NO:HHD_TITLE:HHD_DUE_DATE:HHD_CATEGORY:HHD_EMP_NOTES:HHD_EMP_DESC:HHD_STATUS:HHD_EMP_ATT_DOC'
,p_sort_column_1=>'HHD_DOC_NO'
,p_sort_direction_1=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6888943105146428139)
,p_plug_name=>'Open Request'
,p_static_id=>'open-request-3'
,p_icon_css_classes=>'fa-question'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--showIcon:t-Region--accent2:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select "ROWID",',
'"HHD_DOC_NO",',
'"HHD_TITLE",',
'"HHD_DUE_DATE",',
'DECODE (HHD_CATEGORY,''G'',''General'',''L'',''Lost of Info.'',''I'',''ID Lost'',''A'',''Att. Police Enquiry'') "HHD_CATEGORY",',
'DECODE (HHD_STATUS,''R'',''Raised'',''C'',''Completed'') "HHD_STATUS",',
'"HHD_EMP_NOTES",',
'"HHD_EMP_DESC",',
'dbms_lob.getlength("HHD_EMP_ATT_DOC") "HHD_EMP_ATT_DOC"',
'from "#OWNER#"."HRM_HELP_DESK"',
'where  HHD_STATUS not in (''C'')',
'  ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':global_user =''KIRAN'''
,p_plug_display_when_cond2=>'SQL'
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
 p_id=>wwv_flow_imp.id(6888943400384428142)
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:1027:&SESSION.::&DEBUG.:RP:P1027_ROWID:#ROWID#'
,p_detail_link_text=>'<span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_internal_uid=>745101370977906881
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335901583553811840)
,p_db_column_name=>'HHD_CATEGORY'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335900414057811837)
,p_db_column_name=>'HHD_DOC_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Doc. No'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335901165631811839)
,p_db_column_name=>'HHD_DUE_DATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Due Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335903169076811843)
,p_db_column_name=>'HHD_EMP_ATT_DOC'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'My Attachment'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DOWNLOAD:HRM_HELP_DESK:HHD_EMP_ATT_DOC:ROWID::::::attachment::'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335902805730811842)
,p_db_column_name=>'HHD_EMP_DESC'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'My Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335902380524811842)
,p_db_column_name=>'HHD_EMP_NOTES'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'My Notes'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335901967899811840)
,p_db_column_name=>'HHD_STATUS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335900758699811839)
,p_db_column_name=>'HHD_TITLE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Title'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335903610050811843)
,p_db_column_name=>'ROWID'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6889315987155896668)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'385178'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'HHD_DOC_NO:HHD_TITLE:HHD_DUE_DATE:HHD_CATEGORY:HHD_STATUS:HHD_EMP_NOTES:HHD_EMP_DESC:HHD_EMP_ATT_DOC:ROWID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6693367083017065178)
,p_plug_name=>'Region Display Selector'
,p_static_id=>'region-display-selector'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'N',
  'rds_mode', 'STANDARD',
  'remember_selection', 'SESSION')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6335904276312811846)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6888943105146428139)
,p_button_name=>'BACK_2'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'back'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:1::'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6335894240847811818)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6885188068198365084)
,p_button_name=>'BACK'
,p_static_id=>'back-2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'back'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:1::'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6335893912413811818)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6885188068198365084)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Create'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:1027:&SESSION.::&DEBUG.:1027::'
,p_icon_css_classes=>'fa-file-plus fa-anim-vertical-shake'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6335905155862811850)
,p_branch_action=>'f?p=&APP_ID.:95020000101:&SESSION.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6335904654216811848)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_static_id=>'reset-page'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'CLEAR_CACHE_CURRENT_PAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>853942818673200820
);
wwv_flow_imp.component_end;
end;
/
