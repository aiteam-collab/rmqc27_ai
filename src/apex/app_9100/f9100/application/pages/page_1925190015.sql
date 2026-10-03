prompt --application/pages/page_1925190015
begin
--   Manifest
--     PAGE: 1925190015
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
 p_id=>1925190015
,p_name=>'Email / SMS Setup'
,p_alias=>'USER-EMAIL-SMS-ACCESS'
,p_step_title=>'Email / SMS Setup'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function send(a,b) {',
'   if (a == ''USER_ACT'')',
'   {',
'    apex.server.process',
'    (  ',
'        "USER_ACTIVATE", ',
'        {  ',
'          x01: b',
'        },',
'        {',
'            dataType: ''text'', ',
'            success: function (data) { ',
'                if (data.trim() !== ''success'') {',
'                    apex.message.showErrors([{ type: "error", location: "page", message: data.replace(''sqlerrm:ORA-20999: '', ''''), unsafe: false }]);',
'                } else {',
'                    console.log(''success'', data);',
'                    apex.region("ig_line").refresh();',
'                    apex.message.showPageSuccess("Document Activated.");',
'                }',
'            }',
'        }',
'    );',
'   }',
'',
'   if (a == ''USER_INACT'')',
'   {',
'    apex.server.process',
'    (  ',
'        "USER_INACTIVE", ',
'        {  ',
'          x01: b',
'        },',
'        {',
'            dataType: ''text'', ',
'            success: function (data) { ',
'                if (data.trim() !== ''success'') {',
'                    apex.message.showErrors([{ type: "error", location: "page", message: data.replace(''sqlerrm:ORA-20999: '', ''''), unsafe: false }]);',
'                } else {',
'                    console.log(''success'', data);',
'                    apex.region("ig_line").refresh();',
'                    apex.message.showPageSuccess("Document Inactivated.");',
'                }',
'            }',
'        }',
'    );',
'   }',
'',
'   if (a == ''TEMP_ACT'')',
'   {',
'    apex.server.process',
'    (  ',
'        "TEMP_ACTIVATE",',
'        {  ',
'          x01: b',
'        },',
'        {',
'            dataType: ''text'', ',
'            success: function (data) {',
'                if (data.trim() !== ''success'') {',
'                    apex.message.showErrors([{ type: "error", location: "page", message: data.replace(''sqlerrm:ORA-20999: '', ''''), unsafe: false }]);',
'                } else {',
'                    console.log(''success'', data);',
'                    apex.region("template").refresh();',
'                    apex.message.showPageSuccess("Document Activated.");',
'                }',
'            }',
'        }',
'    );',
'   }',
'',
'   if (a == ''TEMP_INACT'')',
'   {',
'    apex.server.process',
'    (  ',
'        "TEMP_INACTIVE", ',
'        {  ',
'          x01: b',
'        },',
'        {',
'            dataType: ''text'', ',
'            success: function (data) {',
'                if (data.trim() !== ''success'') {',
'                    apex.message.showErrors([{ type: "error", location: "page", message: data.replace(''sqlerrm:ORA-20999: '', ''''), unsafe: false }]);',
'                } else {',
'                    console.log(''success'', data);',
'                    apex.region("template").refresh();',
'                    apex.message.showPageSuccess("Document Inactivated.");',
'                }',
'            }',
'        }',
'    );',
'   }',
'',
'   if (a == ''SUBSCRIBE'')',
'   {',
'    apex.server.process',
'    (  ',
'        "SUBSCRIBE", ',
'        {  ',
'          x01: b',
'        },',
'        {',
'            dataType: ''text'', ',
'            success: function (data) { ',
'                if (data.trim() !== ''success'') {',
'                    apex.message.showErrors([{ type: "error", location: "page", message: data.replace(''sqlerrm:ORA-20999: '', ''''), unsafe: false }]);',
'                } else {',
'                    console.log(''success'', data);',
'                    apex.region("ig_user_list").refresh();',
'                    apex.message.showPageSuccess("User Subscribed To WhatsApp Successfully!");',
'                }',
'            }',
'        }',
'    );',
'   }',
'',
'   if (a == ''WHAT_TEMP'')',
'   {',
'    apex.server.process',
'    (  ',
'        "WHAT_TEMP_ACTIVATE", ',
'        {  ',
'          x01: b',
'        },',
'        {',
'            dataType: ''text'', ',
'            success: function (data) { ',
'                if (data.trim() !== ''success'') {',
'                    apex.message.showErrors([{ type: "error", location: "page", message: data.replace(''sqlerrm:ORA-20999: '', ''''), unsafe: false }]);',
'                } else {',
'                    console.log(''success'', data);',
'                    apex.region("ig_temp_app").refresh();',
'                    apex.message.showPageSuccess("Document Activated.");',
'                }',
'            }',
'        }',
'    );',
'   }',
'};'))
,p_javascript_code_onload=>'slideclose();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Report-cell {',
'',
'    border-color: #fff;',
'    background-color: #fff;',
'    background-color: #fff;',
'}',
'#general.t-Button {',
'    background-color:   #2EBFBC;',
'    color: white;',
'    width: 220px;',
'    height: 30px;',
'    font-size: 13px;',
'    text-align: left;',
'    margin-bottom: 4px;',
'    margin-left: auto;',
'    /* <img src="icons/close.png" /> */',
'}',
'#user.t-Button {',
'    background-color:  #3CAF85;',
'    color: white;',
'    width: 220px;',
'    height: 30px;',
'    font-size: 13px;',
'    text-align: left;',
'    margin-bottom: 4px;',
'    margin-left: auto;',
'}',
'#dept.t-Button {',
'    background-color: #81BB5F;',
'    color: white;',
'    width: 220px;',
'    height: 30px;',
'    font-size: 13px;',
'    text-align: left;',
'    margin-bottom: 4px;',
'    margin-left: auto;',
'}',
'#url.t-Button {',
'    background-color: #e95c5499;',
'    color: white;',
'    width: 220px;',
'    height: 30px;',
'    font-size: 13px;',
'    text-align: left;',
'    margin-bottom: 4px;',
'    margin-left: auto;',
'    /* <img src="icons/close.png" /> */',
'}',
'#header.t-Button {',
'    background-color: #E85D88;',
'    color: white;',
'    width: 220px;',
'    height: 30px;',
'    font-size: 13px;',
'    text-align: left;',
'    margin-bottom: 4px;',
'    margin-left: auto;',
'}',
'#temp.t-Button {',
'    background-color: #CA589D;',
'    color: white;',
'    width: 220px;',
'    height: 30px;',
'    font-size: 13px;',
'    text-align: left;',
'    margin-bottom: 4px;',
'    margin-left: auto;',
'}',
'',
'#conf.t-Button {',
'    background-color: #ffa500;',
'    color: white;',
'    width: 220px;',
'    height: 30px;',
'    font-size: 13px;',
'    text-align: left;',
'    margin-bottom: 4px;',
'    margin-left: auto;',
'}',
'',
'#user1.t-Button {',
'    background-color: #2c9092;',
'    color: white;',
'    width: 220px;',
'    height: 30px;',
'    font-size: 13px;',
'    text-align: left;',
'    margin-bottom: 4px;',
'    margin-left: auto;',
'}',
'',
'#temp1.t-Button {',
'    background-color: #b2b8db;',
'    color: white;',
'    width: 220px;',
'    height: 30px;',
'    font-size: 13px;',
'    text-align: left;',
'    margin-bottom: 4px;',
'    margin-left: auto;',
'}',
'',
'',
'.a-GV-table th.a-GV-header, .a-GV-table th.a-GV-headerGroup {',
'    font-weight: var(--a-gv-header-cell-font-weight,var(--a-base-font-weight-bold,500));',
'    background: #00b1e7;',
'    color: white;',
'    font: -webkit-control;',
'}'))
,p_step_template=>wwv_flow_imp.id(5639522199844485987)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8634712944636865620)
,p_plug_name=>'<b>Configuration</b>'
,p_static_id=>'b-configuration-b'
,p_region_name=>'ig_conf_pr'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noUI:t-Region--hiddenOverflow'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>100
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WAC_BU,',
'       WAC_PLNT,',
'       WAC_BASE_URL,',
'       WAC_API_KEY,',
'       WAC_USERNAME,',
'       WAC_PASSWORD,',
'       WAC_BUS_MOB_NO,',
'       WAC_TRACK_USER_URL,',
'       WAC_TRACK_EVENT_URL,',
'       WAC_GET_USER_URL,',
'       WAC_SEND_WA_URL,',
'       WAC_WALLET_PATH,',
'       WAC_WALLET_PWD,',
'       WAC_CRE_BY,',
'       WAC_CRE_DATE,',
'       WAC_CRE_EMP_ID,',
'       WAC_CRE_IP_ADDR,',
'       WAC_CRE_OS_USER,',
'       WAC_UPD_BY,',
'       WAC_UPD_DATE,',
'       WAC_UPD_EMP_ID,',
'       WAC_UPD_IP_ADDR,',
'       WAC_UPD_OS_USER',
'  from WHATSAPP_API_CONFIG',
' where WAC_BU = :GLOBAL_bu'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'<b>Configuration</b>'
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
 p_id=>wwv_flow_imp.id(8681770450443238911)
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
 p_id=>wwv_flow_imp.id(8681770522930238912)
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
 p_id=>wwv_flow_imp.id(8637151326116256104)
,p_name=>'ROWID_CONF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636588844458474703)
,p_name=>'WAC_API_KEY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_API_KEY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'API Key'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_stretch=>'N'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636588669540474702)
,p_name=>'WAC_BASE_URL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_BASE_URL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'URL'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_stretch=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>200
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636588546115474700)
,p_name=>'WAC_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wac Bu'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636589130136474706)
,p_name=>'WAC_BUS_MOB_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_BUS_MOB_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Mobile No.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_stretch=>'N'
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636589763387474713)
,p_name=>'WAC_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wac Cre By'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636589956100474714)
,p_name=>'WAC_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Wac Cre Date'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636590054724474715)
,p_name=>'WAC_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wac Cre Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>180
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636590135034474716)
,p_name=>'WAC_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wac Cre Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>20
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636590255621474717)
,p_name=>'WAC_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wac Cre Os User'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636589364965474709)
,p_name=>'WAC_GET_USER_URL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_GET_USER_URL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wac Get User Url'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>200
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636589028774474705)
,p_name=>'WAC_PASSWORD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_PASSWORD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Password'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_stretch=>'N'
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636588575711474701)
,p_name=>'WAC_PLNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_PLNT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Unit'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_stretch=>'N'
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
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT bup_name1,',
'       wac_plnt',
'  FROM bus_unit_plants,',
'       whatsapp_api_config',
' WHERE bup_bu       = wac_bu',
'   AND bup_plant_id = wac_plnt'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636589472770474710)
,p_name=>'WAC_SEND_WA_URL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_SEND_WA_URL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wac Send Wa Url'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>200
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636589341996474708)
,p_name=>'WAC_TRACK_EVENT_URL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_TRACK_EVENT_URL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wac Track Event Url'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>200
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636589207298474707)
,p_name=>'WAC_TRACK_USER_URL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_TRACK_USER_URL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wac Track User Url'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>200
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636590360854474718)
,p_name=>'WAC_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wac Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
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
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636590441346474719)
,p_name=>'WAC_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Wac Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636590493429474720)
,p_name=>'WAC_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wac Upd Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636590598266474721)
,p_name=>'WAC_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wac Upd Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>20
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636590682668474722)
,p_name=>'WAC_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wac Upd Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>250
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636588917590474704)
,p_name=>'WAC_USERNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_USERNAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Username'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_stretch=>'N'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636589579897474711)
,p_name=>'WAC_WALLET_PATH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_WALLET_PATH'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wac Wallet Path'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>200
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636589731055474712)
,p_name=>'WAC_WALLET_PWD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAC_WALLET_PWD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wac Wallet Pwd'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
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
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(8636588389789474699)
,p_internal_uid=>3154626554245863671
,p_is_editable=>true
,p_edit_operations=>'i:u'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
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
 p_id=>wwv_flow_imp.id(8636592727100486404)
,p_interactive_grid_id=>wwv_flow_imp.id(8636588389789474699)
,p_static_id=>'15194472'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(8636592886441486407)
,p_report_id=>wwv_flow_imp.id(8636592727100486404)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5481961897978611090)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(8681770522930238912)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636593268885486421)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(8636588546115474700)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636594248873486440)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(8636588575711474701)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>86
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636595140946486451)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(8636588669540474702)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>215
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636596040746486457)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(8636588844458474703)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>473
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636596930576486473)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(8636588917590474704)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>217
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636597844381486482)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(8636589028774474705)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>127
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636598675351486490)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(8636589130136474706)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636599571423486496)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(8636589207298474707)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636600516075486504)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(8636589341996474708)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636601459859486512)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(8636589364965474709)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636602225340486519)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(8636589472770474710)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636603152665486529)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(8636589579897474711)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636603979251486538)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(8636589731055474712)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636604867177486546)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(8636589763387474713)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636605803224486552)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(8636589956100474714)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636606747588486562)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(8636590054724474715)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636607649168486569)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(8636590135034474716)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636608553025486576)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(8636590255621474717)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636609415383486582)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(8636590360854474718)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636610350349486591)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(8636590441346474719)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636611220588486598)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(8636590493429474720)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636612098747486605)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(8636590598266474721)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636612900559486616)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(8636590682668474722)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8637616714579356716)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(8637151326116256104)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8684842326384074476)
,p_view_id=>wwv_flow_imp.id(8636592886441486407)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(8681770450443238911)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7739428874024793090)
,p_plug_name=>'<b>Dept.  Config.</b>'
,p_static_id=>'b-dept-config-b'
,p_region_name=>'ig_line1'
,p_region_template_options=>'#DEFAULT#:t-Region--hideShowIconsMath:is-expanded:t-Region--noUI:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       UMC_BU,',
'       UMC_BENF_TYPE,',
'       UMC_BENF_ID,',
'       UMC_EMAIL_ID,',
'',
'    --    (select DEPT_NAME1 from departments ',
'    --    WHERE DEPT_BU = UMC_BU',
'    --    and DEPT_ID =UMC_BENF_ID)Department_name,',
'       UMC_USER_NAME,',
'       UMC_PASSWORD,',
'       UMC_EFF_FROM,',
'       UMC_EFF_TO,',
'       UMC_STATUS,',
'       UMC_CRE_BY,',
'       UMC_CRE_IP_ADDR,',
'       UMC_CRE_OS_USER,',
'       UMC_CRE_DATE,',
'       UMC_CRE_EMP_ID,',
'       UMC_UPD_BY,',
'       UMC_UPD_IP_ADDR,',
'       UMC_UPD_OS_USER,',
'       UMC_UPD_DATE,',
'       UMC_UPD_EMP_ID,',
'       UMC_SUITE,',
'    --    CASE WHEN UMC_STATUS = ''N'' THEN ''link'' ELSE ''nolink'' END LINK1,',
'    --         CASE WHEN UMC_STATUS = ''N'' THEN',
'    --          ''<span class="t-Button  t-Button--success t-Button--tiny lto1108671385843807736_0 ">Active</span>''            ',
'    --          ELSE',
'    --          ''<span class="t-Button  t-Button--tiny lto1108671385843807736_0" style = "cursor:no-drop;cursor:no-drop;">Active</span>''                   ',
'    --    END',
'    --       Active_btn,',
'    --    CASE WHEN UMC_STATUS = ''A'' THEN ''link'' ELSE ''nolink'' END LINK2,',
'    --         CASE WHEN UMC_STATUS = ''A'' THEN',
'    --          ''<span class="t-Button  t-Button--danger t-Button--tiny lto1108671385843807736_0 ">InActive</span>''            ',
'    --          ELSE',
'    --          ''<span class="t-Button  t-Button--tiny lto1108671385843807736_0" style = "cursor:no-drop;cursor:no-drop;">InActive</span>''                   ',
'    --    END',
'    --        InActive_btn',
'    CASE WHEN UMC_STATUS IN (''N'') THEN ''link'' ELSE ''nolink'' END LINK1,',
'         CASE WHEN UMC_STATUS = ''N'' THEN',
'                ''<span class="fa fa fa-paper-plane fa-anim-flash" aria-hidden="true"  style="color:#398321" title="Active"></span>''',
'         ELSE ''<span class="fa fa fa-paper-plane" aria-hidden="true" style="color:#c8f7d094;cursor:no-drop;"></span>'' ',
'       END "Active_btn",',
'       CASE WHEN UMC_STATUS IN (''A'') THEN ''link'' ELSE ''nolink'' END LINK2,',
'         CASE WHEN UMC_STATUS = ''A'' THEN',
'                ''<span class="fa fa fa-paper-plane fa-anim-flash" aria-hidden="true"  style="color:red" title="InActive"></span>''',
'         ELSE ''<span class="fa fa fa-paper-plane" aria-hidden="true" style="color:#e95c5499;cursor:no-drop;"></span>'' ',
'       END "InActive_btn"',
'       ',
'  from USER_MAIL_CONFIG',
'  where UMC_BU=:global_bu',
'  AND UMC_BENF_TYPE = ''D'''))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'<b>Dept.  Config.</b>'
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
,p_required_patch=>wwv_flow_imp.id(7031259516264491845)
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739429241684793093)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739429146993793092)
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
 p_id=>wwv_flow_imp.id(7743844154778791187)
