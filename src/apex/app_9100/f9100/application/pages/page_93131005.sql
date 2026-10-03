prompt --application/pages/page_93131005
begin
--   Manifest
--     PAGE: 93131005
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
 p_id=>93131005
,p_name=>'Inventory Pipeline'
,p_alias=>'INVENTORY-PIPELINE'
,p_step_title=>'Inventory Pipeline'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#Clear{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: rgba(0, 0, 0, 0.15);',
'   background-size: 25px;',
'   width: 25px;',
'   height: 22px;',
'   top: 4px;',
'}',
'',
'#Clear1{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: rgba(0, 0, 0, 0.15);',
'   background-size: 25px;',
'   width: 25px;',
'   height: 22px;',
'  // top: 4px;',
'}',
'',
'',
'',
'.t-Region-title {',
'    font-size: small;',
'    font-weight: bold;',
'    color: #003968;',
'}',
'.t-Button--simple.t-Button--hot, .t-Button--simple.t-Button--hot .t-Icon {',
'    color: white;',
'}',
'.t-Button--simple.t-Button--hot {',
'    box-shadow: 0 0 0 2px rgba(0, 0, 0, 0.15) inset;',
'    background-color: rgba(0, 0, 0, 0.15);',
'    border-radius: 4px;',
'}',
'',
'.t-Button--success {',
'    --a-button-background-color: #e0e0e0;',
'     --a-button-text-color: #047827; ',
'    --a-button-hover-background-color: #e0e0e0;',
'    --a-button-hover-text-color: var(--a-button-text-color);',
'    /* --a-button-active-background-color: #307323; */',
'     --a-button-active-background-color: #e0e0e0;',
'    --a-button-active-text-color: var(--a-button-hover-text-color);',
'    --a-button-focus-background-color: var(--a-button-hover-background-color);',
'    --a-button-focus-text-color: var(--a-button-hover-text-color);',
'}',
'',
'',
'.ui-button--danger, .t-Button--danger {',
'    --a-button-background-color: #e0e0e0;',
'    --a-button-text-color: #ef0808;',
'    --a-button-hover-background-color: #e0e0e0;',
'    --a-button-hover-text-color: var(--a-button-text-color);',
'    --a-button-active-background-color: #d50601;',
'    --a-button-active-text-color: var(--a-button-hover-text-color);',
'    --a-button-focus-background-color: var(--a-button-hover-background-color);',
'    --a-button-focus-text-color: var(--a-button-hover-text-color);',
'}',
'',
'.t-Button--padRight, .u-RTL .t-Button--padLeft {',
'    margin-right: 8px!important;',
'}',
'',
'.t-Button--gapRight, .u-RTL .t-Button--gapLeft {',
'    margin-right: 16px!important;',
'}',
'',
'.t-Form-itemWrapper .a-Switch, .t-Form-itemWrapper .apex-item-group, .t-Form-itemWrapper .apex-item-icon, .t-Form-itemWrapper .apex-item-markdown-editor, .t-Form-itemWrapper .apex-item-single-checkbox, .t-Form-itemWrapper .ck-editor, .t-Form-itemWrap'
||'per fieldset {',
'    order: 2;',
'    border: #5e6087 !important;',
'}',
'',
'.t-Button--padLeft {',
'    margin-left: 8px!important;',
'}',
'.apex-icons-fontapex .fa {',
'    font-family: inherit!important;',
'    position: relative;',
'    font-weight: bold;',
'}',
'',
'  .a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'  }',
'  .t-fht-thead {',
'    overflow: auto !important;',
'}',
'#Clear {',
'    background-image: url(r/erp/files/static/v340/clearclear-removebg-preview.png);',
'    background-position: 0px 3px;',
'    background-repeat: no-repeat;',
'    background-color: #e0e0e0;',
'    background-size: 26px;',
'    width: 28px;',
'    height: 25px;',
'    top: 4px;',
'}'))
,p_step_template=>wwv_flow_imp.id(5741311521565371726)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7678643203886225162)
,p_plug_name=>'<b>Result (s)</b>'
,p_static_id=>'b-result-s-b'
,p_region_name=>'IP'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_region_attributes=>'style=''display:none;'''
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>530
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select IPSD_BU,',
'       IPSD_PLNT,',
'       DECODE(IPSD_RE_ORD_TYPE,''PR'',''PR'',''PO'',''Prod. Ord.'')IPSD_RE_ORD_TYPE,',
'       IPSD_PIPELINE_NO,',
'       IPSD_INV_METHOD,',
'       IPSD_STORE_ID,',
'       IPSD_STORE_DESC,',
'       IPSD_PROD_ID,',
'       IPSD_PROD_REV,',
'       IPSD_PROD_DESC,',
'       IPSD_LAST_PUR_PRICE,',
'       IPSD_REORD_QTY,',
'       IPSD_PROCESSED_QTY,',
'       IPSD_STATUS,',
'       DECODE (IPSD_STATUS,',
'                 ''Draft'', ''blue'',',
'                 ''Approved'', ''green'',',
'                 ''Cancelled'', ''red'',',
'                 ''Closeshorted'', ''Orange'',',
'                 ''Entry Completed'',''violet'')Status,',
'       IPSD_CRE_BY,',
'       IPSD_CRE_DATE,',
'       IPSD_CRE_IP_ADDR,',
'       IPSD_CRE_OS_USER,',
'       IPSD_CRE_EMP_ID',
'  FROM INV_PIPELINE_SRCH_DTLS',
' WHERE IPSD_BU =:GLOBAL_BU',
' AND ipsd_user =:global_user',
' --AND :P93131005_FILTER =''Y''',
' ORDER BY IPSD_CRE_DATE DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P93131005_FILTER'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'<b>Result (s)</b>'
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
 p_id=>wwv_flow_imp.id(7678643335325225163)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'10'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>2196681499781614135
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7678643396042225164)
,p_db_column_name=>'IPSD_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Ipsd Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7680341617433998338)
,p_db_column_name=>'IPSD_CRE_BY'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7680341722591998339)
,p_db_column_name=>'IPSD_CRE_DATE'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Created Date'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MON-YYYY HH:MI PM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7680341996141998342)
,p_db_column_name=>'IPSD_CRE_EMP_ID'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Created Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7680341846551998340)
,p_db_column_name=>'IPSD_CRE_IP_ADDR'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Created IP Addr.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7680341935778998341)
,p_db_column_name=>'IPSD_CRE_OS_USER'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Created OS User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7678643742583225167)
,p_db_column_name=>'IPSD_INV_METHOD'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Inv. Method'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7678644272254225173)
,p_db_column_name=>'IPSD_LAST_PUR_PRICE'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>'Last Pur. Price'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7678643652267225166)
,p_db_column_name=>'IPSD_PIPELINE_NO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Pipeline No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7678643508368225165)
,p_db_column_name=>'IPSD_PLNT'
,p_display_order=>40
,p_column_identifier=>'B'
,p_column_label=>'Ipsd Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7678644536303225175)
,p_db_column_name=>'IPSD_PROCESSED_QTY'
,p_display_order=>130
,p_column_identifier=>'L'
,p_column_label=>'Proc. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7678644169844225172)
,p_db_column_name=>'IPSD_PROD_DESC'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7678644034280225170)
,p_db_column_name=>'IPSD_PROD_ID'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7678644069882225171)
,p_db_column_name=>'IPSD_PROD_REV'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7678644375595225174)
,p_db_column_name=>'IPSD_REORD_QTY'
,p_display_order=>120
,p_column_identifier=>'K'
,p_column_label=>'PPL Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7683554871594321245)
,p_db_column_name=>'IPSD_RE_ORD_TYPE'
,p_display_order=>20
,p_column_identifier=>'V'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7686000699389876542)
,p_db_column_name=>'IPSD_STATUS'
,p_display_order=>190
,p_column_identifier=>'T'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#STATUS#; font-weight:bold;">#IPSD_STATUS#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7678643870531225169)
,p_db_column_name=>'IPSD_STORE_DESC'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Warehouse Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7678643809086225168)
,p_db_column_name=>'IPSD_STORE_ID'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Warehouse'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7686000764917876543)
,p_db_column_name=>'STATUS'
,p_display_order=>200
,p_column_identifier=>'U'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7680432199549145179)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'20818671'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'IPSD_PIPELINE_NO:IPSD_RE_ORD_TYPE:IPSD_INV_METHOD:IPSD_STORE_ID:IPSD_STORE_DESC:IPSD_PROD_ID:IPSD_PROD_REV:IPSD_PROD_DESC:IPSD_REORD_QTY:IPSD_CRE_BY:IPSD_CRE_EMP_ID:IPSD_CRE_IP_ADDR:IPSD_CRE_OS_USER:IPSD_CRE_DATE:IPSD_STATUS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7678641338604225143)
,p_plug_name=>'Find Inventory Pipeline'
,p_static_id=>'find-inventory-pipeline'
,p_region_name=>'SR'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:t-Form--slimPadding'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);display:none;"'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>510
,p_plug_grid_column_span=>12
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5598566608219758945)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(7678641338604225143)
,p_button_name=>'Clear'
,p_static_id=>'clear'
,p_button_static_id=>'Clear1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Clear'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5598566996505758945)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(7678641338604225143)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--danger:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_button_css_classes=>'closebtn'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5598566230633758943)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(7678641338604225143)
,p_button_name=>'CREATE_INV_PIPELINE'
,p_static_id=>'create-inv-pipeline'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--warning:t-Button--padLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Inv. Pipeline'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:9313100521:&SESSION.::&DEBUG.:::#IPSD_STATUS#'
,p_icon_css_classes=>'t-Icon fa fa-dial-gauge-chart'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5598565793895758942)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(7678641338604225143)
,p_button_name=>'Find'
,p_static_id=>'find'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Search'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5598577419547758988)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7678643203886225162)
,p_button_name=>'Search'
,p_static_id=>'search'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Search'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7676367688811620062)
,p_name=>'P93131005_FILTER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7678641338604225143)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7676368025711620065)
,p_name=>'P93131005_FILTER_1'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(7678641338604225143)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7678644129966225168)
,p_name=>'P93131005_INV_METHOD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7678641338604225143)
,p_prompt=>'Inv. Method'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Reorder;R,Min. Max.;M'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7678643568973225163)
,p_name=>'P93131005_ITEM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7678641338604225143)
,p_prompt=>'Item'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm:margin-left-sm'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'text_case', '0',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7678643774935225165)
,p_name=>'P93131005_ITEM_DESC'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7678641338604225143)
,p_prompt=>'Item Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7678643709454225164)
,p_name=>'P93131005_ITEM_REV'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7678641338604225143)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7678644007376225167)
,p_name=>'P93131005_STATUS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7678641338604225143)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;N,Approved;A,Cancelled;C'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7678644216505225169)
,p_name=>'P93131005_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7678641338604225143)
,p_prompt=>'Type '
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:PR;PR,Prod. Ord.;PO'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm:margin-right-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7678643865310225166)
,p_name=>'P93131005_W_H'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7678641338604225143)
,p_prompt=>'Warehouse'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'text_case', '0',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7678644259936225170)
,p_name=>'P93131005_W_H_DESC'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7678641338604225143)
,p_prompt=>'Warehouse Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5598580164670759021)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5598566608219758945)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5598580695026759023)
,p_event_id=>wwv_flow_imp.id(5598580164670759021)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P93131005_ITEM,P93131005_ITEM_REV,P93131005_ITEM_DESC,P93131005_TYPE,P93131005_W_H,P93131005_W_H_DESC,P93131005_INV_METHOD,P93131005_STATUS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5598581145754759024)
,p_event_id=>wwv_flow_imp.id(5598580164670759021)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7678643203886225162)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5598581605676759024)
,p_name=>'Find'
,p_static_id=>'find'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5598565793895758942)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5598582562829759026)
,p_event_id=>wwv_flow_imp.id(5598581605676759024)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P93131005_FILTER',
  'items_to_submit', 'P93131005_ITEM,P93131005_ITEM_REV,P93131005_ITEM_DESC,P93131005_INV_METHOD,P93131005_TYPE,P93131005_STATUS,P93131005_W_H,P93131005_W_H_DESC',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    'proc_srch_dtls_frm_pipeline (:GLOBAL_BU,',
    '                             null,',
    '                             :P93131005_ITEM ,         ',
    '                             :P93131005_ITEM_DESC ,',
    '                             :P93131005_ITEM_REV,    ',
    '                             :P93131005_W_H  ,         ',
    '                             :P93131005_W_H_DESC ,     ',
    '                             :P93131005_INV_METHOD  ,     ',
    '                             :P93131005_STATUS ,',
    '                              :P93131005_TYPE,',
    '                             :GLOBAL_USER ',
    '                             );  ',
    'commit;',
    'END;',
    ':P93131005_FILTER := ''Y'';')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5598582133059759026)
