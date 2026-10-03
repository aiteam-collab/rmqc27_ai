prompt --application/pages/page_2361300102
begin
--   Manifest
--     PAGE: 2361300102
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
 p_id=>2361300102
,p_name=>'Workflow Approvals'
,p_alias=>'WORK-FLOW4'
,p_step_title=>'Work Flow '
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function delete_record(a,b,c) { ',
'    apex.server.process',
'    (  ',
'        "DELETE_ACTIVITY", ',
'        {  ',
'          x01: a, x02: b, x03: c',
'        },',
'         {',
'            dataType: ''text'', ',
'            success: function (data) { ',
'                if (data.trim() !== ''success'') {',
'                    apex.message.showErrors([{ type: "error", location: "page", message: data.replace(''sqlerrm:ORA-20999: '', ''''), unsafe: false }]);',
'                } else {',
'                    console.log(''success'', data);',
'                    apex.region("act").refresh();',
'                    apex.message.showPageSuccess("Line Deleted.");',
'                }',
'            }',
'        }',
'    );',
'/*',
'    apex.server.process',
'    (  ',
'        "DELETE_AUTH", ',
'        {  ',
'          x01: a',
'        },',
'        {',
'            dataType: ''text'', ',
'            success: function (data) { ',
'                if (data.trim() !== ''success'') {',
'                    apex.message.showErrors([{ type: "error", location: "page", message: data.replace(''sqlerrm:ORA-20999: '', ''''), unsafe: false }]);',
'                } else {',
'                    console.log(''success'', data);',
'                    apex.region("auth").refresh();',
'                    apex.message.showPageSuccess("Line Deleted.");',
'                }',
'            }',
'        }',
'    );',
'*/',
'};',
'',
'function delete_record_auth(a) { ',
'    apex.server.process',
'    (  ',
'        "DELETE_AUTH", ',
'        {  ',
'          x01: a',
'        },',
'        {',
'            dataType: ''text'', ',
'            success: function (data) { ',
'                if (data.trim() !== ''success'') {',
'                    apex.message.showErrors([{ type: "error", location: "page", message: data.replace(''sqlerrm:ORA-20999: '', ''''), unsafe: false }]);',
'                } else {',
'                    console.log(''success'', data);',
'                    apex.region("auth").refresh();',
'                    apex.message.showPageSuccess("Line Deleted.");',
'                }',
'            }',
'        }',
'    );',
'',
'};'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*.t-Region-title {',
'    font-size: small;',
'    line-height: inherit;',
'    font-weight: 400;',
'    color: #d3460df2;',
'}',
'',
'#addbtn{color: blue;}',
'',
'#savebtn{color: green;}',
'',
'.a-GV-table th.a-GV-header, .a-GV-table th.a-GV-headerGroup {',
'    font-weight: var(--a-gv-header-cell-font-weight,var(--a-base-font-weight-bold,500));',
'    background: #00b1e7;',
'    color: white;',
'    FONT: -webkit-control;',
'}*/',
'',
'.addbtn{',
'                color: blue;',
'}',
'',
'.printbtn{',
'              color: #004153;',
';',
'}',
'',
'.savebtn{',
'                color: rgb(14, 159, 45);',
'}',
'.closebtn{',
'                color: 	#FF0000;',
'}'))
,p_step_template=>wwv_flow_imp.id(6339300137962061229)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9197338588468589101)
,p_plug_name=>'Activities'
,p_static_id=>'activities'
,p_region_name=>'act'
,p_parent_plug_id=>wwv_flow_imp.id(7054960192713509940)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WFAA_BU,',
'       WFAA_WF_ID,',
'       WFAA_SEQ_NO,',
'       WFAA_DESC,',
'       WFAA_STATUS,',
'       WFAA_STATUS_DESC,',
'       WFAA_HOUR,',
'       WFAA_STATUS_DESC2,',
'       WFAA_PRINT_SEQ_NO,',
'       WFAA_MSG_TO,',
'       WFAA_HIER_TYPE,',
'       WFAA_CRE_BY,',
'       WFAA_CRE_IP_ADDR,',
'       WFAA_CRE_OS_USER,',
'       WFAA_CRE_DATE,',
'       WFAA_UPD_BY,',
'       WFAA_UPD_IP_ADDR,',
'       WFAA_UPD_OS_USER,',
'       WFAA_UPD_DATE,',
'       WFAA_CRE_EMP_ID,',
'       WFAA_UPD_EMP_ID,',
'       WFAA_IM_FLAG,',
'       WFAA_MAIL_FLAG,',
'       WFAA_SMS_FLAG,',
'       WFAA_SMS_TEMPLATE_ID,',
'       WFAA_WHATSAPP_FLAG,',
'       WFAA_WHATSAPP_TEMP_ID,',
'		 /* (SELECT rowid ',
'          FROM wf_internal_message',
'         WHERE wfim_bu     = WFAA_BU',
'           AND wfim_type   = WFAA_WF_ID ',
'           AND wfim_seq_no = wfaa_seq_no ) IM_ROWID,',
'		 (SELECT rowid ',
'          FROM wf_mail_message',
'         WHERE wfmm_bu     = WFAA_BU  ',
'           AND wfmm_type   = WFAA_WF_ID',
'           AND wfaa_seq_no = wfaa_seq_no ) MM_ROWID,',
'		 (SELECT rowid',
'          FROM wf_return_message',
'         WHERE wfrm_bu     = WFAA_BU ',
'           AND wfrm_type   = WFAA_WF_ID',
'           AND wfrm_seq_no = wfaa_seq_no) RM_ROWID,',
'		  (SELECT rowid ',
'           FROM wf_forward_message',
'          WHERE wffm_bu     = WFAA_BU ',
'            AND wffm_type   = WFAA_WF_ID',
'            AND wffm_seq_no = wfaa_seq_no )FM_ROWID,	',
'			(SELECT rowid ',
'				FROM work_flow_notify_persons  ',
'		     WHERE wfnp_bu     = WFAA_BU ',
'				 AND wfnp_wf_id  = WFAA_WF_ID',
'				 AND wfnp_seq_no = wfaa_seq_no)np_rowid,	   */',
'		 NULL I ,',
'		 NULL M,',
'		 NULL R, ',
'		 NULL F, ',
'		 NULL NP,',
'		 NULL delete_act,',
'       WFAA_DOC_NO,',
'       WFAA_DOC_REV,',
'       WFAA_ORPN_SEQ_NO',
'  from WORK_FLOW_APPR_ACTVT',
'  where WFAA_BU =:Global_bu',
'   and WFAA_WF_ID = :P2361300102_WF_BUS_PROC_ID',
'   and WFAA_DOC_NO = :P2361300102_WF_DOC_NO',
'   and WFAA_DOC_REV = :P2361300102_WF_DOC_REV',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P2361300102_WF_BUS_PROC_ID,P2361300102_WF_DOC_NO,P2361300102_WF_DOC_REV'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P2361300102_WF_STATUS'
,p_plug_read_only_when2=>'N'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Activities'
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
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table style="width:100%;">',
'  <tr>',
'    <td style="text-align:right;">',
'      <code><b style="color:#004153">IM - Internal Message</b></code>',
'      &nbsp;&nbsp;',
'      <code><b style="color:#004153">A - Approval</b></code>',
'      &nbsp;&nbsp;',
'      <code><b style="color:#004153">R - Return</b></code>',
'      &nbsp;&nbsp;',
'      <code><b style="color:#004153">F - Forward</b></code>',
'      &nbsp;&nbsp;',
'      <code><b style="color:#004153">NP - Notify Person</b></code>',
'    </td>',
'  </tr>',
'</table>'))
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(7031324091049553334)
,p_heading=>'Process'
,p_static_id=>'process'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(7031324151030553335)
,p_heading=>'Template ID'
,p_static_id=>'template-id'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9204980007344236222)
,p_name=>'A'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'M'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>310
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:2361300101:&SESSION.::&DEBUG.::P2361300101_TYPE,P2361300101_WFMM_TYPE,P2361300101_WFMM_SEQ_NO,P2361300101_ROWID_MM,P2361300101_TITLE:MM,&WFAA_WF_ID.,&WFAA_SEQ_NO.,&MM_ROWID.,Approval Mail Content'
,p_link_text=>'<span aria-hidden="true" style="color: #004153  ;font-size : 12px ;font-weight: bold">A</span>'
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
 p_id=>wwv_flow_imp.id(9197340479584589107)
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
 p_id=>wwv_flow_imp.id(9197339900793589106)
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
 p_id=>wwv_flow_imp.id(7499331758557948157)
,p_name=>'DELETE_ACT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DELETE_ACT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>350
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:delete_record(''&WFAA_ROWID.'',''&WFAA_WF_ID.'',''&WFAA_SEQ_NO.'');'
,p_link_text=>'<span class="fa fa-trash-o" aria-hidden="true" style="color:tomato"></span>'
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
,p_include_in_export=>true
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>':P2361300102_ROWID IS NOT NULL AND :P2361300102_WF_STATUS = ''E'''
,p_display_condition2=>'PLSQL'
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9204980257957236224)
,p_name=>'F'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'F'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>330
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:2361300101:&SESSION.::&DEBUG.::P2361300101_TYPE,P2361300101_WFFM_TYPE,P2361300101_WFFM_SEQ_NO,P2361300101_ROWID_FF,P2361300101_TITLE:FM,&WFAA_WF_ID.,&WFAA_SEQ_NO.,&FM_ROWID.,Forward Mail Content'
,p_link_text=>'<span aria-hidden="true" style="color: #004153  ;font-size : 12px ;font-weight: bold">F</span>'
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
 p_id=>wwv_flow_imp.id(9204979903900236221)
,p_name=>'IM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'I'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>300
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:2361300101:&SESSION.::&DEBUG.::P2361300101_WFIM_TYPE,P2361300101_WFIM_SEQ_NO,P2361300101_ROWID,P2361300101_TYPE,P2361300101_TITLE:&WFAA_WF_ID.,&WFAA_SEQ_NO.,&IM_ROWID.,IM,Internal Message.'
,p_link_text=>'<span aria-hidden="true" style="color: #004153 ;font-size : 12px ;font-weight: bold">IM</span>'
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
 p_id=>wwv_flow_imp.id(9204980368225236225)
,p_name=>'NP'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NP'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>340
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:2361300101:&SESSION.::&DEBUG.::P2361300101_TYPE,P2361300101_WORK_FLOW_ID,P2361300101_WORK_SEQ_NO,P2361300101_WORK_DOC_NO,P2361300101_TITLE:NP,&WFAA_WF_ID.,&WFAA_SEQ_NO.,&WFAA_DOC_NO.,Notify Person'
,p_link_text=>'<span aria-hidden="true" style="color: #004153 ;font-size : 12px ;font-weight: bold">NP</span>'
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
 p_id=>wwv_flow_imp.id(9204980177680236223)
,p_name=>'R'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'R'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>320
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:2361300101:&SESSION.::&DEBUG.::P2361300101_TYPE,P2361300101_WFRM_TYPE,P2361300101_WFRM_SEQ_NO,P2361300101_ROWID_RM,P2361300101_TITLE:RM,&WFAA_WF_ID.,&WFAA_SEQ_NO.,&RM_ROWID.,Return Mail Content'
,p_link_text=>'<span aria-hidden="true" style="color: #004153  ;font-size : 12px ;font-weight: bold">R</span>'
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
 p_id=>wwv_flow_imp.id(9197342394632589113)
,p_name=>'WFAA_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'WFAA_BU'
,p_heading_alignment=>'CENTER'
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
,p_default_type=>'STATIC'
,p_default_expression=>':GLOBAL_BU'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9197353480712589135)
,p_name=>'WFAA_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9197356477082589140)
,p_name=>'WFAA_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_CRE_DATE'
,p_data_type=>'DATE'
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
 p_id=>wwv_flow_imp.id(9197361407436589146)
,p_name=>'WFAA_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_CRE_EMP_ID'
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
 p_id=>wwv_flow_imp.id(9197354420685589137)
,p_name=>'WFAA_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_CRE_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(9197355479654589138)
,p_name=>'WFAA_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(9197345420904589120)
,p_name=>'WFAA_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Code Short Desc.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(7031324091049553334)
,p_use_group_for=>'BOTH'
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
,p_readonly_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_readonly_condition=>'P2361300102_WF_STATUS'
,p_readonly_condition2=>'E'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7597402981880709529)
,p_name=>'WFAA_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wfaa Doc No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>380
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>120
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
,p_default_type=>'ITEM'
,p_default_expression=>'P2361300102_WF_DOC_NO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7569736310285061371)
,p_name=>'WFAA_DOC_REV'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_DOC_REV'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Wfaa Doc Rev'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>390
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
,p_default_type=>'STATIC'
,p_default_expression=>'0'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9197352387323589134)
,p_name=>'WFAA_HIER_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_HIER_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Hierarchical Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(7031324091049553334)
,p_use_group_for=>'BOTH'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Emp. Hierarchy;E,Organization Chart ;O,User Defined;U'
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':P2361300102_WF_HIER_TYPE'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_readonly_condition=>'P2361300102_WF_STATUS'
,p_readonly_condition2=>'E'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9197348426108589126)
,p_name=>'WFAA_HOUR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_HOUR'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Hours'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(7031324091049553334)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'0'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_readonly_condition=>'P2361300102_WF_STATUS'
,p_readonly_condition2=>'E'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9197363395621589157)
,p_name=>'WFAA_IM_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_IM_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'IM'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_imp.id(7031324091049553334)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
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
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9197364404490589159)
,p_name=>'WFAA_MAIL_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_MAIL_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Mail '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_imp.id(7031324091049553334)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
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
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9197351457883589132)
,p_name=>'WFAA_MSG_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_MSG_TO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Notify To'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(7031324091049553334)
,p_use_group_for=>'BOTH'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Creator;C,Receiver;R,All;A'
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
,p_default_expression=>'A'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_readonly_condition=>'P2361300102_WF_STATUS'
,p_readonly_condition2=>'E'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(5918086058459012833)
,p_name=>'WFAA_ORPN_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_ORPN_SEQ_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Wfaa Orpn Seq No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>400
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
 p_id=>wwv_flow_imp.id(9197350442558589131)
