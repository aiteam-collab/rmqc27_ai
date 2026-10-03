prompt --application/pages/page_00047
begin
--   Manifest
--     PAGE: 00047
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
 p_id=>47
,p_name=>'Compose Mail'
,p_alias=>'COMPOSE-MAIL'
,p_step_title=>'Compose Mail'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#to {',
'    color: #fdf8f8;',
'    background-color: #dd901c96;',
'    box-shadow: 0 0 0 1px rgb(0 0 0 / 13%) inset;',
'}',
'#to:hover{',
'	color: black;',
'}',
'#cc {',
'    color:white;',
'    background-color: #dd901c96;',
'    box-shadow: 0 0 0 1px rgb(0 0 0 / 13%) inset;',
'}',
'#cc:hover{',
'	color: black;',
'}',
'#send_btn{',
'	color:#fcfbfa;',
'   /* background:#41727e; */',
'	background-color: #1a73e8;',
'}',
'',
'#cancel_btn{',
'	 color: #fcfbfa;',
'    background-color: #377e55;',
'    border-color: #377e55;',
'    outline-color: #377e55;',
'}',
'.apex-item-group--file-browse .apex-item-filedrop-icon {',
'    border-left-width: var(--a-filedrop-border-width);',
'    border-left-style: var(--a-filedrop-border-style);',
'    border-left-color: var(--a-filedrop-border-color);',
'    background-color: #0ebf18;',
'    border-radius: 0 2px 2px 0;',
'}',
'/* .a-Button, .a-Button.a-Button--popupLOV, .a-IG-button.a-IG-button--controls {',
'    color: #383838;',
'    background-color: #2ecdbb;',
'    box-shadow: 0 0 0 1px rgb(0 0 0 / 13%) inset;',
'} */',
'/* .apex-item-text {',
'    font-size: 1.2rem;',
'    font-family: Arial;',
'    /* background: linear-gradient(359deg, #b1b3b8, #938b8b00);  */',
'	 /* background-color: skyblue;',
'	 color: #262626;',
'} */',
'',
'.apex-item-text:hover{',
'	/* color: white; */',
'	background: rgb(235, 232, 232);',
'	color:#262626 ;',
'}',
'#to_Name{',
'    background: linear-gradient(7deg, #32acd1f2, transparent);',
'	 ',
'	  /* background-color: darkgreen;',
'	  color: white; */',
'}',
'#to_select{',
'	 background: linear-gradient(6deg, #d1659c, transparent);',
'	 /* background-color: red;',
'	 color: white; */',
'}',
'.a-IRR-table tr td:first-child, .a-IRR-table tr th:first-child {',
'    box-shadow: none;',
'	 background: linear-gradient(4deg, #e7d7d7, transparent);',
'	',
'}',
'.a-IRR-table tr td:last-child {',
'    border-right-color: #f2f2f2;',
'	 background: linear-gradient(4deg, #e7d7d7, transparent);',
'',
'}',
'#cc_name{',
'    background: linear-gradient(7deg, #32acd1f2, transparent);',
'}',
'#cc_select{',
'	 background: linear-gradient(6deg, #d1659c, transparent);',
'}',
'/* .apex-item-filedrop-body{',
'	background-color: wheat;',
'}',
'.apex-item-group apex-item-group--textarea:hover{',
'	color: lightgoldenrodyellow;',
'} */',
'#to_ok_btn:{',
'	background-color: darkgreen;',
'}',
'#cc_ok_btn:{',
'	background-color: darkgreen;',
'}',
'/* #compose_mail{ ',
'	/* background: linear-gradient(4deg, #c5bbb0, #4a782700); */',
'	 /* background-color: #50ada6; */',
'	 /* } */',
'/* .t-Region-headerItems--title {',
'    flex-grow: 1;',
'    flex-shrink: 0;',
'    flex-basis: auto;',
'    text-align: left;',
'    padding: 1.2rem;',
'    display: flex;',
'    align-items: center;',
'	 /* background: linear-gradient(2deg, #dab6e9, transparent); */',
'	 /* background-color: skyblue;',
'} */ ',
'/* .t-Region-header {',
'    border-bottom-color: rgba(0, 0, 0, 0.075);',
'     /* background: linear-gradient(358deg, #dab6e9, transparent); */',
'	  /* background-color: pink;',
'    color: #262626;',
'} */ ',
'/* .t-Form-fieldContainer--floatingLabel .apex-item-textarea {',
'    font-size: 1.2rem;',
'    width: 100%;',
'	 background-color: rgb(213, 216, 213);',
'} */',
'',
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6029978762053811769)
,p_plug_name=>'CC'
,p_static_id=>'cc'
,p_region_name=>'Cc_inline_dialog'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select MSGUSRB_BU,',
'       MSGUSRB_CORP_ID,',
'       MSGUSRB_ID,',
'       MSGUSRB_PASSWORD,',
'       MSGUSRB_EFF_FROM,',
'       MSGUSRB_EFF_TO,',
'       MSGUSRB_EMP_ID,',
'       MSGUSRB_STATUS,',
'       MSGUSRB_ACTIVE_DATE,',
'       MSGUSRB_DELETE_DATE,',
'       MSGUSRB_CHK_FLAG,',
'       CASE',
'            WHEN MSGUSRB_CHK_FLAG = ''Y''',
'            THEN',
'               ''<span aria-hidden="true" class="fa fa-check-square" style = "color:green;"></span>''',
'            ELSE',
'               ''<span aria-hidden="true" class="fa fa-square-o"  style = "color:green;"></span>''',
'         END',
'            "Select",',
'       MSGUSRB_CRE_BY,',
'       MSGUSRB_CRE_IP_ADDR,',
'       MSGUSRB_CRE_OS_USER,',
'       MSGUSRB_CRE_DATE,',
'       MSGUSRB_UPD_BY,',
'       MSGUSRB_UPD_IP_ADDR,',
'       MSGUSRB_UPD_OS_USER,',
'       MSGUSRB_UPD_DATE,',
'       MSGUSRB_CRE_EMP_ID,',
'       MSGUSRB_UPD_EMP_ID',
'  from MSG_USERS_BUFFER',
' WHERE MSGUSRB_BU = :Global_bu'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'CC'
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
 p_id=>wwv_flow_imp.id(6029978880216811770)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>548017044673200742
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6037754950006027929)
,p_db_column_name=>'MSGUSRB_ACTIVE_DATE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Msgusrb Active Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6029979033685811771)
,p_db_column_name=>'MSGUSRB_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Msgusrb Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6037755234447027931)
,p_db_column_name=>'MSGUSRB_CHK_FLAG'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Msgusrb Chk Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6029979113533811772)
,p_db_column_name=>'MSGUSRB_CORP_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Msgusrb Corp Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6037755368920027933)
,p_db_column_name=>'MSGUSRB_CRE_BY'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Msgusrb Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6037755656577027936)
,p_db_column_name=>'MSGUSRB_CRE_DATE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Msgusrb Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6037756233644027941)
,p_db_column_name=>'MSGUSRB_CRE_EMP_ID'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Msgusrb Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6037755495540027934)
,p_db_column_name=>'MSGUSRB_CRE_IP_ADDR'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Msgusrb Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6037755595864027935)
,p_db_column_name=>'MSGUSRB_CRE_OS_USER'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Msgusrb Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6037755084716027930)
,p_db_column_name=>'MSGUSRB_DELETE_DATE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Msgusrb Delete Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6029979371982811775)
,p_db_column_name=>'MSGUSRB_EFF_FROM'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Msgusrb Eff From'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6029979504474811776)
,p_db_column_name=>'MSGUSRB_EFF_TO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Msgusrb Eff To'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6029979537361811777)
,p_db_column_name=>'MSGUSRB_EMP_ID'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Msgusrb Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6029979149576811773)
,p_db_column_name=>'MSGUSRB_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_static_id=>'cc_name'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6029979282031811774)
,p_db_column_name=>'MSGUSRB_PASSWORD'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Msgusrb Password'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6029979635896811778)
,p_db_column_name=>'MSGUSRB_STATUS'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Msgusrb Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6037755820285027937)
,p_db_column_name=>'MSGUSRB_UPD_BY'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Msgusrb Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6037756073080027940)
,p_db_column_name=>'MSGUSRB_UPD_DATE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Msgusrb Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6037756313954027942)
,p_db_column_name=>'MSGUSRB_UPD_EMP_ID'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Msgusrb Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6037755896561027938)
,p_db_column_name=>'MSGUSRB_UPD_IP_ADDR'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Msgusrb Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6037755960584027939)
,p_db_column_name=>'MSGUSRB_UPD_OS_USER'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Msgusrb Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6037755291895027932)
,p_db_column_name=>'Select'
,p_display_order=>230
,p_column_identifier=>'L'
,p_column_label=>'Select'
,p_column_link=>'javascript:$s(''P47_CC_ID'',''#MSGUSRB_ID#''),$s(''P47_CC_CHK_FLAG'',''#MSGUSRB_CHK_FLAG#'')(''SEL_FLAG'');'
,p_column_linktext=>'#Select#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_static_id=>'cc_select'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6037773589214042638)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'5558118'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MSGUSRB_BU:MSGUSRB_CORP_ID:MSGUSRB_ID:MSGUSRB_PASSWORD:MSGUSRB_EFF_FROM:MSGUSRB_EFF_TO:MSGUSRB_EMP_ID:MSGUSRB_STATUS:MSGUSRB_ACTIVE_DATE:MSGUSRB_DELETE_DATE:MSGUSRB_CHK_FLAG:Select:MSGUSRB_CRE_BY:MSGUSRB_CRE_IP_ADDR:MSGUSRB_CRE_OS_USER:MSGUSRB_CRE_DA'
||'TE:MSGUSRB_UPD_BY:MSGUSRB_UPD_IP_ADDR:MSGUSRB_UPD_OS_USER:MSGUSRB_UPD_DATE:MSGUSRB_CRE_EMP_ID:MSGUSRB_UPD_EMP_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6039194141933632930)
,p_plug_name=>'Compose Mail'
,p_static_id=>'compose-mail'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>8
,p_plug_display_column=>3
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5989213946972672237)
,p_plug_name=>'Compose Mail'
,p_static_id=>'compose-mail-2'
,p_region_name=>'compose_mail'
,p_parent_plug_id=>wwv_flow_imp.id(6039194141933632930)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5989599343494171145)
,p_plug_name=>'TO'
,p_static_id=>'to'
,p_region_name=>'To_inline_dialog'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select MSGUSRB_BU,',
'       MSGUSRB_CORP_ID,',
'       MSGUSRB_ID,',
'       MSGUSRB_PASSWORD,',
'       MSGUSRB_EFF_FROM,',
'       MSGUSRB_EFF_TO,',
'       MSGUSRB_EMP_ID,',
'       MSGUSRB_STATUS,',
'       MSGUSRB_ACTIVE_DATE,',
'       MSGUSRB_DELETE_DATE,',
'       MSGUSRB_CHK_FLAG,',
'       CASE',
'            WHEN MSGUSRB_CHK_FLAG = ''Y''',
'            THEN',
'               ''<span aria-hidden="true" class="fa fa-check-square" style = "color:green;"></span>''',
'            ELSE',
'               ''<span aria-hidden="true" class="fa fa-square-o"  style = "color:green;"></span>''',
'         END',
'            "Select",',
'       MSGUSRB_CRE_BY,',
'       MSGUSRB_CRE_IP_ADDR,',
'       MSGUSRB_CRE_OS_USER,',
'       MSGUSRB_CRE_DATE,',
'       MSGUSRB_UPD_BY,',
'       MSGUSRB_UPD_IP_ADDR,',
'       MSGUSRB_UPD_OS_USER,',
'       MSGUSRB_UPD_DATE,',
'       MSGUSRB_CRE_EMP_ID,',
'       MSGUSRB_UPD_EMP_ID',
'  from MSG_USERS_BUFFER',
' WHERE MSGUSRB_BU = :Global_bu'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'TO'
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
 p_id=>wwv_flow_imp.id(5989599505431171146)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>507637669887560118
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989600365098171155)
,p_db_column_name=>'MSGUSRB_ACTIVE_DATE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Msgusrb Active Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989599576171171147)
,p_db_column_name=>'MSGUSRB_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Msgusrb Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989600605587171157)
,p_db_column_name=>'MSGUSRB_CHK_FLAG'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Msgusrb Chk Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989599659434171148)
,p_db_column_name=>'MSGUSRB_CORP_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Msgusrb Corp Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989600660042171158)
,p_db_column_name=>'MSGUSRB_CRE_BY'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Msgusrb Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989600935728171161)
,p_db_column_name=>'MSGUSRB_CRE_DATE'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Msgusrb Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989601467933171166)
,p_db_column_name=>'MSGUSRB_CRE_EMP_ID'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Msgusrb Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989600748470171159)
,p_db_column_name=>'MSGUSRB_CRE_IP_ADDR'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Msgusrb Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989600839779171160)
,p_db_column_name=>'MSGUSRB_CRE_OS_USER'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Msgusrb Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989600447239171156)
,p_db_column_name=>'MSGUSRB_DELETE_DATE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Msgusrb Delete Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989600000661171151)
,p_db_column_name=>'MSGUSRB_EFF_FROM'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Msgusrb Eff From'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989600129850171152)
,p_db_column_name=>'MSGUSRB_EFF_TO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Msgusrb Eff To'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989600223664171153)
,p_db_column_name=>'MSGUSRB_EMP_ID'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Msgusrb Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989599820745171149)
,p_db_column_name=>'MSGUSRB_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_static_id=>'to_Name'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989599878609171150)
,p_db_column_name=>'MSGUSRB_PASSWORD'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Msgusrb Password'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989600285007171154)
,p_db_column_name=>'MSGUSRB_STATUS'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Msgusrb Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989601036460171162)
,p_db_column_name=>'MSGUSRB_UPD_BY'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Msgusrb Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989601376800171165)
,p_db_column_name=>'MSGUSRB_UPD_DATE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Msgusrb Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989601547557171167)
,p_db_column_name=>'MSGUSRB_UPD_EMP_ID'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Msgusrb Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989601138197171163)
,p_db_column_name=>'MSGUSRB_UPD_IP_ADDR'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Msgusrb Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989601307901171164)
,p_db_column_name=>'MSGUSRB_UPD_OS_USER'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Msgusrb Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5989676150864796829)
,p_db_column_name=>'Select'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Select'
,p_column_link=>'javascript:$s(''P47_ID'',''#MSGUSRB_ID#'');'
,p_column_linktext=>'#Select#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_static_id=>'to_select'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5989639328265184028)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'5076775'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MSGUSRB_BU:MSGUSRB_CORP_ID:MSGUSRB_ID:MSGUSRB_PASSWORD:MSGUSRB_EFF_FROM:MSGUSRB_EFF_TO:MSGUSRB_EMP_ID:MSGUSRB_STATUS:MSGUSRB_ACTIVE_DATE:MSGUSRB_DELETE_DATE:MSGUSRB_CHK_FLAG:MSGUSRB_CRE_BY:MSGUSRB_CRE_IP_ADDR:MSGUSRB_CRE_OS_USER:MSGUSRB_CRE_DATE:MSGU'
||'SRB_UPD_BY:MSGUSRB_UPD_IP_ADDR:MSGUSRB_UPD_OS_USER:MSGUSRB_UPD_DATE:MSGUSRB_CRE_EMP_ID:MSGUSRB_UPD_EMP_ID:Select'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6037725145092627642)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6029978762053811769)
,p_button_name=>'BTN_CC_OK'
,p_static_id=>'btn-cc-ok'
,p_button_static_id=>'cc_ok_btn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapTop:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Ok'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5942801957932396040)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(5989599343494171145)
,p_button_name=>'BTN_OK'
,p_static_id=>'btn-ok'
,p_button_static_id=>'to_ok_btn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapTop:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Ok'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6029978685588811768)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(5989213946972672237)
,p_button_name=>'Cancel'
,p_static_id=>'cancel'
,p_button_static_id=>'cancel_btn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_image_alt=>'Cancel'
,p_button_redirect_url=>'f?p=&APP_ID.:58:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-remove'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>3
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6029977056813811752)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(5989213946972672237)
,p_button_name=>'Cc'
,p_static_id=>'cc'
,p_button_static_id=>'cc'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapTop:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'New '
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5989214507515672242)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(5989213946972672237)
,p_button_name=>'Send'
,p_static_id=>'send'
,p_button_static_id=>'send_btn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_image_alt=>'Send'
,p_icon_css_classes=>'fa-envelope'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
,p_grid_column=>6
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5989217206610672269)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(5989213946972672237)
,p_button_name=>'To'
,p_static_id=>'to'
,p_button_static_id=>'to'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapTop'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'To'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5989214287761672240)
,p_name=>'P47_ATTACHMENT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(5989213946972672237)
,p_prompt=>'Attachment'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_icon_css_classes=>'fa-paperclip'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'allow_multiple_files', 'N',
  'display_as', 'INLINE',
  'purge_file_at', 'SESSION',
  'storage_type', 'APEX_APPLICATION_TEMP_FILES')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5989214106454672238)
