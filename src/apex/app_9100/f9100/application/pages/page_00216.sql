prompt --application/pages/page_00216
begin
--   Manifest
--     PAGE: 00216
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
 p_id=>216
,p_name=>'Trip Sheet'
,p_alias=>'TRIP-SHEET1'
,p_step_title=>'Trip Sheet'
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
'                    // apex.region("PEND").refresh();',
'                   button();',
'                //    overallcheck();',
'                }',
'                else{',
'                   document.getElementById("inputField_" + a).readOnly = checkflag === ''Y'' ? true : false;',
'                   displayElement.textContent = '''';',
'                   output.innerText = incrementRowSelection(output.innerText, checkflag);',
'                    // apex.region("PEND").refresh();',
'                   button();',
'                //    overallcheck();',
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
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10861797777717645048)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10872385650664503417)
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
 p_id=>wwv_flow_imp.id(10861493201415061052)
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
'SELECT ROWID,',
'       FDPH_BU,',
'       FDPH_DOC_NO,',
'       FDPH_DOC_DATE,',
'       FDPH_PLAN_DATE,',
'       FDPH_STATUS,',
'       FDPH_CRE_BY,',
'       FDPH_CRE_DATE,',
'       FDPH_UPD_BY,',
'       FDPH_UPD_DATE,',
'       FDPH_PLAN_BASIS,',
'       FDPH_REFERENCE,',
'       FDPH_PLAN_PREFIX,',
'       FDPA_BU,',
'       FDPA_DOC_NO,',
'       FDPA_OPT,',
'       FDPA_SEQ_NO,',
'       FDPA_ROUTE_ID,',
'       FDPA_CITY_ID,',
'       FDPA_CUST_ID,',
'       (SELECT SUPLR_NAME1',
'        FROM SUPPLIERS',
'        WHERE SUPLR_BU=FDPA_BU',
'        AND SUPLR_SUPLR_ID=FDPA_CUST_ID',
'        AND SUPLR_PARTY_TYPE = ''C''',
'        ) CUST_DESC,',
'       FDPA_ORD_PFX,',
'       FDPA_ORD_NO,',
'       FDPA_ORD_DATE,',
'       FDPA_LINE_NO,',
'       FDPA_SCH_NO,',
'       FDPA_PROD_ID,',
'       (SELECT PROD_DESC11 ',
'       FROM PRODUCTS',
'       WHERE PROD_BU=FDPA_BU',
'       AND PROD_ID=FDPA_PROD_ID) PROD_DESC,',
'       FDPA_PROD_REV,',
'       (SELECT PROD_UOM ',
'       FROM PRODUCTS',
'       WHERE PROD_BU=FDPA_BU',
'       AND PROD_ID=FDPA_PROD_ID) UOM,',
'       FDPA_ORD_QTY,',
'       FDPA_UNIT_PRICE,',
'       FDPA_DISP_DATE,',
'       FDPA_RQRD_DATE,',
'       FDPA_ALLOC_QTY,',
'       FDPA_CRE_BY,',
'       FDPA_CRE_DATE,',
'       FDPA_UPD_BY,',
'       FDPA_UPD_DATE,',
'       FDPA_ACTUAL_ORD_QTY,',
'       FDPA_PREV_ALLOC_QTY,',
'       FDPA_INVOICED_QTY,',
'       FDPA_PLANNED_TO_ALLOC,',
'       FDPA_CURR_PROC_QYT,',
'       FDPA_TRIP_CONV_QTY,',
'       FDPA_SELECT_FLAG,',
'       ''<span id="display_user_name_'' || fdpa_doc_no||fdpa_seq_no|| ''" style="border-inline-style: none;">'' || FDPA_SELECT_USER || ''</span>'' FDPA_SELECT_USER,',
'       CASE WHEN fdpa_select_flag = ''Y'' THEN',
'            ''<input  style="text-align:end"  type="number"  id="inputField_''||fdpa_doc_no||fdpa_seq_no||''" value="''||(fdpa_alloc_qty-fdpa_trip_conv_qty)||''" readonly />''',
'       ELSE',
'            ''<input  style="text-align:end" type="number"  id="inputField_''||fdpa_doc_no||fdpa_seq_no||''" value="''||NVL((fdpa_alloc_qty-fdpa_trip_conv_qty),0)||''" onchange="movetoarray(''''''||fdpa_doc_no||fdpa_seq_no||'''''')"/>''',
'        END  IN_PROCESS,',
'       CASE WHEN fdpa_select_flag = ''Y'' and fdpa_select_user = :global_user THEN',
'           ''<input type="checkbox" id="checkbox_''||fdpa_doc_no||fdpa_seq_no||''" checked="checked"  onChange="checkanduncheck(''''''||fdpa_doc_no||fdpa_seq_no||'''''',''''N'''')"/>''',
'              WHEN fdpa_select_flag = ''Y'' and fdpa_select_user != :global_user THEN',
'            ''<input type="checkbox"  disabled="disabled" id="checkbox_''||fdpa_doc_no||fdpa_seq_no||''" checked="checked" onChange="checkanduncheck(''''''||fdpa_doc_no||fdpa_seq_no||'''''',''''N'''')"/>''                    ',
'         ELSE',
'           ''<input type="checkbox" id="checkbox_''||fdpa_doc_no||fdpa_seq_no||''"  onChange="checkanduncheck(''''''||fdpa_doc_no||fdpa_seq_no||'''''',''''Y'''')" />''',
'         END checkbox',
'  FROM FMCG_PEND_TRIP_SHEET_VIEW',
'  WHERE  FDPH_BU = :GLOBAL_BU',
'  /*AND (FDPH_DOC_NO LIKE ''%''||:P216_DOC_NO||''%'' OR :P216_DOC_NO IS NULL)',
'  AND (FDPH_DOC_DATE BETWEEN :P216_FROM_DATE AND :P216_NEW_TO_DATE OR :P216_FROM_DATE IS NULL OR :P216_NEW_TO_DATE IS NULL)',
'  AND (FDPA_CUST_ID LIKE ''%''||:P216_CUST_ID||''%'' OR :P216_CUST_ID IS NULL)',
'  AND (FDPA_CITY_ID=:P216_CITY_ID OR :P216_CITY_ID IS NULL)',
'  AND (FDPA_PROD_ID=:P216_PROD_ID OR :P216_PROD_ID IS NULL)',
'  AND (FDPA_PROD_REV=:P216_PROD_REV OR :P216_PROD_REV IS NULL);*/'))
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
 p_id=>wwv_flow_imp.id(10861493294315061053)
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
,p_internal_uid=>7224384612510824369
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861798265830645053)
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
 p_id=>wwv_flow_imp.id(10861797812429645049)
