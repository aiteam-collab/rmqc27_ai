prompt --application/pages/page_2361310101
begin
--   Manifest
--     PAGE: 2361310101
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
 p_id=>2361310101
,p_name=>'Doc. Approval'
,p_alias=>'DOC-APPROVAL2'
,p_step_title=>'Doc. Approval'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<script>',
'function ckChange(ckType){',
'    var ckName = document.getElementsByName(ckType.name);',
'    var checked = document.getElementById(ckType.id);',
'',
'    if (checked.checked) {',
'      for(var i=0; i < ckName.length; i++){',
'',
'          if(!ckName[i].checked){',
'              ckName[i].disabled = true;',
'          }else{',
'              ckName[i].disabled = false;',
'          }',
'      } ',
'    }',
'    else {',
'      for(var i=0; i < ckName.length; i++){',
'        ckName[i].disabled = false;',
'      } ',
'    }    ',
'}',
'</script>'))
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Button--warning:not(.t-Button--simple):not(.t-Button--hot), .t-Button--warning:not(.t-Button--simple):not(.t-Button--hot):active, .t-Button--warning:not(.t-Button--simple):not(.t-Button--hot).is-active {',
'    background-color: #795548d4;',
'    color: ghostwhite;',
'}',
'',
'/* For Report Header */',
'.a-IRR-table {',
'    border-collapse: collapse;',
'    table-layout: auto;',
'    border-spacing: 0;',
'    white-space: nowrap;',
'    word-wrap: break-word;',
'}/*Scroll at top*/',
'.t-fht-thead {',
'    overflow: auto !important;',
'}',
'.t-Form-radioLabel, .t-Form-inputContainer .radio_group label, .t-Form-checkboxLabel, .t-Form-inputContainer .checkbox_group label, .t-Form-label, .u-Form-label {',
'    color: #038cf9;',
'}',
'',
'',
'.t-Form-fieldContainer--floatingLabel .apex-item-select, .t-Form-fieldContainer--floatingLabel .apex-item-text {',
'    font-size: 1.2rem;',
'    font-family: Arial;',
'    color:  black;/*#038cf9;*/',
'}',
'',
'',
'.t-Form-fieldContainer--radioButtonGroup .apex-item-group--rc input:checked + label, .apex-button-group input:checked + label {',
'    border-color: #607D8B;',
'     /* border-top-style: solid;*/',
'    background-color: #fbf7cf;/*#01c3dc;*/',
'    color: #377e54;',
'    box-shadow: none;',
'}',
'/*selectlist*/',
'.apex-item-textarea, .apex-item-text, .apex-item-select, .apex-item-multi, select.listmanager {',
'     color: black; ',
'    background-color: #f9f9f9;',
'    border-color: #dfdfdf;',
'}',
'/* differ color for link*//*',
'#head.a-IRR-header {',
'    background-color: #ecece8;',
'    border-top: 1px solid #e6e6e6;',
'    box-shadow: inset 1px 0 0 0 #e6e6e6;',
'}',
'',
'',
'.a-IRR-header {',
'    background-color: #fcedff;',
'    border-top: 1px solid #e6e6e6;',
'    box-shadow: inset 1px 0 0 0 #e6e6e6;',
'}',
'',
'#head.a-IRR-header {',
'    background-color: #a8d9bc;',
'    border-top: 1px solid #e6e6e6;',
'    box-shadow: inset 1px 0 0 0 #e6e6e6;',
'   }',
'.a-IRR-header {',
'     background-color: #fbf7cf;',
'    border-top: 1px solid #e6e6e6;',
'    box-shadow: inset 1px 0 0 0 #e6e6e6;',
'   }*/',
'/* border for report overall*/',
'.a-IRR-table tr td {',
'    background-color: #ffffff;',
'    color: #262626;',
'    border: ridge;',
'}',
'',
'',
'/*.a-IRR-headerLabel, .a-IRR-headerLink {',
'    padding: 12px;',
'    display: block;',
'     color: cornflowerblue; ',
'    background-color: #fbf7cf;',
'    text-align: inherit;',
'     border: ridge;',
'}*/',
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(27576232200097877843)
,p_plug_name=>'Message'
,p_static_id=>'message'
,p_region_name=>'SUB'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(42705155149974501317)
,p_plug_name=>'Workflow new'
,p_static_id=>'workflow-new'
,p_region_name=>'myreport'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>80
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 1/27/2021 5:04:44 PM (QP5 v5.163.1008.3004) */',
'  SELECT "WFDC_BU",',
'         "WFDC_TYPE",',
'         WFDC_DOC_PFX,',
'         WFDC_DOC_NO,',
'         WFDC_DOC_PFX "Pfx.",',
'         (WFDC_DOC_PFX || ''  '' || WFDC_DOC_NO) "No.",',
'         "WFDC_STATUS",',
'         "WFDC_CTRL_PERSON",',
'         "WFDC_SPPLR_ID",',
'         "WFDC_CUST_ID",',
'         "WFDC_LVL1",',
'         "WFDC_LVL2",',
'         "WFDC_LVL3",',
'         "WFDC_LVL4",',
'         "WFDC_ACCTS",',
'         "WFDC_PRJ_ID",',
'         "WFDC_RND_PRJ_ID",',
'         WFDC_VALUE "Value",',
'         "WFDC_JRNL_TYPE",',
'         "WFDC_FRWD_RTN",',
'         "WFDC_PO_MODE",',
'         "WFDC_MESSAGE",',
'         "WFDC_SEQ_NO",',
'         "WFDC_ACTION_DATE",',
'         "WFDC_QC_REV",',
'         "WFDC_QC_INS_MODE",',
'         "WFDC_PROD_ID",',
'         "WFDC_PROD_REV",',
'         "WFDC_PRIORITY",',
'         "WFDC_WF_NO",',
'         "WFDC_DOC_SFX",',
'         "WFDC_WRK_CNTR",',
'         "WFDC_PLNT",',
'         "WFDC_SELECT_FLAG",',
'         "WFDC_MAIL_FLAG",',
'         "WFDC_INT_MSG_FLAG",',
'         "WFDC_SMS_FLAG",',
'         "WFDC_CRE_BY",',
'         "WFDC_CRE_DATE",',
'         "WFDC_UPD_BY",',
'         "WFDC_UPD_DATE",',
'         WFDC_FWD_PERSON ,',
'         WFDC_DOC_BRIEF "Doc. Detail",',
'         "WFDC_FWD_TO",',
'         "WFDC_NXT_STATUS",',
'         "WFDC_ACT",',
'         WFDC_NXT_FWD_PERSON,',
'         func_find_employee_desc1 (',
'            wfdc_bu,',
'            (SELECT appluser_emp_id',
'               FROM appl_users',
'              WHERE appluser_bu = wfdc_bu AND appluser_id = wfdc_fwd_person),',
'            1)',
'           "Fwd. By",',
'         "WFDC_NXT_MESSAGE",',
'         WFDC_FWD_ON "Fwd. Date",',
'         nvl(ROUND (TO_DATE (SYSDATE) - WFDC_FWD_ON),0) "Time Elasped",',
'         WFDC_SRC_BU,',
'         WFDC_SRC_PLNT,',
'         WFDC_SRC_BU "Entity",',
'         WFDC_SRC_PLNT "Plant",',
'         NVL (',
'            (SELECT bup_name1',
'               FROM business_units, bus_unit_plants, appl_user_plant_access',
'              WHERE     bup_bu = bu_id',
'                    AND bup_bu = auba_bu',
'                    AND bup_plant_id = auba_plant',
'                    AND auba_user_id = :GLOBAL_user',
'                    --AND (TRUNC(sysdate) BETWEEN auba_from AND auba_to',
'                    AND bup_plant_id = WFDC_SRC_PLNT),',
'            WFDC_SRC_PLNT)',
'            "Unit",',
'         (SELECT INITCAP (wf_bus_proc_desc)',
'            FROM WORK_FLOW',
'           WHERE WF_BU = wfdc_BU AND wf_bus_proc_id = WFDC_TYPE)',
'            "Doc.Type",',
'         (SELECT DISTINCT suplr_name1 wfdc_benf_name',
'            FROM suppliers',
'           WHERE     suplr_bu = wfdc_bu',
'                 AND suplr_suplr_id = wfdc_benf_id',
'                 AND wfdc_benf_type = ''S''',
'                 AND wfdc_benf_id IS NOT NULL',
'                 AND wfdc_bu = :GLOBAL_bu',
'          UNION ALL',
'          SELECT DISTINCT cust_name1 wfdc_benf_name',
'            FROM customers',
'           WHERE     cust_bu = wfdc_bu',
'                 AND cust_cust_id = wfdc_benf_id',
'                 AND wfdc_benf_type = ''C''',
'                 AND wfdc_benf_id IS NOT NULL',
'                 AND wfdc_bu = :GLOBAL_bu)',
'            "Party",',
'         "WFDC_NXT_FWD_ENTITY",',
'         "WFDC_SRC_USER",',
'         "WFDC_NXT_FWD_PLNT",',
'         "WFDC_MAIL_SEND_FLAG",',
'         WFDC_DOC_DATE "Doc. Date",',
'         "WFDC_LVL_PRJ",',
'         "WFDC_AUTH_TYPE",',
'         "WFDC_DISC_PCT",',
'         "WFDC_BENF_TYPE",',
'         "WFDC_BENF_ID",',
'         "WFDC_BILL_DATE",',
'         "WFDC_BILL_NO",',
'         "WFDC_GROSS_AMT",',
'         "WFDC_TAX_AMT",',
'         "WFDC_BILL_AMT",',
'         "WFDC_INV_PFX",',
'         "WFDC_INV_NO",',
'         "WFDC_EMP_ID",',
'         APEX_ITEM.checkbox2 (',
'            p_idx              => 1,',
'            p_value            => wfdc_wf_no || wfdc_select_flag,',
'            p_checked_values   => DECODE (wfdc_wf_no || wfdc_select_flag,',
'                                          wfdc_wf_no || ''1'', wfdc_wf_no || ''1''))',
'            Appr,',
'         CASE',
'            WHEN wfdc_select_flag = 0',
'            THEN',
'               ''<span class="fa fa-square-o" aria-hidden="true"></span>''',
'            ELSE',
'               ''<span class="fa fa-check-square-o" style = "color:blue;background-color:#a5e1fe";; aria-hidden="true"></span>''',
'         END',
'            "select",',
'         ''<span class="fa fa-history"  style = "color:#ff9800 ;" aria-hidden="true"></span>''',
'            hist,',
'         ''<span aria-hidden="true" style =  "color: #088def;" class="fa fa-info-circle-o"></span>''',
'            dtls,',
'         ''<span aria-hidden="true" style = "color: #673ab7;" class="fa fa-file-text-o"></span>''',
'            Doc',
'    FROM "WORK_FLOW_DOC_CONTROL"',
'   WHERE WFDC_BU = :global_bu',
'         AND (WFDC_TYPE = :P2361310101_TYPE OR :P2361310101_TYPE IS NULL)',
'         AND (wfdc_auth_type = ''P''',
'              AND wfdc_ctrl_person =',
'                     func_find_position_id (:global_bu, :global_user)',
'              OR wfdc_auth_type = ''E''',
'                 AND wfdc_ctrl_person =',
'                        func_find_emp_id (:global_bu, :global_user))',
'         AND (wfdc_type, wfdc_status) NOT IN',
'                (SELECT WFAA_WF_ID, WFAA_STATUS',
'                   FROM WORK_FLOW_APPR_ACTVT',
'                  WHERE WFAA_BU = :GLOBAL_BU',
'                        AND (WFAA_WF_ID, WFAA_SEQ_NO) IN',
'                               (  SELECT WFAA_WF_ID,',
'                                         MAX (WFAA_SEQ_NO) WFAA_SEQ_NO',
'                                    FROM WORK_FLOW_APPR_ACTVT',
'                                   WHERE WFAA_BU = :GLOBAL_BU',
'                                GROUP BY WFAA_WF_ID))',
'         AND wfdc_status NOT IN (''C'', ''R'', ''S'')',
'ORDER BY WFDC_PRIORITY, WFDC_ACTION_DATE DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P2361310101_WFDC_TYPE'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Workflow new'
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
 p_id=>wwv_flow_imp.id(42721763493526943498)
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
,p_internal_uid=>36577921464120422237
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641556927067222548)
,p_db_column_name=>'APPR'
,p_display_order=>980
,p_column_identifier=>'CW'
,p_column_label=>'&nbsp;'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641558485741222551)
,p_db_column_name=>'DOC'
,p_display_order=>1020
,p_column_identifier=>'DA'
,p_column_label=>'Doc.'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_static_id=>'head'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641558069500222550)
,p_db_column_name=>'DTLS'
,p_display_order=>1010
,p_column_identifier=>'CZ'
,p_column_label=>'Dtls.'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_static_id=>'head'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641560430562222554)
,p_db_column_name=>'Doc. Date'
,p_display_order=>1070
,p_column_identifier=>'DF'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641560890981222556)
,p_db_column_name=>'Doc. Detail'
,p_display_order=>1080
,p_column_identifier=>'DG'
,p_column_label=>'Doc. Details'
,p_column_html_expression=>'<div style="width: 280px; word-wrap: break-word;">#Doc. Detail#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641556093487222546)
,p_db_column_name=>'Doc.Type'
,p_display_order=>800
,p_column_identifier=>'CB'
,p_column_label=>'Doc. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641554847752222543)
,p_db_column_name=>'Entity'
,p_display_order=>750
,p_column_identifier=>'BW'
,p_column_label=>'Entity'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641561693897222557)
,p_db_column_name=>'Fwd. By'
,p_display_order=>1090
,p_column_identifier=>'DH'
,p_column_label=>'Fwd. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641562074535222559)
,p_db_column_name=>'Fwd. Date'
,p_display_order=>1100
,p_column_identifier=>'DI'
,p_column_label=>'Fwd. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641557630530222550)
,p_db_column_name=>'HIST'
,p_display_order=>1000
,p_column_identifier=>'CY'
,p_column_label=>'Log'
,p_column_link=>'javascript:$s(''P236131010_WFDC_SRC_BU'',''#WFDC_SRC_BU#''),$s(''P236131010_WFDC_SRC_PLNT'',''#WFDC_SRC_PLNT#''),$s(''P236131010_WFDC_DOC_NO'',''#WFDC_DOC_NO#''),$s(''P236131010_WFDC_DOC_PFX'',''#WFDC_DOC_PFX#''),$s(''P236131010_WFDC_TYPE'',''#WFDC_TYPE#'') ;  apex.subm'
||'it(''LOG'');'
,p_column_linktext=>'#HIST#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_static_id=>'head'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641554126895222542)
,p_db_column_name=>'No.'
,p_display_order=>700
,p_column_identifier=>'BR'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641555650570222545)
,p_db_column_name=>'Party'
,p_display_order=>780
,p_column_identifier=>'BZ'
,p_column_label=>'Party'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641553634321222542)
,p_db_column_name=>'Pfx.'
,p_display_order=>690
,p_column_identifier=>'BQ'
,p_column_label=>'Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641555240615222545)
,p_db_column_name=>'Plant'
,p_display_order=>760
,p_column_identifier=>'BX'
,p_column_label=>'Unit ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641562463027222559)
,p_db_column_name=>'Time Elasped'
,p_display_order=>1110
,p_column_identifier=>'DJ'
,p_column_label=>'Time Lapsed'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641562883761222561)
,p_db_column_name=>'Unit'
,p_display_order=>1120
,p_column_identifier=>'DK'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641554513458222543)
,p_db_column_name=>'Value'
,p_display_order=>710
,p_column_identifier=>'BS'
,p_column_label=>'Doc. Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641534891053222504)
,p_db_column_name=>'WFDC_ACCTS'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Wfdc Accts'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641546074790222526)
,p_db_column_name=>'WFDC_ACT'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Wfdc Act'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641538125742222511)
,p_db_column_name=>'WFDC_ACTION_DATE'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Wfdc Action Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641548841075222531)
,p_db_column_name=>'WFDC_AUTH_TYPE'
,p_display_order=>570
,p_column_identifier=>'BE'
,p_column_label=>'Wfdc Auth Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641550073242222534)
,p_db_column_name=>'WFDC_BENF_ID'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Wfdc Benf Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641549700904222534)
,p_db_column_name=>'WFDC_BENF_TYPE'
,p_display_order=>590
,p_column_identifier=>'BG'
,p_column_label=>'Wfdc Benf Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641552100441222539)
,p_db_column_name=>'WFDC_BILL_AMT'
,p_display_order=>650
,p_column_identifier=>'BM'
,p_column_label=>'Wfdc Bill Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641550486560222536)
,p_db_column_name=>'WFDC_BILL_DATE'
,p_display_order=>610
,p_column_identifier=>'BI'
,p_column_label=>'Wfdc Bill Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641550886669222536)
,p_db_column_name=>'WFDC_BILL_NO'
,p_display_order=>620
,p_column_identifier=>'BJ'
,p_column_label=>'Wfdc Bill No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641530859277222495)
,p_db_column_name=>'WFDC_BU'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Wfdc Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641543722342222521)
,p_db_column_name=>'WFDC_CRE_BY'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Wfdc Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641544065483222521)
,p_db_column_name=>'WFDC_CRE_DATE'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Wfdc Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641532125332222498)
,p_db_column_name=>'WFDC_CTRL_PERSON'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Wfdc Ctrl Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641532890899222500)
,p_db_column_name=>'WFDC_CUST_ID'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Wfdc Cust Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641549321223222532)
,p_db_column_name=>'WFDC_DISC_PCT'
,p_display_order=>580
,p_column_identifier=>'BF'
,p_column_label=>'Wfdc Disc Pct'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641559237870222553)
,p_db_column_name=>'WFDC_DOC_NO'
,p_display_order=>1040
,p_column_identifier=>'DC'
,p_column_label=>'Wfdc Doc No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641558852765222551)
,p_db_column_name=>'WFDC_DOC_PFX'
,p_display_order=>1030
,p_column_identifier=>'DB'
,p_column_label=>'Wfdc Doc Pfx'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641540880372222515)
,p_db_column_name=>'WFDC_DOC_SFX'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Wfdc Doc Sfx'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641553230707222540)
,p_db_column_name=>'WFDC_EMP_ID'
,p_display_order=>680
,p_column_identifier=>'BP'
,p_column_label=>'Wfdc Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641536517550222507)
,p_db_column_name=>'WFDC_FRWD_RTN'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Wfdc Frwd Rtn'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641561302781222556)
,p_db_column_name=>'WFDC_FWD_PERSON'
,p_display_order=>1130
,p_column_identifier=>'DL'
,p_column_label=>'Wfdc Fwd Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641545281404222525)
,p_db_column_name=>'WFDC_FWD_TO'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Wfdc Fwd To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641551314544222537)
,p_db_column_name=>'WFDC_GROSS_AMT'
,p_display_order=>630
,p_column_identifier=>'BK'
,p_column_label=>'Wfdc Gross Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641542870949222520)
,p_db_column_name=>'WFDC_INT_MSG_FLAG'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Wfdc Int Msg Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641552925402222540)
,p_db_column_name=>'WFDC_INV_NO'
,p_display_order=>670
,p_column_identifier=>'BO'
,p_column_label=>'Wfdc Inv No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641552472848222539)
,p_db_column_name=>'WFDC_INV_PFX'
,p_display_order=>660
,p_column_identifier=>'BN'
,p_column_label=>'Wfdc Inv Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641536119111222506)
,p_db_column_name=>'WFDC_JRNL_TYPE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Wfdc Jrnl Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641533284767222501)
,p_db_column_name=>'WFDC_LVL1'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Wfdc Lvl1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641533650411222501)
,p_db_column_name=>'WFDC_LVL2'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Wfdc Lvl2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641534065567222503)
,p_db_column_name=>'WFDC_LVL3'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Wfdc Lvl3'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641534503512222503)
,p_db_column_name=>'WFDC_LVL4'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Wfdc Lvl4'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641548458871222531)
,p_db_column_name=>'WFDC_LVL_PRJ'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Wfdc Lvl Prj'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641542441190222518)
,p_db_column_name=>'WFDC_MAIL_FLAG'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Wfdc Mail Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641548048992222529)
,p_db_column_name=>'WFDC_MAIL_SEND_FLAG'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Wfdc Mail Send Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641537238685222509)
,p_db_column_name=>'WFDC_MESSAGE'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Wfdc Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641546840830222528)
,p_db_column_name=>'WFDC_NXT_FWD_ENTITY'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'Wfdc Nxt Fwd Entity'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641556494828222546)
,p_db_column_name=>'WFDC_NXT_FWD_PERSON'
,p_display_order=>810
,p_column_identifier=>'CC'
,p_column_label=>'Wfdc Nxt Fwd Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641547724619222529)
,p_db_column_name=>'WFDC_NXT_FWD_PLNT'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Wfdc Nxt Fwd Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641546526959222526)
,p_db_column_name=>'WFDC_NXT_MESSAGE'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Wfdc Nxt Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641545672428222525)
,p_db_column_name=>'WFDC_NXT_STATUS'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Wfdc Nxt Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641541677301222517)
,p_db_column_name=>'WFDC_PLNT'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Wfdc Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641536845111222507)
,p_db_column_name=>'WFDC_PO_MODE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Wfdc Po Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641540113885222514)
,p_db_column_name=>'WFDC_PRIORITY'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Wfdc Priority'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641535245173222504)
,p_db_column_name=>'WFDC_PRJ_ID'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Wfdc Prj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641539233358222512)
,p_db_column_name=>'WFDC_PROD_ID'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Wfdc Prod Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641539669395222514)
,p_db_column_name=>'WFDC_PROD_REV'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Wfdc Prod Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641538895471222512)
,p_db_column_name=>'WFDC_QC_INS_MODE'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Wfdc Qc Ins Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641538480045222511)
,p_db_column_name=>'WFDC_QC_REV'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Wfdc Qc Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641535701810222506)
,p_db_column_name=>'WFDC_RND_PRJ_ID'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Wfdc Rnd Prj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641542118185222518)
,p_db_column_name=>'WFDC_SELECT_FLAG'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Wfdc Select Flag'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641537646899222509)
,p_db_column_name=>'WFDC_SEQ_NO'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Wfdc Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641543314219222520)
,p_db_column_name=>'WFDC_SMS_FLAG'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Wfdc Sms Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641532501952222498)
,p_db_column_name=>'WFDC_SPPLR_ID'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Wfdc Spplr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641559637515222553)
,p_db_column_name=>'WFDC_SRC_BU'
,p_display_order=>1050
,p_column_identifier=>'DD'
,p_column_label=>'Wfdc Src Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641560062899222554)
,p_db_column_name=>'WFDC_SRC_PLNT'
,p_display_order=>1060
,p_column_identifier=>'DE'
,p_column_label=>'Wfdc Src Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641547251663222528)
,p_db_column_name=>'WFDC_SRC_USER'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Wfdc Src User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641531661813222496)
,p_db_column_name=>'WFDC_STATUS'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Wfdc Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641551686025222537)
,p_db_column_name=>'WFDC_TAX_AMT'
,p_display_order=>640
,p_column_identifier=>'BL'
,p_column_label=>'Wfdc Tax Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641531256180222496)
,p_db_column_name=>'WFDC_TYPE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Wfdc Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641544498737222523)
,p_db_column_name=>'WFDC_UPD_BY'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Wfdc Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641544918930222523)
,p_db_column_name=>'WFDC_UPD_DATE'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Wfdc Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641540461966222515)
,p_db_column_name=>'WFDC_WF_NO'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Wfdc Wf No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641541290472222517)
,p_db_column_name=>'WFDC_WRK_CNTR'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Wfdc Wrk Cntr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641557306551222548)
,p_db_column_name=>'select'
,p_display_order=>990
,p_column_identifier=>'CX'
,p_column_label=>'Select'
,p_column_link=>'javascript:apex.event.trigger(document, ''myreport'', [{WFDC_WF_NO:''#WFDC_WF_NO#'',WFDC_SELECT_FLAG:''#WFDC_SELECT_FLAG#''}]);void(0);'
,p_column_linktext=>'#select#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_static_id=>'head'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(42721827942959950911)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'54977212'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'select:Entity:Unit:Doc.Type:No.:Doc. Date:Doc. Detail:Value:Fwd. By:Fwd. Date:Time Elasped:DTLS:DOC:HIST'
,p_sort_column_1=>'ROWNUM'
,p_sort_direction_1=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11641564113837222562)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(42705155149974501317)
,p_button_name=>'Approval'
,p_static_id=>'approval'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Approval'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11641586893248225863)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(42705155149974501317)
,p_button_name=>'Approve'
,p_static_id=>'approve'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Approve'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11641587175241225866)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(42705155149974501317)
,p_button_name=>'Cancel'
,p_static_id=>'cancel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--danger'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Cancel'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11641586984848225864)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(42705155149974501317)
,p_button_name=>'Forward'
,p_static_id=>'forward'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Forward'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11641566820134222568)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(27576232200097877843)
,p_button_name=>'Ok'
,p_static_id=>'ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Process'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11641587099201225865)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(42705155149974501317)
,p_button_name=>'Return'
,p_static_id=>'return'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--warning'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Return'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11641563690254222562)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(42705155149974501317)
,p_button_name=>'Select'
,p_static_id=>'select'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Select/Unselect All'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11641587299379225867)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(42705155149974501317)
,p_button_name=>'Wait'
,p_static_id=>'wait'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Wait'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(11641584945951222582)
,p_branch_name=>'Go To Page 236131010'
,p_branch_action=>'javascript:openModal(''SUB'');'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(11641564113837222562)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(11641585334094222582)
,p_branch_name=>'Go To Page 23613101001'
,p_branch_action=>'f?p=&APP_ID.:23613101001:&SESSION.::&DEBUG.:RP,23613101001:P23613101001_DOC_BU,P23613101001_DOC_NO,P23613101001_DOC_PFX,P23613101001_PLNT,P23613101001_WF_TYPE:&P2361310101_WFDC_SRC_BU.,&P2361310101_WFDC_DOC_NO.,&P2361310101_WFDC_DOC_PFX.,&P2361310101_WFDC_SRC_PLNT.,&P2361310101_WFDC_TYPE.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>11
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'LOG'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641564835980222564)
,p_name=>'P2361310101_COUNT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(42705155149974501317)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT COUNT (*)',
'  FROM WORK_FLOW_DOC_CONTROL',
' WHERE WFDC_BU = :global_bu AND WFDC_SELECT_FLAG = 1',
'       AND (wfdc_auth_type = ''P''',
'            AND wfdc_ctrl_person =',
'                   func_find_position_id (:global_bu, :global_user)',
'            OR wfdc_auth_type = ''E''',
'               AND wfdc_ctrl_person =',
'                      func_find_emp_id (:global_bu, :global_user))',
'       AND (wfdc_type, wfdc_status) NOT IN',
'              (SELECT WFAA_WF_ID, WFAA_STATUS',
'                 FROM WORK_FLOW_APPR_ACTVT',
'                WHERE WFAA_BU = :GLOBAL_BU',
'                      AND (WFAA_WF_ID, WFAA_SEQ_NO) IN',
'                             (  SELECT WFAA_WF_ID,',
'                                       MAX (WFAA_SEQ_NO) WFAA_SEQ_NO',
'                                  FROM WORK_FLOW_APPR_ACTVT',
'                                 WHERE WFAA_BU = :GLOBAL_BU',
'                              GROUP BY WFAA_WF_ID))',
'       AND wfdc_status NOT IN (''C'', ''R'', ''S'')'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641571137681222571)
,p_name=>'P2361310101_FWD_ON'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(27576232200097877843)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641571540840222571)
,p_name=>'P2361310101_NEXT_PROCESS'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(27576232200097877843)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P2361310101_WFDC_ACT'
,p_display_when2=>'F'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641565268265222565)
,p_name=>'P2361310101_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(42705155149974501317)
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT distinct (SELECT INITCAP (wf_bus_proc_desc)',
'            FROM WORK_FLOW',
'           WHERE WF_BU = wfdc_BU AND wf_bus_proc_id = WFDC_TYPE)',
'            "Doc.Type",WFDC_TYPE ',
'            FROM WORK_FLOW_DOC_CONTROL',
'           WHERE WFDC_BU = :global_bu',
'                 AND (wfdc_auth_type = ''P''',
'                      AND wfdc_ctrl_person =',
'                             func_find_position_id (:global_bu, :global_user)',
'                      OR wfdc_auth_type = ''E''',
'                         AND wfdc_ctrl_person =',
'                                func_find_emp_id (:global_bu, :global_user))',
'                 AND (wfdc_type, wfdc_status) NOT IN',
'                        (SELECT WFAA_WF_ID, WFAA_STATUS',
'                           FROM WORK_FLOW_APPR_ACTVT',
'                          WHERE WFAA_BU = :GLOBAL_BU',
'                                AND (WFAA_WF_ID, WFAA_SEQ_NO) IN',
'                                       (  SELECT WFAA_WF_ID,',
'                                                 MAX (WFAA_SEQ_NO) WFAA_SEQ_NO',
'                                            FROM WORK_FLOW_APPR_ACTVT',
'                                           WHERE WFAA_BU = :GLOBAL_BU',
'                                        GROUP BY WFAA_WF_ID))',
'                 AND wfdc_status NOT IN (''C'', ''R'', ''S'')',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All Documents'
,p_cHeight=>1
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641564462426222564)
,p_name=>'P2361310101_WFDC_ACT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(42705155149974501317)
,p_use_cache_before_default=>'NO'
,p_item_default=>'W'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641569225004222570)
,p_name=>'P2361310101_WFDC_CTRL_PERSON'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(27576232200097877843)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641568396800222570)
,p_name=>'P2361310101_WFDC_DOC_NO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(27576232200097877843)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641568804250222570)
,p_name=>'P2361310101_WFDC_DOC_PFX'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(27576232200097877843)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641570817121222571)
,p_name=>'P2361310101_WFDC_MESSAGE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(27576232200097877843)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P2361310101_WFDC_ACT'
,p_display_when2=>'F'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641571955629222573)
,p_name=>'P2361310101_WFDC_NXT_FWD_ENT'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(27576232200097877843)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641572741856222573)
,p_name=>'P2361310101_WFDC_NXT_FWD_NM'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(27576232200097877843)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641565693966222565)
,p_name=>'P2361310101_WFDC_NXT_FWD_PERS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(27576232200097877843)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Fwd Person'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT distinct emp_name, emp  FROM (SELECT emp ,emp r,emp_name ,emp "Employee", user_id "Type", user_unit "Unit" FROM (SELECT emp_name, emp,func_find_user_id (:global_bu, emp) user_id,func_find_user_plant(:GLOBAL_BU,FUNC_FIND_USER_ID(:GLOBAL_BU,emp)'
||') user_unit FROM (SELECT LEVEL rw,ocln_bu,',
'                                   func_find_wf_emp_pos_id (ocln_bu,ocln_par_position_id)',
'                                   emp,',
'                                   func_find_employee_desc (ocln_bu,func_find_wf_emp_pos_id (ocln_bu,ocln_par_position_id),1) emp_name',
'                        FROM (SELECT *',
'                                     FROM org_chart_hd, org_chart_ln',
'                                   WHERE ochd_bu = ocln_bu',
'                                       AND ochd_chart_no = ocln_chart_no',
'                                       AND ochd_status = ''A''',
'                                       AND TRUNC (SYSDATE) BETWEEN ochd_eff_from AND ochd_eff_to',
'                                       AND ocln_bu = :global_bu)',
'                       WHERE ocln_par_position_id IS NOT NULL',
'                        START WITH ocln_position_id = func_find_position_id (:global_bu,:global_user) CONNECT BY NOCYCLE ocln_position_id = PRIOR ocln_par_position_id) a,',
'                        appl_users',
'           WHERE   appluser_bu = a.ocln_bu',
'                 AND appluser_emp_id = a.emp',
'                 AND appluser_status = ''A''',
'                 AND func_find_wf_basis (:global_bu,:P2361310101_WFDC_TYPE,(:P2361310101_WFDC_SEQ_NO+1)) = ''O''',
'        GROUP BY emp_name, emp, func_find_user_id (:global_bu, emp)',
'        UNION ALL',
'        SELECT func_find_employee_desc (weh_bu, weh_par_emp_id, ''1'') emp_desc,',
'               weh_par_emp_id,',
'               weh_par_emp_id user_id,',
'               func_find_user_plant(:GLOBAL_BU,FUNC_FIND_USER_ID(:GLOBAL_BU,weh_par_emp_id)) user_unit',
'          FROM wf_emp_hierarchy',
'         WHERE     weh_bu = :global_bu',
'               AND weh_emp_id = func_find_emp_id (:global_bu, :global_user)',
'               AND func_find_wf_basis (:global_bu, :P2361310101_WFDC_TYPE,(:P2361310101_WFDC_SEQ_NO+1)) = ''E''',
'       union all',
'       SELECT func_find_employee_desc (WFDA_APPR_BU, WFDA_POSITION, 1) EMP_DESC,',
'       WFDA_POSITION,',
'       func_find_user_id (WFDA_APPR_BU, WFDA_POSITION) user1,',
'              WFDA_PLNT',
'  FROM WF_DIRECT_AUTHORIZATION',
' WHERE     WFDA_BU = :global_bu',
'       AND wfda_dflt_flag = ''Y''',
'       AND func_find_wf_basis (:GLOBAL_bu, :P2361310101_WFDC_TYPE,(:P2361310101_WFDC_SEQ_NO+1)) = ''U'')',
' WHERE :P2361310101_wfdc_act IN (''A'', ''F'')',
'UNION ALL',
'SELECT  emp_id d, emp_id r, emp_name, emp_id, type1,func_find_user_plant(:GLOBAL_BU,FUNC_FIND_USER_ID(:GLOBAL_BU,emp_id)) user_unit',
'  FROM (SELECT DECODE (wfdcl_auth_type,''E'', func_find_employee_desc (:global_bu,',
'                                                wfdcl_ctrl_person,',
'                                                ''1''),',
'                  ''P'', func_find_employee_desc (:global_bu,',
'                          func_find_wf_emp_pos_id (:global_bu,',
'                                                   wfdcl_ctrl_person),',
'                          ''1''))',
'                  emp_name,',
'               DECODE (wfdcl_auth_type,',
'                  ''E'', wfdcl_ctrl_person,',
'                  ''P'', func_find_wf_emp_pos_id (:global_bu,',
'                                                wfdcl_ctrl_person))',
'                  emp_id,',
'               ROWNUM rno,',
'               DECODE (ROWNUM, 1, ''Creator'', ''Sender'') type1',
'          FROM (  SELECT wfdcl_ctrl_person,MIN (wfdcl_seqno) seq_no,wfdcl_auth_type',
'                    FROM wf_doc_control_log',
'                   WHERE     wfdcl_bu = :global_bu',
'                         AND wfdcl_type = :P2361310101_wfdc_type --AND wfdcl_wf_no = :P2361310101_wfdc_wf_no',
'                AND wfdcl_ctrl_person <> :P2361310101_wfdc_ctrl_person',
'                GROUP BY wfdcl_ctrl_person, wfdcl_auth_type',
'                ORDER BY 2))',
' WHERE :P2361310101_wfdc_act = ''R'')'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select the Person'
,p_lov_cascade_parent_items=>'P2361310101_WFDC_ACT,P2361310101_WFDC_TYPE'
,p_ajax_items_to_submit=>'P2361310101_WFDC_ACT,P2361310101_WFDC_TYPE'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641572422370222573)
,p_name=>'P2361310101_WFDC_NXT_FWD_PLNT'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(27576232200097877843)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641566057978222567)
,p_name=>'P2361310101_WFDC_NXT_MESSAGE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(27576232200097877843)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Message'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641573172432222573)
,p_name=>'P2361310101_WFDC_NXT_STATUS'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(27576232200097877843)
,p_use_cache_before_default=>'NO'
,p_item_default=>'A'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P2361310101_WFDC_ACT'
,p_display_when2=>'F'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641573532506222573)
,p_name=>'P2361310101_WFDC_NXT_STAT_DES'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(27576232200097877843)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641570374657222571)
,p_name=>'P2361310101_WFDC_SELECT_FLAG'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(27576232200097877843)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641569605196222570)
,p_name=>'P2361310101_WFDC_SEQ_NO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(27576232200097877843)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641567539717222570)
,p_name=>'P2361310101_WFDC_SRC_BU'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(27576232200097877843)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641568014338222570)
,p_name=>'P2361310101_WFDC_SRC_PLNT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(27576232200097877843)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641567206470222568)
,p_name=>'P2361310101_WFDC_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(27576232200097877843)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641569932510222571)
,p_name=>'P2361310101_WFDC_WF_NO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(27576232200097877843)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(11641574114981222575)
,p_validation_name=>'WFDC_NXT_MESSAGE'
,p_static_id=>'wfdc-nxt-message'
,p_validation_sequence=>10
,p_validation=>'P2361310101_WFDC_NXT_MESSAGE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Message must be entered for return type.'
,p_validation_condition=>'P2361310101_WFDC_ACT'
,p_validation_condition2=>'R'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_imp.id(11641566820134222568)
,p_associated_item=>wwv_flow_imp.id(11641566057978222567)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11641583125183222581)
,p_name=>'close modal for wait'
,p_static_id=>'close-modal-for-wait'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2361310101_WFDC_ACT'
,p_condition_element=>'P2361310101_WFDC_ACT'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'W'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641583592811222581)
,p_event_id=>wwv_flow_imp.id(11641583125183222581)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'closeModal(''SUB'');')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11641583939152222581)
,p_name=>'count'
,p_static_id=>'count'
,p_event_sequence=>100
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641584487868222581)
,p_event_id=>wwv_flow_imp.id(11641583939152222581)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-set-focus'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2361310101_COUNT'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11641577469922222578)
,p_name=>'java'
,p_static_id=>'java'
,p_event_sequence=>70
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'myreport'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641577967688222578)
,p_event_id=>wwv_flow_imp.id(11641577469922222578)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P2361310101_WFDC_SELECT_FLAG,P2361310101_WFDC_WF_NO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/* Formatted on 11/20/2020 10:32:22 AM (QP5 v5.163.1008.3004) */',
    'IF :P2361310101_WFDC_SELECT_FLAG = 0 THEN',
    '',
    '--raise_application_error(-20999,''1''||:P2361310101_WFDC_SELECT_FLAG||:P2361310101_WFDC_WF_NO);',
    '',
    'UPDATE work_flow_doc_control',
    '   SET wfdc_select_flag = 1',
    ' WHERE     wfdc_bu = :global_bu',
    '       AND wfdc_select_flag = 0',
    '       AND wfdc_wf_no = :P2361310101_WFDC_WF_NO;',
    '',
    'COMMIT;',
    'ELSE',
    '',
    'UPDATE work_flow_doc_control',
    '   SET wfdc_select_flag = 0,',
    '       wfdc_nxt_status = NULL,',
    '       wfdc_nxt_message = NULL,',
    '       wfdc_nxt_fwd_person = NULL,',
    '       wfdc_nxt_fwd_entity = NULL',
    ' WHERE     wfdc_bu = :global_bu',
    '       AND wfdc_select_flag = 1',
    '       AND wfdc_wf_no = :p2361310101_wfdc_wf_no;',
    'COMMIT;',
    '',
    '',
    'END IF;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641578431912222578)