,p_name=>'P47_CC'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(5989213946972672237)
,p_prompt=>'Cc'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6037725127659627641)
,p_name=>'P47_CC_CHK_FLAG'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6029978762053811769)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6037724977666627640)
,p_name=>'P47_CC_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6029978762053811769)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5989676410615796831)
,p_name=>'P47_CHK_FLAG'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(5989599343494171145)
,p_prompt=>'Staus'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5989214405062672241)
,p_name=>'P47_CONTENT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(5989213946972672237)
,p_prompt=>'Content'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6037725656354627647)
,p_name=>'P47_DUMMY'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(5989213946972672237)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5989676332817796830)
,p_name=>'P47_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5989599343494171145)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5989214168854672239)
,p_name=>'P47_SUBJECT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(5989213946972672237)
,p_prompt=>'Subject'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5989213873998672236)
,p_name=>'P47_TO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5989213946972672237)
,p_prompt=>'To'
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
 p_id=>wwv_flow_imp.id(6029978234621811763)
,p_name=>'New_2'
,p_static_id=>'new'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P47_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6029978249035811764)
,p_event_id=>wwv_flow_imp.id(6029978234621811763)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P47_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'UPDATE msg_users_buffer',
    '   SET msgusrb_chk_flag = DECODE(msgusrb_chk_flag,''N'',''Y'',''Y'',''N'')',
    ' WHERE msgusrb_bu =:global_bu',
    '   AND msgusrb_id = :P47_ID;',
    ' COMMIT;',
    '',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6029978418561811765)
