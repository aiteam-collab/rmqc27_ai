prompt --application/pages/page_00182
begin
--   Manifest
--     PAGE: 00182
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
 p_id=>182
,p_name=>'User Notification  Access'
,p_alias=>'USER-NOTIFICATION-ACCESS'
,p_page_mode=>'MODAL'
,p_step_title=>'User Notification  Access'
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
'            dataType: ''text'', ',
'            success: function (data) { ',
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
'function selectall() {',
'    var isChecked = document.getElementById("check_all").checked;',
'    if (isChecked) {',
'        apex.server.process(',
'            "SELECTALL", // Replace with your AJAX callback name',
'            {},',
'            {',
'                dataType: ''text'',',
'                success: function (data) { ',
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
'                ',
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
'.a-IRR-headerLabel, .a-IRR-headerLink ',
'{',
'    align-items: center;',
'    display: flex;',
'   // BACKGROUND-COLOR: #853f65e8;',
'}',
'',
'/*   PRASANTH   CheckBox Color  */',
'.apex-item-single-checkbox input:checked+.u-checkbox, .apex-item-single-checkbox input:checked+label, .u-checkbox.is-checked {',
'    --a-checkbox-background-color: white;',
'    --a-checkbox-text-color: #028107;',
'    --a-button-border-radius: #00d7c9;',
'    --a-checkbox-border-color: #cd9a00;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1000'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7698616377675777479)
,p_plug_name=>'Count'
,p_static_id=>'count'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:t-DialogRegion--noPadding:js-popup-noOverlay:js-popup-callout:js-dialog-size600x400:js-popup-pos-below:t-Form--stretchInputs'
,p_region_attributes=>'data-parent-element="#BTN"'
,p_plug_template=>wwv_flow_imp.id(10650512437694505356)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7132857453412035011)
,p_plug_name=>'User Access'
,p_static_id=>'user-access'
,p_region_name=>'user'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select WUNAT_BU,',
'       WUNAT_DOC_NO,',
'       WUNAT_SEQ_NO,',
'       WUNAT_BUS_FUN_ID,',
'       WUNAT_BUS_FUN_NAME,',
'       TO_CHAR(WUNAT_DATE_FROM,func_find_date_format(:Global_bu)) WUNAT_DATE_FROM,',
'       TO_CHAR(WUNAT_DATE_TO,func_find_date_format(:Global_bu)) WUNAT_DATE_TO,',
'       WUNAT_CRE_BY,',
'       WUNAT_CRE_DATE,',
'       WUNAT_UPD_BY,',
'       WUNAT_UPD_DATE,',
'       WUNAT_SEL_FLAG,',
'       WUNAT_SEL_USER,',
'       wunat_user_id,',
'       CASE WHEN WUNAT_SEL_FLAG = ''Y'' THEN',
'       ''<input type="checkbox" id="checkbox_''||WUNAT_SEQ_NO||''" checked="checked" onChange="checkanduncheck(''||WUNAT_SEQ_NO||'',''''Y'''')"/>''',
'       ELSE',
'       ''<input type="checkbox" id="checkbox_''||WUNAT_SEQ_NO||''" onChange="checkanduncheck(''||WUNAT_SEQ_NO||'',''''N'''')" />''',
'       END      ',
'       "Flag",',
'       (SELECT wnl_bus_fun_name',
'           FROM wapl_notify_list',
'          WHERE wnl_par_fun_id IS NULL',
'             AND wnl_bus_fun_id IN',
'                       (SELECT wnl_par_fun_id',
'                          FROM wapl_notify_list',
'                         WHERE wnl_par_fun_id IS NOT NULL',
'                               AND wnl_bus_fun_id = wunat_bus_fun_id)) par_bus_fun,',
'       WUNAT_MODULE                        ',
'  from WA_USER_NOTIF_ACCESS_TEMP',
' WHERE WUNAT_BU=:global_bu',
'   AND WUNAT_DOC_NO=:P182_HD_DOC_NO     ',
'  ORDER BY WUNAT_SEQ_NO;  '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P182_HD_DOC_NO'
,p_prn_page_header=>'User Access'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(7132857613581035011)
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
,p_internal_uid=>1653336629796114809
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7132878521990094478)
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
 p_id=>wwv_flow_imp.id(6560638709666429424)