,p_name=>'WFAA_PRINT_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_PRINT_SEQ_NO'
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
 p_id=>wwv_flow_imp.id(7790772683096944566)
,p_name=>'WFAA_ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>270
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9197344391688589118)
,p_name=>'WFAA_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(7031324091049553334)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_item_attributes=>'READONLY=READONLY'
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
,p_readonly_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_readonly_condition=>'P2361300102_WF_STATUS'
,p_readonly_condition2=>'E'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9197365391542589160)
,p_name=>'WFAA_SMS_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_SMS_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'SMS'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_imp.id(7031324091049553334)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
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
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9197366463623589163)
,p_name=>'WFAA_SMS_TEMPLATE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_SMS_TEMPLATE_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'SMS '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>290
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(7031324151030553335)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the SMS Template',
  'width', '900')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT satc_template_id,',
'       satc_template_id b',
'  FROM sms_api_template_config,',
'       sms_api_param_config',
' WHERE satc_template_id = sapc_template_no',
'   AND sapc_bu = :GLOBAL_bu',
'   AND sapc_wf_type = :P2361300102_WF_BUS_PROC_ID'))
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
 p_id=>wwv_flow_imp.id(9197346415148589121)
,p_name=>'WFAA_STATUS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_STATUS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Code'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(7031324091049553334)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>2
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
,p_readonly_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_readonly_condition=>'P2361300102_WF_STATUS'
,p_readonly_condition2=>'E'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9197347414034589124)
,p_name=>'WFAA_STATUS_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_STATUS_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Code Desc.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(7031324091049553334)
,p_use_group_for=>'BOTH'
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
,p_readonly_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_readonly_condition=>'P2361300102_WF_STATUS'
,p_readonly_condition2=>'E'
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9197349408541589127)
,p_name=>'WFAA_STATUS_DESC2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_STATUS_DESC2'
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
 p_id=>wwv_flow_imp.id(9197357387843589140)
,p_name=>'WFAA_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_UPD_BY'
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
 p_id=>wwv_flow_imp.id(9197360461581589145)
,p_name=>'WFAA_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_UPD_DATE'
,p_data_type=>'DATE'
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9197362456738589156)
,p_name=>'WFAA_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9197358457142589142)
,p_name=>'WFAA_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9197359416523589143)
,p_name=>'WFAA_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_UPD_OS_USER'
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
 p_id=>wwv_flow_imp.id(9197343404978589115)
,p_name=>'WFAA_WF_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_WF_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'WFAA_WF_ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_imp.id(7031323904109553332)
,p_name=>'WFAA_WHATSAPP_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_WHATSAPP_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Whatsapp '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>360
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_imp.id(7031324091049553334)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
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
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7031323941377553333)
,p_name=>'WFAA_WHATSAPP_TEMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAA_WHATSAPP_TEMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Whatsapp '
,p_heading_alignment=>'CENTER'
,p_display_sequence=>370
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(7031324151030553335)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Whatsapp Template',
  'width', '900')).to_clob
,p_is_required=>false
,p_max_length=>200
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT wat_template_desc,',
'        wat_template_id',
'   FROM Whatsapp_api_templates',
' WHERE wat_bu   = :GLOBAL_BU'))
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(9197339090856589104)
,p_internal_uid=>3715377255312978076
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
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(9197339528493589106)
,p_interactive_grid_id=>wwv_flow_imp.id(9197339090856589104)
,p_static_id=>'10418643'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(9197339711330589106)
,p_report_id=>wwv_flow_imp.id(9197339528493589106)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5481963165423623135)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(7790772683096944566)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5951009555876929337)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(5918086058459012833)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5959935535919854813)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(7499331758557948157)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7031392616357675417)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(7031323904109553332)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>82
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7031393500495675428)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(7031323941377553333)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>150
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7597414269001722856)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(7597402981880709529)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7603855305060462796)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(7569736310285061371)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8155476474579181527)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(9197339900793589106)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197340871104589107)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(9197340479584589107)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197342867530589115)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(9197342394632589113)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197343824478589117)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(9197343404978589115)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197344801377589118)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(9197344391688589118)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>72
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197345809637589120)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(9197345420904589120)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197346788677589121)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(9197346415148589121)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>61
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197347788069589124)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(9197347414034589124)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197348800524589127)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(9197348426108589126)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>72
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197349790511589129)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(9197349408541589127)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114.5
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197350828921589131)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(9197350442558589131)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197351876555589132)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(9197351457883589132)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>86
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197352839066589134)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(9197352387323589134)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>155
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197353838446589135)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(9197353480712589135)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197354841824589137)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(9197354420685589137)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197355852443589138)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(9197355479654589138)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197356851522589140)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(9197356477082589140)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197357836939589142)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(9197357387843589140)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197358838994589142)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(9197358457142589142)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197359855720589145)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(9197359416523589143)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197360822300589146)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(9197360461581589145)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197361858403589154)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(9197361407436589146)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197362854575589157)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(9197362456738589156)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197363816194589159)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(9197363395621589157)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>46
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197364856031589159)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(9197364404490589159)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>52
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197365859193589162)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(9197365391542589160)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>47
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9197366860281589163)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(9197366463623589163)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>121
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205375166733451790)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(9204979903900236221)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205375999095451795)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(9204980007344236222)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205376899155451801)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(9204980177680236223)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205377805203451807)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(9204980257957236224)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205378618863451812)
,p_view_id=>wwv_flow_imp.id(9197339711330589106)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(9204980368225236225)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7054960192713509940)
,p_plug_name=>'Activities / Authorization'
,p_static_id=>'activities-authorization'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8098012452967335728)
,p_plug_name=>'Administrator'
,p_static_id=>'administrator'
,p_region_name=>'ig_line'
,p_parent_plug_id=>wwv_flow_imp.id(7054960026415509939)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ROWID,',
'       WFAD_BU,',
'       WFAD_SEQ_NO,',
'       WFAD_BUS_PROC_ID,',
'       WFAD_ADMIN_POS_ID,',
'         (SELECT hrpos_pos_name1',
'           FROM hr_positions',
'          WHERE hrpos_bu     =:GLOBAL_BU',
'            AND hrpos_pos_id = WFAD_ADMIN_POS_ID)POSITION_DESC,',
'        (SELECT EMP_EMP_ID ',
'          FROM EMPLOYEES',
'         WHERE EMP_BU =:global_bu',
'           AND  EMP_POS_ID = WFAD_ADMIN_POS_ID )EMPLOYEE_ID,',
'         (SELECT EMP_FIRST_NAME1 ',
'            FROM EMPLOYEES',
'           WHERE EMP_BU      =:global_bu',
'             AND  EMP_POS_ID = (SELECT EMP_EMP_ID',
'                                  FROM EMPLOYEES',
'                                 WHERE EMP_BU     =:global_bu',
'                                   AND EMP_POS_ID = WFAD_ADMIN_POS_ID))EMPLOYEE_DESC,',
'       (SELECT EMP_DEPT_ID ',
'          FROM EMPLOYEES ',
'         WHERE EMP_BU      = :GLOBAL_BU',
'           AND  EMP_POS_ID = WFAD_ADMIN_POS_ID) DEPT_ID,',
'       (SELECT dept_name1',
'          FROM departments',
'         WHERE dept_bu = :GLOBAL_bu',
'           AND dept_id = (SELECT EMP_DEPT_ID ',
'                            FROM EMPLOYEES ',
'                           WHERE EMP_BU     = :GLOBAL_BU',
'                             AND EMP_POS_ID = WFAD_ADMIN_POS_ID)) DEPT_DESC, ',
'		 (SELECT bup_name1',
'             FROM bus_unit_plants',
'              WHERE bup_bu       = :global_BU',
'               AND BUP_PLANT_ID = WFAD_ADMIN_POS_ID) plnt,							                                ',
'WFAD_CRE_BY,',
'WFAD_CRE_IP_ADDR,',
'WFAD_CRE_OS_USER,',
'WFAD_CRE_DATE,',
'WFAD_UPD_BY,',
'WFAD_UPD_IP_ADDR,',
'WFAD_UPD_OS_USER,',
'WFAD_UPD_DATE,',
'WFAD_CRE_EMP_ID,',
'WFAD_UPD_EMP_ID',
'FROM wf_admin_details',
'WHERE WFAD_BU = :global_BU ',
'AND WFAD_BUS_PROC_ID = :P2361300102_WF_BUS_PROC_ID',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Administrator'
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
 p_id=>wwv_flow_imp.id(8098014292228335732)
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
 p_id=>wwv_flow_imp.id(8098013760172335731)
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
 p_id=>wwv_flow_imp.id(8135072876503615443)
,p_name=>'DEPT_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEPT_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Dept. Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
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
 p_id=>wwv_flow_imp.id(8135072792833615442)
,p_name=>'DEPT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEPT_ID'
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
 p_id=>wwv_flow_imp.id(8135072718210615441)
,p_name=>'EMPLOYEE_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMPLOYEE_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Employee Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>60
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
 p_id=>wwv_flow_imp.id(8135072585033615440)
,p_name=>'EMPLOYEE_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMPLOYEE_ID'
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
 p_id=>wwv_flow_imp.id(8135073018589615444)
,p_name=>'PLNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PLNT'
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
 p_id=>wwv_flow_imp.id(8135072426985615439)
,p_name=>'POSITION_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'POSITION_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Name'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8098015261562335732)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8098019238848335739)
,p_name=>'WFAD_ADMIN_POS_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_ADMIN_POS_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Position'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(6525141674430216387)
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'WFAD_BUS_PROC_ID'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8098016306070335737)
,p_name=>'WFAD_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
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
 p_id=>wwv_flow_imp.id(8098018237116335739)
,p_name=>'WFAD_BUS_PROC_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_BUS_PROC_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8098020230743335740)
,p_name=>'WFAD_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_CRE_BY'
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
 p_id=>wwv_flow_imp.id(8098023256203335743)
,p_name=>'WFAD_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_CRE_DATE'
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
 p_id=>wwv_flow_imp.id(8098028318524335750)
,p_name=>'WFAD_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_CRE_EMP_ID'
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
 p_id=>wwv_flow_imp.id(8098021228735335742)
,p_name=>'WFAD_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_CRE_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(8098022306737335743)
,p_name=>'WFAD_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(8098017314902335737)
,p_name=>'WFAD_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
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
 p_id=>wwv_flow_imp.id(8098024273808335745)
,p_name=>'WFAD_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
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
 p_id=>wwv_flow_imp.id(8098027277864335750)
,p_name=>'WFAD_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_UPD_DATE'
,p_data_type=>'DATE'
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
,p_default_expression=>'sysdate'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8098029244818335751)
,p_name=>'WFAD_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_UPD_EMP_ID'
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
 p_id=>wwv_flow_imp.id(8098025274553335747)
,p_name=>'WFAD_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_UPD_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(8098026316779335748)
,p_name=>'WFAD_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFAD_UPD_OS_USER'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(8098013016830335729)
,p_internal_uid=>2616051181286724701
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(8098013379164335729)
,p_interactive_grid_id=>wwv_flow_imp.id(8098013016830335729)
,p_static_id=>'10422492'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(8098013580204335731)
,p_report_id=>wwv_flow_imp.id(8098013379164335729)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5955838152809240040)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(8098013760172335731)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8098014687375335732)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(8098014292228335732)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8098015645061335734)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(8098015261562335732)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8098016681342335737)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(8098016306070335737)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8098017636664335737)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(8098017314902335737)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8098018657316335739)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(8098018237116335739)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8098019672861335739)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(8098019238848335739)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>94
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8098020708648335742)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(8098020230743335740)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8098021711178335742)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(8098021228735335742)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8098022722338335743)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(8098022306737335743)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8098023663541335745)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(8098023256203335743)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8098024683066335745)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(8098024273808335745)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8098025643351335748)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(8098025274553335747)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8098026658931335748)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(8098026316779335748)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8098027670270335750)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(8098027277864335750)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8098028723694335751)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(8098028318524335750)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8098029697958335754)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(8098029244818335751)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8136252044187259340)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(8135072426985615439)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>222
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8136254505707259348)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(8135072585033615440)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8136256841330259354)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(8135072718210615441)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8136259236493259362)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(8135072792833615442)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8136261667201259368)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(8135072876503615443)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8136264052553259376)
,p_view_id=>wwv_flow_imp.id(8098013580204335731)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(8135073018589615444)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9204997604706238432)
,p_plug_name=>'Authorization'
,p_static_id=>'authorization'
,p_region_name=>'auth'
,p_parent_plug_id=>wwv_flow_imp.id(7054960192713509940)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WFDA_BU,',
'       WFDA_TYPE,',
'       WFDA_POSITION,',
'       CASE WHEN :P2361300102_WF_AUTH_TYPE = ''E'' THEN (SELECT TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1)',
'                                            FROM employees',
'                                           WHERE emp_bu = WFDA_BU',
'                                             AND emp_emp_id = wfda_position)',
'            WHEN :P2361300102_WF_AUTH_TYPE = ''P'' THEN (SELECT hrpos_pos_name1',
'                                            FROM hr_positions',
'                                           WHERE hrpos_bu = WFDA_BU',
'                                             AND hrpos_pos_id = wfda_position)',
'       END wfda_pos_name  ,             ',
'       WFDA_DATE_FROM,',
'       WFDA_DATE_TO,',
'       WFDA_SEQ_NO,',
'       WFDA_VALUE,',
'       WFDA_AOD_FLAG,',
'       WFDA_MOBILE_NO,',
'       WFDA_PLNT,',
'       WFDA_SUB_SEQ_NO,',
'       WFDA_APPR_BU,',
'       WFDA_DISC_PCT,',
'       WFDA_DFLT_FLAG,',
'       WFDA_CRE_BY,',
'       WFDA_CRE_IP_ADDR,',
'       WFDA_CRE_OS_USER,',
'       WFDA_CRE_DATE,',
'       WFDA_UPD_BY,',
'       WFDA_UPD_IP_ADDR,',
'       WFDA_UPD_OS_USER,',
'       WFDA_UPD_DATE,',
'       WFDA_CRE_EMP_ID,',
'       WFDA_UPD_EMP_ID,',
'       WFDA_MAIL_OPT_FLAG,',
'       WFDA_SENDER_MAIL,',
'		 NULL pfx, ',
'		 NULL cs, ',
'		 NULL rl,',
'		 NULL delete_dir_auth,',
'       WFDA_DOC_NO',
'  from WF_DIRECT_AUTHORIZATION',
'  where WFDA_BU = :Global_bu',
'	--  and wfda_type = :P2361300102_WF_TYPE   ',
'	 --and wfda_seq_no = :P2361300102_SEQ_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(9197338588468589101)
,p_ajax_items_to_submit=>'P2361300102_WF_AUTH_TYPE,P2361300102_WF_EFF_FROM,P2361300102_WF_EFF_TO'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_plug_read_only_when=>'P2361300102_WF_STATUS'
,p_plug_read_only_when2=>'E'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Authorization'
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
 p_id=>wwv_flow_imp.id(9205001560303238471)
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
 p_id=>wwv_flow_imp.id(9205001626923238472)
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
 p_id=>wwv_flow_imp.id(9205800097811595646)
