prompt --application/pages/page_236131010001
begin
--   Manifest
--     PAGE: 236131010001
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
 p_id=>236131010001
,p_name=>'Doc. Approval'
,p_alias=>'DOC-APPROVAL1'
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
'/* For Report Header */',
'.a-IRR-table {',
'    border-collapse: collapse;',
'    table-layout: auto;',
'    border-spacing: 0;',
'    white-space: nowrap;',
'    word-wrap: break-word;',
'}',
'/*Scroll at top*/',
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
 p_id=>wwv_flow_imp.id(22078543984739176615)
,p_plug_name=>'Approval'
,p_static_id=>'approval'
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
 p_id=>wwv_flow_imp.id(37207466934615800089)
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
'         AND (WFDC_TYPE = :P236131010001_TYPE OR :P236131010001_TYPE IS NULL)',
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
,p_ajax_items_to_submit=>'P236131010001_WFDC_TYPE'
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
 p_id=>wwv_flow_imp.id(37224075278168242270)
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
,p_internal_uid=>31080233248761721009
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641490650276209796)
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
 p_id=>wwv_flow_imp.id(11641492241550209798)
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
 p_id=>wwv_flow_imp.id(11641491860694209798)
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
 p_id=>wwv_flow_imp.id(11641494295737209800)
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
 p_id=>wwv_flow_imp.id(11641494676436209801)
,p_db_column_name=>'Doc. Detail'
,p_display_order=>1080
,p_column_identifier=>'DG'
,p_column_label=>'Doc. Details'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641489883225209795)
,p_db_column_name=>'Doc.Type'
,p_display_order=>800
,p_column_identifier=>'CB'
,p_column_label=>'Doc. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641488671703209795)
,p_db_column_name=>'Entity'
,p_display_order=>750
,p_column_identifier=>'BW'
,p_column_label=>'Entity'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641495473910209801)
,p_db_column_name=>'Fwd. By'
,p_display_order=>1090
,p_column_identifier=>'DH'
,p_column_label=>'Fwd. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641495916813209801)
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
 p_id=>wwv_flow_imp.id(11641491441945209798)
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
 p_id=>wwv_flow_imp.id(11641487854994209793)
,p_db_column_name=>'No.'
,p_display_order=>700
,p_column_identifier=>'BR'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641489518153209795)
,p_db_column_name=>'Party'
,p_display_order=>780
,p_column_identifier=>'BZ'
,p_column_label=>'Party'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641487447076209793)
,p_db_column_name=>'Pfx.'
,p_display_order=>690
,p_column_identifier=>'BQ'
,p_column_label=>'Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641489113144209795)
,p_db_column_name=>'Plant'
,p_display_order=>760
,p_column_identifier=>'BX'
,p_column_label=>'Unit ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641496292644209803)
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
 p_id=>wwv_flow_imp.id(11641496726532209803)
,p_db_column_name=>'Unit'
,p_display_order=>1120
,p_column_identifier=>'DK'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641488317825209795)
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
 p_id=>wwv_flow_imp.id(11641468692952209775)
,p_db_column_name=>'WFDC_ACCTS'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Wfdc Accts'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641479871757209786)
,p_db_column_name=>'WFDC_ACT'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Wfdc Act'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641471914749209778)
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
 p_id=>wwv_flow_imp.id(11641482665029209789)
,p_db_column_name=>'WFDC_AUTH_TYPE'
,p_display_order=>570
,p_column_identifier=>'BE'
,p_column_label=>'Wfdc Auth Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641483918513209790)
,p_db_column_name=>'WFDC_BENF_ID'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Wfdc Benf Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641483450938209790)
,p_db_column_name=>'WFDC_BENF_TYPE'
,p_display_order=>590
,p_column_identifier=>'BG'
,p_column_label=>'Wfdc Benf Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641485835085209792)
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
 p_id=>wwv_flow_imp.id(11641484312069209790)
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
 p_id=>wwv_flow_imp.id(11641484673036209790)
