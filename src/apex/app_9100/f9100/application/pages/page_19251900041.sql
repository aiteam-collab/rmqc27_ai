prompt --application/pages/page_19251900041
begin
--   Manifest
--     PAGE: 19251900041
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
 p_id=>19251900041
,p_name=>'SMS'
,p_alias=>'SEND-UNSENT-SMS'
,p_step_title=>'SMS'
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
 p_id=>wwv_flow_imp.id(7596763994249289075)
,p_plug_name=>'BTN'
,p_static_id=>'btn'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P19251900041_BACK'
,p_plug_display_when_cond2=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5611622459229097335)
,p_plug_name=>'Sent / Unsent - Email'
,p_static_id=>'sent-unsent-email'
,p_region_name=>'EMAIL'
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
'-- )order by EOH_DOC_NO ASC',
'-- EOH_DOC_DATE DESC--,EOH_DOC_NO DESC'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P19251900041_TAB'
,p_plug_display_when_cond2=>'EMAIL'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
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
 p_id=>wwv_flow_imp.id(5616056121482498674)
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
 p_id=>wwv_flow_imp.id(5616056153244498675)
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
 p_id=>wwv_flow_imp.id(5616056394334498677)
,p_name=>'ATTCH'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Attach.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>410
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:125:&SESSION.::&DEBUG.::P125_P_DOC_NO:&EOH_DOC_NO.'
,p_link_text=>'<span class="fa fa-paperclip" aria-hidden="true" style = "color:red;font-weight:bold;"></span>'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5542412703446229744)
,p_name=>'ATTCH1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ATTCH1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>540
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5768342683643494033)
,p_name=>'COMPOSE_EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMPOSE_EMAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Compose Email'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>470
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
 p_id=>wwv_flow_imp.id(5620882338706700444)
,p_name=>'COMPOSE_MAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EDIT_EMAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Compose Mail'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>440
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
 p_id=>wwv_flow_imp.id(5616051704798498630)
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
 p_id=>wwv_flow_imp.id(5611626565466097376)
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
 p_id=>wwv_flow_imp.id(5616054718879498660)
,p_name=>'EOH_BU_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_BU_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Entity'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>380
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
 p_id=>wwv_flow_imp.id(5616052479092498638)
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
 p_id=>wwv_flow_imp.id(5616052614828498639)
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
 p_id=>wwv_flow_imp.id(5757825259149772632)
,p_name=>'EOH_DOC_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_DOC_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Eoh Doc Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>480
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
 p_id=>wwv_flow_imp.id(5611626706718097377)
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
 p_id=>wwv_flow_imp.id(5616051844165498632)
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
 p_id=>wwv_flow_imp.id(5616053045314498644)
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
 p_id=>wwv_flow_imp.id(5616054586157498659)
,p_name=>'EOH_PLNT_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_PLNT_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>370
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
 p_id=>wwv_flow_imp.id(5616052283741498636)
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
 p_id=>wwv_flow_imp.id(5616051609722498629)
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
 p_id=>wwv_flow_imp.id(5616052356092498637)
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
 p_id=>wwv_flow_imp.id(5616052908025498642)
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
 p_id=>wwv_flow_imp.id(5616052682915498640)
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
 p_id=>wwv_flow_imp.id(5616052805999498641)
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
 p_id=>wwv_flow_imp.id(5616051779916498631)
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
 p_id=>wwv_flow_imp.id(5616052190013498635)
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
 p_id=>wwv_flow_imp.id(5616052118240498634)
,p_name=>'EOH_VOU_PFX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_VOU_PFX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Doc. Pfx.'
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
 p_id=>wwv_flow_imp.id(5616052031007498633)
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
 p_id=>wwv_flow_imp.id(5616054774711498661)
,p_name=>'EOH_WF_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EOH_WF_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Document Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>390
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
 p_id=>wwv_flow_imp.id(5616053020930498643)
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
 p_id=>wwv_flow_imp.id(5616053324927498646)
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
 p_id=>wwv_flow_imp.id(5616053744967498651)
,p_name=>'EORL_CC_EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_CC_EMAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'CC'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>300
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
 p_id=>wwv_flow_imp.id(5616053929674498652)
,p_name=>'EORL_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eorl Cre By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>310
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
 p_id=>wwv_flow_imp.id(5616053967987498653)