,p_db_column_name=>'CUST_DESC'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Cust Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861796859853645039)
,p_db_column_name=>'FDPA_ACTUAL_ORD_QTY'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Actual Ord. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861796336471645034)
,p_db_column_name=>'FDPA_ALLOC_QTY'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Alloc. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861794521137645016)
,p_db_column_name=>'FDPA_BU'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861795048505645021)
,p_db_column_name=>'FDPA_CITY_ID'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'City ID'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861796501799645035)
,p_db_column_name=>'FDPA_CRE_BY'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Cre. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861796522750645036)
,p_db_column_name=>'FDPA_CRE_DATE'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Cre. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861797283343645043)
,p_db_column_name=>'FDPA_CURR_PROC_QYT'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Curr. Proc. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861795193735645022)
,p_db_column_name=>'FDPA_CUST_ID'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Cust. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861796138976645032)
,p_db_column_name=>'FDPA_DISP_DATE'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Disp. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861794626947645017)
,p_db_column_name=>'FDPA_DOC_NO'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861797058897645041)
,p_db_column_name=>'FDPA_INVOICED_QTY'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Invoiced Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861795514133645026)
,p_db_column_name=>'FDPA_LINE_NO'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Line No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861794716222645018)
,p_db_column_name=>'FDPA_OPT'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Opt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861795474278645025)
,p_db_column_name=>'FDPA_ORD_DATE'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Ord. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861795326998645024)
,p_db_column_name=>'FDPA_ORD_NO'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Ord. No.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861795231687645023)
,p_db_column_name=>'FDPA_ORD_PFX'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Ord. Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861795990102645030)
,p_db_column_name=>'FDPA_ORD_QTY'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Ord. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861797174556645042)
,p_db_column_name=>'FDPA_PLANNED_TO_ALLOC'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Planned To Alloc.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861796926461645040)
,p_db_column_name=>'FDPA_PREV_ALLOC_QTY'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Prev. Alloc. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861795757555645028)
,p_db_column_name=>'FDPA_PROD_ID'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Prod. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861795861770645029)
,p_db_column_name=>'FDPA_PROD_REV'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Prod. Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861794983207645020)
,p_db_column_name=>'FDPA_ROUTE_ID'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Route ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861796249670645033)
,p_db_column_name=>'FDPA_RQRD_DATE'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Rqrd. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861795673499645027)
,p_db_column_name=>'FDPA_SCH_NO'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Sch. No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861797426446645045)
,p_db_column_name=>'FDPA_SELECT_FLAG'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Select'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861797504325645046)
,p_db_column_name=>'FDPA_SELECT_USER'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861794824652645019)
,p_db_column_name=>'FDPA_SEQ_NO'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Seq. No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861797330665645044)
,p_db_column_name=>'FDPA_TRIP_CONV_QTY'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Trip. Conv. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861796067717645031)
,p_db_column_name=>'FDPA_UNIT_PRICE'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Unit Price'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861796657562645037)
,p_db_column_name=>'FDPA_UPD_BY'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Upd. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861796765531645038)
,p_db_column_name=>'FDPA_UPD_DATE'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Upd. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861493385250061054)
,p_db_column_name=>'FDPH_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'BU'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861493806030061059)
,p_db_column_name=>'FDPH_CRE_BY'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Cre. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861493999185061060)
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
 p_id=>wwv_flow_imp.id(10861493506073061056)
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
 p_id=>wwv_flow_imp.id(10861493458696061055)