,p_db_column_name=>'PAR_BUS_FUN'
,p_display_order=>83
,p_column_identifier=>'AI'
,p_column_label=>'Par. Bus. Fun.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6560637225039429409)
,p_db_column_name=>'WUNAT_BU'
,p_display_order=>33
,p_column_identifier=>'U'
,p_column_label=>'Wunat Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6560637552927429412)
,p_db_column_name=>'WUNAT_BUS_FUN_ID'
,p_display_order=>63
,p_column_identifier=>'X'
,p_column_label=>'Notification ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6560637683518429413)
,p_db_column_name=>'WUNAT_BUS_FUN_NAME'
,p_display_order=>73
,p_column_identifier=>'Y'
,p_column_label=>'Notification Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6560637928090429416)
,p_db_column_name=>'WUNAT_CRE_BY'
,p_display_order=>113
,p_column_identifier=>'AB'
,p_column_label=>'Wunat Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6560638013773429417)
,p_db_column_name=>'WUNAT_CRE_DATE'
,p_display_order=>123
,p_column_identifier=>'AC'
,p_column_label=>'Wunat Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6560637734270429414)
,p_db_column_name=>'WUNAT_DATE_FROM'
,p_display_order=>93
,p_column_identifier=>'Z'
,p_column_label=>'Date From'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6560637808218429415)
,p_db_column_name=>'WUNAT_DATE_TO'
,p_display_order=>103
,p_column_identifier=>'AA'
,p_column_label=>'Date To'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6560637366087429410)
,p_db_column_name=>'WUNAT_DOC_NO'
,p_display_order=>43
,p_column_identifier=>'V'
,p_column_label=>'Wunat Doc No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6608473168824122712)
,p_db_column_name=>'WUNAT_MODULE'
,p_display_order=>183
,p_column_identifier=>'AJ'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6560638379606429420)
,p_db_column_name=>'WUNAT_SEL_FLAG'
,p_display_order=>153
,p_column_identifier=>'AF'
,p_column_label=>'Wunat Sel Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6560638466179429421)
,p_db_column_name=>'WUNAT_SEL_USER'
,p_display_order=>163
,p_column_identifier=>'AG'
,p_column_label=>'Wunat Sel User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6560637392182429411)
,p_db_column_name=>'WUNAT_SEQ_NO'
,p_display_order=>53
,p_column_identifier=>'W'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6560638167976429418)
,p_db_column_name=>'WUNAT_UPD_BY'
,p_display_order=>133
,p_column_identifier=>'AD'
,p_column_label=>'Wunat Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6560638282916429419)
,p_db_column_name=>'WUNAT_UPD_DATE'
,p_display_order=>143
,p_column_identifier=>'AE'
,p_column_label=>'Wunat Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6560638575238429422)
,p_db_column_name=>'WUNAT_USER_ID'
,p_display_order=>173
,p_column_identifier=>'AH'
,p_column_label=>'Wunat User Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7132874904234063124)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'5522601'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'Flag:WUNAT_SEQ_NO:WUNAT_MODULE:WUNAT_BUS_FUN_ID:WUNAT_BUS_FUN_NAME:WUNAT_DATE_FROM:WUNAT_DATE_TO'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6578181071117682097)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(7132857453412035011)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-window-close'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6578180280216682095)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(7132857453412035011)
,p_button_name=>'Count'
,p_static_id=>'count'
,p_button_static_id=>'BTN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'<span id="output"></span>'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6578180676333682097)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(7132857453412035011)
,p_button_name=>'Ok'
,p_static_id=>'ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ok'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6578198235064682137)
,p_branch_name=>'Go To Page 181'
,p_branch_action=>'f?p=&APP_ID.:181:&SESSION.::&DEBUG.:RR,181:P181_ROWID:&P182_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6578180676333682097)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7698625848412777536)
,p_name=>'P182_FILTER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7698616377675777479)
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
 p_id=>wwv_flow_imp.id(7047967747891824472)
