prompt --application/pages/page_00183
begin
--   Manifest
--     PAGE: 00183
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
 p_id=>183
,p_name=>'User Bus. Fun. Access'
,p_alias=>'USER-BUS-FUN-ACCESS1'
,p_page_mode=>'MODAL'
,p_step_title=>'User Bus. Fun. Access'
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
,p_dialog_height=>'600'
,p_dialog_width=>'1200'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7742668142207305732)
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
 p_id=>wwv_flow_imp.id(7917063728148228176)
,p_plug_name=>'Option'
,p_static_id=>'option'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>8
,p_plug_display_column=>3
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7176909217943563264)
,p_plug_name=>'User Access'
,p_static_id=>'user-access'
,p_region_name=>'user'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select WBFAT_BU,',
'       WBFAT_DOC_NO,',
'       WBFAT_SEQ_NO,',
'       WBFAT_BUS_FUN_ID,',
'       WBFAT_BUS_FUN_NAME,',
'       DECODE(wbf_node_type,''FRM'',''Transaction'',''REP'',''Report'',''RPT'',''Analytics'',''MOD'',''Module'',''SET'',''Setup'') wbf_node_type,',
'       TO_CHAR(WBFAT_DATE_FROM,func_find_date_format(:Global_bu)) WBFAT_DATE_FROM,',
'       TO_CHAR(WBFAT_DATE_TO,func_find_date_format(:Global_bu)) WBFAT_DATE_TO,',
'       WBFAT_CRE_BY,',
'       WBFAT_CRE_DATE,',
'       WBFAT_UPD_BY,',
'       WBFAT_UPD_DATE,',
'       WBFAT_SEL_FLAG,',
'       WBFAT_SEL_USER,',
'       wbfat_user_id,',
'       /*case when WBFAT_SEL_FLAG =''Y'' then ',
'       ''<span aria-hidden="true" class="fa fa-check-square" style = "color:blue;"></span>''',
'	   ELSE',
'		''<span aria-hidden="true" class="fa fa-square-o"  style = "color:black;"></span>''',
'       END*/',
'       CASE WHEN WBFAT_SEL_FLAG = ''Y'' THEN',
'       ''<input type="checkbox" id="checkbox_''||WBFAT_SEQ_NO||''" checked="checked" onChange="checkanduncheck(''||WBFAT_SEQ_NO||'',''''Y'''')"/>''',
'       ELSE',
'       ''<input type="checkbox" id="checkbox_''||WBFAT_SEQ_NO||''" onChange="checkanduncheck(''||WBFAT_SEQ_NO||'',''''N'''')" />''',
'       END      ',
'       "Flag",',
'        (SELECT wbf_bus_fun_name',
'              FROM wapl_bus_fun',
'            WHERE  wbf_bus_fun_id=wbfat_bus_fun_id)"Module"',
'  from WA_BU_FUN_ACCESS_TEMP,',
'       WAPL_BUS_FUN',
' WHERE WBF_BUS_FUN_ID = WBFAT_BUS_FUN_ID',
'   AND WBFAT_BU=:global_bu',
'   AND WBFAT_DOC_NO=:P183_HD_DOC_NO',
'   AND (INSTR(:P183_NODE_TYPE,WBF_NODE_TYPE) > 0 OR :P183_NODE_TYPE IS NULL)',
'   AND  ((:P183_FILTER = ''N'' AND WBFAT_SEL_FLAG = ''N'') ',
'          OR (:P183_FILTER = ''Y'' AND WBFAT_SEL_FLAG = ''Y'') ',
'          OR (:P183_FILTER = ''A'' AND WBFAT_SEL_FLAG IN (''Y'',''N''))',
'          OR :P183_FILTER is NULL)      ',
'  ORDER BY WBFAT_SEQ_NO;  '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P183_HD_DOC_NO,P183_USER_ID,P183_FILTER,P183_NODE_TYPE'
,p_prn_page_header=>'User Access'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(7176909378112563264)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1697388394327643062
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7176930286521622731)
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
 p_id=>wwv_flow_imp.id(7176932444894622752)