,p_name=>'EORL_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Eorl Cre Date'
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
 p_id=>wwv_flow_imp.id(5616053383993498647)
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
 p_id=>wwv_flow_imp.id(5616053661040498650)
,p_name=>'EORL_RCVR_EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_RCVR_EMAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'TO'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>290
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
 p_id=>wwv_flow_imp.id(5616053570257498649)
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
 p_id=>wwv_flow_imp.id(5616054256019498656)
,p_name=>'EORL_SEL_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_SEL_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Select'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>350
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'Y'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5616053509301498648)
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
 p_id=>wwv_flow_imp.id(5616054481521498658)
,p_name=>'EORL_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unsent Reason'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>360
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
 p_id=>wwv_flow_imp.id(5616054076490498654)
,p_name=>'EORL_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eorl Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>330
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
 p_id=>wwv_flow_imp.id(5616054183392498655)
,p_name=>'EORL_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EORL_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Eorl Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>340
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
 p_id=>wwv_flow_imp.id(5620880904303700429)
,p_name=>'Edit_Mail'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Edit Mail'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>420
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
 p_id=>wwv_flow_imp.id(5768342408564494030)
,p_name=>'From'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'From'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'From'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
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
 p_id=>wwv_flow_imp.id(5616054907490498662)
,p_name=>'Receiver'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>400
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5542412560052229743)
,p_name=>'Receiver1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Receiver1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>530
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5620880954117700430)
,p_name=>'SEND'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Send'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>430
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P19251900041_DOC_NO_EM'',''&EOH_DOC_NO&'');apex.confirm("Do you want to Send the document?",''SEND'');'
,p_link_text=>'<span aria-hidden="true" class="fa fa-send-o" style="color: Green;font-size : 12px ;font-weight: bold"></span>'
,p_link_attributes=>'class="#LINK#"'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5542412826510229745)
,p_name=>'SEND1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEND1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_imp.id(5620883249139700453)
,p_name=>'SHOW_DATA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHOW_DATA'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>450
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5768342242825494029)
,p_name=>'Sent On'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Sent On'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Sent On'
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
 p_id=>wwv_flow_imp.id(5611626468422097375)
,p_internal_uid=>129664632878486347
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>false
,p_show_toolbar=>false
,p_toolbar_buttons=>null
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
 p_id=>wwv_flow_imp.id(5616132334522569707)