,p_event_id=>wwv_flow_imp.id(5598581605676759024)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item( "IP").show();',
    '//apex.item( "SR").hide();')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5598583037340759028)
,p_event_id=>wwv_flow_imp.id(5598581605676759024)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7678643203886225162)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5598577978072759018)
,p_name=>'Item'
,p_static_id=>'item'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P93131005_ITEM'
,p_condition_element=>'P93131005_ITEM'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5598578390744759020)
,p_event_id=>wwv_flow_imp.id(5598577978072759018)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P93131005_ITEM_DESC',
  'items_to_submit', 'P93131005_ITEM',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    'SELECT DISTINCT ',
    '       func_find_prod_qry_desc(srp_bu,srp_prod_id,srp_prod_rev,1) INTO :P93131005_ITEM_DESC',
    '  FROM stock_reorder_pipline',
    ' WHERE srp_bu =:GLOBAL_bu',
    '   AND srp_prod_id =:P93131005_ITEM;',
    'EXCEPTION WHEN NO_DATA_FOUND THEN NULL;',
    'END ;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5598578837769759021)
,p_event_id=>wwv_flow_imp.id(5598577978072759018)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P93131005_ITEM_DESC',
  'language', 'PLSQL',
  'plsql_code', ':P93131005_ITEM_DESC :=null;',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5598584375840759028)