,p_name=>'Active_btn'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Active_btn'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Active'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P1925190015_DEPT_ROWID'',''&ROWID.'');apex.confirm(''Do you want to Active this Department?'',''Active1'');'
,p_link_text=>'&"Active_btn".'
,p_link_attributes=>'CLASS="&LINK1."'
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
,p_include_in_export=>false
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7743844215043791188)
,p_name=>'InActive_btn'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'InActive_btn'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Inactive'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P1925190015_DEPT_ROWID'',''&ROWID.'');apex.confirm(''Do you want to InActive this Department?'',''InActive1'');'
,p_link_text=>'&"InActive_btn".'
,p_link_attributes=>'CLASS="&LINK2."'
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
,p_include_in_export=>false
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739431619919793117)
,p_name=>'LINK1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LINK1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739431740685793118)
,p_name=>'LINK2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LINK2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739431494699793116)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739429277487793094)
,p_name=>'UMC_BENF_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_BENF_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Department'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Department')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select   ',
'       DEPT_NAME1||''(''||DEPT_ID||'')'' Department_Name, ',
'       DEPT_ID from departments WHERE ',
'DEPT_BU = :GLOBAL_BU '))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739430111644793102)
,p_name=>'UMC_BENF_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_BENF_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739430189562793103)
,p_name=>'UMC_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_BU'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739430467571793106)
,p_name=>'UMC_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739430776079793109)
,p_name=>'UMC_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739430879592793110)
,p_name=>'UMC_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739430589586793107)
,p_name=>'UMC_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_IP_ADDR'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739430701863793108)
,p_name=>'UMC_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_OS_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739430277178793104)
,p_name=>'UMC_EFF_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_EFF_FROM'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739430378967793105)
,p_name=>'UMC_EFF_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_EFF_TO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739429985066793101)
,p_name=>'UMC_EMAIL_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_EMAIL_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739429397862793095)
,p_name=>'UMC_PASSWORD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_PASSWORD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_PASSWORD'
,p_heading=>'Password'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
,p_is_required=>false
,p_max_length=>500
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739429485130793096)
,p_name=>'UMC_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Status'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:New;N,Active;A,Inactive;I'
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ITEM_IS_NOT_NULL'
,p_readonly_condition=>'UMC_BENF_ID'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739429750825793098)
,p_name=>'UMC_SUITE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_SUITE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Suite'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Gmail;G,Zoho;Z,Outlook;O'
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739430977365793111)
,p_name=>'UMC_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_BU'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739431281608793114)
,p_name=>'UMC_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739431442625793115)
,p_name=>'UMC_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739431089533793112)
,p_name=>'UMC_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOPBAL_IP_ADDR'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739431191883793113)
,p_name=>'UMC_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_OS_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7739429655785793097)
,p_name=>'UMC_USER_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_USER_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'From Mail'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(7739429006081793091)
,p_internal_uid=>2257467170538182063
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'    config.reportSettingsArea = false;',
'    config.initActions = function( actions ) {',
'        actions.remove("row-duplicate");',
'        actions.remove("single-row-view"); ',
'        actions.remove("row-refresh"); ',
'        actions.remove("row-revert"); ',
'		actions.remove("row-add-row");',
'    }',
' 	return config;',
'}',
''))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(7739601108811905843)
,p_interactive_grid_id=>wwv_flow_imp.id(7739429006081793091)
,p_static_id=>'6224556'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7739601328312905843)
,p_report_id=>wwv_flow_imp.id(7739601108811905843)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739601823914905849)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7739429146993793092)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739602738271905855)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7739429241684793093)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739603643799905865)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(7739429277487793094)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739604486915905871)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7739429397862793095)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>213
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739605389091905877)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7739429485130793096)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739606594974905883)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7739429655785793097)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>217
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739607484383905891)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7739429750825793098)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739610161874905916)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7739429985066793101)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739610981109905924)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7739430111644793102)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739611899557905930)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7739430189562793103)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739612766994905938)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(7739430277178793104)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739613672219905949)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(7739430378967793105)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739614639731905957)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7739430467571793106)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739615551536905965)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(7739430589586793107)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739616429133905971)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(7739430701863793108)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739617298883905980)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(7739430776079793109)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739618210520905988)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(7739430879592793110)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739619151279906001)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(7739430977365793111)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739619873690906008)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(7739431089533793112)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739620766442906018)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(7739431191883793113)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739621676474906027)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(7739431281608793114)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739622657507906035)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(7739431442625793115)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739623505848906041)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(7739431494699793116)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739624423213906049)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(7739431619919793117)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739625301495906057)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(7739431740685793118)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7744609503944217555)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(7743844154778791187)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>52
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7744610501744217565)
,p_view_id=>wwv_flow_imp.id(7739601328312905843)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(7743844215043791188)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>53
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7552014673456715719)
,p_plug_name=>'<b>Email</b>'
,p_static_id=>'b-email-b'
,p_icon_css_classes=>'fa-envelope'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:t-Region--controlsPosEnd:is-expanded:t-Region--noBorder:t-Region--scrollBody:margin-top-sm:margin-bottom-none:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7552015088485715723)
,p_plug_name=>'<b>General</b>'
,p_static_id=>'b-general-b'
,p_region_name=>'gen'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       PMC_BU,',
'       PMC_HOST,',
'       PMC_PORT,',
'       PMC_ENCRYP_TYPE,',
'       PMC_RPT_GATE_WAY,',
'       PMC_RPT_SERVER,',
'       PMC_SEND_TYPE,',
'       PMC_CRE_BY,',
'       PMC_CRE_IP_ADDR,',
'       PMC_CRE_OS_USER,',
'       PMC_CRE_DATE,',
'       PMC_CRE_EMP_ID,',
'       PMC_UPD_BY,',
'       PMC_UPD_IP_ADDR,',
'       PMC_UPD_OS_USER,',
'       PMC_UPD_DATE,',
'       PMC_UPD_EMP_ID,',
'       PMC_SUITE',
'  from PROD_MAIL_CONFIG',
'  where PMC_BU = :GLOBAL_BU'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'<b>General</b>'
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
 p_id=>wwv_flow_imp.id(5607468372271798336)
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
 p_id=>wwv_flow_imp.id(5607468439751798337)
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
 p_id=>wwv_flow_imp.id(7561040031404715475)
,p_name=>'PMC_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMC_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':global_bu'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561040676075715482)
,p_name=>'PMC_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMC_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561040973154715485)
,p_name=>'PMC_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMC_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'sysdate'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561041131537715486)
,p_name=>'PMC_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMC_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561040797453715483)
,p_name=>'PMC_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMC_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561040888665715484)
,p_name=>'PMC_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMC_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561040314036715478)
,p_name=>'PMC_ENCRYP_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMC_ENCRYP_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Encryption Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:SSL;SSL,TLS;TLS,NOT;NOT'
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561040074984715476)
,p_name=>'PMC_HOST'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMC_HOST'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Host'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561040198544715477)
,p_name=>'PMC_PORT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMC_PORT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Port'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561040418000715479)
,p_name=>'PMC_RPT_GATE_WAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMC_RPT_GATE_WAY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Report Gateway'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>500
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561040562676715480)
,p_name=>'PMC_RPT_SERVER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMC_RPT_SERVER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Report Server'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561040568572715481)
,p_name=>'PMC_SEND_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMC_SEND_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Method'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:HARD;JAR'
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'JAR'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561041713999715492)
,p_name=>'PMC_SUITE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMC_SUITE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Suite'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Gmail;G,Zoho;Z,Outlook;O'
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561041177849715487)
,p_name=>'PMC_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMC_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':global_user'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561041507241715490)
,p_name=>'PMC_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMC_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561041571750715491)
,p_name=>'PMC_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMC_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561041284593715488)
,p_name=>'PMC_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMC_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561041404228715489)
,p_name=>'PMC_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PMC_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561041913114715494)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(7561039922686715474)
,p_internal_uid=>2079078087143104446
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'    config.reportSettingsArea = false;',
'    config.initActions = function( actions ) {',
'        actions.remove("row-duplicate");',
'        actions.remove("single-row-view"); ',
'        actions.remove("row-refresh"); ',
'        actions.remove("row-revert"); ',
'		actions.remove("row-add-row");',
'    }',
' 	return config;',
'}',
''))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(7561045745788716832)
,p_interactive_grid_id=>wwv_flow_imp.id(7561039922686715474)
,p_static_id=>'4439002'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7561045889762716832)
,p_report_id=>wwv_flow_imp.id(7561045745788716832)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5481961906922611073)
,p_view_id=>wwv_flow_imp.id(7561045889762716832)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(5607468439751798337)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5607583359017968485)
,p_view_id=>wwv_flow_imp.id(7561045889762716832)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(5607468372271798336)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561046431338716837)
,p_view_id=>wwv_flow_imp.id(7561045889762716832)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7561040031404715475)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561047326531716849)
,p_view_id=>wwv_flow_imp.id(7561045889762716832)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(7561040074984715476)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>223
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561048226634716858)
,p_view_id=>wwv_flow_imp.id(7561045889762716832)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7561040198544715477)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>63
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561049148295716866)
,p_view_id=>wwv_flow_imp.id(7561045889762716832)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7561040314036715478)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>96
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561049991306716874)
,p_view_id=>wwv_flow_imp.id(7561045889762716832)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(7561040418000715479)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>343
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561050931035716880)
,p_view_id=>wwv_flow_imp.id(7561045889762716832)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7561040562676715480)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>227
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561051784225716888)
,p_view_id=>wwv_flow_imp.id(7561045889762716832)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7561040568572715481)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561052680813716899)
,p_view_id=>wwv_flow_imp.id(7561045889762716832)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7561040676075715482)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561053595714716907)
,p_view_id=>wwv_flow_imp.id(7561045889762716832)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7561040797453715483)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561054467044716915)
,p_view_id=>wwv_flow_imp.id(7561045889762716832)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(7561040888665715484)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561055369557716921)
,p_view_id=>wwv_flow_imp.id(7561045889762716832)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(7561040973154715485)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561056288073716929)
,p_view_id=>wwv_flow_imp.id(7561045889762716832)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7561041131537715486)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561057129451716935)
,p_view_id=>wwv_flow_imp.id(7561045889762716832)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(7561041177849715487)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561058059252716941)
,p_view_id=>wwv_flow_imp.id(7561045889762716832)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(7561041284593715488)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561058876445716949)
,p_view_id=>wwv_flow_imp.id(7561045889762716832)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(7561041404228715489)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561059850638716955)
,p_view_id=>wwv_flow_imp.id(7561045889762716832)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(7561041507241715490)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561060723017716963)
,p_view_id=>wwv_flow_imp.id(7561045889762716832)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(7561041571750715491)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561061629682716971)
,p_view_id=>wwv_flow_imp.id(7561045889762716832)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7561041713999715492)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>77
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561063670883720505)
,p_view_id=>wwv_flow_imp.id(7561045889762716832)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(7561041913114715494)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8339133600370384586)
,p_plug_name=>'<b>Header Details</b>'
,p_static_id=>'b-header-details-b'
,p_region_name=>'ig_line4'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--hiddenOverflow'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>80
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       SAHC_BASE_ID,',
'       SAHC_HEADER_ID,',
'       SAHC_HEADER_NAME,',
'       SAHC_CRE_BY,',
'       SAHC_CRE_DATE,',
'       SAHC_UPD_BY,',
'       SAHC_UPD_DATE,',
'       SAHC_HEADER_REF',
'  from SMS_API_HEADER_CONFIG'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'<b>Header Details</b>'
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
 p_id=>wwv_flow_imp.id(8339136258113384612)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8339136339091384613)
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
 p_id=>wwv_flow_imp.id(8339136875855384618)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8339133868012384588)
,p_name=>'SAHC_BASE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SAHC_BASE_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'URL'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'URL')).to_clob
,p_is_required=>false
,p_max_length=>20
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'SELECT SAUC_BASE_URL D,SAUC_BASE_ID R FROM SMS_API_URL_CONFIG'
,p_lov_display_extra=>false
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8339134122281384591)
,p_name=>'SAHC_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SAHC_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8339134268321384592)
,p_name=>'SAHC_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SAHC_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8339133939347384589)
,p_name=>'SAHC_HEADER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SAHC_HEADER_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8339134046636384590)
,p_name=>'SAHC_HEADER_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SAHC_HEADER_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>' Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>20
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
 p_id=>wwv_flow_imp.id(8339134511286384595)
