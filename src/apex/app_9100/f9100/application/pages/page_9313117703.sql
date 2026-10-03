prompt --application/pages/page_9313117703
begin
--   Manifest
--     PAGE: 9313117703
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
 p_id=>9313117703
,p_name=>'Create MRV'
,p_alias=>'CREATE-MRV'
,p_page_mode=>'MODAL'
,p_step_title=>'Create MRV'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function checkanduncheck(a, b) {',
'    var isChecked = document.getElementById("checkbox_" + a).checked;',
'    var checkflag;',
'    if (isChecked) { checkflag = ''Y''; } else { checkflag = ''N''; };',
'    apex.server.process(',
'        "CHECKANDUNCHECK",     //To call the ajax process name here',
'        {',
'            x02: a,',
'            x03: checkflag // Pass the input field value as a parameter',
'        },',
'        {',
'            dataType: ''text'',',
'            success: function (data) {',
'                if (data.trim() !== ''success'') {',
'                    apex.message.showErrors([{ type: "error", location: "page", message: data.replace(''sqlerrm:ORA-20999: '', ''''), unsafe: false }]);',
'                    document.getElementById("checkbox_" + a).checked = false;',
'                    button();',
'                } else {',
'                    console.log(''success'', data);',
'                    button();',
'                  //   output.innerText = incrementRowSelection(output.innerText, checkflag);',
'                }',
'            }',
'        }',
'    );',
'};',
'function readonly(a){',
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
'/* Checkall and Uncheckall*/',
'function selectall() {',
'    var isChecked = document.getElementById("check_all").checked;',
'    if (isChecked) {',
'        apex.server.process(',
'            "SELECTALL", // Replace with your AJAX callback name',
'            {},',
'            {',
'                dataType: ''text'',',
'                success: function (data) {',
'                    console.log(''success'', data);',
'                    overallcheck();',
'                    apex.region("PEND").refresh();                  ',
'                },',
'                error: function (jqXHR, textStatus, errorThrown) {',
'                    console.error(errorThrown, jqXHR, textStatus);',
'                }',
'            }',
'        );',
'    } else {',
'        apex.server.process(',
'            "UNSELECTALL", // Replace with your AJAX callback name',
'            {},',
'            {',
'                dataType: ''text'',',
'                success: function (data) {',
'                    console.log(''success'', data);',
'                    overallcheck();                    ',
'                    apex.region("PEND").refresh();                    ',
'                }',
'            }',
'        ); }}',
'',
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
'                //output.innerText = (flag[1]).toString();',
'',
'                if (flag[0] == ''Y'' && checkbox != null) {',
'                    checkbox.checked = true;',
'                    button();',
'                } else if (flag[0] == ''N'' && checkbox != null) {',
'                    checkbox.checked = false;',
'                    button();',
'                } else if (flag[0] == ''NY'' && checkbox != null) {',
'                    checkbox.checked = false;',
'                    button();',
'                }',
'            }',
'        }',
'    );',
'}',
'',
'function button(){    ',
'           var inputElems = document.getElementsByTagName("input"),',
'        count = 0;',
'        for (var i=0; i<inputElems.length; i++) {',
'        if (inputElems[i].type === "checkbox" && inputElems[i].checked === true){',
'            count++;  ',
'            if (count != null ) { ',
'                  apex.item("B1").enable();',
'            }	',
'        }',
'        else{',
'          if (count == '' '' ) { ',
'                  apex.item("B1").disable();',
'          }	',
'        }        ',
'   }};',
'   '))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'overallcheck();',
'button();'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
' .a-IRR-table {',
'    border-collapse: collapse;',
'    table-layout: auto;',
'    border-spacing: 0;',
'    white-space: nowrap;',
'    word-wrap: break-word;',
'}',
'',
'',
'  .t-fht-thead {',
'    overflow: auto !important;',
'}',
'',
'',
'#Clear{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: rgba(0, 0, 0, 0.15);',
'   background-size: 25px;',
'   width: 25px;',
'   height: 25px;',
'   padding-bottom: 8px;',
'}'))
,p_step_template=>wwv_flow_imp.id(5741311521565371726)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1300'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7672449656260180167)
,p_plug_name=>'FIND PENDING ISSUANCE'
,p_static_id=>'find-pending-issuance'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10343875485145547628)
,p_plug_name=>'Lot_Series'
,p_static_id=>'lot-series'
,p_parent_plug_id=>wwv_flow_imp.id(10343175082671771638)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       DCLSD_BU,',
'       DCLSD_PLNT,',
'       DCLSD_DOC_NO,',
'       DCLSD_SEQ_NO,',
'       DCLSD_SUB_SEQ_NO,',
'       DCLSD_SYS_LS_NO,',
'       DCLSD_LOT_NO,',
'       DCLSD_SERIAL_NO,',
'       DCLSD_SOURCE_ID,',
'       DCLSD_SOURCE_TYPE,',
'       DCLSD_EXPIRY_DATE,',
'       DCLSD_QTY,',
'       DCLSD_COMPLD_QTY,',
'       DCLSD_PROC_QTY,',
'       DCLSD_INPROC_QTY,',
'       DCLSD_TRF_SEL_FLAG,',
'       DCLSD_TRF_SEL_USER,',
'       DCLSD_MFG_DATE,',
'       DCLSD_CRATE_ID,',
'       DCLSD_CRE_BY,',
'       DCLSD_CRE_IP_ADDR,',
'       DCLSD_CRE_OS_USER,',
'       DCLSD_CRE_DATE,',
'       DCLSD_UPD_BY,',
'       DCLSD_UPD_IP_ADDR,',
'       DCLSD_UPD_OS_USER,',
'       DCLSD_UPD_DATE,',
'       DCLSD_CRE_EMP_ID,',
'       DCLSD_UPD_EMP_ID,',
'       DCLSD_BATCH_NO,',
'       DCLSD_TEST_NO,',
'       DCLSD_HEAT_NO,',
'       DCLSD_ACT_WGHT,',
'       DCLSD_SHORT_QTY,',
'       DCLSD_MOSTR_QTY,',
'       DCLSD_ACT_RCPT_QTY,',
'       DCLSD_BIN_ID,',
'       DCLSD_GR_WGHT,',
'       DCLSD_TR_WGHT,',
'       DCLSD_NT_WGHT,',
'       DCLSD_TOT_BAGS,',
'		 (CASE WHEN dclsd_trf_sel_flag = ''Y''	THEN',
'		''<span aria-hidden="true" class="fa fa-check-square" style = "color:blue;"></span>''',
'	  ELSE',
'		''<span aria-hidden="true" class="fa fa-square-o"  style = "color:black;"></span>''',
'     END) select_flag,',
'	  	(APEX_ITEM.HIDDEN(4,DCLSD_PLNT||DCLSD_DOC_NO||DCLSD_SEQ_NO||DCLSD_SUB_SEQ_NO)||',
'		 APEX_ITEM.TEXT(5,nvl(DCLSD_PROC_QTY,0),5,5,NULL,''<input type="text" style="text-align: right;/>'')) PROCESS_LOT',
'  from DC_LOT_SERIAL_DTLS',
'  where DCLSD_BU =:GLOBAL_BU',
'  AND  dclsd_bu = :P9313117703_DCHD_BU ',
'  AND   dclsd_plnt = :P9313117703_DCHD_PLNT',
'  AND   dclsd_doc_no = :P9313117703_DCHD_DOC_NO',
'  AND   dclsd_seq_no = :P9313117703_DCLN_SEQ_NO',
'  AND (dclsd_lot_no IS NOT NULL OR dclsd_serial_no IS NOT NULL)'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'NEVER'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Lot_Series'
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
 p_id=>wwv_flow_imp.id(10343875580106547629)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>4861913744562936601
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343879292438547666)
,p_db_column_name=>'DCLSD_ACT_RCPT_QTY'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Dclsd Act Rcpt Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343878986027547663)
,p_db_column_name=>'DCLSD_ACT_WGHT'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Dclsd Act Wght'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343878688344547660)
,p_db_column_name=>'DCLSD_BATCH_NO'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Dclsd Batch No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343879321367547667)
,p_db_column_name=>'DCLSD_BIN_ID'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Dclsd Bin Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343875714076547631)
,p_db_column_name=>'DCLSD_BU'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Dclsd Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343876935530547643)
,p_db_column_name=>'DCLSD_COMPLD_QTY'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Completed'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343877535018547649)
,p_db_column_name=>'DCLSD_CRATE_ID'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Dclsd Crate Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343877622862547650)
,p_db_column_name=>'DCLSD_CRE_BY'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Dclsd Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343877995489547653)
,p_db_column_name=>'DCLSD_CRE_DATE'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Dclsd Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343878488873547658)
,p_db_column_name=>'DCLSD_CRE_EMP_ID'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Dclsd Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343877722271547651)
,p_db_column_name=>'DCLSD_CRE_IP_ADDR'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Dclsd Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343877898199547652)
,p_db_column_name=>'DCLSD_CRE_OS_USER'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Dclsd Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343875980599547633)
,p_db_column_name=>'DCLSD_DOC_NO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Dclsd Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343876717998547641)
,p_db_column_name=>'DCLSD_EXPIRY_DATE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Expiry Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343879444635547668)
,p_db_column_name=>'DCLSD_GR_WGHT'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Dclsd Gr Wght'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343878896741547662)
,p_db_column_name=>'DCLSD_HEAT_NO'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Dclsd Heat No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343877179707547645)
,p_db_column_name=>'DCLSD_INPROC_QTY'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Inproc.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343876303523547637)
,p_db_column_name=>'DCLSD_LOT_NO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Lot No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343877497559547648)
,p_db_column_name=>'DCLSD_MFG_DATE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Mftr. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343879157270547665)
,p_db_column_name=>'DCLSD_MOSTR_QTY'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Dclsd Mostr Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343879681466547670)
,p_db_column_name=>'DCLSD_NT_WGHT'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Dclsd Nt Wght'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343875878165547632)
,p_db_column_name=>'DCLSD_PLNT'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Dclsd Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343877096813547644)
,p_db_column_name=>'DCLSD_PROC_QTY'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Process'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343876845722547642)
,p_db_column_name=>'DCLSD_QTY'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343876036204547634)
,p_db_column_name=>'DCLSD_SEQ_NO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343876413489547638)
,p_db_column_name=>'DCLSD_SERIAL_NO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Serial No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343879005566547664)
,p_db_column_name=>'DCLSD_SHORT_QTY'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Dclsd Short Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343876547488547639)
,p_db_column_name=>'DCLSD_SOURCE_ID'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Source'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343876676728547640)
,p_db_column_name=>'DCLSD_SOURCE_TYPE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Source Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343876196638547635)
,p_db_column_name=>'DCLSD_SUB_SEQ_NO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'DCLSD_SUB_SEQ_NO'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343876294101547636)
,p_db_column_name=>'DCLSD_SYS_LS_NO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Sys Ls No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343878794413547661)
,p_db_column_name=>'DCLSD_TEST_NO'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Dclsd Test No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343879781804547671)
,p_db_column_name=>'DCLSD_TOT_BAGS'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Dclsd Tot Bags'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343877212472547646)
,p_db_column_name=>'DCLSD_TRF_SEL_FLAG'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Dclsd Trf Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343877371447547647)
,p_db_column_name=>'DCLSD_TRF_SEL_USER'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Dclsd Trf Sel User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343879570155547669)
,p_db_column_name=>'DCLSD_TR_WGHT'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Dclsd Tr Wght'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343878039084547654)
,p_db_column_name=>'DCLSD_UPD_BY'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Dclsd Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343878373386547657)
,p_db_column_name=>'DCLSD_UPD_DATE'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Dclsd Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343878570828547659)
,p_db_column_name=>'DCLSD_UPD_EMP_ID'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Dclsd Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343878129396547655)
,p_db_column_name=>'DCLSD_UPD_IP_ADDR'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Dclsd Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343878232656547656)
,p_db_column_name=>'DCLSD_UPD_OS_USER'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Dclsd Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10344236651685868043)
,p_db_column_name=>'PROCESS_LOT'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Process '
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343875645241547630)
,p_db_column_name=>'ROWID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10344235898984868035)
,p_db_column_name=>'SELECT_FLAG'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Select Flag'
,p_column_link=>'javascript:$s(''P9313117703_DCLSD_QTY'',''#DCLSD_QTY#''),$s(''P9313117703_DCLSD_COMPLD_QTY'',''#DCLSD_COMPLD_QTY#''),$s(''P9313117703_DCLSD_TRF_SEL_FLAG'',''#DCLSD_TRF_SEL_FLAG#''),$s(''P9313117703_DCLSD_PROC_QTY'',''#DCLSD_PROC_QTY#''),$s(''P9313117703_DCLN_PROC_QTY'
||''',''#DCLN_PROC_QTY#'');apex.submit(''SEL_FLAG'');'
,p_column_linktext=>'#SELECT_FLAG#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(10344222682626847282)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'23374666'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>1
,p_report_columns=>'DCLSD_SEQ_NO:DCLSD_SYS_LS_NO:DCLSD_LOT_NO:DCLSD_SERIAL_NO:DCLSD_SOURCE_ID:DCLSD_SOURCE_TYPE:DCLSD_EXPIRY_DATE:DCLSD_MFG_DATE:DCLSD_QTY:DCLSD_COMPLD_QTY:DCLSD_PROC_QTY:DCLSD_INPROC_QTY:PROCESS_LOT:SELECT_FLAG'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10343175282146771640)
,p_plug_name=>'MRV(W Gate Entry)'
,p_static_id=>'mrv-w-gate-entry'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10343175303773771641)
,p_plug_name=>'MRV(W Gate Entry)'
,p_static_id=>'mrv-w-gate-entry-2'
,p_parent_plug_id=>wwv_flow_imp.id(10343175282146771640)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       GEHD_BU,',
'       GEHD_DOC_NO,',
'       GEHD_DATE,',
'       GEHD_STATUS,',
'       GEHD_TYPE,',
'       GEHD_GK_ID,',
'       GEHD_VEHICLE_NO,',
'       GEHD_DRIVER_NAME,',
'       DECODE (GEHD_MODE,''MT'',''Material Transfer'')GEHD_MODE,',
'       GEHD_RET_FLAG,',
'       GEHD_PLNT,',
'		 (SELECT bup_name1',
'         FROM bus_unit_plants',
'        WHERE bup_bu = GEHD_BU ',
'          AND bup_plant_id = GEHD_PLNT)plant_desc,',
'		 (SELECT store_desc1',
'         FROM stores',
'        WHERE store_bu = GEHD_BU ',
'          AND store_id = gedl_store_id)STORE_DESC,	',
'			 func_find_employee_desc(GEHD_BU,GEHD_GK_ID,1)employee_des,		 	  ',
'       GEHD_GATE,',
'       GEHD_VEHICLE_IN,',
'       GEHD_VEHICLE_OUT,',
'       GEHD_ENTRY_REF,',
'       GEHD_REF_UNIT,',
'       GEHD_INWARD_SEL_FLAG,',
'       GEHD_OUTWARD_NO,',
'       GEHD_GROSS_WEIGHT,',
'       GEHD_TRUCK_TARE_WEIGHT,',
'       GEHD_EST_GROSS_WEIGHT,',
'       GEHD_ACT_WEIGHT,',
'       GEHD_UNLOAD_STAT_TIME,',
'       GEHD_UNLOAD_STOP_TIME,',
'       GEHD_UNLOAD_GROUP,',
'       GEHD_CONTAINER_NO,',
'       GEHD_CONTAINER_MFG_DATE,',
'       GEHD_CONTAINER_TYPE,',
'       GEHD_CONTAINER_LENGTH,',
'       GEHD_CONTAINER_WIDTH,',
'       GEHD_CONTAINER_HEIGHT,',
'       GEHD_ACT_TARE_WEIGHT,',
'       GEHD_SOURCE,',
'       GEHD_SEL_RETN_DC_FLAG,',
'       GEHD_RTN_DC_COMP_FLAG,',
'       GEHD_PROD_ID,',
'       GEHD_PROD_REV,',
'       GEHD_PROD_UOM,',
'       GEHD_QTY,',
'       GEHD_PROD_DESC1,',
'       GEHD_PO_PFX,',
'       GEHD_PO_NO,',
'       GEHD_RCPT_PFX,',
'       GEHD_RCPT_NO,',
'       GEHD_LR_NO,',
'       GEHD_RR_NO,',
'       GEHD_DC_NO,',
'       GEHD_DC_DATE,',
'       GEHD_GATE_NO,',
'       GEHD_TRANS_ID,',
'       GEHD_SUPPIER_ID,',
'       GEHD_INVOICE_NO,',
'       GEHD_INVOICE_DATE,',
'       GEHD_PO_SEQ_NO,',
'       GEHD_PO_SUB_SEQ_NO,',
'       GEHD_LOAD_SUPPLIER,',
'       GEHD_UNLOAD_SUPPLIER,',
'       GEHD_LOAD_START_TIME,',
'       GEHD_LOAD_STOP_TIME,',
'       GEHD_LOAD_POINT,',
'       GEHD_NO_OF_BAGS,',
'       GEHD_LOAD_INV_PFX,',
'       GEHD_LOAD_INV_NO,',
'       GEHD_UNLOAD_INV_PFX,',
'       GEHD_UNLOAD_INV_NO,',
'       GEHD_LOAD_SEL_FLAG,',
'       GEHD_UNLOAD_SEL_FLAG,',
'       GEHD_SEL_RETN_DC_USER,',
'       GEHD_RTN_DOC_NO,',
'       GEHD_WAY_BILL_DATE,',
'       GEHD_COURIER_NAME,',
'       GEHD_COURIER_DOCKET_NO,',
'       GEHD_COURIER_DATE,',
'       GEHD_INDIR_MVMT_FLAG,',
'       GEHD_DRIVE_LICENCE_NO,',
'       GEHD_TRIP_SHEET_NO,',
'       GEHD_LIC_EXP_DATE,',
'       GEHD_FC_EXP_DATE,',
'       GEHD_INSURANCE_NO,',
'       GEHD_INS_EXP_DATE,',
'       GEHD_DRIVER_MOB_NO,',
'       GEHD_VOU_PFX,',
'       GEHD_VOU_NO,',
'       GEHD_FRM_CITY,',
'       GEHD_TO_CITY,',
'       GEHD_TOTAL_WEIGHT,',
'       GEHD_SEL_FLAG,',
'       GEHD_SEL_USER,',
'       GEHD_ROAD_PERMIT_NO,',
'       GEHD_VEH_REP_IN,',
'       GEHD_LAB_ORD_FLAG,',
'       GEHD_ASN_NO,',
'       GEHD_UNLDG_LOG_SHT_FLAG,',
'       GEHD_LC_FRT_AMT,',
'       GEHD_WB_SER_NO,',
'       GEHD_COURIER_ID,',
'       GEHD_TRIP_SHT_NO,',
'       GEHD_TRIP_SHT_LINE,',
'       GEHD_GRN_CRE_FLAG,',
'       GEHD_EWB_TRNSP_MODE,',
'       GEHD_EWB_TRNSP_ID,',
'       GEHD_EWB_TRNSP_NAME,',
'       GEHD_EWB_TRNSP_DOC_DATE,',
'       GEHD_EWB_DIST_KM,',
'       GEHD_EWB_BILL_NO,',
'       GEHD_HDPE_BAGS,',
'       GEHD_TRANS_TYPE,',
'       GEHD_SHIFT_ID,',
'       GEHD_LOAD_TEAM_ID,',
'       GEHD_UNLOAD_TEAM_ID,',
'       GEHD_VEHICLE_TYPE,',
'       GEHD_LOAD_ACTVTY_ID,',
'       GEHD_UNLOAD_ACTVTY_ID,',
'       GEHD_RECVD_QTY,',
'       GEHD_GB_WEIGHT,',
'       GEHD_PB_WEIGHT,',
'       GEHD_TARE_SHIFT_ID,',
'       GEHD_IN_TIME,',
'       GEHD_TRIP_PLN_NO,',
'       GEHD_OWNED_BY,',
'       GEHD_GROSS_SHIFT_ID,',
'       GEHD_GROSS_IN_TIME,',
'       GEHD_OUTWARD_SHIFT_ID,',
'       GEHD_IO_STATUS,',
'       GEHD_GE_REF_DOC_NO,',
'       GEHD_FRT_PAID_AMT,',
'       GEHD_CASHIER_ID,',
'       GEHD_NO_BUNDLE,',
'       GEHD_RR_FLAG,',
'       GEHD_STK_QTY,',
'       GEHD_DC_REQ_FLAG,',
'       GEHD_PERMIT_EXP_DATE,',
'       GEHD_POLL_EXP_DATE,',
'       GEHD_CPV_PREFIX,',
'       GEHD_CPV_DOC_NO,',
'       GEHD_REPORT_TIME,',
'       GEHD_VEH_RET_FLAG,',
'       GEHD_VEH_RET_REASON,',
'       GEHD_UNLOAD_DOC_NO,',
'       GEHD_ST_INV_PFX,',
'       GEHD_ST_INV_NO,',
'       GEHD_ST_INV_SEQ_NO,',
'       GEHD_UNLOAD_STATUS,',
'       GEHD_PUR_RTN_TYPE,',
'       GEHD_PUR_RTN_QTY,',
'       GEHD_SUPLR_BILL_AMT,',
'       GEHD_FR_STORE_ID,',
'       GEHD_TO_STORE_ID,',
'       GEHD_SUPLR_BAG_QTY,',
'       GEHD_PAN_NO,',
'       GEHD_UNIT_COST,',
'       GEHD_ITR_COMPL_FLAG,',
'       GEHD_FRT_SCOPE,',
'       GEHD_GROSS_AMT,',
'       GEHD_UNLDG_CHRGS,',
'       GEHD_SHTG_DED_AMT,',
'       GEHD_OTH_DED_AMT,',
'       GEHD_PAN_HLDR_NAME,',
'       GEHD_BAY_ID,',
'       GEHD_SENDER_NAME,',
'       GEHD_SENDER_ADDR,',
'       GEHD_SENDER_DC_NO,',
'       GEHD_SENDER_DC_DATE,',
'       GEHD_ACT,',
'       GEHD_BAY_IN_TIME,',
'       GEHD_BAY_OUT_TIME,',
'       GEHD_SUPLR_DESC,',
'       GEHD_TOKEN_NO,',
'       GEHD_SI_PRICE,',
'       GEHD_ST_INV_BU,',
'       GEHD_ST_INV_PLNT,',
'       GEHD_IMPORT_FLAG,',
'       GEHD_CANCEL_REASON,',
'       GEHD_CRE_BY,',
'       GEHD_CRE_IP_ADDR,',
'       GEHD_CRE_OS_USER,',
'       GEHD_CRE_DATE,',
'       GEHD_UPD_BY,',
'       GEHD_UPD_IP_ADDR,',
'       GEHD_UPD_OS_USER,',
'       GEHD_UPD_DATE,',
'       GEHD_CP_DOC_NO,',
'       GEHD_CP_DOC_PFX,',
'       GEHD_CP_SEL_FLAG,',
'       GEHD_CP_SEL_USER,',
'       GEHD_CRE_EMP_ID,',
'       GEHD_UPD_EMP_ID,',
'       GEHD_WGH_BDG_RQRD_FLAG,',
'       GEHD_DRY_FAT,',
'       GEHD_DRY_SNF,',
'       GEHD_DRY_FAT_KGS,',
'       GEHD_DRY_SNF_KGS,',
'       GEHD_DAIRY_TYPE,',
'       GEHD_DRY_LR,',
'       GEHD_DRY_TRF_QTY_LTR,',
'       GEHD_DRY_TRF_QTY_KGS,',
'       GEHD_DESP_PLN_DOC_NO,',
'       GEHD_DRY_SEAL_SER_NO,',
'       GEHD_PLNT_LOC_ID,',
'       GEHD_PLNT_LOC_NAME,',
'       GELN_BU,',
'       GELN_DOC_NO,',
'       GELN_SEQ_NO,',
'       GELN_STATUS,',
'       GELN_SUPLR_ID,',
'       GELN_SUPLR_NAME,',
'       GELN_DC_NO,',
'       GELN_DC_DATE,',
'       GELN_INVOICE_NO,',
'       GELN_INVOICE_DATE,',
'       GELN_DC_FLAG,',
'       GELN_DC_RTN_FLAG,',
'       GELN_DC_GE_NO,',
'       GELN_PLNT,',
'       GELN_REF,',
'       GELN_ACT_SUPLR_NAME,',
'       GELN_INV_WEIGHT,',
'       GELN_INWARD_SEL_FLAG,',
'       GELN_FRM_CITY,',
'       GELN_TO_CITY,',
'       GELN_SENDER_NAME,',
'       GELN_SENDER_ADDR,',
'       GELN_SENDER_DC_NO,',
'       GELN_SENDER_DC_DATE,',
'       GELN_IO_TYPE,',
'       GELN_CRE_BY,',
'       GELN_CRE_IP_ADDR,',
'       GELN_CRE_OS_USER,',
'       GELN_CRE_DATE,',
'       GELN_UPD_BY,',
'       GELN_UPD_IP_ADDR,',
'       GELN_UPD_OS_USER,',
'       GELN_UPD_DATE,',
'       GELN_CRE_EMP_ID,',
'       GELN_UPD_EMP_ID,',
'       GELN_SUPLR_SHIPFR_GST_NO,',
'       GELN_SUPLR_BILLFR_GST_NO,',
'       GELN_PARTY_TYPE,',
'       GEDL_BU,',
'       GEDL_DOC_NO,',
'       GEDL_SEQ_NO,',
'       GEDL_SUB_SEQ_NO,',
'       GEDL_PROD_ID,',
'       GEDL_PROD_REV,',
'       GEDL_PROD_UOM,',
'       GEDL_QTY,',
'       GEDL_PO_PFX,',
'       GEDL_PO_NO,',
'       GEDL_RCPT_PFX,',
'       GEDL_RCPT_NO,',
'       GEDL_MATCH_QTY,',
'       GEDL_SEL_REC,',
'       GEDL_UNIT_COST,',
'       GEDL_STATUS,',
'       GEDL_PROD_DESC1,',
'       GEDL_PLNT,',
'       GEDL_EXCESS_QTY,',
'       GEDL_PROD_ORD_NO,',
'       GEDL_SS_DOC_PFX,',
'       GEDL_SS_DOC_NO,',
'       GEDL_SS_SEQ_NO,',
'       GEDL_CUST_RCPT_NO,',
'       GEDL_USER,',
'       GEDL_CB_DOC_NO,',
'       GEDL_PO_SEQ_NO,',
'       GEDL_PO_SUB_SEQ_NO,',
'       GEDL_CR_USER,',
'       GEDL_CR_SEL_FLAG,',
'       GEDL_MAT_TYPE,',
'       GEDL_NO_OF_BAGS,',
'       GEDL_SF_CODE,',
'       GEDL_PG_FLAG,',
'       GEDL_PG_ID,',
'       GEDL_QC_REQ,',
'       GEDL_BOM_NO,',
'       GEDL_TAX_SET_ID,',
'       GEDL_UPD_TOLR_PCT,',
'       GEDL_UPD_TOLR_QTY,',
'       GEDL_SS_SUB_SEQ_NO,',
'       GEDL_FSI_DOC_NO,',
'       GEDL_FSI_SEQ_NO,',
'       GEDL_INV_PFX,',
'       GEDL_INV_NO,',
'       GEDL_INV_SEQ_NO,',
'       GEDL_DC_NO,',
'       GEDL_DC_SEQ_NO,',
'       GEDL_INWR_PROC_QTY,',
'       GEDL_INWR_INPROC_QTY,',
'       GEDL_DC_TYPE,',
'       GEDL_INWR_COMP_QTY,',
'       GEDL_INWR_SEL_FLAG,',
'       GEDL_OUTWARD_NO,',
'       GEDL_BOM_AVAIL_FLAG,',
'       GEDL_DUPLI_INV_FLAG,',
'       GEDL_ORGI_INV_FLAG,',
'       GEDL_PR_PFX,',
'       GEDL_PR_NO,',
'       GEDL_PR_SEQ_NO,',
'       GEDL_PR_SUB_SEQ_NO,',
'       GEDL_UOM,',
'       GEDL_CONV_FACTOR,',
'       GEDL_STORE_ID,',
'       GEDL_TCF_ID,',
'       GEDL_DISC_PCT,',
'       GEDL_NET_DISC_FLAG,',
'       GEDL_DC_DOC_NO,',
'       GEDL_SOU_BU,',
'       GEDL_SOU_PLNT,',
'       GEDL_DEPT_ID,',
'       GEDL_DIM_REQ_FLAG,',
'       GEDL_THICKNESS,',
'       GEDL_LENGTH,',
'       GEDL_WIDTH,',
'       GEDL_SO_TYPE,',
'       GEDL_SO_PFX,',
'       GEDL_SO_NO,',
'       GEDL_SO_SEQ_NO,',
'       GEDL_SO_SUB_SEQ_NO,',
'       GEDL_PROJ_ID,',
'       GEDL_TASK_ID,',
'       GEDL_LOT_NO,',
'       GEDL_SER_NO,',
'       GEDL_SYS_LS_NO,',
'       GEDL_QTY_IN_NOS,',
'       GEDL_VIS_INSP_FLAG,',
'       GEDL_SOU_MAT_WEIGHT,',
'       GEDL_TAR_MAT_WEIGHT,',
'       GEDL_PLND_SCRAP_WEIGHT,',
'       GEDL_PLND_HR_UNIT,',
'       GEDL_PO_AMD_NO,',
'       GEDL_SERV_PROD_ID,',
'       GEDL_SERV_IO_TYPE,',
'       GEDL_AMC_START_DATE,',
'       GEDL_AMC_END_DATE,',
'       GEDL_SERV_PROD_DESC,',
'       GEDL_RES_ID,',
'       GEDL_SCR_PCT,',
'       GEDL_WORK_ORD_NO,',
'       GEDL_TASK_OPRN_ID,',
'       GEDL_LS_UOM_GEN_TYPE,',
'       GEDL_SO_SCHLD_DESC,',
'       GEDL_CAP_ASSET_ID,',
'       GEDL_TRF_SEL_FLAG,',
'       GEDL_TRF_SEL_USER,',
'       GEDL_HSN_CODE,',
'       GEDL_MFTR_ID,',
'       GEDL_MFTR_PART_NO,',
'       GEDL_COST_BASIS,',
'       GEDL_STK_QTY,',
'       GEDL_SUPLR_BILL_QTY,',
'       GEDL_ST_INV_PFX,',
'       GEDL_ST_INV_NO,',
'       GEDL_ST_INV_SEQ_NO,',
'       GEDL_CSR_DOC_NO,',
'       GEDL_RCT_FOR,',
'       GEDL_SI_PRICE,',
'       GEDL_ST_INV_BU,',
'       GEDL_ST_INV_PLNT,',
'       GEDL_PROD_OUTER_DIA,',
'       GEDL_CUST_MAT_RECV_FLAG,',
'       GEDL_CRE_BY,',
'       GEDL_CRE_IP_ADDR,',
'       GEDL_CRE_OS_USER,',
'       GEDL_CRE_DATE,',
'       GEDL_UPD_BY,',
'       GEDL_UPD_IP_ADDR,',
'       GEDL_UPD_OS_USER,',
'       GEDL_UPD_DATE,',
'       GEDL_CUST_ID,',
'       GEDL_CUST_NAME1,',
'       GEDL_CRE_EMP_ID,',
'       GEDL_UPD_EMP_ID,',
'       GEDL_INWR_SEL_USER,',
'       GEDL_SOU_DOC_PFX,',
'       GEDL_SOU_DOC_NO,',
'       GEDL_SOU_DOC_SEQ_NO,',
'       GEDL_TCS_SEC_ID,',
'       GEDL_SUPLR_BILL_UNIT_COST,',
'       GEDL_ASN_NO,',
'       GEDL_GROSS_WGHT,',
'       GEDL_TARE_WGHT,',
'       GEDL_HEIGHT,',
'       GEDL_INNER_DIA,',
'       GEDL_DENSITY,',
'       GEDL_PUR_ACCT,',
'       GEDL_CC_CODE,',
'       GEDL_MILL_SUPLR_NAME,',
'       GEDL_FAB_ITEM_TYPE,',
'       GEDL_OPRN_LN_SEQ_NO,',
'       GEDL_PROCESS_ID,',
'		 CASE WHEN gedl_trf_sel_flag = ''Y''	THEN',
'		''<span aria-hidden="true" class="fa fa-check-square" style = "color:blue;"></span>''',
'	    ELSE',
'		''<span aria-hidden="true" class="fa fa-square-o"  style = "color:black;"></span>''',
'       END select_flag',
'  from MAT_TRF_PEND_GE_VIEW',
'  WHERE GEHD_BU =:GLOBAL_BU'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'NEVER'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'MRV(W Gate Entry)'
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
 p_id=>wwv_flow_imp.id(10343175403642771642)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>4861213568099160614
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10344235617713868033)
,p_db_column_name=>'EMPLOYEE_DES'
,p_display_order=>3950
,p_column_identifier=>'OF'
,p_column_label=>'Gate Keeper Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343341357667819727)
,p_db_column_name=>'GEDL_AMC_END_DATE'
,p_display_order=>3350
,p_column_identifier=>'LY'
,p_column_label=>'Gedl Amc End Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343341259355819726)
,p_db_column_name=>'GEDL_AMC_START_DATE'
,p_display_order=>3340
,p_column_identifier=>'LX'
,p_column_label=>'Gedl Amc Start Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343345819163819772)
,p_db_column_name=>'GEDL_ASN_NO'
,p_display_order=>3800
,p_column_identifier=>'NR'
,p_column_label=>'Gedl Asn No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343337274988819736)
,p_db_column_name=>'GEDL_BOM_AVAIL_FLAG'
,p_display_order=>2940
,p_column_identifier=>'KJ'
,p_column_label=>'Gedl Bom Avail Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343335428817819768)
,p_db_column_name=>'GEDL_BOM_NO'
,p_display_order=>2760
,p_column_identifier=>'JR'
,p_column_label=>'Gedl Bom No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343331873084819732)
,p_db_column_name=>'GEDL_BU'
,p_display_order=>2400
,p_column_identifier=>'IF'
,p_column_label=>'Gedl Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343342143106819735)
,p_db_column_name=>'GEDL_CAP_ASSET_ID'
,p_display_order=>3430
,p_column_identifier=>'MG'
,p_column_label=>'Gedl Cap Asset Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343334358636819757)
,p_db_column_name=>'GEDL_CB_DOC_NO'
,p_display_order=>2650
,p_column_identifier=>'JG'
,p_column_label=>'Gedl Cb Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343346520605819729)
,p_db_column_name=>'GEDL_CC_CODE'
,p_display_order=>3870
,p_column_identifier=>'NY'
,p_column_label=>'Gedl Cc Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343338043560819744)
,p_db_column_name=>'GEDL_CONV_FACTOR'
,p_display_order=>3020
,p_column_identifier=>'KR'
,p_column_label=>'Gedl Conv Factor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343342778198819741)
,p_db_column_name=>'GEDL_COST_BASIS'
,p_display_order=>3490
,p_column_identifier=>'MM'
,p_column_label=>'Gedl Cost Basis'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343344093620819754)
,p_db_column_name=>'GEDL_CRE_BY'
,p_display_order=>3620
,p_column_identifier=>'MZ'
,p_column_label=>'Gedl Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343344361847819757)
,p_db_column_name=>'GEDL_CRE_DATE'
,p_display_order=>3650
,p_column_identifier=>'NC'
,p_column_label=>'Gedl Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343345037519819764)
,p_db_column_name=>'GEDL_CRE_EMP_ID'
,p_display_order=>3720
,p_column_identifier=>'NJ'
,p_column_label=>'Gedl Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343344148259819755)
,p_db_column_name=>'GEDL_CRE_IP_ADDR'
,p_display_order=>3630
,p_column_identifier=>'NA'
,p_column_label=>'Gedl Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343344212651819756)
,p_db_column_name=>'GEDL_CRE_OS_USER'
,p_display_order=>3640
,p_column_identifier=>'NB'
,p_column_label=>'Gedl Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343334764548819761)
,p_db_column_name=>'GEDL_CR_SEL_FLAG'
,p_display_order=>2690
,p_column_identifier=>'JK'
,p_column_label=>'Gedl Cr Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343334677105819760)
,p_db_column_name=>'GEDL_CR_USER'
,p_display_order=>2680
,p_column_identifier=>'JJ'
,p_column_label=>'Gedl Cr User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343343361849819747)
,p_db_column_name=>'GEDL_CSR_DOC_NO'
,p_display_order=>3550
,p_column_identifier=>'MS'
,p_column_label=>'Gedl Csr Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343344839210819762)
,p_db_column_name=>'GEDL_CUST_ID'
,p_display_order=>3700
,p_column_identifier=>'NH'
,p_column_label=>'Gedl Cust Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343343943558819753)
,p_db_column_name=>'GEDL_CUST_MAT_RECV_FLAG'
,p_display_order=>3610
,p_column_identifier=>'MY'
,p_column_label=>'Gedl Cust Mat Recv Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343344957905819763)
,p_db_column_name=>'GEDL_CUST_NAME1'
,p_display_order=>3710
,p_column_identifier=>'NI'
,p_column_label=>'Gedl Cust Name1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343334190141819755)
,p_db_column_name=>'GEDL_CUST_RCPT_NO'
,p_display_order=>2630
,p_column_identifier=>'JE'
,p_column_label=>'Gedl Cust Rcpt No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343338542054819749)
,p_db_column_name=>'GEDL_DC_DOC_NO'
,p_display_order=>3070
,p_column_identifier=>'KW'
,p_column_label=>'Gedl Dc Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343336474900819728)
,p_db_column_name=>'GEDL_DC_NO'
,p_display_order=>2860
,p_column_identifier=>'KB'
,p_column_label=>' Dc No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343336516992819729)
,p_db_column_name=>'GEDL_DC_SEQ_NO'
,p_display_order=>2870
,p_column_identifier=>'KC'
,p_column_label=>'Gedl Dc Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343336888578819732)
,p_db_column_name=>'GEDL_DC_TYPE'
,p_display_order=>2900
,p_column_identifier=>'KF'
,p_column_label=>'Gedl Dc Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343346383984819727)
,p_db_column_name=>'GEDL_DENSITY'
,p_display_order=>3850
,p_column_identifier=>'NW'
,p_column_label=>'Gedl Density'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343338815993819752)
,p_db_column_name=>'GEDL_DEPT_ID'
,p_display_order=>3100
,p_column_identifier=>'KZ'
,p_column_label=>'Gedl Dept Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343338981452819753)
,p_db_column_name=>'GEDL_DIM_REQ_FLAG'
,p_display_order=>3110
,p_column_identifier=>'LA'
,p_column_label=>'Gedl Dim Req Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343338331857819747)
,p_db_column_name=>'GEDL_DISC_PCT'
,p_display_order=>3050
,p_column_identifier=>'KU'
,p_column_label=>'Gedl Disc Pct'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343331923597819733)
,p_db_column_name=>'GEDL_DOC_NO'
,p_display_order=>2410
,p_column_identifier=>'IG'
,p_column_label=>'Gedl Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343337378962819737)
,p_db_column_name=>'GEDL_DUPLI_INV_FLAG'
,p_display_order=>2950
,p_column_identifier=>'KK'
,p_column_label=>'Gedl Dupli Inv Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343333640032819750)
,p_db_column_name=>'GEDL_EXCESS_QTY'
,p_display_order=>2580
,p_column_identifier=>'IZ'
,p_column_label=>'Gedl Excess Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343346716501819731)
,p_db_column_name=>'GEDL_FAB_ITEM_TYPE'
,p_display_order=>3900
,p_column_identifier=>'OA'
,p_column_label=>'Gedl Fab Item Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343335929435819723)
,p_db_column_name=>'GEDL_FSI_DOC_NO'
,p_display_order=>2810
,p_column_identifier=>'JW'
,p_column_label=>'Gedl Fsi Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343336084034819724)
,p_db_column_name=>'GEDL_FSI_SEQ_NO'
,p_display_order=>2820
,p_column_identifier=>'JX'
,p_column_label=>'Gedl Fsi Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343345950983819723)
,p_db_column_name=>'GEDL_GROSS_WGHT'
,p_display_order=>3810
,p_column_identifier=>'NS'
,p_column_label=>'Gedl Gross Wght'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343346122126819725)
,p_db_column_name=>'GEDL_HEIGHT'
,p_display_order=>3830
,p_column_identifier=>'NU'
,p_column_label=>'Gedl Height'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343342412301819738)
,p_db_column_name=>'GEDL_HSN_CODE'
,p_display_order=>3460
,p_column_identifier=>'MJ'
,p_column_label=>'Gedl Hsn Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343346245484819726)
,p_db_column_name=>'GEDL_INNER_DIA'
,p_display_order=>3840
,p_column_identifier=>'NV'
,p_column_label=>'Gedl Inner Dia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343336221118819726)
,p_db_column_name=>'GEDL_INV_NO'
,p_display_order=>2840
,p_column_identifier=>'JZ'
,p_column_label=>'Gedl Inv No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343336116179819725)
,p_db_column_name=>'GEDL_INV_PFX'
,p_display_order=>2830
,p_column_identifier=>'JY'
,p_column_label=>'Gedl Inv Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343336318570819727)
,p_db_column_name=>'GEDL_INV_SEQ_NO'
,p_display_order=>2850
,p_column_identifier=>'KA'
,p_column_label=>'Gedl Inv Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343336923024819733)
,p_db_column_name=>'GEDL_INWR_COMP_QTY'
,p_display_order=>2910
,p_column_identifier=>'KG'
,p_column_label=>'Gedl Inwr Comp Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343336733090819731)
,p_db_column_name=>'GEDL_INWR_INPROC_QTY'
,p_display_order=>2890
,p_column_identifier=>'KE'
,p_column_label=>'Gedl Inwr Inproc Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343336685251819730)
,p_db_column_name=>'GEDL_INWR_PROC_QTY'
,p_display_order=>2880
,p_column_identifier=>'KD'
,p_column_label=>'Gedl Inwr Proc Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343337088402819734)
,p_db_column_name=>'GEDL_INWR_SEL_FLAG'
,p_display_order=>2920
,p_column_identifier=>'KH'
,p_column_label=>'Gedl Inwr Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343345289657819766)
,p_db_column_name=>'GEDL_INWR_SEL_USER'
,p_display_order=>3740
,p_column_identifier=>'NL'
,p_column_label=>'Gedl Inwr Sel User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343339163978819755)
,p_db_column_name=>'GEDL_LENGTH'
,p_display_order=>3130
,p_column_identifier=>'LC'
,p_column_label=>'Gedl Length'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343340071508819764)
,p_db_column_name=>'GEDL_LOT_NO'
,p_display_order=>3220
,p_column_identifier=>'LL'
,p_column_label=>'Gedl Lot No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343341962682819733)
,p_db_column_name=>'GEDL_LS_UOM_GEN_TYPE'
,p_display_order=>3410
,p_column_identifier=>'ME'
,p_column_label=>'Gedl Ls Uom Gen Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343333084462819744)
,p_db_column_name=>'GEDL_MATCH_QTY'
,p_display_order=>2520
,p_column_identifier=>'IT'
,p_column_label=>'Gedl Match Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343334813143819762)
,p_db_column_name=>'GEDL_MAT_TYPE'
,p_display_order=>2700
,p_column_identifier=>'JL'
,p_column_label=>'Gedl Mat Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343342535445819739)
,p_db_column_name=>'GEDL_MFTR_ID'
,p_display_order=>3470
,p_column_identifier=>'MK'
,p_column_label=>'Gedl Mftr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343342675067819740)
,p_db_column_name=>'GEDL_MFTR_PART_NO'
,p_display_order=>3480
,p_column_identifier=>'ML'
,p_column_label=>'Gedl Mftr Part No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343346627458819730)
,p_db_column_name=>'GEDL_MILL_SUPLR_NAME'
,p_display_order=>3880
,p_column_identifier=>'NZ'
,p_column_label=>'Gedl Mill Suplr Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343338502016819748)
,p_db_column_name=>'GEDL_NET_DISC_FLAG'
,p_display_order=>3060
,p_column_identifier=>'KV'
,p_column_label=>'Gedl Net Disc Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343334933108819763)
,p_db_column_name=>'GEDL_NO_OF_BAGS'
,p_display_order=>2710
,p_column_identifier=>'JM'
,p_column_label=>'Gedl No Of Bags'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343346839950819732)
,p_db_column_name=>'GEDL_OPRN_LN_SEQ_NO'
,p_display_order=>3910
,p_column_identifier=>'OB'
,p_column_label=>'Gedl Oprn Ln Seq No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343337472374819738)
,p_db_column_name=>'GEDL_ORGI_INV_FLAG'
,p_display_order=>2960
,p_column_identifier=>'KL'
,p_column_label=>'Gedl Orgi Inv Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343337140280819735)
,p_db_column_name=>'GEDL_OUTWARD_NO'
,p_display_order=>2930
,p_column_identifier=>'KI'
,p_column_label=>'Gedl Outward No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343335163230819765)
,p_db_column_name=>'GEDL_PG_FLAG'
,p_display_order=>2730
,p_column_identifier=>'JO'
,p_column_label=>'Gedl Pg Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343335211997819766)
,p_db_column_name=>'GEDL_PG_ID'
,p_display_order=>2740
,p_column_identifier=>'JP'
,p_column_label=>'Gedl Pg Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343340883836819772)
,p_db_column_name=>'GEDL_PLND_HR_UNIT'
,p_display_order=>3300
,p_column_identifier=>'LT'
,p_column_label=>'Gedl Plnd Hr Unit'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343340717170819771)
,p_db_column_name=>'GEDL_PLND_SCRAP_WEIGHT'
,p_display_order=>3290
,p_column_identifier=>'LS'
,p_column_label=>'Gedl Plnd Scrap Weight'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343333548089819749)
,p_db_column_name=>'GEDL_PLNT'
,p_display_order=>2570
,p_column_identifier=>'IY'
,p_column_label=>'Gedl Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343340974515819723)
,p_db_column_name=>'GEDL_PO_AMD_NO'
,p_display_order=>3310
,p_column_identifier=>'LU'
,p_column_label=>'Gedl Po Amd No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343332795683819741)
,p_db_column_name=>'GEDL_PO_NO'
,p_display_order=>2490
,p_column_identifier=>'IP'
,p_column_label=>'Gedl Po No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343332693810819740)
,p_db_column_name=>'GEDL_PO_PFX'
,p_display_order=>2480
,p_column_identifier=>'IO'
,p_column_label=>'Gedl Po Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343334428375819758)
,p_db_column_name=>'GEDL_PO_SEQ_NO'
,p_display_order=>2660
,p_column_identifier=>'JH'
,p_column_label=>'Gedl Po Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343334532596819759)
,p_db_column_name=>'GEDL_PO_SUB_SEQ_NO'
,p_display_order=>2670
,p_column_identifier=>'JI'
,p_column_label=>'Gedl Po Sub Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343346903239819733)
,p_db_column_name=>'GEDL_PROCESS_ID'
,p_display_order=>3920
,p_column_identifier=>'OC'
,p_column_label=>'Gedl Process Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343333502887819748)
,p_db_column_name=>'GEDL_PROD_DESC1'
,p_display_order=>2560
,p_column_identifier=>'IX'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343332219699819736)
,p_db_column_name=>'GEDL_PROD_ID'
,p_display_order=>2440
,p_column_identifier=>'IJ'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343333731813819751)
,p_db_column_name=>'GEDL_PROD_ORD_NO'
,p_display_order=>2590
,p_column_identifier=>'JA'
,p_column_label=>'Gedl Prod Ord No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343343815739819752)
,p_db_column_name=>'GEDL_PROD_OUTER_DIA'
,p_display_order=>3600
,p_column_identifier=>'MX'
,p_column_label=>'Gedl Prod Outer Dia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343332354575819737)
,p_db_column_name=>'GEDL_PROD_REV'
,p_display_order=>2450
,p_column_identifier=>'IK'
,p_column_label=>' Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343332426765819738)
,p_db_column_name=>'GEDL_PROD_UOM'
,p_display_order=>2460
,p_column_identifier=>'IL'
,p_column_label=>'Gedl Prod Uom'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343339897766819762)
,p_db_column_name=>'GEDL_PROJ_ID'
,p_display_order=>3200
,p_column_identifier=>'LJ'
,p_column_label=>'Gedl Proj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343337685663819740)
,p_db_column_name=>'GEDL_PR_NO'
,p_display_order=>2980
,p_column_identifier=>'KN'
,p_column_label=>'Gedl Pr No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343337588730819739)
,p_db_column_name=>'GEDL_PR_PFX'
,p_display_order=>2970
,p_column_identifier=>'KM'
,p_column_label=>'Gedl Pr Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343337763506819741)
,p_db_column_name=>'GEDL_PR_SEQ_NO'
,p_display_order=>2990
,p_column_identifier=>'KO'
,p_column_label=>'Gedl Pr Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343337884140819742)
,p_db_column_name=>'GEDL_PR_SUB_SEQ_NO'
,p_display_order=>3000
,p_column_identifier=>'KP'
,p_column_label=>'Gedl Pr Sub Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343346448277819728)
,p_db_column_name=>'GEDL_PUR_ACCT'
,p_display_order=>3860
,p_column_identifier=>'NX'
,p_column_label=>'Gedl Pur Acct'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343335303220819767)
,p_db_column_name=>'GEDL_QC_REQ'
,p_display_order=>2750
,p_column_identifier=>'JQ'
,p_column_label=>'Gedl Qc Req'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343332601957819739)
,p_db_column_name=>'GEDL_QTY'
,p_display_order=>2470
,p_column_identifier=>'IM'
,p_column_label=>'Process'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343340351582819767)
,p_db_column_name=>'GEDL_QTY_IN_NOS'
,p_display_order=>3250
,p_column_identifier=>'LO'
,p_column_label=>'Gedl Qty In Nos'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343332933401819743)
,p_db_column_name=>'GEDL_RCPT_NO'
,p_display_order=>2510
,p_column_identifier=>'IR'
,p_column_label=>'Gedl Rcpt No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343332863456819742)
,p_db_column_name=>'GEDL_RCPT_PFX'
,p_display_order=>2500
,p_column_identifier=>'IQ'
,p_column_label=>'Gedl Rcpt Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343343470754819748)
,p_db_column_name=>'GEDL_RCT_FOR'
,p_display_order=>3560
,p_column_identifier=>'MT'
,p_column_label=>'Gedl Rct For'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343341574404819729)
,p_db_column_name=>'GEDL_RES_ID'
,p_display_order=>3370
,p_column_identifier=>'MA'
,p_column_label=>'Gedl Res Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343341640817819730)
,p_db_column_name=>'GEDL_SCR_PCT'
,p_display_order=>3380
,p_column_identifier=>'MB'
,p_column_label=>'Gedl Scr Pct'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343333114658819745)
,p_db_column_name=>'GEDL_SEL_REC'
,p_display_order=>2530
,p_column_identifier=>'IU'
,p_column_label=>'Gedl Sel Rec'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343332023250819734)
,p_db_column_name=>'GEDL_SEQ_NO'
,p_display_order=>2420
,p_column_identifier=>'IH'
,p_column_label=>'Gedl Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343341174260819725)
,p_db_column_name=>'GEDL_SERV_IO_TYPE'
,p_display_order=>3330
,p_column_identifier=>'LW'
,p_column_label=>'Gedl Serv Io Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343341481315819728)
,p_db_column_name=>'GEDL_SERV_PROD_DESC'
,p_display_order=>3360
,p_column_identifier=>'LZ'
,p_column_label=>'Gedl Serv Prod Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343341035949819724)
,p_db_column_name=>'GEDL_SERV_PROD_ID'
,p_display_order=>3320
,p_column_identifier=>'LV'
,p_column_label=>'Gedl Serv Prod Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343340113867819765)
,p_db_column_name=>'GEDL_SER_NO'
,p_display_order=>3230
,p_column_identifier=>'LM'
,p_column_label=>'Gedl Ser No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343335068453819764)
,p_db_column_name=>'GEDL_SF_CODE'
,p_display_order=>2720
,p_column_identifier=>'JN'
,p_column_label=>'Gedl Sf Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343343577049819749)
,p_db_column_name=>'GEDL_SI_PRICE'
,p_display_order=>3570
,p_column_identifier=>'MU'
,p_column_label=>'Gedl Si Price'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343338678146819750)
,p_db_column_name=>'GEDL_SOU_BU'
,p_display_order=>3080
,p_column_identifier=>'KX'
,p_column_label=>'Gedl Sou Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343345473876819768)
,p_db_column_name=>'GEDL_SOU_DOC_NO'
,p_display_order=>3760
,p_column_identifier=>'NN'
,p_column_label=>'Gedl Sou Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343345307276819767)
,p_db_column_name=>'GEDL_SOU_DOC_PFX'
,p_display_order=>3750
,p_column_identifier=>'NM'
,p_column_label=>'Gedl Sou Doc Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343345577597819769)
,p_db_column_name=>'GEDL_SOU_DOC_SEQ_NO'
,p_display_order=>3770
,p_column_identifier=>'NO'
,p_column_label=>'Gedl Sou Doc Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343340538806819769)
,p_db_column_name=>'GEDL_SOU_MAT_WEIGHT'
,p_display_order=>3270
,p_column_identifier=>'LQ'
,p_column_label=>'Gedl Sou Mat Weight'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343338752178819751)
,p_db_column_name=>'GEDL_SOU_PLNT'
,p_display_order=>3090
,p_column_identifier=>'KY'
,p_column_label=>'Gedl Sou Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343339506847819759)
,p_db_column_name=>'GEDL_SO_NO'
,p_display_order=>3170
,p_column_identifier=>'LG'
,p_column_label=>'Gedl So No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343339424206819758)
,p_db_column_name=>'GEDL_SO_PFX'
,p_display_order=>3160
,p_column_identifier=>'LF'
,p_column_label=>'Gedl So Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343342072332819734)
,p_db_column_name=>'GEDL_SO_SCHLD_DESC'
,p_display_order=>3420
,p_column_identifier=>'MF'
,p_column_label=>'Gedl So Schld Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343339605728819760)
,p_db_column_name=>'GEDL_SO_SEQ_NO'
,p_display_order=>3180
,p_column_identifier=>'LH'
,p_column_label=>'Gedl So Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343339800889819761)
,p_db_column_name=>'GEDL_SO_SUB_SEQ_NO'
,p_display_order=>3190
,p_column_identifier=>'LI'
,p_column_label=>'Gedl So Sub Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343339323228819757)
,p_db_column_name=>'GEDL_SO_TYPE'
,p_display_order=>3150
,p_column_identifier=>'LE'
,p_column_label=>'Gedl So Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343333911233819753)
,p_db_column_name=>'GEDL_SS_DOC_NO'
,p_display_order=>2610
,p_column_identifier=>'JC'
,p_column_label=>'Gedl Ss Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343333828991819752)
,p_db_column_name=>'GEDL_SS_DOC_PFX'
,p_display_order=>2600
,p_column_identifier=>'JB'
,p_column_label=>'Gedl Ss Doc Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343334017463819754)
,p_db_column_name=>'GEDL_SS_SEQ_NO'
,p_display_order=>2620
,p_column_identifier=>'JD'
,p_column_label=>'Gedl Ss Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343335857980819772)
,p_db_column_name=>'GEDL_SS_SUB_SEQ_NO'
,p_display_order=>2800
,p_column_identifier=>'JV'
,p_column_label=>'Gedl Ss Sub Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343333341313819747)
,p_db_column_name=>'GEDL_STATUS'
,p_display_order=>2550
,p_column_identifier=>'IW'
,p_column_label=>'Gedl Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343342809759819742)
,p_db_column_name=>'GEDL_STK_QTY'
,p_display_order=>3500
,p_column_identifier=>'MN'
,p_column_label=>'Gedl Stk Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343338169636819745)
,p_db_column_name=>'GEDL_STORE_ID'
,p_display_order=>3030
,p_column_identifier=>'KS'
,p_column_label=>'W/H'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343343682806819750)
,p_db_column_name=>'GEDL_ST_INV_BU'
,p_display_order=>3580
,p_column_identifier=>'MV'
,p_column_label=>'Gedl St Inv Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343343199048819745)
,p_db_column_name=>'GEDL_ST_INV_NO'
,p_display_order=>3530
,p_column_identifier=>'MQ'
,p_column_label=>'Gedl St Inv No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343343010128819744)
,p_db_column_name=>'GEDL_ST_INV_PFX'
,p_display_order=>3520
,p_column_identifier=>'MP'
,p_column_label=>'Gedl St Inv Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343343744186819751)
,p_db_column_name=>'GEDL_ST_INV_PLNT'
,p_display_order=>3590
,p_column_identifier=>'MW'
,p_column_label=>'Gedl St Inv Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343343235890819746)
,p_db_column_name=>'GEDL_ST_INV_SEQ_NO'
,p_display_order=>3540
,p_column_identifier=>'MR'
,p_column_label=>'Gedl St Inv Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343332175309819735)
,p_db_column_name=>'GEDL_SUB_SEQ_NO'
,p_display_order=>2430
,p_column_identifier=>'II'
,p_column_label=>'Gedl Sub Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343342919819819743)
,p_db_column_name=>'GEDL_SUPLR_BILL_QTY'
,p_display_order=>3510
,p_column_identifier=>'MO'
,p_column_label=>'Gedl Suplr Bill Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343345785286819771)
,p_db_column_name=>'GEDL_SUPLR_BILL_UNIT_COST'
,p_display_order=>3790
,p_column_identifier=>'NQ'
,p_column_label=>'Gedl Suplr Bill Unit Cost'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343340217426819766)
,p_db_column_name=>'GEDL_SYS_LS_NO'
,p_display_order=>3240
,p_column_identifier=>'LN'
,p_column_label=>'Gedl Sys Ls No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343346086518819724)
,p_db_column_name=>'GEDL_TARE_WGHT'
,p_display_order=>3820
,p_column_identifier=>'NT'
,p_column_label=>'Gedl Tare Wght'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343340677888819770)
,p_db_column_name=>'GEDL_TAR_MAT_WEIGHT'
,p_display_order=>3280
,p_column_identifier=>'LR'
,p_column_label=>'Gedl Tar Mat Weight'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343339992231819763)
,p_db_column_name=>'GEDL_TASK_ID'
,p_display_order=>3210
,p_column_identifier=>'LK'
,p_column_label=>'Gedl Task Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343341807788819732)
,p_db_column_name=>'GEDL_TASK_OPRN_ID'
,p_display_order=>3400
,p_column_identifier=>'MD'
,p_column_label=>'Gedl Task Oprn Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343335529375819769)
,p_db_column_name=>'GEDL_TAX_SET_ID'
,p_display_order=>2770
,p_column_identifier=>'JS'
,p_column_label=>'Gedl Tax Set Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343338252837819746)
,p_db_column_name=>'GEDL_TCF_ID'
,p_display_order=>3040
,p_column_identifier=>'KT'
,p_column_label=>'Gedl Tcf Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343345662557819770)
,p_db_column_name=>'GEDL_TCS_SEC_ID'
,p_display_order=>3780
,p_column_identifier=>'NP'
,p_column_label=>'Gedl Tcs Sec Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343339056234819754)
,p_db_column_name=>'GEDL_THICKNESS'
,p_display_order=>3120
,p_column_identifier=>'LB'
,p_column_label=>'Gedl Thickness'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343342216412819736)
,p_db_column_name=>'GEDL_TRF_SEL_FLAG'
,p_display_order=>3440
,p_column_identifier=>'MH'
,p_column_label=>'Gedl Trf Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343342344921819737)
,p_db_column_name=>'GEDL_TRF_SEL_USER'
,p_display_order=>3450
,p_column_identifier=>'MI'
,p_column_label=>'Gedl Trf Sel User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343333274450819746)
,p_db_column_name=>'GEDL_UNIT_COST'
,p_display_order=>2540
,p_column_identifier=>'IV'
,p_column_label=>'Gedl Unit Cost'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343337909415819743)
,p_db_column_name=>'GEDL_UOM'
,p_display_order=>3010
,p_column_identifier=>'KQ'
,p_column_label=>'Gedl Uom'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343344420497819758)
,p_db_column_name=>'GEDL_UPD_BY'
,p_display_order=>3660
,p_column_identifier=>'ND'
,p_column_label=>'Gedl Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343344730768819761)
,p_db_column_name=>'GEDL_UPD_DATE'
,p_display_order=>3690
,p_column_identifier=>'NG'
,p_column_label=>'Gedl Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343345196154819765)
,p_db_column_name=>'GEDL_UPD_EMP_ID'
,p_display_order=>3730
,p_column_identifier=>'NK'
,p_column_label=>'Gedl Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343344522875819759)
,p_db_column_name=>'GEDL_UPD_IP_ADDR'
,p_display_order=>3670
,p_column_identifier=>'NE'
,p_column_label=>'Gedl Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343344675298819760)
,p_db_column_name=>'GEDL_UPD_OS_USER'
,p_display_order=>3680
,p_column_identifier=>'NF'
,p_column_label=>'Gedl Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343335647214819770)
,p_db_column_name=>'GEDL_UPD_TOLR_PCT'
,p_display_order=>2780
,p_column_identifier=>'JT'
,p_column_label=>'Gedl Upd Tolr Pct'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343335750373819771)
,p_db_column_name=>'GEDL_UPD_TOLR_QTY'
,p_display_order=>2790
,p_column_identifier=>'JU'
,p_column_label=>'Gedl Upd Tolr Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343334211019819756)
,p_db_column_name=>'GEDL_USER'
,p_display_order=>2640
,p_column_identifier=>'JF'
,p_column_label=>'Gedl User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343340486120819768)
,p_db_column_name=>'GEDL_VIS_INSP_FLAG'
,p_display_order=>3260
,p_column_identifier=>'LP'
,p_column_label=>'Gedl Vis Insp Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343339237429819756)
,p_db_column_name=>'GEDL_WIDTH'
,p_display_order=>3140
,p_column_identifier=>'LD'
,p_column_label=>'Gedl Width'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343341716081819731)
,p_db_column_name=>'GEDL_WORK_ORD_NO'
,p_display_order=>3390
,p_column_identifier=>'MC'
,p_column_label=>'Gedl Work Ord No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343324375885819657)
,p_db_column_name=>'GEHD_ACT'
,p_display_order=>1650
,p_column_identifier=>'FI'
,p_column_label=>'Gehd Act'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343311198654819625)
,p_db_column_name=>'GEHD_ACT_TARE_WEIGHT'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Gehd Act Tare Weight'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343177737414771665)
,p_db_column_name=>'GEHD_ACT_WEIGHT'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Gehd Act Weight'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343317139180819635)
,p_db_column_name=>'GEHD_ASN_NO'
,p_display_order=>930
,p_column_identifier=>'CO'
,p_column_label=>'Gehd Asn No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343323854356819652)
,p_db_column_name=>'GEHD_BAY_ID'
,p_display_order=>1600
,p_column_identifier=>'FD'
,p_column_label=>'Gehd Bay Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343324427391819658)
,p_db_column_name=>'GEHD_BAY_IN_TIME'
,p_display_order=>1660
,p_column_identifier=>'FJ'
,p_column_label=>'Gehd Bay In Time'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343324585042819659)
,p_db_column_name=>'GEHD_BAY_OUT_TIME'
,p_display_order=>1670
,p_column_identifier=>'FK'
,p_column_label=>'Gehd Bay Out Time'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343175674815771644)
,p_db_column_name=>'GEHD_BU'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Gehd Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343325262710819666)
,p_db_column_name=>'GEHD_CANCEL_REASON'
,p_display_order=>1740
,p_column_identifier=>'FR'
,p_column_label=>'Gehd Cancel Reason'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343320637293819670)
,p_db_column_name=>'GEHD_CASHIER_ID'
,p_display_order=>1280
,p_column_identifier=>'DX'
,p_column_label=>'Gehd Cashier Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343311057478819624)
,p_db_column_name=>'GEHD_CONTAINER_HEIGHT'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Gehd Container Height'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343178450900771672)
,p_db_column_name=>'GEHD_CONTAINER_LENGTH'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Gehd Container Length'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343178242888771670)
,p_db_column_name=>'GEHD_CONTAINER_MFG_DATE'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Gehd Container Mfg Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343178135737771669)
,p_db_column_name=>'GEHD_CONTAINER_NO'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Gehd Container No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343178308741771671)
,p_db_column_name=>'GEHD_CONTAINER_TYPE'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Gehd Container Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343310981713819623)
,p_db_column_name=>'GEHD_CONTAINER_WIDTH'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Gehd Container Width'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343315257006819666)
,p_db_column_name=>'GEHD_COURIER_DATE'
,p_display_order=>740
,p_column_identifier=>'BV'
,p_column_label=>'Gehd Courier Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343315167149819665)
,p_db_column_name=>'GEHD_COURIER_DOCKET_NO'
,p_display_order=>730
,p_column_identifier=>'BU'
,p_column_label=>'Gehd Courier Docket No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343317529253819639)
,p_db_column_name=>'GEHD_COURIER_ID'
,p_display_order=>970
,p_column_identifier=>'CS'
,p_column_label=>'Gehd Courier Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343315097991819664)
,p_db_column_name=>'GEHD_COURIER_NAME'
,p_display_order=>720
,p_column_identifier=>'BT'
,p_column_label=>'Gehd Courier Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343321420719819628)
,p_db_column_name=>'GEHD_CPV_DOC_NO'
,p_display_order=>1360
,p_column_identifier=>'EF'
,p_column_label=>'Gehd Cpv Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343321350058819627)
,p_db_column_name=>'GEHD_CPV_PREFIX'
,p_display_order=>1350
,p_column_identifier=>'EE'
,p_column_label=>'Gehd Cpv Prefix'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343326194770819725)
,p_db_column_name=>'GEHD_CP_DOC_NO'
,p_display_order=>1830
,p_column_identifier=>'GA'
,p_column_label=>'Gehd Cp Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343326225608819726)
,p_db_column_name=>'GEHD_CP_DOC_PFX'
,p_display_order=>1840
,p_column_identifier=>'GB'
,p_column_label=>'Gehd Cp Doc Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343326367525819727)
,p_db_column_name=>'GEHD_CP_SEL_FLAG'
,p_display_order=>1850
,p_column_identifier=>'GC'
,p_column_label=>'Gehd Cp Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343326464752819728)
,p_db_column_name=>'GEHD_CP_SEL_USER'
,p_display_order=>1860
,p_column_identifier=>'GD'
,p_column_label=>'Gehd Cp Sel User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343325401986819667)
,p_db_column_name=>'GEHD_CRE_BY'
,p_display_order=>1750
,p_column_identifier=>'FS'
,p_column_label=>'Gehd Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343325605367819670)
,p_db_column_name=>'GEHD_CRE_DATE'
,p_display_order=>1780
,p_column_identifier=>'FV'
,p_column_label=>'Gehd Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343326581149819729)
,p_db_column_name=>'GEHD_CRE_EMP_ID'
,p_display_order=>1870
,p_column_identifier=>'GE'
,p_column_label=>'Gehd Cre Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343325467331819668)
,p_db_column_name=>'GEHD_CRE_IP_ADDR'
,p_display_order=>1760
,p_column_identifier=>'FT'
,p_column_label=>'Gehd Cre Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343325583625819669)
,p_db_column_name=>'GEHD_CRE_OS_USER'
,p_display_order=>1770
,p_column_identifier=>'FU'
,p_column_label=>'Gehd Cre Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343327268021819736)
,p_db_column_name=>'GEHD_DAIRY_TYPE'
,p_display_order=>1940
,p_column_identifier=>'GL'
,p_column_label=>'Gehd Dairy Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343175880351771646)
,p_db_column_name=>'GEHD_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343312770786819641)
,p_db_column_name=>'GEHD_DC_DATE'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'Gehd Dc Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343312676015819640)
,p_db_column_name=>'GEHD_DC_NO'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'Gehd Dc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343321099733819624)
,p_db_column_name=>'GEHD_DC_REQ_FLAG'
,p_display_order=>1320
,p_column_identifier=>'EB'
,p_column_label=>'Gehd Dc Req Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343327702411819740)
,p_db_column_name=>'GEHD_DESP_PLN_DOC_NO'
,p_display_order=>1980
,p_column_identifier=>'GP'
,p_column_label=>'Gehd Desp Pln Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343175757656771645)
,p_db_column_name=>'GEHD_DOC_NO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Number'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343316047677819624)
,p_db_column_name=>'GEHD_DRIVER_MOB_NO'
,p_display_order=>820
,p_column_identifier=>'CD'
,p_column_label=>'Moblie No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343176389187771651)
,p_db_column_name=>'GEHD_DRIVER_NAME'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Driver Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343315429285819668)
,p_db_column_name=>'GEHD_DRIVE_LICENCE_NO'
,p_display_order=>760
,p_column_identifier=>'BX'
,p_column_label=>'Gehd Drive Licence No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343326824420819732)
,p_db_column_name=>'GEHD_DRY_FAT'
,p_display_order=>1900
,p_column_identifier=>'GH'
,p_column_label=>'Gehd Dry Fat'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343327058791819734)
,p_db_column_name=>'GEHD_DRY_FAT_KGS'
,p_display_order=>1920
,p_column_identifier=>'GJ'
,p_column_label=>'Gehd Dry Fat Kgs'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343327322069819737)
,p_db_column_name=>'GEHD_DRY_LR'
,p_display_order=>1950
,p_column_identifier=>'GM'
,p_column_label=>'Gehd Dry Lr'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343327706060819741)
,p_db_column_name=>'GEHD_DRY_SEAL_SER_NO'
,p_display_order=>1990
,p_column_identifier=>'GQ'
,p_column_label=>'Gehd Dry Seal Ser No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343326973595819733)
,p_db_column_name=>'GEHD_DRY_SNF'
,p_display_order=>1910
,p_column_identifier=>'GI'
,p_column_label=>'Gehd Dry Snf'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343327117782819735)
,p_db_column_name=>'GEHD_DRY_SNF_KGS'
,p_display_order=>1930
,p_column_identifier=>'GK'
,p_column_label=>'Gehd Dry Snf Kgs'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343327547383819739)
,p_db_column_name=>'GEHD_DRY_TRF_QTY_KGS'
,p_display_order=>1970
,p_column_identifier=>'GO'
,p_column_label=>'Gehd Dry Trf Qty Kgs'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343327440932819738)
,p_db_column_name=>'GEHD_DRY_TRF_QTY_LTR'
,p_display_order=>1960
,p_column_identifier=>'GN'
,p_column_label=>'Gehd Dry Trf Qty Ltr'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343177070718771658)
,p_db_column_name=>'GEHD_ENTRY_REF'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>' Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343177645534771664)
,p_db_column_name=>'GEHD_EST_GROSS_WEIGHT'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Gehd Est Gross Weight'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343318478297819648)
,p_db_column_name=>'GEHD_EWB_BILL_NO'
,p_display_order=>1060
,p_column_identifier=>'DB'
,p_column_label=>'Gehd Ewb Bill No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343318317898819647)
,p_db_column_name=>'GEHD_EWB_DIST_KM'
,p_display_order=>1050
,p_column_identifier=>'DA'
,p_column_label=>'Gehd Ewb Dist Km'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343318261180819646)
,p_db_column_name=>'GEHD_EWB_TRNSP_DOC_DATE'
,p_display_order=>1040
,p_column_identifier=>'CZ'
,p_column_label=>'Gehd Ewb Trnsp Doc Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343318007779819644)
,p_db_column_name=>'GEHD_EWB_TRNSP_ID'
,p_display_order=>1020
,p_column_identifier=>'CX'
,p_column_label=>'Gehd Ewb Trnsp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343317960884819643)
,p_db_column_name=>'GEHD_EWB_TRNSP_MODE'
,p_display_order=>1010
,p_column_identifier=>'CW'
,p_column_label=>'Gehd Ewb Trnsp Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343318143484819645)
,p_db_column_name=>'GEHD_EWB_TRNSP_NAME'
,p_display_order=>1030
,p_column_identifier=>'CY'
,p_column_label=>'Gehd Ewb Trnsp Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343315727994819671)
,p_db_column_name=>'GEHD_FC_EXP_DATE'
,p_display_order=>790
,p_column_identifier=>'CA'
,p_column_label=>'Gehd Fc Exp Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343316378819819627)
,p_db_column_name=>'GEHD_FRM_CITY'
,p_display_order=>850
,p_column_identifier=>'CG'
,p_column_label=>'Gehd Frm City'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343320527310819669)
,p_db_column_name=>'GEHD_FRT_PAID_AMT'
,p_display_order=>1270
,p_column_identifier=>'DW'
,p_column_label=>'Gehd Frt Paid Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343323284086819646)
,p_db_column_name=>'GEHD_FRT_SCOPE'
,p_display_order=>1540
,p_column_identifier=>'EX'
,p_column_label=>'Gehd Frt Scope'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343322654879819640)
,p_db_column_name=>'GEHD_FR_STORE_ID'
,p_display_order=>1480
,p_column_identifier=>'ER'
,p_column_label=>'Gehd Fr Store Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343176728770771655)
,p_db_column_name=>'GEHD_GATE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Gehd Gate'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343312873807819642)
,p_db_column_name=>'GEHD_GATE_NO'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'Gehd Gate No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343319445220819658)
,p_db_column_name=>'GEHD_GB_WEIGHT'
,p_display_order=>1160
,p_column_identifier=>'DL'
,p_column_label=>'Gehd Gb Weight'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343320448279819668)
,p_db_column_name=>'GEHD_GE_REF_DOC_NO'
,p_display_order=>1260
,p_column_identifier=>'DV'
,p_column_label=>'Gehd Ge Ref Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343176165023771649)
,p_db_column_name=>'GEHD_GK_ID'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Gate Keeper'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343317879581819642)
,p_db_column_name=>'GEHD_GRN_CRE_FLAG'
,p_display_order=>1000
,p_column_identifier=>'CV'
,p_column_label=>'Gehd Grn Cre Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343323347451819647)
,p_db_column_name=>'GEHD_GROSS_AMT'
,p_display_order=>1550
,p_column_identifier=>'EY'
,p_column_label=>'Gehd Gross Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343320103606819665)
,p_db_column_name=>'GEHD_GROSS_IN_TIME'
,p_display_order=>1230
,p_column_identifier=>'DS'
,p_column_label=>'Gehd Gross In Time'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343320054841819664)
,p_db_column_name=>'GEHD_GROSS_SHIFT_ID'
,p_display_order=>1220
,p_column_identifier=>'DR'
,p_column_label=>'Gehd Gross Shift Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343177484732771662)
,p_db_column_name=>'GEHD_GROSS_WEIGHT'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Gehd Gross Weight'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343318552094819649)
,p_db_column_name=>'GEHD_HDPE_BAGS'
,p_display_order=>1070
,p_column_identifier=>'DC'
,p_column_label=>'Gehd Hdpe Bags'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343325106927819665)
,p_db_column_name=>'GEHD_IMPORT_FLAG'
,p_display_order=>1730
,p_column_identifier=>'FQ'
,p_column_label=>'Gehd Import Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343315396246819667)
,p_db_column_name=>'GEHD_INDIR_MVMT_FLAG'
,p_display_order=>750
,p_column_identifier=>'BW'
,p_column_label=>'Gehd Indir Mvmt Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343315875204819672)
,p_db_column_name=>'GEHD_INSURANCE_NO'
,p_display_order=>800
,p_column_identifier=>'CB'
,p_column_label=>'Gehd Insurance No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343315905484819623)
,p_db_column_name=>'GEHD_INS_EXP_DATE'
,p_display_order=>810
,p_column_identifier=>'CC'
,p_column_label=>'Gehd Ins Exp Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343313220988819646)
,p_db_column_name=>'GEHD_INVOICE_DATE'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Gehd Invoice Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343313130771819645)
,p_db_column_name=>'GEHD_INVOICE_NO'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Gehd Invoice No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343177227385771660)
,p_db_column_name=>'GEHD_INWARD_SEL_FLAG'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Gehd Inward Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343319723450819661)
,p_db_column_name=>'GEHD_IN_TIME'
,p_display_order=>1190
,p_column_identifier=>'DO'
,p_column_label=>'Gehd In Time'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343320390254819667)
,p_db_column_name=>'GEHD_IO_STATUS'
,p_display_order=>1250
,p_column_identifier=>'DU'
,p_column_label=>'Gehd Io Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343323141587819645)
,p_db_column_name=>'GEHD_ITR_COMPL_FLAG'
,p_display_order=>1530
,p_column_identifier=>'EW'
,p_column_label=>'Gehd Itr Compl Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343317102624819634)
,p_db_column_name=>'GEHD_LAB_ORD_FLAG'
,p_display_order=>920
,p_column_identifier=>'CN'
,p_column_label=>'Gehd Lab Ord Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343317402290819637)
,p_db_column_name=>'GEHD_LC_FRT_AMT'
,p_display_order=>950
,p_column_identifier=>'CQ'
,p_column_label=>'Gehd Lc Frt Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343315701067819670)
,p_db_column_name=>'GEHD_LIC_EXP_DATE'
,p_display_order=>780
,p_column_identifier=>'BZ'
,p_column_label=>'Gehd Lic Exp Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343319154893819655)
,p_db_column_name=>'GEHD_LOAD_ACTVTY_ID'
,p_display_order=>1130
,p_column_identifier=>'DI'
,p_column_label=>'Gehd Load Actvty Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343314273970819656)
,p_db_column_name=>'GEHD_LOAD_INV_NO'
,p_display_order=>640
,p_column_identifier=>'BL'
,p_column_label=>'Gehd Load Inv No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343314144536819655)
,p_db_column_name=>'GEHD_LOAD_INV_PFX'
,p_display_order=>630
,p_column_identifier=>'BK'
,p_column_label=>'Gehd Load Inv Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343313988403819653)
,p_db_column_name=>'GEHD_LOAD_POINT'
,p_display_order=>610
,p_column_identifier=>'BI'
,p_column_label=>'Gehd Load Point'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343314532411819659)
,p_db_column_name=>'GEHD_LOAD_SEL_FLAG'
,p_display_order=>670
,p_column_identifier=>'BO'
,p_column_label=>'Gehd Load Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343313767244819651)
,p_db_column_name=>'GEHD_LOAD_START_TIME'
,p_display_order=>590
,p_column_identifier=>'BG'
,p_column_label=>'Gehd Load Start Time'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343313812638819652)
,p_db_column_name=>'GEHD_LOAD_STOP_TIME'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Gehd Load Stop Time'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343313531439819649)
,p_db_column_name=>'GEHD_LOAD_SUPPLIER'
,p_display_order=>570
,p_column_identifier=>'BE'
,p_column_label=>'Gehd Load Supplier'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343318803034819652)
,p_db_column_name=>'GEHD_LOAD_TEAM_ID'
,p_display_order=>1100
,p_column_identifier=>'DF'
,p_column_label=>'Gehd Load Team Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343312422560819638)
,p_db_column_name=>'GEHD_LR_NO'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Gehd Lr No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343176417649771652)
,p_db_column_name=>'GEHD_MODE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343320757152819671)
,p_db_column_name=>'GEHD_NO_BUNDLE'
,p_display_order=>1290
,p_column_identifier=>'DY'
,p_column_label=>'Gehd No Bundle'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343314081639819654)
,p_db_column_name=>'GEHD_NO_OF_BAGS'
,p_display_order=>620
,p_column_identifier=>'BJ'
,p_column_label=>'Gehd No Of Bags'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343323615059819650)
,p_db_column_name=>'GEHD_OTH_DED_AMT'
,p_display_order=>1580
,p_column_identifier=>'FB'
,p_column_label=>'Gehd Oth Ded Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343177327361771661)
,p_db_column_name=>'GEHD_OUTWARD_NO'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Gehd Outward No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343320269403819666)
,p_db_column_name=>'GEHD_OUTWARD_SHIFT_ID'
,p_display_order=>1240
,p_column_identifier=>'DT'
,p_column_label=>'Gehd Outward Shift Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343319993390819663)
,p_db_column_name=>'GEHD_OWNED_BY'
,p_display_order=>1210
,p_column_identifier=>'DQ'
,p_column_label=>'Gehd Owned By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343323751825819651)
,p_db_column_name=>'GEHD_PAN_HLDR_NAME'
,p_display_order=>1590
,p_column_identifier=>'FC'
,p_column_label=>'Gehd Pan Hldr Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343322948296819643)
,p_db_column_name=>'GEHD_PAN_NO'
,p_display_order=>1510
,p_column_identifier=>'EU'
,p_column_label=>'Gehd Pan No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343319554071819659)
,p_db_column_name=>'GEHD_PB_WEIGHT'
,p_display_order=>1170
,p_column_identifier=>'DM'
,p_column_label=>'Gehd Pb Weight'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343321127166819625)
,p_db_column_name=>'GEHD_PERMIT_EXP_DATE'
,p_display_order=>1330
,p_column_identifier=>'EC'
,p_column_label=>'Gehd Permit Exp Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343176684437771654)
,p_db_column_name=>'GEHD_PLNT'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Gehd Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343327901269819742)
,p_db_column_name=>'GEHD_PLNT_LOC_ID'
,p_display_order=>2000
,p_column_identifier=>'GR'
,p_column_label=>'Gehd Plnt Loc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343328001730819743)
,p_db_column_name=>'GEHD_PLNT_LOC_NAME'
,p_display_order=>2010
,p_column_identifier=>'GS'
,p_column_label=>'Gehd Plnt Loc Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343321265356819626)
,p_db_column_name=>'GEHD_POLL_EXP_DATE'
,p_display_order=>1340
,p_column_identifier=>'ED'
,p_column_label=>'Gehd Poll Exp Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343312152486819635)
,p_db_column_name=>'GEHD_PO_NO'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Gehd Po No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343312009974819634)
,p_db_column_name=>'GEHD_PO_PFX'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Gehd Po Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343313357714819647)
,p_db_column_name=>'GEHD_PO_SEQ_NO'
,p_display_order=>550
,p_column_identifier=>'BC'
,p_column_label=>'Gehd Po Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343313418054819648)
,p_db_column_name=>'GEHD_PO_SUB_SEQ_NO'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Gehd Po Sub Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343311921951819633)
,p_db_column_name=>'GEHD_PROD_DESC1'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Gehd Prod Desc1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343311518115819629)
,p_db_column_name=>'GEHD_PROD_ID'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Gehd Prod Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343311643387819630)
,p_db_column_name=>'GEHD_PROD_REV'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Gehd Prod Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343311758838819631)
,p_db_column_name=>'GEHD_PROD_UOM'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Gehd Prod Uom'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343322449632819638)
,p_db_column_name=>'GEHD_PUR_RTN_QTY'
,p_display_order=>1460
,p_column_identifier=>'EP'
,p_column_label=>'Gehd Pur Rtn Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343322386771819637)
,p_db_column_name=>'GEHD_PUR_RTN_TYPE'
,p_display_order=>1450
,p_column_identifier=>'EO'
,p_column_label=>'Gehd Pur Rtn Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343311836492819632)
,p_db_column_name=>'GEHD_QTY'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Gehd Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343312399538819637)
,p_db_column_name=>'GEHD_RCPT_NO'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Gehd Rcpt No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343312216344819636)
,p_db_column_name=>'GEHD_RCPT_PFX'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Gehd Rcpt Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343319306950819657)
,p_db_column_name=>'GEHD_RECVD_QTY'
,p_display_order=>1150
,p_column_identifier=>'DK'
,p_column_label=>'Gehd Recvd Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343177199321771659)
,p_db_column_name=>'GEHD_REF_UNIT'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Gehd Ref Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343321560978819629)
,p_db_column_name=>'GEHD_REPORT_TIME'
,p_display_order=>1370
,p_column_identifier=>'EG'
,p_column_label=>'Gehd Report Time'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343176513541771653)
,p_db_column_name=>'GEHD_RET_FLAG'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Gehd Ret Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343316877256819632)
,p_db_column_name=>'GEHD_ROAD_PERMIT_NO'
,p_display_order=>900
,p_column_identifier=>'CL'
,p_column_label=>'Gehd Road Permit No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343320850837819672)
,p_db_column_name=>'GEHD_RR_FLAG'
,p_display_order=>1300
,p_column_identifier=>'DZ'
,p_column_label=>'Gehd Rr Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343312568362819639)
,p_db_column_name=>'GEHD_RR_NO'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Gehd Rr No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343311450310819628)
,p_db_column_name=>'GEHD_RTN_DC_COMP_FLAG'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Gehd Rtn Dc Comp Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343314824832819662)
,p_db_column_name=>'GEHD_RTN_DOC_NO'
,p_display_order=>700
,p_column_identifier=>'BR'
,p_column_label=>'Gehd Rtn Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343316684035819630)
,p_db_column_name=>'GEHD_SEL_FLAG'
,p_display_order=>880
,p_column_identifier=>'CJ'
,p_column_label=>'Gehd Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343311387246819627)
,p_db_column_name=>'GEHD_SEL_RETN_DC_FLAG'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Gehd Sel Retn Dc Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343314790999819661)
,p_db_column_name=>'GEHD_SEL_RETN_DC_USER'
,p_display_order=>690
,p_column_identifier=>'BQ'
,p_column_label=>'Gehd Sel Retn Dc User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343316759588819631)
,p_db_column_name=>'GEHD_SEL_USER'
,p_display_order=>890
,p_column_identifier=>'CK'
,p_column_label=>'Gehd Sel User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343324008073819654)
,p_db_column_name=>'GEHD_SENDER_ADDR'
,p_display_order=>1620
,p_column_identifier=>'FF'
,p_column_label=>'Gehd Sender Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343324278351819656)
,p_db_column_name=>'GEHD_SENDER_DC_DATE'
,p_display_order=>1640
,p_column_identifier=>'FH'
,p_column_label=>'Gehd Sender Dc Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343324150169819655)
,p_db_column_name=>'GEHD_SENDER_DC_NO'
,p_display_order=>1630
,p_column_identifier=>'FG'
,p_column_label=>'Gehd Sender Dc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343323972986819653)
,p_db_column_name=>'GEHD_SENDER_NAME'
,p_display_order=>1610
,p_column_identifier=>'FE'
,p_column_label=>'Gehd Sender Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343318760821819651)
,p_db_column_name=>'GEHD_SHIFT_ID'
,p_display_order=>1090
,p_column_identifier=>'DE'
,p_column_label=>'Gehd Shift Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343323550956819649)
,p_db_column_name=>'GEHD_SHTG_DED_AMT'
,p_display_order=>1570
,p_column_identifier=>'FA'
,p_column_label=>'Gehd Shtg Ded Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343324807296819662)
,p_db_column_name=>'GEHD_SI_PRICE'
,p_display_order=>1700
,p_column_identifier=>'FN'
,p_column_label=>'Gehd Si Price'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343311290129819626)
,p_db_column_name=>'GEHD_SOURCE'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Gehd Source'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343175920702771647)
,p_db_column_name=>'GEHD_STATUS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Gehd Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343320911081819623)
,p_db_column_name=>'GEHD_STK_QTY'
,p_display_order=>1310
,p_column_identifier=>'EA'
,p_column_label=>'Gehd Stk Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343324913142819663)
,p_db_column_name=>'GEHD_ST_INV_BU'
,p_display_order=>1710
,p_column_identifier=>'FO'
,p_column_label=>'Gehd St Inv Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343322048666819634)
,p_db_column_name=>'GEHD_ST_INV_NO'
,p_display_order=>1420
,p_column_identifier=>'EL'
,p_column_label=>'Gehd St Inv No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343321995058819633)
,p_db_column_name=>'GEHD_ST_INV_PFX'
,p_display_order=>1410
,p_column_identifier=>'EK'
,p_column_label=>'Gehd St Inv Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343325056213819664)
,p_db_column_name=>'GEHD_ST_INV_PLNT'
,p_display_order=>1720
,p_column_identifier=>'FP'
,p_column_label=>'Gehd St Inv Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343322158600819635)
,p_db_column_name=>'GEHD_ST_INV_SEQ_NO'
,p_display_order=>1430
,p_column_identifier=>'EM'
,p_column_label=>'Gehd St Inv Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343322892723819642)
,p_db_column_name=>'GEHD_SUPLR_BAG_QTY'
,p_display_order=>1500
,p_column_identifier=>'ET'
,p_column_label=>'Gehd Suplr Bag Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343322512990819639)
,p_db_column_name=>'GEHD_SUPLR_BILL_AMT'
,p_display_order=>1470
,p_column_identifier=>'EQ'
,p_column_label=>'Gehd Suplr Bill Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343324692481819660)
,p_db_column_name=>'GEHD_SUPLR_DESC'
,p_display_order=>1680
,p_column_identifier=>'FL'
,p_column_label=>'Gehd Suplr Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343313082575819644)
,p_db_column_name=>'GEHD_SUPPIER_ID'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Gehd Suppier Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343319691227819660)
,p_db_column_name=>'GEHD_TARE_SHIFT_ID'
,p_display_order=>1180
,p_column_identifier=>'DN'
,p_column_label=>'Gehd Tare Shift Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343324758816819661)
,p_db_column_name=>'GEHD_TOKEN_NO'
,p_display_order=>1690
,p_column_identifier=>'FM'
,p_column_label=>'Gehd Token No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343316554822819629)
,p_db_column_name=>'GEHD_TOTAL_WEIGHT'
,p_display_order=>870
,p_column_identifier=>'CI'
,p_column_label=>'Gehd Total Weight'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343316403370819628)
,p_db_column_name=>'GEHD_TO_CITY'
,p_display_order=>860
,p_column_identifier=>'CH'
,p_column_label=>'Gehd To City'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343322775622819641)
,p_db_column_name=>'GEHD_TO_STORE_ID'
,p_display_order=>1490
,p_column_identifier=>'ES'
,p_column_label=>'Gehd To Store Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343312956438819643)
,p_db_column_name=>'GEHD_TRANS_ID'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'Gehd Trans Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343318641095819650)
,p_db_column_name=>'GEHD_TRANS_TYPE'
,p_display_order=>1080
,p_column_identifier=>'DD'
,p_column_label=>'Gehd Trans Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343319805338819662)
,p_db_column_name=>'GEHD_TRIP_PLN_NO'
,p_display_order=>1200
,p_column_identifier=>'DP'
,p_column_label=>'Gehd Trip Pln No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343315513830819669)
,p_db_column_name=>'GEHD_TRIP_SHEET_NO'
,p_display_order=>770
,p_column_identifier=>'BY'
,p_column_label=>'Gehd Trip Sheet No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343317707510819641)
,p_db_column_name=>'GEHD_TRIP_SHT_LINE'
,p_display_order=>990
,p_column_identifier=>'CU'
,p_column_label=>'Gehd Trip Sht Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343317628660819640)
,p_db_column_name=>'GEHD_TRIP_SHT_NO'
,p_display_order=>980
,p_column_identifier=>'CT'
,p_column_label=>'Gehd Trip Sht No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343177566799771663)
,p_db_column_name=>'GEHD_TRUCK_TARE_WEIGHT'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Gehd Truck Tare Weight'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343176015077771648)
,p_db_column_name=>'GEHD_TYPE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Gehd Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343323086480819644)
,p_db_column_name=>'GEHD_UNIT_COST'
,p_display_order=>1520
,p_column_identifier=>'EV'
,p_column_label=>'Gehd Unit Cost'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343323444661819648)
,p_db_column_name=>'GEHD_UNLDG_CHRGS'
,p_display_order=>1560
,p_column_identifier=>'EZ'
,p_column_label=>'Gehd Unldg Chrgs'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343317236587819636)
,p_db_column_name=>'GEHD_UNLDG_LOG_SHT_FLAG'
,p_display_order=>940
,p_column_identifier=>'CP'
,p_column_label=>'Gehd Unldg Log Sht Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343319228746819656)
,p_db_column_name=>'GEHD_UNLOAD_ACTVTY_ID'
,p_display_order=>1140
,p_column_identifier=>'DJ'
,p_column_label=>'Gehd Unload Actvty Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343321876042819632)
,p_db_column_name=>'GEHD_UNLOAD_DOC_NO'
,p_display_order=>1400
,p_column_identifier=>'EJ'
,p_column_label=>'Gehd Unload Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343178019190771668)
,p_db_column_name=>'GEHD_UNLOAD_GROUP'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Gehd Unload Group'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343314470507819658)
,p_db_column_name=>'GEHD_UNLOAD_INV_NO'
,p_display_order=>660
,p_column_identifier=>'BN'
,p_column_label=>'Gehd Unload Inv No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343314380498819657)
,p_db_column_name=>'GEHD_UNLOAD_INV_PFX'
,p_display_order=>650
,p_column_identifier=>'BM'
,p_column_label=>'Gehd Unload Inv Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343314663650819660)
,p_db_column_name=>'GEHD_UNLOAD_SEL_FLAG'
,p_display_order=>680
,p_column_identifier=>'BP'
,p_column_label=>'Gehd Unload Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343322266775819636)
,p_db_column_name=>'GEHD_UNLOAD_STATUS'
,p_display_order=>1440
,p_column_identifier=>'EN'
,p_column_label=>'Gehd Unload Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343177881570771666)
,p_db_column_name=>'GEHD_UNLOAD_STAT_TIME'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Gehd Unload Stat Time'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343177936607771667)
,p_db_column_name=>'GEHD_UNLOAD_STOP_TIME'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Gehd Unload Stop Time'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343313655491819650)
,p_db_column_name=>'GEHD_UNLOAD_SUPPLIER'
,p_display_order=>580
,p_column_identifier=>'BF'
,p_column_label=>'Gehd Unload Supplier'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343318912144819653)
,p_db_column_name=>'GEHD_UNLOAD_TEAM_ID'
,p_display_order=>1110
,p_column_identifier=>'DG'
,p_column_label=>'Gehd Unload Team Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343325728597819671)
,p_db_column_name=>'GEHD_UPD_BY'
,p_display_order=>1790
,p_column_identifier=>'FW'
,p_column_label=>'Gehd Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343326050280819724)
,p_db_column_name=>'GEHD_UPD_DATE'
,p_display_order=>1820
,p_column_identifier=>'FZ'
,p_column_label=>'Gehd Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343326648453819730)
,p_db_column_name=>'GEHD_UPD_EMP_ID'
,p_display_order=>1880
,p_column_identifier=>'GF'
,p_column_label=>'Gehd Upd Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343325896467819672)
,p_db_column_name=>'GEHD_UPD_IP_ADDR'
,p_display_order=>1800
,p_column_identifier=>'FX'
,p_column_label=>'Gehd Upd Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343325940986819723)
,p_db_column_name=>'GEHD_UPD_OS_USER'
,p_display_order=>1810
,p_column_identifier=>'FY'
,p_column_label=>'Gehd Upd Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343176808552771656)
,p_db_column_name=>'GEHD_VEHICLE_IN'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Vehicle In Time'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343176285990771650)
,p_db_column_name=>'GEHD_VEHICLE_NO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Vehicle No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343176964773771657)
,p_db_column_name=>'GEHD_VEHICLE_OUT'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Gehd Vehicle Out'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343319094112819654)
,p_db_column_name=>'GEHD_VEHICLE_TYPE'
,p_display_order=>1120
,p_column_identifier=>'DH'
,p_column_label=>'Gehd Vehicle Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343316922597819633)
,p_db_column_name=>'GEHD_VEH_REP_IN'
,p_display_order=>910
,p_column_identifier=>'CM'
,p_column_label=>'Gehd Veh Rep In'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343321617690819630)
,p_db_column_name=>'GEHD_VEH_RET_FLAG'
,p_display_order=>1380
,p_column_identifier=>'EH'
,p_column_label=>'Gehd Veh Ret Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343321744792819631)
,p_db_column_name=>'GEHD_VEH_RET_REASON'
,p_display_order=>1390
,p_column_identifier=>'EI'
,p_column_label=>'Gehd Veh Ret Reason'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343316263690819626)
,p_db_column_name=>'GEHD_VOU_NO'
,p_display_order=>840
,p_column_identifier=>'CF'
,p_column_label=>'Gehd Vou No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343316152528819625)
,p_db_column_name=>'GEHD_VOU_PFX'
,p_display_order=>830
,p_column_identifier=>'CE'
,p_column_label=>'Gehd Vou Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343314911255819663)
,p_db_column_name=>'GEHD_WAY_BILL_DATE'
,p_display_order=>710
,p_column_identifier=>'BS'
,p_column_label=>'Gehd Way Bill Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343317429408819638)
,p_db_column_name=>'GEHD_WB_SER_NO'
,p_display_order=>960
,p_column_identifier=>'CR'
,p_column_label=>'Gehd Wb Ser No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343326776113819731)
,p_db_column_name=>'GEHD_WGH_BDG_RQRD_FLAG'
,p_display_order=>1890
,p_column_identifier=>'GG'
,p_column_label=>'Gehd Wgh Bdg Rqrd Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343329535298819759)
,p_db_column_name=>'GELN_ACT_SUPLR_NAME'
,p_display_order=>2170
,p_column_identifier=>'HI'
,p_column_label=>'Geln Act Suplr Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343328018601819744)
,p_db_column_name=>'GELN_BU'
,p_display_order=>2020
,p_column_identifier=>'GT'
,p_column_label=>'Geln Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343330526316819769)
,p_db_column_name=>'GELN_CRE_BY'
,p_display_order=>2270
,p_column_identifier=>'HS'
,p_column_label=>'Geln Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343330807549819772)
,p_db_column_name=>'GELN_CRE_DATE'
,p_display_order=>2300
,p_column_identifier=>'HV'
,p_column_label=>'Geln Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343331385406819727)
,p_db_column_name=>'GELN_CRE_EMP_ID'
,p_display_order=>2350
,p_column_identifier=>'IA'
,p_column_label=>'Geln Cre Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343330689740819770)
,p_db_column_name=>'GELN_CRE_IP_ADDR'
,p_display_order=>2280
,p_column_identifier=>'HT'
,p_column_label=>'Geln Cre Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343330802765819771)
,p_db_column_name=>'GELN_CRE_OS_USER'
,p_display_order=>2290
,p_column_identifier=>'HU'
,p_column_label=>'Geln Cre Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343328715940819751)
,p_db_column_name=>'GELN_DC_DATE'
,p_display_order=>2090
,p_column_identifier=>'HA'
,p_column_label=>' DC Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343329054588819754)
,p_db_column_name=>'GELN_DC_FLAG'
,p_display_order=>2120
,p_column_identifier=>'HD'
,p_column_label=>'Geln Dc Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343329285425819756)
,p_db_column_name=>'GELN_DC_GE_NO'
,p_display_order=>2140
,p_column_identifier=>'HF'
,p_column_label=>'Geln Dc Ge No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343328685058819750)
,p_db_column_name=>'GELN_DC_NO'
,p_display_order=>2080
,p_column_identifier=>'GZ'
,p_column_label=>'Geln Dc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343329115270819755)
,p_db_column_name=>'GELN_DC_RTN_FLAG'
,p_display_order=>2130
,p_column_identifier=>'HE'
,p_column_label=>'Geln Dc Rtn Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343328200498819745)
,p_db_column_name=>'GELN_DOC_NO'
,p_display_order=>2030
,p_column_identifier=>'GU'
,p_column_label=>'Geln Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343329822874819762)
,p_db_column_name=>'GELN_FRM_CITY'
,p_display_order=>2200
,p_column_identifier=>'HL'
,p_column_label=>'Geln Frm City'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343328922495819753)
,p_db_column_name=>'GELN_INVOICE_DATE'
,p_display_order=>2110
,p_column_identifier=>'HC'
,p_column_label=>'Invoice Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343328806657819752)
,p_db_column_name=>'GELN_INVOICE_NO'
,p_display_order=>2100
,p_column_identifier=>'HB'
,p_column_label=>'Invoice No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343329648567819760)
,p_db_column_name=>'GELN_INV_WEIGHT'
,p_display_order=>2180
,p_column_identifier=>'HJ'
,p_column_label=>'Geln Inv Weight'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343329792123819761)
,p_db_column_name=>'GELN_INWARD_SEL_FLAG'
,p_display_order=>2190
,p_column_identifier=>'HK'
,p_column_label=>'Geln Inward Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343330472476819768)
,p_db_column_name=>'GELN_IO_TYPE'
,p_display_order=>2260
,p_column_identifier=>'HR'
,p_column_label=>'Geln Io Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343331765710819731)
,p_db_column_name=>'GELN_PARTY_TYPE'
,p_display_order=>2390
,p_column_identifier=>'IE'
,p_column_label=>'Geln Party Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343329386966819757)
,p_db_column_name=>'GELN_PLNT'
,p_display_order=>2150
,p_column_identifier=>'HG'
,p_column_label=>'Geln Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343329495656819758)
,p_db_column_name=>'GELN_REF'
,p_display_order=>2160
,p_column_identifier=>'HH'
,p_column_label=>'Geln Ref'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343330117164819765)
,p_db_column_name=>'GELN_SENDER_ADDR'
,p_display_order=>2230
,p_column_identifier=>'HO'
,p_column_label=>'Geln Sender Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343330358154819767)
,p_db_column_name=>'GELN_SENDER_DC_DATE'
,p_display_order=>2250
,p_column_identifier=>'HQ'
,p_column_label=>'Geln Sender Dc Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343330206633819766)
,p_db_column_name=>'GELN_SENDER_DC_NO'
,p_display_order=>2240
,p_column_identifier=>'HP'
,p_column_label=>'Geln Sender Dc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343330089673819764)
,p_db_column_name=>'GELN_SENDER_NAME'
,p_display_order=>2220
,p_column_identifier=>'HN'
,p_column_label=>'Geln Sender Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343328254264819746)
,p_db_column_name=>'GELN_SEQ_NO'
,p_display_order=>2040
,p_column_identifier=>'GV'
,p_column_label=>'Geln Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343328350900819747)
,p_db_column_name=>'GELN_STATUS'
,p_display_order=>2050
,p_column_identifier=>'GW'
,p_column_label=>'Geln Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343331619953819730)
,p_db_column_name=>'GELN_SUPLR_BILLFR_GST_NO'
,p_display_order=>2380
,p_column_identifier=>'ID'
,p_column_label=>'Geln Suplr Billfr Gst No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343328421722819748)
,p_db_column_name=>'GELN_SUPLR_ID'
,p_display_order=>2060
,p_column_identifier=>'GX'
,p_column_label=>'Supplier'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343328556222819749)
,p_db_column_name=>'GELN_SUPLR_NAME'
,p_display_order=>2070
,p_column_identifier=>'GY'
,p_column_label=>' Supplier Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343331555924819729)
,p_db_column_name=>'GELN_SUPLR_SHIPFR_GST_NO'
,p_display_order=>2370
,p_column_identifier=>'IC'
,p_column_label=>'Geln Suplr Shipfr Gst No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343329983401819763)
,p_db_column_name=>'GELN_TO_CITY'
,p_display_order=>2210
,p_column_identifier=>'HM'
,p_column_label=>'Geln To City'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343330932242819723)
,p_db_column_name=>'GELN_UPD_BY'
,p_display_order=>2310
,p_column_identifier=>'HW'
,p_column_label=>'Geln Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343331232013819726)
,p_db_column_name=>'GELN_UPD_DATE'
,p_display_order=>2340
,p_column_identifier=>'HZ'
,p_column_label=>'Geln Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343331468363819728)
,p_db_column_name=>'GELN_UPD_EMP_ID'
,p_display_order=>2360
,p_column_identifier=>'IB'
,p_column_label=>'Geln Upd Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343331074376819724)
,p_db_column_name=>'GELN_UPD_IP_ADDR'
,p_display_order=>2320
,p_column_identifier=>'HX'
,p_column_label=>'Geln Upd Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343331175387819725)
,p_db_column_name=>'GELN_UPD_OS_USER'
,p_display_order=>2330
,p_column_identifier=>'HY'
,p_column_label=>'Geln Upd Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10344235310808868030)
,p_db_column_name=>'PLANT_DESC'
,p_display_order=>3930
,p_column_identifier=>'OD'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343175583645771643)
,p_db_column_name=>'ROWID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343347335240819737)
,p_db_column_name=>'SELECT_FLAG'
,p_display_order=>3960
,p_column_identifier=>'OI'
,p_column_label=>'Select Flag'
,p_column_link=>'javascript:$s(''P9313117703_GEHD_PLNT'',''#GEHD_PLNT#''),$s(''P9313117703_GEHD_DOC_NO'',''#GEHD_DOC_NO#''),$s(''P9313117703_GEDL_SEQ_NO'',''#GEDL_SEQ_NO#''),$s(''P9313117703_GEDL_TRF_SEL_FLAG'',''#GEDL_TRF_SEL_FLAG#''),$s(''P9313117703_GEDL_SUB_SEQ_NO'',''#GEDL_SUB_SEQ'
||'_NO#'');apex.submit(''SEL_FLAG_GATE'');'
,p_column_linktext=>'#SELECT_FLAG#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10344235438396868031)
,p_db_column_name=>'STORE_DESC'
,p_display_order=>3940
,p_column_identifier=>'OE'
,p_column_label=>'W/H Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(10343470404882823561)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'23367144'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'GEDL_DC_NO:GEHD_DOC_NO:GEHD_DATE:GELN_SUPLR_NAME:GEDL_PROD_ID:GELN_SUPLR_ID:GEDL_STORE_ID:GEDL_PROD_REV:GEDL_QTY:GEDL_PROD_DESC1:PLANT_DESC:STORE_DESC:GEHD_ENTRY_REF:GEHD_MODE:GELN_DC_DATE:GEHD_GK_ID:EMPLOYEE_DES:GEHD_DRIVER_NAME:GEHD_DRIVER_MOB_NO:G'
||'EHD_VEHICLE_NO:GEHD_VEHICLE_IN:GELN_INVOICE_NO:GELN_INVOICE_DATE:_GATE:SELECT_FLAG'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10343175082671771638)
,p_plug_name=>'MRV(W/O Gate Entry)'
,p_static_id=>'mrv-w-o-gate-entry'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10340804343958103331)
,p_plug_name=>'MRV(W/O Gate Entry)'
,p_static_id=>'mrv-w-o-gate-entry-2'
,p_parent_plug_id=>wwv_flow_imp.id(10343175082671771638)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       DCHD_BU,',
'       DCHD_DOC_NO,',
'       DCHD_DATE,',
'       DCHD_SUPLR_ID,',
'		 (SELECT suplr_name1',
'          FROM suppliers',
'         WHERE suplr_bu = DCHD_BU',
'           AND suplr_suplr_id = DCHD_SUPLR_ID',
'           AND suplr_status = ''A'')SUPLR_DESC, ',
'		 (SELECT cmt_csr_no',
'          FROM csd_mtrl_trckg',
'         WHERE cmt_bu = DCHD_BU',
'           AND cmt_doc_no = dcln_source_doc_no )csr_doc_no,',
'	    (SELECT cmt_fvr_no',
'          FROM csd_mtrl_trckg',
'         WHERE cmt_bu = DCHD_BU',
'           AND cmt_doc_no = dcln_source_doc_no)fvr_doc_no,',
'		 (SELECT bup_name1',
'        FROM bus_unit_plants',
'       WHERE bup_bu = DCHD_BU AND bup_plant_id = DCHD_PLNT) plant_desc,          	  ',
'       DCHD_TYPE,',
'       DCHD_RETURN_FLAG,',
'       DCHD_REFERENCE,',
'       DCHD_STATUS,',
'       DCHD_SOURCE,',
'       DCHD_RTN_GE_NO,',
'       DCHD_EXP_DATE,',
'       DCHD_PLNT,',
'       DECODE (DCHD_OTHER_TYPE,''C'',''Customer'',''N'',''Not Applicable'',''W'',''Intra Transfer'',''I'',''Inter Transfer'',''B'',''Entity Transfer'',''P'',''Project'',''S'',''Supplier External'',''X'',''Supplier Internal'',''E'',''Employee'')DCHD_OTHER_TYPE,',
'       DCHD_APPROVED_BY,',
'       DCHD_APPROVED_POS,',
'       DCHD_APPROVED_DEPT,',
'       DCHD_INV_FLAG,',
'       DCHD_DEVLY_ON,',
'       DCHD_RECEIVED_BY,',
'       DCHD_JOB_TITLE,',
'       DCHD_TRANS_THR,',
'       DCHD_VEH_NO,',
'       DCHD_OUTWARD_FLAG,',
'       DCHD_OUTWARD_DOC_NO,',
'       DCHD_SEL_FLAG,',
'       DCHD_USER,',
'       DCHD_CONTR_NAME,',
'       DCHD_DESIGN,',
'       DCHD_MOBILE_NO,',
'       DCHD_LOAD_SUPLR_ID,',
'       DCHD_LOAD_INV_PFX,',
'       DCHD_LOAD_INV_NO,',
'       DCHD_LOAD_SEL_FLAG,',
'       DCHD_JJ_DOC_NO,',
'       DCHD_DC_NO,',
'       DCHD_CUST_LOC_ID,',
'       DCHD_SHIPTO_ADDR1,',
'       DCHD_SHIPTO_ADDR2,',
'       DCHD_SHIPTO_ADDR3,',
'       DCHD_SHIPTO_ADDR4,',
'       DCHD_SHIPTO_ADDR5,',
'       DCHD_SHIPTO_PO_BOX,',
'       DCHD_SHIPTO_CITY,',
'       DCHD_SHIPTO_STATE,',
'       DCHD_SHIPTO_COUNTRY,',
'       DCHD_SHIPTO_ZIP,',
'       DCHD_SHIPTO_TELE,',
'       DCHD_SHIPTO_MOB,',
'       DCHD_SHIPTO_FAX,',
'       DCHD_SHIPTO_EMAIL,',
'       DCHD_SHIPTO_WEBSITE,',
'       DCHD_DISPATCH_DATE,',
'       DCHD_ACK_RCVD_FLAG,',
'       DCHD_ACK_RCVD_ON,',
'       DCHD_REQUIRED_DATE,',
'       DCHD_SOURCE_FRM,',
'       DCHD_FRM_CITY,',
'       DCHD_TO_CITY,',
'       DCHD_TOT_WEIGHT,',
'       DCHD_TOT_CARR_RATE,',
'       DCHD_TOT_VALUE,',
'       DCHD_MULTI_RPT_FLAG,',
'       DCHD_OUTWARD_SEL_USER,',
'       DCHD_TAX_FLAG,',
'       DCHD_EWB_TRNSP_MODE,',
'       DCHD_EWB_TRNSP_ID,',
'       DCHD_EWB_TRNSP_NAME,',
'       DCHD_EWB_TRNSP_DOC_NO,',
'       DCHD_EWB_TRNSP_DOC_DATE,',
'       DCHD_EWB_DIST_KM,',
'       DCHD_EWB_BILL_NO,',
'       DCHD_BILLTO_LOC_ID,',
'       DCHD_BILLTO_ADDR1,',
'       DCHD_BILLTO_ADDR2,',
'       DCHD_BILLTO_ADDR3,',
'       DCHD_BILLTO_ADDR4,',
'       DCHD_BILLTO_ADDR5,',
'       DCHD_BILLTO_PO_BOX,',
'       DCHD_BILLTO_CITY,',
'       DCHD_BILLTO_STATE,',
'       DCHD_BILLTO_COUNTRY,',
'       DCHD_BILLTO_ZIP,',
'       DCHD_BILLTO_TELE,',
'       DCHD_BILLTO_MOB,',
'       DCHD_BILLTO_FAX,',
'       DCHD_BILLTO_EMAIL,',
'       DCHD_BILLTO_WEBSITE,',
'       DCHD_SHIPFR_LOC_ID,',
'       DCHD_BILLFR_LOC_ID,',
'       DCHD_TRIP_PLN_NO,',
'       DCHD_ITR_COMPL_FLAG,',
'       DCHD_INV_SEL_FLAG,',
'       DCHD_INV_SEL_USER,',
'       DCHD_CRE_BY,',
'       DCHD_CRE_IP_ADDR,',
'       DCHD_CRE_OS_USER,',
'       DCHD_CRE_DATE,',
'       DCHD_UPD_BY,',
'       DCHD_UPD_IP_ADDR,',
'       DCHD_UPD_OS_USER,',
'       DCHD_UPD_DATE,',
'       DCHD_AEN_TYPE,',
'       DCHD_EPC_INV_SEL_FLAG,',
'       DCHD_EPC_INV_SEL_USER,',
'       DCHD_CRE_EMP_ID,',
'       DCHD_UPD_EMP_ID,',
'       DCHD_EPC_DOC_NO,',
'       DCHD_DAIRY_TYPE,',
'       DCHD_DESP_PLN_NO,',
'       DCHD_DRY_SEAL_SER_NO,',
'       DCHD_PACK_NOTE_NO,',
'       DCHD_RQSTBY_ENTITY,',
'       DCHD_ASN_NO,',
'       DCHD_ASN_DATE,',
'       DCHD_CUST_GRN_NO,',
'       DCHD_CUST_GRN_DATE,',
'       DCHD_CUST_INV_NO,',
'       DCHD_CUST_INV_DATE,',
'       DCHD_SHIPTO_STATE_CODE,',
'       DCHD_BILLTO_STATE_CODE,',
'       DCHD_SHIPFR_ADDR1,',
'       DCHD_SHIPFR_ADDR2,',
'       DCHD_SHIPFR_ADDR3,',
'       DCHD_SHIPFR_PO_BOX,',
'       DCHD_SHIPFR_CITY,',
'       DCHD_SHIPFR_STATE,',
'       DCHD_SHIPFR_STATE_CODE,',
'       DCHD_SHIPFR_COUNTRY,',
'       DCHD_SHIPFR_ZIP,',
'       DCHD_SHIPFR_TELE,',
'       DCHD_SHIPFR_MOB,',
'       DCHD_SHIPFR_FAX,',
'       DCHD_SHIPFR_EMAIL,',
'       DCHD_SHIPFR_WEBSITE,',
'       DCHD_BILLFR_ADDR1,',
'       DCHD_BILLFR_ADDR2,',
'       DCHD_BILLFR_ADDR3,',
'       DCHD_BILLFR_PO_BOX,',
'       DCHD_BILLFR_CITY,',
'       DCHD_BILLFR_STATE,',
'       DCHD_BILLFR_STATE_CODE,',
'       DCHD_BILLFR_COUNTRY,',
'       DCHD_BILLFR_ZIP,',
'       DCHD_BILLFR_TELE,',
'       DCHD_BILLFR_MOB,',
'       DCHD_BILLFR_FAX,',
'       DCHD_BILLFR_EMAIL,',
'       DCHD_BILLFR_WEBSITE,',
'       DCHD_LO_RCPT_PFX,',
'       DCHD_LO_RCPT_NO,',
'       DCHD_LO_BU,',
'       DCHD_LO_PLNT,',
'       DCHD_LO_SEL_FLAG,',
'       DCHD_LO_SEL_USER,',
'       DCHD_INV_DOC_NO,',
'       DCHD_PLNT_LOC_ID,',
'       DCHD_PLNT_LOC_NAME,',
'       DCHD_SHIPTO_LOC_NAME,',
'       DCHD_BILLTO_LOC_NAME,',
'       DCHD_SHIPFR_LOC_NAME,',
'       DCHD_BILLFR_LOC_NAME,',
'       DCHD_SHIPTO_GST_NO,',
'       DCHD_BILLTO_GST_NO,',
'       DCHD_SHIPFR_GST_NO,',
'       DCHD_BILLFR_GST_NO,',
'       DCHD_VEH_CAP,',
'       DCHD_DRIV_NAME,',
'       DCHD_VEH_CAP_TONS,',
'       DCHD_TRANS_CHRG_AMT,',
'       DCHD_EWAY_JSON_FILE,',
'       DCHD_EWY_VALID,',
'       DCHD_EWY_STATUS,',
'       DCHD_EWY_STATUS_DESC,',
'       DCHD_EWY_HEADER,',
'       DCHD_EWY_JSON,',
'       DCHD_LLR_NO,',
'       DCHD_EWY_STATUS_CODE,',
'       DCHD_EWY_ERR_CODE,',
'       DCHD_EWY_POST_RESP,',
'       DCHD_EWB_BILL_DATE,',
'       DCHD_SUPLR_DC_NO,',
'       DCHD_SUPLR_DC_DATE,',
'       DCHD_EWY_CAN_STATUS_CODE,',
'       DCHD_EWY_CAN_STATUS,',
'       DCHD_EWY_CAN_STATUS_DESC,',
'       DCHD_EWY_CAN_RESP,',
'       DCHD_EWY_CAN_ERR_CODE,',
'       DCHD_EWB_CAN_DATE,',
'       DCHD_TRNSP_REQ_FLAG,',
'       DCHD_SESSION,',
'       DCHD_ROUTE_ID,',
'       DCHD_SP_ID,',
'       DCHD_ASM_ID,',
'       DCHD_SOU_PLNT,',
'       DCHD_INST_FLAG,',
'       DCHD_INS_DIS_CUST_ID,',
'       DCLN_BU,',
'       DCLN_DOC_NO,',
'       DCLN_SEQ_NO,',
'       DCLN_PROD_ID,',
'       DCLN_PROD_REV,',
'       DCLN_PROD_DESC1,',
'       DCLN_UOM,',
'       DCLN_QTY,',
'       DCLN_SC_UNIT_COST,',
'       DCLN_REFERENCE,',
'       DCLN_SEL_FLAG,',
'       DCLN_PROC_QTY,',
'       DCLN_IN_PROC_QTY,',
'       DCLN_RETURN_QTY,',
'       DCLN_PLNT,',
'       DCLN_PROCESS_ID,',
'       DCLN_PG_TYPE,',
'       DCLN_PG_ID,',
'       DCLN_SF_CODE,',
'       DCLN_PAR_PROD_ID,',
'       DCLN_PAR_PROD_REV,',
'       DCLN_PAR_PROD_DESC1,',
'       DCLN_SOURCE_DOC_PFX,',
'       DCLN_SOURCE_DOC_NO,',
'       DCLN_COMPLD_QTY,',
'       DCLN_MI_DOC_NO,',
'       DCLN_PROD_ORD_NO,',
'       DCLN_RTN_FLAG,',
'       DCLN_CONS_INPROC_QTY,',
'       DCLN_STORE_ID,',
'       DCLN_SEL_USER,',
'       DCLN_PROD_WEIGHT,',
'       DCLN_MI_SEQ_NO,',
'       DCLN_FRT_INPROC_QTY,',
'       DCLN_FRT_COMP_QTY,',
'       DCLN_FRT_SEL_FLAG,',
'       DCLN_FRT_SEL_USER,',
'       DCLN_SOURCE_SEQ_NO,',
'       DCLN_SOURCE_SUB_SEQ_NO,',
'       DCLN_FRT_PROCESS_QTY,',
'       DCLN_MAT_TYPE,',
'       DCLN_CMR_INT_USER,',
'       DCLN_CMR_INT_FLAG,',
'       DCLN_TRNSFR_BU,',
'       DCLN_TRNSFR_PLNT,',
'       DCLN_GE_CMR_TYPE,',
'       DCLN_GE_CMR_DOC_NO,',
'       DCLN_DMI_PRCS_QTY,',
'       DCLN_DMI_SEL_FLAG,',
'       DCLN_DMI_SEL_USER,',
'       DCLN_SERV_PROD_ID,',
'       DCLN_SERV_PROD_DESC,',
'       DCLN_RES_ID,',
'       DCLN_CARR_RATE,',
'       DCLN_CONV_FACTOR,',
'       DCLN_INST_ID,',
'       DCLN_TRF_SEL_FLAG,',
'       DCLN_TRF_SEL_USER,',
'       DCLN_HSN_CODE,',
'       DCLN_TAX_SET_ID,',
'       DCLN_NO_OF_BAGS,',
'       DCLN_RMA_PFX,',
'       DCLN_RMA_NO,',
'       DCLN_IMO_NO,',
'       DCLN_RTN_IMO_NO,',
'       DCLN_GE_DOC_NO,',
'       DCLN_INV_DOC_NO,',
'       DCLN_INV_SEQ_NO,',
'       DCLN_AEN_TYPE,',
'       DCLN_CRE_BY,',
'       DCLN_CRE_IP_ADDR,',
'       DCLN_CRE_OS_USER,',
'       DCLN_CRE_DATE,',
'       DCLN_UPD_BY,',
'       DCLN_UPD_IP_ADDR,',
'       DCLN_UPD_OS_USER,',
'       DCLN_UPD_DATE,',
'       DCLN_CRE_EMP_ID,',
'       DCLN_UPD_EMP_ID,',
'       DCLN_DRY_FAT,',
'       DCLN_DRY_SNF,',
'       DCLN_DRY_FAT_KGS,',
'       DCLN_DRY_SNF_KGS,',
'       DCLN_EPC_SEL_FLAG,',
'       DCLN_EPC_SEL_USER,',
'       DCLN_DRY_LR,',
'       DCLN_DRY_TRF_QTY_LTR,',
'       DCLN_DRY_TRF_QTY_KGS,',
'       DCLN_BOQ_REF_NO,',
'       DCLN_BOQ_SEQ_NO,',
'       DCLN_BOQ_SUB_SEQ_NO,',
'       DCLN_THICKNESS,',
'       DCLN_LENGTH,',
'       DCLN_WIDTH,',
'       DCLN_EPC_PROC_QTY,',
'       DCLN_EPC_INPROC_QTY,',
'       DCLN_EPC_INV_QTY,',
'       DCLN_WAR_START_DATE,',
'       DCLN_WAR_END_DATE,',
'       DCLN_INV_SEL_FLAG,',
'       DCLN_INV_SEL_USER,',
'       DCLN_CSR_TYPE,',
'       DCLN_HEIGHT,',
'       DCLN_OUTER_DIA,',
'       DCLN_INNER_DIA,',
'       DCLN_DENSITY,',
'       DCLN_OPRN_LN_SEQ_NO,',
'       DCLN_UNIT_WGHT,',
'       DCLN_ACT_WGHT,',
'       DCLN_ASN_QTY,',
'       DCLN_ASN_DOC_NO,',
'       DCLN_LOT_NO,',
'       DCLN_SER_NO,',
'       DCLN_SOURCE_ID,',
'       DCLN_SOURCE_TYPE,',
'       DCLN_SYS_LS_NO,',
'       DCLN_EXPIRY_DATE,',
'       DCLN_SELL_PRICE,',
'       DCLN_SHORT_QTY,',
'       DCLN_MOSTR_QTY,',
'       DCLN_REMARKS,',
'       DCLN_ACT_RCPT_QTY,',
'       DCLN_TRNSFR_PLNT_LOC_ID,',
'       DCLN_TRNSFR_PLNT_LOC_NAME,',
'       DCLN_SOU_OPRN_SEQ,',
'       DCLN_SOU_PROC_ID,',
'       DCLN_GR_WGHT,',
'       DCLN_TR_WGHT,',
'       DCLN_NT_WGHT,',
'       DCLN_TOT_BAGS,',
'       DCLN_CAL_RCPT_QTY,',
'       DCLN_CAL_MOSTR_QTY,',
'       DCLN_DRAWING_NO,',
'       DCLN_DRAWING_REV,',
'       DCLN_BASE_UOM_QTY,',
'       DCLN_RETAIL_UOM_QTY,',
'       DCLN_DMG_DISC_PCT,',
'       DCLN_OTH_DISC_PCT,',
'       DCLN_BASE_UOM,',
'       DCLN_RETAIL_UOM,',
'       DCLN_BASE_PRICE,',
'       DCLN_SAL_PRICE,',
'       DCLN_RETAIL_PRICE,',
'       DCLN_DRY_STK_QTY,',
'       DCLN_RET_CONV_FACTOR,',
'       DCLN_SAL_CONV_FACTOR,',
'       DCLN_PRICE_DOC_NO,',
'       DCLN_PRICE_DOC_REV,',
'       DCLN_PRICE_CHART_ID,',
'       DCLN_INST_FLAG,',
'       DCLN_INS_DIS_CUST_ID,',
'       DCLN_DAIRY_INV_DOC_NO,',
'       DCLN_DAIRY_INV_SEQ_NO,',
'       DCHD_TRANS_BU,',
'       DCHD_TRANS_PLNT,',
'       DCHD_TRANS_PLNT_LOC_ID,',
'		 (CASE WHEN dcln_trf_sel_flag = ''Y''	THEN',
'		  ''<span aria-hidden="true" class="fa fa-check-square" style = "color:blue;"></span>''',
'	     ELSE',
'		''<span aria-hidden="true" class="fa fa-square-o"  style = "color:black;"></span>''',
'       END )  select_flag,',
'			(CASE WHEN dcln_trf_sel_flag = ''N'' THEN ',
'				APEX_ITEM.HIDDEN(1,DCHD_PLNT||DCHD_DOC_NO||DCLN_SEQ_NO)||',
'				APEX_ITEM.TEXT(3,nvl((DCLN_QTY-(DCLN_COMPLD_QTY+DCLN_CONS_INPROC_QTY)),0),5,5,NULL,''<input type="text" style="text-align: right;/>'')  ',
'			ELSE ',
'				APEX_ITEM.HIDDEN(1,DCHD_PLNT||DCHD_DOC_NO||DCLN_SEQ_NO)||',
'				APEX_ITEM.TEXT(3,nvl(DCLN_PROC_QTY,0),5,5,NULL,''<input type="text" style="text-align: right;/>'')',
'			END ) "PROCESS_QTY"',
'  from MAT_TRF_PEND_DC_VIEW',
'  WHERE DCHD_BU =:GLOBAL_BU',
'AND EXISTS(',
'      	select 1',
'      	from appl_user_plant_access',
'      	where AUBA_BU = :global_bu  and',
'      	AUBA_USER_ID = :GLOBAL_user AND ',
'      	trunc(sysdate) between  AUBA_FROM and  AUBA_TO',
'          AND AUBA_PLANT = DCHD_PLNT)',
'    ORDER BY DCHD_CRE_DATE DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'NEVER'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'MRV(W/O Gate Entry)'
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
 p_id=>wwv_flow_imp.id(10340804436176103332)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>4858842600632492304
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343875200796547625)
,p_db_column_name=>'CSR_DOC_NO'
,p_display_order=>3590
,p_column_identifier=>'MU'
,p_column_label=>'CSR No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343144970896771537)
,p_db_column_name=>'DCHD_ACK_RCVD_FLAG'
,p_display_order=>560
,p_column_identifier=>'BC'
,p_column_label=>'Dchd Ack Rcvd Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343145071176771538)
,p_db_column_name=>'DCHD_ACK_RCVD_ON'
,p_display_order=>570
,p_column_identifier=>'BD'
,p_column_label=>'Dchd Ack Rcvd On'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343149938943771537)
,p_db_column_name=>'DCHD_AEN_TYPE'
,p_display_order=>1060
,p_column_identifier=>'DA'
,p_column_label=>'Dchd Aen Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340805957009103347)
,p_db_column_name=>'DCHD_APPROVED_BY'
,p_display_order=>160
,p_column_identifier=>'O'
,p_column_label=>'Dchd Approved By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340806170341103349)
,p_db_column_name=>'DCHD_APPROVED_DEPT'
,p_display_order=>180
,p_column_identifier=>'Q'
,p_column_label=>'Dchd Approved Dept'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340806018601103348)
,p_db_column_name=>'DCHD_APPROVED_POS'
,p_display_order=>170
,p_column_identifier=>'P'
,p_column_label=>'Dchd Approved Pos'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343159017327771528)
,p_db_column_name=>'DCHD_ASM_ID'
,p_display_order=>1970
,p_column_identifier=>'GN'
,p_column_label=>'Dchd Asm Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343151183852771549)
,p_db_column_name=>'DCHD_ASN_DATE'
,p_display_order=>1180
,p_column_identifier=>'DM'
,p_column_label=>'Dchd Asn Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343151033409771548)
,p_db_column_name=>'DCHD_ASN_NO'
,p_display_order=>1170
,p_column_identifier=>'DL'
,p_column_label=>'Dchd Asn No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343153203935771570)
,p_db_column_name=>'DCHD_BILLFR_ADDR1'
,p_display_order=>1390
,p_column_identifier=>'EH'
,p_column_label=>'Dchd Billfr Addr1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343153392500771571)
,p_db_column_name=>'DCHD_BILLFR_ADDR2'
,p_display_order=>1400
,p_column_identifier=>'EI'
,p_column_label=>'Dchd Billfr Addr2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343153488676771572)
,p_db_column_name=>'DCHD_BILLFR_ADDR3'
,p_display_order=>1410
,p_column_identifier=>'EJ'
,p_column_label=>'Dchd Billfr Addr3'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343153608762771524)
,p_db_column_name=>'DCHD_BILLFR_CITY'
,p_display_order=>1430
,p_column_identifier=>'EL'
,p_column_label=>'Dchd Billfr City'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343153947757771527)
,p_db_column_name=>'DCHD_BILLFR_COUNTRY'
,p_display_order=>1460
,p_column_identifier=>'EO'
,p_column_label=>'Dchd Billfr Country'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343154493987771532)
,p_db_column_name=>'DCHD_BILLFR_EMAIL'
,p_display_order=>1510
,p_column_identifier=>'ET'
,p_column_label=>'Dchd Billfr Email'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343154334374771531)
,p_db_column_name=>'DCHD_BILLFR_FAX'
,p_display_order=>1500
,p_column_identifier=>'ES'
,p_column_label=>'Dchd Billfr Fax'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343156237088771550)
,p_db_column_name=>'DCHD_BILLFR_GST_NO'
,p_display_order=>1690
,p_column_identifier=>'FL'
,p_column_label=>'Dchd Billfr Gst No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343148667514771524)
,p_db_column_name=>'DCHD_BILLFR_LOC_ID'
,p_display_order=>930
,p_column_identifier=>'CN'
,p_column_label=>'Dchd Billfr Loc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343155852994771546)
,p_db_column_name=>'DCHD_BILLFR_LOC_NAME'
,p_display_order=>1650
,p_column_identifier=>'FH'
,p_column_label=>'Dchd Billfr Loc Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343154233188771530)
,p_db_column_name=>'DCHD_BILLFR_MOB'
,p_display_order=>1490
,p_column_identifier=>'ER'
,p_column_label=>'Dchd Billfr Mob'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343153572338771523)
,p_db_column_name=>'DCHD_BILLFR_PO_BOX'
,p_display_order=>1420
,p_column_identifier=>'EK'
,p_column_label=>'Dchd Billfr Po Box'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343153776402771525)
,p_db_column_name=>'DCHD_BILLFR_STATE'
,p_display_order=>1440
,p_column_identifier=>'EM'
,p_column_label=>'Dchd Billfr State'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343153824177771526)
,p_db_column_name=>'DCHD_BILLFR_STATE_CODE'
,p_display_order=>1450
,p_column_identifier=>'EN'
,p_column_label=>'Dchd Billfr State Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343154122959771529)
,p_db_column_name=>'DCHD_BILLFR_TELE'
,p_display_order=>1480
,p_column_identifier=>'EQ'
,p_column_label=>'Dchd Billfr Tele'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343154546719771533)
,p_db_column_name=>'DCHD_BILLFR_WEBSITE'
,p_display_order=>1520
,p_column_identifier=>'EU'
,p_column_label=>'Dchd Billfr Website'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343154089376771528)
,p_db_column_name=>'DCHD_BILLFR_ZIP'
,p_display_order=>1470
,p_column_identifier=>'EP'
,p_column_label=>'Dchd Billfr Zip'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343147094925771558)
,p_db_column_name=>'DCHD_BILLTO_ADDR1'
,p_display_order=>770
,p_column_identifier=>'BX'
,p_column_label=>'Dchd Billto Addr1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343147132080771559)
,p_db_column_name=>'DCHD_BILLTO_ADDR2'
,p_display_order=>780
,p_column_identifier=>'BY'
,p_column_label=>'Dchd Billto Addr2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343147284846771560)
,p_db_column_name=>'DCHD_BILLTO_ADDR3'
,p_display_order=>790
,p_column_identifier=>'BZ'
,p_column_label=>'Dchd Billto Addr3'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343147380678771561)
,p_db_column_name=>'DCHD_BILLTO_ADDR4'
,p_display_order=>800
,p_column_identifier=>'CA'
,p_column_label=>'Dchd Billto Addr4'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343147469378771562)
,p_db_column_name=>'DCHD_BILLTO_ADDR5'
,p_display_order=>810
,p_column_identifier=>'CB'
,p_column_label=>'Dchd Billto Addr5'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343147689573771564)
,p_db_column_name=>'DCHD_BILLTO_CITY'
,p_display_order=>830
,p_column_identifier=>'CD'
,p_column_label=>'Dchd Billto City'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343147847878771566)
,p_db_column_name=>'DCHD_BILLTO_COUNTRY'
,p_display_order=>850
,p_column_identifier=>'CF'
,p_column_label=>'Dchd Billto Country'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343148330395771571)
,p_db_column_name=>'DCHD_BILLTO_EMAIL'
,p_display_order=>900
,p_column_identifier=>'CK'
,p_column_label=>'Dchd Billto Email'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343148224832771570)
,p_db_column_name=>'DCHD_BILLTO_FAX'
,p_display_order=>890
,p_column_identifier=>'CJ'
,p_column_label=>'Dchd Billto Fax'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343156029724771548)
,p_db_column_name=>'DCHD_BILLTO_GST_NO'
,p_display_order=>1670
,p_column_identifier=>'FJ'
,p_column_label=>'Dchd Billto Gst No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343146984460771557)
,p_db_column_name=>'DCHD_BILLTO_LOC_ID'
,p_display_order=>760
,p_column_identifier=>'BW'
,p_column_label=>'Dchd Billto Loc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343155633033771544)
,p_db_column_name=>'DCHD_BILLTO_LOC_NAME'
,p_display_order=>1630
,p_column_identifier=>'FF'
,p_column_label=>'Dchd Billto Loc Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343148152603771569)
,p_db_column_name=>'DCHD_BILLTO_MOB'
,p_display_order=>880
,p_column_identifier=>'CI'
,p_column_label=>'Dchd Billto Mob'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343147566773771563)
,p_db_column_name=>'DCHD_BILLTO_PO_BOX'
,p_display_order=>820
,p_column_identifier=>'CC'
,p_column_label=>'Dchd Billto Po Box'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343147786088771565)
,p_db_column_name=>'DCHD_BILLTO_STATE'
,p_display_order=>840
,p_column_identifier=>'CE'
,p_column_label=>'Dchd Billto State'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343151747847771555)
,p_db_column_name=>'DCHD_BILLTO_STATE_CODE'
,p_display_order=>1240
,p_column_identifier=>'DS'
,p_column_label=>'Dchd Billto State Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343148036910771568)
,p_db_column_name=>'DCHD_BILLTO_TELE'
,p_display_order=>870
,p_column_identifier=>'CH'
,p_column_label=>'Dchd Billto Tele'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343148414892771572)
,p_db_column_name=>'DCHD_BILLTO_WEBSITE'
,p_display_order=>910
,p_column_identifier=>'CL'
,p_column_label=>'Dchd Billto Website'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343147924719771567)
,p_db_column_name=>'DCHD_BILLTO_ZIP'
,p_display_order=>860
,p_column_identifier=>'CG'
,p_column_label=>'Dchd Billto Zip'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340804657420103334)
,p_db_column_name=>'DCHD_BU'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Dchd Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340807334288103361)
,p_db_column_name=>'DCHD_CONTR_NAME'
,p_display_order=>300
,p_column_identifier=>'AC'
,p_column_label=>'Dchd Contr Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343149179766771529)
,p_db_column_name=>'DCHD_CRE_BY'
,p_display_order=>980
,p_column_identifier=>'CS'
,p_column_label=>'Dchd Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343149469339771532)
,p_db_column_name=>'DCHD_CRE_DATE'
,p_display_order=>1010
,p_column_identifier=>'CV'
,p_column_label=>'Dchd Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343150204642771540)
,p_db_column_name=>'DCHD_CRE_EMP_ID'
,p_display_order=>1090
,p_column_identifier=>'DD'
,p_column_label=>'Dchd Cre Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343149270886771530)
,p_db_column_name=>'DCHD_CRE_IP_ADDR'
,p_display_order=>990
,p_column_identifier=>'CT'
,p_column_label=>'Dchd Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343149349451771531)
,p_db_column_name=>'DCHD_CRE_OS_USER'
,p_display_order=>1000
,p_column_identifier=>'CU'
,p_column_label=>'Dchd Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343151349127771551)
,p_db_column_name=>'DCHD_CUST_GRN_DATE'
,p_display_order=>1200
,p_column_identifier=>'DO'
,p_column_label=>'Dchd Cust Grn Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343151215869771550)
,p_db_column_name=>'DCHD_CUST_GRN_NO'
,p_display_order=>1190
,p_column_identifier=>'DN'
,p_column_label=>'Dchd Cust Grn No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343151578623771553)
,p_db_column_name=>'DCHD_CUST_INV_DATE'
,p_display_order=>1220
,p_column_identifier=>'DQ'
,p_column_label=>'Dchd Cust Inv Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343151480783771552)
,p_db_column_name=>'DCHD_CUST_INV_NO'
,p_display_order=>1210
,p_column_identifier=>'DP'
,p_column_label=>'Dchd Cust Inv No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340808241742103370)
,p_db_column_name=>'DCHD_CUST_LOC_ID'
,p_display_order=>390
,p_column_identifier=>'AL'
,p_column_label=>'Dchd Cust Loc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343150558080771543)
,p_db_column_name=>'DCHD_DAIRY_TYPE'
,p_display_order=>1120
,p_column_identifier=>'DG'
,p_column_label=>'Dchd Dairy Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340804843021103336)
,p_db_column_name=>'DCHD_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>' Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340808142344103369)
,p_db_column_name=>'DCHD_DC_NO'
,p_display_order=>380
,p_column_identifier=>'AK'
,p_column_label=>'Dc No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340807409267103362)
,p_db_column_name=>'DCHD_DESIGN'
,p_display_order=>310
,p_column_identifier=>'AD'
,p_column_label=>'Dchd Design'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343150701996771544)
,p_db_column_name=>'DCHD_DESP_PLN_NO'
,p_display_order=>1130
,p_column_identifier=>'DH'
,p_column_label=>'Dchd Desp Pln No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340806320147103351)
,p_db_column_name=>'DCHD_DEVLY_ON'
,p_display_order=>200
,p_column_identifier=>'S'
,p_column_label=>'Dchd Devly On'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343144871418771536)
,p_db_column_name=>'DCHD_DISPATCH_DATE'
,p_display_order=>550
,p_column_identifier=>'BB'
,p_column_label=>'Dchd Dispatch Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340804731385103335)
,p_db_column_name=>'DCHD_DOC_NO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'DC Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343156470253771552)
,p_db_column_name=>'DCHD_DRIV_NAME'
,p_display_order=>1710
,p_column_identifier=>'FN'
,p_column_label=>'Dchd Driv Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343150724261771545)
,p_db_column_name=>'DCHD_DRY_SEAL_SER_NO'
,p_display_order=>1140
,p_column_identifier=>'DI'
,p_column_label=>'Dchd Dry Seal Ser No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343150482130771542)
,p_db_column_name=>'DCHD_EPC_DOC_NO'
,p_display_order=>1110
,p_column_identifier=>'DF'
,p_column_label=>'Dchd Epc Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343150087566771538)
,p_db_column_name=>'DCHD_EPC_INV_SEL_FLAG'
,p_display_order=>1070
,p_column_identifier=>'DB'
,p_column_label=>'Dchd Epc Inv Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343150155749771539)
,p_db_column_name=>'DCHD_EPC_INV_SEL_USER'
,p_display_order=>1080
,p_column_identifier=>'DC'
,p_column_label=>'Dchd Epc Inv Sel User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343156792940771555)
,p_db_column_name=>'DCHD_EWAY_JSON_FILE'
,p_display_order=>1740
,p_column_identifier=>'FQ'
,p_column_label=>'Dchd Eway Json File'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343157769295771565)
,p_db_column_name=>'DCHD_EWB_BILL_DATE'
,p_display_order=>1840
,p_column_identifier=>'GA'
,p_column_label=>'Dchd Ewb Bill Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343146863011771556)
,p_db_column_name=>'DCHD_EWB_BILL_NO'
,p_display_order=>750
,p_column_identifier=>'BV'
,p_column_label=>'Dchd Ewb Bill No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343158533663771523)
,p_db_column_name=>'DCHD_EWB_CAN_DATE'
,p_display_order=>1920
,p_column_identifier=>'GI'
,p_column_label=>'Dchd Ewb Can Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343146705824771555)
,p_db_column_name=>'DCHD_EWB_DIST_KM'
,p_display_order=>740
,p_column_identifier=>'BU'
,p_column_label=>'Dchd Ewb Dist Km'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343146668455771554)
,p_db_column_name=>'DCHD_EWB_TRNSP_DOC_DATE'
,p_display_order=>730
,p_column_identifier=>'BT'
,p_column_label=>'Dchd Ewb Trnsp Doc Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343146600475771553)
,p_db_column_name=>'DCHD_EWB_TRNSP_DOC_NO'
,p_display_order=>720
,p_column_identifier=>'BS'
,p_column_label=>'Dchd Ewb Trnsp Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343146312332771551)
,p_db_column_name=>'DCHD_EWB_TRNSP_ID'
,p_display_order=>700
,p_column_identifier=>'BQ'
,p_column_label=>'Dchd Ewb Trnsp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343146282781771550)
,p_db_column_name=>'DCHD_EWB_TRNSP_MODE'
,p_display_order=>690
,p_column_identifier=>'BP'
,p_column_label=>'Dchd Ewb Trnsp Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343146481345771552)
,p_db_column_name=>'DCHD_EWB_TRNSP_NAME'
,p_display_order=>710
,p_column_identifier=>'BR'
,p_column_label=>'Dchd Ewb Trnsp Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343158491014771572)
,p_db_column_name=>'DCHD_EWY_CAN_ERR_CODE'
,p_display_order=>1910
,p_column_identifier=>'GH'
,p_column_label=>'Dchd Ewy Can Err Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343158303392771571)
,p_db_column_name=>'DCHD_EWY_CAN_RESP'
,p_display_order=>1900
,p_column_identifier=>'GG'
,p_column_label=>'Dchd Ewy Can Resp'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343158186009771569)
,p_db_column_name=>'DCHD_EWY_CAN_STATUS'
,p_display_order=>1880
,p_column_identifier=>'GE'
,p_column_label=>'Dchd Ewy Can Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343158069548771568)
,p_db_column_name=>'DCHD_EWY_CAN_STATUS_CODE'
,p_display_order=>1870
,p_column_identifier=>'GD'
,p_column_label=>'Dchd Ewy Can Status Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343158218160771570)
,p_db_column_name=>'DCHD_EWY_CAN_STATUS_DESC'
,p_display_order=>1890
,p_column_identifier=>'GF'
,p_column_label=>'Dchd Ewy Can Status Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343157567695771563)
,p_db_column_name=>'DCHD_EWY_ERR_CODE'
,p_display_order=>1820
,p_column_identifier=>'FY'
,p_column_label=>'Dchd Ewy Err Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343157176545771559)
,p_db_column_name=>'DCHD_EWY_HEADER'
,p_display_order=>1780
,p_column_identifier=>'FU'
,p_column_label=>'Dchd Ewy Header'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343157219756771560)
,p_db_column_name=>'DCHD_EWY_JSON'
,p_display_order=>1790
,p_column_identifier=>'FV'
,p_column_label=>'Dchd Ewy Json'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343157617012771564)
,p_db_column_name=>'DCHD_EWY_POST_RESP'
,p_display_order=>1830
,p_column_identifier=>'FZ'
,p_column_label=>'Dchd Ewy Post Resp'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343156912741771557)
,p_db_column_name=>'DCHD_EWY_STATUS'
,p_display_order=>1760
,p_column_identifier=>'FS'
,p_column_label=>'Dchd Ewy Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343157473212771562)
,p_db_column_name=>'DCHD_EWY_STATUS_CODE'
,p_display_order=>1810
,p_column_identifier=>'FX'
,p_column_label=>'Dchd Ewy Status Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343157095537771558)
,p_db_column_name=>'DCHD_EWY_STATUS_DESC'
,p_display_order=>1770
,p_column_identifier=>'FT'
,p_column_label=>'Dchd Ewy Status Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343156806071771556)
,p_db_column_name=>'DCHD_EWY_VALID'
,p_display_order=>1750
,p_column_identifier=>'FR'
,p_column_label=>'Dchd Ewy Valid'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340805652466103344)
,p_db_column_name=>'DCHD_EXP_DATE'
,p_display_order=>150
,p_column_identifier=>'L'
,p_column_label=>'Dchd Exp Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343145494681771542)
,p_db_column_name=>'DCHD_FRM_CITY'
,p_display_order=>610
,p_column_identifier=>'BH'
,p_column_label=>'Dchd Frm City'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343159224760771530)
,p_db_column_name=>'DCHD_INST_FLAG'
,p_display_order=>1990
,p_column_identifier=>'GP'
,p_column_label=>'Dchd Inst Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343159329764771531)
,p_db_column_name=>'DCHD_INS_DIS_CUST_ID'
,p_display_order=>2000
,p_column_identifier=>'GQ'
,p_column_label=>'Dchd Ins Dis Cust Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343155276557771540)
,p_db_column_name=>'DCHD_INV_DOC_NO'
,p_display_order=>1590
,p_column_identifier=>'FB'
,p_column_label=>'Dchd Inv Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340806265113103350)
,p_db_column_name=>'DCHD_INV_FLAG'
,p_display_order=>190
,p_column_identifier=>'R'
,p_column_label=>'Dchd Inv Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343148945091771527)
,p_db_column_name=>'DCHD_INV_SEL_FLAG'
,p_display_order=>960
,p_column_identifier=>'CQ'
,p_column_label=>'Dchd Inv Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343149086909771528)
,p_db_column_name=>'DCHD_INV_SEL_USER'
,p_display_order=>970
,p_column_identifier=>'CR'
,p_column_label=>'Dchd Inv Sel User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343148804898771526)
,p_db_column_name=>'DCHD_ITR_COMPL_FLAG'
,p_display_order=>950
,p_column_identifier=>'CP'
,p_column_label=>'Dchd Itr Compl Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340808013973103368)
,p_db_column_name=>'DCHD_JJ_DOC_NO'
,p_display_order=>370
,p_column_identifier=>'AJ'
,p_column_label=>'Dchd Jj Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340806535023103353)
,p_db_column_name=>'DCHD_JOB_TITLE'
,p_display_order=>220
,p_column_identifier=>'U'
,p_column_label=>'Dchd Job Title'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343157312127771561)
,p_db_column_name=>'DCHD_LLR_NO'
,p_display_order=>1800
,p_column_identifier=>'FW'
,p_column_label=>'Dchd Llr No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340807898023103366)
,p_db_column_name=>'DCHD_LOAD_INV_NO'
,p_display_order=>350
,p_column_identifier=>'AH'
,p_column_label=>'Dchd Load Inv No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340807781817103365)
,p_db_column_name=>'DCHD_LOAD_INV_PFX'
,p_display_order=>340
,p_column_identifier=>'AG'
,p_column_label=>'Dchd Load Inv Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340807998142103367)
,p_db_column_name=>'DCHD_LOAD_SEL_FLAG'
,p_display_order=>360
,p_column_identifier=>'AI'
,p_column_label=>'Dchd Load Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340807626876103364)
,p_db_column_name=>'DCHD_LOAD_SUPLR_ID'
,p_display_order=>330
,p_column_identifier=>'AF'
,p_column_label=>'Dchd Load Suplr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343154820633771536)
,p_db_column_name=>'DCHD_LO_BU'
,p_display_order=>1550
,p_column_identifier=>'EX'
,p_column_label=>'Dchd Lo Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343154956193771537)
,p_db_column_name=>'DCHD_LO_PLNT'
,p_display_order=>1560
,p_column_identifier=>'EY'
,p_column_label=>'Dchd Lo Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343154777277771535)
,p_db_column_name=>'DCHD_LO_RCPT_NO'
,p_display_order=>1540
,p_column_identifier=>'EW'
,p_column_label=>'Dchd Lo Rcpt No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343154657524771534)
,p_db_column_name=>'DCHD_LO_RCPT_PFX'
,p_display_order=>1530
,p_column_identifier=>'EV'
,p_column_label=>'Dchd Lo Rcpt Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343155019843771538)
,p_db_column_name=>'DCHD_LO_SEL_FLAG'
,p_display_order=>1570
,p_column_identifier=>'EZ'
,p_column_label=>'Dchd Lo Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343155138500771539)
,p_db_column_name=>'DCHD_LO_SEL_USER'
,p_display_order=>1580
,p_column_identifier=>'FA'
,p_column_label=>'Dchd Lo Sel User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340807519674103363)
,p_db_column_name=>'DCHD_MOBILE_NO'
,p_display_order=>320
,p_column_identifier=>'AE'
,p_column_label=>'Dchd Mobile No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343145959873771547)
,p_db_column_name=>'DCHD_MULTI_RPT_FLAG'
,p_display_order=>660
,p_column_identifier=>'BM'
,p_column_label=>'Dchd Multi Rpt Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340805902447103346)
,p_db_column_name=>'DCHD_OTHER_TYPE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340807034325103358)
,p_db_column_name=>'DCHD_OUTWARD_DOC_NO'
,p_display_order=>270
,p_column_identifier=>'Z'
,p_column_label=>'Dchd Outward Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340806958712103357)
,p_db_column_name=>'DCHD_OUTWARD_FLAG'
,p_display_order=>260
,p_column_identifier=>'Y'
,p_column_label=>'Dchd Outward Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343146080988771548)
,p_db_column_name=>'DCHD_OUTWARD_SEL_USER'
,p_display_order=>670
,p_column_identifier=>'BN'
,p_column_label=>'Dchd Outward Sel User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343150816513771546)
,p_db_column_name=>'DCHD_PACK_NOTE_NO'
,p_display_order=>1150
,p_column_identifier=>'DJ'
,p_column_label=>'Dchd Pack Note No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340805774769103345)
,p_db_column_name=>'DCHD_PLNT'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Dchd Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343155326105771541)
,p_db_column_name=>'DCHD_PLNT_LOC_ID'
,p_display_order=>1600
,p_column_identifier=>'FC'
,p_column_label=>'Dchd Plnt Loc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343155463500771542)
,p_db_column_name=>'DCHD_PLNT_LOC_NAME'
,p_display_order=>1610
,p_column_identifier=>'FD'
,p_column_label=>'Dchd Plnt Loc Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340806480517103352)
,p_db_column_name=>'DCHD_RECEIVED_BY'
,p_display_order=>210
,p_column_identifier=>'T'
,p_column_label=>'Dchd Received By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340805279318103340)
,p_db_column_name=>'DCHD_REFERENCE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343145110307771539)
,p_db_column_name=>'DCHD_REQUIRED_DATE'
,p_display_order=>580
,p_column_identifier=>'BE'
,p_column_label=>'Dchd Required Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340805152646103339)
,p_db_column_name=>'DCHD_RETURN_FLAG'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Dchd Return Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343158816327771526)
,p_db_column_name=>'DCHD_ROUTE_ID'
,p_display_order=>1950
,p_column_identifier=>'GL'
,p_column_label=>'Dchd Route Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343150992495771547)
,p_db_column_name=>'DCHD_RQSTBY_ENTITY'
,p_display_order=>1160
,p_column_identifier=>'DK'
,p_column_label=>'Dchd Rqstby Entity'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340805569465103343)
,p_db_column_name=>'DCHD_RTN_GE_NO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Dchd Rtn Ge No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340807111035103359)
,p_db_column_name=>'DCHD_SEL_FLAG'
,p_display_order=>280
,p_column_identifier=>'AA'
,p_column_label=>'Dchd Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343158776198771525)
,p_db_column_name=>'DCHD_SESSION'
,p_display_order=>1940
,p_column_identifier=>'GK'
,p_column_label=>'Dchd Session'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343151844048771556)
,p_db_column_name=>'DCHD_SHIPFR_ADDR1'
,p_display_order=>1250
,p_column_identifier=>'DT'
,p_column_label=>'Dchd Shipfr Addr1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343151947500771557)
,p_db_column_name=>'DCHD_SHIPFR_ADDR2'
,p_display_order=>1260
,p_column_identifier=>'DU'
,p_column_label=>'Dchd Shipfr Addr2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343152065210771558)
,p_db_column_name=>'DCHD_SHIPFR_ADDR3'
,p_display_order=>1270
,p_column_identifier=>'DV'
,p_column_label=>'Dchd Shipfr Addr3'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343152253778771560)
,p_db_column_name=>'DCHD_SHIPFR_CITY'
,p_display_order=>1290
,p_column_identifier=>'DX'
,p_column_label=>'Dchd Shipfr City'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343152523726771563)
,p_db_column_name=>'DCHD_SHIPFR_COUNTRY'
,p_display_order=>1320
,p_column_identifier=>'EA'
,p_column_label=>'Dchd Shipfr Country'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343153098561771568)
,p_db_column_name=>'DCHD_SHIPFR_EMAIL'
,p_display_order=>1370
,p_column_identifier=>'EF'
,p_column_label=>'Dchd Shipfr Email'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343152952045771567)
,p_db_column_name=>'DCHD_SHIPFR_FAX'
,p_display_order=>1360
,p_column_identifier=>'EE'
,p_column_label=>'Dchd Shipfr Fax'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343156156477771549)
,p_db_column_name=>'DCHD_SHIPFR_GST_NO'
,p_display_order=>1680
,p_column_identifier=>'FK'
,p_column_label=>'Dchd Shipfr Gst No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343148507923771523)
,p_db_column_name=>'DCHD_SHIPFR_LOC_ID'
,p_display_order=>920
,p_column_identifier=>'CM'
,p_column_label=>'Dchd Shipfr Loc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343155763973771545)
,p_db_column_name=>'DCHD_SHIPFR_LOC_NAME'
,p_display_order=>1640
,p_column_identifier=>'FG'
,p_column_label=>'Dchd Shipfr Loc Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343152864528771566)
,p_db_column_name=>'DCHD_SHIPFR_MOB'
,p_display_order=>1350
,p_column_identifier=>'ED'
,p_column_label=>'Dchd Shipfr Mob'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343152119748771559)
,p_db_column_name=>'DCHD_SHIPFR_PO_BOX'
,p_display_order=>1280
,p_column_identifier=>'DW'
,p_column_label=>'Dchd Shipfr Po Box'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343152389608771561)
,p_db_column_name=>'DCHD_SHIPFR_STATE'
,p_display_order=>1300
,p_column_identifier=>'DY'
,p_column_label=>'Dchd Shipfr State'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343152420118771562)
,p_db_column_name=>'DCHD_SHIPFR_STATE_CODE'
,p_display_order=>1310
,p_column_identifier=>'DZ'
,p_column_label=>'Dchd Shipfr State Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343152772388771565)
,p_db_column_name=>'DCHD_SHIPFR_TELE'
,p_display_order=>1340
,p_column_identifier=>'EC'
,p_column_label=>'Dchd Shipfr Tele'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343153124877771569)
,p_db_column_name=>'DCHD_SHIPFR_WEBSITE'
,p_display_order=>1380
,p_column_identifier=>'EG'
,p_column_label=>'Dchd Shipfr Website'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343152612228771564)
,p_db_column_name=>'DCHD_SHIPFR_ZIP'
,p_display_order=>1330
,p_column_identifier=>'EB'
,p_column_label=>'Dchd Shipfr Zip'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340808345950103371)
,p_db_column_name=>'DCHD_SHIPTO_ADDR1'
,p_display_order=>400
,p_column_identifier=>'AM'
,p_column_label=>'Dchd Shipto Addr1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340808442785103372)
,p_db_column_name=>'DCHD_SHIPTO_ADDR2'
,p_display_order=>410
,p_column_identifier=>'AN'
,p_column_label=>'Dchd Shipto Addr2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343143539516771523)
,p_db_column_name=>'DCHD_SHIPTO_ADDR3'
,p_display_order=>420
,p_column_identifier=>'AO'
,p_column_label=>'Dchd Shipto Addr3'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343143684711771524)
,p_db_column_name=>'DCHD_SHIPTO_ADDR4'
,p_display_order=>430
,p_column_identifier=>'AP'
,p_column_label=>'Dchd Shipto Addr4'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343143728865771525)
,p_db_column_name=>'DCHD_SHIPTO_ADDR5'
,p_display_order=>440
,p_column_identifier=>'AQ'
,p_column_label=>'Dchd Shipto Addr5'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343143957731771527)
,p_db_column_name=>'DCHD_SHIPTO_CITY'
,p_display_order=>460
,p_column_identifier=>'AS'
,p_column_label=>'Dchd Shipto City'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343144136664771529)
,p_db_column_name=>'DCHD_SHIPTO_COUNTRY'
,p_display_order=>480
,p_column_identifier=>'AU'
,p_column_label=>'Dchd Shipto Country'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343144627061771534)
,p_db_column_name=>'DCHD_SHIPTO_EMAIL'
,p_display_order=>530
,p_column_identifier=>'AZ'
,p_column_label=>'Dchd Shipto Email'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343144506229771533)
,p_db_column_name=>'DCHD_SHIPTO_FAX'
,p_display_order=>520
,p_column_identifier=>'AY'
,p_column_label=>'Dchd Shipto Fax'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343155931895771547)
,p_db_column_name=>'DCHD_SHIPTO_GST_NO'
,p_display_order=>1660
,p_column_identifier=>'FI'
,p_column_label=>'Dchd Shipto Gst No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343155521102771543)
,p_db_column_name=>'DCHD_SHIPTO_LOC_NAME'
,p_display_order=>1620
,p_column_identifier=>'FE'
,p_column_label=>'Dchd Shipto Loc Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343144428166771532)
,p_db_column_name=>'DCHD_SHIPTO_MOB'
,p_display_order=>510
,p_column_identifier=>'AX'
,p_column_label=>'Dchd Shipto Mob'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343143852517771526)
,p_db_column_name=>'DCHD_SHIPTO_PO_BOX'
,p_display_order=>450
,p_column_identifier=>'AR'
,p_column_label=>'Dchd Shipto Po Box'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343144064407771528)
,p_db_column_name=>'DCHD_SHIPTO_STATE'
,p_display_order=>470
,p_column_identifier=>'AT'
,p_column_label=>'Dchd Shipto State'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343151662883771554)
,p_db_column_name=>'DCHD_SHIPTO_STATE_CODE'
,p_display_order=>1230
,p_column_identifier=>'DR'
,p_column_label=>'Dchd Shipto State Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343144315266771531)
,p_db_column_name=>'DCHD_SHIPTO_TELE'
,p_display_order=>500
,p_column_identifier=>'AW'
,p_column_label=>'Dchd Shipto Tele'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343144770760771535)
,p_db_column_name=>'DCHD_SHIPTO_WEBSITE'
,p_display_order=>540
,p_column_identifier=>'BA'
,p_column_label=>'Dchd Shipto Website'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343144213457771530)
,p_db_column_name=>'DCHD_SHIPTO_ZIP'
,p_display_order=>490
,p_column_identifier=>'AV'
,p_column_label=>'Dchd Shipto Zip'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340805461650103342)
,p_db_column_name=>'DCHD_SOURCE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Dchd Source'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343145292244771540)
,p_db_column_name=>'DCHD_SOURCE_FRM'
,p_display_order=>590
,p_column_identifier=>'BF'
,p_column_label=>'Dchd Source Frm'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343159136916771529)
,p_db_column_name=>'DCHD_SOU_PLNT'
,p_display_order=>1980
,p_column_identifier=>'GO'
,p_column_label=>'Dchd Sou Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343158979246771527)
,p_db_column_name=>'DCHD_SP_ID'
,p_display_order=>1960
,p_column_identifier=>'GM'
,p_column_label=>'Dchd Sp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340805322604103341)
,p_db_column_name=>'DCHD_STATUS'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Dchd Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343157934473771567)
,p_db_column_name=>'DCHD_SUPLR_DC_DATE'
,p_display_order=>1860
,p_column_identifier=>'GC'
,p_column_label=>'Dchd Suplr Dc Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343157844517771566)
,p_db_column_name=>'DCHD_SUPLR_DC_NO'
,p_display_order=>1850
,p_column_identifier=>'GB'
,p_column_label=>'Dchd Suplr Dc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340804941790103337)
,p_db_column_name=>'DCHD_SUPLR_ID'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Supplier'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343146143442771549)
,p_db_column_name=>'DCHD_TAX_FLAG'
,p_display_order=>680
,p_column_identifier=>'BO'
,p_column_label=>'Dchd Tax Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343145777206771545)
,p_db_column_name=>'DCHD_TOT_CARR_RATE'
,p_display_order=>640
,p_column_identifier=>'BK'
,p_column_label=>'Dchd Tot Carr Rate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343145841949771546)
,p_db_column_name=>'DCHD_TOT_VALUE'
,p_display_order=>650
,p_column_identifier=>'BL'
,p_column_label=>'Dchd Tot Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343145658991771544)
,p_db_column_name=>'DCHD_TOT_WEIGHT'
,p_display_order=>630
,p_column_identifier=>'BJ'
,p_column_label=>'Dchd Tot Weight'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343145504275771543)
,p_db_column_name=>'DCHD_TO_CITY'
,p_display_order=>620
,p_column_identifier=>'BI'
,p_column_label=>'Dchd To City'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343174718755771635)
,p_db_column_name=>'DCHD_TRANS_BU'
,p_display_order=>3540
,p_column_identifier=>'MQ'
,p_column_label=>'Dchd Trans Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343156621345771554)
,p_db_column_name=>'DCHD_TRANS_CHRG_AMT'
,p_display_order=>1730
,p_column_identifier=>'FP'
,p_column_label=>'Dchd Trans Chrg Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343174844519771636)
,p_db_column_name=>'DCHD_TRANS_PLNT'
,p_display_order=>3580
,p_column_identifier=>'MR'
,p_column_label=>'Dchd Trans Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343174925566771637)
,p_db_column_name=>'DCHD_TRANS_PLNT_LOC_ID'
,p_display_order=>3570
,p_column_identifier=>'MS'
,p_column_label=>'Dchd Trans Plnt Loc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340806698179103354)
,p_db_column_name=>'DCHD_TRANS_THR'
,p_display_order=>230
,p_column_identifier=>'V'
,p_column_label=>'Dchd Trans Thr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343148770976771525)
,p_db_column_name=>'DCHD_TRIP_PLN_NO'
,p_display_order=>940
,p_column_identifier=>'CO'
,p_column_label=>'Dchd Trip Pln No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343158662159771524)
,p_db_column_name=>'DCHD_TRNSP_REQ_FLAG'
,p_display_order=>1930
,p_column_identifier=>'GJ'
,p_column_label=>'Dchd Trnsp Req Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340805067407103338)
,p_db_column_name=>'DCHD_TYPE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Dchd Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343149524546771533)
,p_db_column_name=>'DCHD_UPD_BY'
,p_display_order=>1020
,p_column_identifier=>'CW'
,p_column_label=>'Dchd Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343149807073771536)
,p_db_column_name=>'DCHD_UPD_DATE'
,p_display_order=>1050
,p_column_identifier=>'CZ'
,p_column_label=>'Dchd Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343150329767771541)
,p_db_column_name=>'DCHD_UPD_EMP_ID'
,p_display_order=>1100
,p_column_identifier=>'DE'
,p_column_label=>'Dchd Upd Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343149697511771534)
,p_db_column_name=>'DCHD_UPD_IP_ADDR'
,p_display_order=>1030
,p_column_identifier=>'CX'
,p_column_label=>'Dchd Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343149739363771535)
,p_db_column_name=>'DCHD_UPD_OS_USER'
,p_display_order=>1040
,p_column_identifier=>'CY'
,p_column_label=>'Dchd Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340807236345103360)
,p_db_column_name=>'DCHD_USER'
,p_display_order=>290
,p_column_identifier=>'AB'
,p_column_label=>'Dchd User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343156323590771551)
,p_db_column_name=>'DCHD_VEH_CAP'
,p_display_order=>1700
,p_column_identifier=>'FM'
,p_column_label=>'Dchd Veh Cap'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343156589411771553)
,p_db_column_name=>'DCHD_VEH_CAP_TONS'
,p_display_order=>1720
,p_column_identifier=>'FO'
,p_column_label=>'Dchd Veh Cap Tons'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340806788330103355)
,p_db_column_name=>'DCHD_VEH_NO'
,p_display_order=>240
,p_column_identifier=>'W'
,p_column_label=>'Dchd Veh No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343171528897771653)
,p_db_column_name=>'DCLN_ACT_RCPT_QTY'
,p_display_order=>3220
,p_column_identifier=>'LK'
,p_column_label=>'Dcln Act Rcpt Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343170242610771640)
,p_db_column_name=>'DCLN_ACT_WGHT'
,p_display_order=>3090
,p_column_identifier=>'KX'
,p_column_label=>'Dcln Act Wght'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343166243111771550)
,p_db_column_name=>'DCLN_AEN_TYPE'
,p_display_order=>2690
,p_column_identifier=>'JJ'
,p_column_label=>'Dcln Aen Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343170418734771642)
,p_db_column_name=>'DCLN_ASN_DOC_NO'
,p_display_order=>3110
,p_column_identifier=>'KZ'
,p_column_label=>'Dcln Asn Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343170304955771641)
,p_db_column_name=>'DCLN_ASN_QTY'
,p_display_order=>3100
,p_column_identifier=>'KY'
,p_column_label=>'Dcln Asn Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343173438049771672)
,p_db_column_name=>'DCLN_BASE_PRICE'
,p_display_order=>3410
,p_column_identifier=>'MD'
,p_column_label=>'Dcln Base Price'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343173209903771670)
,p_db_column_name=>'DCLN_BASE_UOM'
,p_display_order=>3390
,p_column_identifier=>'MB'
,p_column_label=>'Dcln Base Uom'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343172803828771666)
,p_db_column_name=>'DCLN_BASE_UOM_QTY'
,p_display_order=>3350
,p_column_identifier=>'LX'
,p_column_label=>'Dcln Base Uom Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343168254275771570)
,p_db_column_name=>'DCLN_BOQ_REF_NO'
,p_display_order=>2890
,p_column_identifier=>'KD'
,p_column_label=>'Dcln Boq Ref No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343168347897771571)
,p_db_column_name=>'DCLN_BOQ_SEQ_NO'
,p_display_order=>2900
,p_column_identifier=>'KE'
,p_column_label=>'Dcln Boq Seq No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343168416099771572)
,p_db_column_name=>'DCLN_BOQ_SUB_SEQ_NO'
,p_display_order=>2910
,p_column_identifier=>'KF'
,p_column_label=>'Dcln Boq Sub Seq No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343159425462771532)
,p_db_column_name=>'DCLN_BU'
,p_display_order=>2010
,p_column_identifier=>'GR'
,p_column_label=>'Dcln Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343172531659771663)
,p_db_column_name=>'DCLN_CAL_MOSTR_QTY'
,p_display_order=>3320
,p_column_identifier=>'LU'
,p_column_label=>'Dcln Cal Mostr Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343172426365771662)
,p_db_column_name=>'DCLN_CAL_RCPT_QTY'
,p_display_order=>3310
,p_column_identifier=>'LT'
,p_column_label=>'Dcln Cal Rcpt Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343164720081771535)
,p_db_column_name=>'DCLN_CARR_RATE'
,p_display_order=>2540
,p_column_identifier=>'IU'
,p_column_label=>'Dcln Carr Rate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343163684480771524)
,p_db_column_name=>'DCLN_CMR_INT_FLAG'
,p_display_order=>2430
,p_column_identifier=>'IH'
,p_column_label=>'Dcln Cmr Int Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343163548916771523)
,p_db_column_name=>'DCLN_CMR_INT_USER'
,p_display_order=>2420
,p_column_identifier=>'IG'
,p_column_label=>'Dcln Cmr Int User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343161840832771556)
,p_db_column_name=>'DCLN_COMPLD_QTY'
,p_display_order=>2250
,p_column_identifier=>'HP'
,p_column_label=>'Completed.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343162238583771560)
,p_db_column_name=>'DCLN_CONS_INPROC_QTY'
,p_display_order=>2290
,p_column_identifier=>'HT'
,p_column_label=>'Dcln Cons Inproc Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343164815856771536)
,p_db_column_name=>'DCLN_CONV_FACTOR'
,p_display_order=>2550
,p_column_identifier=>'IV'
,p_column_label=>'Dcln Conv Factor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343166398087771551)
,p_db_column_name=>'DCLN_CRE_BY'
,p_display_order=>2700
,p_column_identifier=>'JK'
,p_column_label=>'Dcln Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343166629054771554)
,p_db_column_name=>'DCLN_CRE_DATE'
,p_display_order=>2730
,p_column_identifier=>'JN'
,p_column_label=>'Dcln Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343167144207771559)
,p_db_column_name=>'DCLN_CRE_EMP_ID'
,p_display_order=>2780
,p_column_identifier=>'JS'
,p_column_label=>'Dcln Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343166459388771552)
,p_db_column_name=>'DCLN_CRE_IP_ADDR'
,p_display_order=>2710
,p_column_identifier=>'JL'
,p_column_label=>'Dcln Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343166602939771553)
,p_db_column_name=>'DCLN_CRE_OS_USER'
,p_display_order=>2720
,p_column_identifier=>'JM'
,p_column_label=>'Dcln Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343169566040771633)
,p_db_column_name=>'DCLN_CSR_TYPE'
,p_display_order=>3020
,p_column_identifier=>'KQ'
,p_column_label=>'Dcln Csr Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343174534233771633)
,p_db_column_name=>'DCLN_DAIRY_INV_DOC_NO'
,p_display_order=>3520
,p_column_identifier=>'MO'
,p_column_label=>'Dcln Dairy Inv Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343174631575771634)
,p_db_column_name=>'DCLN_DAIRY_INV_SEQ_NO'
,p_display_order=>3530
,p_column_identifier=>'MP'
,p_column_label=>'Dcln Dairy Inv Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343169935072771637)
,p_db_column_name=>'DCLN_DENSITY'
,p_display_order=>3060
,p_column_identifier=>'KU'
,p_column_label=>'Dcln Density'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343173061459771668)
,p_db_column_name=>'DCLN_DMG_DISC_PCT'
,p_display_order=>3370
,p_column_identifier=>'LZ'
,p_column_label=>'Dcln Dmg Disc Pct'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343164132514771529)
,p_db_column_name=>'DCLN_DMI_PRCS_QTY'
,p_display_order=>2480
,p_column_identifier=>'IM'
,p_column_label=>'Dcln Dmi Prcs Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343164252197771530)
,p_db_column_name=>'DCLN_DMI_SEL_FLAG'
,p_display_order=>2490
,p_column_identifier=>'IO'
,p_column_label=>'Dcln Dmi Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343164349687771531)
,p_db_column_name=>'DCLN_DMI_SEL_USER'
,p_display_order=>2500
,p_column_identifier=>'IP'
,p_column_label=>'Dcln Dmi Sel User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343159572060771533)
,p_db_column_name=>'DCLN_DOC_NO'
,p_display_order=>2020
,p_column_identifier=>'GS'
,p_column_label=>'Dcln Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343172618712771664)
,p_db_column_name=>'DCLN_DRAWING_NO'
,p_display_order=>3330
,p_column_identifier=>'LV'
,p_column_label=>'Dcln Drawing No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343172797586771665)
,p_db_column_name=>'DCLN_DRAWING_REV'
,p_display_order=>3340
,p_column_identifier=>'LW'
,p_column_label=>'Dcln Drawing Rev'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343167342782771561)
,p_db_column_name=>'DCLN_DRY_FAT'
,p_display_order=>2800
,p_column_identifier=>'JU'
,p_column_label=>'Dcln Dry Fat'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343167528406771563)
,p_db_column_name=>'DCLN_DRY_FAT_KGS'
,p_display_order=>2820
,p_column_identifier=>'JW'
,p_column_label=>'Dcln Dry Fat Kgs'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343167975148771567)
,p_db_column_name=>'DCLN_DRY_LR'
,p_display_order=>2860
,p_column_identifier=>'KA'
,p_column_label=>'Dcln Dry Lr'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343167448627771562)
,p_db_column_name=>'DCLN_DRY_SNF'
,p_display_order=>2810
,p_column_identifier=>'JV'
,p_column_label=>'Dcln Dry Snf'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343167658717771564)
,p_db_column_name=>'DCLN_DRY_SNF_KGS'
,p_display_order=>2830
,p_column_identifier=>'JX'
,p_column_label=>'Dcln Dry Snf Kgs'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343173781238771625)
,p_db_column_name=>'DCLN_DRY_STK_QTY'
,p_display_order=>3440
,p_column_identifier=>'MG'
,p_column_label=>'Dcln Dry Stk Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343168126180771569)
,p_db_column_name=>'DCLN_DRY_TRF_QTY_KGS'
,p_display_order=>2880
,p_column_identifier=>'KC'
,p_column_label=>'Dcln Dry Trf Qty Kgs'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343168052530771568)
,p_db_column_name=>'DCLN_DRY_TRF_QTY_LTR'
,p_display_order=>2870
,p_column_identifier=>'KB'
,p_column_label=>'Dcln Dry Trf Qty Ltr'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343169001406771627)
,p_db_column_name=>'DCLN_EPC_INPROC_QTY'
,p_display_order=>2960
,p_column_identifier=>'KK'
,p_column_label=>'Dcln Epc Inproc Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343169034406771628)
,p_db_column_name=>'DCLN_EPC_INV_QTY'
,p_display_order=>2970
,p_column_identifier=>'KL'
,p_column_label=>'Dcln Epc Inv Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343168849374771626)
,p_db_column_name=>'DCLN_EPC_PROC_QTY'
,p_display_order=>2950
,p_column_identifier=>'KJ'
,p_column_label=>'Dcln Epc Proc Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343167789721771565)
,p_db_column_name=>'DCLN_EPC_SEL_FLAG'
,p_display_order=>2840
,p_column_identifier=>'JY'
,p_column_label=>'Dcln Epc Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343167856343771566)
,p_db_column_name=>'DCLN_EPC_SEL_USER'
,p_display_order=>2850
,p_column_identifier=>'JZ'
,p_column_label=>'Dcln Epc Sel User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343171048051771648)
,p_db_column_name=>'DCLN_EXPIRY_DATE'
,p_display_order=>3170
,p_column_identifier=>'LF'
,p_column_label=>'Dcln Expiry Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343162818196771566)
,p_db_column_name=>'DCLN_FRT_COMP_QTY'
,p_display_order=>2350
,p_column_identifier=>'HZ'
,p_column_label=>'Dcln Frt Comp Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343162782543771565)
,p_db_column_name=>'DCLN_FRT_INPROC_QTY'
,p_display_order=>2340
,p_column_identifier=>'HY'
,p_column_label=>'Dcln Frt Inproc Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343163365414771571)
,p_db_column_name=>'DCLN_FRT_PROCESS_QTY'
,p_display_order=>2400
,p_column_identifier=>'IE'
,p_column_label=>'Dcln Frt Process Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343162923329771567)
,p_db_column_name=>'DCLN_FRT_SEL_FLAG'
,p_display_order=>2360
,p_column_identifier=>'IA'
,p_column_label=>'Dcln Frt Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343163028810771568)
,p_db_column_name=>'DCLN_FRT_SEL_USER'
,p_display_order=>2370
,p_column_identifier=>'IB'
,p_column_label=>'Dcln Frt Sel User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343164060358771528)
,p_db_column_name=>'DCLN_GE_CMR_DOC_NO'
,p_display_order=>2470
,p_column_identifier=>'IL'
,p_column_label=>'Dcln Ge Cmr Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343163968907771527)
,p_db_column_name=>'DCLN_GE_CMR_TYPE'
,p_display_order=>2460
,p_column_identifier=>'IK'
,p_column_label=>'Dcln Ge Cmr Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343165950918771547)
,p_db_column_name=>'DCLN_GE_DOC_NO'
,p_display_order=>2660
,p_column_identifier=>'JG'
,p_column_label=>'Dcln Ge Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343172084215771658)
,p_db_column_name=>'DCLN_GR_WGHT'
,p_display_order=>3270
,p_column_identifier=>'LP'
,p_column_label=>'Dcln Gr Wght'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343169695383771634)
,p_db_column_name=>'DCLN_HEIGHT'
,p_display_order=>3030
,p_column_identifier=>'KR'
,p_column_label=>'Dcln Height'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343165235349771540)
,p_db_column_name=>'DCLN_HSN_CODE'
,p_display_order=>2590
,p_column_identifier=>'IZ'
,p_column_label=>'Dcln Hsn Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343165726838771545)
,p_db_column_name=>'DCLN_IMO_NO'
,p_display_order=>2640
,p_column_identifier=>'JE'
,p_column_label=>'IMO No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343169879451771636)
,p_db_column_name=>'DCLN_INNER_DIA'
,p_display_order=>3050
,p_column_identifier=>'KT'
,p_column_label=>'Dcln Inner Dia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343174381249771631)
,p_db_column_name=>'DCLN_INST_FLAG'
,p_display_order=>3500
,p_column_identifier=>'MM'
,p_column_label=>'Dcln Inst Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343164947501771537)
,p_db_column_name=>'DCLN_INST_ID'
,p_display_order=>2560
,p_column_identifier=>'IW'
,p_column_label=>'Dcln Inst Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343174456255771632)
,p_db_column_name=>'DCLN_INS_DIS_CUST_ID'
,p_display_order=>3510
,p_column_identifier=>'MN'
,p_column_label=>'Dcln Ins Dis Cust Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343166028733771548)
,p_db_column_name=>'DCLN_INV_DOC_NO'
,p_display_order=>2670
,p_column_identifier=>'JH'
,p_column_label=>'Dcln Inv Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343169363703771631)
,p_db_column_name=>'DCLN_INV_SEL_FLAG'
,p_display_order=>3000
,p_column_identifier=>'KO'
,p_column_label=>'Dcln Inv Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343169491873771632)
,p_db_column_name=>'DCLN_INV_SEL_USER'
,p_display_order=>3010
,p_column_identifier=>'KP'
,p_column_label=>'Dcln Inv Sel User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343166164161771549)
,p_db_column_name=>'DCLN_INV_SEQ_NO'
,p_display_order=>2680
,p_column_identifier=>'JI'
,p_column_label=>'Dcln Inv Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343160615203771544)
,p_db_column_name=>'DCLN_IN_PROC_QTY'
,p_display_order=>2130
,p_column_identifier=>'HD'
,p_column_label=>'In Process'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343168607101771624)
,p_db_column_name=>'DCLN_LENGTH'
,p_display_order=>2930
,p_column_identifier=>'KH'
,p_column_label=>'Dcln Length'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343170546908771643)
,p_db_column_name=>'DCLN_LOT_NO'
,p_display_order=>3120
,p_column_identifier=>'LA'
,p_column_label=>'Dcln Lot No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343163451944771572)
,p_db_column_name=>'DCLN_MAT_TYPE'
,p_display_order=>2410
,p_column_identifier=>'IF'
,p_column_label=>'Dcln Mat Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343161968368771557)
,p_db_column_name=>'DCLN_MI_DOC_NO'
,p_display_order=>2260
,p_column_identifier=>'HQ'
,p_column_label=>'Dcln Mi Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343162674764771564)
,p_db_column_name=>'DCLN_MI_SEQ_NO'
,p_display_order=>2330
,p_column_identifier=>'HX'
,p_column_label=>'Dcln Mi Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343171324190771651)
,p_db_column_name=>'DCLN_MOSTR_QTY'
,p_display_order=>3200
,p_column_identifier=>'LI'
,p_column_label=>'Dcln Mostr Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343165410011771542)
,p_db_column_name=>'DCLN_NO_OF_BAGS'
,p_display_order=>2610
,p_column_identifier=>'JB'
,p_column_label=>'Dcln No Of Bags'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343172223623771660)
,p_db_column_name=>'DCLN_NT_WGHT'
,p_display_order=>3290
,p_column_identifier=>'LR'
,p_column_label=>'Dcln Nt Wght'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343170029709771638)
,p_db_column_name=>'DCLN_OPRN_LN_SEQ_NO'
,p_display_order=>3070
,p_column_identifier=>'KV'
,p_column_label=>'Dcln Oprn Ln Seq No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343173190477771669)
,p_db_column_name=>'DCLN_OTH_DISC_PCT'
,p_display_order=>3380
,p_column_identifier=>'MA'
,p_column_label=>'Dcln Oth Disc Pct'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343169709185771635)
,p_db_column_name=>'DCLN_OUTER_DIA'
,p_display_order=>3040
,p_column_identifier=>'KS'
,p_column_label=>'Dcln Outer Dia'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343161590255771553)
,p_db_column_name=>'DCLN_PAR_PROD_DESC1'
,p_display_order=>2220
,p_column_identifier=>'HM'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343161365248771551)
,p_db_column_name=>'DCLN_PAR_PROD_ID'
,p_display_order=>2200
,p_column_identifier=>'HK'
,p_column_label=>'Dcln Par Prod Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343161444620771552)
,p_db_column_name=>'DCLN_PAR_PROD_REV'
,p_display_order=>2210
,p_column_identifier=>'HL'
,p_column_label=>' Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343161144274771549)
,p_db_column_name=>'DCLN_PG_ID'
,p_display_order=>2180
,p_column_identifier=>'HI'
,p_column_label=>'Dcln Pg Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343161055641771548)
,p_db_column_name=>'DCLN_PG_TYPE'
,p_display_order=>2170
,p_column_identifier=>'HH'
,p_column_label=>'Dcln Pg Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343160897476771546)
,p_db_column_name=>'DCLN_PLNT'
,p_display_order=>2150
,p_column_identifier=>'HF'
,p_column_label=>'Dcln Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343174206836771630)
,p_db_column_name=>'DCLN_PRICE_CHART_ID'
,p_display_order=>3490
,p_column_identifier=>'ML'
,p_column_label=>'Dcln Price Chart Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343174082233771628)
,p_db_column_name=>'DCLN_PRICE_DOC_NO'
,p_display_order=>3470
,p_column_identifier=>'MJ'
,p_column_label=>'Dcln Price Doc No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343174121516771629)
,p_db_column_name=>'DCLN_PRICE_DOC_REV'
,p_display_order=>3480
,p_column_identifier=>'MK'
,p_column_label=>'Dcln Price Doc Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343160933444771547)
,p_db_column_name=>'DCLN_PROCESS_ID'
,p_display_order=>2160
,p_column_identifier=>'HG'
,p_column_label=>'Dcln Process Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343160549812771543)
,p_db_column_name=>'DCLN_PROC_QTY'
,p_display_order=>2120
,p_column_identifier=>'HC'
,p_column_label=>'Process'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343159972009771537)
,p_db_column_name=>'DCLN_PROD_DESC1'
,p_display_order=>2060
,p_column_identifier=>'GW'
,p_column_label=>'Dcln Prod Desc1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343159754386771535)
,p_db_column_name=>'DCLN_PROD_ID'
,p_display_order=>2040
,p_column_identifier=>'GU'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343162017784771558)
,p_db_column_name=>'DCLN_PROD_ORD_NO'
,p_display_order=>2270
,p_column_identifier=>'HR'
,p_column_label=>'Dcln Prod Ord No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343159862432771536)
,p_db_column_name=>'DCLN_PROD_REV'
,p_display_order=>2050
,p_column_identifier=>'GV'
,p_column_label=>'Dcln Prod Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343162575091771563)
,p_db_column_name=>'DCLN_PROD_WEIGHT'
,p_display_order=>2320
,p_column_identifier=>'HW'
,p_column_label=>'Dcln Prod Weight'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343160167916771539)
,p_db_column_name=>'DCLN_QTY'
,p_display_order=>2080
,p_column_identifier=>'GY'
,p_column_label=>'DC.Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343160399538771541)
,p_db_column_name=>'DCLN_REFERENCE'
,p_display_order=>2100
,p_column_identifier=>'HA'
,p_column_label=>'Dcln Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343171473602771652)
,p_db_column_name=>'DCLN_REMARKS'
,p_display_order=>3210
,p_column_identifier=>'LJ'
,p_column_label=>'Dcln Remarks'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343164636506771534)
,p_db_column_name=>'DCLN_RES_ID'
,p_display_order=>2530
,p_column_identifier=>'IT'
,p_column_label=>'Dcln Res Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343173687826771624)
,p_db_column_name=>'DCLN_RETAIL_PRICE'
,p_display_order=>3430
,p_column_identifier=>'MF'
,p_column_label=>'Dcln Retail Price'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343173320371771671)
,p_db_column_name=>'DCLN_RETAIL_UOM'
,p_display_order=>3400
,p_column_identifier=>'MC'
,p_column_label=>'Dcln Retail Uom'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343172991189771667)
,p_db_column_name=>'DCLN_RETAIL_UOM_QTY'
,p_display_order=>3360
,p_column_identifier=>'LY'
,p_column_label=>'Dcln Retail Uom Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343160741483771545)
,p_db_column_name=>'DCLN_RETURN_QTY'
,p_display_order=>2140
,p_column_identifier=>'HE'
,p_column_label=>'Dcln Return Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343173881270771626)
,p_db_column_name=>'DCLN_RET_CONV_FACTOR'
,p_display_order=>3450
,p_column_identifier=>'MH'
,p_column_label=>'Dcln Ret Conv Factor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343165646515771544)
,p_db_column_name=>'DCLN_RMA_NO'
,p_display_order=>2630
,p_column_identifier=>'JD'
,p_column_label=>'Dcln Rma No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343165596347771543)
,p_db_column_name=>'DCLN_RMA_PFX'
,p_display_order=>2620
,p_column_identifier=>'JC'
,p_column_label=>'Dcln Rma Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343162140583771559)
,p_db_column_name=>'DCLN_RTN_FLAG'
,p_display_order=>2280
,p_column_identifier=>'HS'
,p_column_label=>'Dcln Rtn Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343165857667771546)
,p_db_column_name=>'DCLN_RTN_IMO_NO'
,p_display_order=>2650
,p_column_identifier=>'JF'
,p_column_label=>'Rtn. IMO No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343173909396771627)
,p_db_column_name=>'DCLN_SAL_CONV_FACTOR'
,p_display_order=>3460
,p_column_identifier=>'MI'
,p_column_label=>'Dcln Sal Conv Factor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343173560391771623)
,p_db_column_name=>'DCLN_SAL_PRICE'
,p_display_order=>3420
,p_column_identifier=>'ME'
,p_column_label=>'Dcln Sal Price'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343160269539771540)
,p_db_column_name=>'DCLN_SC_UNIT_COST'
,p_display_order=>2090
,p_column_identifier=>'GZ'
,p_column_label=>'Unit Cost'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343171168657771649)
,p_db_column_name=>'DCLN_SELL_PRICE'
,p_display_order=>3180
,p_column_identifier=>'LG'
,p_column_label=>'Dcln Sell Price'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343160417010771542)
,p_db_column_name=>'DCLN_SEL_FLAG'
,p_display_order=>2110
,p_column_identifier=>'HB'
,p_column_label=>'Dcln Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343162467623771562)
,p_db_column_name=>'DCLN_SEL_USER'
,p_display_order=>2310
,p_column_identifier=>'HV'
,p_column_label=>'Dcln Sel User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343159658941771534)
,p_db_column_name=>'DCLN_SEQ_NO'
,p_display_order=>2030
,p_column_identifier=>'GT'
,p_column_label=>'Dcln Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343164555401771533)
,p_db_column_name=>'DCLN_SERV_PROD_DESC'
,p_display_order=>2520
,p_column_identifier=>'IR'
,p_column_label=>'Dcln Serv Prod Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343164418678771532)
,p_db_column_name=>'DCLN_SERV_PROD_ID'
,p_display_order=>2510
,p_column_identifier=>'IQ'
,p_column_label=>'Dcln Serv Prod Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343170667627771644)
,p_db_column_name=>'DCLN_SER_NO'
,p_display_order=>3130
,p_column_identifier=>'LB'
,p_column_label=>'Dcln Ser No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343161258847771550)
,p_db_column_name=>'DCLN_SF_CODE'
,p_display_order=>2190
,p_column_identifier=>'HJ'
,p_column_label=>'Dcln Sf Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343171301993771650)
,p_db_column_name=>'DCLN_SHORT_QTY'
,p_display_order=>3190
,p_column_identifier=>'LH'
,p_column_label=>'Dcln Short Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343161737744771555)
,p_db_column_name=>'DCLN_SOURCE_DOC_NO'
,p_display_order=>2240
,p_column_identifier=>'HO'
,p_column_label=>' Doc No./Line'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343161609234771554)
,p_db_column_name=>'DCLN_SOURCE_DOC_PFX'
,p_display_order=>2230
,p_column_identifier=>'HN'
,p_column_label=>'Order Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343170715573771645)
,p_db_column_name=>'DCLN_SOURCE_ID'
,p_display_order=>3140
,p_column_identifier=>'LC'
,p_column_label=>'Dcln Source Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343163133863771569)
,p_db_column_name=>'DCLN_SOURCE_SEQ_NO'
,p_display_order=>2380
,p_column_identifier=>'IC'
,p_column_label=>'Dcln Source Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343163300556771570)
,p_db_column_name=>'DCLN_SOURCE_SUB_SEQ_NO'
,p_display_order=>2390
,p_column_identifier=>'ID'
,p_column_label=>'Dcln Source Sub Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343170823311771646)
,p_db_column_name=>'DCLN_SOURCE_TYPE'
,p_display_order=>3150
,p_column_identifier=>'LD'
,p_column_label=>'Dcln Source Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343171824094771656)
,p_db_column_name=>'DCLN_SOU_OPRN_SEQ'
,p_display_order=>3250
,p_column_identifier=>'LN'
,p_column_label=>'Dcln Sou Oprn Seq'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343171999836771657)
,p_db_column_name=>'DCLN_SOU_PROC_ID'
,p_display_order=>3260
,p_column_identifier=>'LO'
,p_column_label=>'Dcln Sou Proc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343162315730771561)
,p_db_column_name=>'DCLN_STORE_ID'
,p_display_order=>2300
,p_column_identifier=>'HU'
,p_column_label=>'Dcln Store Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343170984359771647)
,p_db_column_name=>'DCLN_SYS_LS_NO'
,p_display_order=>3160
,p_column_identifier=>'LE'
,p_column_label=>'Dcln Sys Ls No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343165366252771541)
,p_db_column_name=>'DCLN_TAX_SET_ID'
,p_display_order=>2600
,p_column_identifier=>'JA'
,p_column_label=>'Dcln Tax Set Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343168569365771623)
,p_db_column_name=>'DCLN_THICKNESS'
,p_display_order=>2920
,p_column_identifier=>'KG'
,p_column_label=>'Dcln Thickness'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343172360537771661)
,p_db_column_name=>'DCLN_TOT_BAGS'
,p_display_order=>3300
,p_column_identifier=>'LS'
,p_column_label=>'Dcln Tot Bags'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343165098293771538)
,p_db_column_name=>'DCLN_TRF_SEL_FLAG'
,p_display_order=>2570
,p_column_identifier=>'IX'
,p_column_label=>'Dcln Trf Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343165192574771539)
,p_db_column_name=>'DCLN_TRF_SEL_USER'
,p_display_order=>2580
,p_column_identifier=>'IY'
,p_column_label=>'Dcln Trf Sel User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343163775183771525)
,p_db_column_name=>'DCLN_TRNSFR_BU'
,p_display_order=>2440
,p_column_identifier=>'II'
,p_column_label=>'Dcln Trnsfr Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343163892864771526)
,p_db_column_name=>'DCLN_TRNSFR_PLNT'
,p_display_order=>2450
,p_column_identifier=>'IJ'
,p_column_label=>'Dcln Trnsfr Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343171624729771654)
,p_db_column_name=>'DCLN_TRNSFR_PLNT_LOC_ID'
,p_display_order=>3230
,p_column_identifier=>'LL'
,p_column_label=>'Dcln Trnsfr Plnt Loc Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343171750445771655)
,p_db_column_name=>'DCLN_TRNSFR_PLNT_LOC_NAME'
,p_display_order=>3240
,p_column_identifier=>'LM'
,p_column_label=>'Dcln Trnsfr Plnt Loc Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343172202333771659)
,p_db_column_name=>'DCLN_TR_WGHT'
,p_display_order=>3280
,p_column_identifier=>'LQ'
,p_column_label=>'Dcln Tr Wght'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343170193341771639)
,p_db_column_name=>'DCLN_UNIT_WGHT'
,p_display_order=>3080
,p_column_identifier=>'KW'
,p_column_label=>'Dcln Unit Wght'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343160040709771538)
,p_db_column_name=>'DCLN_UOM'
,p_display_order=>2070
,p_column_identifier=>'GX'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343166728457771555)
,p_db_column_name=>'DCLN_UPD_BY'
,p_display_order=>2740
,p_column_identifier=>'JO'
,p_column_label=>'Dcln Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343167046635771558)
,p_db_column_name=>'DCLN_UPD_DATE'
,p_display_order=>2770
,p_column_identifier=>'JR'
,p_column_label=>'Dcln Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343167281607771560)
,p_db_column_name=>'DCLN_UPD_EMP_ID'
,p_display_order=>2790
,p_column_identifier=>'JT'
,p_column_label=>'Dcln Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343166816401771556)
,p_db_column_name=>'DCLN_UPD_IP_ADDR'
,p_display_order=>2750
,p_column_identifier=>'JP'
,p_column_label=>'Dcln Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343166926708771557)
,p_db_column_name=>'DCLN_UPD_OS_USER'
,p_display_order=>2760
,p_column_identifier=>'JQ'
,p_column_label=>'Dcln Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343169265143771630)
,p_db_column_name=>'DCLN_WAR_END_DATE'
,p_display_order=>2990
,p_column_identifier=>'KN'
,p_column_label=>'Dcln War End Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343169106383771629)
,p_db_column_name=>'DCLN_WAR_START_DATE'
,p_display_order=>2980
,p_column_identifier=>'KM'
,p_column_label=>'Dcln War Start Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343168723837771625)
,p_db_column_name=>'DCLN_WIDTH'
,p_display_order=>2940
,p_column_identifier=>'KI'
,p_column_label=>'Dcln Width'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343875207498547626)
,p_db_column_name=>'FVR_DOC_NO'
,p_display_order=>3600
,p_column_identifier=>'MV'
,p_column_label=>'FVR No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343875397679547627)
,p_db_column_name=>'PLANT_DESC'
,p_display_order=>3610
,p_column_identifier=>'MW'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10344236023921868037)
,p_db_column_name=>'PROCESS_QTY'
,p_display_order=>3630
,p_column_identifier=>'MY'
,p_column_label=>'Process Qty'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10340804586509103333)
,p_db_column_name=>'ROWID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10344235730829868034)
,p_db_column_name=>'SELECT_FLAG'
,p_display_order=>3620
,p_column_identifier=>'MX'
,p_column_label=>'Select'
,p_column_link=>'javascript:$s(''P9313117703_DCHD_DOC_NO'',''#DCHD_DOC_NO#''),$s(''P9313117703_DCHD_PLNT'',''#DCHD_PLNT#''),$s(''P9313117703_DCLN_PROC_QTY'',''#DCLN_PROC_QTY#''),$s(''P9313117703_TRF_SEL_FLAG'',''#DCLN_TRF_SEL_FLAG#''),$s(''P9313117703_DCLN_PROD_ID'',''#DCLN_PROD_ID#''),'
||'$s(''P9313117703_DCLN_PROD_REV'',''#DCLN_PROD_REV#''),$s(''P9313117703_DCHD_BU'',''#DCHD_BU#''),$s(''P9313117703_DCLN_SEQ_NO'',''#DCLN_SEQ_NO#'');apex.submit(''SEL_FLAG'');'
,p_column_linktext=>'#SELECT_FLAG#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10343347068868819734)
,p_db_column_name=>'SUPLR_DESC'
,p_display_order=>3560
,p_column_identifier=>'MT'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(10343300445793789339)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'23365444'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'DCHD_DC_NO:DCHD_SUPLR_ID:SUPLR_DESC:DCLN_PROD_ID:DCLN_PAR_PROD_REV:DCLN_PAR_PROD_DESC1:DCLN_QTY:DCLN_IN_PROC_QTY:DCLN_PROC_QTY:PROCESS_QTY:SELECT_FLAG:DCLN_COMPLD_QTY:DCHD_DOC_NO:DCHD_DATE:DCLN_SC_UNIT_COST:CSR_DOC_NO:FVR_DOC_NO:DCLN_UOM:DCLN_IMO_NO:'
||'DCLN_RTN_IMO_NO:PLANT_DESC:DCHD_REFERENCE:DCLN_SOURCE_DOC_PFX:DCLN_SOURCE_DOC_NO:DCHD_OTHER_TYPE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7251886253307680357)
,p_plug_name=>'PENDING'
,p_static_id=>'pending'
,p_region_name=>'PEND'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>11
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       ISTHDH_BU,',
'       ISTHDH_DOC_NO Doc_No,',
'       ISTHDH_DOC_OPER,',
'       ISTHDH_ISSUEFM_STORE_ID,',
'       DECODE(ISTHDH_ISSUETO_TYPE,''S'',''Intra Transfer'',''I'',''Inter Transfer'',''W'',''WIP'') Receiver,',
'       ISTHDH_ISSUETO_ID,',
'       case when isthdh_issueto_id is not null then  func_find_store_qry_desc(isthdh_bu,isthdh_issueto_id,1) end  Receiver_WH,',
'       ISTHDH_TRANS_DATE,',
'       TO_DATE(ISTHDH_TRANS_DATE,:GLOBAL_RPT_DATE_MASK) Trans_Date ,',
'       ISTHDH_ISSUER_ID,',
'       ISTHDH_ISSUER_NAME,',
'              (select distinct IIC_DESC ',
'          from inv_iss_code ',
'         where IIC_BU = :Global_bu',
'           AND  IIC_CODE = ISTHDH_ISS_CODE)IssCode,',
'       ISTHDH_PLNT,',
'       ISTHDH_RCPT_PFX,',
'       ISTHDH_RCPT_NO,',
'       ISTHDH_RECVD_BY Received_By,',
'       ISTHDH_ISSUED_BY Issued_By,',
'       ISTHDH_PLNT_LOC_ID,',
'       ISTHDH_PLNT_LOC_NAME Location,',
'       ISTHDH_RECVD_BY_NAME,',
'       ISTHDH_VOU_TYPE,',
'       ISTLNH_VOU_TYPE Vou_Type,',
'       ISTLNH_VOU_NO Vou_No,',
'       ISTLNH_VOU_SEQ_NO Vou_Seq_No,',
'       ISTLNH_SEQ_NO Seq_No,',
'       ISTLNH_PROD_ID Item ,',
'       ISTLNH_PROD_REV Rev,',
'       (select prod_desc11 from products where prod_bu = istlnh_bu and prod_id = ISTLNH_PROD_ID and prod_rev = ISTLNH_PROD_REV) Item_Desc,',
'       (select prod_ext_desc1 from products where prod_bu = istlnh_bu and prod_id = ISTLNH_PROD_ID and prod_rev = ISTLNH_PROD_REV) Item_Desc1,',
'       ISTLNH_UOM UOM,',
'       ISTLNH_PROD_UOM,',
'       ISTLNH_CONV_FACTOR,',
'       ISTLNH_PROD_CLS,',
'       ISTLNH_RQST_QTY Rqst_Qty,',
'       ISTLNH_TRANS_QTY Trans_Qty,',
'       ISTLNH_REJECTED_QTY,',
'       ISTLNH_DEFECT_QTY,',
'       ISTLNH_ACCEPTED_QTY,',
'       ISTLNH_UNIT_COST Unit_Cost,',
'       ISTLNH_PROC_QTY,',
'       ISTLNH_INPROC_QTY,',
'       ISTHDH_REFERENCE,',
'       DECODE(isthdh_issuefm_store_type,''Y'',''W W/H'',''N'',''WO W/H'')isthdh_issuefm_store_type,',
'       istlnh_po_ord_no,',
'       istlnh_rqst_no,',
'       istlnh_rqst_seq_no,',
'       ISTHDH_ISS_CODE,',
'       ISTLNH_PROCESS_ID,',
'       istlnh_sou_proc_id,',
'       func_find_proc_qry_desc(:GLOBAL_bu,istlnh_sou_proc_id,1) Process_Desc,',
'       func_find_proc_qry_desc(:GLOBAL_bu,ISTLNH_PROCESS_ID,1) TAR_Process_Desc,',
'       ISTLNH_OPRN_LN_SEQ_NO,',
'       --func_find_mfg_oper_desc(:global_bu,ISTHDH_PLNT,ISTLNH_PROCESS_ID,1) process_desc,',
'       ISTLNH_SF_CODE,',
'       ISTLNH_SOU_OPRN_SEQ,',
'       ISTLNH_SO_SCHLD_DESC,',
'       ISTLNH_SEL_FLAG,',
'       CASE WHEN ISTLNH_SEL_FLAG = ''Y'' THEN',
'    ''<input type="checkbox" id="checkbox_''||ISTLNH_DOC_NO||ISTLNH_SEQ_NO||''" checked="checked" onChange="checkanduncheck(''''''||ISTLNH_DOC_NO||ISTLNH_SEQ_NO||'''''',''''CHECKANDUNCHECK'''')"/>'' ',
'    ELSE',
'    ''<input type="checkbox" id="checkbox_''||ISTLNH_DOC_NO||ISTLNH_SEQ_NO||''" onChange="checkanduncheck(''''''||ISTLNH_DOC_NO||ISTLNH_SEQ_NO||'''''',''''CHECKANDUNCHECK'''')" />'' ',
'    END AS   select_flag,',
'    ISTHDH_DC_NO,',
'    ISTHDH_LOT_NO',
' from INV_STOCK_TRANS_VW',
'  where ISTHDH_BU = :Global_bu ',
'  AND  (ISTLNH_TRANS_QTY - ISTLNH_INPROC_QTY) > 0',
'  AND (istlnh_prod_id  LIKE  ''%''||:P9313117703_PROD_ID||''%'' OR :P9313117703_PROD_ID IS NULL)',
'  AND (func_find_prod_qry_desc(:Global_bu,istlnh_prod_id,istlnh_prod_rev,1)  LIKE  ''%''||:P9313117703_PROD_DESC||''%'' OR :P9313117703_PROD_DESC IS NULL)',
'  AND (isthdh_issueto_id  LIKE  ''%''||:P9313117703_STORE||''%'' OR :P9313117703_STORE IS NULL)',
'  AND (istlnh_po_ord_no  LIKE  ''%''||:P9313117703_PROD_NO||''%'' OR :P9313117703_PROD_NO IS NULL)',
'  AND (func_find_store_qry_desc(:Global_bu,isthdh_issueto_id,1)  LIKE  ''%''||:P9313117703_STORE_DESC||''%'' OR :P9313117703_STORE_DESC IS NULL)',
'  AND (istlnh_vou_no  LIKE  ''%''||:P9313117703_VOU_NO||''%'' OR :P9313117703_VOU_NO IS NULL)',
'  AND (isthdh_doc_no  LIKE  ''%''||:P9313117703_DOC_NO||''%'' OR :P9313117703_DOC_NO IS NULL)',
'  AND (isthdh_trans_date  =:P9313117703_DATE OR :P9313117703_DATE IS NULL)',
'  AND (istlnh_vou_type  LIKE  ''%''||:P9313117703_VOU_TYPE||''%'' OR :P9313117703_VOU_TYPE IS NULL)',
'  AND (isthdh_issueto_type = :P9313117703_RECEIVER_TYPE OR :P9313117703_RECEIVER_TYPE IS NULL)',
'  AND (ISTLNH_SEL_FLAG =:P9313117703_SHOW_REC OR :P9313117703_SHOW_REC IS NULL)',
' order by isthdh_trans_date DESC,isthdh_doc_no DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P9313117703_PROD_ID,P9313117703_STORE,P9313117703_VOU_NO,P9313117703_DOC_NO,P9313117703_DATE,P9313117703_RECEIVER_TYPE,P9313117703_PROD_DESC,P9313117703_STORE_DESC,P9313117703_VOU_TYPE,P9313117703_SHOW_REC,P9313117703_PROD_NO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'PENDING'
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
 p_id=>wwv_flow_imp.id(7251886375194680358)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1769924539651069330
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264631256528000333)
,p_db_column_name=>'DOC_NO'
,p_display_order=>3250
,p_column_identifier=>'LO'
,p_column_label=>'MIV No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7772614907040371733)
,p_db_column_name=>'ISSCODE'
,p_display_order=>3530
,p_column_identifier=>'MU'
,p_column_label=>'Iss. Code Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264631765003000338)
,p_db_column_name=>'ISSUED_BY'
,p_display_order=>3300
,p_column_identifier=>'LT'
,p_column_label=>'Issued By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7251886519004680359)
,p_db_column_name=>'ISTHDH_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Isthdh Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5687196129494771638)
,p_db_column_name=>'ISTHDH_DC_NO'
,p_display_order=>3600
,p_column_identifier=>'ND'
,p_column_label=>'DC No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7251886655478680361)
,p_db_column_name=>'ISTHDH_DOC_OPER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Isthdh Doc Oper'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7484842945483107238)
,p_db_column_name=>'ISTHDH_ISSUEFM_STORE_ID'
,p_display_order=>3450
,p_column_identifier=>'MI'
,p_column_label=>'Isthdh Issuefm Store Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264605298108000174)
,p_db_column_name=>'ISTHDH_ISSUEFM_STORE_TYPE'
,p_display_order=>660
,p_column_identifier=>'BN'
,p_column_label=>'Warehouse Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7251887569041680370)
,p_db_column_name=>'ISTHDH_ISSUER_ID'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Issuer ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7251887674071680371)
,p_db_column_name=>'ISTHDH_ISSUER_NAME'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Issuer Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7251887009343680364)
,p_db_column_name=>'ISTHDH_ISSUETO_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Receiver'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7692555305808564033)
,p_db_column_name=>'ISTHDH_ISS_CODE'
,p_display_order=>3480
,p_column_identifier=>'MN'
,p_column_label=>'Iss. Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5636902437706547865)
,p_db_column_name=>'ISTHDH_LOT_NO'
,p_display_order=>3610
,p_column_identifier=>'NE'
,p_column_label=>'Lot No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264600644054000127)
,p_db_column_name=>'ISTHDH_PLNT'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264605555947000126)
,p_db_column_name=>'ISTHDH_PLNT_LOC_ID'
,p_display_order=>680
,p_column_identifier=>'BP'
,p_column_label=>' Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264601161409000133)
,p_db_column_name=>'ISTHDH_RCPT_NO'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Rcpt. No.'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264601053637000132)
,p_db_column_name=>'ISTHDH_RCPT_PFX'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Rcpt. Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264608001571000150)
,p_db_column_name=>'ISTHDH_RECVD_BY_NAME'
,p_display_order=>920
,p_column_identifier=>'CN'
,p_column_label=>'Recvd. By Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7251887458841680369)
,p_db_column_name=>'ISTHDH_REFERENCE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7251887143932680365)
,p_db_column_name=>'ISTHDH_TRANS_DATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Trans. Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264608104429000151)
,p_db_column_name=>'ISTHDH_VOU_TYPE'
,p_display_order=>930
,p_column_identifier=>'CO'
,p_column_label=>'Vou. Type HD'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264609476306000165)
,p_db_column_name=>'ISTLNH_ACCEPTED_QTY'
,p_display_order=>1070
,p_column_identifier=>'DC'
,p_column_label=>'Accepted Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264608900693000159)
,p_db_column_name=>'ISTLNH_CONV_FACTOR'
,p_display_order=>1010
,p_column_identifier=>'CW'
,p_column_label=>'Conv. Factor'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264609379477000164)
,p_db_column_name=>'ISTLNH_DEFECT_QTY'
,p_display_order=>1060
,p_column_identifier=>'DB'
,p_column_label=>'Defect Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264630942109000329)
,p_db_column_name=>'ISTLNH_INPROC_QTY'
,p_display_order=>3210
,p_column_identifier=>'LK'
,p_column_label=>'Inproc. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
end;
/
begin
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5700976206275504458)
,p_db_column_name=>'ISTLNH_OPRN_LN_SEQ_NO'
,p_display_order=>3570
,p_column_identifier=>'MY'
,p_column_label=>'Target Oprn.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264612441598000244)
,p_db_column_name=>'ISTLNH_PO_ORD_NO'
,p_display_order=>1360
,p_column_identifier=>'EF'
,p_column_label=>'Prod. Ord. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7692555385874564034)
,p_db_column_name=>'ISTLNH_PROCESS_ID'
,p_display_order=>3490
,p_column_identifier=>'MO'
,p_column_label=>'Target Process'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264630805889000328)
,p_db_column_name=>'ISTLNH_PROC_QTY'
,p_display_order=>3200
,p_column_identifier=>'LJ'
,p_column_label=>'Proc. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264608992715000160)
,p_db_column_name=>'ISTLNH_PROD_CLS'
,p_display_order=>1020
,p_column_identifier=>'CX'
,p_column_label=>'Prod. Class'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264608761076000158)
,p_db_column_name=>'ISTLNH_PROD_UOM'
,p_display_order=>1000
,p_column_identifier=>'CV'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264609315987000163)
,p_db_column_name=>'ISTLNH_REJECTED_QTY'
,p_display_order=>1050
,p_column_identifier=>'DA'
,p_column_label=>'Rejected Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264610045334000170)
,p_db_column_name=>'ISTLNH_RQST_NO'
,p_display_order=>1120
,p_column_identifier=>'DH'
,p_column_label=>'MR No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7692555164329564032)
,p_db_column_name=>'ISTLNH_RQST_SEQ_NO'
,p_display_order=>3470
,p_column_identifier=>'MM'
,p_column_label=>'MR Line No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264634786587000368)
,p_db_column_name=>'ISTLNH_SEL_FLAG'
,p_display_order=>3440
,p_column_identifier=>'MH'
,p_column_label=>'Istlnh Sel Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7692555485867564035)
,p_db_column_name=>'ISTLNH_SF_CODE'
,p_display_order=>3500
,p_column_identifier=>'MP'
,p_column_label=>'SF Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7692555572984564036)
,p_db_column_name=>'ISTLNH_SOU_OPRN_SEQ'
,p_display_order=>3510
,p_column_identifier=>'MQ'
,p_column_label=>'Source Oprn.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7786496851591095248)
,p_db_column_name=>'ISTLNH_SOU_PROC_ID'
,p_display_order=>3540
,p_column_identifier=>'MV'
,p_column_label=>'Istlnh Sou Proc Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7755245314005971025)
,p_db_column_name=>'ISTLNH_SO_SCHLD_DESC'
,p_display_order=>3520
,p_column_identifier=>'MR'
,p_column_label=>'SO Ref.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264632326553000343)
,p_db_column_name=>'ITEM'
,p_display_order=>3360
,p_column_identifier=>'LY'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264634694709000367)
,p_db_column_name=>'ITEM_DESC'
,p_display_order=>3430
,p_column_identifier=>'MG'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5951488067972573540)
,p_db_column_name=>'ITEM_DESC1'
,p_display_order=>3590
,p_column_identifier=>'NC'
,p_column_label=>'Item Ext. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264631912281000339)
,p_db_column_name=>'LOCATION'
,p_display_order=>3310
,p_column_identifier=>'LU'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7786496964716095249)
,p_db_column_name=>'PROCESS_DESC'
,p_display_order=>3550
,p_column_identifier=>'MW'
,p_column_label=>'Sou. Process '
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264631725792000337)
,p_db_column_name=>'RECEIVED_BY'
,p_display_order=>3290
,p_column_identifier=>'LS'
,p_column_label=>'Received By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5700976831048504464)
,p_db_column_name=>'RECEIVER'
,p_display_order=>3580
,p_column_identifier=>'NA'
,p_column_label=>'Receiver'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264631397290000334)
,p_db_column_name=>'RECEIVER_WH'
,p_display_order=>3260
,p_column_identifier=>'LP'
,p_column_label=>'Receiver Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264632430536000344)
,p_db_column_name=>'REV'
,p_display_order=>3370
,p_column_identifier=>'LZ'
,p_column_label=>'Rev'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264631235351000332)
,p_db_column_name=>'ROWID'
,p_display_order=>3240
,p_column_identifier=>'LN'
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
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264632580069000346)
,p_db_column_name=>'RQST_QTY'
,p_display_order=>3390
,p_column_identifier=>'MB'
,p_column_label=>'Rqst. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264634569157000366)
,p_db_column_name=>'SELECT_FLAG'
,p_display_order=>3420
,p_column_identifier=>'MF'
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
 p_id=>wwv_flow_imp.id(7264632174992000342)
,p_db_column_name=>'SEQ_NO'
,p_display_order=>3350
,p_column_identifier=>'LX'
,p_column_label=>'Seq. No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5700976000341504456)
,p_db_column_name=>'TAR_PROCESS_DESC'
,p_display_order=>3560
,p_column_identifier=>'MX'
,p_column_label=>'Target Process'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7672706313033478461)
,p_db_column_name=>'TRANS_DATE'
,p_display_order=>3460
,p_column_identifier=>'ML'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_format_mask=>'&GLOBAL_RPT_DATE_MASK.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264632656608000347)
,p_db_column_name=>'TRANS_QTY'
,p_display_order=>3400
,p_column_identifier=>'MC'
,p_column_label=>'Trans. Qty.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264632795874000348)
,p_db_column_name=>'UNIT_COST'
,p_display_order=>3410
,p_column_identifier=>'MD'
,p_column_label=>'Unit Cost'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264632519175000345)
,p_db_column_name=>'UOM'
,p_display_order=>3380
,p_column_identifier=>'MA'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264631961031000340)
,p_db_column_name=>'VOU_NO'
,p_display_order=>3330
,p_column_identifier=>'LV'
,p_column_label=>'Vou. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7264632074851000341)
,p_db_column_name=>'VOU_SEQ_NO'
,p_display_order=>3340
,p_column_identifier=>'LW'
,p_column_label=>'Vou. Seq. No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5790450223323099557)
,p_db_column_name=>'VOU_TYPE'
,p_display_order=>3320
,p_column_identifier=>'NB'
,p_column_label=>'Vou. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7264871925085229325)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'16490551'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'DOC_NO:TRANS_DATE:VOU_TYPE:VOU_NO:VOU_SEQ_NO:ITEM:REV:ITEM_DESC:ITEM_DESC1:UOM:SELECT_FLAG:TRANS_QTY:RQST_QTY:UNIT_COST:ISTHDH_ISSUETO_ID:RECEIVER_WH:ISTHDH_DC_NO:ISTLNH_RQST_NO:ISTLNH_RQST_SEQ_NO:ISTLNH_PO_ORD_NO:PROCESS_DESC:TAR_PROCESS_DESC:ISTLNH'
||'_SF_CODE:ISTLNH_SOU_OPRN_SEQ:ISTLNH_OPRN_LN_SEQ_NO:ISTHDH_LOT_NO:ISTLNH_SO_SCHLD_DESC:ISTHDH_REFERENCE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5615840591671471413)
,p_button_sequence=>91
,p_button_plug_id=>wwv_flow_imp.id(7672449656260180167)
,p_button_name=>'Clear'
,p_static_id=>'clear'
,p_button_static_id=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5615953190397471668)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(10340804343958103331)
,p_button_name=>'Create_Receipt'
,p_static_id=>'create-receipt'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Receipt'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:9313117704:&SESSION.::&DEBUG.::P9313117704_ROWID,P9313117704_DCHD_DATE:&P9313117703_ROWID1.,&P9313117703_DCHD_DATE.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5616092767338471943)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(10343175303773771641)
,p_button_name=>'Create_Receipt1'
,p_static_id=>'create-receipt-2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Receipt'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5615836293394471395)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7251886253307680357)
,p_button_name=>'Create_Receipt_PI'
,p_static_id=>'create-receipt-pi'
,p_button_static_id=>'B1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Receipt'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5615840234834471413)
,p_button_sequence=>81
,p_button_plug_id=>wwv_flow_imp.id(7672449656260180167)
,p_button_name=>'FIND'
,p_static_id=>'find'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5615837045878471396)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7251886253307680357)
,p_button_name=>'Hide'
,p_static_id=>'hide'
,p_button_static_id=>'hid'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Show My Record'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check-square'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5615836668849471396)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(7251886253307680357)
,p_button_name=>'Show'
,p_static_id=>'show'
,p_button_static_id=>'sow'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Show My Record'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-square-o'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5616107065057471978)
,p_branch_name=>'GOTO 9313117701'
,p_branch_action=>'f?p=&APP_ID.:9313117701:&SESSION.::&DEBUG.:RP,9313117701:P9313117701_ISTHD_DOC_NO:&P9313117703_MRV_NO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(5615836293394471395)
,p_branch_sequence=>10
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(SELECT isthd_status ',
'	FROM inv_stock_trans_hd_vw',
'   WHERE isthd_bu = :global_bu',
'     AND isthd_doc_no = :P9313117703_MRV_NO) = ''N'';'))
,p_branch_condition_text=>'SQL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5616107481549471978)
,p_branch_name=>'GOTO 9313117711'
,p_branch_action=>'f?p=&APP_ID.:9313117711:&SESSION.::&DEBUG.:RP,9313117711:P9313117711_ISTHD_DOC_NO:&P9313117703_MRV_NO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(5615836293394471395)
,p_branch_sequence=>20
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(SELECT isthd_status ',
'	FROM inv_stock_trans_hd_vw',
'   WHERE isthd_bu = :global_bu',
'     AND isthd_doc_no = :P9313117703_MRV_NO) <> ''N'';'))
,p_branch_condition_text=>'SQL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7672474476774180265)
,p_name=>'P9313117703_DATE'
,p_item_sequence=>81
,p_item_plug_id=>wwv_flow_imp.id(7672449656260180167)
,p_prompt=>'Doc. Date'
,p_format_mask=>'&GLOBAL_RPT_DATE_MASK.'
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
 p_id=>wwv_flow_imp.id(10344374283217868396)
,p_name=>'P9313117703_DCHD_BU'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(10340804343958103331)
,p_item_default=>':global_bu'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10374998808088189769)
,p_name=>'P9313117703_DCHD_DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(10340804343958103331)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344372872872868382)
,p_name=>'P9313117703_DCHD_DOC_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10340804343958103331)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344372955859868383)
,p_name=>'P9313117703_DCHD_PLNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10340804343958103331)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344373096941868384)
,p_name=>'P9313117703_DCLN_PROC_QTY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(10340804343958103331)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344374415078868398)
,p_name=>'P9313117703_DCLN_PROD_ID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(10340804343958103331)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344374402758868397)
,p_name=>'P9313117703_DCLN_PROD_REV'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(10340804343958103331)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344374198976868395)
,p_name=>'P9313117703_DCLN_SEQ_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(10340804343958103331)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344391472808868420)
,p_name=>'P9313117703_DCLSD_COMPLD_QTY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10343875485145547628)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344391566903868421)
,p_name=>'P9313117703_DCLSD_INPROC_QTY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(10343875485145547628)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344391638273868422)
,p_name=>'P9313117703_DCLSD_PROC_QTY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(10343875485145547628)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344391385906868419)
,p_name=>'P9313117703_DCLSD_QTY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10343875485145547628)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344391707713868423)
,p_name=>'P9313117703_DCLSD_TRF_SEL_FLAG'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(10343875485145547628)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344391824874868424)
,p_name=>'P9313117703_DCLSD_TRF_SEL_USER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(10343875485145547628)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7672474339724180264)
,p_name=>'P9313117703_DOC_NO'
,p_item_sequence=>61
,p_item_plug_id=>wwv_flow_imp.id(7672449656260180167)
,p_prompt=>'MIV No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT isthdh_doc_no--,isthdh_trans_date',
' FROM inv_stock_trans_vw',
'WHERE istlnh_bu =:global_bu',
' -- AND isthdh_status = ''I''',
' -- AND istlnh_status = ''I''',
'  AND isthdh_issueto_type IN (''S'', ''I'', ''W'')',
'ORDER BY isthdh_doc_no  DESC',
'',
''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Doc. No.',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344514888673868681)
,p_name=>'P9313117703_GEDL_DOC_NO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(10343175303773771641)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344514711713868680)
,p_name=>'P9313117703_GEDL_PLNT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(10343175303773771641)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344514898223868682)
,p_name=>'P9313117703_GEDL_SEQ_NO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(10343175303773771641)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344515395065868686)
,p_name=>'P9313117703_GEDL_SUB_SEQ_NO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(10343175303773771641)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344515203130868685)
,p_name=>'P9313117703_GEDL_TRF_SEL_FLAG'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(10343175303773771641)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344514338040868676)
,p_name=>'P9313117703_GEHD_BU'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10343175303773771641)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344514521036868678)
,p_name=>'P9313117703_GEHD_DOC_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(10343175303773771641)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344514429073868677)
,p_name=>'P9313117703_GEHD_PLNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10343175303773771641)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7264655069125000436)
,p_name=>'P9313117703_ISTLNH_DOC_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7251886253307680357)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7264654965935000435)
,p_name=>'P9313117703_ISTLNH_SEL_FLAG'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7251886253307680357)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7264655156561000437)
,p_name=>'P9313117703_ISTLNH_SEQ_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7251886253307680357)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7264655959341000445)
,p_name=>'P9313117703_MRV_NO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7251886253307680357)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5752737117849427818)
,p_name=>'P9313117703_PROCESS_QTY'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(10340804343958103331)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7672474202226180262)
,p_name=>'P9313117703_PROD_DESC'
,p_item_sequence=>41
,p_item_plug_id=>wwv_flow_imp.id(7672449656260180167)
,p_prompt=>'Item Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(7672474089709180261)
,p_name=>'P9313117703_PROD_ID'
,p_item_sequence=>31
,p_item_plug_id=>wwv_flow_imp.id(7672449656260180167)
,p_prompt=>'Item'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5636924847477547940)
,p_name=>'P9313117703_PROD_NO'
,p_item_sequence=>111
,p_item_plug_id=>wwv_flow_imp.id(7672449656260180167)
,p_prompt=>'Prod. Ord. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT istlnh_po_ord_no r , istlnh_po_ord_no d--isthd_trans_date,isthd_plnt_loc_id,isthd_plnt_loc_name',
'   from INV_STOCK_TRANS_VW',
'  where ISTHDH_BU = :Global_bu ',
'  AND  (ISTLNH_TRANS_QTY - ISTLNH_INPROC_QTY) > 0;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5702643861438620360)
,p_name=>'P9313117703_RECEIVER_TYPE'
,p_item_sequence=>91
,p_item_plug_id=>wwv_flow_imp.id(7672449656260180167)
,p_prompt=>'Receiver Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Inter Transfer;I,Intra Transfer;S,WIP;W,Employee;E'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344255352919868096)
,p_name=>'P9313117703_ROWID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7251886253307680357)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10374998962673189771)
,p_name=>'P9313117703_ROWID1'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(10340804343958103331)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344373264963868386)
,p_name=>'P9313117703_SELECT_FLAG'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(10340804343958103331)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344515454044868687)
,p_name=>'P9313117703_SEL_USER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(10343175303773771641)
,p_item_default=>':global_user'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5816629996022032900)
,p_name=>'P9313117703_SHOW_REC'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7251886253307680357)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7672303802826032714)
,p_name=>'P9313117703_STATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7251886253307680357)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7672473868333180259)
,p_name=>'P9313117703_STORE'
,p_item_sequence=>11
,p_item_plug_id=>wwv_flow_imp.id(7672449656260180167)
,p_prompt=>'Receiver'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
,p_grid_column=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'text_case', '0',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7672474001065180260)
,p_name=>'P9313117703_STORE_DESC'
,p_item_sequence=>21
,p_item_plug_id=>wwv_flow_imp.id(7672449656260180167)
,p_prompt=>'Receiver Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344373497921868388)
,p_name=>'P9313117703_TRF_SEL_FLAG'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(10340804343958103331)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7264654269795000428)
,p_name=>'P9313117703_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7251886253307680357)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7672474318744180263)
,p_name=>'P9313117703_VOU_NO'
,p_item_sequence=>51
,p_item_plug_id=>wwv_flow_imp.id(7672449656260180167)
,p_prompt=>'Voucher No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'FIRST_ROWSET',
  'submit_when_enter_pressed', 'DIALOG',
  'subtype', 'TEXT',
  'text_case', '0',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5797494626183747353)
