prompt --application/pages/page_08501
begin
--   Manifest
--     PAGE: 08501
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
 p_id=>8501
,p_name=>'Pending Trip Sheet'
,p_alias=>'PENDING-TRIP-SHEET'
,p_page_mode=>'MODAL'
,p_step_title=>'Pending Trip Sheet'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var invno  = [];',
'var invamt = [];',
'var chcnt = [];',
'',
'',
'function checkanduncheck(a,b) {',
'    var inputValue = document.getElementById("inputField_" + a).value;',
'    var isChecked = document.getElementById("checkbox_"+a).checked;',
'    var displayElement = document.getElementById("display_user_name_" + a);',
'    var checkflag;   ',
'    var appuser = apex.item( "P0_USER" ).getValue(); ',
'    //let themsg = document.getElementById("#GLOBAL_USER").value;',
'    ',
'    console.log(inputValue);',
'    if (isChecked) {checkflag = ''Y'';}else{ checkflag = ''N'';};',
'      apex.server.process(',
'        "CHECKANDUNCHECK", ',
'        {',
'          x01: checkflag, // Pass the input field value as a parameter',
'          x02: a,',
'          x03: inputValue, ',
'          pageItems: ''#GLOBAL_USER'' //P0_USER',
'        },',
'        { dataType: ''text'',',
'          success: function(data) {',
'             apex.message.clearErrors();',
'            if (data.trim() == ''success''){',
'                console.log(data);                             ',
'                if (isChecked) {                      ',
'                   document.getElementById("inputField_" + a).readOnly = checkflag === ''Y'' ? true : false;',
'                   displayElement.textContent = appuser;',
'                   output.innerText = incrementRowSelection(output.innerText, checkflag);',
'                     apex.region("PEND").refresh();',
'                   button();',
'                   overallcheck();',
'                }',
'                else{',
'                   document.getElementById("inputField_" + a).readOnly = checkflag === ''Y'' ? true : false;',
'                   displayElement.textContent = '''';',
'                   output.innerText = incrementRowSelection(output.innerText, checkflag);',
'                     apex.region("PEND").refresh();',
'                   button();',
'                    overallcheck();',
'               }',
'     }',
'else {',
'	if (data.trim() == ''success1''){',
'	if (isChecked) {',
'                   document.getElementById("inputField_" + a).readOnly = checkflag === ''Y'' ? true : false;',
'                   displayElement.textContent =appuser;   ',
'                   output.innerText = incrementRowSelection(output.innerText, checkflag);',
'                   button();',
'                   apex.region("PEND").refresh(); ',
'                }',
'                else{',
'                   document.getElementById("inputField_" + a).readOnly = checkflag === ''Y'' ? true : false;',
'                   displayElement.textContent = '''';',
'                   output.innerText = incrementRowSelection(output.innerText, checkflag);',
'                   button();',
'                   apex.region("PEND").refresh(); ',
'                }',
'            }',
'         else{',
'            apex.message.showErrors([{type:"error",location:"page",message:data.replace(''sqlerrm:ORA-20999: '', ''''),unsafe:false}]);',
'            document.getElementById("checkbox_" + a).checked = false;',
'            document.getElementById("inputField_" + a).readOnly = false;                ',
'            button();',
'      }',
'      }',
'      }',
'});',
'};',
'',
'',
'    ',
'',
'',
'  function readonly(a){',
'      var value = Boolean;      ',
'      var isChecked = document.getElementById("checkbox_"+a).checked;      ',
'',
'      if (isChecked) {',
'          value =  true;         ',
'      }else{',
'          value = false; ',
'      }',
'      console.log(value)',
'      return value',
'  }',
'',
'function selectall() {',
'     var isChecked = document.getElementById("check_all").checked;',
'     var spinner = apex.util.showSpinner();',
'    if (isChecked) {',
'        apex.server.process(',
'            "CHECKALL", // Replace with your AJAX callback name',
'            {',
'                f01: invamt,',
'                f02: invno',
'            },',
'            {',
'                dataType: ''text'',',
'                success: function (data) {',
'                   apex.message.clearErrors();',
'                   if (data.trim() !== ''success''){',
'                       spinner.remove();',
'                       apex.message.showErrors([{type:"error",location:"page",message:data.replace(''sqlerrm:ORA-20999: '', ''''),unsafe:false}]);',
'                   }',
'                   else',
'                   {',
'                    spinner.remove();  ',
'                    console.log(''success'', data);',
'                    overallcheck();',
'                    apex.region("PEND").refresh();   ',
'                                   ',
'                   }',
'                    ',
'                },',
'                error: function (jqXHR, textStatus, errorThrown) {',
'                    console.error(errorThrown, jqXHR, textStatus);',
'                }',
'            }',
'        );',
'    } else {',
'        apex.server.process(',
'            "UNCHECKALL", // Replace with your AJAX callback name',
'            {},',
'            {',
'                dataType: ''text'',',
'                success: function (data) {',
'                console.log(''success'', data);',
'                spinner.remove();',
'                overallcheck();                                    ',
'                apex.region("PEND").refresh();                    ',
'                }',
'            }',
'        ); }}',
'',
'function overallcheck() {',
'    var checkbox = document.getElementById("check_all");',
'    apex.server.process(',
'        "OVERALLCHECK",',
'        {},',
'        {',
'            dataType: ''text'',',
'            success: function (data) {',
'                console.log(data);',
'                let flag = data.split("-");',
'                output.innerText = (flag[1]).toString();',
'                if (flag[0] == ''Y'' && checkbox != null) {',
'                    checkbox.checked = true;                ',
'                    button();',
'                } else if (flag[0] == ''N'' && checkbox != null) {',
'                    checkbox.checked = false;',
'                    button();',
'                } else if (flag[0] == ''NY'' && checkbox != null) {',
'                    checkbox.checked = false;',
'                    button();',
'                }',
'                output.innerText = (flag[1]).toString();',
'                console.log(output.innerText);',
'            }',
'        }',
'    );',
'}',
'function movetoarray(a) {',
'    invno.push(a);',
'    invamt.push(document.getElementById("inputField_" + a).value);',
'    console.log(JSON.stringify(invno));',
'    console.log(JSON.stringify(invamt));',
'}',
'function incrementRowSelection(inputString, type) {',
'    return inputString.replace(/(\d+)/, function (match, number) {',
'        if (type.trim() == ''Y'') {',
'            return (parseInt(number, 10) + 1);',
'        } else {',
'            let cnt;',
'            if ((parseInt(number, 10) - 1) < 0){',
'                cnt = 0;',
'            }else{',
'                cnt = (parseInt(number, 10) - 1);',
'            }',
'            //alert(cnt);',
'            return cnt;',
'            ',
'        }',
'    });',
'}',
'',
'function button(){    ',
'        var inputElems = document.getElementsByTagName("input");',
'        var checkfg = document.getElementById("checkbox_");',
'        count = 0;        ',
'        for (var i=0; i<inputElems.length; i++) {',
'        if (inputElems[i].type === "checkbox" && inputElems[i].checked === true){',
'            count++;  ',
'            if (count != null) { ',
'               checkfg =''Y'';',
'                  apex.item("B1").enable();',
'                  apex.item("B2").enable();  ',
'                  apex.item("B3").enable();  ',
'                  apex.item("B4").enable();  ',
'                  apex.item("B5").enable();  ',
'                  apex.item("B6").enable();   ',
'                //   amount(); ',
'                 // output.innerText = incrementRowSelection(output.innerText, checkfg);      ',
'            }	',
'        }',
'        else{',
'          if (count == '' '' ) { ',
'             checkfg =''N'';',
'                  apex.item("B1").disable();',
'                  apex.item("B2").disable(); ',
'                  apex.item("B3").disable();  ',
'                  apex.item("B4").disable();  ',
'                  apex.item("B5").disable();  ',
'                  apex.item("B6").disable();  ',
'                //   amount(); ',
'                  //output.innerText = incrementRowSelection(output.innerText, checkfg);',
'          }	',
'        }        ',
'   }};',
'',
'',
' '))
,p_javascript_code_onload=>'overallcheck();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-table {                                    ',
'      border-collapse: collapse;  ',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'  }'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_dialog_width=>'1200'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10863316996224502541)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_region_attributes=>'style="display:none";'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10873904869171360910)
,p_plug_name=>'Select Filter'
,p_static_id=>'select-filter'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10863012419921918545)
,p_plug_name=>'Trip Sheet'
,p_static_id=>'trip-sheet'
,p_region_name=>'PEND'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT',
'    ROWID,',
'    FDPH_BU,',
'    FDPH_DOC_NO,',
'    FDPH_DOC_DATE,',
'    FDPH_PLAN_DATE,',
'    FDPH_STATUS,',
'    FDPH_CRE_BY,',
'    FDPH_CRE_DATE,',
'    FDPH_UPD_BY,',
'    FDPH_UPD_DATE,',
'    FDPH_PLAN_BASIS,',
'    FDPH_REFERENCE,',
'    FDPH_PLAN_PREFIX,',
'    FDPSO_BU,',
'    FDPSO_DOC_NO,',
'    FDPSO_SEQ_NO,',
'    FDPSO_ROUTE_ID,',
'    FDPSO_CITY_ID,',
'    ( SELECT DISTINCT CITY_NAME1 ',
'         FROM CITIES',
'         WHERE CITY_BU=FDPSO_BU',
'         AND CITY_ID=FDPSO_CITY_ID) CITY_DESC,',
'    FDPSO_CUST_ID,',
'    (SELECT SUPLR_NAME1',
'        FROM SUPPLIERS',
'        WHERE SUPLR_BU=FDPSO_BU',
'        AND SUPLR_SUPLR_ID=FDPSO_CUST_ID',
'        AND SUPLR_PARTY_TYPE = ''C''',
'        ) CUST_DESC,',
'    FDPSO_ORD_PFX,',
'    FDPSO_ORD_NO,',
'    FDPSO_ORD_DATE,',
'    FDPSO_LINE_NO,',
'    FDPSO_SCH_NO,',
'    FDPSO_PROD_ID,',
'	(SELECT PROD_DESC11 ',
'       FROM PRODUCTS',
'       WHERE PROD_BU=FDPSO_BU',
'       AND PROD_ID=FDPSO_PROD_ID',
'       AND  PROD_REV =FDPSO_PROD_REV) PROD_DESC,',
'    FDPSO_PROD_REV,',
'	(SELECT PROD_UOM ',
'       FROM PRODUCTS',
'       WHERE PROD_BU=FDPSO_BU',
'       AND PROD_ID=FDPSO_PROD_ID',
'       AND  PROD_REV =FDPSO_PROD_REV) UOM,',
'    FDPSO_ORD_QTY,',
'    FDPSO_UNIT_PRICE,',
'    FDPSO_DISP_DATE,',
'    FDPSO_RQRD_DATE,',
'    FDPSO_CRE_BY,',
'    FDPSO_CRE_DATE,',
'    FDPSO_UPD_BY,',
'    FDPSO_UPD_DATE,',
'    FDPSO_ACTUAL_ORD_QTY,',
'    FDPSO_PREV_ALLOC_QTY,',
'    FDPSO_INVOICED_QTY,',
'    FDPSO_CUR_ALLOC_QTY,',
'    FDPSO_ALLOC_FLAG,',
'    FDPSO_PLND_TO_ALLOC,',
'    FDPSO_SELECT_FLAG,',
'    ''<span id="display_user_name_'' || FDPSO_DOC_NO||FDPSO_SEQ_NO|| ''" style="border-inline-style: none;">'' || FDPSO_SELECT_USER || ''</span>'' FDPSO_SELECT_USER,',
'       CASE WHEN FDPSO_SELECT_FLAG = ''Y'' THEN',
'            ''<input  style="text-align:end"  type="number"  id="inputField_''||FDPSO_DOC_NO||FDPSO_SEQ_NO||''" value="''||(FDPSO_INVOICED_QTY)||''" readonly />''',
'       ELSE',
'            ''<input  style="text-align:end" type="number"  id="inputField_''||FDPSO_DOC_NO||FDPSO_SEQ_NO||''" value="''||(FDPSO_ORD_QTY-FDPSO_INVOICED_QTY)||''" onchange="movetoarray(''''''||FDPSO_DOC_NO||FDPSO_SEQ_NO||'''''')"/>''',
'        END  IN_PROCESS,',
'       CASE WHEN FDPSO_SELECT_FLAG = ''Y'' and FDPSO_SELECT_USER = :global_user THEN',
'           ''<input type="checkbox" id="checkbox_''||FDPSO_DOC_NO||FDPSO_SEQ_NO||''" checked="checked"  onChange="checkanduncheck(''''''||FDPSO_DOC_NO||FDPSO_SEQ_NO||'''''',''''N'''')"/>''',
'              WHEN FDPSO_SELECT_FLAG = ''Y'' and FDPSO_SELECT_USER != :global_user THEN',
'            ''<input type="checkbox"  disabled="disabled" id="checkbox_''||FDPSO_DOC_NO||FDPSO_SEQ_NO||''" checked="checked" onChange="checkanduncheck(''''''||FDPSO_DOC_NO||FDPSO_SEQ_NO||'''''',''''N'''')"/>''                    ',
'         ELSE',
'           ''<input type="checkbox" id="checkbox_''||FDPSO_DOC_NO||FDPSO_SEQ_NO||''"  onChange="checkanduncheck(''''''||FDPSO_DOC_NO||FDPSO_SEQ_NO||'''''',''''Y'''')" />''',
'         END checkbox',
'FROM',
'FMCG_PEND_TRIP_SHEET_VIEW',
'WHERE FDPH_BU=:GLOBAL_BU;',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
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
 p_id=>wwv_flow_imp.id(10863012512821918546)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'10'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>7225903831017681862
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10863317484337502546)
,p_db_column_name=>'CHECKBOX'
,p_display_order=>480
,p_column_identifier=>'AV'
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
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Instr(NVL(:REQUEST,''~''),''CSV'')=0',
'  and Instr(NVL(:REQUEST,''~''),''XLSX'')=0'))
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012922598710980490)
,p_db_column_name=>'CITY_DESC'
,p_display_order=>550
,p_column_identifier=>'BC'
,p_column_label=>'City Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10863317030936502542)
,p_db_column_name=>'CUST_DESC'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Cust. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10863012603756918547)
,p_db_column_name=>'FDPH_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'BU'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10863013024536918552)
,p_db_column_name=>'FDPH_CRE_BY'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Cre. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10863013217691918553)
,p_db_column_name=>'FDPH_CRE_DATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Cre. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10863012724579918549)
,p_db_column_name=>'FDPH_DOC_DATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10863012677202918548)
,p_db_column_name=>'FDPH_DOC_NO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10863013480598918556)
,p_db_column_name=>'FDPH_PLAN_BASIS'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Plan Basis'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10863012920020918550)
,p_db_column_name=>'FDPH_PLAN_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Plan Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10863013716347918558)
,p_db_column_name=>'FDPH_PLAN_PREFIX'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Plan Prefix'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10863013604076918557)
,p_db_column_name=>'FDPH_REFERENCE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10863013014763918551)
,p_db_column_name=>'FDPH_STATUS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10863013249205918554)
,p_db_column_name=>'FDPH_UPD_BY'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Upd. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10863013374586918555)
,p_db_column_name=>'FDPH_UPD_DATE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Upd. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012924285245980507)
,p_db_column_name=>'FDPSO_ACTUAL_ORD_QTY'
,p_display_order=>720
,p_column_identifier=>'BT'
,p_column_label=>'Actual Ord. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012924762254980511)
,p_db_column_name=>'FDPSO_ALLOC_FLAG'
,p_display_order=>760
,p_column_identifier=>'BX'
,p_column_label=>'Alloc. Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012922118979980485)
,p_db_column_name=>'FDPSO_BU'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'BU'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012922557023980489)
,p_db_column_name=>'FDPSO_CITY_ID'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'City ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012923947371980503)
,p_db_column_name=>'FDPSO_CRE_BY'
,p_display_order=>680
,p_column_identifier=>'BP'
,p_column_label=>'Cre. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012924067459980504)
,p_db_column_name=>'FDPSO_CRE_DATE'
,p_display_order=>690
,p_column_identifier=>'BQ'
,p_column_label=>'Cre. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012924644213980510)
,p_db_column_name=>'FDPSO_CUR_ALLOC_QTY'
,p_display_order=>750
,p_column_identifier=>'BW'
,p_column_label=>'Cur. Alloc. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012922753017980491)
,p_db_column_name=>'FDPSO_CUST_ID'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Cust. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012923722859980501)
,p_db_column_name=>'FDPSO_DISP_DATE'
,p_display_order=>660
,p_column_identifier=>'BN'
,p_column_label=>'Disp. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012922213305980486)
,p_db_column_name=>'FDPSO_DOC_NO'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012924552331980509)
,p_db_column_name=>'FDPSO_INVOICED_QTY'
,p_display_order=>740
,p_column_identifier=>'BV'
,p_column_label=>'Invoiced Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012923130260980495)
,p_db_column_name=>'FDPSO_LINE_NO'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Line No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012923021169980494)
,p_db_column_name=>'FDPSO_ORD_DATE'
,p_display_order=>590
,p_column_identifier=>'BG'
,p_column_label=>'SO Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012922952465980493)
,p_db_column_name=>'FDPSO_ORD_NO'
,p_display_order=>580
,p_column_identifier=>'BF'
,p_column_label=>'SO No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012922795770980492)
,p_db_column_name=>'FDPSO_ORD_PFX'
,p_display_order=>570
,p_column_identifier=>'BE'
,p_column_label=>'SO Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012923489221980499)
,p_db_column_name=>'FDPSO_ORD_QTY'
,p_display_order=>640
,p_column_identifier=>'BL'
,p_column_label=>'SO Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012924803000980512)
,p_db_column_name=>'FDPSO_PLND_TO_ALLOC'
,p_display_order=>770
,p_column_identifier=>'BY'
,p_column_label=>'Plnd. To Alloc.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012924385388980508)
,p_db_column_name=>'FDPSO_PREV_ALLOC_QTY'
,p_display_order=>730
,p_column_identifier=>'BU'
,p_column_label=>'Prev. Alloc. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012923307248980497)
,p_db_column_name=>'FDPSO_PROD_ID'
,p_display_order=>620
,p_column_identifier=>'BJ'
,p_column_label=>'Item ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012923481476980498)
,p_db_column_name=>'FDPSO_PROD_REV'
,p_display_order=>630
,p_column_identifier=>'BK'
,p_column_label=>'Item Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012922404769980488)
,p_db_column_name=>'FDPSO_ROUTE_ID'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Route ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012923861427980502)
,p_db_column_name=>'FDPSO_RQRD_DATE'
,p_display_order=>670
,p_column_identifier=>'BO'
,p_column_label=>'Rqrd. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012923280805980496)
,p_db_column_name=>'FDPSO_SCH_NO'
,p_display_order=>610
,p_column_identifier=>'BI'
,p_column_label=>'Sch. No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012924915445980513)
,p_db_column_name=>'FDPSO_SELECT_FLAG'
,p_display_order=>780
,p_column_identifier=>'BZ'
,p_column_label=>'Select Flag'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012924982099980514)
,p_db_column_name=>'FDPSO_SELECT_USER'
,p_display_order=>790
,p_column_identifier=>'CA'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012922321725980487)
,p_db_column_name=>'FDPSO_SEQ_NO'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Seq. No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012923609413980500)
,p_db_column_name=>'FDPSO_UNIT_PRICE'
,p_display_order=>650
,p_column_identifier=>'BM'
,p_column_label=>'Unit Price'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012924149824980505)
,p_db_column_name=>'FDPSO_UPD_BY'
,p_display_order=>700
,p_column_identifier=>'BR'
,p_column_label=>'Upd. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7012924266215980506)
,p_db_column_name=>'FDPSO_UPD_DATE'
,p_display_order=>710
,p_column_identifier=>'BS'
,p_column_label=>'Upd. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10863317541111502547)
,p_db_column_name=>'IN_PROCESS'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'In Process Qty.'
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
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Instr(NVL(:REQUEST,''~''),''CSV'')=0',
'  and Instr(NVL(:REQUEST,''~''),''XLSX'')=0'))
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10863317198682502543)
,p_db_column_name=>'PROD_DESC'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10863316909158502540)
,p_db_column_name=>'ROWID'
,p_display_order=>440
,p_is_primary_key=>'Y'
,p_column_identifier=>'AR'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10863317291707502544)
,p_db_column_name=>'UOM'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Uom'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(10863352359704583470)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'5301969'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'FDPH_DOC_NO:FDPSO_ORD_NO:FDPSO_CUST_ID:CUST_DESC:FDPH_DOC_DATE:FDPSO_CITY_ID:CITY_DESC:FDPSO_PROD_ID:PROD_DESC:FDPSO_PROD_REV:FDPSO_DISP_DATE:FDPSO_ORD_DATE:FDPSO_CUR_ALLOC_QTY:FDPSO_ORD_QTY:FDPSO_INVOICED_QTY:IN_PROCESS:CHECKBOX:FDPSO_SELECT_USER:FD'
||'PH_REFERENCE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6989163297154530587)
,p_plug_name=>'Vehicle Parameters'
,p_static_id=>'vehicle-parameters'
,p_region_name=>'Vehicle'
,p_region_css_classes=>'js-dialog-size800x250'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6988108373939452069)
,p_button_sequence=>10
,p_button_name=>'back'
,p_static_id=>'back'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(72126850516209383)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6988087903159452027)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(10863316996224502541)
,p_button_name=>'clear'
,p_static_id=>'clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(72126850516209383)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6989164453011530598)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(6989163297154530587)
,p_button_name=>'Close1'
,p_static_id=>'close'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6989164267537530596)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(10863012419921918545)
,p_button_name=>'Createtripsheet'
,p_static_id=>'createtripsheet'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cre. Trip Sheet'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6989164306132530597)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(6989163297154530587)
,p_button_name=>'OK1'
,p_static_id=>'ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ok'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6988107138924452068)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(10863012419921918545)
,p_button_name=>'OK'
,p_static_id=>'ok-2'
,p_button_static_id=>'B1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(72126850516209383)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'OK'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_cattributes=>'style=display:none;'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6988107522591452068)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(10863012419921918545)
,p_button_name=>'row_selected'
,p_static_id=>'row-selected'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(72126850516209383)
,p_button_image_alt=>'<span id="output"></span>'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style=display:none;'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6988087525497452026)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(10863316996224502541)
,p_button_name=>'Search'
,p_static_id=>'search'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(72126850516209383)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_grid_new_row=>'Y'
,p_grid_column_span=>1
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7017554491240212689)
,p_branch_name=>'GO TO TRIP SHEET'
,p_branch_action=>'f?p=223:85:&SESSION.::&DEBUG.:RP,::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6989164267537530596)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10873909068960360951)
,p_name=>'8501_P64196310102_SELECT_FLAG'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10873904869171360910)
,p_prompt=>'Select Flag'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Selected Rows'' D, ''Y'' R',
'  FROM DUAL ',
'UNION ALL',
'SELECT ''Unselected Rows'' D,''N''R',
'  FROM DUAL UNION ALL',
'SELECT ''All''D,''A''R',
'  FROM DUAL;'))
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10863319166064502579)
,p_name=>'P8501_CITY_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(10863316996224502541)
,p_prompt=>'City. ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10863319074564502578)
,p_name=>'P8501_CUST_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10863316996224502541)
,p_prompt=>'Cust. ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10863318955971502577)
,p_name=>'P8501_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10863316996224502541)
,p_prompt=>'Doc. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10863672523056496438)
,p_name=>'P8501_DUMMY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(10863316996224502541)
,p_item_default=>'N'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7014919608612989889)
,p_name=>'P8501_DUMMY1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6989163297154530587)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10863319523890502582)
,p_name=>'P8501_FROM_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(10863316996224502541)
,p_prompt=>'From Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(6989163653994530590)
,p_name=>'P8501_NEW_PARTNER_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6989163297154530587)
,p_item_default=>'C'
,p_prompt=>'Partner Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Customer;C,Supplier;S'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10863319640401502584)
,p_name=>'P8501_NEW_TO_DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(10863316996224502541)
,p_prompt=>'To Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(6989163939574530593)
,p_name=>'P8501_NEW_VEHICLE_REG_NO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6989163297154530587)
,p_prompt=>'Reg. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(6989163773434530591)
,p_name=>'P8501_NEW_VEHICLE_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6989163297154530587)
,p_item_default=>'O'
,p_prompt=>'Vehicle Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Owned;O,Rented;R,Party;P,Third party;T'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6989163834965530592)
,p_name=>'P8501_PARTNER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6989163297154530587)
,p_prompt=>'Partner'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    suplr_name1  d ,',
'    suplr_suplr_id r ',
'FROM',
'    suppliers',
'WHERE',
'        suplr_bu = :global_bu',
'    AND suplr_status = ''A''',
'    AND suplr_transport_flag = ''Y''',
'    and suplr_party_type   =:P8501_NEW_PARTNER_TYPE ',
'    --AND :P8501_NEW_VEHICLE_TYPE IN ( ''R'', ''T'' )',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P8501_NEW_PARTNER_TYPE,P8501_NEW_VEHICLE_TYPE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10863319232601502580)
,p_name=>'P8501_PROD_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(10863316996224502541)
,p_prompt=>'Prod. ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10863319415519502581)
,p_name=>'P8501_PROD_REV'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(10863316996224502541)
,p_prompt=>'Prod. Rev.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6989163523306530589)
,p_name=>'P8501_ROUTE_BASE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6989163297154530587)
,p_prompt=>'Route Option'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Each Route for Each Trip;I,All Routes in One Trip;C'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6989163443296530588)
,p_name=>'P8501_VEHICLE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6989163297154530587)
,p_prompt=>'Vehicle'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT TV_VEHICLE_ID',
'    FROM transport_vehicles',
'  WHERE TV_BU   = :GLOBAL_BU',
'    -- AND TV_OWNER = :P8501_VEHICLE',
'    '))
,p_cSize=>30
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6988113073213452080)
,p_name=>'Action for clear'
,p_static_id=>'action-for-clear'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6988087903159452027)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6988113564753452082)
,p_event_id=>wwv_flow_imp.id(6988113073213452080)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P8501_DOC_NO,P8501_CUST_ID,P8501_CITY_ID,P8501_PROD_ID,P8501_PROD_REV,P8501_FROM_DATE,P8501_NEW_TO_DATE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6988111109450452077)
,p_name=>'Action for Search'
,p_static_id=>'action-for-search'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6988087525497452026)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6988112143266452080)
,p_event_id=>wwv_flow_imp.id(6988111109450452077)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10863012419921918545)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6988111635767452079)
,p_event_id=>wwv_flow_imp.id(6988111109450452077)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P8501_DUMMY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6988112638619452080)
,p_event_id=>wwv_flow_imp.id(6988111109450452077)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10863012419921918545)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6989164516191530599)
,p_name=>'Action for trip Sheet'
,p_static_id=>'action-for-trip-sheet'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6989164267537530596)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6989164664740530600)
,p_event_id=>wwv_flow_imp.id(6989164516191530599)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'openModal("Vehicle");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6988113971476452082)
,p_name=>'After Refresh'
,p_static_id=>'after-refresh'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(10863012419921918545)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6988114471267452082)
,p_event_id=>wwv_flow_imp.id(6988113971476452082)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'overallcheck();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7014919455866989887)
,p_name=>'Close Region '
,p_static_id=>'close-region'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6989164453011530598)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7014919558915989888)
,p_event_id=>wwv_flow_imp.id(7014919455866989887)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6989163297154530587)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6988115715430452084)
,p_name=>'Open Region'
,p_static_id=>'open-region'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6988107522591452068)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6988116189489452084)
,p_event_id=>wwv_flow_imp.id(6988115715430452084)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10873904869171360910)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6988114856694452082)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P64196310102_SELECT_FLAG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6988115373318452082)
,p_event_id=>wwv_flow_imp.id(6988114856694452082)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10863012419921918545)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6990720138793187686)
,p_name=>'vECHICLE'
,p_static_id=>'vechicle'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8501_VEHICLE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6990720213485187687)
,p_event_id=>wwv_flow_imp.id(6990720138793187686)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P8501_NEW_VEHICLE_REG_NO',
  'items_to_submit', 'P8501_VEHICLE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ' BEGIN',
    '',
    ' SELECT TV_REG_NO',
    '   into :P8501_NEW_VEHICLE_REG_NO',
    '    FROM transport_vehicles',
    '  WHERE TV_BU   = :GLOBAL_BU',
    '    AND TV_VEHICLE_ID = :P8501_VEHICLE;',
    '',
    '  END;',
    '',
    '--   IF :P8501_VEHICLE IS NOT NULL THEN',
    '-- DECLARE',
    '--    CURSOR c1',
    '--    IS',
    '--       SELECT tv_reg_no,tv_vehicle_id, tv_veh_desc1',
    '--         FROM transport_vehicles',
    '--        WHERE tv_bu = :global_bu ',
    '--          AND tv_owned_by = ''C'' ',
    '--          AND :P8501_NEW_VEHICLE_TYPE = ''O''',
    '--          AND tv_vehicle_id = :P8501_VEHICLE',
    '--          AND NOT EXISTS(SELECT 1',
    '--                            FROM trip_sheet_hd',
    '--                           WHERE     tv_bu = tsh_bu',
    '--                                 AND tv_vehicle_id = tsh_veh_id',
    '--                                 AND tsh_status NOT IN (''N'', ''P'', ''S''))',
    '--       UNION ALL',
    '--       SELECT tv_reg_no, tv_vehicle_id,tv_veh_desc1',
    '--                 tv_veh_desc1',
    '--         FROM transport_vehicles',
    '--        WHERE     tv_bu = :global_bu',
    '--              AND tv_owned_by IN (''E'',''T'')',
    '--              AND :P8501_NEW_VEHICLE_TYPE IN (''R'',''T'')',
    '--              AND tv_vehicle_id = :P8501_VEHICLE',
    '--              AND tv_owner IS NOT NULL',
    '-- 	   UNION ALL',
    '-- 		SELECT tv_reg_no,tv_vehicle_id,tv_veh_desc1',
    '-- 		  FROM transport_vehicles',
    '-- 		 WHERE tv_bu = :global_bu',
    '-- 	     AND tv_owned_by IN (''P'')',
    '-- 	     AND :P8501_NEW_VEHICLE_TYPE IN (''P'')',
    '-- 	     AND tv_vehicle_id = :P8501_VEHICLE ;',
    '',
    '',
    '--    cr1   c1%ROWTYPE;',
    '-- BEGIN',
    '-- --RAISE_APPLICATION_ERROR(-20999,cr1.tv_reg_no);',
    '--    OPEN c1;',
    '',
    '--    FETCH c1 INTO cr1;',
    '',
    '--    IF c1%NOTFOUND',
    '--    THEN',
    '--      raise_application_error(-20999,''Vehicle not found.'');',
    '--    ELSE',
    '--       :P8501_NEW_VEHICLE_REG_NO	  := cr1.tv_reg_no ;',
    '--    END IF;',
    '',
    '--    CLOSE c1;',
    '--    END;',
    '--    END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6988109906542452076)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECKALL'