,p_name=>'SAHC_HEADER_REF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SAHC_HEADER_REF'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Reference'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8339134363030384593)
,p_name=>'SAHC_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SAHC_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8339134446478384594)
,p_name=>'SAHC_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SAHC_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(8339133736700384587)
,p_internal_uid=>2857171901156773559
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>false
,p_no_data_found_message=>'No Data Found.'
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'    config.reportSettingsArea = false;',
'    config.initActions = function( actions ) {',
'        actions.remove("row-duplicate");',
'        actions.remove("single-row-view"); ',
'        actions.remove("row-refresh"); ',
'        actions.remove("row-revert"); ',
'		actions.remove("row-add-row");',
'    }',
' 	return config;',
'}',
''))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(8339181351793399977)
,p_interactive_grid_id=>wwv_flow_imp.id(8339133736700384587)
,p_static_id=>'5953731'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(8339181535990399977)
,p_report_id=>wwv_flow_imp.id(8339181351793399977)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8339181980599399983)
,p_view_id=>wwv_flow_imp.id(8339181535990399977)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(8339133868012384588)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8339182948073399989)
,p_view_id=>wwv_flow_imp.id(8339181535990399977)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(8339133939347384589)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8339183815880399997)
,p_view_id=>wwv_flow_imp.id(8339181535990399977)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(8339134046636384590)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102.64099999999999
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8339184697902400003)
,p_view_id=>wwv_flow_imp.id(8339181535990399977)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(8339134122281384591)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8339185629032400013)
,p_view_id=>wwv_flow_imp.id(8339181535990399977)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(8339134268321384592)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8339186529461400020)
,p_view_id=>wwv_flow_imp.id(8339181535990399977)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(8339134363030384593)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8339187295880400027)
,p_view_id=>wwv_flow_imp.id(8339181535990399977)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(8339134446478384594)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8339188263259400035)
,p_view_id=>wwv_flow_imp.id(8339181535990399977)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(8339134511286384595)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8340000829459045149)
,p_view_id=>wwv_flow_imp.id(8339181535990399977)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(8339136258113384612)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8340001768292045158)
,p_view_id=>wwv_flow_imp.id(8339181535990399977)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(8339136339091384613)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8340018037884050528)
,p_view_id=>wwv_flow_imp.id(8339181535990399977)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(8339136875855384618)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7739752454385000588)
,p_plug_name=>'<b>SMS</b>'
,p_static_id=>'b-sms-b'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:t-Region--controlsPosEnd:is-expanded:t-Region--noBorder:t-Region--hiddenOverflow:margin-top-none:margin-bottom-none:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8340302860558959107)
,p_plug_name=>'<b>Template Details</b>'
,p_static_id=>'b-template-details-b'
,p_region_name=>'template'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--hiddenOverflow'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>90
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       SATC_BASE_ID,',
'       SATC_HEADER_ID,',
'       SATC_TEMPLATE_ID,',
'       SATC_TEMPLATE,',
'       SATC_CRE_BY,',
'       SATC_CRE_DATE,',
'       SATC_UPD_BY,',
'       SATC_UPD_DATE,',
'       SATC_TEMPLATE_CONTENT,',
'       Decode(SATC_STATUS,''N'',''New'',''A'',''Approved'')SATC_STATUS,',
'    CASE WHEN SATC_STATUS IN (''N'') THEN ''link'' ELSE ''nolink'' END TEMP_LINK1,',
'         CASE WHEN SATC_STATUS IN (''N'',''I'') THEN',
'                ''<span class="fa fa fa-paper-plane fa-anim-flash" aria-hidden="true"  style="color:#398321" title="Active"></span>''',
'         ELSE ''<span class="fa fa fa-paper-plane" aria-hidden="true" style="color:#c8f7d094;cursor:no-drop;"></span>'' ',
'       END "Active_btn",',
'       CASE WHEN SATC_STATUS IN (''A'',''I'') THEN ''link'' ELSE ''nolink'' END TEMP_LINK2,',
'         CASE WHEN SATC_STATUS = ''A'' THEN',
'                ''<span class="fa fa fa-paper-plane fa-anim-flash" aria-hidden="true"  style="color:red" title="InActive"></span>''',
'         ELSE ''<span class="fa fa fa-paper-plane" aria-hidden="true" style="color:#e95c5499;cursor:no-drop;"></span>''',
'       END "InActive_btn",',
'         ''<span class="t-Button t-Button--success  t-Button--tiny lto1108671385843807736_0 style="color: #16a6d4b3;text-color: #000;hover-background-color: #9b35aebf;hover-text-color: #fff;">Paramater</span>'' as Parameter  ,',
'         ''<span class="fa fa fa-comments fa-anim-flash" aria-hidden="true"  style="color:#bf7e1f" title="Test SMS"></span>'' as sms',
'    from SMS_API_TEMPLATE_CONFIG'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':SATC_STATUS=''A'''
,p_plug_read_only_when2=>'PLSQL'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'<b>Template Details</b>'
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
 p_id=>wwv_flow_imp.id(8340304801061959126)
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
 p_id=>wwv_flow_imp.id(8340304947222959127)
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
 p_id=>wwv_flow_imp.id(7744992633617341074)
,p_name=>'Active_btn'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Active_btn'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Active'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:send(''TEMP_ACT'',''&ROWID.'');'
,p_link_text=>'&"Active_btn".'
,p_link_attributes=>'CLASS="&TEMP_LINK2."'
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
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7744992760628341075)
,p_name=>'InActive_btn'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'InActive_btn'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Inactive'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:send(''TEMP_INACT'',''&ROWID.'');'
,p_link_text=>'&"InActive_btn".'
,p_link_attributes=>'CLASS="&LINK2."'
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
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7752747829815068889)
,p_name=>'PARAMETER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARAMETER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Parameter'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:19251900502:&SESSION.::&DEBUG.::P19251900502_SATC_TEMPLATE_ID,P19251900502_CONTENT:&SATC_TEMPLATE_ID.,&SATC_TEMPLATE_CONTENT.'
,p_link_text=>'&PARAMETER.'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_static_id=>'parameter'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8340305170459959130)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8340303105915959109)
,p_name=>'SATC_BASE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SATC_BASE_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8340303483439959113)
,p_name=>'SATC_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SATC_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':global_user'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8340303599933959114)
,p_name=>'SATC_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SATC_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'sysdate'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8340303240990959110)
,p_name=>'SATC_HEADER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SATC_HEADER_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Name')).to_clob
,p_is_required=>true
,p_max_length=>10
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(7117304905598688757)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8340304036924959118)
,p_name=>'SATC_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SATC_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Status'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>8
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8340303439878959112)
,p_name=>'SATC_TEMPLATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SATC_TEMPLATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>' Template Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8340303904979959117)
,p_name=>'SATC_TEMPLATE_CONTENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SATC_TEMPLATE_CONTENT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Content'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_imp.id(8340303353700959111)
,p_name=>'SATC_TEMPLATE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SATC_TEMPLATE_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>' Template ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>30
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
 p_id=>wwv_flow_imp.id(8340303757113959115)
,p_name=>'SATC_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SATC_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':global_user'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8340303776270959116)
,p_name=>'SATC_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SATC_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'sysdate'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7752747913015068890)
,p_name=>'SMS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SMS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'SMS'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.::P34_ST_TEMPLATE_ID:&SATC_TEMPLATE_ID.'
,p_link_text=>'&SMS.'
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
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8681768302097238890)
,p_name=>'TEMP_LINK1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TEMP_LINK1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8681768392703238891)
,p_name=>'TEMP_LINK2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TEMP_LINK2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(8340303011620959108)
,p_internal_uid=>2858341176077348080
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>false
,p_no_data_found_message=>'No Data Found.'
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'    config.reportSettingsArea = false;',
'    config.initActions = function( actions ) {',
'        actions.remove("row-duplicate");',
'        actions.remove("single-row-view");',
'        actions.remove("row-add-row"); ',
'        actions.remove("row-refresh");',
'        actions.remove("row-revert");',
'    }',
' 	return config;',
'}'))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(8340455722659072247)
,p_interactive_grid_id=>wwv_flow_imp.id(8340303011620959108)
,p_static_id=>'5954792'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(8340455927393072247)
,p_report_id=>wwv_flow_imp.id(8340455722659072247)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7744999060247341562)
,p_view_id=>wwv_flow_imp.id(8340455927393072247)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(7744992633617341074)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>57
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7744999888501341588)
,p_view_id=>wwv_flow_imp.id(8340455927393072247)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(7744992760628341075)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>65
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7756221524550655857)
,p_view_id=>wwv_flow_imp.id(8340455927393072247)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(7752747829815068889)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90.2969
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7756623211035349243)
,p_view_id=>wwv_flow_imp.id(8340455927393072247)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(7752747913015068890)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8340456415905072252)
,p_view_id=>wwv_flow_imp.id(8340455927393072247)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(8340303105915959109)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8340457284385072261)
,p_view_id=>wwv_flow_imp.id(8340455927393072247)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(8340303240990959110)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>125.6875
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8340458190174072269)
,p_view_id=>wwv_flow_imp.id(8340455927393072247)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(8340303353700959111)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>179.6875
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8340459086533072278)
,p_view_id=>wwv_flow_imp.id(8340455927393072247)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(8340303439878959112)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>143.469
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8340460036347072286)
,p_view_id=>wwv_flow_imp.id(8340455927393072247)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(8340303483439959113)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8340460942702072296)
,p_view_id=>wwv_flow_imp.id(8340455927393072247)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(8340303599933959114)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8340461759069072303)
,p_view_id=>wwv_flow_imp.id(8340455927393072247)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(8340303757113959115)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8340462744288072310)
,p_view_id=>wwv_flow_imp.id(8340455927393072247)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(8340303776270959116)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8340463647213072317)
,p_view_id=>wwv_flow_imp.id(8340455927393072247)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(8340303904979959117)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>265.844
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8340464496190072324)
,p_view_id=>wwv_flow_imp.id(8340455927393072247)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(8340304036924959118)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>99.8438
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8341170868251619677)
,p_view_id=>wwv_flow_imp.id(8340455927393072247)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(8340304801061959126)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8341171846776619686)
,p_view_id=>wwv_flow_imp.id(8340455927393072247)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(8340304947222959127)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8341187220001625047)
,p_view_id=>wwv_flow_imp.id(8340455927393072247)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(8340305170459959130)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8684501441672664301)
,p_view_id=>wwv_flow_imp.id(8340455927393072247)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(8681768302097238890)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8684502215916664315)
,p_view_id=>wwv_flow_imp.id(8340455927393072247)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(8681768392703238891)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8634713121951865622)
,p_plug_name=>'<b>Templates</b>'
,p_static_id=>'b-templates-b'
,p_region_name=>'ig_temp_app'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--showIcon:t-Region--noUI:t-Region--hiddenOverflow'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>120
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WAT_BU,',
'       WAT_TEMPLATE_ID,',
'       WAT_TEMPLATE_DESC,',
'       WAT_HEADER_MSG,',
'       WAT_TEMPLATE_MSG,',
'       WAT_FOOTER_MSG,',
'       WAT_BUTTON_FLAG,',
'       WAT_BUTTON_TEXT,',
'       WAT_CRE_BY,',
'       WAT_CRE_DATE,',
'       WAT_CRE_EMP_ID,',
'       WAT_CRE_IP_ADDR,',
'       WAT_CRE_OS_USER,',
'       WAT_UPD_BY,',
'       WAT_UPD_DATE,',
'       WAT_UPD_EMP_ID,',
'       WAT_UPD_IP_ADDR,',
'       WAT_UPD_OS_USER,',
'       WAT_STATUS,',
'       WAT_NO_OF_VAR,',
'       WAT_HEADER_FLAG,',
'       CASE WHEN WAT_STATUS IN (''N'') THEN ''link'' ELSE ''nolink'' END WHAT_TEMP_LINK',
'  from WHATSAPP_API_TEMPLATES',
' where WAT_BU = :GLOBAL_bu'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'<b>Templates</b>'
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
,p_plug_footer=>'<b>*Note :</b> Denote"{{n}}" for variables, Ex.{{1}}'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8637150130388256092)
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
 p_id=>wwv_flow_imp.id(8637150214350256093)
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
 p_id=>wwv_flow_imp.id(8637150455106256095)
,p_name=>'Activate_Template'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
,p_value_alignment=>'CENTER'
,p_stretch=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'html_expression', '<span aria-hidden="true" class="fa fa-send-o" style="color: green ;font-size : 12px ;font-weight: bold" title="Activate Template"></span>')).to_clob
,p_link_target=>'javascript:send(''WHAT_TEMP'',''&ROWID.'');'
,p_link_attributes=>'CLASS="&WHAT_TEMP_LINK."'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636754728444669222)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636752656522669201)
,p_name=>'WAT_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAT_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wat Bu'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636753185253669207)
,p_name=>'WAT_BUTTON_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAT_BUTTON_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wat Button Flag'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636753263583669208)
,p_name=>'WAT_BUTTON_TEXT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAT_BUTTON_TEXT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wat Button Text'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>200
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
 p_id=>wwv_flow_imp.id(8636753373006669209)
,p_name=>'WAT_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAT_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wat Cre By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636753520828669210)
,p_name=>'WAT_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAT_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Wat Cre Date'
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
 p_id=>wwv_flow_imp.id(8636753601588669211)
,p_name=>'WAT_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAT_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wat Cre Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636753733686669212)
,p_name=>'WAT_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAT_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wat Cre Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>20
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
 p_id=>wwv_flow_imp.id(8636753821028669213)
,p_name=>'WAT_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAT_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wat Cre Os User'
,p_heading_alignment=>'LEFT'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636753102608669206)
,p_name=>'WAT_FOOTER_MSG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAT_FOOTER_MSG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Footer'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_imp.id(8636754655975669221)
,p_name=>'WAT_HEADER_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAT_HEADER_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Header'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Document;D,Text;T'
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'D'
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636752906800669204)
,p_name=>'WAT_HEADER_MSG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAT_HEADER_MSG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Header Text'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1000
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
 p_id=>wwv_flow_imp.id(8636754514267669220)
,p_name=>'WAT_NO_OF_VAR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAT_NO_OF_VAR'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No. of Variables'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636754434948669219)
,p_name=>'WAT_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAT_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Status'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Active;A,New;N'
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'ALWAYS'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636752784768669203)
,p_name=>'WAT_TEMPLATE_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAT_TEMPLATE_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Template'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636752698587669202)
,p_name=>'WAT_TEMPLATE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAT_TEMPLATE_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Wat Template Id'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636752977676669205)
,p_name=>'WAT_TEMPLATE_MSG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAT_TEMPLATE_MSG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Body'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(8636753919951669214)
,p_name=>'WAT_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAT_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wat Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636753974333669215)
,p_name=>'WAT_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAT_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Wat Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
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
 p_id=>wwv_flow_imp.id(8636754103882669216)
,p_name=>'WAT_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAT_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wat Upd Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636754180871669217)
,p_name=>'WAT_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAT_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wat Upd Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>20
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
 p_id=>wwv_flow_imp.id(8636754280015669218)
,p_name=>'WAT_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAT_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wat Upd Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
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
 p_id=>wwv_flow_imp.id(8681770951652238916)
,p_name=>'WHAT_TEMP_LINK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WHAT_TEMP_LINK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(8636752545594669200)
,p_internal_uid=>3154790710051058172
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
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
 p_id=>wwv_flow_imp.id(8636927906669982476)
,p_interactive_grid_id=>wwv_flow_imp.id(8636752545594669200)
,p_static_id=>'15197824'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(8636928158666982476)
,p_report_id=>wwv_flow_imp.id(8636927906669982476)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5481961940705611033)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(8637150214350256093)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636928601073982483)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(8636752656522669201)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636929463077982491)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(8636752698587669202)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636930364949982501)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(8636752784768669203)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636931339896982507)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(8636752906800669204)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>135
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636932067847982515)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(8636752977676669205)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>83
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636932996845982521)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(8636753102608669206)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636933948265982529)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(8636753185253669207)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636934812485982537)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(8636753263583669208)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636935691188982544)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(8636753373006669209)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636936608649982551)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(8636753520828669210)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636937562450982558)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(8636753601588669211)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636938372646982565)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(8636753733686669212)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636939268815982571)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(8636753821028669213)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636940163649982579)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(8636753919951669214)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636941118759982585)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(8636753974333669215)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636941995262982593)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(8636754103882669216)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636942952006982599)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(8636754180871669217)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636943793685982605)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(8636754280015669218)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636944618340982615)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(8636754434948669219)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636945472238982621)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(8636754514267669220)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636946418670982627)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(8636754655975669221)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636947273864982635)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(8636754728444669222)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8637477947173008513)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(8637150130388256092)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8637503312634036341)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(8637150455106256095)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8684883985202146860)
,p_view_id=>wwv_flow_imp.id(8636928158666982476)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(8681770951652238916)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7739754116312000605)
,p_plug_name=>'<b>URL Details</b>'
,p_static_id=>'b-url-details-b'
,p_region_name=>'ig_line2'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--hiddenOverflow'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       SAUC_BASE_ID,',
'       SAUC_BASE_URL,',
'       SAUC_USERNAME,',
'       SAUC_PASSWORD,',
'       SAUC_SENDER_ID,',
'       SAUC_ENTITY_ID,',
'       SAUC_CRE_BY,',
'       SAUC_CRE_DATE,',
'       SAUC_UPD_BY,',
'       SAUC_UPD_DATE',
'  from SMS_API_URL_CONFIG'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'<b>URL Details</b>'
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
 p_id=>wwv_flow_imp.id(7741755607415064303)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7741755711582064304)
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
 p_id=>wwv_flow_imp.id(7741754496826064292)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7741754655586064293)
,p_name=>'SAUC_BASE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SAUC_BASE_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7741754663098064294)
,p_name=>'SAUC_BASE_URL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SAUC_BASE_URL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'URL'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'LOWER',
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7741755235217064299)
,p_name=>'SAUC_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SAUC_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7741755315766064300)
,p_name=>'SAUC_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SAUC_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7741755136508064298)
,p_name=>'SAUC_ENTITY_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SAUC_ENTITY_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Entity ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
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
 p_id=>wwv_flow_imp.id(7741754958655064296)