,p_name=>'P9313117703_VOU_TYPE'
,p_item_sequence=>101
,p_item_plug_id=>wwv_flow_imp.id(7672449656260180167)
,p_prompt=>'Vou. Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:CMR;CMR,IRSQC;IRSQC,MIV;MIV,GRN;GRN,ME;ME,SR;SR,SFR;SFR,RR;RR'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5616101533390471970)
,p_name=>'clr'
,p_static_id=>'clr'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5615840591671471413)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5616101976918471971)
,p_event_id=>wwv_flow_imp.id(5616101533390471970)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9313117703_STORE,P9313117703_STORE_DESC,P9313117703_PROD_ID,P9313117703_PROD_DESC,P9313117703_VOU_NO,P9313117703_DOC_NO,P9313117703_DATE,P9313117703_RECEIVER_TYPE,P9313117703_VOU_TYPE,P9313117703_PROD_NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5616099712633471967)
,p_name=>'issuance'
,p_static_id=>'issuance'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5615840234834471413)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5616100177092471968)
,p_event_id=>wwv_flow_imp.id(5616099712633471967)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7251886253307680357)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5616102404697471971)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5615836293394471395)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5616102857799471973)
,p_event_id=>wwv_flow_imp.id(5616102404697471971)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'request_button_name', 'Create_Receipt_PI',
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5616103276734471973)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5615836668849471396)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5616103745751471973)
,p_event_id=>wwv_flow_imp.id(5616103276734471973)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P9313117703_SHOW_REC',
  'language', 'PLSQL',
  'plsql_code', ':P9313117703_SHOW_REC :=''Y'';',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5616104266683471974)