,p_name=>'CS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>310
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:2361300101:&SESSION.::&DEBUG.::P2361300101_TYPE,P2361300101_PFX_WF_ID,P2361300101_PFX_SEQ_NO,P2361300101_PFX_SUBSEQ_NO:SC,&WFDA_TYPE.,&WFDA_SEQ_NO.,&WFDA_SUB_SEQ_NO.'
,p_link_text=>'<span aria-hidden="true" style="color: blue ;font-size : 12px ;font-weight: bold">CS</span>'
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
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7499332135238948161)
,p_name=>'DELETE_DIR_AUTH'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DELETE_DIR_AUTH'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>330
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:delete_record_auth(''&WFDA_ROWID.'');'
,p_link_text=>'<span class="fa fa-trash-o" aria-hidden="true" style="color:tomato"></span>'
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
,p_include_in_export=>true
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>':P2361300102_ROWID IS NOT NULL AND :P2361300102_WF_STATUS = ''E'''
,p_display_condition2=>'PLSQL'
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9205800085196595645)
,p_name=>'PFX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PFX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>300
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:2361300101:&SESSION.::&DEBUG.::P2361300101_TYPE,P2361300101_PFX_WF_ID,P2361300101_PFX_SEQ_NO,P2361300101_PFX_SUBSEQ_NO:PFX,&WFDA_TYPE.,&WFDA_SEQ_NO.,&WFDA_SUB_SEQ_NO.'
,p_link_text=>'<span aria-hidden="true" style="color: blue ;font-size : 12px ;font-weight: bold">Pfx.</span>'
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
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9205800274146595647)
,p_name=>'RL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'&nbsp;'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>320
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:2361300101:&SESSION.::&DEBUG.::P2361300101_TYPE,P2361300101_PFX_WF_ID,P2361300101_PFX_SEQ_NO,P2361300101_PFX_SUBSEQ_NO:ROLE,&WFDA_TYPE.,&WFDA_SEQ_NO.,&WFDA_SUB_SEQ_NO.'
,p_link_text=>'<span aria-hidden="true" style="color: blue ;font-size : 12px ;font-weight: bold">RL</span>'
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
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9204998591649238441)
,p_name=>'WFDA_AOD_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_AOD_FLAG'
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
 p_id=>wwv_flow_imp.id(9204998993308238445)
,p_name=>'WFDA_APPR_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_APPR_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Entity'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Entity')).to_clob
,p_is_required=>false
,p_max_length=>5
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(6581793269360069601)
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
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':Global_bu'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9204997878580238434)
,p_name=>'WFDA_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'WFDA_BU'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(9197342394632589113)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9204999246203238448)
,p_name=>'WFDA_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_CRE_BY'
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
 p_id=>wwv_flow_imp.id(9204999567971238451)
,p_name=>'WFDA_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9205000004158238456)
,p_name=>'WFDA_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>270
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9204999310708238449)
,p_name=>'WFDA_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9204999436374238450)
,p_name=>'WFDA_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(9204998175034238437)
,p_name=>'WFDA_DATE_FROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_DATE_FROM'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'From'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(9204998248014238438)
,p_name=>'WFDA_DATE_TO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_DATE_TO'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'To'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(9204999143387238447)
,p_name=>'WFDA_DFLT_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_DFLT_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Default'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
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
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9204999071296238446)
,p_name=>'WFDA_DISC_PCT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_DISC_PCT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Disc. Pct.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
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
,p_readonly_condition_type=>'EXISTS'
,p_readonly_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wf_disc_pct_based_flag',
'  FROM work_flow',
' WHERE wf_bu          = :Global_bu',
'   AND wf_bus_proc_id = :WFDA_TYPE',
'   AND wf_disc_pct_based_flag = ''N'''))
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7597403067940709530)
,p_name=>'WFDA_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'WFDA_DOC_NO'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>350
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(7597402981880709529)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9205000208325238458)
,p_name=>'WFDA_MAIL_OPT_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_MAIL_OPT_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Mail'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
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
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9204998678284238442)
,p_name=>'WFDA_MOBILE_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_MOBILE_NO'
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
 p_id=>wwv_flow_imp.id(9204998697688238443)
,p_name=>'WFDA_PLNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_PLNT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Unit'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select Unit')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  bup_name1,bup_plant_id',
'   FROM  business_units,',
'             bus_unit_plants,',
'             appl_users,',
'             appl_user_plant_access',
' WHERE bup_bu = bu_id',
'     AND bup_bu = appluser_bu',
'     AND bup_bu = auba_bu',
'     AND bup_plant_id = auba_plant',
'     AND auba_user_id = appluser_id',
'     AND bup_bu = :global_bu ---:wfda_appr_bu',
'     AND appluser_status = ''A''',
'     AND TRUNC(SYSDATE) BETWEEN TRUNC(appluser_eff_From) AND TRUNC(appluser_eff_to) ',
'     AND TRUNC(SYSDATE) BETWEEN auba_from AND auba_to',
'     AND :P2361300102_WF_BASIS = ''U''',
' GROUP BY bup_plant_id,bup_name1',
'ORDER BY bup_name1 ASC'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'WFDA_APPR_BU'
,p_ajax_items_to_submit=>'P2361300102_WF_BASIS'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_readonly_condition_type=>'EXISTS'
,p_readonly_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wf_basis',
'  FROM work_flow',
' WHERE wf_bu          = :Global_bu',
'   AND wf_bus_proc_id = :WFDA_TYPE',
'   AND wf_basis       = ''E'''))
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9204998007060238436)
,p_name=>'WFDA_POSITION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_POSITION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Emp. ID'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Employee / Position',
  'width', '800')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(6581794790389069604)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'WFDA_APPR_BU,WFDA_TYPE'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(7031323586514553329)
,p_name=>'WFDA_POS_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_POS_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Emp. Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>340
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>122
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
 p_id=>wwv_flow_imp.id(9205000433219238460)
,p_name=>'WFDA_ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>290
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9205000349761238459)
,p_name=>'WFDA_SENDER_MAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_SENDER_MAIL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sender Mail'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9204998385132238439)
,p_name=>'WFDA_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'WFDA_SEQ_NO'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(9197344391688589118)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9204998827345238444)
,p_name=>'WFDA_SUB_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_SUB_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_enable_filter=>true
,p_filter_text_case=>'MIXED'
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
 p_id=>wwv_flow_imp.id(9204997936882238435)
,p_name=>'WFDA_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'WFDA_TYPE'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(9197343404978589115)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9204999605136238452)
,p_name=>'WFDA_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_UPD_BY'
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
 p_id=>wwv_flow_imp.id(9204999943393238455)
,p_name=>'WFDA_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_format_mask=>'DD-MON-YYYY HH24:MI:SS'
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9205000173767238457)
,p_name=>'WFDA_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>280
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9204999764623238453)
,p_name=>'WFDA_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9204999838058238454)
,p_name=>'WFDA_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_UPD_OS_USER'
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
 p_id=>wwv_flow_imp.id(9204998462392238440)
,p_name=>'WFDA_VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFDA_VALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Value'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
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
,p_readonly_condition_type=>'EXISTS'
,p_readonly_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wf_val_based_flag',
'  FROM work_flow',
' WHERE wf_bu          = :Global_bu',
'   AND wf_bus_proc_id = :WFDA_TYPE',
'   AND wf_val_based_flag = ''N'''))
,p_readonly_for_each_row=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(9204997707080238433)
,p_internal_uid=>3723035871536627405
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
 p_id=>wwv_flow_imp.id(9205545370999505369)
,p_interactive_grid_id=>wwv_flow_imp.id(9204997707080238433)
,p_static_id=>'10500529'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(9205545589103505369)
,p_report_id=>wwv_flow_imp.id(9205545370999505369)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5955931428594419883)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(7499332135238948161)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7031329723979553788)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(7031323586514553329)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>180
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7597428667680744445)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(7597403067940709530)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>103
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8155498122625183734)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(9205001626923238472)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205546048204505371)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(9204997878580238434)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>99
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205546910158505374)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(9204997936882238435)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>114
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205547800305505377)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(9204998007060238436)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205548753682505380)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(9204998175034238437)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>101
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205549628912505383)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(9204998248014238438)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205550542415505387)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(9204998385132238439)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>111
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205551452707505390)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(9204998462392238440)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>128
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205552378913505393)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(9204998591649238441)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205553198878505396)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(9204998678284238442)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205554175739505405)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(9204998697688238443)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>57
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205555035421505408)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(9204998827345238444)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>68
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205555892938505415)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(9204998993308238445)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>77
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205556709988505419)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(9204999071296238446)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205557663336505421)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(9204999143387238447)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>61
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205558570619505424)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(9204999246203238448)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205559455113505427)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(9204999310708238449)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205560341167505430)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(9204999436374238450)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205561197476505433)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(9204999567971238451)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205562154828505437)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(9204999605136238452)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205563027557505440)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(9204999764623238453)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205563995448505443)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(9204999838058238454)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205564801109505444)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(9204999943393238455)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205565756406505448)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(9205000004158238456)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205566650481505451)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(9205000173767238457)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205567548534505454)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(9205000208325238458)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>46
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205568412362505457)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(9205000349761238459)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>147
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205569342476505460)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(9205000433219238460)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9205781637847591843)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(9205001560303238471)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9207880400472012012)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(9205800085196595645)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9207881826858012018)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(9205800097811595646)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9207883224209012024)
,p_view_id=>wwv_flow_imp.id(9205545589103505369)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(9205800274146595647)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>47
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5925017692102959277)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder:margin-top-none:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8085635366724776768)
,p_plug_name=>'Mail File Name'
,p_static_id=>'mail-file-name'
,p_region_name=>'ig_line2'
,p_parent_plug_id=>wwv_flow_imp.id(7054960026415509939)
,p_region_template_options=>'#DEFAULT#:t-Form--leftLabels'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>70
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid,',
'       WFMFN_BU,',
'       WFMFN_WF_TYPE,',
'       WFMFN_BENF_ID_REQ,',
'       WFMFN_DOC_NO_REQ,',
'       WFMFN_WF_TYPE_NAME_REQ,',
'       WFMFN_USER_ID_REQ,',
'       WFMFN_CRE_BY,',
'       WFMFN_CRE_IP_ADDR,',
'       WFMFN_CRE_OS_USER,',
'       WFMFN_CRE_DATE,',
'       WFMFN_UPD_BY,',
'       WFMFN_UPD_IP_ADDR,',
'       WFMFN_UPD_OS_USER,',
'       WFMFN_UPD_DATE,',
'       WFMFN_CRE_EMP_ID,',
'       WFMFN_UPD_EMP_ID',
'  from WF_MAIL_FILE_NAME',
'  where WFMFN_BU = :global_BU ',
'  AND  WFMFN_WF_TYPE =:P2361300102_WF_BUS_PROC_ID'))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7008665027900707729)
,p_plug_name=>'&P2361300102_DISPLAY.'
,p_static_id=>'p2361300102-display'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WF_BU,',
'       WF_SEQ_NO,',
'       WF_BUS_PROC_ID,',
'       WF_BUS_PROC_DESC,',
'       WF_BUS_PROC_DESC2,',
'       WF_MAIL_FLAG,',
'       WF_INT_MSG_FLAG,',
'       WF_SMS_FLAG,',
'       WF_REPORT_ID,',
'       WF_CALL_FORM,',
'       WF_AUTH_TYPE,',
'       WF_BASIS,',
'       WF_APPL,',
'       WF_VAL_BASED_FLAG,',
'       WF_MODULE,',
'       WF_MOD_SEQ_NO,',
'       WF_CLS_BASED,',
'       WF_DISC_PCT_BASED_FLAG,',
'       WF_PRINT_SEQ_NO,',
'       WF_HIER_TYPE,',
'       WF_CRE_BY,',
'       WF_CRE_IP_ADDR,',
'       WF_CRE_OS_USER,',
'       WF_CRE_DATE,',
'       WF_UPD_BY,',
'       WF_UPD_IP_ADDR,',
'       WF_UPD_OS_USER,',
'       WF_UPD_DATE,',
'       WF_SELF_APPR_FLAG,',
'       WF_CRE_EMP_ID,',
'       WF_UPD_EMP_ID,',
'       WF_PROJ_BASED_FLAG,',
'       WF_APPR_BASIS,',
'       WF_VERT_TYPE,',
'       WF_MAIL_SEND_OPT,',
'       WF_SMS_SEND_OPT,',
'       WF_APEX_PAGE_NO,',
'       WF_APEX_APPL_NO,',
'       WF_DOC_NO,',
'       WF_DOC_REV,',
'       WF_DOC_DATE,',
'       WF_EFF_FROM,',
'       WF_EFF_TO,',
'       WF_STATUS',
'  from WORK_FLOW',
' where WF_BU =:Global_bu  '))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8122933263911787182)
,p_plug_name=>'Reports'
,p_static_id=>'reports'
,p_region_name=>'ig_line1'
,p_parent_plug_id=>wwv_flow_imp.id(7054960026415509939)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>80
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WFR_BU,',
'       WFR_WF_ID,',
'       WFR_REPORT_ID,',
'       WFR_REPORT_DESC,',
'       WFR_CRE_BY,',
'       WFR_CRE_EMP_ID,',
'       WFR_CRE_IP_ADDR,',
'       WFR_CRE_OS_USER,',
'       WFR_CRE_DATE,',
'       WFR_UPD_BY,',
'       WFR_UPD_EMP_ID,',
'       WFR_UPD_IP_ADDR,',
'       WFR_UPD_OS_USER,',
'       WFR_UPD_DATE',
'  from WORK_FLOW_REPORTS',
'     WHERE WFR_BU = :global_BU ',
'	  AND WFR_WF_ID = :P2361300102_WF_BUS_PROC_ID'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Reports'
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
 p_id=>wwv_flow_imp.id(8122935014953787199)
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
 p_id=>wwv_flow_imp.id(8122935072127787200)
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
 p_id=>wwv_flow_imp.id(8122934848917787198)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8122933527845787184)
