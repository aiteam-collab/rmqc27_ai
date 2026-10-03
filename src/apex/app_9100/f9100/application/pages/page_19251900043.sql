prompt --application/pages/page_19251900043
begin
--   Manifest
--     PAGE: 19251900043
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
 p_id=>19251900043
,p_name=>'WhatsApp'
,p_alias=>'WHATSAPP-MESSAGE'
,p_step_title=>'WhatsApp'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'slideclose();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*    radio option    */',
'',
' ',
'.apex-item-group--rc input+label {',
'    display: inline-block;',
'    margin-top: 15px;',
'    margin-left: 25px;',
'    margin-bottom: 4px;',
'    min-height: var(--a-checkbox-size, 16px);',
'}',
'',
'.apex-item-grid-row .apex-item-option {',
'    display: table-cell;',
'    padding-left: 120px;',
'    vertical-align: top;',
'}',
'',
'',
'.apex-item-single-checkbox input:checked+.u-checkbox, .apex-item-single-checkbox input:checked+label, .u-checkbox.is-checked {',
'    --a-checkbox-background-color: white;',
'    --a-checkbox-text-color: #028107;',
'    --a-button-border-radius: #00d7c9;',
'    --a-checkbox-border-color: #cd9a00;',
'} '))
,p_step_template=>wwv_flow_imp.id(5950304360493412392)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6316411111849453117)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>60
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P19251900043_BACK'
,p_plug_display_when_cond2=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8445801531534985164)
,p_plug_name=>'WhatsApp'
,p_static_id=>'whatsapp'
,p_region_name=>'WHATSAPP'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select WOV_BU,',
'       WOV_SEQ_NO,',
'       TO_CHAR(WOV_DATE,''DD.MM.YYYY HH:MI:SS AM'')WOV_DATE,',
'       WOV_USERID,',
'       DECODE (WOV_BENF_TYPE,''E'',''Employee'',''C'',''Customer'',''S'',''Supplier'') WOV_BENF_TYPE,',
'       WOV_BENF_ID,',
'       WOV_BENF_NAME,',
'       WOV_COUNTRY_CODE,',
'       WOV_MOBILE_NO,',
'       WOV_TEMPLATE_ID,',
'       WOV_TEMPLATE_DESC,',
'       WOV_MESSAGE,',
'       WOV_STATUS,',
'       ( CASE WHEN wov_status = ''N'' THEN ''Unsent''',
'              WHEN wov_status <> ''N'' THEN ''Sent'' END )WOV_TYPE,',
'       WOV_RQST_JSON,',
'       WOV_RESPONSE,',
'       WOV_SEL_FLAG,',
'       WOV_CRE_BY,',
'       WOV_CRE_DATE,',
'       WOV_CRE_EMP_ID,',
'       WOV_CRE_IP_ADDR,',
'       WOV_CRE_OS_USER,',
'       WOV_UPD_BY,',
'       WOV_UPD_DATE,',
'       WOV_UPD_EMP_ID,',
'       WOV_UPD_IP_ADDR,',
'       WOV_UPD_OS_USER',
'  from WHATSAPP_OUTBOX_VW',
' where WOV_BU = :GLOBAL_bu'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Sent / Unsend WhatsApp'
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
 p_id=>wwv_flow_imp.id(8446146512269058946)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>2966625528484138744
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446147069237058952)
,p_db_column_name=>'WOV_BENF_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Beneficiary ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446147148677058953)
,p_db_column_name=>'WOV_BENF_NAME'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446146934738058951)
,p_db_column_name=>'WOV_BENF_TYPE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446146538431058947)
,p_db_column_name=>'WOV_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Wov Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446147289748058954)
,p_db_column_name=>'WOV_COUNTRY_CODE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Country Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446148249188058964)
,p_db_column_name=>'WOV_CRE_BY'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Wov Cre By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446148378704058965)
,p_db_column_name=>'WOV_CRE_DATE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Wov Cre Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446148439058058966)
,p_db_column_name=>'WOV_CRE_EMP_ID'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Wov Cre Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446148526528058967)
,p_db_column_name=>'WOV_CRE_IP_ADDR'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Wov Cre Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446148693431058968)
,p_db_column_name=>'WOV_CRE_OS_USER'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Wov Cre Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446149293777058974)
,p_db_column_name=>'WOV_DATE'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446147623919058958)
,p_db_column_name=>'WOV_MESSAGE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446147411046058955)
,p_db_column_name=>'WOV_MOBILE_NO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Mobile No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446148056393058962)
,p_db_column_name=>'WOV_RESPONSE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Response'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446147972181058961)
,p_db_column_name=>'WOV_RQST_JSON'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Wov Rqst Json'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446148139072058963)
,p_db_column_name=>'WOV_SEL_FLAG'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Wov Sel Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446146710917058948)
,p_db_column_name=>'WOV_SEQ_NO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Sl. No.'
,p_column_link=>'f?p=&APP_ID.:135:&SESSION.::&DEBUG.::P135_WOV_BU,P135_WOV_SEQ_NO:#WOV_BU#,#WOV_SEQ_NO#'
,p_column_linktext=>'#WOV_SEQ_NO#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446147726493058959)
,p_db_column_name=>'WOV_STATUS'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Wov Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446147530007058957)
,p_db_column_name=>'WOV_TEMPLATE_DESC'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Template'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446147502609058956)
,p_db_column_name=>'WOV_TEMPLATE_ID'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Wov Template Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446147827514058960)
,p_db_column_name=>'WOV_TYPE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Sent Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446148726644058969)
,p_db_column_name=>'WOV_UPD_BY'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Wov Upd By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446148874249058970)
,p_db_column_name=>'WOV_UPD_DATE'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Wov Upd Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446148956575058971)
,p_db_column_name=>'WOV_UPD_EMP_ID'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Wov Upd Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446149085317058972)
,p_db_column_name=>'WOV_UPD_IP_ADDR'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Wov Upd Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446149159102058973)
,p_db_column_name=>'WOV_UPD_OS_USER'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Wov Upd Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8446146874831058950)
,p_db_column_name=>'WOV_USERID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Wov Userid'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8446757126851402819)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'21154093'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WOV_SEQ_NO:WOV_DATE:WOV_BENF_ID:WOV_BENF_NAME:WOV_BENF_TYPE:WOV_COUNTRY_CODE:WOV_MOBILE_NO:WOV_TYPE:WOV_TEMPLATE_DESC:WOV_MESSAGE:WOV_RESPONSE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6316411259260453118)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6316411111849453117)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_redirect_url=>'f?p=&APP_ID.:1925190004:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6328952037956690206)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8445801531534985164)
,p_button_name=>'COM_MSG'
,p_static_id=>'com-msg'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Compose Message'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1900042:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>' fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6328952401073690206)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8445801531534985164)
,p_button_name=>'SEND_WHAT_MSG'
,p_static_id=>'send-what-msg'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Send WhatsApp Message'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_icon_css_classes=>'fa-send-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6316412008225453126)
,p_name=>'P19251900043_BACK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6316411111849453117)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6328958276520690234)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19251900043_DOC_NO_EMAIL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6328958690689690237)
,p_event_id=>wwv_flow_imp.id(6328958276520690234)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P19251900043_DOC_NO_EMAIL',
  'language', 'PLSQL',
  'plsql_code', ':P19251900043_DOC_NO_EMAIL :=:EOH_DOC_NO;',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6328959103440690237)