,p_event_id=>wwv_flow_imp.id(5616103276734471973)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("hid").show();',
    'apex.item("sow").hide();',
    'apex.item("PEND").refresh();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5616104693800471974)
,p_name=>'New_1_1'
,p_static_id=>'new-3'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5615837045878471396)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5616105214123471974)
,p_event_id=>wwv_flow_imp.id(5616104693800471974)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P9313117703_SHOW_REC',
  'language', 'PLSQL',
  'plsql_code', ':P9313117703_SHOW_REC :=NULL;',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5616105718962471976)
,p_event_id=>wwv_flow_imp.id(5616104693800471974)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("sow").show();',
    'apex.item("hid").hide();',
    'apex.item("PEND").refresh();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5616106054405471976)
,p_name=>'New_2'
,p_static_id=>'new-4'
,p_event_sequence=>90
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5616106594915471976)
,p_event_id=>wwv_flow_imp.id(5616106054405471976)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("hid").hide();',
    'apex.item("sow").show();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5616100624797471970)
,p_name=>'Pending Issuance'
,p_static_id=>'pending-issuance'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7251886253307680357)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5616101123884471970)
,p_event_id=>wwv_flow_imp.id(5616100624797471970)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'overallcheck();',
    'button();')))).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5616096843187471960)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECKANDUNCHECK'
