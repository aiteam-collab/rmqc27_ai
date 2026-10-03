prompt --application/pages/page_00079
begin
--   Manifest
--     PAGE: 00079
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
 p_id=>79
,p_name=>'Unit Access'
,p_alias=>'UNIT-ACCESS'
,p_page_mode=>'MODAL'
,p_step_title=>'Unit Access'
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
 p_id=>wwv_flow_imp.id(7719169142013789859)
,p_plug_name=>'Count'
,p_static_id=>'count'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:t-DialogRegion--noPadding:js-popup-noOverlay:js-popup-callout:js-dialog-size600x400:js-popup-pos-below:t-Form--stretchInputs'
,p_region_attributes=>'data-parent-element="#BTN"'
,p_plug_template=>wwv_flow_imp.id(10650512437694505356)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6630099201949347070)
,p_plug_name=>'User Access'
,p_static_id=>'user-access'
,p_region_name=>'user'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select WBPAT_BU,',
'       WBPAT_DOC_NO,',
'       WBPAT_SEQ_NO,',
'       WBPAT_PLNT_ID,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = wbpat_bu',
'           AND bup_plant_id = wbpat_plnt_id) wbpat_plnt_desc,',
'       WBPAT_PLNT_LOC_ID,',
'       (select bupld_loc_name',
'        FROM bus_unit_plants_loc_dtls',
'       WHERE bupld_bu = WBPAT_BU',
'       and bupld_loc_id = WBPAT_PLNT_LOC_ID)Loc_name,',
'       TO_CHAR(WBPAT_DATE_FROM,func_find_date_format(:Global_bu)) WBPAT_DATE_FROM,',
'       TO_CHAR(WBPAT_DATE_TO,func_find_date_format(:Global_bu)) WBPAT_DATE_TO,',
'       WBPAT_CRE_BY,',
'       WBPAT_CRE_DATE,',
'       WBPAT_UPD_BY,',
'       WBPAT_UPD_DATE,',
'       WBPAT_SEL_FLAG,',
'       WBPAT_SEL_USER,',
'       /*case when WBPAT_SEL_FLAG =''Y'' then ',
'        ''<span aria-hidden="true" class="fa fa-check-square" style = "color:blue;"></span>''',
'	    ELSE',
'		''<span aria-hidden="true" class="fa fa-square-o"  style = "color:black;"></span>''',
'       END*/',
'        CASE WHEN WBPAT_SEL_FLAG = ''Y'' THEN',
'        ''<input type="checkbox" id="checkbox_''||WBPAT_SEQ_NO||''" checked="checked" onChange="checkanduncheck(''||WBPAT_SEQ_NO||'',''''N'''')"/>''',
'        ELSE',
'        ''<input type="checkbox" id="checkbox_''||WBPAT_SEQ_NO||''" onChange="checkanduncheck(''||WBPAT_SEQ_NO||'',''''Y'''')" />''',
'        END        ',
'       "Flag"',
'  from WA_BU_PLNT_ACCESS_TEMP',
' WHERE WBPAT_BU=:global_bu',
'   AND WBPAT_DOC_NO = :P79_HD_DOC_NO',
'   AND  ((:P79_FILTER = ''N'' AND WBPAT_SEL_FLAG = ''N'') ',
'          OR (:P79_FILTER = ''Y'' AND WBPAT_SEL_FLAG = ''Y'') ',
'          OR (:P79_FILTER = ''A'' AND WBPAT_SEL_FLAG IN (''Y'',''N''))',
'          OR :P79_FILTER is NULL)',
'  ORDER BY WBPAT_SEQ_NO;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P79_HD_DOC_NO,P79_USER_ID,P79_FILTER'
,p_prn_page_header=>'User Access'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6630099362118347070)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1148137526574736042
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6630120270527406537)
,p_db_column_name=>'Flag'
,p_display_order=>23
,p_column_identifier=>'O'
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
 p_id=>wwv_flow_imp.id(6077302697265250359)