,p_db_column_name=>'WFDC_BILL_NO'
,p_display_order=>620
,p_column_identifier=>'BJ'
,p_column_label=>'Wfdc Bill No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641464634670209770)
,p_db_column_name=>'WFDC_BU'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Wfdc Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641477503049209784)
,p_db_column_name=>'WFDC_CRE_BY'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Wfdc Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641477867442209784)
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
 p_id=>wwv_flow_imp.id(11641465843629209771)
,p_db_column_name=>'WFDC_CTRL_PERSON'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Wfdc Ctrl Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641466659588209773)
,p_db_column_name=>'WFDC_CUST_ID'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Wfdc Cust Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641483035798209790)
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
 p_id=>wwv_flow_imp.id(11641493070025209800)
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
 p_id=>wwv_flow_imp.id(11641492662296209800)
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
 p_id=>wwv_flow_imp.id(11641474702846209781)
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
 p_id=>wwv_flow_imp.id(11641487067976209793)
,p_db_column_name=>'WFDC_EMP_ID'
,p_display_order=>680
,p_column_identifier=>'BP'
,p_column_label=>'Wfdc Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641470245481209776)
,p_db_column_name=>'WFDC_FRWD_RTN'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Wfdc Frwd Rtn'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641495115956209801)
,p_db_column_name=>'WFDC_FWD_PERSON'
,p_display_order=>1130
,p_column_identifier=>'DL'
,p_column_label=>'Wfdc Fwd Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641479087542209786)
,p_db_column_name=>'WFDC_FWD_TO'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Wfdc Fwd To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641485035755209792)
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
 p_id=>wwv_flow_imp.id(11641476656919209782)
,p_db_column_name=>'WFDC_INT_MSG_FLAG'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Wfdc Int Msg Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641486640808209793)
,p_db_column_name=>'WFDC_INV_NO'
,p_display_order=>670
,p_column_identifier=>'BO'
,p_column_label=>'Wfdc Inv No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641486296969209792)
,p_db_column_name=>'WFDC_INV_PFX'
,p_display_order=>660
,p_column_identifier=>'BN'
,p_column_label=>'Wfdc Inv Pfx'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641469913721209776)
,p_db_column_name=>'WFDC_JRNL_TYPE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Wfdc Jrnl Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641467105612209773)
,p_db_column_name=>'WFDC_LVL1'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Wfdc Lvl1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641467446275209775)
,p_db_column_name=>'WFDC_LVL2'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Wfdc Lvl2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641467885600209775)
,p_db_column_name=>'WFDC_LVL3'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Wfdc Lvl3'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641468299945209775)
,p_db_column_name=>'WFDC_LVL4'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Wfdc Lvl4'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641482290022209789)
,p_db_column_name=>'WFDC_LVL_PRJ'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Wfdc Lvl Prj'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641476234702209782)
,p_db_column_name=>'WFDC_MAIL_FLAG'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Wfdc Mail Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641481859030209789)
,p_db_column_name=>'WFDC_MAIL_SEND_FLAG'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Wfdc Mail Send Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641471067572209778)
,p_db_column_name=>'WFDC_MESSAGE'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Wfdc Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641480636066209787)
,p_db_column_name=>'WFDC_NXT_FWD_ENTITY'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'Wfdc Nxt Fwd Entity'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641490272397209796)
,p_db_column_name=>'WFDC_NXT_FWD_PERSON'
,p_display_order=>810
,p_column_identifier=>'CC'
,p_column_label=>'Wfdc Nxt Fwd Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641481446112209789)
,p_db_column_name=>'WFDC_NXT_FWD_PLNT'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Wfdc Nxt Fwd Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641480240401209787)
,p_db_column_name=>'WFDC_NXT_MESSAGE'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Wfdc Nxt Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641479443099209786)
,p_db_column_name=>'WFDC_NXT_STATUS'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Wfdc Nxt Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641475505325209782)
,p_db_column_name=>'WFDC_PLNT'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Wfdc Plnt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641470646462209778)
,p_db_column_name=>'WFDC_PO_MODE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Wfdc Po Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641473833760209781)
,p_db_column_name=>'WFDC_PRIORITY'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Wfdc Priority'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641469059845209776)
,p_db_column_name=>'WFDC_PRJ_ID'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Wfdc Prj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641473101552209779)
,p_db_column_name=>'WFDC_PROD_ID'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Wfdc Prod Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641473481277209779)
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
 p_id=>wwv_flow_imp.id(11641472724099209779)