,p_db_column_name=>'Module'
,p_display_order=>33
,p_column_identifier=>'P'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7176909636279563357)
,p_db_column_name=>'WBFAT_BU'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Wbfat Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7176910784628563363)
,p_db_column_name=>'WBFAT_BUS_FUN_ID'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Bus. Fun. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7176911264740563364)
,p_db_column_name=>'WBFAT_BUS_FUN_NAME'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Bus. Fun. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7176912478121563366)
,p_db_column_name=>'WBFAT_CRE_BY'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Wbfat Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7176912798711563366)
,p_db_column_name=>'WBFAT_CRE_DATE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Wbfat Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7630927334935210041)
,p_db_column_name=>'WBFAT_DATE_FROM'
,p_display_order=>43
,p_column_identifier=>'Q'
,p_column_label=>'Date From'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7630927445358210042)
,p_db_column_name=>'WBFAT_DATE_TO'
,p_display_order=>53
,p_column_identifier=>'R'
,p_column_label=>'Date To'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7176910077834563363)
,p_db_column_name=>'WBFAT_DOC_NO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'B'
,p_column_label=>'Wbfat Doc No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7176914082751563369)
,p_db_column_name=>'WBFAT_SEL_FLAG'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Select'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7176914470258563369)
,p_db_column_name=>'WBFAT_SEL_USER'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Wbfat Sel User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7176910469270563363)
,p_db_column_name=>'WBFAT_SEQ_NO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'C'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7176913195463563368)
,p_db_column_name=>'WBFAT_UPD_BY'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Wbfat Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7176913663311563368)
,p_db_column_name=>'WBFAT_UPD_DATE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Wbfat Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7814473167250656148)
,p_db_column_name=>'WBFAT_USER_ID'
,p_display_order=>63
,p_column_identifier=>'S'
,p_column_label=>'Wbfat User Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7917063468507228173)
,p_db_column_name=>'WBF_NODE_TYPE'
,p_display_order=>73
,p_column_identifier=>'T'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7176926668765591377)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'5522601'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'Flag:WBFAT_SEQ_NO:WBFAT_BUS_FUN_ID:WBFAT_BUS_FUN_NAME:WBF_NODE_TYPE:WBFAT_DATE_FROM:WBFAT_DATE_TO'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6622232810054210341)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(7176909217943563264)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-close'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6622232024872210339)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(7176909217943563264)
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
 p_id=>wwv_flow_imp.id(6622232453489210341)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(7176909217943563264)
,p_button_name=>'Ok'
,p_static_id=>'ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ok'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_icon_css_classes=>'fa-thumbs-up'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6622250175382210361)
,p_branch_name=>'Go To Page 111326009501'
,p_branch_action=>'f?p=&APP_ID.:111326009501:&SESSION.::&DEBUG.:RR,111326009501:P111326009501_ROWID:&P183_ROWID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6622232453489210341)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7921803579933396972)
,p_name=>'P183_ANALYTICAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7917063728148228176)
,p_item_default=>'Y'
,p_prompt=>'Analytics'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7742677636328305774)
,p_name=>'P183_FILTER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7742668142207305732)
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
 p_id=>wwv_flow_imp.id(7092019579796352716)
