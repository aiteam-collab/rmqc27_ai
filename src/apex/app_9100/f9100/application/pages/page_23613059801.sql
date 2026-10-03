prompt --application/pages/page_23613059801
begin
--   Manifest
--     PAGE: 23613059801
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
 p_id=>23613059801
,p_name=>'Email - Sent / Unsent'
,p_alias=>'EMAIL-SENT-UNSENT'
,p_step_title=>'Email - Sent / Unsent'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Region background-color By Prasanth M */',
'',
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
'}',
'',
'/*radio option  By Prasanth M */',
'.apex-item-group--rc input+label {',
'    display: inline-block;',
'    margin-top: 15px;',
'    margin-left: 25px;',
'    margin-bottom: 4px;',
'    min-height: var(--a-checkbox-size, 16px);',
'}',
'',
'/*  Interactive Report  By Prasanth M  */',
'.a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'}',
' .t-fht-thead {',
'    overflow: auto !important;',
' }',
'',
'#Clear{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: #D2D2DF;',
'   background-size: 25px;',
'   width: 27px;',
'   height: 24px;',
'   top: 0px;',
'}',
'',
'#addbtn{',
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
'.a-IRR-headerLink, .a-IRR-headerLink:hover {',
'    text-decoration: none;',
'    background: #00b1e7 !important;',
'    color: #ffffff !important;',
'    font-family: Arial !important;',
'}'))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7004711239382021234)
,p_plug_name=>'Find'
,p_static_id=>'find'
,p_parent_plug_id=>wwv_flow_imp.id(7004712009578021241)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_region_attributes=>'style="box-shadow: 5px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7004712009578021241)
,p_plug_name=>'MAIN'
,p_static_id=>'main'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7005228699749309465)
,p_plug_name=>'Report'
,p_static_id=>'report'
,p_parent_plug_id=>wwv_flow_imp.id(7004712009578021241)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       EOH_BU,',
'       EOH_DOC_NO,',
'       EOH_DOC_DATE,',
'       EOH_SNDR_EMAIL,',
'       EOH_SUBJ,',
'       EOH_BODY,',
'       EOH_USER_ID,',
'       EOH_EMP_ID,',
'       EOH_VOU_TYPE,',
'       EOH_VOU_PFX,',
'       EOH_VOU_NO,',
'       EOH_STATUS,',
'       EOH_UNIT,',
'       (SELECT UPPER(bup_name1)',
'          FROM bus_unit_plants',
'         WHERE bup_bu       = EOH_BU',
'           AND bup_plant_id = EOH_UNIT ) UNIT_DESC,',
'       EOH_WF_TYPE,',
'       EOH_SEQ_NO,',
'       EOH_MAIL_TYPE,',
'       EOH_MAIL_SEND_OPT,',
'       (select eorl_rcvr_email',
'         from email_outbox_rcvr_list',
'        where eorl_bu = eoh_bu',
'          and eorl_doc_no = eoh_doc_no) eorl_rcvr_email,',
'       (select eorl_cc_email',
'         from email_outbox_rcvr_list',
'        where eorl_bu = eoh_bu',
'          and eorl_doc_no = eoh_doc_no) eorl_cc_email',
'  from EMAIL_OUTBOX_HD',
' where EOH_BU    = :GLOBAL_bu ',
'   and :P23613059801_SHOW_DATA = ''Y'''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P23613059801_SEND_ON_FROM,P23613059801_SEND_ON_TO,P23613059801_CC,P23613059801_SUBJECT,P23613059801_SU,P23613059801_SHOW_DATA'
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
 p_id=>wwv_flow_imp.id(7005228749035309466)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1523266913491698438
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7005229434906309472)
,p_db_column_name=>'EOH_BODY'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Body'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7005228875056309467)
,p_db_column_name=>'EOH_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Eoh Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7005229054198309469)
,p_db_column_name=>'EOH_DOC_DATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7005228972887309468)
,p_db_column_name=>'EOH_DOC_NO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Doc. No.'
,p_column_link=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.::P24_EORL_DOC_NO:#EOH_DOC_NO#'
,p_column_linktext=>'#EOH_DOC_NO#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7005229580305309474)
,p_db_column_name=>'EOH_EMP_ID'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Eoh Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7005663590445381243)
,p_db_column_name=>'EOH_MAIL_SEND_OPT'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Eoh Mail Send Opt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7005663493155381242)
,p_db_column_name=>'EOH_MAIL_TYPE'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Eoh Mail Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7007009099082787158)
,p_db_column_name=>'EOH_SEQ_NO'
,p_display_order=>280
,p_column_identifier=>'AO'
,p_column_label=>'Eoh Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7005229192405309470)
,p_db_column_name=>'EOH_SNDR_EMAIL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Sent Email'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7005230024975309478)
,p_db_column_name=>'EOH_STATUS'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Eoh Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7005229237979309471)
,p_db_column_name=>'EOH_SUBJ'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Subject'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7005662208534381229)
,p_db_column_name=>'EOH_UNIT'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Eoh Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7005229458903309473)
,p_db_column_name=>'EOH_USER_ID'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Eoh User Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7005229863211309477)
,p_db_column_name=>'EOH_VOU_NO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Eoh Vou No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7005229819251309476)
,p_db_column_name=>'EOH_VOU_PFX'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Eoh Vou Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7005229722607309475)
,p_db_column_name=>'EOH_VOU_TYPE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Eoh Vou Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7005662241233381230)
,p_db_column_name=>'EOH_WF_TYPE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Eoh Wf Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7007010111611787168)
,p_db_column_name=>'EORL_CC_EMAIL'
,p_display_order=>380
,p_column_identifier=>'AY'
,p_column_label=>'CC'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7007009987216787167)
,p_db_column_name=>'EORL_RCVR_EMAIL'
,p_display_order=>370
,p_column_identifier=>'AX'
,p_column_label=>'To Email'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7007009769620787165)
,p_db_column_name=>'ROWID'
,p_display_order=>350
,p_column_identifier=>'AV'
,p_column_label=>'Rowid'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7007009846070787166)
,p_db_column_name=>'UNIT_DESC'
,p_display_order=>360
,p_column_identifier=>'AW'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7005679939576386992)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'15237182'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'EOH_DOC_NO:EOH_DOC_DATE:EOH_SNDR_EMAIL:EORL_RCVR_EMAIL:EORL_CC_EMAIL:EOH_SUBJ:EOH_BODY:EOH_STATUS:EOH_UNIT:EOH_WF_TYPE:EOH_MAIL_TYPE:EOH_MAIL_SEND_OPT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7004714956964021271)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(7004711239382021234)
,p_button_name=>'ADD'
,p_static_id=>'add'
,p_button_static_id=>'addbtn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7004715152998021273)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(7004711239382021234)
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
 p_id=>wwv_flow_imp.id(7004715305769021274)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(7004711239382021234)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_static_id=>'cancelbtn'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7004715134443021272)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(7004711239382021234)
