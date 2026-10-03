prompt --application/pages/page_23613001041
begin
--   Manifest
--     PAGE: 23613001041
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
 p_id=>23613001041
,p_name=>'Work Flow Approval List'
,p_alias=>'WORK-FLOW-APPROVAL-LIST'
,p_step_title=>'Work Flow Approval List'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'ref_fav();'
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
'',
'#fav',
'{',
'color: #ff0000;',
'background-color: rgba(255, 255, 255, 0.15)',
'};',
'',
'',
'#cancelbtn{',
'        color: rgb(214, 19, 29);',
'        background-color:  #ffffff;',
'}',
'',
'#cancelbtn1{',
'         color: rgb(214, 19, 29);',
'         background-color: #ffffff;',
'}',
'',
'#Clear{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   /* background-color: rgba(0, 0, 0, 0.15); */',
'   background-color: #ffffff;',
'   background-size: 25px;',
'   width: 25px;',
'   height: 22px;',
'   --top: -4px;',
'}',
'',
'.t-Button--primary:not(.t-Button--simple):not(.t-Button--hot), .t-Button--primary:not(.t-Button--simple):not(.t-Button--hot):active, .t-Button--primary:not(.t-Button--simple):not(.t-Button--hot).is-active {',
'    background-color: #ffffff;',
'    border-radius: 6.5px;',
'}'))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7471124611024002670)
,p_plug_name=>'Header'
,p_static_id=>'header'
,p_title=>'Find Work Flow Approval Access'
,p_region_name=>'find'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7471124816280002672)
,p_plug_name=>'Work Flow Approval Access'
,p_static_id=>'work-flow-approval-access'
,p_title=>'Report : Work Flow Approval List'
,p_parent_plug_id=>wwv_flow_imp.id(7471124611024002670)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--controlsPosEnd:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7471126453660002688)
,p_plug_name=>'Work_Flow_Report'
,p_static_id=>'work-flow-report'
,p_title=>'Result(s)'
,p_region_name=>'detail'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hiddenOverflow:margin-top-sm:margin-bottom-none'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wf_bus_proc_id,',
'       wf_bus_proc_desc,',
'       Decode(wf_basis,''E'',''Entity'',''U'',''Unit'')wf_basis,',
'       wf_basis wf_basis1,',
'       wf_module,',
'       wf_self_appr_flag wf_self_appr_flag1,',
'       Decode(wf_self_appr_flag,''Y'',''Yes'',''N'',''No'')wf_self_appr_flag,             ',
'       CASE wf_status WHEN ''E'' THEN ''Draft''',
'                      WHEN ''N'' THEN ''Entry Completed''',
'                      WHEN ''A'' THEN ''Approved''',
'                      WHEN ''C'' THEN ''Cancelled''',
'        END status,',
'       CASE wf_status WHEN ''E'' THEN ''Blue''',
'                      WHEN ''N'' THEN ''Brown''',
'                      WHEN ''A'' THEN ''Green''',
'                      WHEN ''C'' THEN ''Red''',
'        END color,',
'       wf_status, wf_doc_date,wf_doc_no, wf_doc_rev,',
'       wf_seq_no,',
'       wf_cre_by,',
'       wf_cre_emp_id,',
'       (SELECT emp_first_name1 FROM employees WHERE emp_bu = wf_bu AND emp_emp_id = wf_cre_emp_id) wf_cre_emp_name,',
'       (CASE WHEN wf_status = ''A'' THEN wf_upd_emp_id ELSE NULL END) wf_appr_emp_id,',
'       (CASE WHEN wf_status = ''A'' THEN (SELECT emp_first_name1 FROM employees WHERE emp_bu = wf_bu AND emp_emp_id = wf_upd_emp_id) ELSE NULL END) wf_app_emp_name,',
'       TO_CHAR(wf_cre_date,''DD-MM-YYYY HH:MI:SS AM'') CRE_DATE,',
'       TO_CHAR((SELECT wfdcl_action_date                  ',
'          FROM wf_doc_control_log',
'         WHERE wfdcl_bu   = :global_bu',
'           AND wfdcl_doc_no = wf_doc_no',
'           AND WFDCL_TYPE = ''WF_WORK_FLOW''',
'           and wfdcl_status = ''A''',
'           AND ROWNUM = 1),''DD-MM-YYYY HH:MI:SS AM'')wfdcl_action_date,',
'       (SELECT (SELECT EMP_FIRST_NAME1',
'                 FROM EMPLOYEES',
'                WHERE EMP_BU     = wfdcl_bu',
'                  AND EMP_EMP_ID = wfdcl_ctrl_person) appr_by                   ',
'          FROM wf_doc_control_log',
'         WHERE wfdcl_bu   = :global_bu',
'           AND wfdcl_doc_no = wf_doc_no',
'           and wfdcl_status = ''A''',
'           AND WFDCL_TYPE = ''WF_WORK_FLOW''',
'           AND ROWNUM = 1) appr_by,',
'           TO_CHAR(wf_doc_date,''DD-MON-YYYY'') DOC_DATE',
' FROM  work_flow',
'WHERE  wf_bu = :global_bu',
'  AND (wf_bus_proc_id LIKE ''%'' || :P23613001041_WORK_FLOW_NAME || ''%'' OR :P23613001041_WORK_FLOW_NAME IS NULL)',
'  AND (wf_basis LIKE ''%'' || :P23613001041_AUTH_BASSIS || ''%'' OR :P23613001041_AUTH_BASSIS IS NULL)',
'  AND (wf_module LIKE ''%'' || :P23613001041_MODULE || ''%'' OR :P23613001041_MODULE IS NULL)',
'  AND (trunc(wf_doc_date) >= to_date(:P23613001041_DATE_FROM,''DD-MON-YYYY'') OR to_date(:P23613001041_DATE_FROM,''DD-MON-YYYY'') IS NULL )',
'  AND (trunc(wf_doc_date) <= to_date(:P23613001041_DATE_TO,''DD-MON-YYYY'') OR to_date(:P23613001041_DATE_TO,''DD-MON-YYYY'') IS NULL)',
'  AND (wf_status LIKE ''%'' || :P23613001041_STATUS || ''%'' OR :P23613001041_STATUS IS NULL)',
'ORDER BY wf_doc_date DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P23613001041_WORK_FLOW_NAME,P23613001041_MODULE,P23613001041_AUTH_BASSIS,P23613001041_DATE_FROM,P23613001041_DATE_TO,P23613001041_STATUS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Work Flow Report'
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
 p_id=>wwv_flow_imp.id(7471126505150002689)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1989164669606391661
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6236433245444398589)
,p_db_column_name=>'APPR_BY'
,p_display_order=>310
,p_column_identifier=>'BL'
,p_column_label=>'Approved By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6209646557542370978)
,p_db_column_name=>'COLOR'
,p_display_order=>270
,p_column_identifier=>'BH'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6236433048644398587)
,p_db_column_name=>'CRE_DATE'
,p_display_order=>290
,p_column_identifier=>'BJ'
,p_column_label=>'Created Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6236433544519398592)
,p_db_column_name=>'DOC_DATE'
,p_display_order=>330
,p_column_identifier=>'BN'
,p_column_label=>'Doc. Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6209646470506370977)
,p_db_column_name=>'STATUS'
,p_display_order=>260
,p_column_identifier=>'BG'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#STATUS#</div>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6236433275401398590)
,p_db_column_name=>'WFDCL_ACTION_DATE'
,p_display_order=>320
,p_column_identifier=>'BM'
,p_column_label=>'Approved Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944078622317652274)
,p_db_column_name=>'WF_APPR_EMP_ID'
,p_display_order=>360
,p_column_identifier=>'BQ'
,p_column_label=>'Approved Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944078659387652275)
,p_db_column_name=>'WF_APP_EMP_NAME'
,p_display_order=>370
,p_column_identifier=>'BR'
,p_column_label=>'Approved Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7471127751775002701)
,p_db_column_name=>'WF_BASIS'
,p_display_order=>70
,p_column_identifier=>'L'
,p_column_label=>'Auth Basis'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7491290068431307399)
,p_db_column_name=>'WF_BASIS1'
,p_display_order=>200
,p_column_identifier=>'AZ'
,p_column_label=>'Wf Basis1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7471126938339002693)
,p_db_column_name=>'WF_BUS_PROC_DESC'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Work Flow Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7471126798493002692)
,p_db_column_name=>'WF_BUS_PROC_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Work Flow ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6236432889815398586)
,p_db_column_name=>'WF_CRE_BY'
,p_display_order=>280
,p_column_identifier=>'BI'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944078375337652272)
,p_db_column_name=>'WF_CRE_EMP_ID'
,p_display_order=>340
,p_column_identifier=>'BO'
,p_column_label=>'Created Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5944078510724652273)
,p_db_column_name=>'WF_CRE_EMP_NAME'
,p_display_order=>350
,p_column_identifier=>'BP'
,p_column_label=>'Created Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7665811166426977001)
,p_db_column_name=>'WF_DOC_DATE'
,p_display_order=>220
,p_column_identifier=>'BC'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7665811330753977003)
,p_db_column_name=>'WF_DOC_NO'
,p_display_order=>240
,p_column_identifier=>'BE'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7665811462565977004)
,p_db_column_name=>'WF_DOC_REV'
,p_display_order=>250
,p_column_identifier=>'BF'
,p_column_label=>'Doc. Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7471128053670002704)
,p_db_column_name=>'WF_MODULE'
,p_display_order=>50
,p_column_identifier=>'O'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7471348389026445968)
,p_db_column_name=>'WF_SELF_APPR_FLAG'
,p_display_order=>90
,p_column_identifier=>'AC'
,p_column_label=>'Self Approval '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7491290132286307400)
,p_db_column_name=>'WF_SELF_APPR_FLAG1'
,p_display_order=>210
,p_column_identifier=>'BA'
,p_column_label=>'Wf Self Appr Flag1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7665811224678977002)
,p_db_column_name=>'WF_SEQ_NO'
,p_display_order=>230
,p_column_identifier=>'BD'
,p_column_label=>'Wf Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7471349964907445983)
,p_db_column_name=>'WF_STATUS'
,p_display_order=>120
,p_column_identifier=>'AR'
,p_column_label=>'Wf Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7471456530256527237)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'15265580'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WF_BUS_PROC_ID:WF_BUS_PROC_DESC:WF_BASIS:WF_MODULE:WF_DOC_NO:WF_DOC_REV:WF_DOC_DATE:STATUS:WF_CRE_BY:WF_CRE_EMP_ID:WF_CRE_EMP_NAME:CRE_DATE:APPR_BY:WF_APPR_EMP_ID:WF_APP_EMP_NAME:WFDCL_ACTION_DATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7318336915331927407)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_imp.id(7471124816280002672)
,p_button_name=>'cLEAR'
,p_static_id=>'clear'
,p_button_static_id=>'Clear1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Clear'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5944900790778529273)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(7471124816280002672)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_static_id=>'cancelbtn'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Close'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_button_css_classes=>'closebtn'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6152351224664638247)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_imp.id(7471126453660002688)
,p_button_name=>'Download'
,p_static_id=>'download'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Download'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5944901213993529274)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_imp.id(7471124816280002672)
,p_button_name=>'Favorite_button_N'
,p_static_id=>'favorite-button-n'
,p_button_static_id=>'cancelbtn1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapRight:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favorite Button N'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_button_css_classes=>'cancelbtn'
,p_icon_css_classes=>'fa-heart-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6196993667285227031)
,p_button_sequence=>180
,p_button_plug_id=>wwv_flow_imp.id(7471124816280002672)
,p_button_name=>'Favorite_button_Y'
,p_static_id=>'favorite-button-y'
,p_button_static_id=>'fav'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapRight:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favorite Button N'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_button_css_classes=>'cancelbtn1'
,p_icon_css_classes=>'fa-heart'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5944899964721529273)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(7471124816280002672)
,p_button_name=>'Find_Report'
,p_static_id=>'find-report'
,p_button_static_id=>'SEARCH'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Generate'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6152351362395638249)
,p_branch_name=>'Download'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.:APPLICATION_PROCESS=GET_EXPORT_FILE:&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6152351224664638247)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7471129046581002683)
,p_name=>'P23613001041_AUTH_BASSIS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7471124816280002672)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Auth Basis'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Entity;E,Unit;U'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7471129607860002688)
,p_name=>'P23613001041_DATE_FROM'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7471124816280002672)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date From'
,p_format_mask=>'DD-MON-YYYY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7471129691542002689)
,p_name=>'P23613001041_DATE_TO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7471124816280002672)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date To'
,p_format_mask=>'DD-MON-YYYY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6196994194511227036)
,p_name=>'P23613001041_FAV_FLAG'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7471124816280002672)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT WUBFA_USER_FAV',
'  FROM wapl_bus_fun,',
'       wapl_user_bus_fun_accs',
' WHERE WUBFA_USER_ID    = :GLOBAL_USER',
'   AND WUBFA_BUS_FUN_ID = WBF_BUS_FUN_ID',
'   AND WBF_PAGE_NO      = :app_page_id',
'   AND wbf_appl_no      = :app_id',
'   AND wbf_visible      = ''Y'''))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7471128983584002682)
,p_name=>'P23613001041_MODULE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7471124816280002672)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Module'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wf_module a,',
'       wf_module',
'  FROM work_flow',
' WHERE wf_bu = :Global_bu',
'GROUP BY wf_module',
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Module',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6236437255018398598)
,p_name=>'P23613001041_STATUS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7471124816280002672)
,p_item_default=>'ALL'
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;E,Entry Completed;N,Approved;A,Cancelled;C'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm:margin-right-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7471128746672002680)
,p_name=>'P23613001041_WORK_FLOW_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7471124816280002672)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Work Flow'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_WF_ID'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm:margin-left-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Work flow',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5944923061747529324)
,p_name=>'Find_Report'
,p_static_id=>'find-report'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5944899964721529273)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6152351440275638250)
,p_event_id=>wwv_flow_imp.id(5944923061747529324)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P23613001041_WORK_FLOW_NAME,P23613001041_AUTH_BASSIS,P23613001041_MODULE,P23613001041_DATE_FROM,P23613001041_DATE_TO,P23613001041_STATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Work_Flow_Report'',1,''P23613001041_WORK_FLOW_NAME'',''Work Flow'',:P23613001041_WORK_FLOW_NAME,:P23613001041_WORK_FLOW_NAME);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Work_Flow_Report'',2,''P23613001041_AUTH_BASSIS'',''Auth. Basics'',:P23613001041_AUTH_BASSIS,',
    '       CASE WHEN :P23613001041_AUTH_BASSIS = ''E'' THEN ''Entity''',
    '            WHEN :P23613001041_AUTH_BASSIS = ''U'' THEN ''Unit'' END);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Work_Flow_Report'',3,''P23613001041_MODULE'',''Module'',:P23613001041_MODULE,:P23613001041_MODULE);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Work_Flow_Report'',4,''P23613001041_DATE_FROM'',''Date From'',:P23613001041_DATE_FROM,:P23613001041_DATE_FROM);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Work_Flow_Report'',5,''P23613001041_DATE_TO'',''Date To'',:P23613001041_DATE_TO,:P23613001041_DATE_TO);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Work_Flow_Report'',6,''P23613001041_STATUS'',''Status'',:P23613001041_STATUS,',
    '         CASE WHEN :P23613001041_STATUS = ''E'' THEN ''Draft''',
    '              WHEN :P23613001041_STATUS = ''N'' THEN ''Entry Completed''',
    '              WHEN :P23613001041_STATUS = ''A'' THEN ''Approved''',
    '              WHEN :P23613001041_STATUS = ''C'' THEN ''Cancelled'' END);',
    '  END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5944925131934529328)