,p_static_id=>'checkall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'  CURSOR C1 ',
'       IS ',
'     SELECT *',
'       FROM fmcg_pend_trip_sheet_view',
'      WHERE fdpso_bu = :GLOBAL_BU;',
'',
'v_doc_no         VARCHAR2(30);',
'v_doc_seq_no     NUMBER(5);',
'v_prod_qty       NUMBER(12,3);',
'',
'TYPE PENDPAY IS REF CURSOR;',
'   PAY_CURSOR PENDPAY;',
'BEGIN',
' ',
'    FOR i in 1..APEX_APPLICATION.G_F01.COUNT',
'    LOOP',
'     --RAISE_APPLICATION_ERROR(-20999,APEX_APPLICATION.G_F02(i) );',
'         FOR CR2 IN (SELECT *',
'                       FROM fmcg_pend_trip_sheet_view',
'                      WHERE fdpso_bu                  = :GLOBAL_BU',
'                        AND fdpso_doc_no||fdpso_seq_no = APEX_APPLICATION.G_F02(i))',
'         LOOP',
'            ',
'             IF APEX_APPLICATION.G_F01(i)  <= 0 OR APEX_APPLICATION.G_F01(i)  IS NULL THEN',
'        	    Raise_Application_Error(-20999,''In Process Qty. should be greater than Zero.'');	',
'        	 END IF;',
'',
'             IF APEX_APPLICATION.G_F01(i)  > (CR2.fdpso_ord_qty - CR2.fdpso_invoiced_qty) THEN',
'        	    Raise_Application_Error(-20999,''In Process Qty. should not be greater than Ord. Qty.'');	',
'        	 END IF;',
'             ',
'          ',
'            UPDATE fmcg_disp_plan_so',
'               SET fdpso_select_flag = ''Y'',',
'                   fdpso_select_user = :GLOBAL_USER',
'             WHERE fdpso_bu          = :global_bu',
'               AND fdpso_doc_no      = CR2.fdpso_doc_no',
'               AND fdpso_seq_no      = CR2.fdpso_seq_no;',
'',
'       ',
'        END LOOP;',
'    END LOOP;',
'',
'     OPEN PAY_CURSOR FOR ''SELECT fdpso_doc_no,',
'                                 fdpso_seq_no',
'                            FROM fmcg_pend_trip_sheet_view',
'                           WHERE fdpso_bu = ''''''||:GLOBAL_BU||''''''',
'                             AND '' ||FUNC_FIND_IR_CONDITION_EXPRESSION( 262, 169201901,''Trip Sheet'', :APP_SESSION);',
'   LOOP',
'        FETCH PAY_CURSOR ',
'	     INTO v_doc_no,',
'              v_doc_seq_no;',
'',
'       EXIT WHEN PAY_CURSOR%notfound; ',
'                  ',
'',
'            UPDATE fmcg_disp_plan_so',
'               SET fdpso_select_flag  = ''Y'',',
'                   fdpso_select_user  = :global_user',
'             WHERE fdpso_bu           = :global_bu',
'               AND fdpso_doc_no       = v_doc_no',
'               AND fdpso_seq_no       = v_doc_seq_no;',
'',
'',
'          END LOOP;  ',
'   ',
'   CLOSE PAY_CURSOR;',
'     HTP.P(''success'');',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>3351001224738215392
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6988109533881452076)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECKANDUNCHECK'
,p_static_id=>'checkanduncheck'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'CURSOR C1',
'     IS   ',
'    SELECT * ',
'      FROM  fmcg_pend_trip_sheet_view',
'      WHERE fdph_bu=:global_bu',
'      AND   fdpso_doc_no||fdpso_seq_no= APEX_APPLICATION.G_X02;',
'CR1 C1%ROWTYPE;',
'v_error  VARCHAR2(4000);',
'',
'BEGIN ',
'',
'   OPEN C1;',
'   FETCH C1 INTO CR1;',
' ',
'         IF APEX_APPLICATION.G_X01 = ''Y'' AND APEX_APPLICATION.G_X03 = 0 THEN',
'            v_error := ''In Process Qty. must be entered.'';',
'         ELSIF APEX_APPLICATION.G_X01 = ''Y'' AND APEX_APPLICATION.G_X03 < 0 THEN',
'            v_error := ''In Process Qty. should be greater than zero'';',
'         ELSIF APEX_APPLICATION.G_X01 = ''Y'' AND APEX_APPLICATION.G_X03 > (CR1.fdpso_ord_qty - CR1.fdpso_invoiced_qty)THEN',
'            v_error := ''In Process Qty. should not exceed Allowed to be Completed Qty.'';',
'         END IF;',
'--RAISE_APPLICATION_ERROR(-20999,APEX_APPLICATION.G_X01);',
'   IF APEX_APPLICATION.G_X01 = ''Y''  THEN',
'   ',
'--RAISE_APPLICATION_ERROR(-20999,:global_bu);',
'--RAISE_APPLICATION_ERROR(-20999,CR1.fdpso_doc_no);',
'--RAISE_APPLICATION_ERROR(-20999,CR1.fdpso_seq_no);',
'      UPDATE Fmcg_disp_plan_so',
'         SET fdpso_select_flag = ''Y'',',
'             fdpso_select_user = :global_user,',
'             fdpso_invoiced_qty=APEX_APPLICATION.G_X03',
'        WHERE fdpso_bu=:global_bu',
'          AND fdpso_doc_no=CR1.fdpso_doc_no',
'          AND fdpso_seq_no=CR1.fdpso_seq_no;',
'      ',
'   ELSE',
'       UPDATE Fmcg_disp_plan_so',
'        SET fdpso_select_flag = ''N'',',
'            fdpso_select_user = NULL,',
'            fdpso_invoiced_qty= 0',
'        WHERE fdpso_bu=:global_bu',
'         AND  fdpso_doc_no=CR1.fdpso_doc_no',
'         AND  fdpso_seq_no=CR1.fdpso_seq_no;',
'      ',
'   END IF;',
'   CLOSE C1;',
'    ',
'    IF v_error IS NULL THEN',
'      HTP.P(''success'');',
'      commit;',
'   ELSE',
'      HTP.P(v_error); ',
'      ROLLBACK;  ',
'   END IF;',
'   ',
'  /*EXCEPTION WHEN OTHERS THEN RAISE;*/',
'   EXCEPTION WHEN OTHERS THEN ',
'      proc_apex_err_msg_log(:APP_PAGE_ID,SQLERRM);',
'     ',
'      ',
'',
'   ',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>3351000852077215392
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6988110722723452077)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OVERALLCHECK'
,p_static_id=>'overallcheck'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'v_flag   VARCHAR2(100);',
'v_count  NUMBER(10);',
'BEGIN',
'      SELECT',
'        CASE',
'            WHEN fdpso_select_flag = ''N'' THEN',
'                ''N''',
'            WHEN fdpso_select_flag = ''Y'' THEN',
'                ''Y''',
'            ELSE',
'                ''NY''',
'        END fdpso_select_flag INTO v_flag',
'      FROM',
'        (',
'      SELECT LISTAGG(DISTINCT fdpso_select_flag, '','') WITHIN GROUP( ORDER BY fdpso_select_flag ) fdpso_select_flag',
'        FROM fmcg_pend_trip_sheet_view ',
'      WHERE fdpso_bu = :global_bu',
'         );',
'',
'',
'',
'      SELECT COUNT(*)cnt',
'        INTO v_count',
'        from fmcg_pend_trip_sheet_view',
'       WHERE fdpso_bu = :global_bu',
'         AND fdpso_select_flag = ''Y'';',
'',
'       HTP.P(v_flag ||''-'' ||v_count ||'' '' ||''row Selected'');',
'END;         '))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>3351002040919215393
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6989163162529530585)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for OK1 '
,p_static_id=>'process-for-ok'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'   v_res   VARCHAR2(30);',
'   v_sheet_no VARCHAR2(30);',
'begin',
'--RAISE_APPLICATION_ERROR(-20999,:GLOBAL_BU);',
'--RAISE_APPLICATION_ERROR(-20999,:GLOBAL_USER);',
'--RAISE_APPLICATION_ERROR(-20999,:P8501_VEHICLE);',
'--RAISE_APPLICATION_ERROR(-20999,:P8501_NEW_VEHICLE_TYPE);',
'--RAISE_APPLICATION_ERROR(-20999,:P8501_NEW_VEHICLE_REG_NO);',
'--RAISE_APPLICATION_ERROR(-20999,:P8501_NEW_PARTNER_TYPE);',
'--RAISE_APPLICATION_ERROR(-20999,:P8501_PARTNER);',
'',
'',
'',
'proc_cre_trip_sheet_doc(',
'   :GLOBAL_BU,',
'   :GLOBAL_USER,',
'   :P8501_VEHICLE,',
'   :P8501_NEW_VEHICLE_TYPE,---:P8501_PARTNER',
'    :P8501_NEW_VEHICLE_REG_NO,',
'   :P8501_NEW_PARTNER_TYPE, --p_partner_type,',
'    :P8501_PARTNER ,---p_partner_id,',
'    1,',
'    v_res,',
'    v_sheet_no',
');',
'--RAISE_APPLICATION_ERROR(-20999,v_res);',
'--RAISE_APPLICATION_ERROR(-20999,v_sheet_no);',
'SELECT ROWID ',
'INTO :P8501_DUMMY1',
'FROM TRIP_SHEET_HD',
'WHERE TSH_BU=:GLOBAL_BU',
'AND TSH_SHEET_NO=v_sheet_no;',
'  IF v_res IS  NULL THEN ',
'    raise_application_error(-20999,'' tRIP document not created '');',
'  ELSE',
' APEX_APPLICATION.g_print_success_message :=  ''Trip Sheet created '';--|| V_RES;',
' END  IF  ;    ',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6989164306132530597)
,p_process_success_message=>'Trip Sheet Created.'
,p_internal_uid=>3352054480725293901
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6988110300583452077)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UNCHECKALL'
,p_static_id=>'uncheckall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'  CURSOR C1 ',
'       IS ',
'     SELECT *',
'       FROM fmcg_pend_trip_sheet_view',
'      WHERE fdpso_bu = :GLOBAL_BU;',
'',
'v_doc_no         VARCHAR2(30);',
'v_doc_seq_no     NUMBER(5);',
'v_prod_qty       NUMBER(12,3);',
'',
'TYPE PENDPAY IS REF CURSOR;',
'   PAY_CURSOR PENDPAY;',
'BEGIN',
'    FOR i in 1..APEX_APPLICATION.G_F01.COUNT',
'    LOOP',
'         FOR CR2 IN (SELECT *',
'                       FROM fmcg_pend_trip_sheet_view',
'                      WHERE fdpso_bu                  = :GLOBAL_BU',
'                        AND fdpso_doc_no||fdpso_seq_no = APEX_APPLICATION.G_F02(i))',
'         LOOP',
'            ',
'             IF APEX_APPLICATION.G_F01(i)  <= 0 OR APEX_APPLICATION.G_F01(i)  IS NULL THEN',
'        	    Raise_Application_Error(-20999,''In Process Qty. should be greater than Zero.'');	',
'        	 END IF;',
'',
'             IF APEX_APPLICATION.G_F01(i)  > (CR2.fdpso_ord_qty - CR2.fdpso_invoiced_qty) THEN',
'        	    Raise_Application_Error(-20999,''In Process Qty. should not be greater than Ord. Qty.'');	',
'        	 END IF;',
'             ',
'            ',
'            UPDATE fmcg_disp_plan_so',
'               SET fdpso_select_flag = ''N'',',
'                   fdpso_select_user = NULL',
'             WHERE fdpso_bu          = :global_bu',
'               AND fdpso_doc_no      = CR2.fdpso_doc_no',
'               AND fdpso_seq_no      = CR2.fdpso_seq_no;',
'',
'       ',
'        END LOOP;',
'    END LOOP;',
'',
'     OPEN PAY_CURSOR FOR ''SELECT fdpso_doc_no,',
'                                 fdpso_seq_no',
'                            FROM fmcg_pend_trip_sheet_view',
'                           WHERE fdpso_bu = ''''''||:GLOBAL_BU||''''''',
'                             AND '' ||FUNC_FIND_IR_CONDITION_EXPRESSION( 262, 169201901,''Trip Sheet'', :APP_SESSION);',
'   LOOP',
'        FETCH PAY_CURSOR ',
'	     INTO v_doc_no,',
'              v_doc_seq_no;',
'',
'       EXIT WHEN PAY_CURSOR%notfound; ',
'                  ',
'',
'            UPDATE fmcg_disp_plan_so',
'               SET fdpso_select_flag  = ''N'',',
'                   fdpso_select_user  = NULL',
'             WHERE fdpso_bu           = :global_bu',
'               AND fdpso_doc_no       = v_doc_no',
'               AND fdpso_seq_no       = v_doc_seq_no;',
'',
'',
'          END LOOP;  ',
'   ',
'   CLOSE PAY_CURSOR;',
'     HTP.P(''success'');',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>3351001618779215393
);
wwv_flow_imp.component_end;
end;
/