,p_interactive_grid_id=>wwv_flow_imp.id(5611626468422097375)
,p_static_id=>'1341705'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(5616132437746569713)
,p_report_id=>wwv_flow_imp.id(5616132334522569707)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5481963538843613713)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(5616056121482498674)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5482582052678751447)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(5616056394334498677)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>72
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5482583649393755674)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>42
,p_column_id=>wwv_flow_imp.id(5616056153244498675)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5483340356943541850)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(5620882338706700444)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616133024241569731)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(5611626565466097376)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616133819554569748)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(5611626706718097377)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>177
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616135624231569765)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(5616051609722498629)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>286
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616136445898569778)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(5616051704798498630)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>411
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616137417417569787)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(5616051779916498631)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616138311395569806)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(5616051844165498632)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616139144726569817)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(5616052031007498633)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616140009942569851)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(5616052118240498634)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>119
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616140900379569873)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(5616052190013498635)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>121
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616141819438569885)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(5616052283741498636)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616142669053569896)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(5616052356092498637)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616143589549569906)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(5616052479092498638)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616144418620569938)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(5616052614828498639)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616145261607569957)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(5616052682915498640)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616146229471570009)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(5616052805999498641)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616147104861570029)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(5616052908025498642)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616147871596570054)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(5616053020930498643)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616148809975570070)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(5616053045314498644)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616150546147570096)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(5616053324927498646)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616151476791570109)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(5616053383993498647)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616152510580570123)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(5616053509301498648)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616153397555570145)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(5616053570257498649)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616154329025570157)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(5616053661040498650)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>199
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616155219157570174)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(5616053744967498651)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>224
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616156107761570193)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(5616053929674498652)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616156973043570217)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(5616053967987498653)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616157967160570226)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(5616054076490498654)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616158823808570237)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(5616054183392498655)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616159668583570248)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(5616054256019498656)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616161458831570270)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(5616054481521498658)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>201
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616162429049570282)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(5616054586157498659)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>305
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616163240371570292)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(5616054718879498660)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>199
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616164214897570310)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(5616054774711498661)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>304
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5616165110597570324)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(5616054907490498662)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>101
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5620927176423708237)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>40
,p_column_id=>wwv_flow_imp.id(5620880904303700429)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5620928099579708246)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>41
,p_column_id=>wwv_flow_imp.id(5620880954117700430)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>62
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5624061432892853176)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>43
,p_column_id=>wwv_flow_imp.id(5620883249139700453)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5758229274533962346)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>45
,p_column_id=>wwv_flow_imp.id(5757825259149772632)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5768363139509512571)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(5768342242825494029)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>166
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5768364217120512585)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(5768342408564494030)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>192
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5768365156533512601)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>44
,p_column_id=>wwv_flow_imp.id(5768342683643494033)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5963394615041014646)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>46
,p_column_id=>wwv_flow_imp.id(5542412560052229743)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>73
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5963395532342014656)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>47
,p_column_id=>wwv_flow_imp.id(5542412703446229744)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5963396428315014662)
,p_view_id=>wwv_flow_imp.id(5616132437746569713)
,p_display_seq=>48
,p_column_id=>wwv_flow_imp.id(5542412826510229745)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7596370816193146234)
,p_plug_name=>'Sent / Unsent - SMS'
,p_static_id=>'sent-unsent-sms'
,p_region_name=>'SMS'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select --ROWID,',
'       SOH_BU,',
'       SOH_DOC_NO,',
'       TO_CHAR(SOH_DOC_DATE,''DD.MM.YYYY HH:MI:SS AM'')SOH_DOC_DATE,',
'      --  SOH_DOC_DATE,',
'       SOH_SNDR_MOB_NO,',
'       SOH_BODY,',
'       SOH_USER_ID,',
'       SOH_EMP_ID,',
'       SOH_VOU_TYPE,',
'       SOH_VOU_PFX,',
'       SOH_VOU_NO,',
'       SOH_STATUS,',
'       (CASE   WHEN (SOH_STATUS NOT LIKE ''%SUCCESS%'' OR SOH_STATUS IS NULL) THEN ''Unsent''',
'               WHEN (SOH_STATUS LIKE ''%SUCCESS%'') THEN ''Sent'' END) soh_send_type,',
'       (SELECT bu_name1',
'          FROM business_units',
'         WHERE bu_id = SOH_BU)soh_bu_desc,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = SOH_BU ',
'           AND bup_plant_id = SOH_UNIT) soh_unit_desc,',
'       (SELECT NVL(wf_bus_proc_desc2, wf_bus_proc_desc) wf_bus_proc_desc',
'          FROM work_flow',
'         WHERE wf_bu  = :Global_bu',
'           AND wf_bus_proc_id = SOH_VOU_TYPE) SOH_VOU_TYPE_DESC,',
'       SOH_CRE_BY,',
'       SOH_CRE_DATE,',
'       SOH_UPD_BY,',
'       SOH_UPD_DATE,',
'       SOH_UNIT,',
'       SOH_API_URL,',
'       SOH_SMS_TYPE,',
'       SORL_BU,',
'       SORL_DOC_NO,',
'       SORL_SEQ_NO,',
'       SORL_RCVR_MOB_NO,',
'       SORL_CRE_BY,',
'       SORL_CRE_DATE,',
'       SORL_UPD_BY,',
'       SORL_UPD_DATE,',
'       SORL_API_URL,',
'       SORL_SUB_SEQ_NO,',
'       ''<span aria-hidden="true" class="fa fa-send-o" style="color: red ;font-size : 12px ;font-weight: bold"></span>'' "RESEND",',
'       NULL "Receiver"',
'  from SMS_OUTBOX_VW',
' WHERE SOH_BU = :GLOBAL_bu ',
' -- ORDER BY TO_CHAR(SOH_DOC_DATE,''DD.MM.YYYY HH:MI:SS AM'') DESC',
' '))
,p_plug_source_type=>'NATIVE_IR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(7596374487778146271)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>2114412652234535243
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596415393235215256)
,p_db_column_name=>'RESEND'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Resend'
,p_column_link=>'javascript:$s(''P19251900041_SOH_DOC_NO'',''#SOH_DOC_NO#''),$s(''P19251900041_SOH_VOU_TYPE'',''#SOH_VOU_TYPE#''),$s(''P19251900041_SORL_RCVR_MOB_NO'',''#SORL_RCVR_MOB_NO#''),$s(''P19251900041_SOH_BODY'',''#SOH_BODY#'');apex.confirm("Do you want to Resend the documen'
||'t?",''SMSRESEND'');'
,p_column_linktext=>'#RESEND#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596415274160215255)
,p_db_column_name=>'Receiver'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Receiver'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596414056395215243)
,p_db_column_name=>'SOH_API_URL'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Soh Api Url'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596375091661146277)
,p_db_column_name=>'SOH_BODY'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Body'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596374636148146273)
,p_db_column_name=>'SOH_BU'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Soh Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596413326839215235)
,p_db_column_name=>'SOH_BU_DESC'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Business Entity'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="width: 100px;',
'   word-wrap: break-word;">#SOH_BU_DESC#</div>',
''))
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596413549091215238)
,p_db_column_name=>'SOH_CRE_BY'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Soh Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596413686710215239)
,p_db_column_name=>'SOH_CRE_DATE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Soh Cre Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596374871081146275)
,p_db_column_name=>'SOH_DOC_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Doc. Date'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="width: 90px;',
'   word-wrap: break-word;">#SOH_DOC_DATE#</div>',
''))
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596374828343146274)
,p_db_column_name=>'SOH_DOC_NO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Soh Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596412675643215229)
,p_db_column_name=>'SOH_EMP_ID'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Soh Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596413217823215234)
,p_db_column_name=>'SOH_SEND_TYPE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596414166272215244)
,p_db_column_name=>'SOH_SMS_TYPE'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Soh Sms Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596374945500146276)
,p_db_column_name=>'SOH_SNDR_MOB_NO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Soh Sndr Mob No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596413061048215233)
,p_db_column_name=>'SOH_STATUS'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Exception'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596414035523215242)
,p_db_column_name=>'SOH_UNIT'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596413396575215236)
,p_db_column_name=>'SOH_UNIT_DESC'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596413770296215240)
,p_db_column_name=>'SOH_UPD_BY'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Soh Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596413900776215241)
,p_db_column_name=>'SOH_UPD_DATE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Soh Upd Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596375209750146278)
,p_db_column_name=>'SOH_USER_ID'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Soh User Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596412935945215232)
,p_db_column_name=>'SOH_VOU_NO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Vou. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596412905946215231)
,p_db_column_name=>'SOH_VOU_PFX'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Vou. Pfx.'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="width: 70px;',
'   word-wrap: break-word;">#SOH_VOU_PFX#</div>'))
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596412791079215230)
,p_db_column_name=>'SOH_VOU_TYPE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Soh Vou Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596413519065215237)
,p_db_column_name=>'SOH_VOU_TYPE_DESC'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Document Type'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="width: 100px;',
'   word-wrap: break-word;">#SOH_VOU_TYPE_DESC#</div>',
''))
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596415106910215253)
,p_db_column_name=>'SORL_API_URL'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Sorl Api Url'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596414264149215245)
,p_db_column_name=>'SORL_BU'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Sorl Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596414713612215249)
,p_db_column_name=>'SORL_CRE_BY'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Sorl Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596414751702215250)
,p_db_column_name=>'SORL_CRE_DATE'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Sorl Cre Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596414337733215246)
,p_db_column_name=>'SORL_DOC_NO'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Sorl Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596414566140215248)
,p_db_column_name=>'SORL_RCVR_MOB_NO'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Receiver Mobile'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596414438934215247)
,p_db_column_name=>'SORL_SEQ_NO'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Sorl Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596415213435215254)
,p_db_column_name=>'SORL_SUB_SEQ_NO'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596414902098215251)
,p_db_column_name=>'SORL_UPD_BY'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Sorl Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596414969152215252)
,p_db_column_name=>'SORL_UPD_DATE'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Sorl Upd Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7596429135783216801)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'21144674'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'SOH_DOC_DATE:SOH_UNIT:SORL_SUB_SEQ_NO:SOH_VOU_PFX:SOH_VOU_NO:SORL_RCVR_MOB_NO:SOH_BODY:SOH_SEND_TYPE:SOH_STATUS:SOH_VOU_TYPE_DESC:Receiver:SOH_BU_DESC:SOH_UNIT_DESC:RESEND'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7596415454115215257)
,p_plug_name=>'Sent / Unsent WhatsApp'
,p_static_id=>'sent-unsent-whatsapp'
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
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P19251900041_TAB'
,p_plug_display_when_cond2=>'WHATSAPP'
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
 p_id=>wwv_flow_imp.id(7596760434849289039)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>2114798599305678011
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596760991817289045)
,p_db_column_name=>'WOV_BENF_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Beneficiary ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596761071257289046)
,p_db_column_name=>'WOV_BENF_NAME'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596760857318289044)
,p_db_column_name=>'WOV_BENF_TYPE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596760461011289040)
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
 p_id=>wwv_flow_imp.id(7596761212328289047)