,p_name=>'P182_HD_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7132857453412035011)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7132887043781094535)
,p_name=>'P182_ROWID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7132857453412035011)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7132886203617094527)
,p_name=>'P182_SEL_FLAG'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7132857453412035011)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7132886414717094529)
,p_name=>'P182_SEQ_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7132857453412035011)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7047967816078824473)
,p_name=>'P182_USER_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7132857453412035011)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6578191330661682134)
,p_name=>'Close'
,p_static_id=>'close'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6578181071117682097)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6578191786209682134)
,p_event_id=>wwv_flow_imp.id(6578191330661682134)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-close'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6578189888333682133)
,p_name=>'Count'
,p_static_id=>'count'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7132857453412035011)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6578190433830682133)
,p_event_id=>wwv_flow_imp.id(6578189888333682133)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'overallcheck();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6578188148399682130)
,p_name=>'Count_btn'
,p_static_id=>'count-btn'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6578180280216682095)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6578188601441682133)
,p_event_id=>wwv_flow_imp.id(6578188148399682130)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7698616377675777479)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6578196713846682136)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6578180676333682097)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6578197689436682137)
,p_event_id=>wwv_flow_imp.id(6578196713846682136)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-close'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6578197222609682137)
,p_event_id=>wwv_flow_imp.id(6578196713846682136)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P182_HD_DOC_NO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    'CURSOR c1',
    '    IS',
    '    SELECT *',
    '      FROM WA_BU_FUN_ACCESS_TEMP',
    '     WHERE wbfat_bu        =  :global_bu',
    '       AND wbfat_sel_flag  =  ''Y''',
    '       AND wbfat_doc_no    =  :P182_HD_DOC_NO;',
    '',
    '    v_seq_no          NUMBER(5);',
    '    v_cnt 			  NUMBER(5);',
    'BEGIN',
    '/*',
    '    DELETE',
    '      FROM wa_bu_fun_access_ln',
    '     WHERE wbfaln_bu 	 = :GLOBAL_bu',
    '       AND wbfaln_doc_no = :P182_HD_DOC_NO;',
    '*/',
    ' ',
    '    SELECT COUNT(*)',
    '      INTO v_cnt',
    '      FROM wa_bu_fun_access_temp',
    '     WHERE wbfat_bu       = :GLOBAL_bu',
    '       AND wbfat_doc_no   = :P182_HD_DOC_NO',
    '       AND wbfat_sel_flag = ''Y'';',
    '  ',
    '    IF v_cnt = 0 THEN',
    '       RAISE_APPLICATION_ERROR(-20010,''Select the Bus. Fun.'');	',
    '    ELSE',
    '        FOR cr1 IN c1',
    '        LOOP  ',
    '            SELECT nvl(max(WBFALN_SEQ_NO)+1,1)',
    '              into v_seq_no',
    '              FROM wa_bu_fun_access_ln',
    '             WHERE wbfaln_bu = :Global_bu',
    '              AND WBFALN_DOC_NO = :P182_HD_DOC_NO;',
    '',
    '            INSERT INTO wa_bu_fun_access_ln(WBFALN_BU,',
    '                                             WBFALN_DOC_NO,',
    '                                             WBFALN_SEQ_NO,',
    '                                             WBFALN_BUS_FUN_ID,',
    '                                             WBFALN_BUS_FUN_NAME,',
    '                                             WBFALN_DATE_FROM,',
    '                                             WBFALN_DATE_TO,',
    '                                             WBFALN_CRE_BY,',
    '                                             WBFALN_CRE_DATE,',
    '                                             WBFALN_SEL_FLAG,',
    '                                             WBFALN_SEL_USER,',
    '                                             WBFALN_USER_ID,',
    '                                             wbufaln_remov_type)',
    '                                       VALUES(:global_bu,',
    '                                              :P182_HD_DOC_NO,',
    '                                              v_seq_no,',
    '                                              cr1.wbfat_bus_fun_id,',
    '                                              cr1.wbfat_bus_fun_name,',
    '                                              cr1.wbfat_date_from,',
    '                                              cr1.wbfat_date_to,',
    '                                              :global_user,',
    '                                              SYSDATE,',
    '                                              ''Y'',--cr1.WBFAT_SEL_FLAG,',
    '                                              :global_user,--cr1.WBFAT_SEL_USER,',
    '                                              cr1.WBFAT_USER_ID,',
    '                                              ''N'');',
    '                                       ',
    '        END LOOP; ',
    '    END IF;',
    '',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6578193140279682134)