,p_name=>'P183_HD_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7176909217943563264)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7921803992845396976)
,p_name=>'P183_NODE_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7917063728148228176)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7917074198866228221)
,p_name=>'P183_REPORT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7917063728148228176)
,p_item_default=>'Y'
,p_prompt=>'Report'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7176938875685622779)
,p_name=>'P183_ROWID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7176909217943563264)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7176938035521622771)
,p_name=>'P183_SEL_FLAG'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7176909217943563264)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7176938246621622773)
,p_name=>'P183_SEQ_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7176909217943563264)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7917073943429228219)
,p_name=>'P183_SETUP'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7917063728148228176)
,p_item_default=>'Y'
,p_prompt=>'Setup'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7917074106930228220)
,p_name=>'P183_TRANSACTION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7917063728148228176)
,p_item_default=>'Y'
,p_prompt=>'Transaction'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7092019647983352717)
,p_name=>'P183_USER_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7176909217943563264)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6622243184706210355)
,p_name=>'Close'
,p_static_id=>'close'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6622232810054210341)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6622243715528210356)
,p_event_id=>wwv_flow_imp.id(6622243184706210355)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-close'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6622241790884210355)
,p_name=>'Count'
,p_static_id=>'count'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7176909217943563264)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6622242858706210355)
,p_event_id=>wwv_flow_imp.id(6622241790884210355)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7742668142207305732)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6622242294512210355)
,p_event_id=>wwv_flow_imp.id(6622241790884210355)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'overallcheck();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6622240003297210352)
,p_name=>'Count_btn'
,p_static_id=>'count-btn'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6622232024872210339)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6622240500957210353)
,p_event_id=>wwv_flow_imp.id(6622240003297210352)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7742668142207305732)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6622248650852210359)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6622232453489210341)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6622249641124210359)
,p_event_id=>wwv_flow_imp.id(6622248650852210359)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-close'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6622249097223210359)
,p_event_id=>wwv_flow_imp.id(6622248650852210359)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P183_HD_DOC_NO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    'CURSOR c1',
    '    IS',
    '    SELECT *',
    '      FROM WA_BU_FUN_ACCESS_TEMP',
    '     WHERE wbfat_bu        =  :global_bu',
    '       AND wbfat_sel_flag  =  ''Y''',
    '       AND wbfat_doc_no    =  :P183_HD_DOC_NO;',
    '',
    '    v_seq_no          NUMBER(5);',
    '    v_cnt 			  NUMBER(5);',
    'BEGIN',
    '/*',
    '    DELETE',
    '      FROM wa_bu_fun_access_ln',
    '     WHERE wbfaln_bu 	 = :GLOBAL_bu',
    '       AND wbfaln_doc_no = :P183_HD_DOC_NO;',
    '*/',
    ' ',
    '    SELECT COUNT(*)',
    '      INTO v_cnt',
    '      FROM wa_bu_fun_access_temp',
    '     WHERE wbfat_bu       = :GLOBAL_bu',
    '       AND wbfat_doc_no   = :P183_HD_DOC_NO',
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
    '              AND WBFALN_DOC_NO = :P183_HD_DOC_NO;',
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
    '                                              :P183_HD_DOC_NO,',
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
 p_id=>wwv_flow_imp.id(6622244985344210356)