,p_static_id=>'checkanduncheck'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF APEX_APPLICATION.G_X03 = ''Y'' THEN ',
'  UPDATE inv_stock_trans_ln_hist',
'       SET istlnh_sel_flag = ''Y'',',
'           istlnh_sel_user = :GLOBAL_USER,',
'           istlnh_proc_qty = istlnh_trans_qty',
'     WHERE istlnh_bu = :GLOBAL_bu',
'			 AND istlnh_doc_no||istlnh_seq_no = APEX_APPLICATION.G_X02',
'          AND (ISTLNH_TRANS_QTY - ISTLNH_INPROC_QTY) > 0;',
'',
'ELSIF APEX_APPLICATION.G_X03 = ''N'' THEN ',
'',
'    UPDATE inv_stock_trans_ln_hist',
'       SET istlnh_sel_flag = ''N'',',
'           istlnh_sel_user = NULL,',
'           istlnh_proc_qty = 0',
'     WHERE istlnh_bu = :GLOBAL_bu',
'			 AND istlnh_doc_no||istlnh_seq_no = APEX_APPLICATION.G_X02',
'          AND (ISTLNH_TRANS_QTY - ISTLNH_INPROC_QTY) > 0;',
'',
'COMMIT;',
'',
'END IF;',
'htp.p(''success'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>134135007643860932
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5616098072255471963)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OVERALLCHECK'
,p_static_id=>'overallcheck'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' DECLARE',
'   V_FLAG    VARCHAR2 (5);',
'   V_COUNT   VARCHAR2 (10);',
'BEGIN',
'   SELECT CASE',
'             WHEN istlnh_sel_flag = ''N'' THEN ''N''',
'             WHEN istlnh_sel_flag = ''Y'' THEN ''Y''',
'             ELSE ''NY''',
'          END',
'             FLAG',
'     INTO V_FLAG',
'     FROM (  SELECT LISTAGG (DISTINCT istlnh_sel_flag, '','')',
'                       WITHIN GROUP (ORDER BY istlnh_sel_flag)',
'                       istlnh_sel_flag',
'              FROM INV_STOCK_TRANS_VW a',
'             WHERE istlnh_bu = :GLOBAL_BU',
'             AND (ISTLNH_TRANS_QTY - ISTLNH_INPROC_QTY) > 0 );',
'          ',
'  SELECT NVL(COUNT(istlnh_sel_flag),0)',
'    INTO V_COUNT',
'    FROM INV_STOCK_TRANS_VW a',
'   WHERE istlnh_bu = :GLOBAL_BU ',
'     AND istlnh_sel_flag = ''Y''',
'     AND (ISTLNH_TRANS_QTY - ISTLNH_INPROC_QTY) > 0;',
'          ',
' HTP.P (V_FLAG || ''-'' || V_COUNT || ''-'' ||APEX_APPLICATION.G_X03||'' ''|| ''Row Selected'');          ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>134136236711860935
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5616096520270471960)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for OK - pending  Issuance'
,p_static_id=>'process-for-ok-pending-issuance'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_mr_doc_no   VARCHAR(50);',
'BEGIN',
'--Raise_Application_Error(-20999,''Bala Testing'');',
'      pkg_mat_rcpt.proc_cre_mrv_frm_miv(:GLOBAL_bu,TRUNC(SYSDATE),:GLOBAL_USER,v_mr_doc_no);  ',
'',
'IF v_mr_doc_no IS NOT NULL  THEN',
'   :P9313117703_MRV_NO := TRIM(REGEXP_SUBSTR(v_mr_doc_no,''[^to"]+'',1,1));',
'END IF;',
'   	apex_application.g_print_success_message := ''Receipt Document created''||'' - ''|| v_mr_doc_no; ',
'',
'EXCEPTION WHEN OTHERS THEN',
'   proc_apex_err_msg_log(:GLOBAL_PAGE_ID,''Create MRV'');',
'END;',
'   				',
'    ',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5615836293394471395)
,p_internal_uid=>134134684726860932
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5616096079823471959)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for select flg- Pending Issuance'
,p_static_id=>'process-for-select-flg-pending-issuance'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' IF :P9313117703_ISTLNH_SEL_FLAG = ''N'' THEN',
'    UPDATE inv_stock_trans_ln_hist',
'       SET istlnh_sel_flag = ''Y'',',
'           istlnh_sel_user = :GLOBAL_USER',
'     WHERE istlnh_bu = :GLOBAL_bu',
'			 AND istlnh_doc_no = :P9313117703_ISTLNH_DOC_NO',
'			 AND istlnh_seq_no = :P9313117703_ISTLNH_SEQ_NO;',
'       ',
'ELSIF :P9313117703_ISTLNH_SEL_FLAG = ''Y'' THEN',
'',
'    UPDATE inv_stock_trans_ln_hist',
'       SET istlnh_sel_flag = ''N'',',
'           istlnh_sel_user = NULL',
'     WHERE istlnh_bu = :GLOBAL_bu',
'			 AND istlnh_doc_no = :P9313117703_ISTLNH_DOC_NO',
'			 AND istlnh_seq_no = :P9313117703_ISTLNH_SEQ_NO;',
'                 ',
'',
'END IF;',
'COMMIT;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SEL_FLAG_PI'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>134134244279860931
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5616099318111471965)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process Of Select Flag with Gate'
,p_static_id=>'process-of-select-flag-with-gate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'---raise_application_error(-20999,:P9313117703_GEHD_PLNT||''-''||:P9313117703_GEDL_DOC_NO||''-''||:P9313117703_GEDL_SEQ_NO||''-''||:P9313117703_GEDL_SUB_SEQ_NO);',
'',
'',
' IF :P9313117703_GEDL_TRF_SEL_FLAG = ''N'' THEN',
'	',
'		UPDATE gate_entry_details',
'		   SET gedl_trf_sel_flag = ''Y'',',
'		       gedl_trf_sel_user = :GLOBAL_USER',
'		 WHERE gedl_bu = :global_bu',
'		   AND gedl_plnt = :P9313117703_GEHD_PLNT',
'       AND gedl_doc_no = :P9313117703_GEHD_DOC_NO',
'       AND gedl_seq_no  = :P9313117703_GEDL_SEQ_NO',
'       AND gedl_sub_seq_no = :P9313117703_GEDL_SUB_SEQ_NO;',
'	',
'	 commit;',
'ELSIF :P9313117703_GEDL_TRF_SEL_FLAG = ''Y'' THEN',
'	',
'		UPDATE gate_entry_details',
'		   SET gedl_trf_sel_flag = ''N'',',
'		       gedl_trf_sel_user = NULL',
'		 WHERE gedl_bu = :global_bu',
'		   AND gedl_plnt = :P9313117703_GEHD_PLNT',
'       AND gedl_doc_no = :P9313117703_GEHD_DOC_NO',
'       AND gedl_seq_no  = :P9313117703_GEDL_SEQ_NO',
'       AND gedl_sub_seq_no = :P9313117703_GEDL_SUB_SEQ_NO;',
'END IF;',
'',
'commit;  '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SEL_FLAG_GATE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>134137482567860937
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5616098846952471963)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process Of Select Flag without  Gate'
,p_static_id=>'process-of-select-flag-without-gate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P9313117703_TRF_SEL_FLAG  =  ''N'' THEN',
'   :P9313117703_TRF_SEL_FLAG := ''Y'';',
'ELSE',
'   :P9313117703_TRF_SEL_FLAG := ''N'';',
'END IF; ',
'',
' BEGIN',
'  FOR i IN 1..APEX_APPLICATION.g_f03.COUNT',
'  LOOP',
'',
'    IF APEX_APPLICATION.g_f01(i) = :P9313117703_DCHD_PLNT||:P9313117703_DCHD_DOC_NO||:P9313117703_DCLN_SEQ_NO THEN	',
'',
'		IF APEX_APPLICATION.g_f03(i) IS NULL THEN',
'			RAISE_APPLICATION_ERROR(-20999,''Process quantity must be enterd'');',
'		elsif APEX_APPLICATION.g_f03(i) < 0 then',
'			RAISE_APPLICATION_ERROR(-20999,''Process quantity should be greater than zero'');',
'		END IF;',
'    --RAISE_APPLICATION_ERROR(-20999,:P9313117703_DCLN_PROC_QTY||''/''||:P9313117703_DCLN_PROD_ID||''/''||:P9313117703_DCLN_PROD_REV);',
'',
'        IF :P9313117703_TRF_SEL_FLAG = ''Y'' THEN',
'	',
'          IF func_find_prod_ser_lot_type(:GLOBAL_bu,:P9313117703_DCLN_PROD_ID,:P9313117703_DCLN_PROD_REV) <> ''N'' THEN		',
'	        DECLARE',
'		      v_ls_bal_qty		NUMBER;',
'		      v_ls_upd_qty		NUMBER;',
'	        BEGIN',
'              v_ls_bal_qty := TO_NUMBER(APEX_APPLICATION.g_f03(i));',
'	          ',
'              FOR r_ls IN (SELECT dclsd_sub_seq_no,(dclsd_qty - (dclsd_compld_qty + dclsd_inproc_qty)) bal_qty',
'                             FROM dc_lot_serial_dtls',
'                            WHERE dclsd_bu = :GLOBAL_bu',
'                              AND dclsd_plnt = :P9313117703_DCHD_PLNT',
'                              AND dclsd_doc_no = :P9313117703_DCHD_DOC_NO',
'                              AND dclsd_seq_no = :P9313117703_DCLN_SEQ_NO)',
'              LOOP',
'	  	',
'	  	        IF v_ls_bal_qty > r_ls.bal_qty THEN',
'	  	          v_ls_upd_qty := r_ls.bal_qty;',
'	  	          v_ls_bal_qty := v_ls_bal_qty - v_ls_upd_qty;',
'	  	        ELSE',
'	  	          v_ls_upd_qty := v_ls_bal_qty;',
'	  	          v_ls_bal_qty := 0;',
'	  	        END IF;',
'	  	',
'	  	        IF v_ls_upd_qty > 0 THEN',
'                  ',
'                  UPDATE dc_lot_serial_dtls',
'                     SET dclsd_proc_qty = v_ls_upd_qty,dclsd_trf_sel_flag = ''Y'',dclsd_trf_sel_user = :GLOBAL_user',
'                   WHERE dclsd_bu = :P9313117703_DCHD_BU',
'                     AND dclsd_plnt = :P9313117703_DCHD_PLNT',
'                     AND dclsd_doc_no = :P9313117703_DCHD_DOC_NO',
'	                 AND dclsd_seq_no = :P9313117703_DCLN_SEQ_NO',
'                     AND dclsd_sub_seq_no = r_ls.dclsd_sub_seq_no;',
'	  	        END IF;',
'	  	',
'	  	        EXIT WHEN v_ls_bal_qty = 0;',
'	          END LOOP;',
'	        END;',
'	      END IF;',
'	',
' 	      UPDATE dc_ln',
'             SET dcln_proc_qty = TO_NUMBER(APEX_APPLICATION.g_f03(i)),',
'	             dcln_trf_sel_flag = ''Y'',',
'	             dcln_trf_sel_user = :GLOBAL_user',
'           WHERE dcln_bu = :P9313117703_DCHD_BU',
'             AND dcln_plnt = :P9313117703_DCHD_PLNT',
'             AND dcln_doc_no = :P9313117703_DCHD_DOC_NO',
'	         AND dcln_seq_no = :P9313117703_DCLN_SEQ_NO;',
'  	',
'        ELSIF :P9313117703_TRF_SEL_FLAG = ''N'' THEN',
'	      ',
'          UPDATE dc_lot_serial_dtls',
'             SET dclsd_proc_qty = 0,dclsd_trf_sel_flag = ''N'',dclsd_trf_sel_user = NULL',
'           WHERE dclsd_bu = :P9313117703_DCHD_BU',
'             AND dclsd_plnt = :P9313117703_DCHD_PLNT',
'             AND dclsd_doc_no = :P9313117703_DCHD_DOC_NO',
'	         AND dclsd_seq_no = :P9313117703_DCLN_SEQ_NO;',
'',
'	      UPDATE dc_ln',
'             SET dcln_proc_qty = 0,',
'	             dcln_trf_sel_flag = ''N'',',
'	             dcln_trf_sel_user = NULL',
'           WHERE dcln_bu = :P9313117703_DCHD_BU',
'             AND dcln_plnt = :P9313117703_DCHD_PLNT',
'             AND dcln_doc_no = :P9313117703_DCHD_DOC_NO',
'	         AND dcln_seq_no = :P9313117703_DCLN_SEQ_NO;',
' ',
'      END IF;    ',
'',
'    END IF;',
'',
'  END LOOP;	',
'  Commit;',
'END; '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SEL_FLAG'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>134137011408860935
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5616098477956471963)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process Of  With  Gate Create Receipt'
,p_static_id=>'process-of-with-gate-create-receipt'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE     ',
'   v_count  NUMBER(10);',
'   v_res    VARCHAR2(30000);',
'   ',
'BEGIN',
'	SELECT count(*)',
'	  INTO v_count',
'	  FROM mat_trf_pend_ge_view',
'	 WHERE gehd_bu = :global_bu',
'	   AND gedl_trf_sel_user = :global_user',
'	   AND gedl_trf_sel_flag =''Y'';',
'	   ',
'	  ',
'	  IF v_count > 0 THEN',
'	  		 pkg_mat_rcpt.proc_cre_mr_frm_mat_trf_ge(:global_bu,TRUNC(SYSDATE),:global_user,v_res);',
'	  		 commit;',
'	  	ELSE',
'	  		RAISE_APPLICATION_ERROR(-20999,''Select atleast  one Document to Process.'');	  	',
'	  	END IF;',
'	  	',
'	  	IF v_res IS NOT NULL THEN',
'	  		RAISE_APPLICATION_ERROR(-20999,''Material receipt voucher created - '');',
'	  	END IF;',
'	  	',
'	  	',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5616092767338471943)
,p_internal_uid=>134136642412860935
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5616097273965471962)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SELECTALL'
,p_static_id=>'selectall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'v_doc_no    VARCHAR2(30);',
'v_seq_no    NUMBER(5);',
'v_error     VARCHAR2 (1000);',
'TYPE PENDPAY IS REF CURSOR;',
'   PAY_CURSOR PENDPAY;',
'BEGIN',
'  FOR i in 1..APEX_APPLICATION.G_F01.COUNT',
'   LOOP  ',
'  UPDATE inv_stock_trans_ln_hist',
'     SET istlnh_sel_user = :GLOBAL_USER,',
'         istlnh_proc_qty = APEX_APPLICATION.G_F01(i)',
'   WHERE istlnh_bu = :GLOBAL_bu',
'     AND (ISTLNH_TRANS_QTY - ISTLNH_INPROC_QTY) > 0',
'     AND (istlnh_doc_no = :P9313117703_DOC_NO OR :P9313117703_DOC_NO IS NULL)',
'     AND (istlnh_vou_no = :P9313117703_VOU_NO OR :P9313117703_VOU_NO IS NULL)',
'     AND istlnh_doc_no||istlnh_seq_no = APEX_APPLICATION.G_F02(i);',
'END LOOP;',
'',
'OPEN PAY_CURSOR FOR      ''SELECT istlnh_doc_no,',
'                                 istlnh_seq_no',
'                            from INV_STOCK_TRANS_VW',
'                           where ISTHDH_BU = ''''''||:Global_bu||'''''' ',
'                             AND  (ISTLNH_TRANS_QTY - ISTLNH_INPROC_QTY) > ''''''||0||''''''',
'                             AND (istlnh_vou_no = ''''''||:P9313117703_VOU_NO||'''''' OR ''''''||:P9313117703_VOU_NO||'''''' IS NULL)',
'                             AND (istlnh_doc_no = ''''''||:P9313117703_DOC_NO||'''''' OR ''''''||:P9313117703_DOC_NO||'''''' IS NULL)',
'                             AND '' ||FUNC_FIND_IR_CONDITION_EXPRESSION( 9011, 9313117703,''PENDING'', :APP_SESSION);',
'LOOP',
'       FETCH PAY_CURSOR ',
'	     INTO v_doc_no,',
'             v_seq_no;',
'             proc_debug_proc(''MRSH ''||v_doc_no);',
'       EXIT WHEN PAY_CURSOR%notfound; ',
'',
'  UPDATE inv_stock_trans_ln_hist',
'     SET istlnh_sel_flag = ''Y'',',
'         istlnh_sel_user = :GLOBAL_USER,',
'         istlnh_proc_qty = (ISTLNH_TRANS_QTY - ISTLNH_INPROC_QTY)',
'   WHERE istlnh_bu = :GLOBAL_bu',
'     AND (ISTLNH_TRANS_QTY - ISTLNH_INPROC_QTY) > 0',
'     AND istlnh_sel_flag =''N''',
'     AND (istlnh_doc_no = :P9313117703_DOC_NO OR :P9313117703_DOC_NO IS NULL)',
'     AND (istlnh_vou_no = :P9313117703_VOU_NO OR :P9313117703_VOU_NO IS NULL)',
'     AND istlnh_doc_no = v_doc_no',
'     AND istlnh_seq_no = v_seq_no;',
'',
'END LOOP;  ',
'   ',
'CLOSE PAY_CURSOR;',
'COMMIT;',
'htp.p(''success'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>134135438421860934
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5616097663859471962)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UNSELECTALL'
,p_static_id=>'unselectall'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'  UPDATE inv_stock_trans_ln_hist',
'       SET istlnh_sel_flag = ''N'',',
'           istlnh_sel_user = NULL,',
'           istlnh_proc_qty = 0',
'     WHERE istlnh_bu = :GLOBAL_bu',
'          AND (ISTLNH_TRANS_QTY - ISTLNH_INPROC_QTY) > 0;',
'',
'COMMIT;',
'htp.p(''success'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>134135828315860934
);
wwv_flow_imp.component_end;
end;
/
