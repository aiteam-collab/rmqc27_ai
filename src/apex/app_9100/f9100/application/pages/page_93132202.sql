prompt --application/pages/page_93132202
begin
--   Manifest
--     PAGE: 93132202
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
 p_id=>93132202
,p_name=>'Stock Ledger'
,p_alias=>'ICM2202'
,p_step_title=>'Stock Ledger'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(11124860992494317917)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-headerLink, .a-IRR-headerLink:hover {',
'    text-decoration: none;',
'    background: #27ec9a;',
'}',
'',
'.a-IRR-headerLabel, .a-IRR-headerLink {',
'    padding: 12px;',
'    background: #27ec9a;',
'    display: block;',
'    color: black;',
'    text-align: inherit;',
'}',
'.a-IRR-header {',
'    background-color: #27ec9a;',
'    border-top: 1px solid #e6e6e6;',
'    box-shadow: inset 1px 0 0 0 #e6e6e6;',
'    color: rgba(0, 0, 0, 0.95);',
'}',
'.t-HeroRegion-title {',
'    font-size: 1.3rem;',
'    line-height: 4rem;',
'    margin: 0;',
'    font-weight: 700;',
'}',
'',
'.t-HeroRegion {',
'    position: relative;',
'    overflow: hidden;',
'    /* display: block; */',
'    border: 1px solid rgba(0,0,0,.1);',
'    /* box-shadow: 0 2px 4px -2px rgba(0,0,0,.075); */',
'}',
'',
'.t-Form-inputContainer span.display_only {',
'    border-color: transparent;',
'    background-color: transparent;',
'    text-align: end;',
'    padding-left: 30px;',
'}',
'',
'.apex-item-textarea:focus, .apex-item-text:focus, .apex-item-select:focus, .apex-item-multi:focus, select.listmanager:focus {',
'    background: transparent;',
'    border-color: #0076df !important;',
'}',
'',
'.t-Form-inputContainer span.display_only {',
'    border-color: transparent;',
'    background-color: transparent;',
'    text-align: end;',
'    padding-left: 30px;',
'    color: var(--oj-color-required);',
'}',
'',
'#ICON .a-Icon {',
'    display: none;',
'    vertical-align: top;',
'    width: 16px;',
'    height: 16px;',
'    line-height: 16px;',
'}',
'',
'.a-IRR-message, .a-IRR-noDataMsg-text {',
'    display: block;',
'    font-size: 12px;',
'    margin-top: -58px;',
'    color: #707070;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11142505746054054411)
,p_plug_name=>'Closing Balance'
,p_static_id=>'closing-balance'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_column=>5
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11142505626030054409)
,p_plug_name=>'Opening Balance'
,p_static_id=>'opening-balance'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_column=>5
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11142502401574054377)
,p_plug_name=>'Stock Ledger'
,p_static_id=>'stock-ledger'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11142503409651054387)
,p_plug_name=>'Stock Ledger'
,p_static_id=>'stock-ledger-2'
,p_region_name=>'ICON'
,p_region_template_options=>'#DEFAULT#:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT sttr_trans_date "Date",',
'       sttr_source_doc "Vou. Type",',
'       sttr_vou_pfx "Vou. Pfx.",',
'       sttr_vou_no "Vou. No.",',
'       sttr_ref1 "Reference",',
'       sttr_trans_qty "Trans. Qty.",',
'       sttr_bc_unit_cost "Unit Cost",',
'       (sttr_trans_qty * sttr_bc_unit_cost) "Trans. Value",',
'       sttr_bucket_type "Bucket Type"',
'  FROM STOCK_TRANS',
' WHERE sttr_bu=:GLOBAL_BU',
'	AND (STTR_STORE_ID = :P93132202_WAREHOUSE OR :P93132202_WAREHOUSE IS NULL)',
'	AND (STTR_PROD_ID = :P93132202_ITEM OR :P93132202_ITEM IS NULL) ',
'	AND (STTR_PROD_REV = :P93132202_ITEM_REV OR :P93132202_ITEM_REV IS NULL)',
'	AND (STTR_TRANS_DATE between :P93132202_FROM_DATE AND :P93132202_TO_DATE)',
'	AND (sttr_bucket_type = :P93132202_BUCKET_type OR :P93132202_BUCKET_type IS NULL)',
' ORDER BY STTR_TRANS_DATE,STTR_TRANS_SEQ_NO,STTR_ORDER_NO',
' '))
,p_plug_source_type=>'NATIVE_IR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(11142503440633054388)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'<center><img src="#APP_IMAGES#ndf7.png" style=" height:210px; width:max-content;"alt="Smiley face"></center>'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>4998661411226533127
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11142504393717054397)
,p_db_column_name=>'Bucket Type'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Bucket Type'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11142503539572054389)
,p_db_column_name=>'Date'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'dd.mm.yyyy'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11142503973848054393)
,p_db_column_name=>'Reference'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11142504083940054394)
,p_db_column_name=>'Trans. Qty.'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Trans. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11142504258342054396)
,p_db_column_name=>'Trans. Value'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Trans. Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11142504178993054395)
,p_db_column_name=>'Unit Cost'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Unit Cost'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11142503902330054392)
,p_db_column_name=>'Vou. No.'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Vou. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11142503803381054391)
,p_db_column_name=>'Vou. Pfx.'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Vou. Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11142503630840054390)
,p_db_column_name=>'Vou. Type'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Vou. Type'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11150714415182436575)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'50068724'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'Date:Vou. Type:Vou. Pfx.:Vou. No.:Reference:Trans. Qty.:Unit Cost:Trans. Value:Bucket Type'
,p_sum_columns_on_break=>'Trans. Qty.:Trans. Value'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11142504464526054398)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(11142502401574054377)
,p_button_name=>'LOAD'
,p_static_id=>'load'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load'
,p_grid_new_row=>'N'
,p_grid_column_span=>2
,p_grid_column=>6
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11142503076867054384)
,p_name=>'P93132202_BUCKET_TYPE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(11142502401574054377)
,p_prompt=>'<b>Bucket Type</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:QOH;QOH,SIT;SIT'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All'
,p_cHeight=>1
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11150790880298083065)
,p_name=>'P93132202_CLS_LABEL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11142505746054054411)
,p_item_default=>'Closing Balance :'
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-bottom-none:margin-left-lg'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11150790557779083062)
,p_name=>'P93132202_CL_QTY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11142505746054054411)
,p_item_default=>'0'
,p_prompt=>'Qty.'
,p_format_mask=>'99G99G99G99G99G990D000'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cattributes_element=>'readonly=readonly'
,p_tag_attributes=>'readonly=readonly; style="background:#fdd491;text-align:right";'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11142504861077054402)
,p_name=>'P93132202_CL_UNIT_COST'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11142505746054054411)
,p_item_default=>'0'
,p_prompt=>'Unit Cost'
,p_format_mask=>'99G99G99G99G99G990D00000'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly; style="background:#99dff1;text-align:right";'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11150790750766083064)
,p_name=>'P93132202_CL_VAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11142505746054054411)
,p_item_default=>'0'
,p_prompt=>'Value'
,p_format_mask=>'99G99G99G99G99G990D00'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cattributes_element=>'readonly=readonly'
,p_tag_attributes=>'readonly=readonly; style="background:#f7c3bf;text-align:right";'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11142502890870054382)
,p_name=>'P93132202_FROM_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(11142502401574054377)
,p_item_default=>'trunc(sysdate,''MM'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'<b>From Date</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11142502545980054379)
,p_name=>'P93132202_ITEM'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11142502401574054377)
,p_prompt=>'<b>Item / Rev.</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT sttr_prod_id prod_desc11,',
'                  sttr_prod_id',
'    FROM stock_trans, products',
'   WHERE     sttr_bu = prod_bu',
'         AND sttr_prod_id = prod_id',
'         AND sttr_prod_rev = prod_rev',
'         AND sttr_bu = :GLOBAL_bu',
'         AND (sttr_store_id = :P93132202_warehouse OR :P93132202_warehouse IS NULL)',
'ORDER BY sttr_prod_id'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P93132202_WAREHOUSE'
,p_ajax_items_to_submit=>'P93132202_WAREHOUSE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11142502791002054381)
,p_name=>'P93132202_ITEM_DESC'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(11142502401574054377)
,p_prompt=>'<b>Item Desc.</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11142502661036054380)
,p_name=>'P93132202_ITEM_REV'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11142502401574054377)
,p_prompt=>'Rev.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_grid_column=>12
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11142505679783054410)
,p_name=>'P93132202_OP_LABEL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11142505626030054409)
,p_item_default=>'Opening Balance :'
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#:margin-left-lg:margin-right-none'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11142505483840054408)
,p_name=>'P93132202_OP_QTY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11142505626030054409)
,p_item_default=>'0'
,p_prompt=>'Qty.'
,p_format_mask=>'99G99G99G99G99G990D000'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly; style="background:#fdd491;text-align:right";'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11142505271331054406)
,p_name=>'P93132202_OP_UNIT_COST'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11142505626030054409)
,p_item_default=>'0'
,p_prompt=>'Unit Cost'
,p_format_mask=>'99G99G99G99G99G990D00000'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly; style="background:#99dff1;text-align:right";'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11142505090671054404)
,p_name=>'P93132202_OP_VAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11142505626030054409)
,p_item_default=>'0'
,p_prompt=>'Value'
,p_format_mask=>'999G999G999G999G990D0000'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly; style="background:#f7c3bf;text-align:right";'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11142503003623054383)
,p_name=>'P93132202_TO_DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(11142502401574054377)
,p_item_default=>'trunc(sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'<b>To Date</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11142502444314054378)
,p_name=>'P93132202_WAREHOUSE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11142502401574054377)
,p_prompt=>'<b>Warehouse</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT         ',
'         func_find_store_desc (sttr_bu, sttr_store_id, 1)',
'            store_desc,',
'         sttr_store_id',
'    FROM stock_trans',
'   WHERE sttr_bu = :global_bu',
'ORDER BY sttr_store_id'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select Warehouse'
,p_cSize=>30
,p_colspan=>6
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(11142504719595054400)
,p_validation_name=>'Item_must_be'
,p_static_id=>'item-must-be'
,p_validation_sequence=>20
,p_validation=>'P93132202_ITEM'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Item must be enter.'
,p_associated_item=>wwv_flow_imp.id(11142502545980054379)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(11142504619509054399)
,p_validation_name=>'WH_must_be_enter'
,p_static_id=>'wh-must-be-enter'
,p_validation_sequence=>10
,p_validation=>'P93132202_WAREHOUSE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Warehouse must be enter.'
,p_associated_item=>wwv_flow_imp.id(11142502444314054378)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11142503213871054385)
,p_name=>'Item_Desc.'
,p_static_id=>'item-desc'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P93132202_ITEM'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11142503271442054386)
,p_event_id=>wwv_flow_imp.id(11142503213871054385)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P93132202_ITEM_DESC,P93132202_ITEM_REV',
  'items_to_submit', 'P93132202_ITEM,P93132202_WAREHOUSE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '',
    'SELECT DISTINCT prod_desc11,sttr_prod_rev INTO :P93132202_ITEM_DESC,:P93132202_ITEM_REV',
    '    FROM stock_trans, products',
    '   WHERE     sttr_bu = prod_bu',
    '         AND sttr_prod_id = prod_id',
    '         AND sttr_prod_rev = prod_rev',
    '         AND sttr_bu = :GLOBAL_bu',
    '         AND (sttr_store_id = :P93132202_warehouse OR :P93132202_warehouse IS NULL)',
    '         AND (sttr_prod_id=:P93132202_ITEM OR :P93132202_ITEM IS NULL);',
    '',
    '',
    'EXCEPTION WHEN OTHERS THEN',
    '',
    'NULL;',
    '',
    '',
    'END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11150790929885083066)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Asgn_Value'