,p_name=>'P183_ANALYTICAL'
,p_static_id=>'p183-analytical'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P183_ANALYTICAL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6622245549517210358)
,p_event_id=>wwv_flow_imp.id(6622244985344210356)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P183_NODE_TYPE',
  'items_to_submit', 'P183_SETUP,P183_TRANSACTION,P183_REPORT,P183_ANALYTICAL',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '	v_setup				vARCHAR2(200);',
    '	v_transaction		VARCHAR2(200);',
    '	v_report				VARCHAR2(200);',
    '	v_analytics			VARCHAR2(200);',
    '	v_where   			VARCHAR2(200);',
    'BEGIN',
    '	IF :P183_SETUP = ''Y'' THEN',
    '		 v_setup := ''SET'';',
    '	ELSE',
    '		 v_setup := '''';',
    '	END IF;',
    '',
    '	IF :P183_TRANSACTION = ''Y'' THEN',
    '		 v_transaction := ''FRM'';',
    '	ELSE',
    '		 v_transaction := '''';',
    '	END IF;',
    '',
    '	IF :P183_REPORT = ''Y'' THEN',
    '		 v_report := ''REP'';',
    '	ELSE',
    '		 v_report := '''';',
    '	END IF;',
    '',
    '	IF :P183_ANALYTICAL = ''Y'' THEN',
    '		 v_analytics := ''RPT'';',
    '	ELSE',
    '		 v_analytics := '''';',
    '	END IF;',
    '  ',
    '   :P183_NODE_TYPE	:= ''(''''''||v_setup||'''''',''''''||v_transaction||'''''',''''''||v_report||'''''',''''''||v_analytics||'''''')'';',
    '',
    'END;   ',
    '  ')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6622240896118210353)
,p_name=>'P183_FILTER'
,p_static_id=>'p183-filter'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P183_FILTER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6622241451870210355)
,p_event_id=>wwv_flow_imp.id(6622240896118210353)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7176909217943563264)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6622247686150210359)
,p_name=>'P183_NODE_TYPE'
,p_static_id=>'p183-node-type'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P183_NODE_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6622248197524210359)
,p_event_id=>wwv_flow_imp.id(6622247686150210359)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7176909217943563264)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6622245913557210358)
,p_name=>'P183_REPORT'
,p_static_id=>'p183-report'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P183_REPORT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6622246401483210358)
,p_event_id=>wwv_flow_imp.id(6622245913557210358)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P183_NODE_TYPE',
  'items_to_submit', 'P183_SETUP,P183_TRANSACTION,P183_REPORT,P183_ANALYTICAL',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '	v_setup				vARCHAR2(200);',
    '	v_transaction		VARCHAR2(200);',
    '	v_report				VARCHAR2(200);',
    '	v_analytics			VARCHAR2(200);',
    '	v_where   			VARCHAR2(200);',
    'BEGIN',
    '	IF :P183_SETUP = ''Y'' THEN',
    '		 v_setup := ''SET'';',
    '	ELSE',
    '		 v_setup := '''';',
    '	END IF;',
    '',
    '	IF :P183_TRANSACTION = ''Y'' THEN',
    '		 v_transaction := ''FRM'';',
    '	ELSE',
    '		 v_transaction := '''';',
    '	END IF;',
    '',
    '	IF :P183_REPORT = ''Y'' THEN',
    '		 v_report := ''REP'';',
    '	ELSE',
    '		 v_report := '''';',
    '	END IF;',
    '',
    '	IF :P183_ANALYTICAL = ''Y'' THEN',
    '		 v_analytics := ''RPT'';',
    '	ELSE',
    '		 v_analytics := '''';',
    '	END IF;',
    '  ',
    '   :P183_NODE_TYPE	:= ''(''''''||v_setup||'''''',''''''||v_transaction||'''''',''''''||v_report||'''''',''''''||v_analytics||'''''')'';',
    '',
    'END;   ',
    '  ')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6622244118348210356)
,p_name=>'P183_SETUP'
,p_static_id=>'p183-setup'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P183_SETUP'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6622244632487210356)
,p_event_id=>wwv_flow_imp.id(6622244118348210356)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P183_NODE_TYPE',
  'items_to_submit', 'P183_SETUP,P183_TRANSACTION,P183_REPORT,P183_ANALYTICAL',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '	v_setup				vARCHAR2(200);',
    '	v_transaction		VARCHAR2(200);',
    '	v_report				VARCHAR2(200);',
    '	v_analytics			VARCHAR2(200);',
    '	v_where   			VARCHAR2(200);',
    'BEGIN',
    '	IF :P183_SETUP = ''Y'' THEN',
    '		 v_setup := ''SET'';',
    '	ELSE',
    '		 v_setup := '''';',
    '	END IF;',
    '',
    '	IF :P183_TRANSACTION = ''Y'' THEN',
    '		 v_transaction := ''FRM'';',
    '	ELSE',
    '		 v_transaction := '''';',
    '	END IF;',
    '',
    '	IF :P183_REPORT = ''Y'' THEN',
    '		 v_report := ''REP'';',
    '	ELSE',
    '		 v_report := '''';',
    '	END IF;',
    '',
    '	IF :P183_ANALYTICAL = ''Y'' THEN',
    '		 v_analytics := ''RPT'';',
    '	ELSE',
    '		 v_analytics := '''';',
    '	END IF;',
    '  ',
    '   :P183_NODE_TYPE	:= ''(''''''||v_setup||'''''',''''''||v_transaction||'''''',''''''||v_report||'''''',''''''||v_analytics||'''''')'';',
    '',
    'END;   ',
    '  ')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6622246788973210358)
,p_name=>'P183_TRANSACTION'
,p_static_id=>'p183-transaction'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P183_TRANSACTION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6622247299497210358)
,p_event_id=>wwv_flow_imp.id(6622246788973210358)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P183_NODE_TYPE',
  'items_to_submit', 'P183_SETUP,P183_TRANSACTION,P183_REPORT,P183_ANALYTICAL',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '	v_setup				vARCHAR2(200);',
    '	v_transaction		VARCHAR2(200);',
    '	v_report				VARCHAR2(200);',
    '	v_analytics			VARCHAR2(200);',
    '	v_where   			VARCHAR2(200);',
    'BEGIN',
    '	IF :P183_SETUP = ''Y'' THEN',
    '		 v_setup := ''SET'';',
    '	ELSE',
    '		 v_setup := '''';',
    '	END IF;',
    '',
    '	IF :P183_TRANSACTION = ''Y'' THEN',
    '		 v_transaction := ''FRM'';',
    '	ELSE',
    '		 v_transaction := '''';',
    '	END IF;',
    '',
    '	IF :P183_REPORT = ''Y'' THEN',
    '		 v_report := ''REP'';',
    '	ELSE',
    '		 v_report := '''';',
    '	END IF;',
    '',
    '	IF :P183_ANALYTICAL = ''Y'' THEN',
    '		 v_analytics := ''RPT'';',
    '	ELSE',
    '		 v_analytics := '''';',
    '	END IF;',
    '  ',
    '   :P183_NODE_TYPE	:= ''(''''''||v_setup||'''''',''''''||v_transaction||'''''',''''''||v_report||'''''',''''''||v_analytics||'''''')'';',
    '',
    'END;   ',
    '  ')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6622238453555210350)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECKANDUNCHECK'
,p_static_id=>'checkanduncheck'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE wa_bu_fun_access_temp',
'       SET wbfat_sel_flag = APEX_APPLICATION.G_X02,',
'           wbfat_sel_user = :Global_user',
'     WHERE wbfat_bu     = :GLOBAL_BU',
'       AND wbfat_doc_no = :P183_HD_DOC_NO',
'       AND wbfat_seq_no = APEX_APPLICATION.G_X01;',
'    COMMIT;',
'    HTP.P(''success'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1142717469770290148
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6622239246647210350)
,p_process_sequence=>30
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
'      FROM (SELECT LISTAGG(DISTINCT wbfat_sel_flag , '','') WITHIN GROUP( ORDER BY wbfat_sel_flag  ) wbfat_sel_flag ',
'              FROM wa_bu_fun_access_temp',
'             WHERE wbfat_bu          = :GLOBAL_BU',
'               AND wbfat_doc_no      = :P183_HD_DOC_NO              ',
'           );',
'    ',
'    SELECT NVL(COUNT(wbfat_sel_flag), 0 ) ',
'      INTO v_count',
'      FROM wa_bu_fun_access_temp',
'     WHERE wbfat_bu        = :GLOBAL_BU',
'       AND wbfat_doc_no    = :P183_HD_DOC_NO  ',
'       AND wbfat_sel_flag  = ''Y'';',
'       ',
'    HTP.P(v_flag ||''-'' ||v_count ||'' '' ||''row Selected'');',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1142718262862290148
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6622238005953210350)
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
'      FROM WA_BU_FUN_ACCESS_TEMP',
'     WHERE wbfat_bu        =  :global_bu',
'       AND wbfat_sel_flag  =  ''Y''',
'       AND wbfat_doc_no    =  :P183_HD_DOC_NO;',
'',
'    v_seq_no          NUMBER(5);',
'    v_cnt 			  NUMBER(5);',
'BEGIN',
'',
'    DELETE wa_bu_fun_access_ln',
'     WHERE wbfaln_bu 	 = :GLOBAL_bu',
'       AND wbfaln_doc_no = :P183_HD_DOC_NO;',
'',
'    SELECT COUNT(*)',
'      INTO v_cnt',
'      FROM wa_bu_fun_access_temp',
'     WHERE wbfat_bu       = :GLOBAL_bu',
'       AND wbfat_doc_no   = :P183_HD_DOC_NO',
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
'               AND WBFALN_DOC_NO = :P183_HD_DOC_NO;',
'--proc_debug_proc(v_seq_no);',
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
'                                              :P183_HD_DOC_NO,',
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
'      COMMIT;                                 ',
'        END LOOP; ',
'    END IF;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6622232453489210341)
,p_process_success_message=>'Bus. Fun. Added'
,p_internal_uid=>1142717022168290148
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6622237507886210347)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Select Flag'
,p_static_id=>'select-flag'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF :P183_SEL_FLAG =''N'' THEN',
':P183_SEL_FLAG := ''Y'';',
'ELSE',
':P183_SEL_FLAG :=''N'';',
'END IF;',
'IF :P183_SEL_FLAG =''Y'' THEN',
'--raise_application_error(-20999,:P183_SEL_FLAG);',
' UPDATE WA_BU_FUN_ACCESS_TEMP',
'    SET WBFAT_SEL_FLAG = :P183_SEL_FLAG,',
'        WBFAT_SEL_USER = :global_user ',
'  WHERE WBFAT_BU  = :Global_bu',
'    AND WBFAT_DOC_NO = :P183_HD_DOC_NO',
'    AND WBFAT_SEQ_NO = :P183_SEQ_NO;  ',
'ELSE',
' UPDATE WA_BU_FUN_ACCESS_TEMP',
'    SET WBFAT_SEL_FLAG = :P183_SEL_FLAG,',
'        WBFAT_SEL_USER = NULL ',
'  WHERE WBFAT_BU  = :Global_bu',
'    AND WBFAT_DOC_NO = :P183_HD_DOC_NO',
'    AND WBFAT_SEQ_NO = :P183_SEQ_NO; ',
'END IF;            ',
'COMMIT;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SEL_FLAG'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>1142716524101290145
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6622238842312210350)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SELECTALL'
,p_static_id=>'selectall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_seq_no   NUMBER(5);',
'    TYPE user_ref_cursor IS REF CURSOR;',
'    user_cursor user_ref_cursor;',
'BEGIN  ',
'    OPEN user_cursor FOR ''SELECT wbfat_seq_no FROM wa_bu_fun_access_temp WHERE wbfat_bu = ''''''||:Global_bu||''''''',
'                                                                          AND wbfat_doc_no = ''''''||:P183_HD_DOC_NO||''''''AND ''||',
'                          CASE WHEN INSTR(func_find_ir_condition_exp( 800, 71, ''User Access'', :APP_SESSION),''WBF_NODE_TYPE'') > 0 THEN ',
'                                    ''WBFAT_BUS_FUN_ID IN (SELECT wbf_bus_fun_id FROM wapl_bus_fun WHERE ''||',
'                                    CASE WHEN INSTR(func_find_ir_condition_exp( 800, 71, ''User Access'', :APP_SESSION),''SETUP'') > 0  THEN',
'                                              REPLACE((func_find_ir_condition_exp( 800, 71, ''User Access'', :APP_SESSION)),''SETUP'',''SET'')',
'                                         WHEN INSTR(func_find_ir_condition_exp( 800, 71, ''User Access'', :APP_SESSION),''TRANSACTION'') > 0  THEN',
'                                              REPLACE((func_find_ir_condition_exp( 800, 71, ''User Access'', :APP_SESSION)),''TRANSACTION'',''FRM'')',
'                                         WHEN INSTR(func_find_ir_condition_exp( 800, 71, ''User Access'', :APP_SESSION),''REPORT'') > 0  THEN',
'                                              REPLACE((func_find_ir_condition_exp( 800, 71, ''User Access'', :APP_SESSION)),''REPORT'',''REP'')',
'                                         WHEN INSTR(func_find_ir_condition_exp( 800, 71, ''User Access'', :APP_SESSION),''ANALYTICS'') > 0  THEN',
'                                              REPLACE((func_find_ir_condition_exp( 800, 71, ''User Access'', :APP_SESSION)),''ANALYTICS'',''RPT'')',
'                                         WHEN INSTR(func_find_ir_condition_exp( 800, 71, ''User Access'', :APP_SESSION),''MODULE'') > 0  THEN',
'                                              REPLACE((func_find_ir_condition_exp( 800, 71, ''User Access'', :APP_SESSION)),''MODULE'',''MOD'')',
'                                    END||'')''',
'                          ELSE  func_find_ir_condition_exp( 800, 71, ''User Access'', :APP_SESSION)',
'                          END ;--||func_find_ir_condition_exp( 800, 71, ''User Access'', :APP_SESSION);',
'    LOOP',
'        FETCH user_cursor INTO v_seq_no;',
'        EXIT WHEN user_cursor%NOTFOUND;',
'',
'            UPDATE wa_bu_fun_access_temp',
'               SET wbfat_sel_flag = ''Y'',',
'                   wbfat_sel_user = :Global_user',
'             WHERE wbfat_bu     = :GLOBAL_BU',
'               AND wbfat_doc_no = :P183_HD_DOC_NO',
'               AND wbfat_seq_no = v_seq_no;',
'',
'    END LOOP;',
'    CLOSE user_cursor;',
'    COMMIT;',
'    HTP.P(''success'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1142717858527290148
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6622239630516210352)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UNSELECTALL'
,p_static_id=>'unselectall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE wa_bu_fun_access_temp',
'       SET wbfat_sel_flag  = ''N''',
'     WHERE wbfat_bu      = :GLOBAL_BU',
'       AND wbfat_doc_no  = :P183_HD_DOC_NO;',
'    COMMIT;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1142718646731290150
);
wwv_flow_imp.component_end;
end;
/