,p_button_name=>'REPORT'
,p_static_id=>'report'
,p_button_static_id=>'savebtn'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Report'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7004711733711021238)
,p_name=>'P23613059801_CC'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7004711239382021234)
,p_use_cache_before_default=>'NO'
,p_prompt=>'CC'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT eorl_cc_email ',
'  FROM email_outbox_vw',
' WHERE eoh_bu = :GLOBAL_bu',
'   AND eorl_cc_email  IS NOT NULL',
' GROUP BY eorl_cc_email'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
  'title', 'Select the CC',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7004711529555021236)
,p_name=>'P23613059801_SEND_ON_FROM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7004711239382021234)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Send On From'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT eoh_sndr_email ',
'  FROM email_outbox_vw',
' WHERE eoh_bu = :GLOBAL_bu',
'   AND eoh_sndr_email IS NOT NULL',
' GROUP BY eoh_sndr_email'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>3
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
  'title', 'Select the Send On From',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7004711559180021237)
,p_name=>'P23613059801_SEND_ON_TO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7004711239382021234)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Send On To'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT eorl_rcvr_email ',
'  FROM email_outbox_vw',
' WHERE eoh_bu = :GLOBAL_bu',
'   AND eorl_rcvr_email IS NOT NULL',
' GROUP BY eorl_rcvr_email'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
  'title', 'Select the Send On To',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7004714907516021270)
,p_name=>'P23613059801_SHOW_DATA'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7004711239382021234)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7004711921009021240)
,p_name=>'P23613059801_SU'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7004711239382021234)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Send / Unsend'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Sent;S,Unsend;U'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7004711834792021239)
,p_name=>'P23613059801_SUBJECT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7004711239382021234)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Subject'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT eoh_subj ',
'  FROM email_outbox_vw',
' WHERE eoh_bu = :GLOBAL_bu',
'   AND eoh_subj IS NOT NULL',
' GROUP BY eoh_subj'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
  'title', 'Select the Subject',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7004715693931021278)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7004715152998021273)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7005225119030309429)
,p_event_id=>wwv_flow_imp.id(7004715693931021278)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P23613059801_SEND_ON_FROM,P23613059801_SEND_ON_TO,P23613059801_CC,P23613059801_SUBJECT,P23613059801_SU,P23613059801_SHOW_DATA'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7004715402694021275)
,p_name=>'Report'
,p_static_id=>'report'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7004715134443021272)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7049888914809369058)
,p_event_id=>wwv_flow_imp.id(7004715402694021275)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7005228699749309465)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7004715473980021276)
,p_event_id=>wwv_flow_imp.id(7004715402694021275)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P23613059801_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