,p_event_id=>wwv_flow_imp.id(5944923061747529324)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item(''detail'').show();',
    'apex.region(''detail'').refresh();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6196994332852227037)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5944901213993529274)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6196994349233227038)
,p_event_id=>wwv_flow_imp.id(6196994332852227037)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P23613001041_FAV_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN  ',
    '    proc_upd_favour_web(:global_bu, ''N'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '    SELECT wubfa_user_fav',
    '      INTO :P23613001041_FAV_FLAG',
    '      FROM wapl_user_bus_fun_accs',
    '     WHERE wubfa_bus_fun_id = (SELECT wbf_bus_fun_id',
    '                                 FROM wapl_bus_fun',
    '                                WHERE wbf_appl_no = :app_id',
    '                                  AND wbf_page_no = :app_page_id',
    '                                  AND wbf_visible = ''Y'')',
    '       AND wubfa_user_id = :Global_user ;',
    'END;',
    '',
    '',
    '',
    '',
    '',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6196994482015227039)
,p_event_id=>wwv_flow_imp.id(6196994332852227037)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P23613001041_FAV_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6196994587850227040)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6196993667285227031)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6196994710199227041)
,p_event_id=>wwv_flow_imp.id(6196994587850227040)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P23613001041_FAV_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    proc_upd_favour_web(:global_bu,''Y'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '',
    '    SELECT wubfa_user_fav',
    '      INTO :P23613001041_FAV_FLAG',
    '      FROM wapl_user_bus_fun_accs',
    '     WHERE wubfa_bus_fun_id = (SELECT wbf_bus_fun_id',
    '                                 FROM wapl_bus_fun',
    '                                WHERE wbf_appl_no = :app_id',
    '                                  AND wbf_page_no = :app_page_id',
    '                                  AND wbf_visible = ''Y'')',
    '       AND wubfa_user_id = :Global_user ;',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6196994794382227042)