,p_name=>'WFR_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_BU'
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
 p_id=>wwv_flow_imp.id(8122933903614787188)
,p_name=>'WFR_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_CRE_BY'
,p_data_type=>'VARCHAR2'
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
,p_default_expression=>':global_user'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8122934323324787192)
,p_name=>'WFR_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_CRE_DATE'
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
 p_id=>wwv_flow_imp.id(8122934027492787189)
,p_name=>'WFR_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8122934068023787190)
,p_name=>'WFR_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_CRE_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(8122934223715787191)
,p_name=>'WFR_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(8122933764380787187)
,p_name=>'WFR_REPORT_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_REPORT_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Description'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8122933692755787186)
,p_name=>'WFR_REPORT_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_REPORT_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Report'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_imp.id(8122934364785787193)
,p_name=>'WFR_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
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
 p_id=>wwv_flow_imp.id(8122934816592787197)
,p_name=>'WFR_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_UPD_DATE'
,p_data_type=>'DATE'
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
,p_default_expression=>'sysdate'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8122934451155787194)
,p_name=>'WFR_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_UPD_EMP_ID'
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
 p_id=>wwv_flow_imp.id(8122934558120787195)
,p_name=>'WFR_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_UPD_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(8122934694167787196)
,p_name=>'WFR_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8122933585843787185)
,p_name=>'WFR_WF_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WFR_WF_ID'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(8122933378215787183)
,p_internal_uid=>2640971542672176155
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
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
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(8133652746738347932)
,p_interactive_grid_id=>wwv_flow_imp.id(8122933378215787183)
,p_static_id=>'10778649'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(8133652968123347932)
,p_report_id=>wwv_flow_imp.id(8133652746738347932)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5955838930319240050)
,p_view_id=>wwv_flow_imp.id(8133652968123347932)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(8122935072127787200)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8133653496304347934)
,p_view_id=>wwv_flow_imp.id(8133652968123347932)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(8122933527845787184)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8133654386904347940)
,p_view_id=>wwv_flow_imp.id(8133652968123347932)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(8122933585843787185)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8133655250918347945)
,p_view_id=>wwv_flow_imp.id(8133652968123347932)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(8122933692755787186)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>502.297
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8133656180500347948)
,p_view_id=>wwv_flow_imp.id(8133652968123347932)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(8122933764380787187)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>790.00025
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8133657063480347951)
,p_view_id=>wwv_flow_imp.id(8133652968123347932)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(8122933903614787188)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8133657953494347954)
,p_view_id=>wwv_flow_imp.id(8133652968123347932)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(8122934027492787189)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8133658890048347960)
,p_view_id=>wwv_flow_imp.id(8133652968123347932)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(8122934068023787190)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8133659822538347967)
,p_view_id=>wwv_flow_imp.id(8133652968123347932)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(8122934223715787191)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8133660649815347971)
,p_view_id=>wwv_flow_imp.id(8133652968123347932)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(8122934323324787192)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8133661584850347978)
,p_view_id=>wwv_flow_imp.id(8133652968123347932)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(8122934364785787193)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8133662478770347982)
,p_view_id=>wwv_flow_imp.id(8133652968123347932)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(8122934451155787194)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8133663384631347989)
,p_view_id=>wwv_flow_imp.id(8133652968123347932)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(8122934558120787195)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8133664333319347996)
,p_view_id=>wwv_flow_imp.id(8133652968123347932)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(8122934694167787196)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8133665232332348003)
,p_view_id=>wwv_flow_imp.id(8133652968123347932)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(8122934816592787197)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8133666125483348009)
,p_view_id=>wwv_flow_imp.id(8133652968123347932)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(8122934848917787198)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8133667015949348014)
,p_view_id=>wwv_flow_imp.id(8133652968123347932)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(8122935014953787199)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>43.31200000000001
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7054960026415509939)
,p_plug_name=>'Tab'
,p_static_id=>'tab'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_imp.id(10650524481825505371)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_required_patch=>wwv_flow_imp.id(7031259516264491845)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5955896568097240434)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8098012452967335728)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5955906455605240470)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8122933263911787182)
,p_button_name=>'add'
,p_static_id=>'add-2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5955852751896240232)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9197338588468589101)
,p_button_name=>'Add_act'
,p_static_id=>'add-act'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Act'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P2361300102_WF_STATUS =''E'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5955869898142240317)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9204997604706238432)
,p_button_name=>'add_auth'
,p_static_id=>'add-auth'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Auth'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>' :P2361300102_WF_STATUS = ''E'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5925017829840959278)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5925017692102959277)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:236131010:&SESSION.::&DEBUG.:::'
,p_button_condition=>'P2361300102_WF_NO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7031326679273553360)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(5925017692102959277)
,p_button_name=>'Cancel'
,p_static_id=>'cancel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_confirm_message=>'Do you want to cancel the document?'
,p_button_condition=>':P2361300102_WF_DOC_NO IS NOT NULL AND :P2361300102_WF_STATUS = ''E'' AND 1=2'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-window-close'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5955852356559240228)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(9197338588468589101)
,p_button_name=>'down_act'
,p_static_id=>'down-act'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Down Act'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P2361300102_WF_DOC_NO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5955870732930240317)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9204997604706238432)
,p_button_name=>'down_auth'
,p_static_id=>'down-auth'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Down Auth'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P2361300102_WF_DOC_NO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5955897359027240435)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(8098012452967335728)
,p_button_name=>'Download'
,p_static_id=>'download'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5955906061291240468)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(8122933263911787182)
,p_button_name=>'download'
,p_static_id=>'download-2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7031326586425553359)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(5925017692102959277)
,p_button_name=>'Entry_completed'
,p_static_id=>'entry-completed'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'EDIT'
,p_button_condition=>':P2361300102_WF_STATUS = ''E'' AND :P2361300102_ROWID IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-send'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7028354751068389175)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(5925017692102959277)
,p_button_name=>'First'
,p_static_id=>'first'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'First'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:2361300102:&SESSION.::&DEBUG.::P2361300102_ROWID:&GLOBAL_FIRST_ROWID.'
,p_button_condition=>'P2361300102_WF_STATUS'
,p_button_condition2=>'N'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_icon_css_classes=>'fa-angle-double-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5501945449506237933)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(5925017692102959277)
,p_button_name=>'Go_To_Report'
,p_static_id=>'go-to-report'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Go To Report'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:2361300103:&SESSION.::&DEBUG.::P2361300103_SHOW_DATA,P2361300103_WORK_FLOW_NAME:Y,&P2361300102_TEST.'
,p_button_condition=>'P2361300102_WF_NO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-list'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7028355064132389178)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(5925017692102959277)
,p_button_name=>'Last'
,p_static_id=>'last'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Last'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:2361300102:&SESSION.::&DEBUG.::P2361300102_ROWID:&GLOBAL_LAST_ROWID.'
,p_button_condition=>'P2361300102_WF_STATUS'
,p_button_condition2=>'N'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_icon_css_classes=>'fa-angle-double-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7028354992916389177)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(5925017692102959277)
,p_button_name=>'Next'
,p_static_id=>'next'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:2361300102:&SESSION.::&DEBUG.::P2361300102_ROWID:&GLOBAL_NEXT_ROWID.'
,p_button_condition=>':P2361300102_WF_STATUS <> ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-angle-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7028354857042389176)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(5925017692102959277)
,p_button_name=>'Previous'
,p_static_id=>'previous'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Previous'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:2361300102:&SESSION.::&DEBUG.::P2361300102_ROWID:&GLOBAL_PREV_ROWID.'
,p_button_condition=>':P2361300102_WF_STATUS <> ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-angle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5955875750714240351)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_button_name=>'save3'
,p_static_id=>'save'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save3'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5955896948623240434)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8098012452967335728)
,p_button_name=>'Save'
,p_static_id=>'save-2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5955906884612240471)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8122933263911787182)
,p_button_name=>'save'
,p_static_id=>'save-3'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5955853196884240232)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9197338588468589101)
,p_button_name=>'save_act'
,p_static_id=>'save-act'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Act'
,p_button_position=>'EDIT'
,p_button_condition=>':P2361300102_WF_STATUS =''E'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'onclick="save_row(''act'')"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5955870280448240317)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9204997604706238432)
,p_button_name=>'save_auth'
,p_static_id=>'save-auth'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Auth'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P2361300102_WF_STATUS = ''E'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5560483414114092429)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5925017692102959277)
,p_button_name=>'Search'
,p_static_id=>'search'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:2361300103:&SESSION.::&DEBUG.:::'
,p_button_condition=>'P2361300102_WF_NO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7028352470268389152)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(5925017692102959277)
,p_button_name=>'Wf_add'
,p_static_id=>'wf-add'
,p_button_static_id=>'addbtn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:2361300102:&SESSION.::&DEBUG.::GLOBAL_FIRST_ROWID,GLOBAL_LAST_ROWID,GLOBAL_NEXT_ROWID,GLOBAL_PREV_ROWID:,,,'
,p_button_condition_type=>'NEVER'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7028352596607389153)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(5925017692102959277)
,p_button_name=>'Wf_save'
,p_static_id=>'wf-save'
,p_button_static_id=>'savebtn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'EDIT'
,p_button_condition=>'P2361300102_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7031324432449553337)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(5925017692102959277)
,p_button_name=>'Wf_update'
,p_static_id=>'wf-update'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'EDIT'
,p_button_condition=>':P2361300102_ROWID IS NOT NULL AND :P2361300102_WF_STATUS = ''E'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7580528369449267836)
,p_branch_name=>'GO TO PAGE 2361300102 - Old'
,p_branch_action=>'f?p=&APP_ID.:2361300102:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7590684905845715763)
,p_branch_name=>'GO TO PAGE 236131090'
,p_branch_action=>'f?p=&APP_ID.:236131090:&SESSION.::&DEBUG.:236131090:P236131090_P_DOC_NO,P236131090_P_WF_TYPE,P236131090_P_DATE,P236131090_P_PAGE_ID:&P2361300102_WF_DOC_NO.,WF_WORK_FLOW,&P2361300102_WF_DOC_DATE.,2361300103&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(7031326586425553359)
,p_branch_sequence=>30
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>':P2361300102_WF_COUNT = ''FORWARD'''
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7590684956098715764)
,p_branch_name=>'GO TO PAGE 2361300103- New'
,p_branch_action=>'f?p=&APP_ID.:2361300103:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(7031326586425553359)
,p_branch_sequence=>10
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>':P2361300102_WF_COUNT = ''DIRECT'''
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7790771284283944552)
,p_name=>'P2361300102_CNT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9197338588468589101)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7028352010557389147)
,p_name=>'P2361300102_DISPLAY'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008669653273707776)
,p_name=>'P2361300102_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7055821553986779591)
,p_name=>'P2361300102_ROWID_1'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_source_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7499366794246948451)
,p_name=>'P2361300102_SEQ_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(9204997604706238432)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5907761677759299363)
,p_name=>'P2361300102_TEST'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7499348639222948359)
,p_name=>'P2361300102_WFAA_SEQ_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9197338588468589101)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7499348529026948358)
,p_name=>'P2361300102_WFAA_WF_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9197338588468589101)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7055755099436725563)
,p_name=>'P2361300102_WFDA_SEQ_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9204997604706238432)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7499366444491948448)
,p_name=>'P2361300102_WFDA_SUB_SEQ_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9204997604706238432)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7055754616635725561)
,p_name=>'P2361300102_WFDA_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9204997604706238432)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7055816016136779577)
,p_name=>'P2361300102_WFMFN_BENF_ID_REQ'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_source_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_default=>'N'
,p_prompt=>'Required Benef. ID'
,p_source=>'WFMFN_BENF_ID_REQ'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Yes;Y,No;N'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7055815190912779576)
,p_name=>'P2361300102_WFMFN_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_source_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_default=>':global_bu'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFMFN_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7055817492956779584)
,p_name=>'P2361300102_WFMFN_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_source_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_default=>':global_user'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFMFN_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7055818755585779587)
,p_name=>'P2361300102_WFMFN_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_source_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFMFN_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7055820699716779588)
,p_name=>'P2361300102_WFMFN_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_source_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_source=>'WFMFN_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7055817861917779584)
,p_name=>'P2361300102_WFMFN_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_source_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_source=>'WFMFN_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7055818313151779585)
,p_name=>'P2361300102_WFMFN_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_source_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_source=>'WFMFN_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7055816367874779577)
,p_name=>'P2361300102_WFMFN_DOC_NO_REQ'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_source_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_default=>'N'
,p_prompt=>'Required Doc. No.'
,p_source=>'WFMFN_DOC_NO_REQ'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Yes;Y,No;N'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7055819136785779587)
,p_name=>'P2361300102_WFMFN_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_source_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_default=>':global_user'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFMFN_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7055820348612779588)
,p_name=>'P2361300102_WFMFN_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_source_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'WFMFN_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7055821097658779588)
,p_name=>'P2361300102_WFMFN_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_source_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_source=>'WFMFN_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7055819531713779587)
,p_name=>'P2361300102_WFMFN_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_source_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_source=>'WFMFN_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7055819932393779587)
,p_name=>'P2361300102_WFMFN_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_source_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_source=>'WFMFN_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7055817104330779584)
,p_name=>'P2361300102_WFMFN_USER_ID_REQ'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_source_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_default=>'N'
,p_prompt=>'Required User ID'
,p_source=>'WFMFN_USER_ID_REQ'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Yes;Y,No;N'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7055815614020779577)
,p_name=>'P2361300102_WFMFN_WF_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_source_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_source=>'WFMFN_WF_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7055816816594779577)
,p_name=>'P2361300102_WFMFN_WF_TYPE_NAME_REQ'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_source_plug_id=>wwv_flow_imp.id(8085635366724776768)
,p_item_default=>'N'
,p_prompt=>'Required Workflow Name'
,p_source=>'WFMFN_WF_TYPE_NAME_REQ'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Yes;Y,No;N'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008668857220707768)
,p_name=>'P2361300102_WF_APEX_APPL_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source=>'WF_APEX_APPL_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008668786440707767)
,p_name=>'P2361300102_WF_APEX_PAGE_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source=>'WF_APEX_PAGE_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008666342106707743)
,p_name=>'P2361300102_WF_APPL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source=>'WF_APPL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008668430746707763)
,p_name=>'P2361300102_WF_APPR_BASIS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_default=>'N'
,p_source=>'WF_APPR_BASIS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008666137170707741)
,p_name=>'P2361300102_WF_AUTH_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_default=>'E'
,p_source=>'WF_AUTH_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008666304816707742)
,p_name=>'P2361300102_WF_BASIS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_default=>'U'
,p_source=>'WF_BASIS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7031325784209553351)
,p_name=>'P2361300102_WF_BASIS_DESC'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_prompt=>'Auth. Basis'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonlly'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008665226639707731)
,p_name=>'P2361300102_WF_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source=>'WF_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008665471085707734)
,p_name=>'P2361300102_WF_BUS_PROC_DESC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_prompt=>'Work Flow Name'
,p_source=>'WF_BUS_PROC_DESC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'readonly=readonlly'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008665580132707735)
,p_name=>'P2361300102_WF_BUS_PROC_DESC2'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source=>'WF_BUS_PROC_DESC2'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008665359575707733)
,p_name=>'P2361300102_WF_BUS_PROC_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_prompt=>'Work Flow Id'
,p_source=>'WF_BUS_PROC_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_WORK_FLOW'
,p_cSize=>30
,p_cMaxlength=>15
,p_colspan=>2
,p_read_only_when=>'P2361300102_ROWID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
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
  'title', 'Select the Work Flow',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7055718204379723272)
