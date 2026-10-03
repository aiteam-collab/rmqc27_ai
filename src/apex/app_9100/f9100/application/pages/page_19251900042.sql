prompt --application/pages/page_19251900042
begin
--   Manifest
--     PAGE: 19251900042
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
 p_id=>19251900042
,p_name=>'Email'
,p_alias=>'EMAIL'
,p_step_title=>'Email'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'slideclose();'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.fad fa-edit{',
'<i class="fa-solid fa-pen-to-square"></i>',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*    radio option    */',
'',
' .t-fht-thead {',
'    overflow: auto !important;',
' }',
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
'} ',
'',
'#addbtn123{',
'        color: rgb(36, 133, 14);',
'        background-color: #ffffff;',
'}',
'',
'#addbtn{',
'        color: blue;',
'        background-color: #ffffff;',
'}',
'',
'#savebtn{',
'                color: green;',
'                background-color: #ffffff;',
'}',
'#cancelbtn{',
'                color: rgb(214, 19, 29);',
'                background-color: #ffffff;',
'}',
'',
'#cancelbtn1{',
'                color: rgb(214, 19, 29);',
'                background-color: #ffffff;',
'} ',
'',
'/* .a-Button--hot, .t-Button--hot:not(.t-Button--simple), body .ui-button.ui-button--hot, body .ui-state-default.ui-priority-primary {',
'    background-color: #fff;',
'     color: #ffffff;',
'} */',
'',
'.a-Button--hot, .t-Button--hot:not(.t-Button--simple), body .ui-button.ui-button--hot, body .ui-state-default.ui-priority-primary {',
'    background-color: #ffffff;',
'    color: #000000;',
'}',
'',
'.a-Button--hot:hover, .t-Button--hot:not(.t-Button--simple):hover, body .ui-button.ui-button--hot:hover, body .ui-state-default.ui-priority-primary:hover, .a-Button--hot:not(:active):focus, .t-Button--hot:not(.t-Button--simple):not(:active):focus, bo'
||'dy .ui-button.ui-button--hot:not(:active):focus, body .ui-state-default.ui-priority-primary:not(:active):focus {',
'    background-color: #ffffff;',
'}',
'',
'.a-GV .a-GV-w-hdr, .a-GV .a-GV-w-scroll {',
'    overflow: auto;',
' } ',
'',
' /*.a-GV .a-GV-w-hdr, .a-GV .a-GV-w-scroll {',
'    backface-visibility: hidden;',
'    overflow: auto;',
'}',
'',
'*/'))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6316410822371453114)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>70
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6460903037336805513)
,p_plug_name=>'Sent / Unsent - Email'
,p_static_id=>'sent-unsent-email'
,p_title=>'Result(s)'
,p_region_name=>'EMAIL'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       EOH_BU,',
'       EOH_DOC_NO,',
'       TO_CHAR(EOH_DOC_DATE,''DD.MM.YYYY HH:MI:SS AM'') "Sent On",',
'       EOH_DOC_DATE,',
'       EOH_SNDR_EMAIL "From",       ',
'       EOH_SUBJ,',
'       EOH_BODY,',
'       EOH_USER_ID,',
'       EOH_EMP_ID,',
'       EOH_VOU_TYPE,',
'       EOH_VOU_PFX,',
'       EOH_VOU_NO,',
'       EOH_STATUS,',
'       TO_CHAR(EOH_SEND_DATE,''DD.MM.YYYY HH:MI:SS AM'') EOH_SEND_DATE,',
'       (CASE WHEN EORL_STATUS IS NULL OR EORL_STATUS NOT LIKE (''Message %'') THEN ''Unsent''',
'             WHEN EORL_STATUS LIKE ''%Message Sent%'' THEN ''Sent'' END ) EOH_TYPE,',
'       (CASE WHEN EORL_STATUS IS NULL OR EORL_STATUS NOT LIKE (''Message %'') THEN ''Yellow''',
'             WHEN EORL_STATUS LIKE ''%Message Sent%'' THEN ''green'' END ) EOH_COLOR,',
'       ''<span aria-hidden="true" class="fa fa-paper-plane" style="color:'' || ',
'        CASE ',
'            WHEN EORL_STATUS IS NULL OR EORL_STATUS NOT LIKE (''Message %'') THEN ''orange''',
'            WHEN EORL_STATUS LIKE ''%Message Sent%'' THEN ''green''',
'            END ||',
'            ''; font-size:12px;"></span>'' AS send_new,',
'       EOH_CRE_BY,',
'       EOH_CRE_DATE,',
'       EOH_UPD_BY,',
'       EOH_UPD_DATE,',
'       EOH_UNIT,',
'       EOH_WF_TYPE,',
'       EOH_MAIL_TYPE,',
'      -- decode (EOH_MAIL_SEND_OPT,''S'',''System'',''M'',''Manual'')EOH_MAIL_SEND_OPT,',
'       EORL_BU,',
'       EORL_DOC_NO,',
'       EORL_SEQ_NO,',
'       EORL_RCVR_TYPE,',
'       EORL_RCVR_EMAIL,',
'       EORL_CC_EMAIL,',
'       EORL_CRE_BY,',
'       EORL_CRE_DATE,',
'       EORL_UPD_BY,',
'       EORL_UPD_DATE,',
'       EORL_SEL_FLAG,',
'      --  CASE WHEN  EORL_SEL_FLAG = ''Y'' THEN',
'      --           ''<input type="checkbox" id="checkbox_''||EOH_VOU_NO||''" checked="checked" onChange="checkanduncheck(''''EMAIL'''',''||EOH_VOU_NO||'',''''N'''')"/>''',
'      --       ELSE',
'      --           ''<input type="checkbox" id="checkbox_''||EOH_VOU_NO||''" onChange="checkanduncheck(''''EMAIL'''',''||EOH_VOU_NO||'',''''Y'''')" />''             ',
'      --       END SEL_FLAG,   ',
'       EORL_STATUS,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = EOH_BU',
'           AND bup_plant_id = EOH_UNIT)eoh_plnt_desc,',
'       (SELECT bu_name1',
'          FROM business_units',
'         WHERE bu_id = :GLOBAL_bu )eoh_bu_desc,',
'       (SELECT NVL(wf_bus_proc_desc2, wf_bus_proc_desc)wf_bus_proc_desc2',
'          FROM work_flow',
'         WHERE wf_bu  = eoh_bu',
'           AND wf_bus_proc_id = eoh_wf_type )eoh_wf_desc,',
'       NULL "Receiver1",',
'       ''<span class="fa fa-paperclip" aria-hidden="true" style = "color:red;font-weight:bold;"></span>'' ATTCH1,',
'      --  ''<span class="fa fa-paperclip" aria-hidden="true" style = "color:red;font-weight:bold;"></span>'' ATTCH1,',
'       '''' Edit_Email,',
'       ''''Compose_Email,',
'       ''''Send1,',
'       ''Y''show_data,',
'       ''TEST'' HTML,',
'       (select mr_html_body from wfm_mail_report where mr_seq_no = eoh_doc_no) html_template',
'  from EMAIL_OUTBOX_VW',
' where EOH_BU = :GLOBAL_bu',
'   and (EOH_SNDR_EMAIL = :P19251900042_FROM OR :P19251900042_FROM IS NULL)',
'   and (EORL_RCVR_EMAIL = :P19251900042_TO OR :P19251900042_TO IS NULL)',
'   and (EORL_CC_EMAIL = :P19251900042_CC OR :P19251900042_CC IS NULL)',
'   and (EOH_VOU_NO = :P19251900042_VOU_NO OR :P19251900042_VOU_NO IS NULL)',
'   and (EOH_VOU_PFX = :P19251900042_DOC_PFX OR :P19251900042_DOC_PFX IS NULL)',
'   and (EOH_WF_TYPE = :P19251900042_DOC_TYPE OR :P19251900042_DOC_TYPE IS NULL)',
'   and (EOH_UNIT = :P19251900042_UNIT OR :P19251900042_UNIT IS NULL)',
'   and ((CASE WHEN EORL_STATUS IS NULL OR EORL_STATUS NOT LIKE (''Message %'') THEN ''Unsent''',
'              WHEN EORL_STATUS LIKE ''%Message Sent%'' THEN ''Sent'' END ) = :P19251900042_STATUS OR :P19251900042_STATUS IS NULL)',
'   and ((TO_DATE(EOH_DOC_DATE,:GLOBAL_DATE_FORMAT) between TO_DATE(:P19251900042_SENT_ON_FRO,:GLOBAL_DATE_FORMAT) AND TO_DATE(:P19251900042_SENT_ON_TO,:GLOBAL_DATE_FORMAT)) ',
'       ---or (TO_DATE(EOH_DOC_DATE,:GLOBAL_DATE_FORMAT) >= TO_DATE(:P19251900042_SENT_ON_FRO,:GLOBAL_DATE_FORMAT))',
'      ---- or (TO_DATE(EOH_DOC_DATE,:GLOBAL_DATE_FORMAT) <= TO_DATE(:P19251900042_SENT_ON_TO,:GLOBAL_DATE_FORMAT))',
'       or (:P19251900042_SENT_ON_FRO IS NULL AND :P19251900042_SENT_ON_TO IS NULL))',
'--    AND ((EOH_DOC_DATE BETWEEN TO_DATE(:P19251900042_SENT_ON_FRO,''DD-MM-YYYY'') AND TO_DATE(:P19251900042_SENT_ON_TO,''DD-MM-YYYY'') AND :P19251900042_SENT_ON_FRO IS NOT NULL AND :P19251900042_SENT_ON_TO IS NOT NULL)',
'--         OR (EOH_DOC_DATE >= TO_DATE(:P19251900042_SENT_ON_FRO,''DD-MM-YYYY'') AND :P19251900042_SENT_ON_FRO IS NOT NULL AND :P19251900042_SENT_ON_TO IS NULL)',
'--         OR (EOH_DOC_DATE <= TO_DATE(:P19251900042_SENT_ON_TO,''DD-MM-YYYY'') AND :P19251900042_SENT_ON_TO IS NOT NULL AND :P19251900042_SENT_ON_FRO IS NULL)  ',
'--         OR (:P19251900042_SENT_ON_FRO IS NULL AND :P19251900042_SENT_ON_TO IS NULL)',
'--        )',
'   and :P19251900042_SHOW_DATA = ''Y'''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P19251900042_FROM,P19251900042_TO,P19251900042_CC,P19251900042_STATUS,P19251900042_VOU_NO,P19251900042_DOC_PFX,P19251900042_DOC_TYPE,P19251900042_UNIT,P19251900042_SHOW_DATA,P19251900042_SENT_ON_FRO,P19251900042_SENT_ON_TO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Result(s)'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465336699590206852)
,p_name=>'APEX$ROW_ACTION'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465336731352206853)
,p_name=>'APEX$ROW_SELECTOR'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465336972442206855)
,p_name=>'ATTCH'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Attach.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>420
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:125:&SESSION.::&DEBUG.::P125_P_DOC_NO:&EOH_DOC_NO.'
,p_link_text=>'<span class="fa fa-paperclip" aria-hidden="true" style = "color:#004153"></span>'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6391693281553937922)
,p_name=>'ATTCH1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ATTCH1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>510
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6617623261751202211)
,p_name=>'COMPOSE_EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMPOSE_EMAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Compose Email'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>480
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6470162916814408622)
,p_name=>'COMPOSE_MAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EDIT_EMAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Compose Mail'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>460
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:1900043:&SESSION.::&DEBUG.::P1900043_SHOW_DATA,P1900043_EOH_DOC_NO_COM:Y,&EOH_DOC_NO.'
,p_link_text=>'<span aria-hidden="true" class="fa fa-indent" style="color: orange ;font-size : 12px ;font-weight: bold"></span>'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_display_condition_type=>'NEVER'
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465332282906206808)
,p_name=>'EOH_BODY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_BODY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>' Body'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6460907143573805554)
,p_name=>'EOH_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eoh Bu'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>5
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465335296987206838)
,p_name=>'EOH_BU_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_BU_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Entity'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>390
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757573933078331102)
,p_name=>'EOH_COLOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_COLOR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eoh Color'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>540
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>6
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465333057200206816)
,p_name=>'EOH_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eoh Cre By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465333192936206817)
,p_name=>'EOH_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Eoh Cre Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6607105837257480810)
,p_name=>'EOH_DOC_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_DOC_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Eoh Doc Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>490
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6460907284825805555)
,p_name=>'EOH_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Doc. No.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465332422273206810)
,p_name=>'EOH_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eoh Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465333623422206822)
,p_name=>'EOH_MAIL_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_MAIL_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eoh Mail Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>1
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465335164265206837)
,p_name=>'EOH_PLNT_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_PLNT_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>380
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6758733844748841585)
,p_name=>'EOH_SEND_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_SEND_DATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Send On.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
,p_value_alignment=>'LEFT'
,p_stretch=>'A'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465332861849206814)
,p_name=>'EOH_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Eoh Status'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465332187830206807)
,p_name=>'EOH_SUBJ'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_SUBJ'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Subject'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465332934200206815)
,p_name=>'EOH_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Status'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>6
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465333486133206820)
,p_name=>'EOH_UNIT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_UNIT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465333261023206818)
,p_name=>'EOH_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eoh Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465333384107206819)
,p_name=>'EOH_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Eoh Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>180
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465332358024206809)
,p_name=>'EOH_USER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_USER_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eoh User Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465332768121206813)
,p_name=>'EOH_VOU_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_VOU_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vou No.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465332696348206812)
,p_name=>'EOH_VOU_PFX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_VOU_PFX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vou. Pfx.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>5
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465332609115206811)
,p_name=>'EOH_VOU_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_VOU_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eoh Vou Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>5
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465335352819206839)
,p_name=>'EOH_WF_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_WF_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Document Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>400
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465333599038206821)
,p_name=>'EOH_WF_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_WF_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eoh Wf Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465333903035206824)
,p_name=>'EORL_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eorl Bu'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>5
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465334323075206829)
,p_name=>'EORL_CC_EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_CC_EMAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'CC'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>310
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>500
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465334507782206830)
,p_name=>'EORL_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eorl Cre By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>320
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465334546095206831)
,p_name=>'EORL_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Eorl Cre Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>330
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465333962101206825)
,p_name=>'EORL_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eorl Doc No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465334239148206828)
,p_name=>'EORL_RCVR_EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_RCVR_EMAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'TO'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>300
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>500
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465334148365206827)
,p_name=>'EORL_RCVR_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_RCVR_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eorl Rcvr Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>260
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465334834127206834)
,p_name=>'EORL_SEL_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_SEL_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>360
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'Y'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465334087409206826)
,p_name=>'EORL_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Eorl Seq No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>250
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465335059629206836)
,p_name=>'EORL_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unsent Reason'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>370
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465334654598206832)
,p_name=>'EORL_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eorl Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>340
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465334761500206833)
,p_name=>'EORL_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Eorl Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>350
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6470161482411408607)
,p_name=>'Edit_Mail'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Edit Mail'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>430
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:1900043:&SESSION.::&DEBUG.::P1900043_EOH_DOC_NO,P1900043_EOH_BU,P1900043_EOH_BODY,P1900043_EOH_SUBJ,P1900043_CC_MAIL,P1900043_TO_MAIL,P1900043_DOC_NO:&EOH_DOC_NO.,&EOH_BU.,&EOH_BODY.,&EOH_SUBJ.,&EORL_CC_EMAIL.,&EORL_RCVR_EMAIL.,&EOH_DOC_'
||'NO.'
,p_link_text=>'<span aria-hidden="true" class="fa fa-indent" style="color: orange ;font-size : 12px ;font-weight: bold"></span>'
,p_link_attributes=>'class="#LINK#"'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_display_condition_type=>'NEVER'
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6617622986672202208)
,p_name=>'From'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'From'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'From'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>290
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757572442895331087)
,p_name=>'HTML'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HTML'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>530
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:204:&SESSION.::&DEBUG.::P204_NEW_1:&EOH_DOC_NO.'
,p_link_text=>'<span class="fa fa-code" style="color: green; font-size:14px;"></span>'
,p_link_attributes=>'class="#LINK#"'
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757573984258331103)
,p_name=>'HTML_TEMPLATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HTML_TEMPLATE'
,p_data_type=>'CLOB'
,p_session_state_data_type=>'CLOB'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>550
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6465335485598206840)
,p_name=>'Receiver'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>410
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6391693138159937921)
,p_name=>'Receiver1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Receiver1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>500
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6470161532225408608)
,p_name=>'SEND'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Send'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>440
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P19251900041_DOC_NO_EM'',''&EOH_DOC_NO&'');apex.confirm("Do you want to Send the document?",''SEND'');'
,p_link_text=>'<span aria-hidden="true" class="fa fa-send-o" style="color: Green;font-size : 12px ;font-weight: bold"></span>'
,p_link_attributes=>'class="#LINK#"'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6391693404617937923)
,p_name=>'SEND1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEND1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>520
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757574179366331104)
,p_name=>'SEND_NEW'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEND_NEW'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Send'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>450
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P19251900041_DOC_NO_EM'',''&EOH_DOC_NO&'');apex.confirm("Do you want to Send the document?",''SEND'');'
,p_link_text=>'&SEND_NEW.'
,p_link_attributes=>'class="#LINK#"'
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6470163827247408631)
,p_name=>'SHOW_DATA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHOW_DATA'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>470
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6617622820933202207)
,p_name=>'Sent On'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Sent On'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Genrated On.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:126:&SESSION.::&DEBUG.::P126_EOH_BU,P126_EOH_DOC_NO,P126_TYPE:&EOH_BU.,&EOH_DOC_NO.,&EOH_TYPE.'
,p_link_text=>'&"Sent On".'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(6460907046529805553)
,p_internal_uid=>981386062744885351
,p_is_editable=>true
,p_edit_operations=>'d'
,p_lost_update_check_type=>'VALUES'
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>false
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'NONE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(6465412912630277885)
,p_interactive_grid_id=>wwv_flow_imp.id(6460907046529805553)
,p_static_id=>'1341705'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(6465413015854277891)
,p_report_id=>wwv_flow_imp.id(6465412912630277885)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3637196910849377809)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(6757572442895331087)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>63
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(3637337214536000134)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(6758733844748841585)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>176
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6331244116951321891)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(6465336699590206852)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6331862630786459625)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(6465336972442206855)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>72
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6331864227501463852)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>45
,p_column_id=>wwv_flow_imp.id(6465336731352206853)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6332620935051250028)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(6470162916814408622)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465413602349277909)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(6460907143573805554)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465414397662277926)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(6460907284825805555)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>177
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465416202339277943)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(6465332187830206807)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>294
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465417024006277956)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(6465332282906206808)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>250
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465417995525277965)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(6465332358024206809)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465418889503277984)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(6465332422273206810)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465419722834277995)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(6465332609115206811)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>107
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465420588050278029)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(6465332696348206812)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465421478487278051)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(6465332768121206813)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>140
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465422397546278063)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(6465332861849206814)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465423247161278074)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(6465332934200206815)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>68
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465424167657278084)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(6465333057200206816)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>158
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465424996728278116)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(6465333192936206817)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>153
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465425839715278135)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(6465333261023206818)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465426807579278187)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(6465333384107206819)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465427682969278207)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(6465333486133206820)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465428449704278232)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(6465333599038206821)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465429388083278248)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(6465333623422206822)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>153
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465431124255278274)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(6465333903035206824)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465432054899278287)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(6465333962101206825)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465433088688278301)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(6465334087409206826)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465433975663278323)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(6465334148365206827)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465434907133278335)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(6465334239148206828)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>199
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465435797265278352)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(6465334323075206829)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>224
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465436685869278371)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(6465334507782206830)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>86
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465437551151278395)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>40
,p_column_id=>wwv_flow_imp.id(6465334546095206831)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>93
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465438545268278404)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>41
,p_column_id=>wwv_flow_imp.id(6465334654598206832)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465439401916278415)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>42
,p_column_id=>wwv_flow_imp.id(6465334761500206833)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465440246691278426)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(6465334834127206834)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>60
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465442036939278448)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(6465335059629206836)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>170
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465443007157278460)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>44
,p_column_id=>wwv_flow_imp.id(6465335164265206837)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>141
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465443818479278470)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>43
,p_column_id=>wwv_flow_imp.id(6465335296987206838)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>248
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465444793005278488)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(6465335352819206839)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>171
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6465445688705278502)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(6465335485598206840)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>101
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6470207754531416415)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(6470161482411408607)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>74
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6470208677687416424)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(6470161532225408608)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>62
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6473342011000561354)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>46
,p_column_id=>wwv_flow_imp.id(6470163827247408631)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6607509852641670524)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>48
,p_column_id=>wwv_flow_imp.id(6607105837257480810)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>120
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6617643717617220749)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(6617622820933202207)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>166
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6617644795228220763)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(6617622986672202208)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>192
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6617645734641220779)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>47
,p_column_id=>wwv_flow_imp.id(6617623261751202211)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6758410591039929024)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>52
,p_column_id=>wwv_flow_imp.id(6757573933078331102)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6758411512489929029)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>53
,p_column_id=>wwv_flow_imp.id(6757573984258331103)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>269
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6758421784594977627)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(6757574179366331104)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>76
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6812675193148722824)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>49
,p_column_id=>wwv_flow_imp.id(6391693138159937921)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>73
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6812676110449722834)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>50
,p_column_id=>wwv_flow_imp.id(6391693281553937922)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6812677006422722840)
,p_view_id=>wwv_flow_imp.id(6465413015854277891)
,p_display_seq=>51
,p_column_id=>wwv_flow_imp.id(6391693404617937923)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6757506299273280285)
,p_plug_name=>'Sent / Unsent - Email'
,p_static_id=>'sent-unsent-email-2'
,p_title=>'Result(s)'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       EOH_BU,',
'       EOH_DOC_NO,',
'       TO_CHAR(EOH_DOC_DATE,''DD.MM.YYYY HH:MI:SS AM'') "Sent On",',
'       EOH_DOC_DATE,',
'       EOH_SNDR_EMAIL "From",       ',
'       EOH_SUBJ,',
'       EOH_BODY,',
'       EOH_USER_ID,',
'       EOH_EMP_ID,',
'       EOH_VOU_TYPE,',
'       EOH_VOU_PFX,',
'       EOH_VOU_NO,',
'       EOH_STATUS,',
'       (CASE WHEN EORL_STATUS IS NULL OR EORL_STATUS NOT LIKE (''Message %'') THEN ''Unsent''',
'             WHEN EORL_STATUS LIKE ''%Message Sent%'' THEN ''Sent'' END ) EOH_TYPE,',
'       EOH_CRE_BY,',
'       EOH_CRE_DATE,',
'       EOH_UPD_BY,',
'       EOH_UPD_DATE,',
'       EOH_UNIT,',
'       EOH_WF_TYPE,',
'       EOH_MAIL_TYPE,',
'      -- decode (EOH_MAIL_SEND_OPT,''S'',''System'',''M'',''Manual'')EOH_MAIL_SEND_OPT,',
'       EORL_BU,',
'       EORL_DOC_NO,',
'       EORL_SEQ_NO,',
'       EORL_RCVR_TYPE,',
'       EORL_RCVR_EMAIL,',
'       EORL_CC_EMAIL,',
'       EORL_CRE_BY,',
'       EORL_CRE_DATE,',
'       EORL_UPD_BY,',
'       EORL_UPD_DATE,',
'       EORL_SEL_FLAG,',
'      --  CASE WHEN  EORL_SEL_FLAG = ''Y'' THEN',
'      --           ''<input type="checkbox" id="checkbox_''||EOH_VOU_NO||''" checked="checked" onChange="checkanduncheck(''''EMAIL'''',''||EOH_VOU_NO||'',''''N'''')"/>''',
'      --       ELSE',
'      --           ''<input type="checkbox" id="checkbox_''||EOH_VOU_NO||''" onChange="checkanduncheck(''''EMAIL'''',''||EOH_VOU_NO||'',''''Y'''')" />''             ',
'      --       END SEL_FLAG,   ',
'       EORL_STATUS,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = EOH_BU',
'           AND bup_plant_id = EOH_UNIT)eoh_plnt_desc,',
'       (SELECT bu_name1',
'          FROM business_units',
'         WHERE bu_id = :GLOBAL_bu )eoh_bu_desc,',
'       (SELECT NVL(wf_bus_proc_desc2, wf_bus_proc_desc)wf_bus_proc_desc2',
'          FROM work_flow',
'         WHERE wf_bu  = eoh_bu',
'           AND wf_bus_proc_id = eoh_wf_type )eoh_wf_desc,',
'       NULL "Receiver1",',
'       ''<span class="fa fa-paperclip" aria-hidden="true" style = "color:red;font-weight:bold;"></span>'' ATTCH1,',
'      --  ''<span class="fa fa-paperclip" aria-hidden="true" style = "color:red;font-weight:bold;"></span>'' ATTCH1,',
'       '''' Edit_Email,',
'       ''''Compose_Email,',
'       ''''Send1,',
'       ''Y''show_data',
'  from EMAIL_OUTBOX_VW',
' where EOH_BU = :GLOBAL_bu',
'   and (EOH_SNDR_EMAIL = :P19251900042_FROM OR :P19251900042_FROM IS NULL)',
'   and (EORL_RCVR_EMAIL = :P19251900042_TO OR :P19251900042_TO IS NULL)',
'   and (EORL_CC_EMAIL = :P19251900042_CC OR :P19251900042_CC IS NULL)',
'   and (EOH_VOU_NO = :P19251900042_VOU_NO OR :P19251900042_VOU_NO IS NULL)',
'   and (EOH_VOU_PFX = :P19251900042_DOC_PFX OR :P19251900042_DOC_PFX IS NULL)',
'   and (EOH_WF_TYPE = :P19251900042_DOC_TYPE OR :P19251900042_DOC_TYPE IS NULL)',
'   and (EOH_UNIT = :P19251900042_UNIT OR :P19251900042_UNIT IS NULL)',
'   and ((CASE WHEN EORL_STATUS IS NULL OR EORL_STATUS NOT LIKE (''Message %'') THEN ''Unsent''',
'              WHEN EORL_STATUS LIKE ''%Message Sent%'' THEN ''Sent'' END ) = :P19251900042_STATUS OR :P19251900042_STATUS IS NULL)',
'   and ((TO_DATE(EOH_DOC_DATE,:GLOBAL_DATE_FORMAT) between TO_DATE(:P19251900042_SENT_ON_FRO,:GLOBAL_DATE_FORMAT) AND TO_DATE(:P19251900042_SENT_ON_TO,:GLOBAL_DATE_FORMAT)) ',
'       ---or (TO_DATE(EOH_DOC_DATE,:GLOBAL_DATE_FORMAT) >= TO_DATE(:P19251900042_SENT_ON_FRO,:GLOBAL_DATE_FORMAT))',
'      ---- or (TO_DATE(EOH_DOC_DATE,:GLOBAL_DATE_FORMAT) <= TO_DATE(:P19251900042_SENT_ON_TO,:GLOBAL_DATE_FORMAT))',
'       or (:P19251900042_SENT_ON_FRO IS NULL AND :P19251900042_SENT_ON_TO IS NULL))',
'--    AND ((EOH_DOC_DATE BETWEEN TO_DATE(:P19251900042_SENT_ON_FRO,''DD-MM-YYYY'') AND TO_DATE(:P19251900042_SENT_ON_TO,''DD-MM-YYYY'') AND :P19251900042_SENT_ON_FRO IS NOT NULL AND :P19251900042_SENT_ON_TO IS NOT NULL)',
'--         OR (EOH_DOC_DATE >= TO_DATE(:P19251900042_SENT_ON_FRO,''DD-MM-YYYY'') AND :P19251900042_SENT_ON_FRO IS NOT NULL AND :P19251900042_SENT_ON_TO IS NULL)',
'--         OR (EOH_DOC_DATE <= TO_DATE(:P19251900042_SENT_ON_TO,''DD-MM-YYYY'') AND :P19251900042_SENT_ON_TO IS NOT NULL AND :P19251900042_SENT_ON_FRO IS NULL)  ',
'--         OR (:P19251900042_SENT_ON_FRO IS NULL AND :P19251900042_SENT_ON_TO IS NULL)',
'--        )',
'   and :P19251900042_SHOW_DATA = ''Y'''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P19251900042_FROM,P19251900042_TO,P19251900042_CC,P19251900042_STATUS,P19251900042_VOU_NO,P19251900042_DOC_PFX,P19251900042_DOC_TYPE,P19251900042_UNIT,P19251900042_SHOW_DATA,P19251900042_SENT_ON_FRO,P19251900042_SENT_ON_TO'
,p_plug_display_condition_type=>'NEVER'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Result(s)'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757506587125280288)
,p_name=>'APEX$ROW_ACTION'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757506531178280287)
,p_name=>'APEX$ROW_SELECTOR'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757510378380280325)
,p_name=>'ATTCH'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Attach.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>390
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:125:&SESSION.::&DEBUG.::P125_P_DOC_NO:&EOH_DOC_NO.'
,p_link_text=>'<span class="fa fa-paperclip" aria-hidden="true" style = "color:#004153"></span>'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757511094311280333)
,p_name=>'ATTCH1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ATTCH1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>470
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757510798478280330)
,p_name=>'COMPOSE_EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMPOSE_EMAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Compose Email'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>440
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757510587800280328)
,p_name=>'COMPOSE_MAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EDIT_EMAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Compose Mail'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>420
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:1900043:&SESSION.::&DEBUG.::P1900043_SHOW_DATA,P1900043_EOH_DOC_NO_COM:Y,&EOH_DOC_NO.'
,p_link_text=>'<span aria-hidden="true" class="fa fa-indent" style="color: orange ;font-size : 12px ;font-weight: bold"></span>'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_display_condition_type=>'NEVER'
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757507030936280292)
,p_name=>'EOH_BODY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_BODY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>' Body'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757506761134280289)
,p_name=>'EOH_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eoh Bu'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>5
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757510063345280322)
,p_name=>'EOH_BU_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_BU_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Entity'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>360
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757507833336280300)
,p_name=>'EOH_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eoh Cre By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757507923397280301)
,p_name=>'EOH_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Eoh Cre Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757510900017280331)
,p_name=>'EOH_DOC_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_DOC_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Eoh Doc Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>450
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757506880000280290)
,p_name=>'EOH_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Doc. No.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757507189173280294)
,p_name=>'EOH_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eoh Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757508446090280306)
,p_name=>'EOH_MAIL_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_MAIL_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eoh Mail Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>1
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757509943780280321)
,p_name=>'EOH_PLNT_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_PLNT_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>350
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757507638357280298)
,p_name=>'EOH_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Eoh Status'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757506893814280291)
,p_name=>'EOH_SUBJ'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_SUBJ'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Subject'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757507719691280299)
,p_name=>'EOH_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Status'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>6
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757508227885280304)
,p_name=>'EOH_UNIT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_UNIT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757508037365280302)
,p_name=>'EOH_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eoh Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757508083727280303)
,p_name=>'EOH_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Eoh Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757507127587280293)
,p_name=>'EOH_USER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_USER_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eoh User Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757507517251280297)
,p_name=>'EOH_VOU_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_VOU_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vou No.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757507415606280296)
,p_name=>'EOH_VOU_PFX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_VOU_PFX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vou. Pfx.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>5
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757507296951280295)
,p_name=>'EOH_VOU_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_VOU_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eoh Vou Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>5
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757510147624280323)
,p_name=>'EOH_WF_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_WF_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Document Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>370
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757508369157280305)
,p_name=>'EOH_WF_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_WF_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eoh Wf Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757508532188280307)
,p_name=>'EORL_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eorl Bu'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>5
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757509273875280314)
,p_name=>'EORL_CC_EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_CC_EMAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'CC'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>500
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757509339449280315)
,p_name=>'EORL_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eorl Cre By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>290
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757509394301280316)
,p_name=>'EORL_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Eorl Cre Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>300
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757508600581280308)
,p_name=>'EORL_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eorl Doc No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757509082798280313)
,p_name=>'EORL_RCVR_EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_RCVR_EMAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'TO'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>500
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757508790091280310)
,p_name=>'EORL_RCVR_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_RCVR_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eorl Rcvr Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757509691744280319)
,p_name=>'EORL_SEL_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_SEL_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>330
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'Y'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757508689730280309)
,p_name=>'EORL_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Eorl Seq No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>230
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757509824880280320)
,p_name=>'EORL_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unsent Reason'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>340
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757509494753280317)
,p_name=>'EORL_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eorl Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>310
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757509583470280318)
,p_name=>'EORL_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Eorl Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>320
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757510446050280326)
,p_name=>'Edit_Mail'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Edit Mail'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>400
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:1900043:&SESSION.::&DEBUG.::P1900043_EOH_DOC_NO,P1900043_EOH_BU,P1900043_EOH_BODY,P1900043_EOH_SUBJ,P1900043_CC_MAIL,P1900043_TO_MAIL,P1900043_DOC_NO:&EOH_DOC_NO.,&EOH_BU.,&EOH_BODY.,&EOH_SUBJ.,&EORL_CC_EMAIL.,&EORL_RCVR_EMAIL.,&EOH_DOC_'
||'NO.'
,p_link_text=>'<span aria-hidden="true" class="fa fa-indent" style="color: orange ;font-size : 12px ;font-weight: bold"></span>'
,p_link_attributes=>'class="#LINK#"'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757509050880280312)
,p_name=>'From'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'From'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'From'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757510182042280324)
,p_name=>'Receiver'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>380
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757511073079280332)
,p_name=>'Receiver1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Receiver1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>460
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757510489226280327)
,p_name=>'SEND'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Send'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>410
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P19251900041_DOC_NO_EM'',''&EOH_DOC_NO&'');apex.confirm("Do you want to Send the document?",''SEND'');'
,p_link_text=>'<span aria-hidden="true" class="fa fa-send-o" style="color: Green;font-size : 12px ;font-weight: bold"></span>'
,p_link_attributes=>'class="#LINK#"'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757511273826280334)
,p_name=>'SEND1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEND1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>480
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757510766442280329)
,p_name=>'SHOW_DATA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHOW_DATA'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>430
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6757508960463280311)
,p_name=>'Sent On'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Sent On'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Sent On'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
,p_value_alignment=>'LEFT'
,p_link_target=>'f?p=&APP_ID.:126:&SESSION.::&DEBUG.::P126_EOH_BU,P126_EOH_DOC_NO,P126_TYPE:&EOH_BU.,&EOH_DOC_NO.,&EOH_TYPE.'
,p_link_text=>'&"Sent On".'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(6757506445291280286)
,p_internal_uid=>3120397763487043602
,p_is_editable=>true
,p_edit_operations=>'d'
,p_lost_update_check_type=>'VALUES'
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>false
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'NONE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(6757513392110281905)
,p_interactive_grid_id=>wwv_flow_imp.id(6757506445291280286)
,p_static_id=>'31204048'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(6757513625634281907)
,p_report_id=>wwv_flow_imp.id(6757513392110281905)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757514111427281912)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(6757506531178280287)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757515066068281915)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(6757506587125280288)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757515888628281916)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(6757506761134280289)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757516745855281919)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(6757506880000280290)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757517622691281921)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(6757506893814280291)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757518580264281923)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(6757507030936280292)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757519426109281926)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(6757507127587280293)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757520357772281927)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(6757507189173280294)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757521262610281930)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(6757507296951280295)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757522130545281932)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(6757507415606280296)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757523060408281934)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(6757507517251280297)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757523930130281935)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(6757507638357280298)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757524834580281937)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(6757507719691280299)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757525746680281938)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(6757507833336280300)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757526599985281941)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(6757507923397280301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757527566802281943)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(6757508037365280302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757528383731281944)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(6757508083727280303)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757529340811281948)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(6757508227885280304)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757530264561281949)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(6757508369157280305)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757531173701281951)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(6757508446090280306)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757531985664281954)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(6757508532188280307)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757532924601281955)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(6757508600581280308)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757533834350281957)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(6757508689730280309)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757534775423281959)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(6757508790091280310)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757535587259281962)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(6757508960463280311)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757536521443281963)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(6757509050880280312)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757537454831281966)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(6757509082798280313)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757538315263281968)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(6757509273875280314)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757539267904281969)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(6757509339449280315)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757540139601281971)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(6757509394301280316)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757541066464281973)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(6757509494753280317)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757541929441281976)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(6757509583470280318)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757542850299281977)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(6757509691744280319)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757543703860281979)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(6757509824880280320)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757544605099281980)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(6757509943780280321)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757545487502281984)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(6757510063345280322)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757546386606281985)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(6757510147624280323)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757547360347281987)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(6757510182042280324)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757548259879281990)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(6757510378380280325)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757549172927281991)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>40
,p_column_id=>wwv_flow_imp.id(6757510446050280326)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757550017293281993)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>41
,p_column_id=>wwv_flow_imp.id(6757510489226280327)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757550966115281994)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>42
,p_column_id=>wwv_flow_imp.id(6757510587800280328)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757551857515281998)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>43
,p_column_id=>wwv_flow_imp.id(6757510766442280329)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757552682920281999)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>44
,p_column_id=>wwv_flow_imp.id(6757510798478280330)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757553625078282001)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>45
,p_column_id=>wwv_flow_imp.id(6757510900017280331)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757554511546282002)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>46
,p_column_id=>wwv_flow_imp.id(6757511073079280332)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757555416077282005)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>47
,p_column_id=>wwv_flow_imp.id(6757511094311280333)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6757556380292282007)
,p_view_id=>wwv_flow_imp.id(6757513625634281907)
,p_display_seq=>48
,p_column_id=>wwv_flow_imp.id(6757511273826280334)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6663521292264207003)
,p_plug_name=>'Sent / Unsent - Email Find'
,p_static_id=>'sent-unsent-email-find'
,p_title=>'Find Document'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--controlsPosEnd:is-expanded:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6316410947729453115)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6316410822371453114)
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
 p_id=>wwv_flow_imp.id(6663522930723207019)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6663521292264207003)