,p_event_id=>wwv_flow_imp.id(6196994587850227040)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P23613001041_FAV_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7318337014394927408)
,p_name=>'New_2'
,p_static_id=>'new-3'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7318336915331927407)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7318337101784927409)
,p_event_id=>wwv_flow_imp.id(7318337014394927408)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P23613001041_WORK_FLOW_NAME,P23613001041_AUTH_BASSIS,P23613001041_MODULE,P23613001041_DATE_FROM,P23613001041_DATE_TO,P23613001041_STATUS'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6206357695389799229)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    proc_upd_favour_web(:GLOBAL_BU, :P23613001041_FAV_FLAG,:APP_ID,:APP_PAGE_ID,:GLOBAL_USER);',
'    COMMIT;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Favorite_button_N,Favorite_button_Y'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>724395859846188201
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6152351240363638248)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Download'
,p_static_id=>'process-for-download'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_qry         CLOB;',
'  v_qry_seq      NUMBER;',
'  v_fname       VARCHAR2(100);',
'BEGIN',
'',
'proc_apex_ir_report_export(:GLOBAL_bu,:app_id,:app_page_id,''Work_Flow_Report'',:app_session,:GLOBAL_user,v_qry);',
'',
'SELECT jva_exl_seq.NEXTVAL INTO v_qry_seq FROM dual;',
'',
'    INSERT INTO excel_generate_query (',
'        egq_no,',
'        egq_query,',
'        egq_bus_fun,',
'        egq_cre_by,',
'        egq_cre_date,',
'        egq_sheet_name',
'    ) VALUES (',
'        v_qry_seq,',
'        v_qry,',
'        :app_page_id,',
'        :GLOBAL_USER,',
'        SYSDATE,',
'        ''Work Flow Approval List''',
'    );',
'    ',
'    COMMIT; ',
'    proc_apex_java_excel(v_qry_seq,',
'                               ''C_DIR'',',
'							   :GLOBAL_FILE_NAME,',
'							   :GLOBAL_user,',
'                               :global_bu,',
'                               :app_id,',
'                               :app_page_id,',
'                               :app_session,',
'                               ''"Work Flow Approval List"'',',
'							   ''RMQC27'',',
'							   ''RMQC27'',',
'							   :global_db);',
'--Raise_Application_Error(-20999,v_qry_seq||''/''||:GLOBAL_FILE_NAME||''/''||:GLOBAL_user||''/''||:global_bu||''/''||:app_id||''/''||:app_page_id||''/''||:app_session||''/''||:global_schema||''/''||:global_schema_pass||''/''||:global_db);',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    proc_apex_err_msg_log(:APP_PAGE_ID,''TEXT'');',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6152351224664638247)
,p_internal_uid=>670389404820027220
);
wwv_flow_imp.component_end;
end;
/