,p_name=>'Page Load Show'
,p_static_id=>'page-load-show'
,p_event_sequence=>60
,p_condition_element=>'P93131005_FILTER_1'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5598584875519759029)
,p_event_id=>wwv_flow_imp.id(5598584375840759028)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item( "IP").show();',
    'apex.item( "SR").show();',
    'apex.item("IP").refresh')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5598585250184759029)
,p_name=>'Page Load Show_1'
,p_static_id=>'page-load-show-2'
,p_event_sequence=>70
,p_condition_element=>'P93131005_FILTER_1'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5598585790972759029)
,p_event_id=>wwv_flow_imp.id(5598585250184759029)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item( "IP").hide();',
    'apex.item( "SR").show();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5598583452827759028)
,p_name=>'Search'
,p_static_id=>'search'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5598577419547758988)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5598584020937759028)
,p_event_id=>wwv_flow_imp.id(5598583452827759028)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item( "SR").show();',
    'apex.item( "IP").hide();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5598579254835759021)
,p_name=>'Warehouse'
,p_static_id=>'warehouse'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P93131005_W_H'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5598579801850759021)
,p_event_id=>wwv_flow_imp.id(5598579254835759021)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P93131005_W_H_DESC',
  'items_to_submit', 'P93131005_W_H',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    'SELECT DISTINCT ',
    '       func_find_store_qry_desc(srp_bu,srp_store_id,1) INTO :P93131005_W_H_DESC',
    '  FROM stock_reorder_pipline',
    ' WHERE srp_bu =:GLOBAL_bu',
    '   AND srp_store_id =:P93131005_W_H;',
    'EXCEPTION WHEN NO_DATA_FOUND THEN NULL;',
    'END ;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