,p_event_id=>wwv_flow_imp.id(11641577469922222578)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item( "P2361310101_WFDC_SELECT_FLAG" ).setValue( this.data.WFDC_SELECT_FLAG );',
    'apex.item( "P2361310101_WFDC_WF_NO" ).setValue( this.data.WFDC_WF_NO);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641578942365222578)
,p_event_id=>wwv_flow_imp.id(11641577469922222578)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(42705155149974501317)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11641575536241222576)
,p_name=>'java_1'
,p_static_id=>'java-2'
,p_event_sequence=>80
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#check'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'myreport'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641576074728222576)
,p_event_id=>wwv_flow_imp.id(11641575536241222576)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P2361310101_WFDC_SELECT_FLAG,P2361310101_WFDC_WF_NO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/* Formatted on 11/20/2020 10:32:22 AM (QP5 v5.163.1008.3004) */',
    'IF :P2361310101_WFDC_SELECT_FLAG = 0 THEN',
    '',
    '--raise_application_error(-20999,''1''||:P2361310101_WFDC_SELECT_FLAG||:P2361310101_WFDC_WF_NO);',
    '',
    'UPDATE work_flow_doc_control',
    '   SET wfdc_select_flag = 1',
    ' WHERE     wfdc_bu = :global_bu',
    '       AND wfdc_select_flag = 0;',
    '       --AND wfdc_wf_no = :P2361310101_WFDC_WF_NO;',
    '',
    'COMMIT;',
    'ELSE',
    '',
    'UPDATE work_flow_doc_control',
    '   SET wfdc_select_flag = 0,',
    '       wfdc_nxt_status = NULL,',
    '       wfdc_nxt_message = NULL,',
    '       wfdc_nxt_fwd_person = NULL,',
    '       wfdc_nxt_fwd_entity = NULL',
    ' WHERE     wfdc_bu = :global_bu',
    '       AND wfdc_select_flag = 1;',
    '       --AND wfdc_wf_no = :p2361310101_wfdc_wf_no;',
    'COMMIT;',
    '',
    '',
    'END IF;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641577035377222576)