,p_name=>'SAUC_PASSWORD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SAUC_PASSWORD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_PASSWORD'
,p_heading=>'Password'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
,p_is_required=>true
,p_max_length=>100
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7741755039881064297)
,p_name=>'SAUC_SENDER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SAUC_SENDER_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sender ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>10
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
 p_id=>wwv_flow_imp.id(7741755420796064301)
,p_name=>'SAUC_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SAUC_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7741755463642064302)
,p_name=>'SAUC_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SAUC_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7741754838746064295)
,p_name=>'SAUC_USERNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SAUC_USERNAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Username'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(7741754421114064291)
,p_internal_uid=>2259792585570453263
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>false
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'    config.reportSettingsArea = false;',
'    config.initActions = function( actions ) {',
'        actions.remove("row-duplicate");',
'        actions.remove("single-row-view"); ',
'        actions.remove("row-refresh"); ',
'        actions.remove("row-revert"); ',
'		actions.remove("row-add-row");',
'    }',
' 	return config;',
'}',
''))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(7742113982135196955)
,p_interactive_grid_id=>wwv_flow_imp.id(7741754421114064291)
,p_static_id=>'6249685'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7742114172744196955)
,p_report_id=>wwv_flow_imp.id(7742113982135196955)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7117145657322688281)
,p_view_id=>wwv_flow_imp.id(7742114172744196955)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7741755711582064304)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7117145793096688301)
,p_view_id=>wwv_flow_imp.id(7742114172744196955)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7741755711582064304)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7742114732006196962)
,p_view_id=>wwv_flow_imp.id(7742114172744196955)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7741754496826064292)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7742115569854196971)
,p_view_id=>wwv_flow_imp.id(7742114172744196955)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(7741754655586064293)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7742116471803196977)
,p_view_id=>wwv_flow_imp.id(7742114172744196955)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(7741754663098064294)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>302.797
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7742117416650196985)
,p_view_id=>wwv_flow_imp.id(7742114172744196955)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7741754838746064295)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>214.797
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7742118358004196993)
,p_view_id=>wwv_flow_imp.id(7742114172744196955)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7741754958655064296)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7742119152184196999)
,p_view_id=>wwv_flow_imp.id(7742114172744196955)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7741755039881064297)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>99.797
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7742120059262197007)
,p_view_id=>wwv_flow_imp.id(7742114172744196955)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7741755136508064298)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7742120910810197015)
,p_view_id=>wwv_flow_imp.id(7742114172744196955)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7741755235217064299)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7742121862451197021)
,p_view_id=>wwv_flow_imp.id(7742114172744196955)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7741755315766064300)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7742122755253197029)
,p_view_id=>wwv_flow_imp.id(7742114172744196955)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(7741755420796064301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7742123650597197035)
,p_view_id=>wwv_flow_imp.id(7742114172744196955)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(7741755463642064302)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7742124525299197044)
,p_view_id=>wwv_flow_imp.id(7742114172744196955)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7741755607415064303)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7561042052338715495)
,p_plug_name=>'<b>User Config</b>'
,p_static_id=>'b-user-config-b'
,p_region_name=>'ig_line'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI:t-Region--hiddenOverflow'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       UMC_BU,',
'       UMC_BENF_TYPE,',
'       UMC_BENF_ID,',
'       UMC_EMP_ID,',
'       UMC_BENF_ID||UMC_EMP_ID BENF_ID, ',
'       UMC_EMAIL_ID,',
'       (SELECT func_find_employee_desc(UMC_BU,appluser_emp_id,1)Employee_name',
' 			 FROM appl_users',
'            WHERE appluser_bu = UMC_BU',
'            AND appluser_id = UMC_BENF_ID',
'            AND appluser_emp_id = UMC_EMP_ID )Employee_name,',
'       (SELECT appluser_id',
' 		  FROM appl_users',
'         WHERE appluser_bu = :GLOBAL_bu ',
'           AND appluser_id = UMC_BENF_ID',
'           AND appluser_emp_id = UMC_EMP_ID) user_BENF_ID,',
'       UMC_USER_NAME,',
'       UMC_PASSWORD,',
'       UMC_EFF_FROM,',
'       UMC_EFF_TO,',
'       UMC_STATUS,',
'       UMC_CRE_BY,',
'       UMC_CRE_IP_ADDR,',
'       UMC_CRE_OS_USER,',
'       UMC_CRE_DATE,',
'       UMC_CRE_EMP_ID,',
'       UMC_UPD_BY,',
'       UMC_UPD_IP_ADDR,',
'       UMC_UPD_OS_USER,',
'       UMC_UPD_DATE,',
'       UMC_UPD_EMP_ID,',
'       UMC_SUITE,',
'       CASE WHEN UMC_STATUS IN (''N'',''I'') THEN ''link'' ELSE ''nolink'' END LINK1,',
'         CASE WHEN UMC_STATUS IN(''N'',''I'') THEN',
'                ''<span class="fa fa fa-paper-plane fa-anim-flash" aria-hidden="true"  style="color:#398321" title="Active"></span>''',
'         ELSE ''<span class="fa fa fa-paper-plane" aria-hidden="true" style="color:#c8f7d094;cursor:no-drop;"></span>'' ',
'       END "Active_btn",',
'       CASE WHEN UMC_STATUS IN (''A'') THEN ''link'' ELSE ''nolink'' END LINK2,',
'         CASE WHEN UMC_STATUS = ''A'' THEN',
'                ''<span class="fa fa fa-paper-plane fa-anim-flash" aria-hidden="true"  style="color:red" title="InActive"></span>''',
'         ELSE ''<span class="fa fa fa-paper-plane" aria-hidden="true" style="color:#e95c5499;cursor:no-drop;"></span>'' ',
'       END "InActive_btn"',
'  from USER_MAIL_CONFIG',
'  where UMC_BU=:global_bu',
'  AND UMC_BENF_TYPE = ''U'''))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'<b>User Config</b>'
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
 p_id=>wwv_flow_imp.id(7562726796823664976)
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
 p_id=>wwv_flow_imp.id(7562726922425664977)
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
 p_id=>wwv_flow_imp.id(7743843919615791185)
,p_name=>'Active_btn'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Active_btn'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Active'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:send(''USER_ACT'',''&ROWID.'');'
,p_link_text=>'&"Active_btn".'
,p_link_attributes=>'CLASS="&LINK1."'
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
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5593126446430045130)
,p_name=>'BENF_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BENF_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'User'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '1000')).to_clob
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(5679815972353075042)
,p_lov_display_extra=>false
,p_lov_display_null=>true
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
,p_default_type=>'SQL_QUERY'
,p_default_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT appluser_emp_id',
'  FROM appl_users',
' WHERE appluser_bu = :GLOBAL_bu ',
'   AND appluser_id = :umc_benf_id'))
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7728343399143408508)
,p_name=>'EMPLOYEE_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMPLOYEE_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Employee Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7743844047382791186)
,p_name=>'InActive_btn'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'InActive_btn'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Inactive'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>290
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:send(''USER_INACT'',''&ROWID.'');'
,p_link_text=>'&"InActive_btn".'
,p_link_attributes=>'CLASS="&LINK2."'
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
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7562728238455664990)
,p_name=>'LINK1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LINK1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7562731393627665022)
,p_name=>'LINK2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LINK2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561044311678715518)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561042457338715499)
,p_name=>'UMC_BENF_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_BENF_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561042279324715498)
,p_name=>'UMC_BENF_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_BENF_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561042255750715497)
,p_name=>'UMC_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_BU'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561043133463715506)
,p_name=>'UMC_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561043429118715509)
,p_name=>'UMC_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561043549118715510)
,p_name=>'UMC_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561043232423715507)
,p_name=>'UMC_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_IP_ADDR'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561043318568715508)
,p_name=>'UMC_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_OS_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561042856967715503)
,p_name=>'UMC_EFF_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_EFF_FROM'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561042962178715504)
,p_name=>'UMC_EFF_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_EFF_TO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561042465048715500)
,p_name=>'UMC_EMAIL_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_EMAIL_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5593126767383045133)
,p_name=>'UMC_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>300
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561042751829715502)
,p_name=>'UMC_PASSWORD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_PASSWORD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_PASSWORD'
,p_heading=>'Password'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
,p_is_required=>true
,p_max_length=>500
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561043010332715505)
,p_name=>'UMC_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Status'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>true
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:New;N,Active;A,Inactive;I'
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561044143269715516)
,p_name=>'UMC_SUITE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_SUITE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Suite'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Gmail;G,Zoho;Z,Outlook;O'
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561043595254715511)
,p_name=>'UMC_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_BU'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561043881044715514)
,p_name=>'UMC_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561044015124715515)
,p_name=>'UMC_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561043712543715512)
,p_name=>'UMC_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOPBAL_IP_ADDR'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561043804772715513)
,p_name=>'UMC_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_OS_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7561042644755715501)
,p_name=>'UMC_USER_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UMC_USER_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'From Mail'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(7561042080148715496)
,p_internal_uid=>2079080244605104468
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
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
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'    config.reportSettingsArea = false;',
'    config.initActions = function( actions ) {',
'        actions.remove("row-duplicate");',
'        actions.remove("single-row-view"); ',
'        actions.remove("row-refresh"); ',
'        actions.remove("row-revert"); ',
'		actions.remove("row-add-row");',
'    }',
' 	return config;',
'}',
''))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(7561237149938816255)
,p_interactive_grid_id=>wwv_flow_imp.id(7561042080148715496)
,p_static_id=>'4440916'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(7561237325461816255)
,p_report_id=>wwv_flow_imp.id(7561237149938816255)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5679775102354048846)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(5593126446430045130)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>195.301
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5680728186823551659)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(5593126767383045133)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7117145635170688284)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(7562726922425664977)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7117709386347141842)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(7562731393627665022)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561237853036816260)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(7561042255750715497)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561238687220816268)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(7561042279324715498)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561239609698816274)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(7561042457338715499)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>141
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561240470476816282)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(7561042465048715500)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561241414039816288)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(7561042644755715501)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>186
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561242349892816296)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(7561042751829715502)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>151
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561243176833816304)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(7561042856967715503)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561244112148816316)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7561042962178715504)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561244984480816323)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(7561043010332715505)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561245938691816330)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(7561043133463715506)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561246726024816337)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(7561043232423715507)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561247566186816344)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(7561043318568715508)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561248508495816355)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(7561043429118715509)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561249453050816363)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(7561043549118715510)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561250282439816371)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(7561043595254715511)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561251229868816377)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(7561043712543715512)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561252066012816388)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(7561043804772715513)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561253036255816398)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(7561043881044715514)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561253912623816405)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(7561044015124715515)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561254823678816412)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(7561044143269715516)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>94
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7561255718900816419)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(7561044311678715518)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7566653150442994313)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(7562726796823664976)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>42
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7568880613444000843)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(7562728238455664990)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7739307929083772804)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(7728343399143408508)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>161
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7744179247827157033)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(7743843919615791185)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>82
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7744240687660184388)
,p_view_id=>wwv_flow_imp.id(7561237325461816255)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(7743844047382791186)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>94.75399999999999
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8634713032866865621)
,p_plug_name=>'<b>User List</b>'
,p_static_id=>'b-user-list-b'
,p_region_name=>'ig_user_list'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:t-Region--controlsPosEnd:is-expanded:t-Region--noUI:t-Region--hiddenOverflow'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>110
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'WHATSAPP_API_USER_LIST'
,p_query_where=>'WAUL_BU = :GLOBAL_bu'
,p_query_order_by_type=>'STATIC'
,p_query_order_by=>'WAUL_USERID'
,p_include_rowid_column=>true
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'<b>User List</b>'
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
 p_id=>wwv_flow_imp.id(8637148345038256074)
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
 p_id=>wwv_flow_imp.id(8637148435304256075)
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
 p_id=>wwv_flow_imp.id(8636749864690669174)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636752306604669198)
,p_name=>'Subscribe_User'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
,p_value_alignment=>'CENTER'
,p_stretch=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'html_expression', '<span aria-hidden="true" class="fa fa-users" style="color: green ;font-size : 12px ;font-weight: bold" title="Subscribe User"></span>')).to_clob
,p_link_target=>'javascript:send(''SUBSCRIBE'',''&WAUL_USERID.'');'
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8637149417859256085)
,p_name=>'USER_DELETE'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Action'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
,p_value_alignment=>'CENTER'
,p_stretch=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'html_expression', '<span aria-hidden="true" class="fa fa-trash-o" style="color: red ;font-size : 12px ;font-weight: bold"></span>')).to_clob
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636750688484669182)
,p_name=>'WAUL_ACT_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_ACT_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Status'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_stretch=>'N'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Subscribed;A,New;N'
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636750295495669178)
,p_name=>'WAUL_BENF_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_BENF_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Beneficiary ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_stretch=>'N'
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
 p_id=>wwv_flow_imp.id(8636750415992669179)
,p_name=>'WAUL_BENF_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_BENF_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_stretch=>'N'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636750178607669177)
,p_name=>'WAUL_BENF_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_BENF_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_stretch=>'N'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Employee;E,Supplier;S,Customer;C'
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'E'
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636749976409669175)
,p_name=>'WAUL_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Waul Bu'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636750490877669180)
,p_name=>'WAUL_COUNTRY_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_COUNTRY_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Country Code'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_stretch=>'N'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636750992518669185)
,p_name=>'WAUL_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Waul Cre By'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636751072325669186)
,p_name=>'WAUL_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Waul Cre Date'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636751226680669187)
,p_name=>'WAUL_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Waul Cre Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>180
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636751342723669188)
,p_name=>'WAUL_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Waul Cre Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>20
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
 p_id=>wwv_flow_imp.id(8636751449577669189)
,p_name=>'WAUL_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Waul Cre Os User'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636752000598669195)
,p_name=>'WAUL_DOB'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_DOB'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'DOB'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_stretch=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
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
 p_id=>wwv_flow_imp.id(8636752102255669196)
,p_name=>'WAUL_EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_EMAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Email'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_stretch=>'N'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636750957116669184)
,p_name=>'WAUL_RESPONSE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_RESPONSE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Waul Response'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
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
 p_id=>wwv_flow_imp.id(8636750854361669183)
,p_name=>'WAUL_RQST_JSON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_RQST_JSON'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Waul Rqst Json'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
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
 p_id=>wwv_flow_imp.id(8636751470056669190)
,p_name=>'WAUL_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Waul Upd By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
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
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636751640597669191)
,p_name=>'WAUL_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Waul Upd Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
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
 p_id=>wwv_flow_imp.id(8636751674183669192)
,p_name=>'WAUL_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Waul Upd Emp Id'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8636751792954669193)
,p_name=>'WAUL_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Waul Upd Ip Addr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>20
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
 p_id=>wwv_flow_imp.id(8636751865593669194)
,p_name=>'WAUL_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Waul Upd Os User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>250
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
 p_id=>wwv_flow_imp.id(8636750070290669176)
,p_name=>'WAUL_USERID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_USERID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'User'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_stretch=>'N'
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
 p_id=>wwv_flow_imp.id(8636750638839669181)
,p_name=>'WAUL_WA_MOB_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAUL_WA_MOB_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Mobile No.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_stretch=>'N'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(8636590860172474723)
,p_internal_uid=>3154629024628863695
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
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
 p_id=>wwv_flow_imp.id(8636756626430672135)