,p_db_column_name=>'FDPH_DOC_NO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861494262092061063)
,p_db_column_name=>'FDPH_PLAN_BASIS'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Plan Basis'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861493701514061057)
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
 p_id=>wwv_flow_imp.id(10861494497841061065)
,p_db_column_name=>'FDPH_PLAN_PREFIX'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Plan Prefix'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861494385570061064)
,p_db_column_name=>'FDPH_REFERENCE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861493796257061058)
,p_db_column_name=>'FDPH_STATUS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861494030699061061)
,p_db_column_name=>'FDPH_UPD_BY'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Upd. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861494156080061062)
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
 p_id=>wwv_flow_imp.id(10861798322604645054)
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
 p_id=>wwv_flow_imp.id(10861797980175645050)
,p_db_column_name=>'PROD_DESC'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Prod Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10861797690651645047)
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
 p_id=>wwv_flow_imp.id(10861798073200645051)
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
 p_id=>wwv_flow_imp.id(10861833141197725977)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'5301969'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FDPH_DOC_NO:FDPH_DOC_DATE:FDPA_CUST_ID:FDPA_CITY_ID:FDPA_PROD_ID:FDPA_PROD_REV:FDPA_INVOICED_QTY:FDPA_CURR_PROC_QYT:FDPA_ALLOC_QTY:FDPA_TRIP_CONV_QTY:IN_PROCESS:CHECKBOX:FDPA_SELECT_USER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6986589121971594557)
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
 p_id=>wwv_flow_imp.id(6986568692835594516)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(10861797777717645048)
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
 p_id=>wwv_flow_imp.id(6986587950762594555)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(10861493201415061052)
,p_button_name=>'OK'
,p_static_id=>'ok'
,p_button_static_id=>'B1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(72126850516209383)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'OK'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6986588331043594555)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(10861493201415061052)
,p_button_name=>'row_selected'
,p_static_id=>'row-selected'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(72126850516209383)
,p_button_image_alt=>'<span id="output"></span>'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style=display:none;'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6986568311245594516)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(10861797777717645048)
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10872389884381503439)
,p_name=>'216_P64196310102_SELECT_FLAG'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10872385650664503417)
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
 p_id=>wwv_flow_imp.id(10861800006443645070)
,p_name=>'P216_CITY_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(10861797777717645048)
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
 p_id=>wwv_flow_imp.id(10861799914943645069)
,p_name=>'P216_CUST_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10861797777717645048)
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
 p_id=>wwv_flow_imp.id(10861799796350645068)
,p_name=>'P216_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10861797777717645048)
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
 p_id=>wwv_flow_imp.id(10862153363435638929)
,p_name=>'P216_DUMMY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(10861797777717645048)
,p_item_default=>'N'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10861800364269645073)
,p_name=>'P216_FROM_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(10861797777717645048)
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
 p_id=>wwv_flow_imp.id(10861800480780645075)
,p_name=>'P216_NEW_TO_DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(10861797777717645048)
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
 p_id=>wwv_flow_imp.id(10861800072980645071)
,p_name=>'P216_PROD_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(10861797777717645048)
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
 p_id=>wwv_flow_imp.id(10861800255898645072)