,p_event_id=>wwv_flow_imp.id(11641575536241222576)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item( "P2361310101_WFDC_SELECT_FLAG" ).setValue( this.data.WFDC_SELECT_FLAG );',
    '//apex.item( "P2361310101_WFDC_WF_NO" ).setValue( this.data.WFDC_WF_NO);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641576552340222576)
,p_event_id=>wwv_flow_imp.id(11641575536241222576)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(42705155149974501317)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11641579352710222578)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(42705155149974501317)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641579902656222579)
,p_event_id=>wwv_flow_imp.id(11641579352710222578)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''input[type=checkbox]'').change(function(){',
    '    if($(this).is('':checked'')){',
    '//$(''input[type=checkbox]'').attr(''disabled'',true);',
    '    $(this).attr(''disabled'','''');',
    '}',
    '',
    '});',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11641587528716225869)
,p_name=>'Opn'
,p_static_id=>'opn'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11641586984848225864)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641587581658225870)
,p_event_id=>wwv_flow_imp.id(11641587528716225869)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'openModal(''SUB'');')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11641588288738225877)
,p_name=>'Opn_1'
,p_static_id=>'opn-2'
,p_event_sequence=>120
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11641587099201225865)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641588402273225878)
,p_event_id=>wwv_flow_imp.id(11641588288738225877)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'openModal(''SUB'');')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11641581671899222579)
,p_name=>'process radio group'
,p_static_id=>'process-radio-group'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11641586984848225864)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641582185925222579)
,p_event_id=>wwv_flow_imp.id(11641581671899222579)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P2361310101_WFDC_TYPE,P2361310101_WFDC_CTRL_PERSON,P2361310101_WFDC_SEQ_NO,P2361310101_WFDC_SELECT_FLAG,P2361310101_WFDC_NXT_FWD_PERS,P2361310101_WFDC_NXT_FWD_ENT,P2361310101_WFDC_NXT_FWD_PLNT,P2361310101_WFDC_NXT_FWD_NM,P2361310101_WFDC_NXT_MESSAGE,'
||'P2361310101_WFDC_NXT_STATUS,P2361310101_WFDC_NXT_STAT_DES,P2361310101_WFDC_ACT',
  'items_to_submit', 'P2361310101_WFDC_ACT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ':P2361310101_WFDC_ACT := ''F'';',
    'Declare',
    'v_cnt    number;v_rtn_cnt varchar2(15);v_err varchar2(500);',
    'CURSOR c1 IS  SELECT *  FROM work_flow_doc_control WHERE wfdc_bu = :global_bu AND wfdc_select_flag = 1 AND (wfdc_auth_type = ''P'' AND wfdc_ctrl_person = func_find_position_id (:global_bu, :global_user)',
    '                 OR wfdc_auth_type = ''E'' AND wfdc_ctrl_person = func_find_emp_id (:global_bu, :global_user)',
    '                 OR func_find_position_check (:global_bu, :global_user) IS NULL)',
    '             AND wfdc_status NOT IN (''C'', ''R'');',
    'Begin FOR cr1 IN c1 LOOP',
    'SELECT COUNT (*) into v_cnt',
    '  FROM (  SELECT COUNT (*), WFDC_TYPE',
    '            FROM work_flow_doc_control',
    '           WHERE wfdc_bu = :global_bu AND wfdc_select_flag = 1',
    '                 AND (wfdc_auth_type = ''P''',
    '                      AND wfdc_ctrl_person =',
    '                             func_find_position_id (:global_bu, :global_user)',
    '                      OR wfdc_auth_type = ''E''',
    '                         AND wfdc_ctrl_person =',
    '                                func_find_emp_id (:global_bu, :global_user)',
    '                      OR func_find_position_check (:global_bu, :global_user)',
    '                            IS NULL)',
    '                 AND wfdc_status NOT IN (''C'', ''R'')',
    '        GROUP BY WFDC_TYPE);  ',
    '            -- raise_application_error(-20999, v_cnt);             ',
    'If v_cnt > 1 then',
    'UPDATE work_flow_doc_control',
    '   SET wfdc_select_flag = 0',
    ' WHERE wfdc_bu = :GLOBAL_BU AND wfdc_select_flag = 1;',
    ' commit;',
    'v_err :=  ''Please select one particular workflow type to proceed the process'';',
    'else                                ',
    '  :P2361310101_WFDC_TYPE := cr1.WFDC_TYPE ;',
    '  :P2361310101_WFDC_CTRL_PERSON := cr1.WFDC_CTRL_PERSON ;',
    '  :P2361310101_WFDC_SEQ_NO := cr1.WFDC_SEQ_NO  ;',
    '  If (:P2361310101_WFDC_ACT = ''R'') then',
    '    :P2361310101_WFDC_WF_NO := cr1.WFDC_WF_NO;',
    '    End if;',
    ' PROC_WF_RADIO_CHANGE_APEX_WEB (',
    '   p_bu                           => :global_bu,',
    '   p_user                         => :global_user,',
    '   p_WFDC_TYPE                    => cr1.WFDC_TYPE,',
    '   p_WFDC_STATUS                  => cr1.WFDC_STATUS,',
    '   p_WFDC_ACT                     => :P2361310101_WFDC_ACT,',
    '   p_WFDC_PLNT                    => cr1.WFDC_PLNT,',
    '   p_WFDC_VALUE                   => cr1.WFDC_VALUE,',
    '   P_WFDC_WF_NO                   => cr1.WFDC_WF_NO,',
    '   P_WFDC_SEQ_NO                  => cr1.WFDC_SEQ_NO,    ',
    '   P_WFDC_CTRL_PERSON             => cr1.WFDC_CTRL_PERSON,',
    '   P_WFDC_SRC_BU                  => cr1.WFDC_SRC_BU,     ',
    '   P_WFDC_DOC_PFX                 => cr1.WFDC_DOC_PFX,',
    '   P_WFDC_DOC_NO                  => cr1.WFDC_DOC_NO,',
    '   p_WFDC_SELECT_FLAG             => :P2361310101_WFDC_SELECT_FLAG,',
    '   p_WFDC_NXT_STATUS              => :P2361310101_WFDC_NXT_STATUS,',
    '   p_WFDC_NXT_STATUS_DESC         => :P2361310101_WFDC_NXT_STAT_DES,',
    '   p_WFDC_NXT_MESSAGE             => :P2361310101_WFDC_NXT_MESSAGE,',
    '   P_WFDC_NXT_FWD_PERSON          => :P2361310101_WFDC_NXT_FWD_PERS,',
    '   P_WFDC_NXT_FWD_ENTITY          => :P2361310101_WFDC_NXT_FWD_ENT,',
    '   P_WFDC_NXT_FWD_PLNT            => :P2361310101_WFDC_NXT_FWD_PLNT,',
    '   P_WFDC_NXT_FWD_PERSON_NM       => :P2361310101_WFDC_NXT_FWD_NM);',
    '    --raise_application_error(-20999,:P2361310101_WFDC_NXT_FWD_PERS);',
    'commit;',
    'UPDATE work_flow_doc_control',
    '  SET wfdc_act = :P2361310101_WFDC_ACT,',
    '      wfdc_select_flag  =:P2361310101_WFDC_SELECT_FLAG,',
    '      wfdc_nxt_status = :P2361310101_WFDC_NXT_STATUS,',
    '      wfdc_nxt_message = :P2361310101_WFDC_NXT_MESSAGE,',
    '      wfdc_nxt_fwd_person = :P2361310101_WFDC_NXT_FWD_PERS,',
    '      wfdc_nxt_fwd_entity = :P2361310101_WFDC_NXT_FWD_ENT',
    'WHERE wfdc_bu = :GLOBAL_BU ',
    '  AND wfdc_wf_no = cr1.wfdc_wf_no;   ',
    '  ',
    '  Commit; End If; End loop; EXCEPTION WHEN OTHERS THEN',
    '      IF v_err IS NOT NULL THEN      ',
    '      raise_application_error (-20999, v_err);',
    'ELSE  raise_application_error ((SQLCODE),func_find_err_msg (:global_bu,ABS (SQLCODE),SUBSTR (REPLACE (SQLERRM, '' '', ''''), 11, 3),1,:GLOBAL_USER));',
    '      END IF;End;',
    '',
    '',
    '',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641582723471222581)
,p_event_id=>wwv_flow_imp.id(11641581671899222579)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(42705155149974501317)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11641587828159225872)
,p_name=>'process radio group_1'
,p_static_id=>'process-radio-group-2'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11641587099201225865)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641587923761225873)
,p_event_id=>wwv_flow_imp.id(11641587828159225872)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P2361310101_WFDC_TYPE,P2361310101_WFDC_CTRL_PERSON,P2361310101_WFDC_SEQ_NO,P2361310101_WFDC_SELECT_FLAG,P2361310101_WFDC_NXT_FWD_PERS,P2361310101_WFDC_NXT_FWD_ENT,P2361310101_WFDC_NXT_FWD_PLNT,P2361310101_WFDC_NXT_FWD_NM,P2361310101_WFDC_NXT_MESSAGE,'
||'P2361310101_WFDC_NXT_STATUS,P2361310101_WFDC_NXT_STAT_DES,P2361310101_WFDC_ACT',
  'items_to_submit', 'P2361310101_WFDC_ACT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ':P2361310101_WFDC_ACT := ''R'';',
    'Declare',
    'v_cnt    number;',
    'v_rtn_cnt varchar2(15);',
    'v_err varchar2(500);',
    'CURSOR c1',
    '   IS  SELECT *',
    '        FROM work_flow_doc_control',
    '       WHERE wfdc_bu = :global_bu ',
    '       AND wfdc_select_flag = 1',
    '             AND (wfdc_auth_type = ''P'' AND wfdc_ctrl_person = func_find_position_id (:global_bu, :global_user)',
    '                 OR wfdc_auth_type = ''E'' AND wfdc_ctrl_person = func_find_emp_id (:global_bu, :global_user)',
    '                 OR func_find_position_check (:global_bu, :global_user) IS NULL)',
    '             AND wfdc_status NOT IN (''C'', ''R'');',
    'Begin FOR cr1 IN c1 LOOP',
    'SELECT COUNT (*) into v_cnt',
    '  FROM (  SELECT COUNT (*), WFDC_TYPE',
    '            FROM work_flow_doc_control',
    '           WHERE wfdc_bu = :global_bu AND wfdc_select_flag = 1',
    '                 AND (wfdc_auth_type = ''P''',
    '                      AND wfdc_ctrl_person =',
    '                             func_find_position_id (:global_bu, :global_user)',
    '                      OR wfdc_auth_type = ''E''',
    '                         AND wfdc_ctrl_person =',
    '                                func_find_emp_id (:global_bu, :global_user)',
    '                      OR func_find_position_check (:global_bu, :global_user)',
    '                            IS NULL)',
    '                 AND wfdc_status NOT IN (''C'', ''R'')',
    '        GROUP BY WFDC_TYPE);  ',
    '            -- raise_application_error(-20999, v_cnt);             ',
    'If v_cnt > 1 then',
    'UPDATE work_flow_doc_control',
    '   SET wfdc_select_flag = 0',
    ' WHERE wfdc_bu = :GLOBAL_BU AND wfdc_select_flag = 1;',
    ' commit;',
    'v_err :=  ''Please select one particular workflow type to proceed the process'';',
    'else                                ',
    '  :P2361310101_WFDC_TYPE := cr1.WFDC_TYPE ;',
    '  :P2361310101_WFDC_CTRL_PERSON := cr1.WFDC_CTRL_PERSON ;',
    '  :P2361310101_WFDC_SEQ_NO := cr1.WFDC_SEQ_NO  ;',
    '  If (:P2361310101_WFDC_ACT = ''R'') then',
    '    :P2361310101_WFDC_WF_NO := cr1.WFDC_WF_NO;',
    '    End if;',
    ' PROC_WF_RADIO_CHANGE_APEX_WEB (',
    '   p_bu                           => :global_bu,',
    '   p_user                         => :global_user,',
    '   p_WFDC_TYPE                    => cr1.WFDC_TYPE,',
    '   p_WFDC_STATUS                  => cr1.WFDC_STATUS,',
    '   p_WFDC_ACT                     => :P2361310101_WFDC_ACT,',
    '   p_WFDC_PLNT                    => cr1.WFDC_PLNT,',
    '   p_WFDC_VALUE                   => cr1.WFDC_VALUE,',
    '   P_WFDC_WF_NO                   => cr1.WFDC_WF_NO,',
    '   P_WFDC_SEQ_NO                  => cr1.WFDC_SEQ_NO,    ',
    '   P_WFDC_CTRL_PERSON             => cr1.WFDC_CTRL_PERSON,',
    '   P_WFDC_SRC_BU                  => cr1.WFDC_SRC_BU,     ',
    '   P_WFDC_DOC_PFX                 => cr1.WFDC_DOC_PFX,',
    '   P_WFDC_DOC_NO                  => cr1.WFDC_DOC_NO,',
    '   p_WFDC_SELECT_FLAG             => :P2361310101_WFDC_SELECT_FLAG,',
    '   p_WFDC_NXT_STATUS              => :P2361310101_WFDC_NXT_STATUS,',
    '   p_WFDC_NXT_STATUS_DESC         => :P2361310101_WFDC_NXT_STAT_DES,',
    '   p_WFDC_NXT_MESSAGE             => :P2361310101_WFDC_NXT_MESSAGE,',
    '   P_WFDC_NXT_FWD_PERSON          => :P2361310101_WFDC_NXT_FWD_PERS,',
    '   P_WFDC_NXT_FWD_ENTITY          => :P2361310101_WFDC_NXT_FWD_ENT,',
    '   P_WFDC_NXT_FWD_PLNT            => :P2361310101_WFDC_NXT_FWD_PLNT,',
    '   P_WFDC_NXT_FWD_PERSON_NM       => :P2361310101_WFDC_NXT_FWD_NM);',
    '    --raise_application_error(-20999,:P2361310101_WFDC_NXT_FWD_PERS);',
    'commit;',
    'UPDATE work_flow_doc_control',
    '  SET wfdc_act = :P2361310101_WFDC_ACT,',
    '      wfdc_select_flag  =:P2361310101_WFDC_SELECT_FLAG,',
    '      wfdc_nxt_status = :P2361310101_WFDC_NXT_STATUS,',
    '      wfdc_nxt_message = :P2361310101_WFDC_NXT_MESSAGE,',
    '      wfdc_nxt_fwd_person = :P2361310101_WFDC_NXT_FWD_PERS,',
    '      wfdc_nxt_fwd_entity = :P2361310101_WFDC_NXT_FWD_ENT',
    'WHERE wfdc_bu = :GLOBAL_BU ',
    '  AND wfdc_wf_no = cr1.wfdc_wf_no;   ',
    '  ',
    '  Commit; End If; End loop; EXCEPTION WHEN OTHERS THEN',
    '      IF v_err IS NOT NULL THEN      ',
    '      raise_application_error (-20999, v_err);',
    'ELSE  raise_application_error ((SQLCODE),func_find_err_msg (:global_bu,ABS (SQLCODE),SUBSTR (REPLACE (SQLERRM, '' '', ''''), 11, 3),1,:GLOBAL_USER));',
    '      END IF;End;',
    '',
    '',
    '',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641587972002225874)
,p_event_id=>wwv_flow_imp.id(11641587828159225872)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(42705155149974501317)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11641580292040222579)
,p_name=>'show/hide'
,p_static_id=>'show-hide'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11641586984848225864)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641581284263222579)
,p_event_id=>wwv_flow_imp.id(11641580292040222579)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2361310101_WFDC_NXT_FWD_PERS,P2361310101_WFDC_NXT_MESSAGE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11641588123437225875)
,p_name=>'show/hide_1'
,p_static_id=>'show-hide-2'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(11641587099201225865)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641588190143225876)
,p_event_id=>wwv_flow_imp.id(11641588123437225875)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P2361310101_WFDC_NXT_FWD_PERS,P2361310101_WFDC_NXT_MESSAGE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11641587413764225868)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Approve'
,p_static_id=>'approve'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'v_cnt    number;',
'v_rtn_cnt varchar2(15);',
'v_err varchar2(500);',
'CURSOR c1',
'   IS  SELECT *',
'        FROM work_flow_doc_control',
'       WHERE wfdc_bu = :global_bu ',
'       AND wfdc_select_flag = 1',
'             AND (wfdc_auth_type = ''P'' AND wfdc_ctrl_person = func_find_position_id (:global_bu, :global_user)',
'                 OR wfdc_auth_type = ''E'' AND wfdc_ctrl_person = func_find_emp_id (:global_bu, :global_user)',
'                 OR func_find_position_check (:global_bu, :global_user) IS NULL)',
'             AND wfdc_status NOT IN (''C'', ''R'');',
'Begin FOR cr1 IN c1 LOOP',
'SELECT COUNT (*) into v_cnt',
'  FROM (  SELECT COUNT (*), WFDC_TYPE',
'            FROM work_flow_doc_control',
'           WHERE wfdc_bu = :global_bu AND wfdc_select_flag = 1',
'                 AND (wfdc_auth_type = ''P''',
'                      AND wfdc_ctrl_person =',
'                             func_find_position_id (:global_bu, :global_user)',
'                      OR wfdc_auth_type = ''E''',
'                         AND wfdc_ctrl_person =',
'                                func_find_emp_id (:global_bu, :global_user)',
'                      OR func_find_position_check (:global_bu, :global_user)',
'                            IS NULL)',
'                 AND wfdc_status NOT IN (''C'', ''R'')',
'        GROUP BY WFDC_TYPE);  ',
'            -- raise_application_error(-20999, v_cnt);             ',
'If v_cnt > 1 then',
'UPDATE work_flow_doc_control',
'   SET wfdc_select_flag = 0',
' WHERE wfdc_bu = :GLOBAL_BU AND wfdc_select_flag = 1;',
' commit;',
'v_err :=  ''Please select one particular workflow type to proceed the process'';',
'else                                ',
'  :P2361310101_WFDC_TYPE := cr1.WFDC_TYPE ;',
'  :P2361310101_WFDC_CTRL_PERSON := cr1.WFDC_CTRL_PERSON ;',
'  :P2361310101_WFDC_SEQ_NO := cr1.WFDC_SEQ_NO  ;',
'  If (:P2361310101_WFDC_ACT = ''R'') then',
'    :P2361310101_WFDC_WF_NO := cr1.WFDC_WF_NO;',
'    End if;',
' PROC_WF_RADIO_CHANGE_APEX_WEB (',
'   p_bu                           => :global_bu,',
'   p_user                         => :global_user,',
'   p_WFDC_TYPE                    => cr1.WFDC_TYPE,',
'   p_WFDC_STATUS                  => cr1.WFDC_STATUS,',
'   p_WFDC_ACT                     => :P2361310101_WFDC_ACT,',
'   p_WFDC_PLNT                    => cr1.WFDC_PLNT,',
'   p_WFDC_VALUE                   => cr1.WFDC_VALUE,',
'   P_WFDC_WF_NO                   => cr1.WFDC_WF_NO,',
'   P_WFDC_SEQ_NO                  => cr1.WFDC_SEQ_NO,    ',
'   P_WFDC_CTRL_PERSON             => cr1.WFDC_CTRL_PERSON,',
'   P_WFDC_SRC_BU                  => cr1.WFDC_SRC_BU,     ',
'   P_WFDC_DOC_PFX                 => cr1.WFDC_DOC_PFX,',
'   P_WFDC_DOC_NO                  => cr1.WFDC_DOC_NO,',
'   p_WFDC_SELECT_FLAG             => :P2361310101_WFDC_SELECT_FLAG,',
'   p_WFDC_NXT_STATUS              => :P2361310101_WFDC_NXT_STATUS,',
'   p_WFDC_NXT_STATUS_DESC         => :P2361310101_WFDC_NXT_STAT_DES,',
'   p_WFDC_NXT_MESSAGE             => :P2361310101_WFDC_NXT_MESSAGE,',
'   P_WFDC_NXT_FWD_PERSON          => :P2361310101_WFDC_NXT_FWD_PERS,',
'   P_WFDC_NXT_FWD_ENTITY          => :P2361310101_WFDC_NXT_FWD_ENT,',
'   P_WFDC_NXT_FWD_PLNT            => :P2361310101_WFDC_NXT_FWD_PLNT,',
'   P_WFDC_NXT_FWD_PERSON_NM       => :P2361310101_WFDC_NXT_FWD_NM);',
'    --raise_application_error(-20999,:P2361310101_WFDC_NXT_FWD_PERS);',
'commit;',
'UPDATE work_flow_doc_control',
'  SET wfdc_act = :P2361310101_WFDC_ACT,',
'      wfdc_select_flag  =:P2361310101_WFDC_SELECT_FLAG,',
'      wfdc_nxt_status = :P2361310101_WFDC_NXT_STATUS,',
'      wfdc_nxt_message = :P2361310101_WFDC_NXT_MESSAGE,',
'      wfdc_nxt_fwd_person = :P2361310101_WFDC_NXT_FWD_PERS,',
'      wfdc_nxt_fwd_entity = :P2361310101_WFDC_NXT_FWD_ENT',
'WHERE wfdc_bu = :GLOBAL_BU ',
'  AND wfdc_wf_no = cr1.wfdc_wf_no;   ',
'  ',
'  Commit; End If; End loop; EXCEPTION WHEN OTHERS THEN',
'      IF v_err IS NOT NULL THEN      ',
'      raise_application_error (-20999, v_err);',
'ELSE  raise_application_error ((SQLCODE),func_find_err_msg (:global_bu,ABS (SQLCODE),SUBSTR (REPLACE (SQLERRM, '' '', ''''), 11, 3),1,:GLOBAL_USER));',
'      END IF;End;',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>6159625578220614840
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11641574739153222575)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Approve_process'
,p_static_id=>'approve-process'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CURSOR c1',
'   IS',
'      SELECT *',
'        FROM work_flow_doc_control',
'       WHERE wfdc_bu = :global_bu AND wfdc_select_flag = 1',
'             AND (wfdc_auth_type = ''P''',
'                  AND wfdc_ctrl_person =',
'                         func_find_position_id (:global_bu, :global_user)',
'                  OR wfdc_auth_type = ''E''',
'                     AND wfdc_ctrl_person =',
'                            func_find_emp_id (:global_bu, :global_user)',
'                  OR func_find_position_check (:global_bu, :global_user)',
'                        IS NULL)',
'             AND wfdc_status NOT IN (''C'', ''R'')',
'             AND wfdc_act <> ''W'';',
'',
'   --AND wfdc_wf_no = :P2361310101_WFDC_WF_NO;',
'',
'   CURSOR c2 (',
'      c_type      VARCHAR2,',
'      c_seq_no    NUMBER)',
'   IS',
'      SELECT wfaa_status',
'        FROM work_flow_appr_actvt',
'       WHERE     wfaa_bu = :global_bu',
'             AND wfaa_wf_id = c_type',
'             AND wfaa_seq_no = c_seq_no + 1;',
'',
'   CURSOR c3',
'   IS',
'      SELECT wfmc_doc_comp, wfmc_allow_dir_appr_fwd_flag',
'        FROM wfm_control',
'       WHERE wfmc_bu = :global_bu;',
'',
'',
'   --cr1              c1%ROWTYPE;',
'   cr2              c2%ROWTYPE;',
'   cr3              c3%ROWTYPE;',
'',
'   v_cnt            NUMBER (10);',
'   e_cnt            NUMBER (10);',
'   v_res            VARCHAR2 (1) := ''N'';',
'   v_res3           VARCHAR2 (4000);',
'   var_err          VARCHAR2 (4000);',
'   v_result         VARCHAR2 (1) := ''N'';',
'   chk_alert        NUMBER;',
'   chk_alert1       NUMBER;',
'   var_res          VARCHAR2 (1);',
'   v_nxt_status     VARCHAR2 (5);',
'   v_seq_no         NUMBER;',
'   v_wf_control     VARCHAR2 (1);',
'   v_wf_status      VARCHAR2 (2);',
'   v_out            VARCHAR2 (1);',
'   var_msg          VARCHAR2 (4000);',
'   v_dir_apr_flag   VARCHAR2 (1);',
'   v_prod_date      DATE;',
'   var_act_cnt      NUMBER := 0;',
'   v_err            VARCHAR2 (4000);',
'BEGIN',
'  ',
'   SELECT COUNT (*)',
'     INTO v_cnt',
'     FROM work_flow_doc_control',
'    WHERE     WFDC_BU = :GLOBAL_BU',
'          AND WFDC_SELECT_FLAG = 1',
'          AND WFDC_ACT NOT IN (''W'')',
'          AND (wfdc_auth_type = ''P''',
'               AND wfdc_ctrl_person =',
'                      func_find_position_id (:GLOBAL_bu, :GLOBAL_user)',
'               OR wfdc_auth_type = ''E''',
'                  AND wfdc_ctrl_person =',
'                         func_find_emp_id (:GLOBAL_bu, :GLOBAL_user)',
'               OR FUNC_FIND_POSITION_CHECK (:GLOBAL_BU, :GLOBAL_USER) IS NULL);',
'',
'',
'   FOR cr1 IN c1',
'   LOOP',
'      /*Forward */',
'      UPDATE work_flow_doc_control',
'         SET wfdc_nxt_fwd_person = :P2361310101_WFDC_NXT_FWD_PERS',
'       WHERE wfdc_bu = :global_bu AND wfdc_select_flag = 1 AND wfdc_act = ''F'';',
'',
'      /*Return */',
'      UPDATE work_flow_doc_control',
'         SET wfdc_nxt_fwd_person = :P2361310101_WFDC_NXT_FWD_PERS,',
'             wfdc_nxt_message = :P2361310101_WFDC_NXT_MESSAGE',
'       WHERE wfdc_bu = :global_bu AND wfdc_select_flag = 1 AND wfdc_act = ''R'';',
'',
'      ',
'      DBMS_APPLICATION_INFO.set_action (''proc_work_flow_dir_auth'');',
'     ',
'   IF V_CNT = 0',
'   THEN',
'      v_err := ''Please choose a action to perform''||v_cnt;',
'    goto msg;',
'   END IF;',
'      OPEN c3;',
'',
'      FETCH c3 INTO cr3;',
'',
'      IF c3%NOTFOUND',
'      THEN',
'         v_wf_control := ''S'';',
'      ELSE',
'         ',
'         v_wf_control := cr3.wfmc_doc_comp;',
'         v_dir_apr_flag := cr3.wfmc_allow_dir_appr_fwd_flag;',
'      END IF;',
'',
'      CLOSE c3;',
'',
'      IF v_wf_control = ''S''',
'      THEN',
'         proc_work_flow_dir_auth (:global_bu,',
'                                  cr1.wfdc_plnt,',
'                                  cr1.wfdc_type,',
'                                  cr1.wfdc_nxt_status,',
'                                  :global_user,',
'                                  cr1.wfdc_value,',
'                                  var_res);',
'      ELSE',
'         proc_work_flow_dir_auth_nonseq (:global_bu,',
'                                         cr1.wfdc_plnt,',
'                                         cr1.wfdc_type,',
'                                         :global_user,',
'                                         v_wf_status,',
'                                         v_out);',
'      END IF;',
'',
'       ',
'--raise_application_error (-20999, ''2''||cr1.wfdc_act||''/''||v_dir_apr_flag );',
'      IF cr1.wfdc_act = ''A'' AND v_dir_apr_flag = ''Y''',
'      THEN',
'         v_seq_no :=',
'            CASE',
'               WHEN v_wf_control = ''S''',
'               THEN',
'                  func_find_wf_appr_seq_no (:global_bu,',
'                                            cr1.wfdc_plnt,',
'                                            cr1.wfdc_type,',
'                                            cr1.wfdc_ctrl_person)',
'               WHEN v_wf_control = ''N''',
'               THEN',
'                  func_find_wf_appr_seq_no (:global_bu,',
'                                            cr1.wfdc_plnt,',
'                                            cr1.wfdc_type,',
'                                            cr1.wfdc_ctrl_person,',
'                                            NULL,',
'                                            ''A'',',
'                                            cr1.wfdc_value)',
'               ELSE',
'                  func_find_wf_appr_seq_no (:global_bu,',
'                                            cr1.wfdc_plnt,',
'                                            cr1.wfdc_type,',
'                                            cr1.wfdc_ctrl_person)',
'            END;',
'--raise_application_error (-20999, ''2''||cr1.wfdc_act||''/''||v_dir_apr_flag ||''/''||cr1.wfdc_type);',
'         OPEN c2 (cr1.wfdc_type, v_seq_no);',
'',
'         FETCH c2 INTO cr2;',
'',
'         CLOSE c2;',
'         ',
'         IF ( (:P2361310101_WFDC_NXT_FWD_PERS IS NULL OR :P2361310101_WFDC_NXT_MESSAGE IS NULL)',
'             AND (func_find_wf_appr_status (:global_bu, cr1.wfdc_type) <>',
'                     cr2.wfaa_status))',
'         THEN',
'            v_err := ''Forward details must be entered.'';',
'          GOTO msg;',
'         END IF;',
'      END IF;',
'    --raise_application_error (-20999, ''3''||cr1.wfdc_act); ',
'',
'      IF cr1.wfdc_act = ''A''',
'      THEN',
'       --raise_application_error (-20999, ''5''||cr1.wfdc_bu||''/''||cr1.wfdc_plnt||''/''||cr1.wfdc_type||''/''||cr1.wfdc_wf_no||''/''||v_wf_control||''/''||:global_user); ',
'         proc_doc_approve (cr1.wfdc_bu,',
'                           cr1.wfdc_plnt,',
'                           cr1.wfdc_type,',
'                           cr1.wfdc_wf_no,',
'                           v_wf_control,',
'                           :global_user,',
'                           ''1'',',
'                           var_msg,',
'                           var_err,',
'                           v_res);',
'',
'         --raise_application_error (-20999, ''4''||cr1.wfdc_act||''/''||var_msg||''/''||var_err); ',
'',
'         IF var_msg IS NOT NULL',
'          THEN',
'             v_err := var_msg;',
'             GOTO msg;',
'          END IF;',
'',
'          IF var_err IS NOT NULL',
'          THEN',
'             v_err := var_err;                                       --var_msg;',
'             GOTO msg;',
'          END IF;',
'',
'         IF v_wf_control = ''S''',
'         THEN',
'            v_seq_no := cr1.wfdc_seq_no;',
'         ELSE',
'            v_seq_no :=',
'               func_find_wf_appr_seq_no (:global_bu,',
'                                         cr1.wfdc_plnt,',
'                                         cr1.wfdc_type,',
'                                         cr1.wfdc_ctrl_person,',
'                                         NULL,',
'                                         ''A'',',
'                                         cr1.wfdc_value);',
'         END IF;',
'',
'         proc_work_flow_auth (:global_bu,',
'                              cr1.wfdc_plnt,',
'                              cr1.wfdc_type,',
'                              cr1.wfdc_ctrl_person,',
'                              cr1.wfdc_value,',
'                              v_seq_no,',
'                              v_out);',
'',
'         IF v_out = ''E''',
'         THEN',
'            var_msg :=',
'               ''Authorization limit exceeds. Do you wish to forward to Document ?'';',
'                GOTO msg;',
'         ELSE',
'            var_msg := ''Do you wish to forward to Document ?'';',
'             GOTO msg;',
'         END IF;',
'',
'         IF     cr1.wfdc_nxt_fwd_person IS NOT NULL',
'            AND cr1.wfdc_nxt_status IS NOT NULL',
'            AND cr1.wfdc_nxt_message IS NOT NULL',
'            AND v_res = ''N''',
'         THEN',
'           ',
'            proc_wf_doc_forward (:global_bu,',
'                                 cr1.wfdc_plnt,',
'                                 cr1.wfdc_type,',
'                                 cr1.wfdc_doc_pfx,',
'                                 cr1.wfdc_doc_no,',
'                                 cr1.wfdc_wf_no,',
'                                 :global_user,',
'                                 var_msg,',
'                                 v_res);',
'        ',
'         END IF;',
'      ELSIF cr1.wfdc_act = ''F''',
'      THEN',
'        /* APEX_APPLICATION.g_print_success_message :=',
'               ''<span style="color:white"> * ''',
'            || ''Document Processed.''',
'            || '' </span>'';*/',
'',
'        ',
'         IF v_wf_control = ''S''',
'         THEN',
'            v_seq_no := cr1.wfdc_seq_no;',
'            ',
'         ELSE',
'            v_seq_no :=',
'               func_find_wf_appr_seq_no (:global_bu,',
'                                         cr1.wfdc_plnt,',
'                                         cr1.wfdc_type,',
'                                         cr1.wfdc_ctrl_person,',
'                                         NULL,',
'                                         ''A'',',
'                                         cr1.wfdc_value);',
'         END IF;',
'',
'         proc_work_flow_auth (:global_bu,',
'                              cr1.wfdc_plnt,',
'                              cr1.wfdc_type,',
'                              cr1.wfdc_ctrl_person,',
'                              cr1.wfdc_value,',
'                              v_seq_no,',
'                              v_out);',
'',
'         v_nxt_status := func_find_wf_appr_status (:global_bu, cr1.wfdc_type);',
'',
'         v_seq_no :=',
'            func_find_wf_appr_seq_no (:global_bu,',
'                                      cr1.wfdc_plnt,',
'                                      cr1.wfdc_type,',
'                                      cr1.wfdc_ctrl_person);',
'',
'         SELECT COUNT (*)',
'           INTO var_act_cnt',
'           FROM work_flow_appr_actvt',
'          WHERE wfaa_bu = :global_bu AND wfaa_wf_id = cr1.wfdc_type;',
'',
'         IF var_act_cnt > 1 AND v_out <> ''E''',
'         THEN',
'            OPEN c2 (cr1.wfdc_type, v_seq_no);',
'',
'            FETCH c2 INTO cr2;',
'',
'            IF c2%FOUND',
'            THEN',
'               IF cr2.wfaa_status = cr1.wfdc_nxt_status',
'               THEN',
'                  v_err := ''Process the document and proceed.'';',
'                GOTO msg;',
'               END IF;',
'            END IF;',
'',
'            CLOSE c2;',
'         END IF;',
'',
'         OPEN c2 (cr1.wfdc_type, v_seq_no);',
'',
'         FETCH c2 INTO cr2;',
'',
'         CLOSE c2;',
'',
'',
'',
'         IF var_res = ''Y'' AND cr2.wfaa_status = v_nxt_status',
'         THEN',
'           ',
'            proc_wf_doc_forward (:global_bu,',
'                                 cr1.wfdc_plnt,',
'                                 cr1.wfdc_type,',
'                                 cr1.wfdc_doc_pfx,',
'                                 cr1.wfdc_doc_no,',
'                                 cr1.wfdc_wf_no,',
'                                 :global_user,',
'                                 var_msg,',
'                                 v_res);',
'         ',
' IF v_res IS NOT NULL  THEN',
'            v_err := v_res;',
'           GOTO msg;',
'END IF;',
'',
'         ELSE',
'         ',
'         proc_wf_doc_forward (:global_bu,',
'                                 cr1.wfdc_plnt,',
'                                 cr1.wfdc_type,',
'                                 cr1.wfdc_doc_pfx,',
'                                 cr1.wfdc_doc_no,',
'                                 cr1.wfdc_wf_no,',
'                                 :global_user,',
'                                 var_msg,',
'                                 v_res);',
'        IF v_res IS NOT NULL  THEN',
'            v_err := v_res;',
'           GOTO msg;',
'END IF;',
'',
'         END IF;',
'      ELSIF cr1.wfdc_act = ''R''',
'      THEN',
'       ',
'         proc_wf_doc_return (:global_bu,',
'                             cr1.wfdc_plnt,',
'                             cr1.wfdc_type,',
'                             cr1.wfdc_doc_pfx,',
'                             cr1.wfdc_doc_no,',
'                             cr1.wfdc_wf_no,',
'                             :global_user,',
'                             v_res);',
'                             ',
' IF v_res IS NOT NULL  THEN',
'            v_err := v_res;',
'           GOTO msg;',
'END IF;',
'      ELSIF cr1.wfdc_act = ''C''',
'      THEN',
'         /* WorkFlow Document Cancellation Database procedure */',
'',
'         IF cr1.wfdc_type = ''WF_PCHD''',
'         THEN',
'            SELECT TRUNC (pt_date)',
'              INTO v_prod_date',
'              FROM prod_transfer',
'             WHERE     pt_bu = cr1.wfdc_bu',
'                   AND pt_plnt = cr1.wfdc_plnt',
'                   AND pt_trans_no = cr1.wfdc_doc_no;',
'         END IF;',
'         proc_wf_doc_cancel (cr1.wfdc_bu,',
'                             :global_bu,',
'                             cr1.wfdc_plnt,',
'                             cr1.wfdc_doc_sfx,',
'                             cr1.wfdc_doc_pfx,',
'                             cr1.wfdc_doc_no,',
'                             v_prod_date,',
'                             cr1.wfdc_type,',
'                             cr1.wfdc_wf_no,',
'                             cr1.wfdc_spplr_id,',
'                             cr1.wfdc_cust_id,',
'                             cr1.wfdc_prod_id,',
'                             cr1.wfdc_prod_rev,',
'                             cr1.wfdc_jrnl_type,',
'                             cr1.wfdc_rnd_prj_id,',
'                             cr1.wfdc_prj_id,',
'                             cr1.wfdc_lvl1,',
'                             cr1.wfdc_lvl2,',
'                             cr1.wfdc_lvl3,',
'                             cr1.wfdc_lvl4,',
'                             cr1.wfdc_lvl_prj,',
'                             cr1.wfdc_accts,',
'                             cr1.wfdc_qc_ins_mode,',
'                             cr1.wfdc_qc_rev,',
'                             NULL,',
'                             NULL,',
'                             NULL,',
'                             :global_user,',
'                             ''1'',',
'                             v_res,',
'                             v_res3,',
'                             var_msg,',
'                             var_err);',
'                             --raise_application_error(-20999, v_res||''/''||v_res3||''/''||var_msg||''/''||var_err);',
'       IF var_msg IS NOT NULL',
'       THEN',
'            v_err:=var_msg;',
'        GOTO msg;',
'       END IF;',
'',
'       IF var_err IS NOT NULL',
'       THEN',
'          v_err := var_err;',
'          GOTO msg;',
'       END IF;',
'                                    ',
' IF v_res IS NOT NULL  THEN',
'            v_err := v_res;',
'           GOTO msg;',
'END IF;',
'      END IF;',
'',
'   /*   IF v_res = ''N''',
'      THEN',
'         v_result := ''Y'';',
'      END IF;*/',
'    ',
'',
'   /*IF v_result = ''N''',
'   THEN',
'      v_err := v_result;--''Document Processed''; ',
'             GOTO msg;',
'   END IF;*/',
'   UPDATE work_flow_doc_control',
'         SET wfdc_select_flag = 0,',
'             wfdc_act = ''W'',',
'             wfdc_nxt_status = NULL,',
'             wfdc_nxt_fwd_person = NULL,',
'             wfdc_nxt_message = NULL',
'       WHERE wfdc_bu = :global_bu AND wfdc_wf_no = cr1.wfdc_wf_no;',
'',
'      SELECT COUNT (*)',
'        INTO e_cnt',
'        FROM work_flow_exp',
'       WHERE     wfe_bu = :global_bu',
'             AND wfe_type = cr1.wfdc_type',
'             AND wfe_wf_no = cr1.wfdc_wf_no;',
'   END LOOP c1;',
'',
'   IF e_cnt > 0',
'   THEN',
'      v_err := ''Refer Exceptions'';',
'   GOTO msg;',
'   END IF;',
'   <<msg>>',
'       raise_application_error (-20999, var_msg);',
'       ',
'/*EXCEPTION',
'   WHEN OTHERS',
'   THEN',
'      IF v_err IS NOT NULL',
'      THEN',
'           raise_application_error (-20999,''123''|| v_err);',
'             else',
'        ',
'         raise_application_error (',
'            (SQLCODE),',
'            func_find_err_msg (:global_bu,',
'                               ABS (SQLCODE),',
'                               SUBSTR (REPLACE (SQLERRM, '' '', ''''), 11, 3),',
'                               1,',
'                               :GLOBAL_USER));',
'    END IF;',
'*/',
'      COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11641586893248225863)
,p_internal_uid=>6159612903609611547
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11641588601357225880)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cancel'
,p_static_id=>'cancel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CURSOR c1',
'   IS',
'      SELECT *',
'        FROM work_flow_doc_control',
'       WHERE wfdc_bu = :global_bu AND wfdc_select_flag = 1',
'             AND (wfdc_auth_type = ''P''',
'                  AND wfdc_ctrl_person = func_find_position_id (:global_bu, :global_user)',
'                  OR wfdc_auth_type = ''E''',
'                     AND wfdc_ctrl_person = func_find_emp_id (:global_bu, :global_user) OR func_find_position_check (:global_bu, :global_user) IS NULL)',
'             AND wfdc_status NOT IN (''C'', ''R'')',
'             AND wfdc_act <> ''W'';',
'',
' ',
'',
'   v_cnt            NUMBER (10);',
'   e_cnt            NUMBER (10);',
'   v_res            VARCHAR2 (1) := ''N'';',
'   v_res3           VARCHAR2 (4000);',
'   var_err          VARCHAR2 (4000);',
'   v_result         VARCHAR2 (1) := ''N'';   ',
'   var_res          VARCHAR2 (1);  ',
'   var_msg          VARCHAR2 (4000);  ',
'   v_prod_date      DATE;   ',
'   v_err            VARCHAR2 (4000);',
'BEGIN',
' ',
'   FOR cr1 IN c1',
'   LOOP',
'   ',
'         ',
'raise_application_error (-20999, ''2''||cr1.wfdc_act);',
'   IF cr1.wfdc_act = ''C''',
'      THEN',
'         /* WorkFlow Document Cancellation Database procedure */',
'',
'         IF cr1.wfdc_type = ''WF_PCHD''',
'         THEN',
'            SELECT TRUNC (pt_date)',
'              INTO v_prod_date',
'              FROM prod_transfer',
'             WHERE     pt_bu = cr1.wfdc_bu',
'                   AND pt_plnt = cr1.wfdc_plnt',
'                   AND pt_trans_no = cr1.wfdc_doc_no;',
'         END IF;',
'         proc_wf_doc_cancel (cr1.wfdc_bu,',
'                             :global_bu,',
'                             cr1.wfdc_plnt,',
'                             cr1.wfdc_doc_sfx,',
'                             cr1.wfdc_doc_pfx,',
'                             cr1.wfdc_doc_no,',
'                             v_prod_date,',
'                             cr1.wfdc_type,',
'                             cr1.wfdc_wf_no,',
'                             cr1.wfdc_spplr_id,',
'                             cr1.wfdc_cust_id,',
'                             cr1.wfdc_prod_id,',
'                             cr1.wfdc_prod_rev,',
'                             cr1.wfdc_jrnl_type,',
'                             cr1.wfdc_rnd_prj_id,',
'                             cr1.wfdc_prj_id,',
'                             cr1.wfdc_lvl1,',
'                             cr1.wfdc_lvl2,',
'                             cr1.wfdc_lvl3,',
'                             cr1.wfdc_lvl4,',
'                             cr1.wfdc_lvl_prj,',
'                             cr1.wfdc_accts,',
'                             cr1.wfdc_qc_ins_mode,',
'                             cr1.wfdc_qc_rev,',
'                             NULL,',
'                             NULL,',
'                             NULL,',
'                             :global_user,',
'                             ''1'',',
'                             v_res,',
'                             v_res3,',
'                             var_msg,',
'                             var_err);',
'                             --raise_application_error(-20999, v_res||''/''||v_res3||''/''||var_msg||''/''||var_err);',
'       IF var_msg IS NOT NULL',
'       THEN',
'            v_err:=var_msg;',
'        GOTO msg;',
'       END IF;',
'',
'       IF var_err IS NOT NULL',
'       THEN',
'          v_err := var_err;',
'          GOTO msg;',
'       END IF;',
'                                    ',
' IF v_res IS NOT NULL  THEN',
'            v_err := v_res;',
'           GOTO msg;',
'END IF;',
'      END IF;',
'',
'   /*   IF v_res = ''N''',
'      THEN',
'         v_result := ''Y'';',
'      END IF;*/',
'    ',
'',
'   /*IF v_result = ''N''',
'   THEN',
'      v_err := v_result;--''Document Processed''; ',
'             GOTO msg;',
'   END IF;*/',
'   UPDATE work_flow_doc_control',
'         SET wfdc_select_flag = 0,',
'             wfdc_act = ''W'',',
'             wfdc_nxt_status = NULL,',
'             wfdc_nxt_fwd_person = NULL,',
'             wfdc_nxt_message = NULL',
'       WHERE wfdc_bu = :global_bu AND wfdc_wf_no = cr1.wfdc_wf_no;',
'',
'      SELECT COUNT (*)',
'        INTO e_cnt',
'        FROM work_flow_exp',
'       WHERE     wfe_bu = :global_bu',
'             AND wfe_type = cr1.wfdc_type',
'             AND wfe_wf_no = cr1.wfdc_wf_no;',
'   END LOOP c1;',
'',
'   IF e_cnt > 0',
'   THEN',
'      v_err := ''Refer Exceptions'';',
'   GOTO msg;',
'   END IF;',
'   <<msg>>',
'       raise_application_error (-20999, var_msg);',
'       ',
'/*EXCEPTION',
'   WHEN OTHERS',
'   THEN',
'      IF v_err IS NOT NULL',
'      THEN',
'           raise_application_error (-20999,''123''|| v_err);',
'             else',
'        ',
'         raise_application_error (',
'            (SQLCODE),',
'            func_find_err_msg (:global_bu,',
'                               ABS (SQLCODE),',
'                               SUBSTR (REPLACE (SQLERRM, '' '', ''''), 11, 3),',
'                               1,',
'                               :GLOBAL_USER));',
'    END IF;*/',
'',
'      COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11641587175241225866)
,p_internal_uid=>6159626765813614852
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11641587658741225871)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Forward & Return'
,p_static_id=>'forward-return'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CURSOR c1',
'   IS',
'      SELECT *',
'        FROM work_flow_doc_control',
'       WHERE wfdc_bu = :global_bu AND wfdc_select_flag = 1',
'             AND (wfdc_auth_type = ''P''',
'                  AND wfdc_ctrl_person =',
'                         func_find_position_id (:global_bu, :global_user)',
'                  OR wfdc_auth_type = ''E''',
'                     AND wfdc_ctrl_person =',
'                            func_find_emp_id (:global_bu, :global_user)',
'                  OR func_find_position_check (:global_bu, :global_user)',
'                        IS NULL)',
'             AND wfdc_status NOT IN (''C'', ''R'')',
'             AND wfdc_act <> ''W'';',
'',
'   --AND wfdc_wf_no = :P2361310101_WFDC_WF_NO;',
'',
'   CURSOR c2 (',
'      c_type      VARCHAR2,',
'      c_seq_no    NUMBER)',
'   IS',
'      SELECT wfaa_status',
'        FROM work_flow_appr_actvt',
'       WHERE     wfaa_bu = :global_bu',
'             AND wfaa_wf_id = c_type',
'             AND wfaa_seq_no = c_seq_no + 1;',
'',
'   CURSOR c3',
'   IS',
'      SELECT wfmc_doc_comp, wfmc_allow_dir_appr_fwd_flag',
'        FROM wfm_control',
'       WHERE wfmc_bu = :global_bu;',
'',
'',
'   --cr1              c1%ROWTYPE;',
'   cr2              c2%ROWTYPE;',
'   cr3              c3%ROWTYPE;',
'',
'   v_cnt            NUMBER (10);',
'   e_cnt            NUMBER (10);',
'   v_res            VARCHAR2 (1) := ''N'';',
'   v_res3           VARCHAR2 (4000);',
'   var_err          VARCHAR2 (4000);',
'   v_result         VARCHAR2 (1) := ''N'';',
'   chk_alert        NUMBER;',
'   chk_alert1       NUMBER;',
'   var_res          VARCHAR2 (1);',
'   v_nxt_status     VARCHAR2 (5);',
'   v_seq_no         NUMBER;',
'   v_wf_control     VARCHAR2 (1);',
'   v_wf_status      VARCHAR2 (2);',
'   v_out            VARCHAR2 (1);',
'   var_msg          VARCHAR2 (4000);',
'   v_dir_apr_flag   VARCHAR2 (1);',
'   v_prod_date      DATE;',
'   var_act_cnt      NUMBER := 0;',
'   v_err            VARCHAR2 (4000);',
'BEGIN',
'  ',
'   SELECT COUNT (*)',
'     INTO v_cnt',
'     FROM work_flow_doc_control',
'    WHERE     WFDC_BU = :GLOBAL_BU',
'          AND WFDC_SELECT_FLAG = 1',
'          AND WFDC_ACT NOT IN (''W'')',
'          AND (wfdc_auth_type = ''P''',
'               AND wfdc_ctrl_person =',
'                      func_find_position_id (:GLOBAL_bu, :GLOBAL_user)',
'               OR wfdc_auth_type = ''E''',
'                  AND wfdc_ctrl_person =',
'                         func_find_emp_id (:GLOBAL_bu, :GLOBAL_user)',
'               OR FUNC_FIND_POSITION_CHECK (:GLOBAL_BU, :GLOBAL_USER) IS NULL);',
'',
'',
'   FOR cr1 IN c1',
'   LOOP',
'      /*Forward */',
'      UPDATE work_flow_doc_control',
'         SET wfdc_nxt_fwd_person = :P2361310101_WFDC_NXT_FWD_PERS',
'       WHERE wfdc_bu = :global_bu AND wfdc_select_flag = 1 AND wfdc_act = ''F'';',
'',
'      /*Return */',
'      UPDATE work_flow_doc_control',
'         SET wfdc_nxt_fwd_person = :P2361310101_WFDC_NXT_FWD_PERS,',
'             wfdc_nxt_message = :P2361310101_WFDC_NXT_MESSAGE',
'       WHERE wfdc_bu = :global_bu AND wfdc_select_flag = 1 AND wfdc_act = ''R'';',
'',
'      ',
'      DBMS_APPLICATION_INFO.set_action (''proc_work_flow_dir_auth'');',
'     ',
'   IF V_CNT = 0',
'   THEN',
'      v_err := ''Please choose a action to perform''||v_cnt;',
'    goto msg;',
'   END IF;',
'      OPEN c3;',
'',
'      FETCH c3 INTO cr3;',
'',
'      IF c3%NOTFOUND',
'      THEN',
'         v_wf_control := ''S'';',
'      ELSE',
'         ',
'         v_wf_control := cr3.wfmc_doc_comp;',
'         v_dir_apr_flag := cr3.wfmc_allow_dir_appr_fwd_flag;',
'      END IF;',
'',
'      CLOSE c3;',
'',
'      IF v_wf_control = ''S''',
'      THEN',
'         proc_work_flow_dir_auth (:global_bu,',
'                                  cr1.wfdc_plnt,',
'                                  cr1.wfdc_type,',
'                                  cr1.wfdc_nxt_status,',
'                                  :global_user,',
'                                  cr1.wfdc_value,',
'                                  var_res);',
'      ELSE',
'         proc_work_flow_dir_auth_nonseq (:global_bu,',
'                                         cr1.wfdc_plnt,',
'                                         cr1.wfdc_type,',
'                                         :global_user,',
'                                         v_wf_status,',
'                                         v_out);',
'      END IF;',
'',
'       ',
'--raise_application_error (-20999, ''2''||cr1.wfdc_act||''/''||v_dir_apr_flag );',
'      IF cr1.wfdc_act = ''A'' AND v_dir_apr_flag = ''Y''',
'      THEN',
'         v_seq_no :=',
'            CASE',
'               WHEN v_wf_control = ''S''',
'               THEN',
'                  func_find_wf_appr_seq_no (:global_bu,',
'                                            cr1.wfdc_plnt,',
'                                            cr1.wfdc_type,',
'                                            cr1.wfdc_ctrl_person)',
'               WHEN v_wf_control = ''N''',
'               THEN',
'                  func_find_wf_appr_seq_no (:global_bu,',
'                                            cr1.wfdc_plnt,',
'                                            cr1.wfdc_type,',
'                                            cr1.wfdc_ctrl_person,',
'                                            NULL,',
'                                            ''A'',',
'                                            cr1.wfdc_value)',
'               ELSE',
'                  func_find_wf_appr_seq_no (:global_bu,',
'                                            cr1.wfdc_plnt,',
'                                            cr1.wfdc_type,',
'                                            cr1.wfdc_ctrl_person)',
'            END;',
'--raise_application_error (-20999, ''2''||cr1.wfdc_act||''/''||v_dir_apr_flag ||''/''||cr1.wfdc_type);',
'         OPEN c2 (cr1.wfdc_type, v_seq_no);',
'',
'         FETCH c2 INTO cr2;',
'',
'         CLOSE c2;',
'         ',
'         IF ( (:P2361310101_WFDC_NXT_FWD_PERS IS NULL OR :P2361310101_WFDC_NXT_MESSAGE IS NULL)',
'             AND (func_find_wf_appr_status (:global_bu, cr1.wfdc_type) <>',
'                     cr2.wfaa_status))',
'         THEN',
'            v_err := ''Forward details must be entered.'';',
'          GOTO msg;',
'         END IF;',
'      END IF;',
'    --raise_application_error (-20999, ''3''||cr1.wfdc_act); ',
'',
'      IF cr1.wfdc_act = ''A''',
'      THEN',
'       --raise_application_error (-20999, ''5''||cr1.wfdc_bu||''/''||cr1.wfdc_plnt||''/''||cr1.wfdc_type||''/''||cr1.wfdc_wf_no||''/''||v_wf_control||''/''||:global_user); ',
'         proc_doc_approve (cr1.wfdc_bu,',
'                           cr1.wfdc_plnt,',
'                           cr1.wfdc_type,',
'                           cr1.wfdc_wf_no,',
'                           v_wf_control,',
'                           :global_user,',
'                           ''1'',',
'                           var_msg,',
'                           var_err,',
'                           v_res);',
'',
'         --raise_application_error (-20999, ''4''||cr1.wfdc_act||''/''||var_msg||''/''||var_err); ',
'',
'         IF var_msg IS NOT NULL',
'          THEN',
'             v_err := var_msg;',
'             GOTO msg;',
'          END IF;',
'',
'          IF var_err IS NOT NULL',
'          THEN',
'             v_err := var_err;                                       --var_msg;',
'             GOTO msg;',
'          END IF;',
'',
'         IF v_wf_control = ''S''',
'         THEN',
'            v_seq_no := cr1.wfdc_seq_no;',
'         ELSE',
'            v_seq_no :=',
'               func_find_wf_appr_seq_no (:global_bu,',
'                                         cr1.wfdc_plnt,',
'                                         cr1.wfdc_type,',
'                                         cr1.wfdc_ctrl_person,',
'                                         NULL,',
'                                         ''A'',',
'                                         cr1.wfdc_value);',
'         END IF;',
'',
'         proc_work_flow_auth (:global_bu,',
'                              cr1.wfdc_plnt,',
'                              cr1.wfdc_type,',
'                              cr1.wfdc_ctrl_person,',
'                              cr1.wfdc_value,',
'                              v_seq_no,',
'                              v_out);',
'',
'         IF v_out = ''E''',
'         THEN',
'            var_msg :=',
'               ''Authorization limit exceeds. Do you wish to forward to Document ?'';',
'                GOTO msg;',
'         ELSE',
'            var_msg := ''Do you wish to forward to Document ?'';',
'             GOTO msg;',
'         END IF;',
'',
'         IF     cr1.wfdc_nxt_fwd_person IS NOT NULL',
'            AND cr1.wfdc_nxt_status IS NOT NULL',
'            AND cr1.wfdc_nxt_message IS NOT NULL',
'            AND v_res = ''N''',
'         THEN',
'           ',
'            proc_wf_doc_forward (:global_bu,',
'                                 cr1.wfdc_plnt,',
'                                 cr1.wfdc_type,',
'                                 cr1.wfdc_doc_pfx,',
'                                 cr1.wfdc_doc_no,',
'                                 cr1.wfdc_wf_no,',
'                                 :global_user,',
'                                 var_msg,',
'                                 v_res);',
'        ',
'         END IF;',
'      ELSIF cr1.wfdc_act = ''F''',
'      THEN',
'        /* APEX_APPLICATION.g_print_success_message :=',
'               ''<span style="color:white"> * ''',
'            || ''Document Processed.''',
'            || '' </span>'';*/',
'',
'        ',
'         IF v_wf_control = ''S''',
'         THEN',
'            v_seq_no := cr1.wfdc_seq_no;',
'            ',
'         ELSE',
'            v_seq_no :=',
'               func_find_wf_appr_seq_no (:global_bu,',
'                                         cr1.wfdc_plnt,',
'                                         cr1.wfdc_type,',
'                                         cr1.wfdc_ctrl_person,',
'                                         NULL,',
'                                         ''A'',',
'                                         cr1.wfdc_value);',
'         END IF;',
'',
'         proc_work_flow_auth (:global_bu,',
'                              cr1.wfdc_plnt,',
'                              cr1.wfdc_type,',
'                              cr1.wfdc_ctrl_person,',
'                              cr1.wfdc_value,',
'                              v_seq_no,',
'                              v_out);',
'',
'         v_nxt_status := func_find_wf_appr_status (:global_bu, cr1.wfdc_type);',
'',
'         v_seq_no :=',
'            func_find_wf_appr_seq_no (:global_bu,',
'                                      cr1.wfdc_plnt,',
'                                      cr1.wfdc_type,',
'                                      cr1.wfdc_ctrl_person);',
'',
'         SELECT COUNT (*)',
'           INTO var_act_cnt',
'           FROM work_flow_appr_actvt',
'          WHERE wfaa_bu = :global_bu AND wfaa_wf_id = cr1.wfdc_type;',
'',
'         IF var_act_cnt > 1 AND v_out <> ''E''',
'         THEN',
'            OPEN c2 (cr1.wfdc_type, v_seq_no);',
'',
'            FETCH c2 INTO cr2;',
'',
'            IF c2%FOUND',
'            THEN',
'               IF cr2.wfaa_status = cr1.wfdc_nxt_status',
'               THEN',
'                  v_err := ''Process the document and proceed.'';',
'                GOTO msg;',
'               END IF;',
'            END IF;',
'',
'            CLOSE c2;',
'         END IF;',
'',
'         OPEN c2 (cr1.wfdc_type, v_seq_no);',
'',
'         FETCH c2 INTO cr2;',
'',
'         CLOSE c2;',
'',
'',
'',
'         IF var_res = ''Y'' AND cr2.wfaa_status = v_nxt_status',
'         THEN',
'           ',
'            proc_wf_doc_forward (:global_bu,',
'                                 cr1.wfdc_plnt,',
'                                 cr1.wfdc_type,',
'                                 cr1.wfdc_doc_pfx,',
'                                 cr1.wfdc_doc_no,',
'                                 cr1.wfdc_wf_no,',
'                                 :global_user,',
'                                 var_msg,',
'                                 v_res);',
'         ',
' IF v_res IS NOT NULL  THEN',
'            v_err := v_res;',
'           GOTO msg;',
'END IF;',
'',
'         ELSE',
'         ',
'         proc_wf_doc_forward (:global_bu,',
'                                 cr1.wfdc_plnt,',
'                                 cr1.wfdc_type,',
'                                 cr1.wfdc_doc_pfx,',
'                                 cr1.wfdc_doc_no,',
'                                 cr1.wfdc_wf_no,',
'                                 :global_user,',
'                                 var_msg,',
'                                 v_res);',
'        IF v_res IS NOT NULL  THEN',
'            v_err := v_res;',
'           GOTO msg;',
'END IF;',
'',
'         END IF;',
'      ELSIF cr1.wfdc_act = ''R''',
'      THEN',
'       ',
'         proc_wf_doc_return (:global_bu,',
'                             cr1.wfdc_plnt,',
'                             cr1.wfdc_type,',
'                             cr1.wfdc_doc_pfx,',
'                             cr1.wfdc_doc_no,',
'                             cr1.wfdc_wf_no,',
'                             :global_user,',
'                             v_res);',
'                             ',
' IF v_res IS NOT NULL  THEN',
'            v_err := v_res;',
'           GOTO msg;',
'END IF;',
'      ELSIF cr1.wfdc_act = ''C''',
'      THEN',
'         /* WorkFlow Document Cancellation Database procedure */',
'',
'         IF cr1.wfdc_type = ''WF_PCHD''',
'         THEN',
'            SELECT TRUNC (pt_date)',
'              INTO v_prod_date',
'              FROM prod_transfer',
'             WHERE     pt_bu = cr1.wfdc_bu',
'                   AND pt_plnt = cr1.wfdc_plnt',
'                   AND pt_trans_no = cr1.wfdc_doc_no;',
'         END IF;',
'         proc_wf_doc_cancel (cr1.wfdc_bu,',
'                             :global_bu,',
'                             cr1.wfdc_plnt,',
'                             cr1.wfdc_doc_sfx,',
'                             cr1.wfdc_doc_pfx,',
'                             cr1.wfdc_doc_no,',
'                             v_prod_date,',
'                             cr1.wfdc_type,',
'                             cr1.wfdc_wf_no,',
'                             cr1.wfdc_spplr_id,',
'                             cr1.wfdc_cust_id,',
'                             cr1.wfdc_prod_id,',
'                             cr1.wfdc_prod_rev,',
'                             cr1.wfdc_jrnl_type,',
'                             cr1.wfdc_rnd_prj_id,',
'                             cr1.wfdc_prj_id,',
'                             cr1.wfdc_lvl1,',
'                             cr1.wfdc_lvl2,',
'                             cr1.wfdc_lvl3,',
'                             cr1.wfdc_lvl4,',
'                             cr1.wfdc_lvl_prj,',
'                             cr1.wfdc_accts,',
'                             cr1.wfdc_qc_ins_mode,',
'                             cr1.wfdc_qc_rev,',
'                             NULL,',
'                             NULL,',
'                             NULL,',
'                             :global_user,',
'                             ''1'',',
'                             v_res,',
'                             v_res3,',
'                             var_msg,',
'                             var_err);',
'                             --raise_application_error(-20999, v_res||''/''||v_res3||''/''||var_msg||''/''||var_err);',
'       IF var_msg IS NOT NULL',
'       THEN',
'            v_err:=var_msg;',
'        GOTO msg;',
'       END IF;',
'',
'       IF var_err IS NOT NULL',
'       THEN',
'          v_err := var_err;',
'          GOTO msg;',
'       END IF;',
'                                    ',
' IF v_res IS NOT NULL  THEN',
'            v_err := v_res;',
'           GOTO msg;',
'END IF;',
'      END IF;',
'',
'   /*   IF v_res = ''N''',
'      THEN',
'         v_result := ''Y'';',
'      END IF;*/',
'    ',
'',
'   /*IF v_result = ''N''',
'   THEN',
'      v_err := v_result;--''Document Processed''; ',
'             GOTO msg;',
'   END IF;*/',
'   UPDATE work_flow_doc_control',
'         SET wfdc_select_flag = 0,',
'             wfdc_act = ''W'',',
'             wfdc_nxt_status = NULL,',
'             wfdc_nxt_fwd_person = NULL,',
'             wfdc_nxt_message = NULL',
'       WHERE wfdc_bu = :global_bu AND wfdc_wf_no = cr1.wfdc_wf_no;',
'',
'      SELECT COUNT (*)',
'        INTO e_cnt',
'        FROM work_flow_exp',
'       WHERE     wfe_bu = :global_bu',
'             AND wfe_type = cr1.wfdc_type',
'             AND wfe_wf_no = cr1.wfdc_wf_no;',
'   END LOOP c1;',
'',
'   IF e_cnt > 0',
'   THEN',
'      v_err := ''Refer Exceptions'';',
'   GOTO msg;',
'   END IF;',
'   <<msg>>',
'       raise_application_error (-20999, var_msg);',
'       ',
'/*EXCEPTION',
'   WHEN OTHERS',
'   THEN',
'      IF v_err IS NOT NULL',
'      THEN',
'           raise_application_error (-20999,''123''|| v_err);',
'             else',
'        ',
'         raise_application_error (',
'            (SQLCODE),',
'            func_find_err_msg (:global_bu,',
'                               ABS (SQLCODE),',
'                               SUBSTR (REPLACE (SQLERRM, '' '', ''''), 11, 3),',
'                               1,',
'                               :GLOBAL_USER));',
'    END IF;',
'*/',
'      COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11641566820134222568)
,p_internal_uid=>6159625823197614843
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11641574334075222575)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Radio Change'
,p_static_id=>'radio-change'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   v_no      NUMBER;',
'   v_wf_no   NUMBER;',
'BEGIN',
'   FOR i IN 1 .. APEX_APPLICATION.g_f01.COUNT',
'   LOOP',
'      v_wf_no :=',
'         SUBSTR (REGEXP_SUBSTR (APEX_APPLICATION.g_f01 (i),',
'                                ''[^-]+'',',
'                                1,',
'                                1),',
'                 ''1'',',
'                 ''6'');',
'      v_no :=',
'         SUBSTR (REGEXP_SUBSTR (APEX_APPLICATION.g_f01 (i),',
'                                ''[^-]+'',',
'                                1,',
'                                1),',
'                 ''7'',',
'                 ''7'');',
'',
'      DECLARE',
'         CURSOR c1',
'         IS',
'            SELECT wfdc_select_flag, wfdc_wf_no',
'              FROM work_flow_doc_control',
'             WHERE wfdc_bu = :global_bu AND wfdc_wf_no = v_wf_no;',
'      BEGIN',
'         FOR cr1 IN c1',
'         LOOP',
'         --raise_application_error(-20999,cr1.wfdc_wf_no ||''/''||cr1.wfdc_select_flag);',
'            IF cr1.wfdc_wf_no = v_wf_no',
'            THEN',
'               IF cr1.wfdc_select_flag = 0 then',
'               ',
'                  --raise_application_error(-20999,''1'');',
'                  UPDATE work_flow_doc_control',
'                     SET wfdc_select_flag = 1',
'                   WHERE wfdc_bu = :global_bu',
'                         --AND wfdc_select_flag = 1',
'                         AND wfdc_wf_no || wfdc_select_flag =',
'                                APEX_APPLICATION.g_f01 (i);',
'               --           commit;',
'',
'              ',
'               END IF;',
'            END IF;',
'',
'            COMMIT;',
'         END LOOP;',
'      END;',
'   END LOOP;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>6159612498531611547
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11641575180238222575)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Select/unselect all'
,p_static_id=>'select-unselect-all'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CURSOR c1',
'   IS',
'      SELECT *',
'        FROM work_flow_doc_control',
'       WHERE WFDC_BU = :global_bu',
'                 AND (wfdc_auth_type = ''P''',
'                      AND wfdc_ctrl_person =',
'                             func_find_position_id (:global_bu, :global_user)',
'                      OR wfdc_auth_type = ''E''',
'                         AND wfdc_ctrl_person =',
'                                func_find_emp_id (:global_bu, :global_user))',
'                 AND (wfdc_type, wfdc_status) NOT IN',
'                        (SELECT WFAA_WF_ID, WFAA_STATUS',
'                           FROM WORK_FLOW_APPR_ACTVT',
'                          WHERE WFAA_BU = :GLOBAL_BU',
'                                AND (WFAA_WF_ID, WFAA_SEQ_NO) IN',
'                                       (  SELECT WFAA_WF_ID,',
'                                                 MAX (WFAA_SEQ_NO) WFAA_SEQ_NO',
'                                            FROM WORK_FLOW_APPR_ACTVT',
'                                           WHERE WFAA_BU = :GLOBAL_BU',
'                                        GROUP BY WFAA_WF_ID))',
'                 AND wfdc_status NOT IN (''C'', ''R'', ''S'');',
'',
'BEGIN',
'',
'    FOR cr1 IN c1',
'       LOOP',
'      IF cr1.wfdc_select_flag = 0',
'      THEN',
'          ',
'         UPDATE work_flow_doc_control',
'            SET wfdc_select_flag = 1',
'          WHERE     wfdc_bu = :global_bu',
'                AND wfdc_select_flag = 0',
'                AND wfdc_wf_no = cr1.WFDC_WF_NO;',
' ',
'--end loop;',
'else',
' ',
'         UPDATE work_flow_doc_control',
'            SET wfdc_select_flag = 0,',
'                wfdc_nxt_status = NULL,',
'                wfdc_nxt_message = NULL,',
'                wfdc_nxt_fwd_person = NULL,',
'                wfdc_nxt_fwd_entity = NULL',
'          WHERE     wfdc_bu = :global_bu',
'                AND wfdc_select_flag = 1',
'                AND wfdc_wf_no = cr1.WFDC_WF_NO;',
'       ',
'      END IF;',
'   END LOOP;    ',
' ',
'COMMIT;',
'  ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11641563690254222562)
,p_internal_uid=>6159613344694611547
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11641588677681225881)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Wait'
,p_static_id=>'wait'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CURSOR c1',
'   IS',
'      SELECT *',
'        FROM work_flow_doc_control',
'       WHERE wfdc_bu = :global_bu AND wfdc_select_flag = 1',
'             AND (wfdc_auth_type = ''P''',
'                  AND wfdc_ctrl_person =',
'                         func_find_position_id (:global_bu, :global_user)',
'                  OR wfdc_auth_type = ''E''',
'                     AND wfdc_ctrl_person =',
'                            func_find_emp_id (:global_bu, :global_user)',
'                  OR func_find_position_check (:global_bu, :global_user)',
'                        IS NULL)',
'             AND wfdc_status NOT IN (''C'', ''R'')',
'             AND wfdc_act <> ''W'';',
'',
'   ',
'BEGIN',
'',
'   FOR cr1 IN c1',
'   LOOP',
'      ',
'   UPDATE work_flow_doc_control',
'         SET wfdc_select_flag = 0,',
'             wfdc_act = ''W'',',
'             wfdc_nxt_status = NULL,',
'             wfdc_nxt_fwd_person = NULL,',
'             wfdc_nxt_message = NULL',
'       WHERE wfdc_bu = :global_bu AND wfdc_wf_no = cr1.wfdc_wf_no AND wfdc_select_flag = 1;',
'',
'   End Loop;',
'      COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(11641587299379225867)
,p_internal_uid=>6159626842137614853
);
wwv_flow_imp.component_end;
end;
/