,p_interactive_grid_id=>wwv_flow_imp.id(8636590860172474723)
,p_static_id=>'15196111'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(8636756840825672135)
,p_report_id=>wwv_flow_imp.id(8636756626430672135)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7117394065631028531)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(8637148345038256074)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7117590360434292286)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(8637149417859256085)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7117632581391307950)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(8637148435304256075)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636757360509672140)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(8636749864690669174)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636758202492672148)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(8636749976409669175)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636759076599672154)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(8636750070290669176)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>155
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636760054974672162)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(8636750178607669177)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636760872597672171)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(8636750295495669178)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636761781780672180)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(8636750415992669179)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>173
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636762756563672187)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(8636750490877669180)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>111
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636763601189672194)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(8636750638839669181)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>137
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636764532665672201)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(8636750688484669182)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636765370313672210)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(8636750854361669183)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636766203458672219)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(8636750957116669184)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636767147005672230)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(8636750992518669185)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636768014497672241)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(8636751072325669186)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636768923686672252)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(8636751226680669187)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636769771905672260)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(8636751342723669188)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636771175015672268)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(8636751449577669189)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636772069243672279)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(8636751470056669190)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636773037103672287)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(8636751640597669191)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636773956061672296)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(8636751674183669192)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636774861337672304)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(8636751792954669193)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636775666873672312)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(8636751865593669194)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636776556224672321)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(8636752000598669195)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636777378505672327)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(8636752102255669196)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8636821949711848816)
,p_view_id=>wwv_flow_imp.id(8636756840825672135)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(8636752306604669198)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8634712516521865616)
,p_plug_name=>'<b>WhatsApp</b>'
,p_static_id=>'b-whatsapp-b'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:t-Region--controlsPosEnd:is-expanded:t-Region--noBorder:t-Region--hiddenOverflow:margin-top-none:margin-bottom-none:margin-left-sm:margin-right-sm'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8143408716746427158)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>130
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       PMC_BU,',
'       PMC_HOST,',
'       PMC_PORT,',
'       PMC_ENCRYP_TYPE,',
'       PMC_RPT_GATE_WAY,',
'       PMC_RPT_SERVER,',
'       PMC_SEND_TYPE,',
'       PMC_CRE_BY,',
'       PMC_CRE_IP_ADDR,',
'       PMC_CRE_OS_USER,',
'       PMC_CRE_DATE,',
'       PMC_CRE_EMP_ID,',
'       PMC_UPD_BY,',
'       PMC_UPD_IP_ADDR,',
'       PMC_UPD_OS_USER,',
'       PMC_UPD_DATE,',
'       PMC_UPD_EMP_ID,',
'       PMC_SUITE',
'  from PROD_MAIL_CONFIG',
' where PMC_BU = :GLOBAL_BU'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'NEVER'
,p_prn_content_disposition=>'ATTACHMENT'
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
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(8143408758282427159)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>2661446922738816131
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8143408905115427160)
,p_db_column_name=>'PMC_BU'
,p_display_order=>10
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Pmc Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8143409613107427167)
,p_db_column_name=>'PMC_CRE_BY'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Pmc Cre By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8143409880421427170)
,p_db_column_name=>'PMC_CRE_DATE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Pmc Cre Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8143409953615427171)
,p_db_column_name=>'PMC_CRE_EMP_ID'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Pmc Cre Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8143409647777427168)
,p_db_column_name=>'PMC_CRE_IP_ADDR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Pmc Cre Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8143409794427427169)
,p_db_column_name=>'PMC_CRE_OS_USER'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Pmc Cre Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8143409203065427163)
,p_db_column_name=>'PMC_ENCRYP_TYPE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Pmc Encryp Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8143409019315427161)
,p_db_column_name=>'PMC_HOST'
,p_display_order=>20
,p_is_primary_key=>'Y'
,p_column_identifier=>'B'
,p_column_label=>'Pmc Host'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8143409124414427162)
,p_db_column_name=>'PMC_PORT'
,p_display_order=>30
,p_is_primary_key=>'Y'
,p_column_identifier=>'C'
,p_column_label=>'Pmc Port'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8143409296449427164)
,p_db_column_name=>'PMC_RPT_GATE_WAY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Pmc Rpt Gate Way'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8143409434492427165)
,p_db_column_name=>'PMC_RPT_SERVER'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Pmc Rpt Server'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8143409530865427166)
,p_db_column_name=>'PMC_SEND_TYPE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Pmc Send Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8143410567104427177)
,p_db_column_name=>'PMC_SUITE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Pmc Suite'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8143410045938427172)
,p_db_column_name=>'PMC_UPD_BY'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Pmc Upd By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8143410420894427175)
,p_db_column_name=>'PMC_UPD_DATE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Pmc Upd Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8143410506860427176)
,p_db_column_name=>'PMC_UPD_EMP_ID'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Pmc Upd Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8143410171917427173)
,p_db_column_name=>'PMC_UPD_IP_ADDR'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Pmc Upd Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8143410270406427174)
,p_db_column_name=>'PMC_UPD_OS_USER'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Pmc Upd Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8143410716151427178)
,p_db_column_name=>'ROWID'
,p_display_order=>190
,p_column_identifier=>'S'
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
,p_heading_alignment=>'LEFT'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5757103506858950953)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2751417'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PMC_BU:PMC_HOST:PMC_PORT:PMC_ENCRYP_TYPE:PMC_RPT_GATE_WAY:PMC_RPT_SERVER:PMC_SEND_TYPE:PMC_CRE_BY:PMC_CRE_IP_ADDR:PMC_CRE_OS_USER:PMC_CRE_DATE:PMC_CRE_EMP_ID:PMC_UPD_BY:PMC_UPD_IP_ADDR:PMC_UPD_OS_USER:PMC_UPD_DATE:PMC_UPD_EMP_ID:PMC_SUITE:ROWID'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117203140742688548)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7561042052338715495)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117161884263688412)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7739428874024793090)
,p_button_name=>'Add_dept'
,p_static_id=>'add-dept'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5607467729706798329)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7552015088485715723)
,p_button_name=>'Add_GN'
,p_static_id=>'add-gn'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117179428879688487)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8339133600370384586)
,p_button_name=>'Add_header'
,p_static_id=>'add-header'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>' fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117188071552688513)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7739754116312000605)
,p_button_name=>'Add_url'
,p_static_id=>'add-url'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117226499914688603)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8634712944636865620)
,p_button_name=>'Conf_add'
,p_static_id=>'conf-add'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>' fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117226855984688603)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8634712944636865620)
,p_button_name=>'Conf_save'
,p_static_id=>'conf-save'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'  fa-check '
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117147635684688282)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8634712516521865616)
,p_button_name=>'Configuration'
,p_static_id=>'configuration'
,p_button_static_id=>'conf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Configuration'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117204011410688549)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7561042052338715495)
,p_button_name=>'Download'
,p_static_id=>'download'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_button_css_classes=>'printbtn'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117162689353688415)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(7739428874024793090)
,p_button_name=>'Download_dept'
,p_static_id=>'download-dept'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Downlaod'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'printbtn'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117180139886688490)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(8339133600370384586)
,p_button_name=>'Download_header'
,p_static_id=>'download-header'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'printbtn'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117188878627688515)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7739754116312000605)
,p_button_name=>'Download_url'
,p_static_id=>'download-url'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'printbtn'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117149283172688287)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7552014673456715719)
,p_button_name=>'General'
,p_static_id=>'general'
,p_button_static_id=>'general'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'General'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-gear'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117146181143688281)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7739752454385000588)
,p_button_name=>'HeaderDetails'
,p_static_id=>'headerdetails'
,p_button_static_id=>'header'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Header Details'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-envelope-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117203587638688548)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7561042052338715495)
,p_button_name=>'Save'
,p_static_id=>'save'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'New'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117162243830688413)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7739428874024793090)
,p_button_name=>'Save_dept'
,p_static_id=>'save-dept'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5607468677464798339)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7552015088485715723)
,p_button_name=>'Save_GN'
,p_static_id=>'save-gn'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117179744390688488)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(8339133600370384586)
,p_button_name=>'Save_header'
,p_static_id=>'save-header'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'  fa-check '
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117188457997688513)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7739754116312000605)
,p_button_name=>'Save_url'
,p_static_id=>'save-url'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117252581827688660)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8634713121951865622)
,p_button_name=>'Temp_add'
,p_static_id=>'temp-add'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>' fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117253009912688660)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8634713121951865622)
,p_button_name=>'Temp_save'
,p_static_id=>'temp-save'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'  fa-check '
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117146568321688281)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7739752454385000588)
,p_button_name=>'TemplateDetails'
,p_static_id=>'templatedetails'
,p_button_static_id=>'temp'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Template Details'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-dynamic-content'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117148499202688284)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(8634712516521865616)
,p_button_name=>'Templates'
,p_static_id=>'templates'
,p_button_static_id=>'temp1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Templates'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117146890139688282)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7739752454385000588)
,p_button_name=>'URLDetails'
,p_static_id=>'urldetails'
,p_button_static_id=>'url'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'URL Details'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-globe'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117239603072688624)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8634713032866865621)
,p_button_name=>'User_add'
,p_static_id=>'user-add'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>' fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117148082307688284)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8634712516521865616)
,p_button_name=>'User_List'
,p_static_id=>'user-list'
,p_button_static_id=>'user1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--padLeft:t-Button--padRight:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'User List'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117240006870688624)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8634713032866865621)
,p_button_name=>'User_save'
,p_static_id=>'user-save'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'  fa-check '
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7117149728172688287)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7552014673456715719)
,p_button_name=>'UserConfig'
,p_static_id=>'userconfig'
,p_button_static_id=>'user'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft:t-Button--padTop:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'User Config .'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-user-circle'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7117303420225688753)
,p_branch_name=>'Go To Page 1925190015'
,p_branch_action=>'f?p=&APP_ID.:1925190015:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'Active'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7117303835235688754)
,p_branch_name=>'Go To Page 1925190015'
,p_branch_action=>'f?p=&APP_ID.:1925190015:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'InActive'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7117304232264688754)
,p_branch_name=>'Go To Page 1925190015'
,p_branch_action=>'f?p=&APP_ID.:1925190015:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'Active1'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7117304574429688757)
,p_branch_name=>'Go To Page 1925190015'
,p_branch_action=>'f?p=&APP_ID.:1925190015:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>40
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'InActive2'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5630212683563602348)
,p_name=>'P1925190015_BASE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7739754116312000605)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7739449784601793265)
,p_name=>'P1925190015_DEPT_ROWID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7739428874024793090)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5630212863494602350)
,p_name=>'P1925190015_DUMMY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8634713121951865622)
,p_item_default=>'0'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8323922374979804722)
,p_name=>'P1925190015_TEMPLATE_ROWID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8340302860558959107)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7569563431241508452)
,p_name=>'P1925190015_UMC_ROWID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7561042052338715495)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8637258398026256484)
,p_name=>'P1925190015_WAT_TEMPLATE_DESC'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8634713121951865622)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8637258297977256483)
,p_name=>'P1925190015_WAT_TEMPLATE_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8634713121951865622)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8636847264336669552)
,p_name=>'P1925190015_WAUL_USERID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8634713032866865621)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7117163588429688418)
,p_tabular_form_region_id=>wwv_flow_imp.id(7739428874024793090)
,p_validation_name=>'Assign_department'
,p_static_id=>'assign-department'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'if :umc_benf_id is null then',
'	return(''Department must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'UMC_BENF_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7117164363398688420)
,p_tabular_form_region_id=>wwv_flow_imp.id(7739428874024793090)
,p_validation_name=>'Assign_from_mail'
,p_static_id=>'assign-from-mail'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if  :UMC_USER_NAME is null then',
'    return(''From Mail Must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'UMC_USER_NAME'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7117180828778688492)
,p_tabular_form_region_id=>wwv_flow_imp.id(8339133600370384586)
,p_validation_name=>'Assign_heade_url'
,p_static_id=>'assign-heade-url'
,p_validation_sequence=>100
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :SAHC_BASE_ID is null then',
'    return(''URL Must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'SAHC_BASE_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7117181156836688492)
,p_tabular_form_region_id=>wwv_flow_imp.id(8339133600370384586)
,p_validation_name=>'Assign_header_name'
,p_static_id=>'assign-header-name'
,p_validation_sequence=>110
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :SAHC_HEADER_NAME is null then',
'    return(''Name Must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'SAHC_HEADER_NAME'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7117164005634688420)
,p_tabular_form_region_id=>wwv_flow_imp.id(7739428874024793090)
,p_validation_name=>'Assign_password'
,p_static_id=>'assign-password'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :UMC_PASSWORD is null then',
'    return(''Password Must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'UMC_PASSWORD'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7117190295816688517)
,p_tabular_form_region_id=>wwv_flow_imp.id(7739754116312000605)
,p_validation_name=>'Assign_password1'
,p_static_id=>'assign-password-2'
,p_validation_sequence=>90
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :SAUC_PASSWORD is null then',
'    return(''Password must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'SAUC_PASSWORD'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7117189500169688515)
,p_tabular_form_region_id=>wwv_flow_imp.id(7739754116312000605)
,p_validation_name=>'Assign_url'
,p_static_id=>'assign-url'
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :SAUC_BASE_URL is null then',
'    return(''URL must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'SAUC_BASE_URL'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7117189884076688515)
,p_tabular_form_region_id=>wwv_flow_imp.id(7739754116312000605)
,p_validation_name=>'Assign_user-name'
,p_static_id=>'assign-user-name'
,p_validation_sequence=>80
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :SAUC_USERNAME IS NULL THEN',
'  Return(''User name must be entered.'');',
'END IF;'))
,p_validation_type=>'PLSQL_ERROR'
,p_error_message=>'User name must be entered.'
,p_associated_column=>'SAUC_USERNAME'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7117205262822688551)
,p_tabular_form_region_id=>wwv_flow_imp.id(7561042052338715495)
,p_validation_name=>'From mail'
,p_static_id=>'from-mail'
,p_validation_sequence=>20
,p_validation=>'UMC_USER_NAME'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must be entered.'
,p_associated_column=>'UMC_USER_NAME'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5630212829031602349)
,p_tabular_form_region_id=>wwv_flow_imp.id(7552015088485715723)
,p_validation_name=>'New'
,p_static_id=>'new'
,p_validation_sequence=>120
,p_validation=>'PMC_HOST'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Host value must be entered.'
,p_associated_column=>'PMC_HOST'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7117205663044688551)
,p_tabular_form_region_id=>wwv_flow_imp.id(7561042052338715495)
,p_validation_name=>'Password'
,p_static_id=>'password'
,p_validation_sequence=>30
,p_validation=>'UMC_PASSWORD'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must be entered.'
,p_associated_column=>'UMC_PASSWORD'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7117204899506688549)
,p_tabular_form_region_id=>wwv_flow_imp.id(7561042052338715495)
,p_validation_name=>'User Name'
,p_static_id=>'user-name'
,p_validation_sequence=>10
,p_validation=>'UMC_BENF_ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#COLUMN_HEADER# must be entered.'
,p_validation_condition_type=>'NEVER'
,p_associated_column=>'UMC_BENF_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117264540875688685)
,p_name=>'Add'
,p_static_id=>'add'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117203140742688548)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117265082969688687)
,p_event_id=>wwv_flow_imp.id(7117264540875688685)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117271775747688695)
,p_name=>'Add_dept'
,p_static_id=>'add-dept'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117161884263688412)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117272245218688695)
,p_event_id=>wwv_flow_imp.id(7117271775747688695)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region( "ig_line1" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5607467808717798330)
,p_name=>'Add_GN'
,p_static_id=>'add-gn'
,p_event_sequence=>440
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5607467729706798329)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5607467932435798331)
,p_event_id=>wwv_flow_imp.id(5607467808717798330)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "gen" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117279871925688710)
,p_name=>'Add_header'
,p_static_id=>'add-header'
,p_event_sequence=>230
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117179428879688487)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117280347570688710)
,p_event_id=>wwv_flow_imp.id(7117279871925688710)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line4" ).widget().interactiveGrid( "getActions" ).invoke( "row-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117269047728688692)
,p_name=>'Add_url'
,p_static_id=>'add-url'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117188071552688513)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117269585128688692)
,p_event_id=>wwv_flow_imp.id(7117269047728688692)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region( "ig_line2" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117261905740688682)
,p_name=>'Assign_emp_name'
,p_static_id=>'assign-emp-name'
,p_event_sequence=>140
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(7561042052338715495)
,p_triggering_element=>'UMC_BENF_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117262412485688682)
,p_event_id=>wwv_flow_imp.id(7117261905740688682)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'EMPLOYEE_NAME',
  'items_to_submit', 'UMC_BENF_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :umc_benf_id IS NOT NULL THEN',
    '',
    '	DECLARE',
    '		CURSOR c1',
    '		IS',
    '		 SELECT appluser_emp_id',
    ' 		   FROM appl_users',
    '          WHERE appluser_bu = :GLOBAL_bu ',
    '            AND appluser_id||appluser_emp_id = :umc_benf_id;',
    '	',
    '	cr1			c1%ROWTYPE;',
    '	',
    '	BEGIN',
    '		',
    '		OPEN c1;',
    '		FETCH c1 INTO cr1;',
    '		',
    '		IF c1%FOUND THEN',
    '        RAISE_APPLICATION_ERROR(-20999,cr1.appluser_emp_id);',
    '			:EMPLOYEE_NAME := func_find_employee_desc(:GLOBAL_bu,cr1.appluser_emp_id,1);',
    '		END IF;',
    '		',
    '		CLOSE c1;',
    '	END;',
    'END IF;	')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117282632767688715)