,p_db_column_name=>'WFDC_QC_INS_MODE'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Wfdc Qc Ins Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641472307505209779)
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
 p_id=>wwv_flow_imp.id(11641469460601209776)
,p_db_column_name=>'WFDC_RND_PRJ_ID'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Wfdc Rnd Prj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641475917150209782)
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
 p_id=>wwv_flow_imp.id(11641471447960209778)
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
 p_id=>wwv_flow_imp.id(11641477115814209782)
,p_db_column_name=>'WFDC_SMS_FLAG'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Wfdc Sms Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641466269438209771)
,p_db_column_name=>'WFDC_SPPLR_ID'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Wfdc Spplr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641493451624209800)
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
 p_id=>wwv_flow_imp.id(11641493848494209800)
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
 p_id=>wwv_flow_imp.id(11641481121315209787)
,p_db_column_name=>'WFDC_SRC_USER'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Wfdc Src User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641465458219209771)
,p_db_column_name=>'WFDC_STATUS'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Wfdc Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641485506233209792)
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
 p_id=>wwv_flow_imp.id(11641465055999209771)
,p_db_column_name=>'WFDC_TYPE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Wfdc Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641478272739209784)
,p_db_column_name=>'WFDC_UPD_BY'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Wfdc Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641478685416209786)
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
 p_id=>wwv_flow_imp.id(11641474266034209781)
,p_db_column_name=>'WFDC_WF_NO'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Wfdc Wf No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641475059225209781)
,p_db_column_name=>'WFDC_WRK_CNTR'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Wfdc Wrk Cntr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11641491089259209798)
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
 p_id=>wwv_flow_imp.id(37224139727601249683)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'54976550'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'select:Entity:Unit:Doc.Type:No.:Doc. Date:Doc. Detail:Value:Fwd. By:Fwd. Date:Time Elasped:DTLS:DOC:HIST'
,p_sort_column_1=>'ROWNUM'
,p_sort_direction_1=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11641497761685209809)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(37207466934615800089)
,p_button_name=>'Approval'
,p_static_id=>'approval'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Approval'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11641499291624209815)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(22078543984739176615)
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
 p_id=>wwv_flow_imp.id(11641497378377209807)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(37207466934615800089)
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
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(11641518697211209845)
,p_branch_name=>'Go To Page 236131010'
,p_branch_action=>'javascript:openModal(''SUB'');'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(11641497761685209809)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(11641519062076209845)
,p_branch_name=>'Go To Page 23613101001'
,p_branch_action=>'f?p=&APP_ID.:23613101001:&SESSION.::&DEBUG.:RP,23613101001:P23613101001_DOC_BU,P23613101001_DOC_NO,P23613101001_DOC_PFX,P23613101001_PLNT,P23613101001_WF_TYPE:&P236131010001_WFDC_SRC_BU.,&P236131010001_WFDC_DOC_NO.,&P236131010001_WFDC_DOC_PFX.,&P236131010001_WFDC_SRC_PLNT.,&P236131010001_WFDC_TYPE.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>11
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'LOG'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641498203292209811)
,p_name=>'P236131010001_COUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(37207466934615800089)
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
 p_id=>wwv_flow_imp.id(11641504094243209818)
,p_name=>'P236131010001_FWD_ON'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(22078543984739176615)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641504437509209818)
,p_name=>'P236131010001_NEXT_PROCESS'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(22078543984739176615)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P236131010001_WFDC_ACT'
,p_display_when2=>'F'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641498559612209812)
,p_name=>'P236131010001_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(37207466934615800089)
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
 p_id=>wwv_flow_imp.id(11641499667997209815)