,p_button_name=>'CLEAR'
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
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6328821928156628442)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6663521292264207003)
,p_button_name=>'Compose_Mail1'
,p_static_id=>'compose-mail'
,p_button_static_id=>'addbtn123'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success:t-Button--gapLeft:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Compose Mail'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:1900043:&SESSION.::&DEBUG.::P1900043_SHOW_DATA,P1900043_EOH_DOC_NO_COM:Y,'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6663522764899207017)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6663521292264207003)
,p_button_name=>'Generate'
,p_static_id=>'generate'
,p_button_static_id=>'SEARCH'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6663522833161207018)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6663521292264207003)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Home'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:1925190004:&SESSION.::&DEBUG.:::'
,p_button_css_classes=>'cancelbtn'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6328822381783628444)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6460903037336805513)
,p_button_name=>'Save1'
,p_static_id=>'save'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''EMAIL'')"'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6316411938625453125)
,p_name=>'P19251900042_BACK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6316410822371453114)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6663521676690207006)
,p_name=>'P19251900042_CC'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6663521292264207003)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6470183268416408673)
,p_name=>'P19251900042_DOC_NO_EM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6460903037336805513)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6663521960454207009)
,p_name=>'P19251900042_DOC_PFX'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6663521292264207003)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6663522035065207010)
,p_name=>'P19251900042_DOC_TYPE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6663521292264207003)
,p_prompt=>'Document Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT eoh_wf_desc D,',
'       eoh_wf_type R',
'  FROM (',
'SELECT (SELECT NVL(wf_bus_proc_desc2, wf_bus_proc_desc)wf_bus_proc_desc2',
'          FROM work_flow',
'         WHERE wf_bu  = eoh_bu',
'           AND wf_bus_proc_id = eoh_wf_type )eoh_wf_desc,',
'       eoh_wf_type',
'  FROM email_outbox_vw',
' WHERE eoh_bu = :GLOBAL_bu',
')',
'WHERE eoh_wf_desc IS NOT NULL',
'ORDER BY eoh_wf_desc'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6663521404595207004)
,p_name=>'P19251900042_FROM'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6663521292264207003)
,p_prompt=>'From'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT eoh_sndr_email D,',
'       eoh_sndr_email R',
'  FROM email_outbox_vw',
' WHERE eoh_bu = :GLOBAL_bu',
'   AND eoh_sndr_email IS NOT NULL',
' ORDER BY eoh_sndr_email ;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Mail from',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6667124762277636103)
,p_name=>'P19251900042_SENT_ON_FRO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6663521292264207003)
,p_prompt=>'Date From.'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6667124787368636104)
,p_name=>'P19251900042_SENT_ON_TO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6663521292264207003)
,p_prompt=>'Date To.'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6470184892689408690)
,p_name=>'P19251900042_SHOW_DATA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6663521292264207003)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6663521750708207007)
,p_name=>'P19251900042_STATUS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6663521292264207003)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT status D,',
'       status R',
'  FROM (',
'SELECT DISTINCT (CASE WHEN eorl_status IS NULL OR eorl_status NOT LIKE (''Message %'') THEN ''Unsent''',
'                 WHEN eorl_status LIKE ''%Message Sent%'' THEN ''Sent'' END ) status',
'  FROM email_outbox_vw',
' WHERE eoh_bu = :GLOBAL_bu',
'   AND eorl_status IS NOT NULL',
')',
'ORDER BY status'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6663521503001207005)
,p_name=>'P19251900042_TO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6663521292264207003)
,p_prompt=>'TO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT eorl_rcvr_email D,',
'       eorl_rcvr_email R',
'  FROM email_outbox_vw',
' WHERE eoh_bu = :GLOBAL_bu',
'   AND eorl_rcvr_email IS NOT NULL',
'  ORDER BY eorl_rcvr_email;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Mail TO',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6663522091045207011)
,p_name=>'P19251900042_UNIT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6663521292264207003)
,p_prompt=>'Unit'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT R,D',
'  FROM (',
'SELECT DISTINCT eoh_unit D,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = eoh_bu',
'           AND bup_plant_id = eoh_unit) R',
'  FROM email_outbox_vw',
' WHERE eoh_bu = :GLOBAL_bu',
'   AND eoh_unit IS NOT NULL',
') ORDER BY R'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Unit',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6663521804916207008)
,p_name=>'P19251900042_VOU_NO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6663521292264207003)
,p_prompt=>'Vou. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT eoh_vou_no D,',
'       eoh_vou_no R',
'  FROM email_outbox_vw',
' WHERE eoh_bu = :GLOBAL_bu',
'   AND eoh_vou_no IS NOT NULL',
' ORDER BY eoh_vou_no;',
''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Vou. No.',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6663523136121207021)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6663522930723207019)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6663523263701207022)
,p_event_id=>wwv_flow_imp.id(6663523136121207021)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P19251900042_FROM,P19251900042_TO,P19251900042_CC,P19251900042_STATUS,P19251900042_VOU_NO,P19251900042_DOC_PFX,P19251900042_DOC_TYPE,P19251900042_UNIT,P19251900042_SHOW_DATA,P19251900042_SENT_ON_FRO,P19251900042_SENT_ON_TO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6663523507920207025)
,p_name=>'Generate'
,p_static_id=>'generate'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6663522764899207017)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6663523764609207027)
,p_event_id=>wwv_flow_imp.id(6663523507920207025)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6460903037336805513)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6663523620716207026)
,p_event_id=>wwv_flow_imp.id(6663523507920207025)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P19251900042_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6328853675943628498)
,p_name=>'Tab'
,p_static_id=>'tab'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19251900042_TAB'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6328854589943628498)
,p_event_id=>wwv_flow_imp.id(6328853675943628498)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P19251900042_MAIN',
  'items_to_submit', 'P19251900042_TAB',
  'language', 'PLSQL',
  'plsql_code', ':P19251900042_MAIN := :P19251900042_TAB;',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6328854119357628498)