,p_db_column_name=>'WOV_COUNTRY_CODE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Country Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596762171768289057)
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
 p_id=>wwv_flow_imp.id(7596762301284289058)
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
 p_id=>wwv_flow_imp.id(7596762361638289059)
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
 p_id=>wwv_flow_imp.id(7596762449108289060)
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
 p_id=>wwv_flow_imp.id(7596762616011289061)
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
 p_id=>wwv_flow_imp.id(7596763216357289067)
,p_db_column_name=>'WOV_DATE'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596761546499289051)
,p_db_column_name=>'WOV_MESSAGE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596761333626289048)
,p_db_column_name=>'WOV_MOBILE_NO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Mobile No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596761978973289055)
,p_db_column_name=>'WOV_RESPONSE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Response'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596761894761289054)
,p_db_column_name=>'WOV_RQST_JSON'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Wov Rqst Json'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596762061652289056)
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
 p_id=>wwv_flow_imp.id(7596760633497289041)
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
 p_id=>wwv_flow_imp.id(7596761649073289052)
,p_db_column_name=>'WOV_STATUS'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Wov Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596761452587289050)
,p_db_column_name=>'WOV_TEMPLATE_DESC'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Template'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596761425189289049)
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
 p_id=>wwv_flow_imp.id(7596761750094289053)
