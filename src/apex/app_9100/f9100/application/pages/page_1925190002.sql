prompt --application/pages/page_1925190002
begin
--   Manifest
--     PAGE: 1925190002
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
 p_id=>1925190002
,p_name=>'User Audit'
,p_alias=>'USER-AUDIT'
,p_step_title=>'User Audit'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'slideclose();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
''))
,p_step_template=>wwv_flow_imp.id(5950304360493412392)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8637929305649735948)
,p_plug_name=>'User Audit'
,p_static_id=>'user-audit'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>1010
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT APUA_BU,',
'         APUA_DB_ACTION,',
'         APUA_USER_ID,',
'         APUA_PARTY_ID,',
'         APUA_COLUMN,',
'         CASE',
'            WHEN APUA_COLUMN = ''Login Attempt''',
'            THEN',
'               DECODE (APUA_OLD_VAL, ''0'', ''Login Success'', ''1'', ''1st Attempt'', ''2'', ''2nd Attempt'', ''3'', ''3rd Attempt'')',
'            WHEN APUA_COLUMN = ''Account Status (Lock/Unlock)''',
'            THEN',
'               DECODE (APUA_OLD_VAL,  ''Y'', ''Locked'',  ''N'', ''Unlocked'')',
'            ELSE',
'               APUA_OLD_VAL',
'         END',
'            APUA_OLD_VAL,',
'         CASE',
'            WHEN APUA_COLUMN = ''Login Attempt''',
'            THEN',
'               DECODE (APUA_NEW_VAL, ''0'', ''Login Success'', ''1'', ''1st Attempt'', ''2'', ''2nd Attempt'', ''3'', ''3rd Attempt'')',
'            WHEN APUA_COLUMN = ''Account Status (Lock/Unlock)''',
'            THEN',
'               DECODE (APUA_OLD_VAL,  ''Y'', ''Locked'',  ''N'', ''Unlocked'')',
'            ELSE',
'               APUA_NEW_VAL',
'         END',
'            APUA_NEW_VAL,',
'         APUA_CRE_BY,',
'         APUA_CRE_IP_ADDR,',
'         APUA_CRE_OS_USER,',
'         APUA_CRE_DATE,',
'         APUA_UPD_BY,',
'         APUA_UPD_IP_ADDR,',
'         APUA_UPD_OS_USER,',
'         CAST (APUA_TIMESTAMP AS DATE) APUA_UPD_DATE,',
'         TO_CHAR(UAUD_DOB, ''DD.MM.YYYY'') UAUD_DOB,',
'         UAUD_YOJ,',
'         UAUD_DL_ADR_PAN,',
'         APUA_CRE_EMP_ID,',
'         APUA_UPD_EMP_ID,',
'         APUA_TIMESTAMP',
'    FROM APPL_USERS_AUDIT, UPD_APPL_USER_DTLS',
'   WHERE     APUA_BU = :GLOBAL_BU',
'         AND APUA_DB_ACTION = ''UPDATE''',
'         AND APUA_USER_ID = UAUD_USER_ID(+)',
'         AND APUA_PARTY_ID = UAUD_EMP_ID(+)',
'         AND APUA_OLD_VAL = UAUD_OLD_PASS(+)',
'         AND APUA_NEW_VAL = UAUD_NEW_PASS(+)',
'ORDER BY NVL (APUA_TIMESTAMP, APUA_UPD_DATE) DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'User Audit'
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
 p_id=>wwv_flow_imp.id(8637929445553735949)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>3155967610010124921
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8637929533427735950)
,p_db_column_name=>'APUA_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Apua Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8637929916194735954)
,p_db_column_name=>'APUA_COLUMN'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Column'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8637930287294735957)
,p_db_column_name=>'APUA_CRE_BY'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8637931542719735970)
,p_db_column_name=>'APUA_CRE_DATE'
,p_display_order=>190
,p_column_identifier=>'U'
,p_column_label=>'Created Date'
,p_column_type=>'DATE'
,p_format_mask=>'DD.MM.RRRR HH:MI:SSAM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8637930995343735965)
,p_db_column_name=>'APUA_CRE_EMP_ID'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Created Emp. Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8637930311641735958)
,p_db_column_name=>'APUA_CRE_IP_ADDR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Created IP Address'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8637930460654735959)
,p_db_column_name=>'APUA_CRE_OS_USER'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Created OS User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8637929625577735951)
,p_db_column_name=>'APUA_DB_ACTION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Apua Db Action'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8637930167090735956)
,p_db_column_name=>'APUA_NEW_VAL'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'New Value'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8637930005633735955)
,p_db_column_name=>'APUA_OLD_VAL'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Old Value'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8637929804734735953)
,p_db_column_name=>'APUA_PARTY_ID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Emp./Party Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8637931203420735967)
,p_db_column_name=>'APUA_TIMESTAMP'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Apua Timestamp'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8637930642043735961)
,p_db_column_name=>'APUA_UPD_BY'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8637931625934735971)
,p_db_column_name=>'APUA_UPD_DATE'
,p_display_order=>200
,p_column_identifier=>'V'
,p_column_label=>'Updated Date'
,p_column_type=>'DATE'
,p_format_mask=>'DD.MM.RRRR HH:MI:SSAM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8637931188376735966)
,p_db_column_name=>'APUA_UPD_EMP_ID'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Updated Emp. Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8637930771650735962)
,p_db_column_name=>'APUA_UPD_IP_ADDR'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Updated IP Address'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8637930798828735963)
,p_db_column_name=>'APUA_UPD_OS_USER'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Updated OS User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8637929726745735952)
,p_db_column_name=>'APUA_USER_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5757826985818772649)
,p_db_column_name=>'UAUD_DL_ADR_PAN'
,p_display_order=>230
,p_column_identifier=>'Y'
,p_column_label=>'DL/ Aadhaar/ Pan'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5757827195117772651)
,p_db_column_name=>'UAUD_DOB'
,p_display_order=>240
,p_column_identifier=>'Z'
,p_column_label=>'Date of Birth'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5757826846143772648)
,p_db_column_name=>'UAUD_YOJ'
,p_display_order=>220
,p_column_identifier=>'X'
,p_column_label=>'Year of Joining'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8638038490036079042)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'15207158'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'APUA_USER_ID:APUA_PARTY_ID:APUA_COLUMN:APUA_OLD_VAL:APUA_NEW_VAL:APUA_CRE_BY:APUA_CRE_DATE:APUA_UPD_BY:APUA_UPD_DATE'
);
wwv_flow_imp.component_end;
end;
/