,p_name=>'P236131010001_WFDC_ACT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(37207466934615800089)
,p_item_default=>'W'
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Approve;A,Forward;F,Return;R,Cancel;C,Wait ;W'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--xlarge:margin-bottom-lg:t-Form-fieldContainer--radioButtonGroup'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '5',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641502128060209817)
,p_name=>'P236131010001_WFDC_CTRL_PERSON'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(22078543984739176615)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641501234799209817)
,p_name=>'P236131010001_WFDC_DOC_NO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(22078543984739176615)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641501690677209817)
,p_name=>'P236131010001_WFDC_DOC_PFX'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(22078543984739176615)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641503640394209818)
,p_name=>'P236131010001_WFDC_MESSAGE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(22078543984739176615)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P236131010001_WFDC_ACT'
,p_display_when2=>'F'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641505246041209820)
,p_name=>'P236131010001_WFDC_NXT_FWD_ENT'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(22078543984739176615)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641506085274209821)
,p_name=>'P236131010001_WFDC_NXT_FWD_NM'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(22078543984739176615)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641504880478209818)
,p_name=>'P236131010001_WFDC_NXT_FWD_PERS'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(37207466934615800089)
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
'                 AND func_find_wf_basis (:global_bu,:P236131010001_WFDC_TYPE,(:P236131010001_WFDC_SEQ_NO+1)) = ''O''',
'        GROUP BY emp_name, emp, func_find_user_id (:global_bu, emp)',
'        UNION ALL',
'        SELECT func_find_employee_desc (weh_bu, weh_par_emp_id, ''1'') emp_desc,',
'               weh_par_emp_id,',
'               weh_par_emp_id user_id,',
'               func_find_user_plant(:GLOBAL_BU,FUNC_FIND_USER_ID(:GLOBAL_BU,weh_par_emp_id)) user_unit',
'          FROM wf_emp_hierarchy',
'         WHERE     weh_bu = :global_bu',
'               AND weh_emp_id = func_find_emp_id (:global_bu, :global_user)',
'               AND func_find_wf_basis (:global_bu, :P236131010001_WFDC_TYPE,(:P236131010001_WFDC_SEQ_NO+1)) = ''E''',
'       union all',
'       SELECT func_find_employee_desc (WFDA_APPR_BU, WFDA_POSITION, 1) EMP_DESC,',
'       WFDA_POSITION,',
'       func_find_user_id (WFDA_APPR_BU, WFDA_POSITION) user1,',
'              WFDA_PLNT',
'  FROM WF_DIRECT_AUTHORIZATION',
' WHERE     WFDA_BU = :global_bu',
'       AND wfda_dflt_flag = ''Y''',
'       AND func_find_wf_basis (:GLOBAL_bu, :P236131010001_WFDC_TYPE,(:P236131010001_WFDC_SEQ_NO+1)) = ''U'')',
' WHERE :P236131010001_wfdc_act IN (''A'', ''F'')',
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
'                         AND wfdcl_type = :P236131010001_wfdc_type --AND wfdcl_wf_no = :P236131010001_wfdc_wf_no',
'                AND wfdcl_ctrl_person <> :P236131010001_wfdc_ctrl_person',
'                GROUP BY wfdcl_ctrl_person, wfdcl_auth_type',
'                ORDER BY 2))',
' WHERE :P236131010001_wfdc_act = ''R'')'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P236131010001_WFDC_ACT,P236131010001_WFDC_TYPE'
,p_ajax_items_to_submit=>'P236131010001_WFDC_ACT,P236131010001_WFDC_TYPE'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_display_when=>'P236131010001_WFDC_ACT'
,p_display_when2=>'W'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641505649099209821)
,p_name=>'P236131010001_WFDC_NXT_FWD_PLNT'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(22078543984739176615)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641506518108209821)
,p_name=>'P236131010001_WFDC_NXT_MESSAGE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(37207466934615800089)
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
 p_id=>wwv_flow_imp.id(11641506837020209821)