,p_db_column_name=>'WOV_TYPE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Sent Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7596762649224289062)
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
 p_id=>wwv_flow_imp.id(7596762796829289063)
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
 p_id=>wwv_flow_imp.id(7596762879155289064)
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
 p_id=>wwv_flow_imp.id(7596763007897289065)
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
 p_id=>wwv_flow_imp.id(7596763081682289066)
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
 p_id=>wwv_flow_imp.id(7596760797411289043)
,p_db_column_name=>'WOV_USERID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Wov Userid'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7597371049431632912)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'21154093'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WOV_SEQ_NO:WOV_DATE:WOV_BENF_ID:WOV_BENF_NAME:WOV_BENF_TYPE:WOV_COUNTRY_CODE:WOV_MOBILE_NO:WOV_TYPE:WOV_TEMPLATE_DESC:WOV_MESSAGE:WOV_RESPONSE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6316411294689453119)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7596763994249289075)
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
 p_id=>wwv_flow_imp.id(7605135932397154754)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7596415454115215257)
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
 p_id=>wwv_flow_imp.id(5768665185425741030)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5611622459229097335)
,p_button_name=>'Compose_Mail1'
,p_static_id=>'compose-mail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Compose Mail'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:1900043:&SESSION.::&DEBUG.::P1900043_SHOW_DATA,P1900043_EOH_DOC_NO_COM:Y,'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5600248004838075633)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(7596370816193146234)
,p_button_name=>'Find_search'
,p_static_id=>'find-search'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>' Search'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:1925190004:&SESSION.::&DEBUG.:::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5583611428502820765)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7596415454115215257)
,p_button_name=>'New'
,p_static_id=>'new'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-paperclip'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5616056454609498678)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(5611622459229097335)
,p_button_name=>'Save1'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7599622418499040034)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7596415454115215257)
,p_button_name=>'Search2'
,p_static_id=>'search'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1925190004:&SESSION.::&DEBUG.::P1925190004_TYPE:'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7599622236823040033)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(5611622459229097335)
,p_button_name=>'Search1'
,p_static_id=>'search-2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:1925190004:&SESSION.::&DEBUG.::P1925190004_TYPE:'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7605135980324154755)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7596415454115215257)
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
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5755675639446909534)
,p_branch_name=>'Go to page Internal Messages (30)'
,p_branch_action=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P19251900041_TAB'
,p_branch_condition_text=>'I'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6316411832907453124)
,p_name=>'P19251900041_BACK'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7596763994249289075)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5620881112331700431)
,p_name=>'P19251900041_DOC_NO_EM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5611622459229097335)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5755675633577909533)
,p_name=>'P19251900041_MAIN'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7596763994249289075)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5620882736604700448)
,p_name=>'P19251900041_SHOW_DATA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5611622459229097335)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7596370724433146233)
,p_name=>'P19251900041_SOH_BODY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7596370816193146234)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7596370364953146230)
,p_name=>'P19251900041_SOH_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7596370816193146234)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7596370499753146231)
,p_name=>'P19251900041_SOH_VOU_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7596370816193146234)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7596370576719146232)
,p_name=>'P19251900041_SORL_RCVR_MOB_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7596370816193146234)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7596763935470289074)
,p_name=>'P19251900041_TAB'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7596763994249289075)
,p_item_default=>'NVL(:P19251900041_MAIN,''SMS'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Internal Messages;I,SMS;SMS,Email;EMAIL,Whatsapp;WHATSAPP'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--preTextBlock:t-Form-fieldContainer--postTextBlock:margin-bottom-sm:margin-left-lg'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'number_of_columns', '4',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7599622506152040035)
,p_name=>'P19251900041_TITAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7596763994249289075)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5611622232017097332)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19251900041_DOC_NO_EMAIL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5611622303959097333)
,p_event_id=>wwv_flow_imp.id(5611622232017097332)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P19251900041_DOC_NO_EMAIL',
  'language', 'PLSQL',
  'plsql_code', ':P19251900041_DOC_NO_EMAIL :=:EOH_DOC_NO;',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5755675311427909530)