,p_name=>'Conf_add'
,p_static_id=>'conf-add'
,p_event_sequence=>330
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117226499914688603)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117283093152688717)
,p_event_id=>wwv_flow_imp.id(7117282632767688715)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_conf_pr" ).widget().interactiveGrid( "getActions" ).invoke( "row-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117283447659688717)
,p_name=>'Conf_save'
,p_static_id=>'conf-save'
,p_event_sequence=>340
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117226855984688603)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117283985162688717)
,p_event_id=>wwv_flow_imp.id(7117283447659688717)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_conf_pr" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117297636090688743)
,p_name=>'Configuration'
,p_static_id=>'configuration'
,p_event_sequence=>410
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117147635684688282)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117298219247688743)
,p_event_id=>wwv_flow_imp.id(7117297636090688743)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item(''gen'').hide();',
    'apex.item(''ig_line'').hide();',
    'apex.item(''ig_line2'').hide();',
    'apex.item(''ig_line4'').hide();',
    'apex.item(''template'').hide();',
    'apex.item(''ig_conf_pr'').show();',
    'apex.item(''ig_user_list'').hide();',
    'apex.item(''ig_temp_app'').hide();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117298672202688745)
,p_event_id=>wwv_flow_imp.id(7117297636090688743)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8634712944636865620)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117292566929688737)
,p_name=>'Configuration Refresh'
,p_static_id=>'configuration-refresh'
,p_event_sequence=>350
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8634712944636865620)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117293058955688737)
,p_event_id=>wwv_flow_imp.id(7117292566929688737)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8634712944636865620)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117263718433688684)
,p_name=>'Department_refresh'
,p_static_id=>'department-refresh'
,p_event_sequence=>180
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7739428874024793090)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117264160062688684)
,p_event_id=>wwv_flow_imp.id(7117263718433688684)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7739428874024793090)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117265482168688687)
,p_name=>'Download'
,p_static_id=>'download'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117204011410688549)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117265953694688687)
,p_event_id=>wwv_flow_imp.id(7117265482168688687)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region( "ig_line" ).call( "getActions" ).lookup("show-download-dialog").action(); ',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117272721175688696)
,p_name=>'Download_depat'
,p_static_id=>'download-depat'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117162689353688415)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117273222216688696)
,p_event_id=>wwv_flow_imp.id(7117272721175688696)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region( "ig_line1" ).call( "getActions" ).lookup("show-download-dialog").action(); ',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117281688810688715)
,p_name=>'Download_header'
,p_static_id=>'download-header'
,p_event_sequence=>250
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117180139886688490)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117282136976688715)
,p_event_id=>wwv_flow_imp.id(7117281688810688715)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line4" ).call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117270875893688693)
,p_name=>'download_url'
,p_static_id=>'download-url'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117188878627688515)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117271357813688693)
,p_event_id=>wwv_flow_imp.id(7117270875893688693)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region( "ig_line2" ).call( "getActions" ).lookup("show-download-dialog").action(); ',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117287973730688732)
,p_name=>'General'
,p_static_id=>'general'
,p_event_sequence=>360
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117149283172688287)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117289002340688732)
,p_event_id=>wwv_flow_imp.id(7117287973730688732)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item(''gen'').show();',
    'apex.item(''ig_line'').hide();',
    'apex.item(''ig_line2'').hide();',
    'apex.item(''ig_line4'').hide();',
    'apex.item(''template'').hide();',
    'apex.item(''ig_conf_pr'').hide();',
    'apex.item(''ig_user_list'').hide();',
    'apex.item(''ig_temp_app'').hide();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117288535392688732)
,p_event_id=>wwv_flow_imp.id(7117287973730688732)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7552015088485715723)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117294886622688740)
,p_name=>'HeaderDetails'
,p_static_id=>'headerdetails'
,p_event_sequence=>390
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117146181143688281)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117295420394688742)
,p_event_id=>wwv_flow_imp.id(7117294886622688740)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item(''gen'').hide();',
    'apex.item(''ig_line'').hide();',
    'apex.item(''ig_line2'').hide();',
    'apex.item(''ig_line4'').show();',
    'apex.item(''template'').hide();',
    'apex.item(''ig_conf_pr'').hide();',
    'apex.item(''ig_user_list'').hide();',
    'apex.item(''ig_temp_app'').hide();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117295864038688742)
,p_event_id=>wwv_flow_imp.id(7117294886622688740)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8339133600370384586)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117274485374688701)
,p_name=>'LINK1'
,p_static_id=>'link'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117274971952688704)
,p_event_id=>wwv_flow_imp.id(7117274485374688701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''a.nolink'').attr("onclick","return false;" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117260167822688678)
,p_name=>'LINK1_1'
,p_static_id=>'link-2'
,p_event_sequence=>50
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7561042052338715495)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|gridpagechange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117260674993688678)
,p_event_id=>wwv_flow_imp.id(7117260167822688678)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''a.nolink'').attr("onclick","return false;" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117285309928688721)
,p_name=>'LINK2'
,p_static_id=>'link-3'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117285825059688721)
,p_event_id=>wwv_flow_imp.id(7117285309928688721)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''a.nolink'').attr("onclick","return false;" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117261101447688679)
,p_name=>'LINK2_1'
,p_static_id=>'link-4'
,p_event_sequence=>130
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7561042052338715495)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|gridpagechange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117261575384688681)
,p_event_id=>wwv_flow_imp.id(7117261101447688679)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''a.nolink'').attr("onclick","return false;" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5593126612161045131)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>490
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(7561042052338715495)
,p_triggering_element=>'BENF_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5593126708840045132)
,p_event_id=>wwv_flow_imp.id(5593126612161045131)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'EMPLOYEE_NAME,UMC_BENF_ID,UMC_EMP_ID',
  'items_to_submit', 'BENF_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :benf_id IS NOT NULL THEN',
    '',
    '	DECLARE',
    '		CURSOR c1',
    '		IS',
    '		 SELECT appluser_emp_id,appluser_id',
    ' 		   FROM appl_users',
    '          WHERE appluser_bu = :GLOBAL_bu ',
    '            AND appluser_id||appluser_emp_id = :benf_id;',
    '	',
    '	cr1			c1%ROWTYPE;',
    '	',
    '	BEGIN',
    '		',
    '		OPEN c1;',
    '		FETCH c1 INTO cr1;',
    '		',
    '		IF c1%FOUND THEN',
    '         --RAISE_APPLICATION_ERROR(-20999,cr1.appluser_emp_id||''~''||cr1.appluser_id);',
    '			:EMPLOYEE_NAME := func_find_employee_desc(:GLOBAL_bu,cr1.appluser_emp_id,1);',
    '            :UMC_BENF_ID   := cr1.appluser_id;',
    '            :UMC_EMP_ID := cr1.appluser_emp_id;',
    '		END IF;',
    '		',
    '		CLOSE c1;',
    '	END;',
    'END IF;	')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8143408496492427156)
,p_name=>'ref'
,p_static_id=>'ref'
,p_event_sequence=>470
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7552015088485715723)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8143408584707427157)
,p_event_id=>wwv_flow_imp.id(8143408496492427156)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7552015088485715723)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117273546695688696)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>150
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7561042052338715495)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117274132179688698)
,p_event_id=>wwv_flow_imp.id(7117273546695688696)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7561042052338715495)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117268142568688690)
,p_name=>'Refresh3'
,p_static_id=>'refresh-2'
,p_event_sequence=>220
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8339133600370384586)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117268727414688690)
,p_event_id=>wwv_flow_imp.id(7117268142568688690)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8339133600370384586)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5630646083152013865)
,p_name=>'SAUC_BASE_URL'
,p_static_id=>'sauc-base-url'
,p_event_sequence=>460
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(7739754116312000605)
,p_triggering_element=>'SAUC_BASE_URL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5630646182221013866)
,p_event_id=>wwv_flow_imp.id(5630646083152013865)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if (apex.item("SAUC_BASE_URL").isDirty()) {',
    '   alert("You have unsaved changes.");',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117262744627688682)
,p_name=>'Save'
,p_static_id=>'save'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117203587638688548)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117263328215688684)
,p_event_id=>wwv_flow_imp.id(7117262744627688682)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region( "ig_line" ).widget().interactiveGrid( "getActions" ).invoke( "save" );',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5607468738849798340)
,p_name=>'Save_GN'
,p_static_id=>'save-gn'
,p_event_sequence=>450
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5607468677464798339)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5607468908772798341)
,p_event_id=>wwv_flow_imp.id(5607468738849798340)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region( "gen" ).widget().interactiveGrid( "getActions" ).invoke( "save" );',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117280774033688710)
,p_name=>'Save_header'
,p_static_id=>'save-header'
,p_event_sequence=>240
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117179744390688488)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117281294739688713)
,p_event_id=>wwv_flow_imp.id(7117280774033688710)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line4" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117269958023688692)
,p_name=>'Save_url'
,p_static_id=>'save-url'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117188457997688513)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117270495083688693)
,p_event_id=>wwv_flow_imp.id(7117269958023688692)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region( "ig_line2" ).widget().interactiveGrid( "getActions" ).invoke( "save" );',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117266432879688688)
,p_name=>'Temp_add'
,p_static_id=>'temp-add'
,p_event_sequence=>290
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117252581827688660)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117266862050688688)
,p_event_id=>wwv_flow_imp.id(7117266432879688688)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_temp_app" ).widget().interactiveGrid( "getActions" ).invoke( "row-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117276236515688706)
,p_name=>'TEMP_LINK1'
,p_static_id=>'temp-link'
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117276802010688706)
,p_event_id=>wwv_flow_imp.id(7117276236515688706)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''a.nolink'').attr("onclick","return false;" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117278060317688707)
,p_name=>'TEMP_LINK1_1'
,p_static_id=>'temp-link-2'
,p_event_sequence=>80
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8340302860558959107)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|gridpagechange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117278582509688709)
,p_event_id=>wwv_flow_imp.id(7117278060317688707)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''a.nolink'').attr("onclick","return false;" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117277229841688707)
,p_name=>'TEMP_LINK2'
,p_static_id=>'temp-link-3'
,p_event_sequence=>90
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117277641872688707)
,p_event_id=>wwv_flow_imp.id(7117277229841688707)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_name=>'TEMP_LINK2'
,p_static_id=>'temp-link'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''a.nolink'').attr("onclick","return false;" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117279015513688709)
,p_name=>'TEMP_LINK2_1'
,p_static_id=>'temp-link-4'
,p_event_sequence=>120
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8340302860558959107)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|gridpagechange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117279468631688709)
,p_event_id=>wwv_flow_imp.id(7117279015513688709)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'TEMP_LINK2'
,p_static_id=>'temp-link'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''a.nolink'').attr("onclick","return false;" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117267270316688688)
,p_name=>'Temp_save'
,p_static_id=>'temp-save'
,p_event_sequence=>300
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117253009912688660)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117267747037688690)
,p_event_id=>wwv_flow_imp.id(7117267270316688688)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_temp_app" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117296324249688742)
,p_name=>'TemplateDetails'
,p_static_id=>'templatedetails'
,p_event_sequence=>400
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117146568321688281)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117296792454688743)
,p_event_id=>wwv_flow_imp.id(7117296324249688742)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item(''gen'').hide();',
    'apex.item(''ig_line'').hide();',
    'apex.item(''ig_line2'').hide();',
    'apex.item(''ig_line4'').hide();',
    'apex.item(''template'').show();',
    'apex.item(''ig_conf_pr'').hide();',
    'apex.item(''ig_user_list'').hide();',
    'apex.item(''ig_temp_app'').hide();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117297292275688743)
,p_event_id=>wwv_flow_imp.id(7117296324249688742)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8340302860558959107)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117300520013688749)
,p_name=>'Templates'
,p_static_id=>'templates'
,p_event_sequence=>430
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117148499202688284)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117300994033688751)
,p_event_id=>wwv_flow_imp.id(7117300520013688749)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item(''gen'').hide();',
    'apex.item(''ig_line'').hide();',
    'apex.item(''ig_line2'').hide();',
    'apex.item(''ig_line4'').hide();',
    'apex.item(''template'').hide();',
    'apex.item(''ig_conf_pr'').hide();',
    'apex.item(''ig_user_list'').hide();',
    'apex.item(''ig_temp_app'').show();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117301435713688751)
,p_event_id=>wwv_flow_imp.id(7117300520013688749)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8634713121951865622)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117284336025688717)
,p_name=>'Templates Refresh'
,p_static_id=>'templates-refresh'
,p_event_sequence=>310
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8634713121951865622)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117284863247688718)
,p_event_id=>wwv_flow_imp.id(7117284336025688717)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8634713121951865622)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5757122870882979529)
,p_name=>'URL REF'
,p_static_id=>'url-ref'
,p_event_sequence=>480
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7739754116312000605)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5757123008826979530)
,p_event_id=>wwv_flow_imp.id(5757122870882979529)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7739754116312000605)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117293485973688737)
,p_name=>'URLDetails'
,p_static_id=>'urldetails'
,p_event_sequence=>380
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117146890139688282)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117294010823688738)
,p_event_id=>wwv_flow_imp.id(7117293485973688737)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item(''gen'').hide();',
    'apex.item(''ig_line'').hide();',
    'apex.item(''ig_line2'').show();',
    'apex.item(''ig_line4'').hide();',
    'apex.item(''template'').hide();',
    'apex.item(''ig_conf_pr'').hide();',
    'apex.item(''ig_user_list'').hide();',
    'apex.item(''ig_temp_app'').hide();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117294460900688740)
,p_event_id=>wwv_flow_imp.id(7117293485973688737)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7739754116312000605)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117286159337688723)
,p_name=>'User_add'
,p_static_id=>'user-add'
,p_event_sequence=>260
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117239603072688624)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117286658189688723)
,p_event_id=>wwv_flow_imp.id(7117286159337688723)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_user_list" ).widget().interactiveGrid( "getActions" ).invoke( "row-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117299059506688745)
,p_name=>'User_List'
,p_static_id=>'user-list'
,p_event_sequence=>420
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117148082307688284)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117299552597688749)
,p_event_id=>wwv_flow_imp.id(7117299059506688745)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item(''gen'').hide();',
    'apex.item(''ig_line'').hide();',
    'apex.item(''ig_line2'').hide();',
    'apex.item(''ig_line4'').hide();',
    'apex.item(''template'').hide();',
    'apex.item(''ig_conf_pr'').hide();',
    'apex.item(''ig_user_list'').show();',
    'apex.item(''ig_temp_app'').hide();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117300069790688749)