,p_db_column_name=>'LOC_NAME'
,p_display_order=>73
,p_column_identifier=>'U'
,p_column_label=>'Loc. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6077302237234250355)
,p_db_column_name=>'WBPAT_BU'
,p_display_order=>33
,p_column_identifier=>'Q'
,p_column_label=>'Wbpat Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6077303005863250362)
,p_db_column_name=>'WBPAT_CRE_BY'
,p_display_order=>103
,p_column_identifier=>'X'
,p_column_label=>'Wbpat Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6077303119967250363)
,p_db_column_name=>'WBPAT_CRE_DATE'
,p_display_order=>113
,p_column_identifier=>'Y'
,p_column_label=>'Wbpat Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6488222332139919937)
,p_db_column_name=>'WBPAT_DATE_FROM'
,p_display_order=>183
,p_column_identifier=>'AF'
,p_column_label=>'Date From'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6488222379688919938)
,p_db_column_name=>'WBPAT_DATE_TO'
,p_display_order=>193
,p_column_identifier=>'AG'
,p_column_label=>'Date To'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6077302360309250356)
,p_db_column_name=>'WBPAT_DOC_NO'
,p_display_order=>43
,p_column_identifier=>'R'
,p_column_label=>'Wbpat Doc No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6488222219635919936)
,p_db_column_name=>'WBPAT_PLNT_DESC'
,p_display_order=>173
,p_column_identifier=>'AE'
,p_column_label=>'Unit Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6488222126582919935)
,p_db_column_name=>'WBPAT_PLNT_ID'
,p_display_order=>163
,p_column_identifier=>'AD'
,p_column_label=>'Unit ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6077302590251250358)
,p_db_column_name=>'WBPAT_PLNT_LOC_ID'
,p_display_order=>63
,p_column_identifier=>'T'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6077303433126250366)
,p_db_column_name=>'WBPAT_SEL_FLAG'
,p_display_order=>143
,p_column_identifier=>'AB'
,p_column_label=>'Wbpat Sel Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6077303462043250367)
,p_db_column_name=>'WBPAT_SEL_USER'
,p_display_order=>153
,p_column_identifier=>'AC'
,p_column_label=>'Wbpat Sel User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6077302525160250357)
,p_db_column_name=>'WBPAT_SEQ_NO'
,p_display_order=>53
,p_column_identifier=>'S'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6077303168558250364)
,p_db_column_name=>'WBPAT_UPD_BY'
,p_display_order=>123
,p_column_identifier=>'Z'
,p_column_label=>'Wbpat Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6077303294863250365)
,p_db_column_name=>'WBPAT_UPD_DATE'
,p_display_order=>133
,p_column_identifier=>'AA'
,p_column_label=>'Wbpat Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6630116652771375183)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'5522601'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'Flag:WBPAT_SEQ_NO:WBPAT_PLNT_ID:WBPAT_PLNT_DESC:WBPAT_PLNT_LOC_ID:LOC_NAME:WBPAT_DATE_FROM:WBPAT_DATE_TO'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6601177716658417499)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(6630099201949347070)
,p_button_name=>'Count'
,p_static_id=>'count'
,p_button_static_id=>'BTN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'<span id="output"></span>'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6077863500898685017)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6630099201949347070)
,p_button_name=>'Ok'
,p_static_id=>'ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ok'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_icon_css_classes=>'fa-thumbs-up'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6077866870211685062)
,p_branch_name=>'Go To Page 83'
,p_branch_action=>'f?p=&APP_ID.:83:&SESSION.::&DEBUG.::P83_ROWID:&P79_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6077863500898685017)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7719169528087789935)
,p_name=>'P79_FILTER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7719169142013789859)
,p_item_default=>'A'
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ''Seleted Rows''   D,',
'    ''Y''              R',
'FROM',
'    DUAL UNION ALL',
'    SELECT',
'        ''Unseleted Rows'' D,',
'        ''N''              R',
'    FROM',
'        DUAL UNION ALL',
'        SELECT',
'            ''All''            D,',
'            ''A''              R',
'        FROM',
'            DUAL;',
''))
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6545209304540136567)
,p_name=>'P79_HD_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6630099201949347070)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6630128600429406630)
,p_name=>'P79_ROWID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6630099201949347070)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6630127760265406622)
,p_name=>'P79_SEL_FLAG'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6630099201949347070)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6630127971365406624)
,p_name=>'P79_SEQ_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6630099201949347070)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6545209372727136568)
,p_name=>'P79_USER_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6630099201949347070)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6601177885421418726)
,p_name=>'Count_btn'
,p_static_id=>'count-btn'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6601177716658417499)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6601178266266418729)
,p_event_id=>wwv_flow_imp.id(6601177885421418726)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7719169142013789859)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6601169061047387538)
,p_name=>'P71_FILTER'
,p_static_id=>'p71-filter'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P79_FILTER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6601169493702387540)
,p_event_id=>wwv_flow_imp.id(6601169061047387538)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6630099201949347070)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6599965688912015654)
,p_name=>'User Access'
,p_static_id=>'user-access'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6630099201949347070)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6599965861765015656)
,p_event_id=>wwv_flow_imp.id(6599965688912015654)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7719169142013789859)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6599965794175015655)
,p_event_id=>wwv_flow_imp.id(6599965688912015654)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'overallcheck();')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6599964982943015647)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECKANDUNCHECK'
,p_static_id=>'checkanduncheck'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE wa_bu_plnt_access_temp',
'       SET wbpat_sel_flag = APEX_APPLICATION.G_X02,',
'           wbpat_sel_user = :Global_user',
'     WHERE wbpat_bu     = :GLOBAL_BU',
'       AND wbpat_doc_no = :P79_HD_DOC_NO',
'       AND wbpat_seq_no = APEX_APPLICATION.G_X01;',
'    COMMIT;',
'    HTP.P(''success'');',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1118003147399404619
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6599965325258015650)
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
'      FROM (SELECT LISTAGG(DISTINCT wbpat_sel_flag , '','') WITHIN GROUP( ORDER BY wbpat_sel_flag  ) wbpat_sel_flag ',
'              FROM wa_bu_plnt_access_temp',
'             WHERE wbpat_bu          = :GLOBAL_BU',
'               AND wbpat_doc_no      = :P79_HD_DOC_NO              ',
'           );',
'    ',
'    SELECT NVL(COUNT(wbpat_sel_flag ), 0 ) ',
'      INTO v_count',
'      FROM wa_bu_plnt_access_temp',
'     WHERE wbpat_bu             = :GLOBAL_BU',
'       AND wbpat_doc_no         = :P79_HD_DOC_NO ',
'       AND wbpat_sel_flag  = ''Y'';',
'       ',
'    HTP.P(v_flag ||''-'' ||v_count ||'' '' ||''row Selected'');',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1118003489714404622
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6077865584375685056)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Insert Users'
,p_static_id=>'process-for-insert-users'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'CURSOR c1',
'IS',
'SELECT wbf_bus_fun_id,',
'       wbf_bus_fun_name ',
'  FROM wapl_bus_fun',
' WHERE wbf_bus_fun_id NOT IN (SELECT  WUBFA_BUS_FUN_ID ',
'                                  FROM wapl_user_bus_fun_accs',
'                                 WHERE wubfa_user_id=:P111326009501_WBFAHD_USER_ID);',
'',
' v_seq_no     VARCHAR2(5);                                ',
'BEGIN',
'        DELETE wa_bu_fun_access_temp',
'         WHERE wbfat_bu = :global_bu',
'           AND wbfat_doc_no = :P79_HD_DOC_NO',
'           AND wbfat_user_id=:P79_USER_ID;',
'FOR cr1 IN c1',
'LOOP',
'      SELECT NVL (MAX (TO_NUMBER (wbfat_seq_no)), 0) + 1',
'        INTO v_seq_no',
'        FROM wa_bu_fun_access_temp',
'       WHERE wbfat_bu = :global_bu',
'             AND wbfat_doc_no = :P79_HD_DOC_NO;',
'      ',
'      INSERT INTO WA_BU_FUN_ACCESS_TEMP(WBFAT_BU,',
'                                  WBFAT_DOC_NO,',
'                                  WBFAT_SEQ_NO,',
'                                  WBFAT_BUS_FUN_ID,',
'                                  WBFAT_BUS_FUN_NAME,',
'                                  WBFAT_DATE_FROM,',
'                                  WBFAT_DATE_TO,',
'                                  WBFAT_CRE_BY,',
'                                  WBFAT_CRE_DATE,',
'                                  WBFAT_SEL_FLAG,',
'                                  WBFAT_SEL_USER,',
'                                  WBFAT_USER_ID)',
'                      VALUES(:global_bu,',
'                             :P79_HD_DOC_NO,',
'                             v_seq_no,',
'                             cr1.wbf_bus_fun_id,',
'                             cr1.wbf_bus_fun_name,',
'                             trunc(SYSDATE),',
'                             trunc(SYSDATE),',
'                             :global_user,',
'                             SYSDATE,',
'                             ''N'',',
'                             :global_user,',
'                             :P79_USER_ID);              ',
'END LOOP;',
'END;  '))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>595903748832074028
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6077303562091250368)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save'
,p_static_id=>'save'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    CURSOR c1',
'       IS',
'    SELECT *',
'      FROM WA_BU_PLNT_ACCESS_TEMP',
'     WHERE wbpat_bu             =:GLOBAL_bu',
'       AND wbpat_sel_flag       =''Y''',
'       AND wbpat_sel_user       =:GLOBAL_USER',
'       AND wbpat_doc_no         =:P79_HD_DOC_NO;',
'',
'     v_seq_no      NUMBER(5);',
'     v_cnt         NUMBER(5);',
'BEGIN',
'  SELECT COUNT(*)',
'    INTO v_cnt',
'    FROM wa_bu_plnt_access_temp',
'   WHERE wbpat_bu       =:GLOBAL_bu',
'     AND wbpat_doc_no   =:P79_HD_DOC_NO',
'     AND wbpat_sel_flag = ''Y'';',
'  ',
'  IF v_cnt = 0 THEN',
'  	 raise_application_error(-20010,''Select the Unit.'');	',
'  ELSE',
'    FOR cr1 IN c1',
' 	LOOP',
'	   SELECT NVL(MAX(wupal_seq_no)+1,1)',
'	     INTO v_seq_no',
'	     FROM wapl_user_plnt_access_ln',
'	    WHERE wupal_bu   = :GLOBAL_bu',
'	      AND wupal_doc_no = :P79_HD_DOC_NO;',
'        ',
'        INSERT INTO wapl_user_plnt_access_ln (wupal_bu,',
'                                              wupal_doc_no,',
'                                              wupal_seq_no,',
'                                              WUPAL_USER_ID,',
'                                              wupal_plnt_id,',
'                                              wupal_plnt_loc_id,',
'                                              wupal_date_from,',
'                                              wupal_date_to,',
'                                              wupal_type,',
'                                              wupal_cre_by,',
'                                              wupal_cre_date,',
'                                              wupal_sel_flag,',
'                                              wupal_sel_user)',
'                                     VALUES (:global_bu,',
'                                             :P79_HD_DOC_NO,',
'                                             v_seq_no,',
'                                             cr1.WBPAT_USER_ID,',
'                                             cr1.wbpat_plnt_id,',
'                                             cr1.WBPAT_PLNT_LOC_ID,',
'                                             trunc(SYSDATE),',
'                                             TO_DATE (''31-12-2099'',''DD-MM-YYYY''),',
'                                             ''N'',',
'                                             :global_user,',
'                                             SYSDATE,',
'                                             ''Y'',',
'                                             :global_user);',
'    END LOOP;',
'    commit;',
'  ',
'  END IF;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6077863500898685017)
,p_internal_uid=>595341726547639340
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6077866035386685057)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Select Flag'
,p_static_id=>'select-flag'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF :P79_SEL_FLAG =''N'' THEN',
':P79_SEL_FLAG := ''Y'';',
'ELSE',
':P79_SEL_FLAG :=''N'';',
'END IF;',
'IF :P79_SEL_FLAG =''Y'' THEN',
'--raise_application_error(-20999,:P79_SEL_FLAG);',
' UPDATE WA_BU_PLNT_ACCESS_TEMP',
'    SET WBPAT_SEL_FLAG = :P79_SEL_FLAG,',
'        WBPAT_SEL_USER = :global_user ',
'  WHERE WBPAT_BU  = :Global_bu',
'    AND WBPAT_DOC_NO = :P79_HD_DOC_NO',
'    AND WBPAT_SEQ_NO = :P79_SEQ_NO;  ',
'ELSE',
' UPDATE WA_BU_PLNT_ACCESS_TEMP',
'    SET WBPAT_SEL_FLAG = :P79_SEL_FLAG,',
'        WBPAT_SEL_USER = NULL ',
'  WHERE WBPAT_BU  = :Global_bu',
'    AND WBPAT_DOC_NO = :P79_HD_DOC_NO',
'    AND WBPAT_SEQ_NO = :P79_SEQ_NO; ',
'END IF;            ',
'COMMIT;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SEL_FLAG'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>595904199843074029
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6599965067878015648)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SELECTALL'
,p_static_id=>'selectall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_seq_no   NUMBER(5);',
'    TYPE pyrl_ref_cursor IS REF CURSOR;',
'    pyrl_cursor pyrl_ref_cursor;',
'BEGIN ',
'    OPEN pyrl_cursor FOR ''SELECT wbpat_seq_no FROM wa_bu_plnt_access_temp WHERE wbpat_bu      = ''''''||:Global_bu||''''''',
'                                                                     AND wbpat_doc_no  = ''''''||:P79_HD_DOC_NO||''''''AND ''',
'                                                                    ||FUNC_FIND_IR_CONDITION_EXP( 800, 79, ''User Access'', :APP_SESSION);',
'    LOOP    ',
'        FETCH pyrl_cursor INTO v_seq_no;',
'        EXIT WHEN pyrl_cursor%NOTFOUND;',
'        ',
'            UPDATE wa_bu_plnt_access_temp',
'               SET wbpat_sel_flag = ''Y'',',
'                   wbpat_sel_user = :Global_user',
'             WHERE wbpat_bu     = :GLOBAL_BU',
'               AND wbpat_doc_no = :P79_HD_DOC_NO',
'               AND wbpat_seq_no = v_seq_no;',
'           ',
'    END LOOP;',
'    CLOSE pyrl_cursor;',
'    COMMIT;',
'    HTP.P(''success'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1118003232334404620
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6599965212588015649)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UNSELECTALL'
,p_static_id=>'unselectall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE wa_bu_plnt_access_temp',
'       SET wbpat_sel_flag = ''N''',
'     WHERE wbpat_bu     = :GLOBAL_BU',
'       AND wbpat_doc_no = :P79_HD_DOC_NO;',
'    COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1118003377044404621
);
wwv_flow_imp.component_end;
end;
/