,p_name=>'Tab'
,p_static_id=>'tab'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19251900043_TAB'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6328960157151690239)
,p_event_id=>wwv_flow_imp.id(6328959103440690237)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P19251900043_MAIN',
  'items_to_submit', 'P19251900043_TAB',
  'language', 'PLSQL',
  'plsql_code', ':P19251900043_MAIN := :P19251900043_TAB;',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6328959665834690237)
,p_event_id=>wwv_flow_imp.id(6328959103440690237)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Tab'
,p_static_id=>'tab'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'const tabMapping = {',
    '  ''SMS''     : ''SMS'',',
    '  ''EMAIL''   : ''EMAIL'',',
    '  ''WHATSAPP'': ''WHATSAPP''',
    '  };',
    '  ',
    'const selectedTab = $v("P19251900043_TAB");',
    '',
    '// Hide all containers',
    'for (const container in tabMapping) {',
    '  apex.item(tabMapping[container]).hide();',
    '}',
    '',
    '// Show the selected container',
    'apex.item(tabMapping[selectedTab]).show();')))).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6328957026371690233)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send WhatsApp Message'
,p_static_id=>'send-whatsapp-message'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- raise_application_error (-20999,''test'');',
'',
'DECLARE',
'	CURSOR c2(c_seq_no NUMBER)',
'	IS',
'	SELECT wod_status',
'	  FROM whatsapp_outbox_det',
'	 WHERE wod_bu = :GLOBAL_bu',
'	   AND wod_seq_no = c_seq_no; ',
'	   ',
'	cr2		c2%ROWTYPE;',
'	   ',
'	   i	NUMBER := 0;',
'BEGIN',
'',
'	FOR cr1 IN (SELECT wov_seq_no',
'	              FROM whatsapp_outbox_vw',
'	             WHERE wov_bu = :GLOBAL_bu',
'	               AND wov_status <> ''A''',
'	               AND wov_sel_flag = ''Y'')',
'  LOOP',
'',
'	proc_send_wa_message (:GLOBAL_bu,''U1'',cr1.wov_seq_no,:GLOBAL_user);',
'',
'	commit;',
'	',
'	OPEN c2(cr1.wov_seq_no);',
'	FETCH c2 INTO cr2;',
'	',
'	IF c2%FOUND AND cr2.wod_status = ''A'' THEN',
'		i := 1;',
'	END IF;',
'	',
'	CLOSE c2;',
'	',
'	END LOOP;',
'	',
'	IF i = 1 THEN',
'		apex_application.g_print_success_message := ''Message sent successfully.'';',
'	ELSE',
'		apex_application.g_print_success_message := ''Message failed to send. Refer Response for details.'';',
'	END IF;	',
'',
'END;	'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6328952401073690206)
,p_internal_uid=>849436042586770031
);
wwv_flow_imp.component_end;
end;
/