,p_event_id=>wwv_flow_imp.id(6029978234621811763)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(5989599343494171145)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6037756532499027944)
,p_name=>'New'
,p_static_id=>'new-2'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P47_CC_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6037756616766027945)
,p_event_id=>wwv_flow_imp.id(6037756532499027944)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P47_CC_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'UPDATE msg_users_buffer',
    '   SET msgusrb_chk_flag = DECODE(msgusrb_chk_flag,''N'',''Y'',''Y'',''N'')',
    ' WHERE msgusrb_bu =:global_bu',
    '   AND msgusrb_id = :P47_CC_ID;',
    ' COMMIT;',
    '',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6037756646746027946)
,p_event_id=>wwv_flow_imp.id(6037756532499027944)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6029978762053811769)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6037725762161627648)
,p_name=>'New_1'
,p_static_id=>'new-3'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P47_DUMMY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5989217319168672270)
,p_name=>'OpenRegion'
,p_static_id=>'openregion'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5989217206610672269)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5942802155520396042)
,p_event_id=>wwv_flow_imp.id(5989217319168672270)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '--raise_application_error(-20999,''test'');',
    'proc_appl_users_buffer(:GLOBAL_BU);',
    '--:P47_DUMMY :=1;',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6037725902357627649)
,p_event_id=>wwv_flow_imp.id(5989217319168672270)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(5989599343494171145)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5942803152223396052)
,p_event_id=>wwv_flow_imp.id(5989217319168672270)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(5989599343494171145)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6029977144883811753)
,p_name=>'OpenRegion_cc'
,p_static_id=>'openregion-cc'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6029977056813811752)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6037756370280027943)
,p_event_id=>wwv_flow_imp.id(6029977144883811753)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', 'proc_appl_users_buffer(:GLOBAL_BU);',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6029977269944811754)
,p_event_id=>wwv_flow_imp.id(6029977144883811753)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6029978762053811769)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6037757286117027952)
,p_event_id=>wwv_flow_imp.id(6029977144883811753)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6029978762053811769)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6029978529810811766)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CC_OK_BTN'
,p_static_id=>'cc-ok-btn'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	cursor c1 is',
'	select MSGUSRB_ID',
'	from   msg_users_buffer',
'	where MSGUSRB_BU=:global_bu',
'	   and MSGUSRB_CHK_FLAG=''Y'';',
'',
'  V_RESULT VARCHAR2(500);',
'BEGIN',
'',
'	FOR cr1 IN c1 LOOP',
'	',
'		if V_RESULT is null then ',
'			V_RESULT :=cr1.MSGUSRB_ID;',
'		else',
'		V_RESULT	:=V_RESULT||'',''||cr1.MSGUSRB_ID;',
'		end if;	',
'	END LOOP;',
'	:P47_CC :=V_RESULT;',
'END;	'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6037725145092627642)
,p_internal_uid=>548016694267200738
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5992357349644543029)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OK'
,p_static_id=>'ok'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	cursor c1 is',
'	select MSGUSRB_ID',
'	from   msg_users_buffer',
'	where MSGUSRB_BU=:global_bu',
'	   and MSGUSRB_CHK_FLAG=''Y'';',
'',
'  V_RESULT VARCHAR2(500);',
'BEGIN',
'',
'	FOR cr1 IN c1 LOOP',
'	',
'		if V_RESULT is null then ',
'			V_RESULT :=cr1.MSGUSRB_ID;',
'		else',
'		V_RESULT	:=V_RESULT||'',''||cr1.MSGUSRB_ID;',
'		end if;	',
'	END LOOP;',
'	:P47_TO :=V_RESULT;',
'END;	'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5942801957932396040)
,p_internal_uid=>510395514100932001
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5942801925916396039)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SEND_BTN'
,p_static_id=>'send-btn'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Raise_application_error(-20999,''test'');',
'BEGIN',
'IF (:P47_TO IS NULL)OR  (:P47_SUBJECT IS NULL) OR (:P47_CONTENT IS NULL)',
'THEN',
'Raise_application_error(-20999,''Please enter to/subject/message to continue.'');	 ',
'ELSE',
'	proc_sender_names_validation(:GLOBAL_BU,:P47_TO);',
'END IF;',
'IF (:P47_CC IS NOT NULL)THEN',
'proc_sender_names_validation(:GLOBAL_BU,:P47_CC); ',
'END IF;',
'proc_int_msg_inserting (',
'								:global_bu,',
'							--   :global.plnt,',
'								:global_user,',
'								SYSDATE,',
'								:P47_TO,',
'								:P47_CC,',
'								:P47_SUBJECT,',
'								:P47_CONTENT,',
'								:P47_ATTACHMENT',
');',
'apex_application.g_print_success_message := ''Message sent successfully.'';',
'COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5989214507515672242)
,p_internal_uid=>460840090372785011
);
wwv_flow_imp.component_end;
end;
/