,p_name=>'P236131010001_WFDC_NXT_STATUS'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(22078543984739176615)
,p_use_cache_before_default=>'NO'
,p_item_default=>'A'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>'P236131010001_WFDC_ACT'
,p_display_when2=>'F'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641507288041209821)
,p_name=>'P236131010001_WFDC_NXT_STAT_DES'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(22078543984739176615)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641503303207209818)
,p_name=>'P236131010001_WFDC_SELECT_FLAG'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(22078543984739176615)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641502449946209817)
,p_name=>'P236131010001_WFDC_SEQ_NO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(22078543984739176615)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641500475991209815)
,p_name=>'P236131010001_WFDC_SRC_BU'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(22078543984739176615)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641500904011209817)
,p_name=>'P236131010001_WFDC_SRC_PLNT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(22078543984739176615)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641500057559209815)
,p_name=>'P236131010001_WFDC_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(22078543984739176615)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11641502850503209818)
,p_name=>'P236131010001_WFDC_WF_NO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(22078543984739176615)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(11641507738619209829)
,p_validation_name=>'WFDC_NXT_MESSAGE'
,p_static_id=>'wfdc-nxt-message'
,p_validation_sequence=>10
,p_validation=>'P236131010001_WFDC_NXT_MESSAGE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Message must be entered for return type.'
,p_validation_condition=>'P236131010001_WFDC_ACT'
,p_validation_condition2=>'R'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_when_button_pressed=>wwv_flow_imp.id(11641499291624209815)
,p_associated_item=>wwv_flow_imp.id(11641506518108209821)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11641516823867209843)
,p_name=>'close modal for wait'
,p_static_id=>'close-modal-for-wait'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P236131010001_WFDC_ACT'
,p_condition_element=>'P236131010001_WFDC_ACT'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'W'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641517231800209843)
,p_event_id=>wwv_flow_imp.id(11641516823867209843)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'closeModal(''SUB'');')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11641517645693209843)
,p_name=>'count'
,p_static_id=>'count'
,p_event_sequence=>90
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641518171014209843)
,p_event_id=>wwv_flow_imp.id(11641517645693209843)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-set-focus'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236131010001_COUNT'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11641509281854209834)
,p_name=>'java'
,p_static_id=>'java'
,p_event_sequence=>60
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'myreport'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641510278273209836)
,p_event_id=>wwv_flow_imp.id(11641509281854209834)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P236131010001_WFDC_SELECT_FLAG,P236131010001_WFDC_WF_NO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/* Formatted on 11/20/2020 10:32:22 AM (QP5 v5.163.1008.3004) */',
    'IF :P236131010001_WFDC_SELECT_FLAG = 0 THEN',
    '',
    '--raise_application_error(-20999,''1''||:P236131010001_WFDC_SELECT_FLAG||:P236131010001_WFDC_WF_NO);',
    '',
    'UPDATE work_flow_doc_control',
    '   SET wfdc_select_flag = 1',
    ' WHERE     wfdc_bu = :global_bu',
    '       AND wfdc_select_flag = 0',
    '       AND wfdc_wf_no = :P236131010001_WFDC_WF_NO;',
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
    '       AND wfdc_wf_no = :p236131010001_wfdc_wf_no;',
    'COMMIT;',
    '',
    '',
    'END IF;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641509785517209834)
,p_event_id=>wwv_flow_imp.id(11641509281854209834)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item( "P236131010001_WFDC_SELECT_FLAG" ).setValue( this.data.WFDC_SELECT_FLAG );',
    'apex.item( "P236131010001_WFDC_WF_NO" ).setValue( this.data.WFDC_WF_NO);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641510790157209839)
,p_event_id=>wwv_flow_imp.id(11641509281854209834)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(37207466934615800089)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11641511187176209839)
,p_name=>'java_1'
,p_static_id=>'java-2'
,p_event_sequence=>70
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
 p_id=>wwv_flow_imp.id(11641511640309209839)
