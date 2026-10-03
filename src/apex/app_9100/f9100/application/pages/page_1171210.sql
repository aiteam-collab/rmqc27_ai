prompt --application/pages/page_1171210
begin
--   Manifest
--     PAGE: 1171210
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
 p_id=>1171210
,p_name=>'POS Unit Access'
,p_alias=>'POS-UNIT-ACCESS'
,p_page_mode=>'MODAL'
,p_step_title=>'POS Unit Access'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function checkanduncheck(a, b) {',
'    var isChecked = document.getElementById("checkbox_" + a).checked;',
'    var checkflag;',
'    if (isChecked) { checkflag = ''Y''; } else { checkflag = ''N''; };',
'    apex.server.process(',
'        "CHECKANDUNCHECK",     //To call the ajax process name here',
'        {',
'            x01: a,',
'            x02: checkflag // Pass the input field value as a parameter',
'        },',
'        {',
'            dataType: ''text'',',
'            success: function (data) {',
'                if (data.trim() !== ''success'') {',
'                    apex.message.showErrors([{ type: "error", location: "page", message: data.replace(''sqlerrm:ORA-20999: '', ''''), unsafe: false }]);',
'                    document.getElementById("checkbox_" + a).checked = false;',
'                    overallcheck();',
'                } else {',
'                    console.log(''success'', data);',
'                    overallcheck();',
'                }',
'            }',
'        }',
'',
'    );',
'};',
'',
'',
'function selectall() {',
'    var isChecked = document.getElementById("check_all").checked;',
'    if (isChecked) {',
'        apex.server.process(',
'            "SELECTALL", // Replace with your AJAX callback name',
'            {},',
'            {',
'                dataType: ''text'',',
'                success: function (data) {',
'                    // Refresh the report region to display the updated data',
'                    console.log(''success'', data); ',
'                    overallcheck();',
'                    apex.region("user").refresh();',
'                },  ',
'                error: function (jqXHR, textStatus, errorThrown) {',
'                    console.error(errorThrown, jqXHR, textStatus);',
'                }',
'            }',
'        );',
'    }',
'    else ',
'       {',
'        apex.server.process(',
'            "UNSELECTALL", // Replace with your AJAX callback name',
'            {},',
'            {',
'                dataType: ''text'',',
'                success: function (data) ',
'                {',
'                    // Refresh the report region to display the updated data',
'                    console.log(''success'', data);',
'                    overallcheck();',
'                    apex.region("user").refresh();',
'                }',
'            }',
'        );',
'    }',
'};',
'',
'',
'function overallcheck() {',
'    var checkbox = document.getElementById("check_all");',
'    apex.server.process(',
'        "OVERALLCHECK",',
'        {},',
'        {  ',
'            dataType: ''text'',',
'            success: function (data) {',
'                console.log(data);',
'                let flag = data.split("-");',
'                ',
'                output.innerText = (flag[1]).toString();',
'',
'                if (flag[0] == ''Y'' && checkbox != null) {',
'                    checkbox.checked = true;',
'                } else if (flag[0] == ''N'' && checkbox != null) {',
'                    checkbox.checked = false;',
'                } else if (flag[0] == ''NY'' && checkbox != null) {',
'                    checkbox.checked = false;',
'                }',
'            }',
'        }',
'    );',
'}'))
,p_javascript_code_onload=>'overallcheck();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* ---Interactive Report--- */',
'.a-IRR-table {',
'    border-collapse: collapse;',
'    table-layout: auto;',
'    border-spacing: 0;',
'    white-space: nowrap;',
'    word-wrap: break-word;',
'}',
'.t-fht-thead {',
'    overflow: auto !important;',
'}',
'/* ---Interactive Report  end--- */',
'',
'.a-IRR-headerLabel, .a-IRR-headerLink {',
'    align-items: center;',
'    display: flex;',
'    background-color: #853f65e8;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'800'
,p_dialog_width=>'1200'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5725184308427779174)
,p_plug_name=>'Count'
,p_static_id=>'count'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-popup-noOverlay:js-popup-callout:js-dialog-size480x320:js-popup-pos-below'
,p_plug_template=>wwv_flow_imp.id(10650512437694505356)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5725181930789779150)
,p_plug_name=>'POS Unit Access'
,p_static_id=>'pos-unit-access'
,p_title=>'POS Unit Access'
,p_region_name=>'user'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wbpat_bu,',
'       wbpat_doc_no,',
'       wbpat_seq_no,',
'       wbpat_plnt_id,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = wbpat_bu',
'           AND bup_plant_id = wbpat_plnt_id) wbpat_plnt_desc,',
'       wbpat_plnt_loc_id,',
'       (SELECT bupld_loc_name',
'          FROM bus_unit_plants_loc_dtls',
'         WHERE bupld_bu = wbpat_bu',
'           AND bupld_loc_id = wbpat_plnt_loc_id )loc_name,',
'       TO_CHAR(wbpat_date_from,func_find_date_format(:global_bu)) wbpat_date_from,',
'       TO_CHAR(wbpat_date_to,func_find_date_format(:global_bu)) wbpat_date_to,',
'       wbpat_cre_by,',
'       wbpat_cre_date,',
'       wbpat_upd_by,',
'       wbpat_upd_date,',
'       wbpat_sel_flag,',
'       wbpat_sel_user,',
'       CASE WHEN wbpat_sel_flag = ''Y'' THEN',
'       ''<input type="checkbox" id="checkbox_''||wbpat_seq_no||''" checked="checked" onChange="checkanduncheck(''||wbpat_seq_no||'',''''N'''')"/>''',
'       ELSE',
'       ''<input type="checkbox" id="checkbox_''||wbpat_seq_no||''" onChange="checkanduncheck(''||wbpat_seq_no||'',''''Y'''')" />''',
'       END',
'       "Flag"',
'  FROM wa_bu_posplnt_access_temp',
' WHERE wbpat_bu = :GLOBAL_BU',
'   AND wbpat_doc_no = :P1171210_HD_DOC_NO',
'   AND ((:P1171210_FILTER = ''N'' AND wbpat_sel_flag = ''N'') ',
'    OR (:P1171210_FILTER  = ''Y'' AND wbpat_sel_flag = ''Y'')',
'    OR (:P1171210_FILTER  = ''A'' AND wbpat_sel_flag IN (''Y'',''N''))',
'    OR :P1171210_FILTER is NULL)',
' ORDER BY wbpat_seq_no;'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'POS Unit Access'
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
 p_id=>wwv_flow_imp.id(5725181974210779151)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>243220138667168123
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5725183567237779167)
,p_db_column_name=>'Flag'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'<input type="checkbox" id="check_all"  onChange="selectall()"/>'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5725182704270779158)
,p_db_column_name=>'LOC_NAME'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Location Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5725182134865779152)
,p_db_column_name=>'WBPAT_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Wbpat Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5725182999983779161)
,p_db_column_name=>'WBPAT_CRE_BY'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Wbpat Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5725183059746779162)
,p_db_column_name=>'WBPAT_CRE_DATE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Wbpat Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5725182742569779159)
,p_db_column_name=>'WBPAT_DATE_FROM'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Date From'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5725182934131779160)
,p_db_column_name=>'WBPAT_DATE_TO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Date To'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5725182172485779153)
,p_db_column_name=>'WBPAT_DOC_NO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Wbpat Doc No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5725182452604779156)
,p_db_column_name=>'WBPAT_PLNT_DESC'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Unit Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5725182426475779155)
,p_db_column_name=>'WBPAT_PLNT_ID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5725182597593779157)
,p_db_column_name=>'WBPAT_PLNT_LOC_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5725183413198779165)
,p_db_column_name=>'WBPAT_SEL_FLAG'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Wbpat Sel Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5725183487490779166)
,p_db_column_name=>'WBPAT_SEL_USER'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Wbpat Sel User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5725182273017779154)
,p_db_column_name=>'WBPAT_SEQ_NO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>' Seq. No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5725183187418779163)
,p_db_column_name=>'WBPAT_UPD_BY'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Wbpat Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5725183289598779164)
,p_db_column_name=>'WBPAT_UPD_DATE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Wbpat Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5729893548266007790)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2479318'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'Flag:WBPAT_SEQ_NO:WBPAT_PLNT_ID:WBPAT_PLNT_DESC:WBPAT_PLNT_LOC_ID:LOC_NAME:WBPAT_DATE_FROM:WBPAT_DATE_TO'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5725184217145779173)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(5725181930789779150)
,p_button_name=>'Count'
,p_static_id=>'count'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'<span id="output"></span>'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5729958035325086732)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(5725181930789779150)
,p_button_name=>'OK'
,p_static_id=>'ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ok'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5729958103289086733)
,p_branch_name=>'Go to page 22'
,p_branch_action=>'f?p=&APP_ID.:12101998:&SESSION.::&DEBUG.::P12101998_ROWID:&P1171210_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(5729958035325086732)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5725184348136779175)
,p_name=>'P1171210_FILTER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5725184308427779174)
,p_item_default=>'A'
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Seleted Rows''   d,',
'       ''Y''              r',
'  FROM dual',
' UNION ALL',
'SELECT ''Unseleted Rows'' d,',
'       ''N''              r',
'  FROM dual',
' UNION ALL',
'SELECT ''All''            d,',
'       ''A''              r',
'  FROM dual;'))
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5725183649748779168)
,p_name=>'P1171210_HD_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(5725181930789779150)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5725184071820779172)
,p_name=>'P1171210_ROWID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(5725181930789779150)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5725183849940779170)
,p_name=>'P1171210_SEL_FLAG'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(5725181930789779150)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5725184001424779171)
,p_name=>'P1171210_SEQ_NO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(5725181930789779150)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5725183796185779169)
,p_name=>'P1171210_USER_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(5725181930789779150)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5725184481402779176)
,p_name=>'Count'
,p_static_id=>'count'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5725184217145779173)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5725184584695779177)
,p_event_id=>wwv_flow_imp.id(5725184481402779176)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Count Region Open'
,p_static_id=>'count-region-open'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(5725184308427779174)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5725184651072779178)
,p_name=>'POS Unit Access Refresh'
,p_static_id=>'pos-unit-access-refresh'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1171210_FILTER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5729957687628086729)
,p_event_id=>wwv_flow_imp.id(5725184651072779178)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'POS Unit Access Refresh'
,p_static_id=>'pos-unit-access-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(5725181930789779150)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5729958206418086734)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECKANDUNCHECK'
,p_static_id=>'checkanduncheck'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE wa_bu_posplnt_access_temp',
'       SET wbpat_sel_flag = APEX_APPLICATION.G_X02,',
'           wbpat_sel_user = :GLOBAL_user',
'     WHERE wbpat_bu       = :GLOBAL_BU',
'       AND wbpat_doc_no   = :P1171210_HD_DOC_NO',
'       AND wbpat_seq_no   = APEX_APPLICATION.G_X01;',
'',
'    COMMIT;',
'    HTP.P(''success'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>247996370874475706
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5729958470374086737)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OVERALLCHECK'
,p_static_id=>'overallcheck'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_flag  VARCHAR2(5);',
'    v_count VARCHAR2(10);',
'BEGIN',
'    SELECT CASE WHEN wbpat_sel_flag  = ''N'' THEN ''N''',
'                WHEN wbpat_sel_flag  = ''Y'' THEN ''Y''',
'           ELSE ''NY''',
'           END flag ',
'      INTO v_flag',
'      FROM (SELECT LISTAGG(DISTINCT wbpat_sel_flag , '','') WITHIN GROUP( ORDER BY wbpat_sel_flag ) wbpat_sel_flag',
'              FROM wa_bu_posplnt_access_temp',
'             WHERE wbpat_bu     = :GLOBAL_BU',
'               AND wbpat_doc_no = :P1171210_HD_DOC_NO',
'           );',
'',
'    SELECT NVL(COUNT(wbpat_sel_flag ), 0 ) ',
'      INTO v_count',
'      FROM wa_bu_posplnt_access_temp',
'     WHERE wbpat_bu       = :GLOBAL_BU',
'       AND wbpat_doc_no   = :P79_HD_DOC_NO ',
'       AND wbpat_sel_flag = ''Y'';',
'',
'    HTP.P(v_flag ||''-'' ||v_count ||'' '' ||''row Selected'');',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>247996634830475709
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5729957908507086731)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Processing Ok'
,p_static_id=>'processing-ok'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR c1',
'       IS',
'    SELECT *',
'      FROM wa_bu_posplnt_access_temp',
'     WHERE wbpat_bu       = :GLOBAL_BU',
'       AND wbpat_sel_flag = ''Y''',
'       AND wbpat_sel_user = :GLOBAL_USER',
'       AND wbpat_doc_no   = :P1171210_HD_DOC_NO;',
'',
'    v_seq_no            NUMBER(5);',
'    v_cnt               NUMBER(5);',
'',
'BEGIN',
'    SELECT COUNT(*)',
'      INTO v_cnt',
'      FROM wa_bu_posplnt_access_temp',
'     WHERE wbpat_bu       = :GLOBAL_BU',
'       AND wbpat_doc_no   = :P1171210_HD_DOC_NO',
'       AND wbpat_sel_flag = ''Y'';',
'  ',
'    IF v_cnt = 0 THEN',
'       raise_application_error(-20010,''Select the Unit.'');',
'    ELSE',
'',
'    FOR cr1 IN c1',
'    LOOP',
'        SELECT NVL(MAX(wppaln_seq_no)+1,1)',
'          INTO v_seq_no',
'          FROM wapl_posuser_plnt_access_ln',
'         WHERE wppaln_bu     = :GLOBAL_bu',
'           AND wppaln_doc_no = :P1171210_HD_DOC_NO;',
'',
'        INSERT INTO wapl_posuser_plnt_access_ln (',
'                    wppaln_bu,',
'                    wppaln_doc_no,',
'                    wppaln_seq_no,',
'                    WpPALn_USER_ID,',
'                    wppaln_plnt_id,',
'                    wppaln_plnt_loc_id,',
'                    wppaln_date_from,',
'                    wppaln_date_to,',
'                    wppaln_type,',
'                    wppaln_cre_by,',
'                    wppaln_cre_date,',
'                    wppaln_sel_flag,',
'                    wppaln_sel_user',
'                    )',
'            VALUES (',
'                    :GLOBAL_bu,',
'                    :P1171210_HD_DOC_NO,',
'                    v_seq_no,',
'                    cr1.wbpat_user_id,',
'                    cr1.wbpat_plnt_id,',
'                    cr1.wbpat_plnt_loc_id,',
'                    trunc(SYSDATE),',
'                    TO_DATE (''31-12-2099'',''DD-MM-YYYY''),',
'                    ''N'',',
'                    :GLOBAL_user,',
'                    SYSDATE,',
'                    ''Y'',',
'                    :GLOBAL_user',
'                   );',
'    END LOOP;',
'        commit;',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5729958035325086732)
,p_internal_uid=>247996072963475703
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5729957781207086730)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Select Flag'
,p_static_id=>'select-flag'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF :P1171210_SEL_FLAG  = ''N'' THEN',
'       :P1171210_SEL_FLAG := ''Y'';',
'    ELSE',
'       :P1171210_SEL_FLAG := ''N'';',
'    END IF;',
'',
'    IF :P1171210_SEL_FLAG =''Y'' THEN',
'        --raise_application_error(-20999,:P1171210_SEL_FLAG);',
'        UPDATE WA_BU_PLNT_ACCESS_TEMP',
'           SET WBPAT_SEL_FLAG = :P1171210_SEL_FLAG,',
'               WBPAT_SEL_USER = :GLOBAL_USER',
'         WHERE WBPAT_BU       = :GLOBAL_BU',
'           AND WBPAT_DOC_NO   = :P1171210_HD_DOC_NO',
'           AND WBPAT_SEQ_NO   = :P1171210_SEQ_NO;',
'    ELSE',
'        UPDATE WA_BU_PLNT_ACCESS_TEMP',
'           SET WBPAT_SEL_FLAG = :P1171210_SEL_FLAG,',
'               WBPAT_SEL_USER = NULL',
'         WHERE WBPAT_BU       = :GLOBAL_BU',
'           AND WBPAT_DOC_NO   = :P1171210_HD_DOC_NO',
'           AND WBPAT_SEQ_NO   = :P1171210_SEQ_NO;',
'    END IF;',
'        COMMIT;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SEL_FLAG'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>247995945663475702
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5729958302641086735)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SELECTALL'
,p_static_id=>'selectall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_seq_no            NUMBER(5);',
'    TYPE                pyrl_ref_cursor IS REF CURSOR;',
'    pyrl_cursor         pyrl_ref_cursor;',
'BEGIN ',
'    OPEN pyrl_cursor FOR ''SELECT wbpat_seq_no FROM wa_bu_plnt_access_temp WHERE wbpat_bu      = ''''''||:GLOBAL_bu||''''''',
'                                                                     AND wbpat_doc_no  = ''''''||:P1171210_HD_DOC_NO||''''''AND ''',
'                                                                    ||FUNC_FIND_IR_CONDITION_EXP( 800, 79, ''User Access'', :APP_SESSION);',
'    LOOP',
'        FETCH pyrl_cursor INTO v_seq_no;',
'        EXIT WHEN pyrl_cursor%NOTFOUND;',
'',
'            UPDATE wa_bu_plnt_access_temp',
'               SET wbpat_sel_flag = ''Y'',',
'                   wbpat_sel_user = :GLOBAL_user',
'             WHERE wbpat_bu       = :GLOBAL_BU',
'               AND wbpat_doc_no   = :P1171210_HD_DOC_NO',
'               AND wbpat_seq_no   = v_seq_no;',
'',
'    END LOOP;',
'    CLOSE pyrl_cursor;',
'',
'    COMMIT;',
'    HTP.P(''success'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>247996467097475707
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5729958367462086736)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UNSELECTALL'
,p_static_id=>'unselectall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE wa_bu_posplnt_access_temp',
'       SET wbpat_sel_flag = ''N''',
'     WHERE wbpat_bu       = :GLOBAL_BU',
'       AND wbpat_doc_no   = :P1171210_HD_DOC_NO;',
'    COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>247996531918475708
);
wwv_flow_imp.component_end;
end;
/