,p_name=>'P216_PROD_REV'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(10861797777717645048)
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6986593790217594566)
,p_name=>'Action for clear'
,p_static_id=>'action-for-clear'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6986568692835594516)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6986594324825594566)
,p_event_id=>wwv_flow_imp.id(6986593790217594566)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P216_DOC_NO,P216_CUST_ID,P216_CITY_ID,P216_PROD_ID,P216_PROD_REV,P216_FROM_DATE,P216_NEW_TO_DATE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6986591900524594563)
,p_name=>'Action for Search'
,p_static_id=>'action-for-search'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6986568311245594516)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6986592953737594566)
,p_event_id=>wwv_flow_imp.id(6986591900524594563)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10861493201415061052)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6986592409561594565)
,p_event_id=>wwv_flow_imp.id(6986591900524594563)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P216_DUMMY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6986593409945594566)
,p_event_id=>wwv_flow_imp.id(6986591900524594563)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10861493201415061052)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6986594712893594566)
,p_name=>'After Refresh'
,p_static_id=>'after-refresh'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(10861493201415061052)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6986595245071594568)
,p_event_id=>wwv_flow_imp.id(6986594712893594566)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'overallcheck();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6986596554027594568)
,p_name=>'Open Region'
,p_static_id=>'open-region'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6986588331043594555)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6986597021989594568)
,p_event_id=>wwv_flow_imp.id(6986596554027594568)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10872385650664503417)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6986595598199594568)
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
 p_id=>wwv_flow_imp.id(6986596100526594568)