,p_static_id=>'asgn-value'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':p93132202_cl_unit_cost:=0;',
':P93132202_OP_VAL:=0;',
':P93132202_OP_UNIT_COST:=0;',
':p93132202_op_qty:=0;',
':p93132202_cl_val:=0;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11142504464526054398)
,p_internal_uid=>5668829094341472038
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11142504775152054401)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FUNC_CLBAL_COST'
,p_static_id=>'func-clbal-cost'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   c_cost   NUMBER := 0;',
'',
'   CURSOR c1',
'   IS',
'      SELECT NVL (',
'                CASE',
'                   WHEN SUM (sttr_trans_qty) = 0',
'                   THEN',
'                      0',
'                   ELSE',
'                      SUM (sttr_trans_qty * sttr_bc_unit_cost)',
'                      / SUM (sttr_trans_qty)',
'                END,',
'                0)',
'                cl_cost',
'        FROM stock_trans',
'       WHERE     sttr_bu = :global_bu',
'             AND sttr_store_id = :p93132202_warehouse',
'             AND sttr_prod_id = :p93132202_item',
'             AND sttr_prod_rev = :p93132202_item_rev',
'             AND sttr_trans_date <= :p93132202_to_date',
'             AND sttr_bucket_type = ''QOH'';',
'BEGIN',
'   FOR cr1 IN c1',
'   LOOP',
'      c_cost := cr1.cl_cost;',
'   END LOOP;',
'   :P93132202_CL_QTY:=:P93132202_OP_QTY + 900;',
'   :p93132202_cl_unit_cost := ROUND(c_cost,5);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11142504464526054398)
,p_internal_uid=>5660542939608443373
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11142504984958054403)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FUNC_CLBAL_VALUE'
,p_static_id=>'func-clbal-value'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   op_bal   NUMBER (15, 3);',
'BEGIN',
'   SELECT NVL (SUM (sttr_trans_qty * sttr_bc_unit_cost), 0)',
'     INTO op_bal',
'     FROM stock_trans',
'    WHERE     sttr_bu = :global_bu',
'          AND sttr_store_id = :p93132202_warehouse',
'          AND sttr_prod_id = :p93132202_item',
'          AND sttr_prod_rev = :p93132202_item_rev',
'          AND sttr_bucket_type = ''QOH''',
'          AND sttr_trans_date BETWEEN :p93132202_from_date',
'                                  AND :p93132202_to_date;',
'',
'   :p93132202_cl_val := :p93132202_op_val + ROUND (op_bal, 2);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11142504464526054398)
,p_internal_uid=>5660543149414443375
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11142505174644054405)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FUNC_OPBAL_COST'
,p_static_id=>'func-opbal-cost'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   opc   NUMBER := 0;',
'',
'   CURSOR c1',
'   IS',
'      SELECT NVL (',
'                CASE',
'                   WHEN SUM (sttr_trans_qty) = 0',
'                   THEN',
'                      0',
'                   ELSE',
'                      SUM (sttr_trans_qty * sttr_bc_unit_cost)',
'                      / SUM (sttr_trans_qty)',
'                END,',
'                0)',
'                op_cost',
'        FROM stock_trans',
'       WHERE     sttr_bu = :global_bu',
'             AND sttr_store_id = :p93132202_warehouse',
'             AND sttr_prod_id = :p93132202_item',
'             AND sttr_prod_rev = :p93132202_item_rev',
'             AND sttr_trans_date < :p93132202_from_date',
'             AND sttr_bucket_type = ''QOH'';',
'BEGIN',
'   FOR cr1 IN c1',
'   LOOP',
'      opc := cr1.op_cost;',
'   END LOOP;',
'',
'   :P93132202_OP_UNIT_COST := ROUND(opc,5);',
'   ',
'   :P93132202_OP_VAL:=ROUND(:p93132202_op_qty * :P93132202_OP_UNIT_COST,2);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11142504464526054398)
,p_internal_uid=>5660543339100443377
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11142505394897054407)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FUNC_OPBAL_QTY'
,p_static_id=>'func-opbal-qty'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   op_bal   NUMBER (15, 3);',
'BEGIN',
'   SELECT ROUND(NVL (SUM (sttr_trans_qty), 0),3)',
'     INTO :p93132202_op_qty',
'     FROM stock_trans',
'    WHERE     sttr_bu = :global_bu',
'          AND sttr_store_id = :p93132202_warehouse',
'          AND sttr_prod_id = :p93132202_item',
'          AND sttr_prod_rev = :p93132202_item_rev',
'          AND sttr_bucket_type = ''QOH''',
'          AND sttr_trans_date < :p93132202_from_date;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11142504464526054398)
,p_internal_uid=>5660543559353443379
);
wwv_flow_imp.component_end;
end;
/