,p_name=>'P182_ANALYTICAL'
,p_static_id=>'p182-analytical'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P182_ANALYTICAL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6578193625298682134)
,p_event_id=>wwv_flow_imp.id(6578193140279682134)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P182_NODE_TYPE',
  'items_to_submit', 'P182_SETUP,P182_TRANSACTION,P182_REPORT,P182_ANALYTICAL',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '	v_setup				vARCHAR2(200);',
    '	v_transaction		VARCHAR2(200);',
    '	v_report				VARCHAR2(200);',
    '	v_analytics			VARCHAR2(200);',
    '	v_where   			VARCHAR2(200);',
    'BEGIN',
    '	IF :P182_SETUP = ''Y'' THEN',
    '		 v_setup := ''SET'';',
    '	ELSE',
    '		 v_setup := '''';',
    '	END IF;',
    '',
    '	IF :P182_TRANSACTION = ''Y'' THEN',
    '		 v_transaction := ''FRM'';',
    '	ELSE',
    '		 v_transaction := '''';',
    '	END IF;',
    '',
    '	IF :P182_REPORT = ''Y'' THEN',
    '		 v_report := ''REP'';',
    '	ELSE',
    '		 v_report := '''';',
    '	END IF;',
    '',
    '	IF :P182_ANALYTICAL = ''Y'' THEN',
    '		 v_analytics := ''RPT'';',
    '	ELSE',
    '		 v_analytics := '''';',
    '	END IF;',
    '  ',
    '   :P182_NODE_TYPE	:= ''(''''''||v_setup||'''''',''''''||v_transaction||'''''',''''''||v_report||'''''',''''''||v_analytics||'''''')'';',
    '',
    'END;   ',
    '  ')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6578189070333682133)
,p_name=>'P182_FILTER'
,p_static_id=>'p182-filter'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P182_FILTER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6578189508522682133)
,p_event_id=>wwv_flow_imp.id(6578189070333682133)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7132857453412035011)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6578195826295682136)
,p_name=>'P182_NODE_TYPE'
,p_static_id=>'p182-node-type'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P182_NODE_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6578196335591682136)
,p_event_id=>wwv_flow_imp.id(6578195826295682136)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7132857453412035011)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6578194016929682134)
,p_name=>'P182_REPORT'
,p_static_id=>'p182-report'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P182_REPORT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6578194546175682136)
,p_event_id=>wwv_flow_imp.id(6578194016929682134)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P182_NODE_TYPE',
  'items_to_submit', 'P182_SETUP,P182_TRANSACTION,P182_REPORT,P182_ANALYTICAL',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '	v_setup				vARCHAR2(200);',
    '	v_transaction		VARCHAR2(200);',
    '	v_report				VARCHAR2(200);',
    '	v_analytics			VARCHAR2(200);',
    '	v_where   			VARCHAR2(200);',
    'BEGIN',
    '	IF :P182_SETUP = ''Y'' THEN',
    '		 v_setup := ''SET'';',
    '	ELSE',
    '		 v_setup := '''';',
    '	END IF;',
    '',
    '	IF :P182_TRANSACTION = ''Y'' THEN',
    '		 v_transaction := ''FRM'';',
    '	ELSE',
    '		 v_transaction := '''';',
    '	END IF;',
    '',
    '	IF :P182_REPORT = ''Y'' THEN',
    '		 v_report := ''REP'';',
    '	ELSE',
    '		 v_report := '''';',
    '	END IF;',
    '',
    '	IF :P182_ANALYTICAL = ''Y'' THEN',
    '		 v_analytics := ''RPT'';',
    '	ELSE',
    '		 v_analytics := '''';',
    '	END IF;',
    '  ',
    '   :P182_NODE_TYPE	:= ''(''''''||v_setup||'''''',''''''||v_transaction||'''''',''''''||v_report||'''''',''''''||v_analytics||'''''')'';',
    '',
    'END;   ',
    '  ')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6578192238694682134)
,p_name=>'P182_SETUP'
,p_static_id=>'p182-setup'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P182_SETUP'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6578192752963682134)
,p_event_id=>wwv_flow_imp.id(6578192238694682134)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P182_NODE_TYPE',
  'items_to_submit', 'P182_SETUP,P182_TRANSACTION,P182_REPORT,P182_ANALYTICAL',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '	v_setup				vARCHAR2(200);',
    '	v_transaction		VARCHAR2(200);',
    '	v_report				VARCHAR2(200);',
    '	v_analytics			VARCHAR2(200);',
    '	v_where   			VARCHAR2(200);',
    'BEGIN',
    '	IF :P182_SETUP = ''Y'' THEN',
    '		 v_setup := ''SET'';',
    '	ELSE',
    '		 v_setup := '''';',
    '	END IF;',
    '',
    '	IF :P182_TRANSACTION = ''Y'' THEN',
    '		 v_transaction := ''FRM'';',
    '	ELSE',
    '		 v_transaction := '''';',
    '	END IF;',
    '',
    '	IF :P182_REPORT = ''Y'' THEN',
    '		 v_report := ''REP'';',
    '	ELSE',
    '		 v_report := '''';',
    '	END IF;',
    '',
    '	IF :P182_ANALYTICAL = ''Y'' THEN',
    '		 v_analytics := ''RPT'';',
    '	ELSE',
    '		 v_analytics := '''';',
    '	END IF;',
    '  ',
    '   :P182_NODE_TYPE	:= ''(''''''||v_setup||'''''',''''''||v_transaction||'''''',''''''||v_report||'''''',''''''||v_analytics||'''''')'';',
    '',
    'END;   ',
    '  ')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6578194926195682136)
,p_name=>'P182_TRANSACTION'
,p_static_id=>'p182-transaction'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P182_TRANSACTION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6578195470735682136)
,p_event_id=>wwv_flow_imp.id(6578194926195682136)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P182_NODE_TYPE',
  'items_to_submit', 'P182_SETUP,P182_TRANSACTION,P182_REPORT,P182_ANALYTICAL',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '	v_setup				vARCHAR2(200);',
    '	v_transaction		VARCHAR2(200);',
    '	v_report				VARCHAR2(200);',
    '	v_analytics			VARCHAR2(200);',
    '	v_where   			VARCHAR2(200);',
    'BEGIN',
    '	IF :P182_SETUP = ''Y'' THEN',
    '		 v_setup := ''SET'';',
    '	ELSE',
    '		 v_setup := '''';',
    '	END IF;',
    '',
    '	IF :P182_TRANSACTION = ''Y'' THEN',
    '		 v_transaction := ''FRM'';',
    '	ELSE',
    '		 v_transaction := '''';',
    '	END IF;',
    '',
    '	IF :P182_REPORT = ''Y'' THEN',
    '		 v_report := ''REP'';',
    '	ELSE',
    '		 v_report := '''';',
    '	END IF;',
    '',
    '	IF :P182_ANALYTICAL = ''Y'' THEN',
    '		 v_analytics := ''RPT'';',
    '	ELSE',
    '		 v_analytics := '''';',
    '	END IF;',
    '  ',
    '   :P182_NODE_TYPE	:= ''(''''''||v_setup||'''''',''''''||v_transaction||'''''',''''''||v_report||'''''',''''''||v_analytics||'''''')'';',
    '',
    'END;   ',
    '  ')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6544987148242269838)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECKANDUNCHECK'
,p_static_id=>'checkanduncheck'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE wa_user_notif_access_temp',
'       SET wunat_sel_flag  = APEX_APPLICATION.g_x02',
'     WHERE wunat_bu      = :GLOBAL_BU',
'       AND wunat_seq_no  = APEX_APPLICATION.g_x01',
'       AND wunat_doc_no  = :P182_HD_DOC_NO;',
'    COMMIT;',
'    HTP.P(''success'');',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1065466164457349636
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6544987200710269839)
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
'    SELECT CASE WHEN wbfat_sel_flag  = ''N'' THEN ''N''',
'                WHEN wbfat_sel_flag  = ''Y'' THEN ''Y''',
'           ELSE ''NY''',
'           END flag ',
'      INTO v_flag',
'      FROM (SELECT LISTAGG(DISTINCT wunat_sel_flag , '','') WITHIN GROUP( ORDER BY wunat_sel_flag  ) wbfat_sel_flag ',
'              FROM wa_user_notif_access_temp',
'             WHERE wunat_bu          = :GLOBAL_BU',
'               AND wunat_doc_no      = :P182_HD_DOC_NO              ',
'           );',
'    ',
'    SELECT NVL(COUNT(wunat_sel_flag), 0 ) ',
'      INTO v_count',
'      FROM wa_user_notif_access_temp',
'     WHERE wunat_bu        = :GLOBAL_BU',
'       AND wunat_doc_no    = :P182_HD_DOC_NO  ',
'       AND wunat_sel_flag  = ''Y'';',
'       ',
'    HTP.P(v_flag ||''-'' ||v_count ||'' '' ||''Row Selected'');',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1065466216925349637
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6578186156335682128)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Save'
,p_static_id=>'save'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'CURSOR c1',
'    IS',
'    SELECT *',
'      FROM wa_user_notif_access_temp',
'     WHERE wunat_bu        =  :global_bu',
'       AND wunat_sel_flag  =  ''Y''',
'       AND wunat_doc_no    =  :P182_HD_DOC_NO;',
'',
'    v_seq_no          NUMBER(5);',
'    v_cnt 			  NUMBER(5);',
'BEGIN',
'',
'    DELETE wa_user_notif_access_ln',
'     WHERE wunaln_bu 	 = :GLOBAL_bu',
'       AND wunaln_doc_no = :P182_HD_DOC_NO;',
'',
'    SELECT COUNT(*)',
'      INTO v_cnt',
'      FROM wa_user_notif_access_temp',
'     WHERE wunat_bu       = :GLOBAL_bu',
'       AND wunat_doc_no   = :P182_HD_DOC_NO',
'       AND wunat_sel_flag = ''Y'';',
'  ',
'    IF v_cnt = 0 THEN',
'       RAISE_APPLICATION_ERROR(-20010,''Select the Bus. Fun.'');	',
'    ELSE',
'        FOR cr1 IN c1',
'        LOOP  ',
'            SELECT nvl(max(WUNALN_SEQ_NO)+1,1)',
'              into v_seq_no',
'              FROM wa_user_notif_access_ln',
'             WHERE wunaln_bu = :Global_bu',
'               AND WUNALN_DOC_NO = :P182_HD_DOC_NO;',
'--proc_debug_proc(v_seq_no);',
'            INSERT INTO wa_user_notif_access_ln(WUNALN_BU,',
'                                             WUNALN_DOC_NO,',
'                                             WUNALN_SEQ_NO,',
'                                             WUNALN_BUS_FUN_ID,',
'                                             WUNALN_BUS_FUN_NAME,',
'                                             WUNALN_DATE_FROM,',
'                                             WUNALN_DATE_TO,',
'                                             WUNALN_CRE_BY,',
'                                             WUNALN_CRE_DATE,',
'                                             WUNALN_SEL_FLAG,',
'                                             WUNALN_SEL_USER,',
'                                             WUNALN_USER_ID)',
'                                       VALUES(:global_bu,',
'                                              :P182_HD_DOC_NO,',
'                                              v_seq_no,',
'                                              cr1.wunat_bus_fun_id,',
'                                              cr1.wunat_bus_fun_name,',
'                                              cr1.wunat_date_from,',
'                                              cr1.wunat_date_to,',
'                                              :global_user,',
'                                              SYSDATE,',
'                                              ''Y'',--cr1.WBFAT_SEL_FLAG,',
'                                              :global_user,--cr1.WBFAT_SEL_USER,',
'                                              cr1.WUNAT_USER_ID);',
'      COMMIT;                                 ',
'        END LOOP; ',
'    END IF;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6578180676333682097)
,p_process_success_message=>'Bus. Fun. Added'
,p_internal_uid=>1098665172550761926
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6578185713290682127)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Select Flag'
,p_static_id=>'select-flag'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF :P182_SEL_FLAG =''N'' THEN',
':P182_SEL_FLAG := ''Y'';',
'ELSE',
':P182_SEL_FLAG :=''N'';',
'END IF;',
'IF :P182_SEL_FLAG =''Y'' THEN',
'--raise_application_error(-20999,:P182_SEL_FLAG);',
' UPDATE WA_USER_NOTIF_ACCESS_TEMP',
'    SET WUNAT_SEL_FLAG = :P182_SEL_FLAG,',
'        WUNAT_SEL_USER = :global_user ',
'  WHERE WUNAT_BU  = :Global_bu',
'    AND WUNAT_DOC_NO = :P182_HD_DOC_NO',
'    AND WUNAT_SEQ_NO = :P182_SEQ_NO;  ',
'ELSE',
' UPDATE WA_USER_NOTIF_ACCESS_TEMP',
'    SET WUNAT_SEL_FLAG = :P182_SEL_FLAG,',
'        WUNAT_SEL_USER = NULL ',
'  WHERE WUNAT_BU  = :Global_bu',
'    AND WUNAT_DOC_NO = :P182_HD_DOC_NO',
'    AND WUNAT_SEQ_NO = :P182_SEQ_NO; ',
'END IF;            ',
'COMMIT;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SEL_FLAG'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>1098664729505761925
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6560638601138429423)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SELECTALL'
,p_static_id=>'selectall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE wa_user_notif_access_temp',
'       SET wunat_sel_flag  = ''Y''',
'     WHERE wunat_bu      = :GLOBAL_BU',
'       AND wunat_doc_no  = :P182_HD_DOC_NO;',
'COMMIT;       ',
'HTP.P(''success'');',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1081117617353509221
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6578187747652682130)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UNSELECTALL'
,p_static_id=>'unselectall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE wa_user_notif_access_temp',
'       SET wunat_sel_flag  = ''N''',
'     WHERE wunat_bu      = :GLOBAL_BU',
'       AND wunat_doc_no  = :P182_HD_DOC_NO;',
'COMMIT;       ',
'HTP.P(''success'');',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1098666763867761928
);
wwv_flow_imp.component_end;
end;
/