,p_name=>'P2361300102_WF_BUS_PROC_ID_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9197338588468589101)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008666052599707740)
,p_name=>'P2361300102_WF_CALL_FORM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source=>'WF_CALL_FORM'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008666758984707747)
,p_name=>'P2361300102_WF_CLS_BASED'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_default=>'N'
,p_source=>'WF_CLS_BASED'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7590684779872715762)
,p_name=>'P2361300102_WF_COUNT'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008667218322707751)
,p_name=>'P2361300102_WF_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source=>'WF_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008667504901707754)
,p_name=>'P2361300102_WF_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_format_mask=>'DD-MON-YYYY HH:MI:SS AM'
,p_source=>'WF_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008668107331707760)
,p_name=>'P2361300102_WF_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source=>'WF_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008667241948707752)
,p_name=>'P2361300102_WF_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source=>'WF_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008667367282707753)
,p_name=>'P2361300102_WF_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source=>'WF_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008666842161707748)
,p_name=>'P2361300102_WF_DISC_PCT_BASED_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_default=>'N'
,p_source=>'WF_DISC_PCT_BASED_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008669147493707771)
,p_name=>'P2361300102_WF_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_default=>'TRUNC(SYSDATE)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Doc. Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'WF_DOC_DATE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonlly tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008668935598707769)
,p_name=>'P2361300102_WF_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_prompt=>'Doc. No.'
,p_source=>'WF_DOC_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>120
,p_tag_attributes=>'readonly=readonly tabindex="-1"'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008669127667707770)
,p_name=>'P2361300102_WF_DOC_REV'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_prompt=>'Doc. Rev.'
,p_source=>'WF_DOC_REV'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonlly tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008669264885707772)
,p_name=>'P2361300102_WF_EFF_FROM'
,p_source_data_type=>'DATE'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_default=>'TRUNC(SYSDATE)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Eff. From'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'WF_EFF_FROM'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P2361300102_WF_STATUS'
,p_read_only_when2=>'E'
,p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(7008669378457707773)
,p_name=>'P2361300102_WF_EFF_TO'
,p_source_data_type=>'DATE'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_default=>'31-DEC-2099'
,p_prompt=>'Eff. To'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'WF_EFF_TO'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P2361300102_WF_STATUS'
,p_read_only_when2=>'E'
,p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(7008667093713707750)
,p_name=>'P2361300102_WF_HIER_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_default=>'E'
,p_source=>'WF_HIER_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008665741069707737)
,p_name=>'P2361300102_WF_INT_MSG_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_default=>'N'
,p_source=>'WF_INT_MSG_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008665666216707736)
,p_name=>'P2361300102_WF_MAIL_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_default=>'N'
,p_source=>'WF_MAIL_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008668547793707765)
,p_name=>'P2361300102_WF_MAIL_SEND_OPT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_default=>'M'
,p_source=>'WF_MAIL_SEND_OPT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008666562118707745)
,p_name=>'P2361300102_WF_MODULE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_prompt=>'Module'
,p_source=>'WF_MODULE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_tag_attributes=>'readonly=readonlly'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008666639395707746)
,p_name=>'P2361300102_WF_MOD_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source=>'WF_MOD_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5545144717601550329)
,p_name=>'P2361300102_WF_NO'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008667001337707749)
,p_name=>'P2361300102_WF_PRINT_SEQ_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source=>'WF_PRINT_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008668249419707762)
,p_name=>'P2361300102_WF_PROJ_BASED_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_default=>'N'
,p_source=>'WF_PROJ_BASED_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008665992241707739)
,p_name=>'P2361300102_WF_REPORT_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source=>'WF_REPORT_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008668005184707759)
,p_name=>'P2361300102_WF_SELF_APPR_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_default=>'Y'
,p_source=>'WF_SELF_APPR_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008665284985707732)
,p_name=>'P2361300102_WF_SEQ_NO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source=>'WF_SEQ_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008665906219707738)
,p_name=>'P2361300102_WF_SMS_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_default=>'N'
,p_source=>'WF_SMS_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008668647153707766)
,p_name=>'P2361300102_WF_SMS_SEND_OPT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_default=>'M'
,p_source=>'WF_SMS_SEND_OPT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008669450181707774)
,p_name=>'P2361300102_WF_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_default=>'E'
,p_prompt=>'Status'
,p_source=>'WF_STATUS'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;E,Entry Completed;N,Approved;A,Cancelled;C'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7499366628402948450)
,p_name=>'P2361300102_WF_TYPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9204997604706238432)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008667594071707755)
,p_name=>'P2361300102_WF_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source=>'WF_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008667869031707758)
,p_name=>'P2361300102_WF_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_format_mask=>'DD-MON-YYYY HH:MI:SS AM'
,p_source=>'WF_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008668212679707761)
,p_name=>'P2361300102_WF_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source=>'WF_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008667730091707756)
,p_name=>'P2361300102_WF_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source=>'WF_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008667808971707757)
,p_name=>'P2361300102_WF_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_source=>'WF_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008666528862707744)
,p_name=>'P2361300102_WF_VAL_BASED_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_default=>'N'
,p_source=>'WF_VAL_BASED_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7008668460776707764)
,p_name=>'P2361300102_WF_VERT_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_source_plug_id=>wwv_flow_imp.id(7008665027900707729)
,p_item_default=>'STD'
,p_source=>'WF_VERT_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7028352426537389151)
,p_validation_name=>'P2361300102_WF_BUS_PROC_ID'
,p_static_id=>'p2361300102-wf-bus-proc-id'
,p_validation_sequence=>130
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P2361300102_WF_BUS_PROC_ID IS NULL THEN',
'	 return(''Work Flow ID must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(7008665359575707733)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7031326121140553354)
,p_validation_name=>'P2361300102_WF_EFF_FROM'
,p_static_id=>'p2361300102-wf-eff-from'
,p_validation_sequence=>160
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF TO_DATE(:P2361300102_WF_EFF_FROM,:GLOBAL_DATE_FORMAT) IS NOT NULL AND TO_DATE(:P2361300102_WF_EFF_TO,:GLOBAL_DATE_FORMAT) IS NOT NULL THEN',
'',
'   IF TO_DATE(:P2361300102_WF_EFF_FROM,:GLOBAL_DATE_FORMAT) > TO_DATE(:P2361300102_WF_EFF_TO,:GLOBAL_DATE_FORMAT) THEN',
'      RETURN(''Effective From date should be less than or equal to Effective To date.'');',
'   END IF;',
'',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(7008669264885707772)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7031326162581553355)
,p_validation_name=>'P2361300102_WF_EFF_TO'
,p_static_id=>'p2361300102-wf-eff-to'
,p_validation_sequence=>170
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF TO_DATE(:P2361300102_WF_EFF_FROM,:GLOBAL_DATE_FORMAT) IS NOT NULL AND TO_DATE(:P2361300102_WF_EFF_TO,:GLOBAL_DATE_FORMAT) IS NOT NULL THEN',
'',
'   IF TO_DATE(:P2361300102_WF_EFF_TO,:GLOBAL_DATE_FORMAT) < TO_DATE(:P2361300102_WF_EFF_FROM,:GLOBAL_DATE_FORMAT) THEN',
'      RETURN(''Effective To date should be greater than Effective From date.'');',
'   END IF;',
'',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(7008669378457707773)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5955854970997240270)
,p_tabular_form_region_id=>wwv_flow_imp.id(9197338588468589101)
,p_validation_name=>'WFAA_HOUR'
,p_static_id=>'wfaa-hour'
,p_validation_sequence=>100
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WFAA_HOUR IS NULL THEN',
'	return(''Hour must be entered.'');',
'END IF;',
'',
'IF :WFAA_HOUR < 0 THEN',
'	 return(''Hour should be greater than zero.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WFAA_HOUR'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5955854576728240262)
,p_tabular_form_region_id=>wwv_flow_imp.id(9197338588468589101)
,p_validation_name=>'WFAA_STATUS'
,p_static_id=>'wfaa-status'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WFAA_STATUS IS NULL THEN',
'   Return(''Status must be entered.'');',
'END IF;',
'',
'IF :WFAA_STATUS IN (''N'',''C'',''R'') THEN',
'	Return(''Values ''''N'''',''''C'''',''''R'''' are not be used as they are predefined.'');',
'END IF;	'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WFAA_STATUS'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5955873185056240323)
,p_tabular_form_region_id=>wwv_flow_imp.id(9204997604706238432)
,p_validation_name=>'WFDA_APPR_BU'
,p_static_id=>'wfda-appr-bu'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WFDA_APPR_BU IS NULL THEN',
'   Return(''Entity must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WFDA_APPR_BU'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5955873941506240323)
,p_tabular_form_region_id=>wwv_flow_imp.id(9204997604706238432)
,p_validation_name=>'WFDA_DATE_FROM'
,p_static_id=>'wfda-date-from'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF TO_DATE(:WFDA_DATE_FROM,:GLOBAL_DATE_FORMAT) IS NULL THEN',
'   Return(''From Date must be entered.'');',
'END IF;',
'',
'IF TO_DATE(:WFDA_DATE_FROM,:GLOBAL_DATE_FORMAT) IS NOT NULL AND TO_DATE(:WFDA_DATE_FROM,:GLOBAL_DATE_FORMAT) > TO_DATE(:WFDA_DATE_TO,:GLOBAL_DATE_FORMAT) THEN',
'	 return(''From date should be less than To date.'');',
'END IF;	',
'',
'/*IF TO_DATE(:WFDA_DATE_FROM,:GLOBAL_DATE_FORMAT) < TO_DATE(:P2361300102_WF_EFF_FROM,:GLOBAL_DATE_FORMAT) THEN',
'    RETURN(''From date should not be less than Effective From date.'');',
'END IF;*/',
'',
'IF TO_DATE(:WFDA_DATE_FROM,:GLOBAL_DATE_FORMAT) > TO_DATE(:P2361300102_WF_EFF_TO,:GLOBAL_DATE_FORMAT) THEN',
'    RETURN(''From date should not be less than Effective To date.'');',
'END IF;',
'',
'IF TO_DATE(:WFDA_DATE_FROM,:GLOBAL_DATE_FORMAT) < TO_DATE(:P2361300102_WF_EFF_FROM,:GLOBAL_DATE_FORMAT) THEN',
'    RETURN(''From date should not be less than Effective From date. - ''||TO_DATE(:P2361300102_WF_EFF_FROM,:GLOBAL_DATE_FORMAT));',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WFDA_DATE_FROM'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5955874808872240324)
,p_tabular_form_region_id=>wwv_flow_imp.id(9204997604706238432)
,p_validation_name=>'WFDA_DATE_TO'
,p_static_id=>'wfda-date-to'
,p_validation_sequence=>110
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF TO_DATE(:WFDA_DATE_TO,:GLOBAL_DATE_FORMAT) IS NULL THEN',
'   return(''To date must be entered.'');',
'END IF;',
'',
'IF TO_DATE(:WFDA_DATE_TO,:GLOBAL_DATE_FORMAT) IS NOT NULL THEN',
'   IF TO_DATE(:WFDA_DATE_TO,:GLOBAL_DATE_FORMAT)  < TO_DATE(:WFDA_DATE_FROM,:GLOBAL_DATE_FORMAT)  THEN',
'      Return(''To Date Should not be Lesser than From Date.'');',
'   END IF;',
'END IF;',
'',
'IF TO_DATE(:WFDA_DATE_TO,:GLOBAL_DATE_FORMAT)  > TO_DATE(:P2361300102_WF_EFF_TO,:GLOBAL_DATE_FORMAT)  THEN',
'      Return(''To Date Should not be Greater than Effective To.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WFDA_DATE_TO'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7031325232036553345)
,p_tabular_form_region_id=>wwv_flow_imp.id(9204997604706238432)
,p_validation_name=>'WFDA_DISC_PCT'
,p_static_id=>'wfda-disc-pct'
,p_validation_sequence=>140
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   v_basis     VARCHAR2(10);',
'BEGIN',
'   SELECT wf_disc_pct_based_flag',
'     INTO v_basis',
'     FROM work_flow',
'    WHERE wf_bu          = :Global_bu',
'      AND wf_bus_proc_id = :WFDA_TYPE;',
'   ',
'   IF v_basis = ''Y'' THEN',
'      IF :WFDA_DISC_PCT IS NULL THEN',
'         return(''Discount percentage must be entered.'');',
'      END IF;',
'',
'      IF to_number(:WFDA_DISC_PCT) < 0  THEN ',
'         return(''Discount percentage should not be negative.'');',
'      END IF;   ',
'   END IF;   ',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WFDA_DISC_PCT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5955872815343240321)
,p_tabular_form_region_id=>wwv_flow_imp.id(9204997604706238432)
,p_validation_name=>'WFDA_PLNT'
,p_static_id=>'wfda-plnt'
,p_validation_sequence=>120
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   v_basis     VARCHAR2(10);',
'BEGIN',
'   SELECT wf_basis',
'     INTO v_basis',
'     FROM work_flow',
'    WHERE wf_bu          = :Global_bu',
'      AND wf_bus_proc_id = :WFDA_TYPE;',
'   ',
'   IF v_basis = ''U'' AND :WFDA_PLNT IS NULL THEN',
'      return(''Unit must be entered.'');',
'   END IF;',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WFDA_PLNT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5955873584569240323)
,p_tabular_form_region_id=>wwv_flow_imp.id(9204997604706238432)
,p_validation_name=>'WFDA_POSITION'
,p_static_id=>'wfda-position'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WFDA_POSITION IS NULL THEN',
'    Return(''Employee / Position must be entered'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WFDA_POSITION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7031325259350553346)
,p_tabular_form_region_id=>wwv_flow_imp.id(9204997604706238432)
,p_validation_name=>'WFDA_SENDER_MAIL'
,p_static_id=>'wfda-sender-mail'
,p_validation_sequence=>150
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :WFDA_MAIL_OPT_FLAG  = ''Y'' AND :WFDA_SENDER_MAIL IS NULL THEN ',
'   return(''Sender Mail must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WFDA_SENDER_MAIL'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5955874421836240324)
,p_tabular_form_region_id=>wwv_flow_imp.id(9204997604706238432)
,p_validation_name=>'WFDA_VALUE'
,p_static_id=>'wfda-value'
,p_validation_sequence=>90
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   v_basis     VARCHAR2(10);',
'BEGIN',
'   SELECT wf_val_based_flag',
'     INTO v_basis',
'     FROM work_flow',
'    WHERE wf_bu          = :Global_bu',
'      AND wf_bus_proc_id = :WFDA_TYPE;',
'   ',
'   IF v_basis = ''Y'' THEN',
'      IF :WFDA_VALUE IS NULL THEN',
'         return(''Value must be entered.'');',
'      END IF;',
'',
'      IF to_number(:WFDA_VALUE) < 0  THEN ',
'         return(''Negative values not allowed.'');',
'      END IF;   ',
'   END IF;   ',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'WFDA_VALUE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5955234065684866551)
,p_name=>'Add'
,p_static_id=>'add'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5955896568097240434)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5955234169098866552)
,p_event_id=>wwv_flow_imp.id(5955234065684866551)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5955234246154866553)
,p_name=>'add'
,p_static_id=>'add-2'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5955906455605240470)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5955234427378866554)
,p_event_id=>wwv_flow_imp.id(5955234246154866553)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line1" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5955233100450866541)
,p_name=>'Add_act'
,p_static_id=>'add-act'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5955852751896240232)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5955233140136866542)
,p_event_id=>wwv_flow_imp.id(5955233100450866541)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "act" ).widget().interactiveGrid( "getActions" ).invoke( "row-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5955233511198866545)
,p_name=>'add_auth'
,p_static_id=>'add-auth'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5955869898142240317)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5955233561244866546)
,p_event_id=>wwv_flow_imp.id(5955233511198866545)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "auth" ).widget().interactiveGrid( "getActions" ).invoke( "row-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5955234718042866557)
,p_name=>'After Refresh'
,p_static_id=>'after-refresh'
,p_event_sequence=>90
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9197338588468589101)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7790772336549944563)
,p_event_id=>wwv_flow_imp.id(5955234718042866557)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(7031326586425553359)
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P2361300102_CNT'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7790772211696944561)
,p_event_id=>wwv_flow_imp.id(5955234718042866557)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(7031326586425553359)
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P2361300102_CNT'
,p_client_condition_expression=>'1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7790771923664944558)
,p_event_id=>wwv_flow_imp.id(5955234718042866557)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P2361300102_CNT',
  'items_to_submit', 'P2361300102_WF_DOC_NO,P2361300102_WF_DOC_REV',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    'SELECT COUNT(1)',
    ' INTO :P2361300102_CNT',
    ' FROM work_flow_appr_actvt',
    'WHERE wfaa_bu      = :GLOBAL_BU',
    '  AND wfaa_doc_no  = :P2361300102_WF_DOC_NO',
    ' AND wfaa_doc_rev = :P2361300102_WF_DOC_REV;',
    'END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5955234736602866558)