,p_event_id=>wwv_flow_imp.id(11641511187176209839)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P236131010001_WFDC_SELECT_FLAG,P236131010001_WFDC_WF_NO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/* Formatted on 11/20/2020 10:32:22 AM (QP5 v5.163.1008.3004) */',
    'IF :P236131010001_WFDC_SELECT_FLAG = 0 THEN',
    '',
    '--raise_application_error(-20999,''1''||:P236131010001_WFDC_SELECT_FLAG||:P236131010001_WFDC_WF_NO);',
    '',
    'UPDATE work_flow_doc_control',
    '   SET wfdc_select_flag = 1',
    ' WHERE     wfdc_bu = :global_bu',
    '       AND wfdc_select_flag = 0;',
    '       --AND wfdc_wf_no = :P236131010001_WFDC_WF_NO;',
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
    '       --AND wfdc_wf_no = :p236131010001_wfdc_wf_no;',
    'COMMIT;',
    '',
    '',
    'END IF;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641512630256209840)
,p_event_id=>wwv_flow_imp.id(11641511187176209839)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item( "P236131010001_WFDC_SELECT_FLAG" ).setValue( this.data.WFDC_SELECT_FLAG );',
    '//apex.item( "P236131010001_WFDC_WF_NO" ).setValue( this.data.WFDC_WF_NO);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641512191595209839)
,p_event_id=>wwv_flow_imp.id(11641511187176209839)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(37207466934615800089)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11641513071553209840)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(37207466934615800089)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641513541014209840)
,p_event_id=>wwv_flow_imp.id(11641513071553209840)
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
 p_id=>wwv_flow_imp.id(11641515379213209842)
,p_name=>'process radio group'
,p_static_id=>'process-radio-group'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P236131010001_WFDC_ACT'
,p_condition_element=>'P236131010001_WFDC_ACT'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641515882008209842)
,p_event_id=>wwv_flow_imp.id(11641515379213209842)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P236131010001_WFDC_TYPE,P236131010001_WFDC_CTRL_PERSON,P236131010001_WFDC_SEQ_NO,P236131010001_WFDC_SELECT_FLAG,P236131010001_WFDC_NXT_FWD_PERS,P236131010001_WFDC_NXT_FWD_ENT,P236131010001_WFDC_NXT_FWD_PLNT,P236131010001_WFDC_NXT_FWD_NM,P236131010001'
||'_WFDC_NXT_MESSAGE,P236131010001_WFDC_NXT_STATUS,P236131010001_WFDC_NXT_STAT_DES',
  'items_to_submit', 'P236131010001_WFDC_ACT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
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
    '  :P236131010001_WFDC_TYPE := cr1.WFDC_TYPE ;',
    '  :P236131010001_WFDC_CTRL_PERSON := cr1.WFDC_CTRL_PERSON ;',
    '  :P236131010001_WFDC_SEQ_NO := cr1.WFDC_SEQ_NO  ;',
    '  If (:P236131010001_WFDC_ACT = ''R'') then',
    '    :P236131010001_WFDC_WF_NO := cr1.WFDC_WF_NO;',
    '    End if;',
    ' PROC_WF_RADIO_CHANGE_APEX_WEB (',
    '   p_bu                           => :global_bu,',
    '   p_user                         => :global_user,',
    '   p_WFDC_TYPE                    => cr1.WFDC_TYPE,',
    '   p_WFDC_STATUS                  => cr1.WFDC_STATUS,',
    '   p_WFDC_ACT                     => :P236131010001_WFDC_ACT,',
    '   p_WFDC_PLNT                    => cr1.WFDC_PLNT,',
    '   p_WFDC_VALUE                   => cr1.WFDC_VALUE,',
    '   P_WFDC_WF_NO                   => cr1.WFDC_WF_NO,',
    '   P_WFDC_SEQ_NO                  => cr1.WFDC_SEQ_NO,    ',
    '   P_WFDC_CTRL_PERSON             => cr1.WFDC_CTRL_PERSON,',
    '   P_WFDC_SRC_BU                  => cr1.WFDC_SRC_BU,     ',
    '   P_WFDC_DOC_PFX                 => cr1.WFDC_DOC_PFX,',
    '   P_WFDC_DOC_NO                  => cr1.WFDC_DOC_NO,',
    '   p_WFDC_SELECT_FLAG             => :P236131010001_WFDC_SELECT_FLAG,',
    '   p_WFDC_NXT_STATUS              => :P236131010001_WFDC_NXT_STATUS,',
    '   p_WFDC_NXT_STATUS_DESC         => :P236131010001_WFDC_NXT_STAT_DES,',
    '   p_WFDC_NXT_MESSAGE             => :P236131010001_WFDC_NXT_MESSAGE,',
    '   P_WFDC_NXT_FWD_PERSON          => :P236131010001_WFDC_NXT_FWD_PERS,',
    '   P_WFDC_NXT_FWD_ENTITY          => :P236131010001_WFDC_NXT_FWD_ENT,',
    '   P_WFDC_NXT_FWD_PLNT            => :P236131010001_WFDC_NXT_FWD_PLNT,',
    '   P_WFDC_NXT_FWD_PERSON_NM       => :P236131010001_WFDC_NXT_FWD_NM);',
    '    --raise_application_error(-20999,:P236131010001_WFDC_NXT_FWD_PERS);',
    'commit;',
    'UPDATE work_flow_doc_control',
    '  SET wfdc_act = :P236131010001_WFDC_ACT,',
    '      wfdc_select_flag  =:P236131010001_WFDC_SELECT_FLAG,',
    '      wfdc_nxt_status = :P236131010001_WFDC_NXT_STATUS,',
    '      wfdc_nxt_message = :P236131010001_WFDC_NXT_MESSAGE,',
    '      wfdc_nxt_fwd_person = :P236131010001_WFDC_NXT_FWD_PERS,',
    '      wfdc_nxt_fwd_entity = :P236131010001_WFDC_NXT_FWD_ENT',
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
 p_id=>wwv_flow_imp.id(11641516357033209843)
