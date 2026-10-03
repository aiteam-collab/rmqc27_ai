prompt --application/pages/page_23613059817
begin
--   Manifest
--     PAGE: 23613059817
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
 p_id=>23613059817
,p_name=>'Whatsapp Sent / Unsent'
,p_alias=>'WHATSAPP-SENT-UNSENT1'
,p_step_title=>'Whatsapp Sent / Unsent'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*    radio option    */',
'.apex-item-group--rc input+label {',
'    display: inline-block;',
'    margin-top: 15px;',
'    margin-left: 25px;',
'    margin-bottom: 4px;',
'    min-height: var(--a-checkbox-size, 16px);',
'}',
'/*    Clear icon      */',
'#Clear{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: #D2D2DF;',
'   background-size: 25px;',
'   width: 26px;',
'   height: 24px;',
'   top: 0px;',
'}',
'',
'',
'/*----------------------------------------------------------------------------------*/',
'',
'#fav',
'{',
'color: #ff0000;',
'background-color: rgba(0, 0, 0, 0.15)',
'};',
'',
'',
'#add{',
'        color: blue;',
'        background-color: rgba(0, 0, 0, 0.15);',
'}',
'',
'#savebtn{',
'                color: green;',
'                background-color: rgba(0, 0, 0, 0.15);',
'}',
'#cancelbtn{',
'                color: rgb(214, 19, 29);',
'                background-color: rgba(0, 0, 0, 0.15);',
'}',
'',
'#fav{',
'                color: rgb(214, 19, 29);',
'                background-color: rgba(0, 0, 0, 0.15);',
'}',
'',
'.t-Button--success {',
'    --a-button-background-color: #e0e0e0;',
'     --a-button-text-color: #047827; ',
'    --a-button-hover-background-color: #e0e0e0;',
'    --a-button-hover-text-color: var(--a-button-text-color);',
'     --a-button-active-background-color: #e0e0e0;',
'    --a-button-active-text-color: var(--a-button-hover-text-color);',
'    --a-button-focus-background-color: var(--a-button-hover-background-color);',
'    --a-button-focus-text-color: var(--a-button-hover-text-color);',
'}',
'',
'.a-IRR-headerLink, .a-IRR-headerLink:hover {',
'',
'    background: #00b1e7 !important;',
'}',
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
'',
' a {',
'    color: #337AC0;',
' }',
'',
'',
'/* Region background-color By Prasanth M */',
'.t-Region {',
'    display: block;',
'    border-width: var(--ut-region-border-width, var(--ut-component-border-width, 1px));',
'    border-style: solid;',
'    /* border-color: var(--ut-region-border-color, var(--ut-component-border-color)); */',
'    border-radius: var(--ut-region-border-radius, var(--ut-component-border-radius));',
'    box-shadow: var(--ut-region-box-shadow, var(--ut-component-box-shadow));',
'    margin-bottom: var(--ut-region-margin, 16px);',
'    background-color: aliceblue;',
'    color: var(--ut-region-text-color, var(--ut-component-text-default-color));',
'    font-size: var(--ut-region-font-size, 14px);',
'    line-height: var(--ut-region-line-height, 20px);',
'}'))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7110983357947008929)
,p_plug_name=>'FIND'
,p_static_id=>'find'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7007010519390787172)
,p_plug_name=>'Report'
,p_static_id=>'report'
,p_parent_plug_id=>wwv_flow_imp.id(7110983357947008929)
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wov_bu,',
'       wov_seq_no,',
'       type1,',
'       TO_CHAR(wov_date,''DD-MM-RRRR'')wov_date,',
'       wov_benf_id,',
'       wov_benf_name,',
'       wov_template_desc,',
'       wov_mobile_no,',
'       wov_benf_type,',
'       DECODE (wov_benf_type,''E'',''Employee'',''C'',''Customer'',''S'',''Supplier'') benf_type,',
'       DECODE (status,''S'',''Send'',''U'',''Unsend'')status_decode,',
'       CASE status WHEN ''S'' THEN ''Green'' WHEN ''U'' THEN ''Red'' END color,',
'       status',
'  FROM (SELECT  wov_bu,',
'                wov_seq_no,',
'		         ''W'' type1,',
'                wov_date,',
'		          wov_benf_id ,',
'                wov_benf_name,',
'                wov_template_desc,',
'		          wov_mobile_no,',
'                wov_benf_type,',
'		          ''U'' status',
'          FROM whatsapp_outbox_vw',
'         WHERE wov_bu     = :GLOBAL_bu',
'           AND wov_status = ''N''',
'         UNION ALL',
'         SELECT wov_bu,',
'                wov_seq_no,',
'		         ''W'' type1,',
'                wov_date,',
'		          wov_benf_id ,',
'                wov_benf_name,',
'                wov_template_desc,',
'		          wov_mobile_no,',
'                wov_benf_type,',
'		         ''S'' status',
'           FROM whatsapp_outbox_vw',
'          WHERE wov_bu = :GLOBAL_bu',
'            AND wov_status <> ''N'' )',
'          WHERE wov_bu  = :GLOBAL_bu',
'            AND :P23613059817_SHOW_DATA = ''Y''',
'            AND (status            = :P23613059817_SEND_UNSEND OR :P23613059817_SEND_UNSEND IS NULL)',
'            AND (wov_mobile_no     = :P23613059817_MOBILE_NO   OR :P23613059817_MOBILE_NO   IS NULL)',
'            AND (wov_template_desc = :P23613059817_TEMPLATE    OR :P23613059817_TEMPLATE    IS NULL)',
'            AND (wov_benf_type     = :P23613059817_TYPE        OR :P23613059817_TYPE        IS NULL)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P23613059817_TEMPLATE,P23613059817_MOBILE_NO,P23613059817_BENEFICIARY,P23613059817_TYPE,P23613059817_SEND_UNSEND,P23613059817_SHOW_DATA'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Report'
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
 p_id=>wwv_flow_imp.id(7007010559433787173)
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
,p_internal_uid=>1525048723890176145
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111536352679663141)
,p_db_column_name=>'BENF_TYPE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111536279500663140)
,p_db_column_name=>'COLOR'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111535514910663132)
,p_db_column_name=>'STATUS'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111536231441663139)
,p_db_column_name=>'STATUS_DECODE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Send Type'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#STATUS_DECODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7007010886597787176)
,p_db_column_name=>'TYPE1'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Type1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7007011134803787178)
,p_db_column_name=>'WOV_BENF_ID'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Benf. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111536057690663138)
,p_db_column_name=>'WOV_BENF_NAME'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Benf. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111535410394663131)
,p_db_column_name=>'WOV_BENF_TYPE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'WOV_BENF_TYPE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7007010704024787174)
,p_db_column_name=>'WOV_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Wov Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111536523635663142)
,p_db_column_name=>'WOV_DATE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111535275186663130)
,p_db_column_name=>'WOV_MOBILE_NO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Mobile No.'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7007010797216787175)
,p_db_column_name=>'WOV_SEQ_NO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Wov Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7111535181044663129)
,p_db_column_name=>'WOV_TEMPLATE_DESC'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Template'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7111658501256760399)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'16296967'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WOV_DATE:WOV_BENF_ID:WOV_BENF_NAME:WOV_TEMPLATE_DESC:BENF_TYPE:WOV_MOBILE_NO:STATUS_DECODE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7111535537426663133)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(7110983357947008929)
,p_button_name=>'ADD'
,p_static_id=>'add'
,p_button_static_id=>'add'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7111535685513663134)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(7110983357947008929)
,p_button_name=>'Clear'
,p_static_id=>'clear'
,p_button_static_id=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7111535907479663136)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(7110983357947008929)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_static_id=>'cancelbtn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-close'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7111535980146663137)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(7110983357947008929)
,p_button_name=>'Favourite'
,p_static_id=>'favourite'
,p_button_static_id=>'fav'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favourite'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-heart-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7111535786670663135)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(7110983357947008929)
,p_button_name=>'Go_Report'
,p_static_id=>'go-report'
,p_button_static_id=>'savebtn'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Go Report'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7111539745055663175)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(7110983357947008929)
,p_button_name=>'New'
,p_static_id=>'new'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'New'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:23613059818:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7111537272413663150)
,p_branch_name=>'Close'
,p_branch_action=>'&GLOBAL_HOME_URL.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(7111535907479663136)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7111537369345663151)
,p_branch_name=>'ADD'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7110983643482008932)
,p_name=>'P23613059817_BENEFICIARY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7110983357947008929)
,p_prompt=>'Beneficiary ID / Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wov_benf_name,wov_benf_id',
'  FROM whatsapp_outbox_vw',
' WHERE wov_bu = :GLOBAL_bu',
' GROUP BY wov_benf_id,',
'          wov_benf_name',
' ORDER BY wov_benf_name'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Beneficiary ID / Name',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7110983576257008931)
,p_name=>'P23613059817_MOBILE_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7110983357947008929)
,p_prompt=>'Mobile No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wov_mobile_no ',
'  FROM whatsapp_outbox_vw',
' WHERE wov_bu = :GLOBAL_bu',
' GROUP BY wov_mobile_no'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Mobile No.',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7110983925858008934)
,p_name=>'P23613059817_SEND_UNSEND'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7110983357947008929)
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Send;S,Unsend;U'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '3',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7111536587729663143)
,p_name=>'P23613059817_SHOW_DATA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7110983357947008929)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7110983487531008930)
,p_name=>'P23613059817_TEMPLATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7110983357947008929)
,p_prompt=>'Template'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  wov_template_desc',
'       -- wov_template_id',
'  FROM ( SELECT wov_template_id,',
'                wov_template_desc',
'           FROM whatsapp_outbox_vw',
'          WHERE wov_bu = :GLOBAL_bu',
'            AND wov_status = ''N''',
'          UNION ALL',
'         SELECT wov_template_id,',
'                wov_template_desc',
'           FROM whatsapp_outbox_vw',
'          WHERE wov_bu = :GLOBAL_bu',
'            AND wov_status <> ''N'')',
'          GROUP BY wov_template_id,',
'                   wov_template_desc',
' ORDER BY wov_template_desc'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Template',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7110983752899008933)
,p_name=>'P23613059817_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7110983357947008929)
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Employee;E,Customer;C,Supplier;S'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7111536994853663147)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7111535685513663134)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7111537053164663148)
,p_event_id=>wwv_flow_imp.id(7111536994853663147)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P23613059817_TEMPLATE,P23613059817_MOBILE_NO,P23613059817_BENEFICIARY,P23613059817_TYPE,P23613059817_SEND_UNSEND,P23613059817_SHOW_DATA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7111537160151663149)
,p_event_id=>wwv_flow_imp.id(7111536994853663147)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7007010519390787172)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7111536733418663144)
,p_name=>'Go_Report'
,p_static_id=>'go-report'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7111535786670663135)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7111536854849663146)
,p_event_id=>wwv_flow_imp.id(7111536733418663144)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7007010519390787172)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7111536777566663145)
,p_event_id=>wwv_flow_imp.id(7111536733418663144)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P23613059817_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