,p_name=>'Tab'
,p_static_id=>'tab'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19251900041_TAB'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5755675497600909532)
,p_event_id=>wwv_flow_imp.id(5755675311427909530)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P19251900041_MAIN',
  'items_to_submit', 'P19251900041_TAB',
  'language', 'PLSQL',
  'plsql_code', ':P19251900041_MAIN := :P19251900041_TAB;',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5755675392721909531)
,p_event_id=>wwv_flow_imp.id(5755675311427909530)
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
    'const selectedTab = $v("P19251900041_TAB");',
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
 p_id=>wwv_flow_imp.id(7625532551161067033)
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
,p_process_when=>'SEND'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>2143570715617456005
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5616055636950498670)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(5611622459229097335)
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
,p_internal_uid=>134093801406887642
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5600248188298075635)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SELF_FLAG'
,p_static_id=>'self-flag'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :EORL_SEL_FLAG IS NOT NULL THEN',
'	',
'	UPDATE email_outbox_rcvr_list',
'	   SET eorl_sel_flag = :EORL_SEL_FLAG,',
'          eorl_upd_by   = :GLOBAL_USER,',
'          eorl_upd_date = SYSDATE',
'	 WHERE eorl_bu = :GLOBAL_bu  ',
'	   AND eorl_doc_no = :eoh_doc_no;',
'	',
'	PROC_COMMIT;',
'END IF;	'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>118286352754464607
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5616056271117498676)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(5611622459229097335)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Send / Unsend - Email - Save Interactive Grid Data'
,p_static_id=>'send-unsend-email-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>134094435573887648
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7596763697638289072)
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
,p_process_when_button_id=>wwv_flow_imp.id(7605135980324154755)
,p_internal_uid=>2114801862094678044
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7590239403521992478)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SMS Resend'
,p_static_id=>'sms-resend'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  proc_send_sms_erp(:GLOBAL_bu,:P19251900041_SOH_DOC_NO,:P19251900041_SOH_VOU_TYPE,:P19251900041_SORL_RCVR_MOB_NO,:P19251900041_SOH_BODY,:GLOBAL_user);',
'  apex_application.g_print_success_message := ''SMS Sent.'';',
'EXCEPTION',
'  WHEN OTHERS THEN raise_application_error (-20999,''SMS Not Sent, Please check exception.'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SMSRESEND'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>2108277567978381450
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7599622571316040036)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'tital'
,p_static_id=>'tital'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P19251900041_TAB = ''SMS'' then ',
'   :P19251900041_TITAL := ''Send / Unsent - SMS'';',
'elsif :P19251900041_TAB = ''EMAIL'' then',
'   :P19251900041_TITAL := ''Send / Unsent - Email'';',
'elsif :P19251900041_TAB = ''WHATSAPP'' then',
'   :P19251900041_TITAL := ''Sent / Unsent - WhatsApp'';',
'end if;',
'   '))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2117660735772429008
);
wwv_flow_imp.component_end;
end;
/