,p_event_id=>wwv_flow_imp.id(7117299059506688745)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8634713032866865621)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117275355504688704)
,p_name=>'User List Refresh'
,p_static_id=>'user-list-refresh'
,p_event_sequence=>280
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8634713032866865621)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117275842749688706)
,p_event_id=>wwv_flow_imp.id(7117275355504688704)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8634713032866865621)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117287116567688723)
,p_name=>'User_save'
,p_static_id=>'user-save'
,p_event_sequence=>270
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117240006870688624)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117287621679688731)
,p_event_id=>wwv_flow_imp.id(7117287116567688723)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_user_list" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117289421335688734)
,p_name=>'UserConfig'
,p_static_id=>'userconfig'
,p_event_sequence=>370
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7117149728172688287)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117290426423688734)
,p_event_id=>wwv_flow_imp.id(7117289421335688734)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item(''gen'').hide();',
    'apex.item(''ig_line'').show();',
    'apex.item(''ig_line2'').hide();',
    'apex.item(''ig_line4'').hide();',
    'apex.item(''template'').hide();',
    'apex.item(''ig_conf_pr'').hide();',
    'apex.item(''ig_user_list'').hide();',
    'apex.item(''ig_temp_app'').hide();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117289869419688734)
,p_event_id=>wwv_flow_imp.id(7117289421335688734)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7561042052338715495)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117301917575688751)
,p_name=>'WAT_HEADER_FLAG'
,p_static_id=>'wat-header-flag'
,p_event_sequence=>320
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(8634713121951865622)
,p_triggering_element=>'WAT_HEADER_FLAG'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'WAT_HEADER_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'T'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117302420482688753)
,p_event_id=>wwv_flow_imp.id(7117301917575688751)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'WAT_HEADER_MSG'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117302856345688753)
,p_event_id=>wwv_flow_imp.id(7117301917575688751)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'WAT_HEADER_MSG'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117290743185688735)
,p_name=>'WHAT_TEMP_LINK'
,p_static_id=>'what-temp-link'
,p_event_sequence=>100
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117291257942688735)
,p_event_id=>wwv_flow_imp.id(7117290743185688735)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_name=>'TEMP_LINK2'
,p_static_id=>'temp-link'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''a.nolink'').attr("onclick","return false;" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7117291718137688735)
,p_name=>'WHAT_TEMP_LINK_1'
,p_static_id=>'what-temp-link-2'
,p_event_sequence=>110
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8634713121951865622)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|gridpagechange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7117292209852688737)
,p_event_id=>wwv_flow_imp.id(7117291718137688735)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'TEMP_LINK2'
,p_static_id=>'temp-link'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''a.nolink'').attr("onclick","return false;" );')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117227397419688603)
,p_process_sequence=>180
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(8634712944636865620)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'<b>Configuration</b> - Save Interactive Grid Data'
,p_static_id=>'b-configuration-b-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1635265561876077575
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5607467937064798332)
,p_process_sequence=>190
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7552015088485715723)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'<b>General</b> - Save Interactive Grid Data_1'
,p_static_id=>'b-general-b-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--raise_application_error(-20999,:GLOBAL_USER);',
'',
'IF :APEX$ROW_STATUS = ''C''  THEN',
'',
'INSERT INTO   prod_mail_config( pmc_bu,',
'			        pmc_host,',
'			        pmc_port,',
'			        pmc_encryp_type,',
'			        pmc_rpt_gate_way,',
'			        pmc_rpt_server,',
'			        pmc_send_type,',
'			        pmc_cre_by,',
'			        pmc_cre_ip_addr,',
'			        pmc_cre_os_user,',
'			        pmc_cre_date,			        ',
'			        pmc_suite',
'                 )    ',
'			VALUES(:GLOBAL_bu,',
'                 :pmc_host,',
'                 :pmc_port,',
'                 :pmc_encryp_type,',
'                 :pmc_rpt_gate_way,',
'                 :pmc_rpt_server,',
'                 :pmc_send_type,',
'                 :GLOBAL_USER,',
'                 :GLOBAL_IP_ADDR,',
'                 :GLOBAL_OS_USER,',
'                  SYSDATE,',
'                 :pmc_suite);                                    ',
'apex_application.g_print_success_message := ''Details Created Successfully.'';',
'COMMIT;',
'--ELSIF :APEX$ROW_STATUS = ''U''  THEN',
'END IF;',
' if :APEX$ROW_STATUS = ''U'' THEN ',
'--raise_application_error(-20999,:GLOBAL_USER);',
'UPDATE  prod_mail_config',
'SET ',
'pmc_host                   =:pmc_host,',
'pmc_port                   =:pmc_port, ',
'pmc_upd_by                 =:pmc_upd_by,',
'pmc_upd_date               =:pmc_upd_date',
'WHERE pmc_bu               =:GLOBAL_bu',
'  AND pmc_host             =:pmc_host',
'  AND pmc_port             =:pmc_port;',
' -- AND ROWID                =ROWID;',
'--raise_application_error(-20999,:GLOBAL_USER);',
'apex_application.g_print_success_message := ''Details Updated Successfully.'';',
'COMMIT;',
'END IF;',
'',
'',
'-- if :APEX$ROW_STATUS = ''U'' THEN ',
'',
'--   UPDATE job_level',
'--      SET JL_LVL_DESC1    = :JL_LVL_DESC1,',
'--          JL_LVL_DESC2    = :JL_LVL_DESC2,',
'--          JL_ACTIVE_FLAG  = :JL_ACTIVE_FLAG,',
'--          JL_UPD_BY       = :GLOBAL_USER,',
'--          JL_UPD_DATE     = SYSDATE',
'--    WHERE JL_BU           = :GLOBAL_BU',
'--      AND JL_JOB_LVL_ID   = :JL_JOB_LVL_ID ;',
'',
'--   apex_application.g_print_success_message := ''<span>Designation Level Updated.</span>'';   ',
'--   END IF; ',
'',
'',
'',
'-- pmc_host                   =:pmc_host,',
'-- --pmc_suite                  =:pmc_suite,',
'-- -pmc_port                   =:pmc_port,',
'-- --pmc_encryp_type            =:pmc_encryp_type,',
'-- --pmc_send_type              =:pmc_send_type ,  ',
'-- pmc_upd_by                 =:pmc_upd_by,',
'-- pmc_upd_date               =:pmc_upd_date'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>125506101521187304
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117254103456688662)
,p_process_sequence=>150
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(8634713121951865622)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'<b>Templates</b> - Save Interactive Grid Data'
,p_static_id=>'b-templates-b-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :APEX$ROW_STATUS = ''C''  THEN',
'',
'   INSERT INTO WHATSAPP_API_TEMPLATES (',
'   	         WAT_BU,',
'		         WAT_TEMPLATE_ID,',
'		         WAT_TEMPLATE_DESC,',
'		         WAT_HEADER_MSG,',
'		         WAT_TEMPLATE_MSG,',
'		         WAT_FOOTER_MSG,',
'		         WAT_BUTTON_FLAG,',
'		         WAT_BUTTON_TEXT,',
'		         WAT_CRE_BY,',
'		         WAT_CRE_DATE,',
'		         WAT_STATUS,',
'		         WAT_NO_OF_VAR,',
'		         WAT_HEADER_FLAG',
'		         )',
'	     VALUES(:GLOBAL_bu,',
'		         :WAT_TEMPLATE_ID,',
'		         :WAT_TEMPLATE_DESC,',
'		         :WAT_HEADER_MSG,',
'		         :WAT_TEMPLATE_MSG,',
'		         :WAT_FOOTER_MSG,',
'		         :WAT_BUTTON_FLAG,',
'		         :WAT_BUTTON_TEXT,',
'		         :GLOBAL_user,',
'		         SYSDATE,',
'		         :WAT_STATUS,',
'		         :WAT_NO_OF_VAR,',
'		         :WAT_HEADER_FLAG',
'		         );',
'',
'APEX_APPLICATION.g_print_success_message := ''Template Created Successfully.'';',
'',
'ELSIF :APEX$ROW_STATUS = ''U''  THEN',
'',
'   UPDATE WHATSAPP_API_TEMPLATES',
'      SET WAT_TEMPLATE_ID    = :WAT_TEMPLATE_ID,',
'	       WAT_TEMPLATE_DESC  = :WAT_TEMPLATE_DESC,',
'	       WAT_HEADER_MSG     = :WAT_HEADER_MSG,',
'	       WAT_TEMPLATE_MSG   = :WAT_TEMPLATE_MSG,',
'	       WAT_FOOTER_MSG	  = :WAT_FOOTER_MSG,',
'	       WAT_BUTTON_FLAG	  = :WAT_BUTTON_FLAG,',
'	       WAT_BUTTON_TEXT	  = :WAT_BUTTON_TEXT,',
'	       WAT_UPD_BY		     = :GLOBAL_user,',
'	       WAT_UPD_DATE	     = SYSDATE,',
'	       WAT_STATUS		     = :WAT_STATUS,',
'	       WAT_NO_OF_VAR	     = :WAT_NO_OF_VAR,',
'	       WAT_HEADER_FLAG	  = :WAT_HEADER_FLAG',
'    WHERE WAT_BU 		        = :GLOBAL_bu',
'      AND ROWID		        = :ROWID;',
'',
'APEX_APPLICATION.g_print_success_message := ''Template Updated Successfully.'';',
'',
'ELSIF :APEX$ROW_STATUS = ''D''  THEN',
'',
'      DELETE ',
'        FROM WHATSAPP_API_TEMPLATES',
'       WHERE WAT_BU = :GLOBAL_bu',
'         AND ROWID  = :ROWID;',
'',
'APEX_APPLICATION.g_print_success_message := ''Template Deleted Successfully.''; ',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1635292267913077634
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117240785489688631)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(8634713032866865621)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'<b>User List</b> - Save Interactive Grid Data'
,p_static_id=>'b-user-list-b-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- raise_application_error(-20999,:ROWID);',
'',
'IF :APEX$ROW_STATUS = ''C''  THEN',
'',
'  INSERT INTO WHATSAPP_API_USER_LIST (',
'  			WAUL_BU,',
'			WAUL_USERID,',
'			WAUL_BENF_TYPE,',
'			WAUL_BENF_ID,',
'			WAUL_BENF_NAME,',
'			WAUL_COUNTRY_CODE,',
'			WAUL_WA_MOB_NO,',
'			WAUL_ACT_STATUS,',
'			WAUL_RQST_JSON,',
'			WAUL_RESPONSE,',
'			WAUL_CRE_BY,',
'			WAUL_CRE_DATE,',
'			WAUL_DOB,',
'			WAUL_EMAIL',
'			)',
'  VALUES(:GLOBAL_bu,',
'		   :WAUL_USERID,',
'		   :WAUL_BENF_TYPE,',
'		   :WAUL_BENF_ID,',
'		   :WAUL_BENF_NAME,',
'		   :WAUL_COUNTRY_CODE,',
'		   :WAUL_WA_MOB_NO,',
'		   :WAUL_ACT_STATUS,',
'		   :WAUL_RQST_JSON,',
'		   :WAUL_RESPONSE,',
'		   :GLOBAL_user,',
'		   SYSDATE,',
'		   TO_DATE(:WAUL_DOB,:GLOBAL_DATE_FORMAT),',
'		   :WAUL_EMAIL',
'		   );',
'',
'APEX_APPLICATION.g_print_success_message := ''User List Created Successfully.'';',
'',
'ELSIF :APEX$ROW_STATUS = ''U''  THEN',
'',
'  UPDATE WHATSAPP_API_USER_LIST',
'     SET WAUL_USERID		   = :WAUL_USERID,',
'	      WAUL_BENF_TYPE		= :WAUL_BENF_TYPE,',
'	      WAUL_BENF_ID		= :WAUL_BENF_ID,',
'	      WAUL_BENF_NAME		= :WAUL_BENF_NAME,',
'	      WAUL_COUNTRY_CODE	= :WAUL_COUNTRY_CODE,',
'	      WAUL_WA_MOB_NO		= :WAUL_WA_MOB_NO,',
'	      WAUL_ACT_STATUS	= :WAUL_ACT_STATUS,',
'	      WAUL_RQST_JSON		= :WAUL_RQST_JSON,',
'	      WAUL_RESPONSE		= :WAUL_RESPONSE,',
'	      WAUL_UPD_BY		   = :GLOBAL_user,',
'	      WAUL_UPD_DATE		= SYSDATE,',
'	      WAUL_DOB		      = TO_DATE(:WAUL_DOB,:GLOBAL_DATE_FORMAT),',
'	      WAUL_EMAIL		   = :WAUL_EMAIL',
'   WHERE WAUL_BU		      = :GLOBAL_bu',
'     AND ROWID			      = :ROWID;',
'',
'APEX_APPLICATION.g_print_success_message := ''User List Updated Successfully.'';',
'',
'ELSIF :APEX$ROW_STATUS = ''D''  THEN',
'',
'DELETE ',
'  FROM WHATSAPP_API_USER_LIST',
' WHERE WAUL_BU = :GLOBAL_bu',
'   AND ROWID   = :ROWID;',
'',
'APEX_APPLICATION.g_print_success_message := ''User List Deleted Successfully.'';',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1635278949946077603
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117181473955688493)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(8339133600370384586)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Header Details - Save Interactive Grid Data'
,p_static_id=>'header-details-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :APEX$ROW_STATUS = ''C''  THEN',
'SELECT NVL(MAX(SAHC_HEADER_ID),20000)+1',
'  INTO :SAHC_HEADER_ID',
'  FROM SMS_API_HEADER_CONFIG',
' WHERE sahc_base_id = :sauc_base_id;',
'INSERT INTO   SMS_API_HEADER_CONFIG( SAHC_BASE_ID,',
'                                     SAHC_HEADER_ID,',
'                                     SAHC_HEADER_NAME,',
'                                     SAHC_CRE_BY,',
'                                     SAHC_CRE_DATE,',
'									 SAHC_HEADER_REF)',
'						     VALUES(:SAHC_BASE_ID,',
'                                    :SAHC_HEADER_ID,',
'                                    :SAHC_HEADER_NAME,',
'									:GLOBAL_USER,',
'									SYSDATE,',
'									:SAHC_HEADER_REF);',
'apex_application.g_print_success_message := ''Header Details Created Successfully.'';',
'ELSIF :APEX$ROW_STATUS = ''U''  THEN',
'UPDATE  SMS_API_HEADER_CONFIG',
'SET ',
'SAHC_BASE_ID                   =:SAHC_BASE_ID,',
'SAHC_HEADER_NAME               =:SAHC_HEADER_NAME,',
'SAHC_UPD_BY                    =:GLOBAL_USER,',
'SAHC_UPD_DATE                  =SYSDATE,',
'SAHC_HEADER_REF                =:SAHC_HEADER_REF   ',
'WHERE ROWID                    =ROWID;',
'',
'apex_application.g_print_success_message := ''Header Details Updated Successfully.'';',
'',
'ELSE ',
'    DELETE FROM SMS_API_HEADER_CONFIG',
'        WHERE ROWID                    =:ROWID;',
'apex_application.g_print_success_message := ''Header Details Deleted Successfully.'';',
'',
'COMMIT;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1635219638412077465
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117257431337688673)
,p_process_sequence=>160
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process Activate Template'
,p_static_id=>'process-activate-template'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- raise_application_error(-20999,:P1925190015_WAT_TEMPLATE_ID||''~''||:P1925190015_WAT_TEMPLATE_DESC);',
'DECLARE',
'	V_RES		   VARCHAR2(100);',
'BEGIN',
'  	UPDATE WHATSAPP_API_TEMPLATES',
'  	   SET WAT_STATUS = ''A''',
'  	 WHERE WAT_TEMPLATE_ID   = :P1925190015_WAT_TEMPLATE_ID',
'  	   AND WAT_TEMPLATE_DESC = :P1925190015_WAT_TEMPLATE_DESC;',
'   COMMIT;',
'APEX_APPLICATION.g_print_success_message := ''<span style="color:white">Template Activated Successfully!</span>'';',
'END; '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'ACTIVATE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>1635295595794077645
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117256159402688668)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Active_btn_template'
,p_static_id=>'process-for-active-btn-template'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'update SMS_API_TEMPLATE_CONFIG',
'  set SATC_STATUS =''A''',
'  where rowid =:P1925190015_TEMPLATE_ROWID;',
'commit;',
'apex_application.g_print_success_message := ''User Activated Successfully.'';',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Active'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>1635294323859077640
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117256569099688671)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Inactive_btn_template'
,p_static_id=>'process-for-inactive-btn-template'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'update SMS_API_TEMPLATE_CONFIG',
'  set SATC_STATUS =''I''',
'  where rowid =:P1925190015_TEMPLATE_ROWID;',
'commit;',
'apex_application.g_print_success_message := ''User InActivated Successfully.'';',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'InActive'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>1635294733556077643
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117254536081688665)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process from Active_btn'
,p_static_id=>'process-from-active-btn'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'update USER_MAIL_CONFIG',
'  set UMC_STATUS =''A''',
'  where rowid =:P1925190015_UMC_ROWID;',
'commit;',
'apex_application.g_print_success_message := ''User Activated Successfully.'';',
'',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Active'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>1635292700538077637
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117255411478688665)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process from Active_btn_1'
,p_static_id=>'process-from-active-btn-2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'update USER_MAIL_CONFIG',
'  set UMC_STATUS =''A''',
'  where rowid =:P1925190015_DEPT_ROWID;',
'commit;',
'apex_application.g_print_success_message := ''Department Activated Successfully.'';',
'',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Active1'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>1635293575935077637
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117255021381688665)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process from InActive'
,p_static_id=>'process-from-inactive'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'update USER_MAIL_CONFIG',
'  set UMC_STATUS =''I''',
'  where rowid =:P1925190015_UMC_ROWID;',
'commit;',
'apex_application.g_print_success_message := ''User InActivated Successfully.'';',
'',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'InActive'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>1635293185838077637
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117255806793688667)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process from InActive_1'
,p_static_id=>'process-from-inactive-2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'update USER_MAIL_CONFIG',
'  set UMC_STATUS =''I''',
'  where rowid =:P1925190015_DEPT_ROWID;',
'commit;',
'apex_application.g_print_success_message := ''Department InActivated Successfully.'';',
'',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'InActive1'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>1635293971250077639
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117164643341688420)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7739428874024793090)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process from interactive grid Department Config'
,p_static_id=>'process-from-interactive-grid-department-config'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :APEX$ROW_STATUS = ''C''  THEN',
'INSERT INTO    USER_MAIL_CONFIG(UMC_BU,',
'                                UMC_BENF_TYPE,',
'                                UMC_BENF_ID,',
'                                UMC_EMAIL_ID,',
'                                UMC_USER_NAME,',
'                                UMC_PASSWORD,',
'                                UMC_EFF_FROM,',
'                                UMC_EFF_TO,',
'                                UMC_STATUS,',
'                                UMC_CRE_BY,',
'                                UMC_CRE_IP_ADDR,',
'                                UMC_CRE_OS_USER,',
'                                UMC_CRE_DATE,',
'                                UMC_CRE_EMP_ID,',
'                                UMC_SUITE)',
'                       VALUES(:GLOBAL_BU,',
'                              ''D'',',
'                              :UMC_BENF_ID,',
'                              :UMC_EMAIL_ID,',
'                              :UMC_USER_NAME,',
'                              CRYPTIT.ENCRYPT(:UMC_PASSWORD),',
'                              :UMC_EFF_FROM,',
'                              :UMC_EFF_TO,',
'                              :UMC_STATUS,',
'                              :GLOBAL_USER,',
'                              :GLOBAL_IP_ADDR,',
'                              :GLOBAL_OS_USER,',
'                               SYSDATE,',
'                              :UMC_CRE_EMP_ID,',
'                              ''G'');',
'apex_application.g_print_success_message := ''Department Configured Created Successfully.'';',
'ELSIF :APEX$ROW_STATUS = ''U''  THEN',
'UPDATE  USER_MAIL_CONFIG',
'SET ',
'UMC_BENF_TYPE                   =:UMC_BENF_TYPE,',
'UMC_BENF_ID                     =:UMC_BENF_ID,',
'UMC_EMAIL_ID                    =:UMC_EMAIL_ID,',
'UMC_USER_NAME                   =:UMC_USER_NAME,',
'UMC_PASSWORD                    =CRYPTIT.ENCRYPT(:UMC_PASSWORD),',
'UMC_EFF_FROM                    =:UMC_EFF_FROM,',
'UMC_EFF_TO                      =:UMC_EFF_TO,',
'UMC_STATUS                      =:UMC_STATUS,',
'UMC_UPD_BY                      =:GLOBAL_BU,',
'UMC_UPD_IP_ADDR                 =:GLOBAL_IP_ADDR,',
'UMC_UPD_OS_USER                 =:GLOBAL_OS_ADDR,',
'UMC_UPD_DATE                    =SYSDATE,',
'UMC_UPD_EMP_ID                  =:UMC_UPD_EMP_ID,',
'UMC_SUITE                       =:UMC_SUITE',
'WHERE ROWID                     =ROWID;',
'apex_application.g_print_success_message := ''Department Configured Updated Successfully.'';',
'',
'ELSE ',
'    DELETE FROM USER_MAIL_CONFIG',
'        WHERE UMC_BENF_ID             =:UMC_BENF_ID;',
'apex_application.g_print_success_message := ''Department Configured Deleted Successfully.'';',
'',
'COMMIT;',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1635202807798077392
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5630212612181602347)
,p_process_sequence=>170
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process InActivate Template_1'
,p_static_id=>'process-inactivate-template'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- raise_application_error(-20999,:P1925190015_WAT_TEMPLATE_ID||''~''||:P1925190015_WAT_TEMPLATE_DESC);',
'DECLARE',
'	V_RES		   VARCHAR2(100);',
'BEGIN',
'  	UPDATE WHATSAPP_API_TEMPLATES',
'  	   SET WAT_STATUS = ''N''',
'  	 WHERE WAT_TEMPLATE_ID   = :P1925190015_WAT_TEMPLATE_ID',
'  	   AND WAT_TEMPLATE_DESC = :P1925190015_WAT_TEMPLATE_DESC;',
'   COMMIT;',
'APEX_APPLICATION.g_print_success_message := ''<span style="color:white">Template In Activated Successfully!</span>'';',
'END; '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'INACT'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>148250776637991319
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117256960811688673)
,p_process_sequence=>140
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process Subscribe User'
,p_static_id=>'process-subscribe-user'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Raise_Application_error(-20999,:P1925190015_WAUL_USERID);',
'DECLARE',
'	V_ALERT		VARCHAR2(5);',
'	V_RES		VARCHAR2(100);',
'BEGIN',
'  ',
'-- ''Do You Want To Subscribe This User To WhatsApp''',
'',
'  	proc_get_user_wa_status(:GLOBAL_bu,''U1'',:P1925190015_WAUL_USERID,:GLOBAL_user,v_res);',
'   ',
'   COMMIT;',
'',
'   APEX_APPLICATION.g_print_success_message := ''<span style="color:white"> User Subscribed To WhatsApp Successfully!</span>'';',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'APP'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>1635295125268077645
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117206016818688551)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7561042052338715495)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'<span style="color:Brown; font-weight:bold;">User Config.</span> - Save Interactive Grid Data'
,p_static_id=>'span-style-color-brown-font-weight-bold-user-config-span-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :benf_id IS NOT NULL THEN',
'',
'	DECLARE',
'		CURSOR c1',
'		IS',
'		 SELECT appluser_emp_id,appluser_id',
' 		   FROM appl_users',
'          WHERE appluser_bu = :GLOBAL_bu ',
'            AND appluser_id||appluser_emp_id = :benf_id;',
'	',
'	cr1			c1%ROWTYPE;',
'	',
'	BEGIN',
'		',
'		OPEN c1;',
'		FETCH c1 INTO cr1;',
'		',
'		IF c1%FOUND THEN',
'         --RAISE_APPLICATION_ERROR(-20999,cr1.appluser_emp_id||''~''||cr1.appluser_id);',
'			:EMPLOYEE_NAME := func_find_employee_desc(:GLOBAL_bu,cr1.appluser_emp_id,1);',
'            :UMC_BENF_ID   := cr1.appluser_id;',
'            :UMC_EMP_ID := cr1.appluser_emp_id;',
'		END IF;',
'		',
'		CLOSE c1;',
'	END;',
'END IF;	',
'IF :APEX$ROW_STATUS = ''C''  THEN',
'INSERT INTO    USER_MAIL_CONFIG(UMC_BU,',
'                                UMC_BENF_TYPE,',
'                                UMC_BENF_ID,',
'                                UMC_EMAIL_ID,',
'                                UMC_USER_NAME,',
'                                UMC_PASSWORD,',
'                                UMC_EFF_FROM,',
'                                UMC_EFF_TO,',
'                                UMC_STATUS,',
'                                UMC_CRE_BY,',
'                                UMC_CRE_IP_ADDR,',
'                                UMC_CRE_OS_USER,',
'                                UMC_CRE_DATE,',
'                                UMC_CRE_EMP_ID,',
'                                UMC_EMP_ID,',
'                                UMC_SUITE)',
'                       VALUES(:GLOBAL_BU,',
'                              ''U'',',
'                              :UMC_BENF_ID,',
'                              :UMC_EMAIL_ID,',
'                              :UMC_USER_NAME,',
'                              CRYPTIT.ENCRYPT(:UMC_PASSWORD),',
'                              :UMC_EFF_FROM,',
'                              :UMC_EFF_TO,',
'                              :UMC_STATUS,',
'                              :GLOBAL_USER,',
'                              :GLOBAL_IP_ADDR,',
'                              :GLOBAL_OS_USER,',
'                               SYSDATE,',
'                              :UMC_CRE_EMP_ID,',
'                              :UMC_EMP_ID,',
'                              :UMC_SUITE);',
'apex_application.g_print_success_message := ''User Configured Created Successfully.'';',
'ELSIF :APEX$ROW_STATUS = ''U''  THEN',
'UPDATE  USER_MAIL_CONFIG',
'SET ',
'UMC_BENF_TYPE                   =:UMC_BENF_TYPE,',
'UMC_BENF_ID                     =:UMC_BENF_ID,',
'UMC_EMP_ID                      =:UMC_EMP_ID,',
'UMC_EMAIL_ID                    =:UMC_EMAIL_ID,',
'UMC_USER_NAME                   =:UMC_USER_NAME,',
'UMC_PASSWORD                    =CRYPTIT.ENCRYPT(:UMC_PASSWORD),',
'UMC_EFF_FROM                    =:UMC_EFF_FROM,',
'UMC_EFF_TO                      =:UMC_EFF_TO,',
'UMC_STATUS                      =:UMC_STATUS,',
'UMC_UPD_BY                      =:GLOBAL_BU,',
'UMC_UPD_IP_ADDR                 =:GLOBAL_IP_ADDR,',
'UMC_UPD_OS_USER                 =:GLOBAL_OS_ADDR,',
'UMC_UPD_DATE                    =SYSDATE,',
'UMC_UPD_EMP_ID                  =:UMC_UPD_EMP_ID,',
'UMC_SUITE                       =:UMC_SUITE',
'WHERE  UMC_BENF_ID             =:UMC_BENF_ID',
'  AND ROWID                     = ROWID;',
'apex_application.g_print_success_message := ''User Configured Updated Successfully.'';',
'',
'ELSE ',
'    DELETE FROM USER_MAIL_CONFIG',
'        WHERE UMC_BENF_ID             =:UMC_BENF_ID;',
'apex_application.g_print_success_message := ''User Configured Deleted Successfully.'';',
'',
'COMMIT;',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1635244181275077523
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117259359747688676)
,p_process_sequence=>70
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SUBSCRIBE'
,p_static_id=>'subscribe'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	V_ALERT		VARCHAR2(5);',
'	V_RES		VARCHAR2(100);',
'BEGIN',
'  	proc_get_user_wa_status(:GLOBAL_bu,''U1'',APEX_APPLICATION.G_X01,:GLOBAL_user,v_res);',
'   COMMIT;',
'   HTP.P(''success'');',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1635297524204077648
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117258551947688674)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TEMP_ACTIVATE'
,p_static_id=>'temp-activate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'UPDATE SMS_API_TEMPLATE_CONFIG',
'  SET SATC_STATUS =''A''',
'  WHERE ROWID = APEX_APPLICATION.G_X01;',
'COMMIT;',
'HTP.P(''success'');',
'END;',
'',
'-- BEGIN',
'-- update USER_MAIL_CONFIG',
'--   set UMC_STATUS =''A''',
'--   where rowid  = APEX_APPLICATION.G_X01;',
'-- commit;',
'-- HTP.P(''success'');',
'',
'-- end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1635296716404077646
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117258995974688674)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TEMP_INACTIVE'
,p_static_id=>'temp-inactive'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'update SMS_API_TEMPLATE_CONFIG',
'  set SATC_STATUS =''I''',
'  where rowid = APEX_APPLICATION.G_X01;',
'commit;',
'HTP.P(''success'');',
'',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1635297160431077646
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117190573389688517)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7739754116312000605)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'URLDetails - Save Interactive Grid Data'
,p_static_id=>'urldetails-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Raise_application_error(-20999,:SAUC_USERNAME);',
'',
'',
'SELECT NVL(MAX(SAUC_BASE_ID),1000)+1',
'  INTO :P1925190015_BASE_ID',
'  FROM SMS_API_URL_CONFIG;',
'  ',
'IF :APEX$ROW_STATUS = ''C'' THEN',
'',
'insert into SMS_API_URL_CONFIG',
'                (SAUC_BASE_ID,',
'                SAUC_BASE_URL,',
'                SAUC_USERNAME,',
'                SAUC_PASSWORD,',
'                SAUC_SENDER_ID,',
'                SAUC_ENTITY_ID,',
'                SAUC_CRE_BY,',
'                SAUC_CRE_DATE)',
'        values(:P1925190015_BASE_ID,',
'        :SAUC_BASE_URL,',
'        :SAUC_USERNAME,',
'        :SAUC_PASSWORD,',
'        :SAUC_SENDER_ID,',
'        :SAUC_ENTITY_ID,',
'        :global_user,',
'        sysdate);',
'--ELSIF :APEX$ROW_STATUS = ''U''  THEN        ',
'--raise_application_error(-20999,''HRM'');',
'             ',
'--raise_application_error(-20999,''HRM''||''~''||:P1925190015_BASE_ID);',
'commit;',
'end if;',
'',
'BEGIN',
'',
'UPDATE SMS_API_URL_CONFIG',
'            SET SAUC_BASE_ID   = :P1925190015_BASE_ID,',
'                SAUC_BASE_URL  = :SAUC_BASE_URL,',
'                SAUC_USERNAME  = :SAUC_USERNAME,',
'                SAUC_PASSWORD  = :SAUC_PASSWORD,',
'                SAUC_SENDER_ID = :SAUC_PASSWORD,',
'                SAUC_ENTITY_ID = :SAUC_ENTITY_ID,',
'                SAUC_UPD_BY    = :GLOBAL_USER,',
'                SAUC_UPD_DATE  = SYSDATE',
'WHERE ROWID = :ROWID ; ',
'--raise_application_error(-20999,''HRM''||''~''||:SAUC_BASE_ID);',
'COMMIT;',
'END ;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>1635228737846077489
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117257803850688673)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'USER_ACTIVATE'
,p_static_id=>'user-activate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'update USER_MAIL_CONFIG',
'   set UMC_STATUS =''A''',
'  where rowid    = APEX_APPLICATION.G_X01;',
'commit;',
'HTP.P(''success'');',
'',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1635295968307077645
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117258155920688674)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'USER_INACTIVE'
,p_static_id=>'user-inactive'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'update USER_MAIL_CONFIG',
'   set UMC_STATUS =''I''',
'  where rowid =APEX_APPLICATION.G_X01;',
'commit;',
'HTP.P(''success'');',
'',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1635296320377077646
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7117259813496688676)
,p_process_sequence=>80
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'WHAT_TEMP_ACTIVATE'
,p_static_id=>'what-temp-activate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  	UPDATE WHATSAPP_API_TEMPLATES',
'  	   SET WAT_STATUS = ''A'' ',
'    where rowid    = APEX_APPLICATION.G_X01;',
'commit;',
'HTP.P(''success'');',
'',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1635297977953077648
);
wwv_flow_imp.component_end;
end;
/