,p_event_id=>wwv_flow_imp.id(5955234718042866557)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9197338588468589101)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5955234838527866559)
,p_name=>'After Refresh1'
,p_static_id=>'after-refresh-2'
,p_event_sequence=>100
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9204997604706238432)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5955234977761866560)
,p_event_id=>wwv_flow_imp.id(5955234838527866559)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9204997604706238432)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5751843350297844857)
,p_name=>'LINE'
,p_static_id=>'line'
,p_event_sequence=>140
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5751843634502844859)
,p_event_id=>wwv_flow_imp.id(5751843350297844857)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5955852751896240232)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>':P2361300102_WF_STATUS<>''E'''
,p_server_condition_expr2=>'PLSQL'
,p_build_option_id=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5751843491851844858)
,p_event_id=>wwv_flow_imp.id(5751843350297844857)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5955852751896240232)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>':P2361300102_WF_STATUS=''E'''
,p_server_condition_expr2=>'PLSQL'
,p_build_option_id=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7028352173925389149)
,p_name=>'P2361300102_WF_BUS_PROC_ID'
,p_static_id=>'p2361300102-wf-bus-proc-id'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2361300102_WF_BUS_PROC_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7028352272640389150)
,p_event_id=>wwv_flow_imp.id(7028352173925389149)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P2361300102_WF_MODULE,P2361300102_WF_CALL_FORM,P2361300102_WF_MOD_SEQ_NO,P2361300102_WF_BUS_PROC_DESC,P2361300102_WF_SEQ_NO,P2361300102_WF_BASIS,P2361300102_WF_BASIS_DESC',
  'items_to_submit', 'P2361300102_WF_BUS_PROC_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P2361300102_WF_BUS_PROC_ID IS NOT NULL THEN',
    '',
    '   DECLARE',
    '   	CURSOR c1',
    '   	    IS',
    '      SELECT wfm_bus_proc_desc wf_bus_proc_desc,wfm_bus_proc_id wf_bus_proc_id,',
    '             wfm_module,',
    '             wfm_mod_seq_no seq_no,',
    '             wfm_bus_proc_desc2 desc2,',
    '             wfm_call_form,',
    '             wfm_mod_seq_no,',
    '             wfm_basis,',
    '             DECODE(wfm_basis,''E'',''Entity'',''U'',''Unit'') wfm_basis_desc',
    '        FROM work_flow_master',
    '       WHERE wfm_bu 					= :GLOBAL_bu ',
    '         AND wfm_bus_proc_id	   = :P2361300102_WF_BUS_PROC_ID;',
    '       ',
    '       cr1  c1%ROWTYPE;',
    '     ',
    '   BEGIN',
    '   	',
    '   	OPEN c1;',
    '   	FETCH c1 INTO cr1;',
    '   	   ',
    '   	   IF c1%FOUND THEN',
    '   	   	  :P2361300102_WF_MODULE  				:= cr1.wfm_module ;',
    '   	   	  :P2361300102_WF_CALL_FORM   		:= cr1.wfm_call_form;',
    '   	   	  :P2361300102_WF_MOD_SEQ_NO			:= cr1.seq_no;',
    '   	   	  :P2361300102_WF_BUS_PROC_DESC		:= cr1.wf_bus_proc_desc;',
    '   	   	  :P2361300102_WF_SEQ_NO				:= cr1.seq_no;',
    '   	   	  :P2361300102_WF_BASIS             := cr1.wfm_basis;',
    '              :P2361300102_WF_BASIS_DESC        := cr1.wfm_basis_desc;',
    '   	   END IF;',
    '   	   ',
    '   	CLOSE c1;',
    '   	',
    '   END;',
    '',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7790771463184944554)
,p_name=>'Post'
,p_static_id=>'post'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7031326586425553359)
,p_condition_element=>'P2361300102_CNT'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7790771651451944556)
,p_event_id=>wwv_flow_imp.id(7790771463184944554)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(7031326586425553359)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7790771601649944555)
,p_event_id=>wwv_flow_imp.id(7790771463184944554)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(7031326586425553359)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5955233869296866549)
,p_name=>'Save'
,p_static_id=>'save'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5955896948623240434)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5955233948679866550)
,p_event_id=>wwv_flow_imp.id(5955233869296866549)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5955234455398866555)
,p_name=>'save'
,p_static_id=>'save-2'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5955906884612240471)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5955234624133866556)
,p_event_id=>wwv_flow_imp.id(5955234455398866555)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line1" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5955233302291866543)
,p_name=>'save_act'
,p_static_id=>'save-act'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5955853196884240232)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5955233343431866544)
,p_event_id=>wwv_flow_imp.id(5955233302291866543)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "act" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5955233727822866547)
,p_name=>'save_auth'
,p_static_id=>'save-auth'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5955870280448240317)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5955233805918866548)
,p_event_id=>wwv_flow_imp.id(5955233727822866547)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "auth" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7031323717845553330)
,p_name=>'WFDA_POSITION'
,p_static_id=>'wfda-position'
,p_event_sequence=>120
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(9204997604706238432)
,p_triggering_element=>'WFDA_POSITION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7031323751910553331)
,p_event_id=>wwv_flow_imp.id(7031323717845553330)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'WFDA_POS_NAME',
  'items_to_submit', 'WFDA_POSITION,P2361300102_WF_AUTH_TYPE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :WFDA_POSITION IS NOT NULL and :P2361300102_WF_AUTH_TYPE = ''E'' THEN',
    '',
    '  SELECT TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1) wfda_pos_name into :WFDA_POS_NAME',
    '                                                              FROM employees',
    '                                                             WHERE emp_bu = :Global_bu',
    '                                                               AND emp_emp_id = :WFDA_POSITION;',
    '',
    ' ELSIF  :WFDA_POSITION IS NOT NULL and :P2361300102_WF_AUTH_TYPE = ''P'' THEN                                                             ',
    '                 SELECT hrpos_pos_name1   into :WFDA_POS_NAME',
    '                                                              FROM hr_positions',
    '                                                             WHERE hrpos_bu = :Global_bu',
    '                                                               AND hrpos_pos_id = :WFDA_POSITION;',
    '',
    '  END IF;       ')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_element=>'WFDA_POSITION'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7202874826277058766)
,p_event_id=>wwv_flow_imp.id(7031323717845553330)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'WFDA_POS_NAME',
  'items_to_submit', 'WFDA_POSITION,P2361300102_WF_AUTH_TYPE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :WFDA_POSITION IS NOT NULL THEN',
    '',
    '   DECLARE',
    '      CURSOR c1',
    '          IS ',
    '      SELECT CASE WHEN :P2361300102_WF_AUTH_TYPE = ''E'' THEN (SELECT TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1)',
    '                                                              FROM employees',
    '                                                             WHERE emp_bu = :Global_bu',
    '                                                               AND emp_emp_id = :WFDA_POSITION)',
    '                  WHEN :P2361300102_WF_AUTH_TYPE = ''P'' THEN (SELECT hrpos_pos_name1',
    '                                                              FROM hr_positions',
    '                                                             WHERE hrpos_bu = :Global_bu',
    '                                                               AND hrpos_pos_id = :WFDA_POSITION)',
    '            END wfda_pos_name ',
    '       FROM dual;     ',
    '',
    '      cr1            c1%ROWTYPE;',
    '   BEGIN',
    '      OPEN c1;',
    '      FETCH c1 INTO cr1;',
    '         IF c1%FOUND THEN',
    '            :WFDA_POS_NAME :=  cr1.wfda_pos_name;',
    '         END IF;',
    '      CLOSE c1;',
    '   END;    ',
    '',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_element=>'WFDA_POSITION'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5955897852242240435)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(8098012452967335728)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Administrator - Save Interactive Grid Data'
