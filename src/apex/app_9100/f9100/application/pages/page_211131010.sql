prompt --application/pages/page_211131010
begin
--   Manifest
--     PAGE: 211131010
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
 p_id=>211131010
,p_name=>'User Bus. Function Access'
,p_alias=>'USER-BUS-FUNCTION-ACCESS'
,p_step_title=>'User Bus. Function Access'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-headerLink, .a-IRR-headerLink:hover {',
'',
'    background: #00b1e7 !important;',
'}',
'a {',
'    color: #002ae7e0;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14954511468494699176)
,p_plug_name=>'Report 1'
,p_static_id=>'report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       UBFAH_BU,',
'       UBFAH_DOC_NO,',
'       UBFAH_DOC_DATE,',
'       UBFAH_REFERENCE,',
'       UBFAH_EFF_FROM,',
'       UBFAH_EFF_TO,',
'    --    UBFAH_STATUS,',
'          DECODE (UBFAH_STATUS,',
'                 ''N'', ''New'',',
'                 ''E'', ''Entry Completed'',',
'                 ''A'', ''Active'',',
'                 ''C'', ''Cancelled'')',
'            UBFAH_STATUS,',
'         DECODE (UBFAH_STATUS,',
'                 ''N'', ''blue'',',
'                 ''E'', ''cornflowerblue'',',
'                 ''A'', ''green'',',
'                 ''C'', ''red'')',
'            "color",',
'       UBFAH_USER,',
'       UBFAH_CRE_BY,',
'       UBFAH_CRE_DATE,',
'       UBFAH_CRE_EMP_ID,',
'       UBFAH_CRE_IP_ADDR,',
'       UBFAH_CRE_OS_USER,',
'       UBFAH_UPD_BY,',
'       UBFAH_UPD_DATE,',
'       UBFAH_UPD_EMP_ID,',
'       UBFAH_UPD_IP_ADDR,',
'       UBFAH_UPD_OS_USER,',
'       UBFAH_VERT_ID||'' - ''||func_find_erp_vertical_desc(UBFAH_VERT_ID) Vertical,',
'       UBFAH_LOAD_FLAG,',
'       UBFAH_TYPE',
'  from USER_BUS_FUN_ACCESS_HD',
'  WHERE UBFAH_BU=:GLOBAL_BU',
'  AND UBFAH_STATUS =''N''',
'  order by UBFAH_DOC_NO desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Report 1'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(14954511907776699179)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>9472550072233088151
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807522101212100603)
,p_db_column_name=>'ROWID'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'ROWID'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807514933451100585)
,p_db_column_name=>'UBFAH_BU'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Ubfah Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807518158016100598)
,p_db_column_name=>'UBFAH_CRE_BY'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Ubfah Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807518573636100598)
,p_db_column_name=>'UBFAH_CRE_DATE'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Ubfah Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807518963804100598)
,p_db_column_name=>'UBFAH_CRE_EMP_ID'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>'Ubfah Cre Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807519301692100599)
,p_db_column_name=>'UBFAH_CRE_IP_ADDR'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>'Ubfah Cre Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807519780941100599)
,p_db_column_name=>'UBFAH_CRE_OS_USER'
,p_display_order=>130
,p_column_identifier=>'N'
,p_column_label=>'Ubfah Cre Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807515782115100593)
,p_db_column_name=>'UBFAH_DOC_DATE'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807515308607100593)
,p_db_column_name=>'UBFAH_DOC_NO'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Doc. No'
,p_column_link=>'f?p=&APP_ID.:211131012:&SESSION.::&DEBUG.::P211131012_ROW_ID:#ROWID#'
,p_column_linktext=>'#UBFAH_DOC_NO#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807516567863100595)
,p_db_column_name=>'UBFAH_EFF_FROM'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Eff. From'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807516975027100595)
,p_db_column_name=>'UBFAH_EFF_TO'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Eff. To'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807522498548100603)
,p_db_column_name=>'UBFAH_LOAD_FLAG'
,p_display_order=>200
,p_column_identifier=>'U'
,p_column_label=>'Ubfah Load Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807516096065100595)
,p_db_column_name=>'UBFAH_REFERENCE'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807517350360100596)
,p_db_column_name=>'UBFAH_STATUS'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#color#; font-weight:bold;">#UBFAH_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807522903651100604)
,p_db_column_name=>'UBFAH_TYPE'
,p_display_order=>210
,p_column_identifier=>'V'
,p_column_label=>'Ubfah Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807520118508100599)
,p_db_column_name=>'UBFAH_UPD_BY'
,p_display_order=>140
,p_column_identifier=>'O'
,p_column_label=>'Ubfah Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807520560204100601)
,p_db_column_name=>'UBFAH_UPD_DATE'
,p_display_order=>150
,p_column_identifier=>'P'
,p_column_label=>'Ubfah Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807520969453100601)
,p_db_column_name=>'UBFAH_UPD_EMP_ID'
,p_display_order=>160
,p_column_identifier=>'Q'
,p_column_label=>'Ubfah Upd Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807521295491100601)
,p_db_column_name=>'UBFAH_UPD_IP_ADDR'
,p_display_order=>170
,p_column_identifier=>'R'
,p_column_label=>'Ubfah Upd Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807521767400100603)
,p_db_column_name=>'UBFAH_UPD_OS_USER'
,p_display_order=>180
,p_column_identifier=>'S'
,p_column_label=>'Ubfah Upd Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807517744873100596)
,p_db_column_name=>'UBFAH_USER'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807523321481100604)
,p_db_column_name=>'VERTICAL'
,p_display_order=>220
,p_column_identifier=>'W'
,p_column_label=>'Vertical'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8807523779137100604)
,p_db_column_name=>'color'
,p_display_order=>230
,p_column_identifier=>'X'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(14954512894803699915)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'20482631'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'UBFAH_DOC_NO:UBFAH_DOC_DATE:UBFAH_USER:VERTICAL:UBFAH_EFF_FROM:UBFAH_EFF_TO:UBFAH_REFERENCE:UBFAH_STATUS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5892082792199042931)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(14954511468494699176)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:211131012:&SESSION.::&DEBUG.:211131011::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp.component_end;
end;
/