,p_event_id=>wwv_flow_imp.id(11641515379213209842)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(37207466934615800089)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11641513980229209840)
,p_name=>'show/hide'
,p_static_id=>'show-hide'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P236131010001_WFDC_ACT'
,p_condition_element=>'P236131010001_WFDC_ACT'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'F, R'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641514465979209842)
,p_event_id=>wwv_flow_imp.id(11641513980229209840)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236131010001_WFDC_NXT_FWD_PERS,P236131010001_WFDC_NXT_MESSAGE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11641514946279209842)
,p_event_id=>wwv_flow_imp.id(11641513980229209840)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P236131010001_WFDC_NXT_FWD_PERS,P236131010001_WFDC_NXT_MESSAGE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11641508055763209829)
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
,p_internal_uid=>6159546220219598801
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11641508881527209832)
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
,p_process_when_button_id=>wwv_flow_imp.id(11641497378377209807)
,p_internal_uid=>6159547045983598804
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11641508474674209831)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Workflow'
,p_static_id=>'workflow'
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
'   --AND wfdc_wf_no = :P236131010001_WFDC_WF_NO;',
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
'         SET wfdc_nxt_fwd_person = :P236131010001_WFDC_NXT_FWD_PERS',
'       WHERE wfdc_bu = :global_bu AND wfdc_select_flag = 1 AND wfdc_act = ''F'';',
'',
'      /*Return */',
'      UPDATE work_flow_doc_control',
'         SET wfdc_nxt_fwd_person = :P236131010001_WFDC_NXT_FWD_PERS,',
'             wfdc_nxt_message = :P236131010001_WFDC_NXT_MESSAGE',
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
'         IF ( (:P236131010001_WFDC_NXT_FWD_PERS IS NULL OR :P236131010001_WFDC_NXT_MESSAGE IS NULL)',
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
,p_process_when_button_id=>wwv_flow_imp.id(11641499291624209815)
,p_internal_uid=>6159546639130598803
);
wwv_flow_imp.component_end;
end;
/