,p_event_id=>wwv_flow_imp.id(6986595598199594568)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10861493201415061052)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6986590719792594562)
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
'      WHERE fdph_bu = :GLOBAL_BU;',
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
'                      WHERE fdph_bu                  = :GLOBAL_BU',
'                        AND fdpa_doc_no||fdpa_seq_no = APEX_APPLICATION.G_F02(i))',
'         LOOP',
'            ',
'             IF APEX_APPLICATION.G_F01(i)  <= 0 OR APEX_APPLICATION.G_F01(i)  IS NULL THEN',
'        	    Raise_Application_Error(-20999,''In Process Qty. should be greater than Zero.'');	',
'        	 END IF;',
'',
'             IF APEX_APPLICATION.G_F01(i)  > (CR2.fdpa_alloc_qty - CR2.fdpa_trip_conv_qty) THEN',
'        	    Raise_Application_Error(-20999,''In Process Qty. should not be greater than Ord. Qty.'');	',
'        	 END IF;',
'             ',
'            ',
'            UPDATE fmcg_disp_plan_alloc',
'               SET fdpa_select_flag = ''Y'',',
'                   fdpa_select_user = :GLOBAL_USER',
'             WHERE fdpa_bu          = :global_bu',
'               AND fdpa_doc_no      = CR2.fdpa_doc_no',
'               AND fdpa_seq_no      = CR2.fdpa_seq_no;',
'',
'       ',
'        END LOOP;',
'    END LOOP;',
'',
'     OPEN PAY_CURSOR FOR ''SELECT fdpa_doc_no,',
'                                 fdpa_seq_no',
'                            FROM fmcg_pend_trip_sheet_view',
'                           WHERE fdpa_bu = ''''''||:GLOBAL_BU||''''''',
'                             AND '' ||FUNC_FIND_IR_CONDITION_EXPRESSION( 262, 169201901,''Trip Sheet'', :APP_SESSION);',
'   LOOP',
'        FETCH PAY_CURSOR ',
'	     INTO v_doc_no,',
'              v_doc_seq_no;',
'',
'       EXIT WHEN PAY_CURSOR%notfound; ',
'                  ',
'',
'            UPDATE fmcg_disp_plan_alloc',
'               SET fdpa_select_flag  = ''Y'',',
'                   fdpa_select_user  = :global_user',
'             WHERE fdpa_bu           = :global_bu',
'               AND fdpa_doc_no       = v_doc_no',
'               AND fdpa_seq_no       = v_doc_seq_no;',
'',
'',
'          END LOOP;  ',
'   ',
'   CLOSE PAY_CURSOR;',
'     HTP.P(''success'');',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>3349482037988357878
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6986590307442594562)
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
'      AND   fdpa_doc_no||fdpa_seq_no= APEX_APPLICATION.G_X02;',
'CR1 C1%ROWTYPE;',
'v_error  VARCHAR2(4000);',
'',
'BEGIN ',
' ',
'   OPEN C1;',
'   FETCH C1 INTO CR1;',
' ',
'         IF APEX_APPLICATION.G_X03 = 0 THEN',
'            v_error := ''In Process Qty. must be entered.'';',
'         ELSIF APEX_APPLICATION.G_X01 = ''Y'' AND APEX_APPLICATION.G_X03 < 0 THEN',
'            v_error := ''In Process Qty. should be greater than zero'';',
'         ELSIF APEX_APPLICATION.G_X01 = ''Y'' AND APEX_APPLICATION.G_X03 > (CR1.fdpa_alloc_qty - CR1.fdpa_trip_conv_qty)THEN',
'            v_error := ''In Process Qty. should not exceed Allowed to be Completed Qty.'';',
'         END IF;',
'',
'   IF APEX_APPLICATION.G_X01 = ''Y''  THEN',
'',
'      UPDATE fmcg_disp_plan_alloc',
'         SET fdpa_select_flag = ''Y'',',
'              fdpa_select_user = :global_user',
'        WHERE fdpa_bu=:global_bu',
'          AND fdpa_doc_no=CR1.fdpa_doc_no',
'          AND fdpa_seq_no=CR1.fdpa_seq_no;',
'      ',
'   ELSE',
'       UPDATE fmcg_disp_plan_alloc',
'        SET fdpa_select_flag = ''N'',',
'            fdpa_select_user = NULL',
'        WHERE fdpa_bu=:global_bu',
'         AND  fdpa_doc_no=CR1.fdpa_doc_no',
'         AND  fdpa_seq_no=CR1.fdpa_seq_no;',
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
,p_internal_uid=>3349481625638357878
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6986591577151594563)
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
'            WHEN fdpa_select_flag = ''N'' THEN',
'                ''N''',
'            WHEN fdpa_select_flag = ''Y'' THEN',
'                ''Y''',
'            ELSE',
'                ''NY''',
'        END fdpa_select_flag INTO v_flag',
'      FROM',
'        (',
'      SELECT LISTAGG(DISTINCT fdpa_select_flag, '','') WITHIN GROUP( ORDER BY fdpa_select_flag ) fdpa_select_flag',
'        FROM fmcg_pend_trip_sheet_view ',
'      WHERE fdph_bu = :global_bu',
'         );',
'',
'',
'',
'      SELECT COUNT(*)cnt',
'        INTO v_count',
'        from fmcg_pend_trip_sheet_view',
'       WHERE fdph_bu = :global_bu',
'         AND fdpa_select_flag = ''Y'';',
'',
'       HTP.P(v_flag ||''-'' ||v_count ||'' '' ||''row Selected'');',
'END;         '))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>3349482895347357879
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6986591105245594563)
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
'      WHERE fdph_bu = :GLOBAL_BU;',
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
'                      WHERE fdph_bu                  = :GLOBAL_BU',
'                        AND fdpa_doc_no||fdpa_seq_no = APEX_APPLICATION.G_F02(i))',
'         LOOP',
'            ',
'             IF APEX_APPLICATION.G_F01(i)  <= 0 OR APEX_APPLICATION.G_F01(i)  IS NULL THEN',
'        	    Raise_Application_Error(-20999,''In Process Qty. should be greater than Zero.'');	',
'        	 END IF;',
'',
'             IF APEX_APPLICATION.G_F01(i)  > (CR2.fdpa_alloc_qty - CR2.fdpa_trip_conv_qty) THEN',
'        	    Raise_Application_Error(-20999,''In Process Qty. should not be greater than Ord. Qty.'');	',
'        	 END IF;',
'             ',
'            ',
'            UPDATE fmcg_disp_plan_alloc',
'               SET fdpa_select_flag = ''N'',',
'                   fdpa_select_user = NULL',
'             WHERE fdpa_bu          = :global_bu',
'               AND fdpa_doc_no      = CR2.fdpa_doc_no',
'               AND fdpa_seq_no      = CR2.fdpa_seq_no;',
'',
'       ',
'        END LOOP;',
'    END LOOP;',
'',
'     OPEN PAY_CURSOR FOR ''SELECT fdpa_doc_no,',
'                                 fdpa_seq_no',
'                            FROM fmcg_pend_trip_sheet_view',
'                           WHERE fdpa_bu = ''''''||:GLOBAL_BU||''''''',
'                             AND '' ||FUNC_FIND_IR_CONDITION_EXPRESSION( 262, 169201901,''Trip Sheet'', :APP_SESSION);',
'   LOOP',
'        FETCH PAY_CURSOR ',
'	     INTO v_doc_no,',
'              v_doc_seq_no;',
'',
'       EXIT WHEN PAY_CURSOR%notfound; ',
'                  ',
'',
'            UPDATE fmcg_disp_plan_alloc',
'               SET fdpa_select_flag  = ''N'',',
'                   fdpa_select_user  = NULL',
'             WHERE fdpa_bu           = :global_bu',
'               AND fdpa_doc_no       = v_doc_no',
'               AND fdpa_seq_no       = v_doc_seq_no;',
'',
'',
'          END LOOP;  ',
'   ',
'   CLOSE PAY_CURSOR;',
'     HTP.P(''success'');',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>3349482423441357879
);
wwv_flow_imp.component_end;
end;
/