,p_event_id=>wwv_flow_imp.id(6328853675943628498)
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
    'const selectedTab = $v("P19251900042_TAB");',
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
 p_id=>wwv_flow_imp.id(6328852296316628495)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'EMAIL SEND'
,p_static_id=>'email-send'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
' 	v_mail_status 			VARCHAR2(400);',
'	v_filename		      VARCHAR2(1000);',
'BEGIN',
'/*',
'SELECT eoh_doc_no,eorl_rcvr_email,eorl_cc_email,eoh_subj,eoh_body,',
'	                   uma_user_name,CRYPTIT.decrypt(uma_password) password,uma_host,uma_port',
'	              FROM email_outbox_vw,user_mail_access',
'	             WHERE eoh_bu = uma_bu',
'							   AND eoh_sndr_email = uma_user_name',
'							   AND uma_status = ''A''',
'							   AND eoh_bu = :GLOBAL_bu  ',
'							   AND eorl_sel_flag = ''Y'' */',
'',
'	FOR cr1 IN (SELECT eoh_doc_no,',
'       eorl_rcvr_email,',
'       eorl_cc_email,',
'       eoh_subj,',
'       eoh_body',
'  FROM email_outbox_hd,',
'       email_outbox_rcvr_list,',
'       user_mail_config',
' WHERE  umc_status = ''A''',
'       AND eoh_bu = umc_bu',
'       AND eoh_sndr_email = umc_user_name',
'       AND eoh_cre_by = umc_benf_id',
'       AND eoh_bu = :GLOBAL_bu',
'       AND eorl_sel_flag = ''Y''',
'       AND eoh_bu = eorl_bu',
'       AND eoh_doc_no = eorl_doc_no)',
'	LOOP',
'		',
'   IF cr1.eoh_doc_no IS NOT NULL THEN     ',
'     ---RAISE_APPLICATION_ERROR(-20999,cr1.eoh_doc_no);',
'     proc_send_mailv24(:GLOBAL_bu,cr1.eoh_doc_no,:GLOBAL_user,v_mail_status);',
'     PROC_SEND_MAILHTML(:GLOBAL_bu,cr1.eoh_doc_no,:GLOBAL_user,v_mail_status);',
'  				     ',
'     UPDATE email_outbox_hd SET eoh_status = v_mail_status',
'     WHERE eoh_bu = :GLOBAL_bu  ',
'       AND eoh_doc_no = cr1.eoh_doc_no;',
'  	 ',
'     UPDATE wfm_mail_report',
'        SET mr_status = v_mail_status',
'      WHERE mr_seq_no = cr1.eoh_doc_no;',
'    ',
'   END IF;			',
'			',
'	  apex_application.g_print_success_message := v_mail_status;',
'	   ',
'                	',
'             UPDATE email_outbox_rcvr_list',
'                SET eorl_status = v_mail_status,',
'                    eorl_sel_flag = ''N'',',
'                    eorl_upd_by = :GLOBAL_user,',
'                    eorl_upd_date = SYSDATE',
'              WHERE eorl_bu = :global_bu ',
'                AND eorl_doc_no = cr1.eoh_doc_no;',
'                ',
'             PROC_COMMIT;',
'	',
'	END LOOP;',
'	',
'	-- :SELECT_ALL_UNSENT := ''N'';	',
'',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SEND_NEW'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>849331312531708293
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6328823873053628450)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(6460903037336805513)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SELECT_FLAG'
,p_static_id=>'select-flag'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :APEX$ROW_STATUS = ''U'' THEN ',
'    --IF :EORL_SEL_FLAG IS NOT NULL THEN',
'--Raise_application_error(-20999,:EORL_SEL_FLAG);	',
'	UPDATE email_outbox_rcvr_list',
'	   SET eorl_sel_flag = :EORL_SEL_FLAG,',
'          eorl_upd_by   = :GLOBAL_USER,',
'          eorl_upd_date = SYSDATE',
'	 WHERE eorl_bu = :GLOBAL_bu  ',
'	   AND eorl_doc_no = :eoh_doc_no;',
'--apex_application.g_print_success_message := ''<span>Designation Level Updated.</span>'';   ',
'	COMMIT;',
'--END IF;	',
'END IF;',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>849302889268708248
);
wwv_flow_imp.component_end;
end;
/