,p_static_id=>'administrator-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
' IF :APEX$ROW_STATUS = ''C'' THEN',
'',
' SELECT NVL(MAX(WFAD_SEQ_NO),0)+1',
'   INTO :WFAD_SEQ_NO',
'   FROM WF_ADMIN_DETAILS',
'  WHERE WFAD_BU = :GLOBAL_BU',
'    AND WFAD_BUS_PROC_ID=:WFAD_BUS_PROC_ID;',
'',
'	    INSERT INTO wf_admin_details (WFAD_BU,',
'                                     WFAD_SEQ_NO,',
'                                     WFAD_BUS_PROC_ID,',
'                                     WFAD_ADMIN_POS_ID,',
'								             WFAD_CRE_BY,',
'                                     WFAD_CRE_DATE)',
'						           VALUES (:global_BU,',
'                                    :WFAD_SEQ_NO,',
'                                    :WFAD_BUS_PROC_ID,',
'                                    :WFAD_ADMIN_POS_ID,',
'								            :global_user,',
'                                     sysdate);',
'ELSIF :APEX$ROW_STATUS = ''U'' THEN	',
'',
'           					update wf_admin_details set  wfad_seq_no       =:wfad_seq_no,',
'                                                     wfad_bus_proc_id  =:wfad_bus_proc_id,',
'                                                     wfad_admin_pos_id =:wfad_admin_pos_id,',
'                                                     wfad_upd_by       =:global_bu,',
'                                                     wfad_upd_date     = sysdate',
'													       WHERE WFAD_BU = :global_BU ',
'                                                AND WFAD_BUS_PROC_ID = :WF_BUS_PROC_ID;',
'',
'',
'ELSIF :APEX$ROW_STATUS = ''D'' THEN	',
'',
'       DELETE FROM wf_admin_details ',
'		  WHERE WFAD_BU = :global_BU ',
'          AND WFAD_BUS_PROC_ID = :WF_BUS_PROC_ID;',
'',
'',
'',
'',
'',
'	  ',
'COMMIT;',
'END IF;',
' END;',
'',
'',
'								'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>473936016698629407
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7031326805528553361)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cancel'
,p_static_id=>'cancel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'   UPDATE WORK_FLOW',
'      SET WF_STATUS        = ''C'',',
'          WF_UPD_BY        = :GLOBAL_USER,',
'          WF_UPD_DATE      = SYSDATE,',
'          WF_UPD_IP_ADDR   = :GLOBAL_IP,',
'          WF_UPD_OS_USER   = NULL,',
'          WF_UPD_EMP_ID    = :GLOBAL_EMP_ID',
'    WHERE WF_BU = :GLOBAL_BU',
'      AND WF_DOC_NO = :P2361300102_WF_DOC_NO;',
'',
'   IF SQL%FOUND THEN',
'      apex_application.g_print_success_message := ''<span>Document Cancelled.</span>'';',
'   ELSE',
'      apex_application.g_print_success_message := ''<span>Document not Cancelled.</span>'';',
'   END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7031326679273553360)
,p_internal_uid=>1549364969984942333
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7031325850202553352)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE_ACTIVITY'
,p_static_id=>'delete-activity'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF APEX_APPLICATION.G_X01  IS NOT NULL AND APEX_APPLICATION.G_X02 IS NOT NULL AND APEX_APPLICATION.G_X03 IS NOT NULL THEN',
'',
'   DECLARE',
'      CURSOR c1',
'          IS',
'      SELECT *',
'        FROM wf_direct_authorization',
'       WHERE wfda_bu = :Global_bu',
'         AND wfda_type = APEX_APPLICATION.G_X02',
'         AND wfda_seq_no = APEX_APPLICATION.G_X03;',
'',
'         cr1         c1%ROWTYPE;',
'   BEGIN',
'      OPEN c1;',
'      FETCH c1 INTO cr1;',
'         IF c1%FOUND THEN',
'             HTP.P(''Cannot Delete. Since child record exists.'');------RAISE_APPLICATION_ERROR(-20999,''Cannot Delete. Since child record exists.'');',
'         ELSE',
'            DELETE',
'              FROM work_flow_appr_actvt',
'             WHERE ROWID = APEX_APPLICATION.G_X01;',
'',
'            COMMIT;',
'            ',
'            HTP.P(''success'');',
'         END IF;',
'      CLOSE c1;',
'      ',
'   END;',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1549364014658942324
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7031325942651553353)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DELETE_AUTH'
,p_static_id=>'delete-auth'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF APEX_APPLICATION.G_X01 IS NOT NULL THEN',
'',
' DELETE',
'   FROM wf_direct_authorization',
'  WHERE WFDA_BU = :global_bu',
'    AND ROWID = APEX_APPLICATION.G_X01;',
'    COMMIT;',
'',
'    HTP.P(''success'');',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1549364107107942325
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5955232825856866538)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DISPLAY'
,p_static_id=>'display'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P2361300102_ROWID IS NULL OR :P2361300102_WF_BUS_PROC_ID IS NULL THEN ',
'   :P2361300102_DISPLAY := ''Work Flow'';',
' ELSE',
'   :P2361300102_DISPLAY := :P2361300102_WF_BUS_PROC_ID||'' ( ''||:P2361300102_WF_BUS_PROC_DESC ||'')'';',
'END IF;',
'',
'IF :P2361300102_WF_BASIS IS NOT NULL THEN',
'   SELECT DECODE(:P2361300102_WF_BASIS,''E'',''Entity'',''U'',''Unit'')',
'     INTO :P2361300102_WF_BASIS_DESC',
'     FROM DUAL;',
'END IF;',
'',
'IF :P2361300102_WF_BUS_PROC_ID IS NOT NULL THEN ',
' select wf_doc_no, wf_doc_rev , wf_bus_proc_desc, wf_auth_type,WF_BASIS into  :P2361300102_WF_DOC_NO , :P2361300102_WF_DOC_REV , :P2361300102_WF_BUS_PROC_DESC, :P2361300102_WF_AUTH_TYPE,:P2361300102_WF_BASIS',
' from work_flow ',
' where wf_bu = :global_bu',
' and wf_bus_proc_id = :P2361300102_WF_BUS_PROC_ID;',
'',
' End IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>473270990313255510
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7790771422804944553)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Enable / Disable'
,p_static_id=>'enable-disable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'SELECT COUNT(1)',
' INTO :P2361300102_CNT',
' FROM work_flow_appr_actvt',
'WHERE wfaa_bu      = :GLOBAL_BU',
'  AND wfaa_doc_no  = :P2361300102_WF_DOC_NO',
' AND wfaa_doc_rev = :P2361300102_WF_DOC_REV;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2308809587261333525
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7028354652383389174)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generate Rowid'
,p_static_id=>'generate-rowid'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    SELECT',
'        nextrowid,',
'        prevrowid',
'    INTO',
'        :global_next_rowid,',
'        :global_prev_rowid',
'    FROM(',
'            SELECT',
'                ROWID ,',
'                LEAD(ROWID)',
'                OVER(',
'                    ORDER BY wf_module, wf_seq_no',
'                )            nextrowid,',
'                LAG(ROWID)',
'                OVER(',
'                   ORDER BY wf_module, wf_seq_no',
'                )            prevrowid',
'            FROM',
'                work_flow',
'            WHERE',
'                wf_bu = :global_bu',
'            ORDER BY wf_module, wf_seq_no',
'        )',
'    WHERE',
'        ROWID = :P2361300102_ROWID;',
'',
'		SELECT ROWID INTO :GLOBAL_FIRST_ROWID FROM( SELECT *  ',
'		  FROM work_flow',
'            WHERE',
'                wf_bu = :global_bu',
'			  ORDER BY wf_module, wf_seq_no )WHERE ROWNUM=1;',
'',
'		SELECT ROWID INTO :GLOBAL_LAST_ROWID FROM (SELECT *  ',
'		  FROM work_flow',
'            WHERE',
'                wf_bu = :global_bu',
'          ORDER BY wf_module, wf_seq_no desc)',
'			 WHERE ROWNUM=1	  ;',
'		  ',
'EXCEPTION WHEN OTHERS THEN',
'        NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1546392816839778146
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7008665048836707730)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(7008665027900707729)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Work Flow'
,p_static_id=>'initialize-form-work-flow'
,p_internal_uid=>1526703213293096702
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7031324614321553339)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pre Insert Update'
,p_static_id=>'pre-insert-update'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P2361300102_ROWID IS NULL THEN',
' ',
'   SELECT NVL(MAX(TO_NUMBER(WF_DOC_NO)),1000000000)+1,0',
'     INTO :P2361300102_WF_DOC_NO, ',
'          :P2361300102_WF_DOC_REV',
'     FROM WORK_FLOW',
'    WHERE WF_BU		= :GLOBAL_BU;',
'',
'   :P2361300102_WF_DOC_DATE         := TRUNC(SYSDATE);',
'   :P2361300102_WF_BU               := :GLOBAL_BU;',
'   ',
'   :P2361300102_WF_CRE_BY           := :GLOBAL_USER;',
'   :P2361300102_WF_CRE_IP_ADDR      := :GLOBAL_IP;',
'   :P2361300102_WF_CRE_EMP_ID       := :GLOBAL_EMP_ID;',
'   :P2361300102_WF_CRE_DATE         := TO_CHAR(SYSDATE,''DD-MON-YYYY HH:MI:SS AM'');',
'',
'ELSE',
'   :P2361300102_WF_UPD_BY           := :GLOBAL_USER;',
'   :P2361300102_WF_UPD_IP_ADDR      := :GLOBAL_IP;',
'   :P2361300102_WF_UPD_EMP_ID       := :GLOBAL_EMP_ID;',
'   :P2361300102_WF_UPD_DATE         := TO_CHAR(SYSDATE,''DD-MON-YYYY HH:MI:SS AM'');   ',
'END IF;   '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Wf_save,Wf_update'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>1549362778777942311
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7590684665087715761)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for the Entry completed'
,p_static_id=>'process-for-the-entry-completed'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	  v_appr_res	VARCHAR2(1);',
'	  v_appr_msg   VARCHAR2(100);',
'     v_count      NUMBER(10);',
'	BEGIN',
'      SELECT COUNT(*)',
'        INTO v_count',
'        from WORK_FLOW_APPR_ACTVT',
'       where WFAA_BU =:Global_bu',
'         and WFAA_WF_ID = :P2361300102_WF_BUS_PROC_ID',
'         and WFAA_DOC_NO = :P2361300102_WF_DOC_NO',
'         and WFAA_DOC_REV = :P2361300102_WF_DOC_REV;',
'',
'       IF v_count = 0 THEN',
'          Raise_Application_Error(-20999,''Line Details not found.'');',
'       ELSE',
'',
'				  proc_self_wf_appr(:GLOBAL_bu,''WF_WORK_FLOW'',:GLOBAL_user,1,v_appr_res,v_appr_msg,',
'											      p_doc_date => to_Date(:P2361300102_WF_DOC_DATE,:GLOBAL_DATE_FORMAT),',
'											      p_doc_no => :P2361300102_WF_DOC_NO',
'											     );',
'       END IF;',
'',
'			-- RAISE_APPLICATION_ERROR(-20999,v_appr_res||''$''||:P2361300102_WF_COUNT||''/''||v_appr_res);',
'',
'   IF v_appr_res = ''Y'' THEN',
'        :P2361300102_wf_count                  := ''DIRECT'';',
'        -- RAISE_APPLICATION_ERROR(-20999,v_appr_res||''$''||:P2361300102_WF_COUNT);',
'        apex_application.g_print_success_message := ''Document is Approved '' || :P2361300102_WF_DOC_NO;',
'    ELSE',
'        :P2361300102_wf_count := ''FORWARD'';',
'    END IF;',
'   --  EXCEPTION WHEN OTHERS THEN',
'   --      proc_apex_err_msg_log(:GLOBAL_PAGE_ID,SQLERRM);',
'',
'END;',
'',
' '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7031326586425553359)
,p_internal_uid=>2108722829544104733
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5545144738387550330)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Work Flow'
,p_static_id=>'process-for-work-flow'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P2361300102_WF_NO IS NOT NULL THEN',
'BEGIN',
'  SELECT wfdc_doc_no',
'    INTO :P2361300102_WF_DOC_NO',
'    FROM WORK_FLOW_DOC_CONTROL',
'   WHERE wfdc_bu = :global_bu',
'     AND wfdc_wf_no = :P2361300102_WF_NO;',
'EXCEPTION WHEN NO_DATA_FOUND THEN ',
'NULL;',
'END;',
'END IF;',
'',
'IF :P2361300102_WF_DOC_NO IS NOT NULL THEN',
'BEGIN',
'  SELECT ROWID',
'    INTO :P2361300102_ROWID',
'    FROM WORK_FLOW',
'   WHERE wf_bu = :global_bu',
'     AND WF_DOC_NO = :P2361300102_WF_DOC_NO;',
'EXCEPTION WHEN NO_DATA_FOUND THEN ',
'NULL;',
'END;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>63182902843939302
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7031324725776553340)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7008665027900707729)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form &P2361300102_DISPLAY.'
,p_static_id=>'process-form-p2361300102-display'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7028352596607389153)
,p_internal_uid=>1549362890232942312
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8204322661642209330)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(7008665027900707729)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form &P2361300102_DISPLAY._1'
,p_static_id=>'process-form-p2361300102-display-2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7031324432449553337)
,p_process_success_message=>'Saved.'
,p_internal_uid=>2722360826098598302
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5955907351675240471)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(8122933263911787182)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Reports - Save Interactive Grid Data'
,p_static_id=>'reports-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN ',
' IF :APEX$ROW_STATUS = ''C'' THEN',
'',
'INSERT INTO WORK_FLOW_REPORTS (WFR_BU,',
'                              WFR_WF_ID,',
'                              WFR_REPORT_ID,',
'                              WFR_REPORT_DESC,',
'                              WFR_CRE_BY,',
'                              WFR_CRE_DATE)',
'                       values(:global_bu,',
'					          :WFR_WF_ID,',
'                              :WFR_REPORT_ID,',
'                              :WFR_REPORT_DESC,',
'                              :global_user,',
'                               sysdate);',
'							   ',
'ELSIF :APEX$ROW_STATUS = ''U'' THEN								   ',
'							   ',
'update 	WORK_FLOW_REPORTS set WFR_WF_ID           =:WFR_WF_ID,',
'                          WFR_REPORT_ID       =:WFR_REPORT_ID,',
'                          WFR_REPORT_DESC     =:WFR_REPORT_DESC,',
'                          WFR_upd_BY          =:global_user,',
'                          WFR_upd_DATE		  =sysdate',
'				  WHERE WFR_BU = :global_BU ',
'	  AND WFR_WF_ID = :WF_BUS_PROC_ID;',
'					',
'							   ',
'ELSIF :APEX$ROW_STATUS = ''D'' THEN	',
'',
'delete from WORK_FLOW_REPORTS   WHERE WFR_BU = :global_BU ',
'	  AND WFR_WF_ID = :WF_BUS_PROC_ID;	',
'',
'commit;',
'end if;',
'end;			   ',
'							   					'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>473945516131629443
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5955855290237240270)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9197338588468589101)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Workflow_activity - Save Interactive Grid Data'
,p_static_id=>'workflow-activity-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'   IF :APEX$ROW_STATUS = ''C'' THEN ',
'',
'      SELECT NVL(MAX(wfaa_seq_no),0)+1',
'        INTO :wfaa_seq_no',
'        FROM work_flow_appr_actvt',
'       WHERE wfaa_bu    = :GLOBAL_BU',
'         AND wfaa_wf_id = :P2361300102_WF_BUS_PROC_ID;',
'      INSERT INTO work_flow_appr_actvt(wfaa_bu,',
'                                       wfaa_wf_id,',
'                                       wfaa_seq_no,',
'                                       wfaa_desc,',
'                                       wfaa_status,',
'                                       wfaa_status_desc,',
'                                       wfaa_hour,',
'                                       wfaa_status_desc2,',
'                                       wfaa_print_seq_no,',
'                                       wfaa_msg_to,',
'                                       wfaa_hier_type,',
'                                       wfaa_cre_by,',
'                                       wfaa_cre_ip_addr,',
'                                       wfaa_cre_os_user,',
'                                       wfaa_cre_date,',
'                                       wfaa_cre_emp_id,',
'                                       wfaa_im_flag,',
'                                       wfaa_mail_flag,',
'                                       wfaa_sms_flag,',
'                                       wfaa_sms_template_id,',
'                                       WFAA_DOC_NO,',
'                                       WFAA_DOC_REV)        ',
'                               VALUES (:Global_bu,',
'                                       :P2361300102_WF_BUS_PROC_ID,',
'                                       :wfaa_seq_no,',
'                                       :wfaa_desc,',
'                                       :wfaa_status,',
'                                       :wfaa_status_desc,',
'                                       :wfaa_hour,',
'                                       :wfaa_status_desc2,',
'                                       :wfaa_print_seq_no,',
'                                       :wfaa_msg_to,',
'                                       :wfaa_hier_type,',
'                                       :Global_user,',
'                                       :GLOBAL_IP,',
'                                       NULL,',
'                                       SYSDATE,',
'                                       :GLOBAL_EMP_ID,',
'                                       :wfaa_im_flag,',
'                                       :wfaa_mail_flag,',
'                                       :wfaa_sms_flag,',
'                                       :wfaa_sms_template_id,',
'                                       :P2361300102_WF_DOC_NO,',
'                                       :P2361300102_WF_DOC_REV);',
'--RAISE_APPLICATION_ERROR(-20999,:P2361300102_WF_DOC_NO);',
'',
' ELSIF :APEX$ROW_STATUS = ''U'' THEN',
'--  RAISE_APPLICATION_ERROR(-20999,:WFAA_ROWID);',
'    ',
'      UPDATE work_flow_appr_actvt',
'         SET wfaa_desc         = :wfaa_desc,',
'             wfaa_status       = :wfaa_status,',
'             wfaa_status_desc  = :wfaa_status_desc,',
'             wfaa_hour         = :wfaa_hour,',
'             wfaa_status_desc2 = :wfaa_status_desc2,',
'             wfaa_print_seq_no = :wfaa_print_seq_no,',
'             wfaa_msg_to       = :wfaa_msg_to,',
'             wfaa_hier_type    = :wfaa_hier_type,',
'             wfaa_upd_by       = :GLOBAL_USER,',
'             wfaa_upd_ip_addr  = :GLOBAL_IP,',
'             wfaa_upd_os_user  = NULL,',
'             wfaa_upd_date     = SYSDATE,',
'             wfaa_upd_emp_id   = :GLOBAL_EMP_ID,',
'             wfaa_im_flag      = :wfaa_im_flag,',
'             wfaa_mail_flag    = :wfaa_mail_flag,',
'             wfaa_sms_flag     = :wfaa_sms_flag,',
'             wfaa_sms_template_id = :wfaa_sms_template_id,',
'             WFAA_DOC_NO =:WFAA_DOC_NO,',
'             WFAA_DOC_REV = :WFAA_DOC_REV',
'       WHERE ROWID = :WFAA_ROWID;',
'         ',
'  END IF;',
'',
'   COMMIT;',
'END;',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>473893454693629242
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5955875074878240326)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9204997604706238432)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Workflow_Auth - Save Interactive Grid Data'
,p_static_id=>'workflow-auth-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
' V_POS_DESC   VARCHAR2(200);',
' V_DEPT_DESC  VARCHAR2(200);',
' V_EMP_DESC   VARCHAR2(200); ',
' V_CNT        NUMBER;',
'BEGIN',
'	DECLARE',
'		v_count 	NUMBER(5);',
'	BEGIN',
'	    SELECT COUNT(*)  ',
'	      INTO v_count',
'	      FROM wf_direct_authorization',
'	 	  WHERE wfda_bu        = :GLOBAL_bu',
'		    AND wfda_type      = :wfda_type',
'		    AND wfda_dflt_flag = ''Y''',
'          AND :wfda_dflt_flag = ''Y''',
'          AND (ROWID <> :WFDA_ROWID OR :WFDA_ROWID IS NULL);',
'',
'			IF  v_count > 0 THEN',
'				raise_application_error(-20999,''Default Authorization Exists.'');',
'			END IF;',
'	END;',
'',
'',
'   IF :APEX$ROW_STATUS = ''C'' THEN',
'  ',
'   SELECT COUNT(*)',
'     INTO V_CNT',
'     FROM WF_DIRECT_AUTHORIZATION',
'    WHERE WFDA_BU       = :Global_bu',
'      AND WFDA_TYPE     = :wfda_type',
'      AND (WFDA_PLNT    = :WFDA_PLNT OR :WFDA_PLNT IS NULL)',
'      AND WFDA_POSITION = :WFDA_POSITION',
'      AND (ROWID <> :WFDA_ROWID OR :WFDA_ROWID IS NULL);',
'',
'    IF V_CNT > 0  THEN  ',
'       raise_application_error(-20999,''Duplicate entries not allowed'');',
'    END IF;',
'',
'     SELECT NVL(MAX(wfda_sub_seq_no),0) + 1',
'       INTO :wfda_sub_seq_no',
'       FROM wf_direct_authorization',
'      WHERE wfda_bu     = :GLOBAL_BU',
'        AND wfda_type   = :wfda_type',
'        AND wfda_seq_no = :wfda_seq_no;',
'      ',
'      INSERT INTO wf_direct_authorization(wfda_bu,',
'                                          wfda_type,',
'                                          wfda_position,',
'                                          wfda_date_from,',
'                                          wfda_date_to,',
'                                          wfda_seq_no,',
'                                          wfda_value,',
'                                          wfda_aod_flag,',
'                                          wfda_mobile_no,',
'                                          wfda_plnt,',
'                                          wfda_sub_seq_no,',
'                                          wfda_appr_bu,',
'                                          wfda_disc_pct,',
'                                          wfda_dflt_flag,',
'                                          wfda_cre_by,',
'                                          wfda_cre_ip_addr,',
'                                          wfda_cre_os_user,',
'                                          wfda_cre_date,',
'                                          wfda_cre_emp_id,',
'                                          wfda_mail_opt_flag,',
'                                          wfda_sender_mail,',
'                                          WFDA_DOC_NO)        ',
'                                   VALUES (:Global_bu,',
'                                           :wfda_type,',
'                                           :wfda_position,',
'                                           TO_DATE(:wfda_date_from,:GLOBAL_DATE_FORMAT),',
'                                           TO_DATE(:wfda_date_to,:GLOBAL_DATE_FORMAT),',
'                                           :wfda_seq_no,',
'                                           :wfda_value,',
'                                           :wfda_aod_flag,',
'                                           :wfda_mobile_no,',
'                                           :wfda_plnt,',
'                                           :wfda_sub_seq_no,',
'                                           :wfda_appr_bu,',
'                                           :wfda_disc_pct,',
'                                           :wfda_dflt_flag,',
'                                           :Global_User,',
'                                           :GLOBAL_IP,',
'                                           NULL,',
'                                           SYSDATE,',
'                                           :GLOBAL_EMP_ID,',
'                                           :wfda_mail_opt_flag,',
'                                           :wfda_sender_mail,',
'                                           :WFDA_DOC_NO    ',
'                                           );',
'		/* IF :WFDA_POSITION IS NOT NULL THEN',
'   IF :P2361300102_WF_AUTH_TYPE = ''P'' THEN',
'	 proc_find_emp_details(:wfda_appr_bu,',
'		                    NULL,',
'		                    :wfda_position,',
'		                    NULL,',
'		                    :wfda_plnt,',
'		                    :wfda_emp_id,',
'		                    V_EMP_DESC,',
'		                    :DEPT_ID,',
'		                    V_DEPT_DESC,',
'		                    :position,',
'		                    V_POS_DESC,',
'		                    1);',
'		 ',
'',
'    ELSIF :P2361300102_WF_AUTH_TYPE = ''E'' THEN',
'			proc_find_emp_details(:wfda_appr_bu,',
'                                  :wfda_position,',
'                                  NULL,',
'                                  NULL,',
'                                  :wfda_plnt,',
'                                  :position,',
'                                  V_POS_DESC,',
'                                  :DEPT_ID,',
'                                  V_DEPT_DESC,',
'                                  :wfda_emp_id,',
'                                  V_EMP_DESC,',
'                                  1);',
'	END IF;',
'',
'END IF;		 */',
'',
' ELSIF :APEX$ROW_STATUS = ''U'' THEN',
'',
'   Select COUNT(*)',
'     INTO V_CNT',
'     from WF_DIRECT_AUTHORIZATION',
'    where WFDA_BU       = :Global_bu',
'      AND WFDA_TYPE     = :wfda_type',
'      AND (WFDA_PLNT    = :WFDA_PLNT OR :WFDA_PLNT IS NULL)',
'      AND WFDA_POSITION = :WFDA_POSITION',
'      AND (ROWID <> :WFDA_ROWID OR :WFDA_ROWID IS NULL);',
' ',
'   IF V_CNT > 1  THEN  ',
'    raise_application_error(-20999,''Duplicate entries not allowed'');',
'   END IF;',
' ',
'      UPDATE wf_direct_authorization',
'         SET wfda_position       = :wfda_position,',
'             wfda_date_from      = TO_DATE(:wfda_date_from,:GLOBAL_DATE_FORMAT),',
'             wfda_date_to        = TO_DATE(:wfda_date_to,:GLOBAL_DATE_FORMAT),',
'             wfda_value          = :wfda_value,',
'             wfda_aod_flag       = :wfda_aod_flag,',
'             wfda_mobile_no      = :wfda_mobile_no,',
'             wfda_plnt           = :wfda_plnt,',
'             wfda_sub_seq_no     = :wfda_sub_seq_no,',
'             wfda_appr_bu        = :wfda_appr_bu, ',
'             wfda_disc_pct       = :wfda_disc_pct,',
'             wfda_dflt_flag      = :wfda_dflt_flag,',
'             wfda_upd_by         = :GLOBAL_USER,',
'             wfda_upd_ip_addr    = :GLOBAL_IP,',
'             wfda_upd_os_user    = NULL,',
'             wfda_upd_date       = SYSDATE,',
'             wfda_upd_emp_id     = :GLOBAL_EMP_ID,',
'             wfda_mail_opt_flag  = :wfda_mail_opt_flag,',
'             wfda_sender_mail    = :wfda_sender_mail,',
'             WFDA_DOC_NO =:WFDA_DOC_NO',
'       WHERE ROWID  = :WFDA_ROWID;',
'',
'ELSIF :APEX$ROW_STATUS = ''D'' THEN',
'  DELETE  ',
'     FROM wf_direct_authorization',
'    WHERE WFDA_BU = :GLOBAL_BU',
'      AND ROWID   = :ROWID;',
'END IF;',
'',
'   COMMIT;',
'END;			  '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>473913239334629298
);
wwv_flow_imp.component_end;
end;
/
