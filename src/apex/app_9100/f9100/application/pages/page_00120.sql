prompt --application/pages/page_00120
begin
--   Manifest
--     PAGE: 00120
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
 p_id=>120
,p_name=>'test'
,p_alias=>'TEST1'
,p_step_title=>'test'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(6339300137962061229)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(18094920189568187222)
,p_name=>'Announcement'
,p_static_id=>'announcement'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_component_template_options=>'#DEFAULT#:u-colors:t-MediaList--stack'
,p_new_grid_row=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select GN_BU,',
'       GN_DOC_NO,',
'       GN_DOC_DATE ,',
'		 to_char(GN_DOC_DATE,''Mon DD, YYYY HH:MI AM'') list_text,',
'       --''fa fa-calendar'' LIST_ICON_VALUE,',
'        to_char(GN_DOC_DATE,''Mon DD YYYY HH:MI AM'')   list_badge,',
'		  ''fa fa-bullhorn'' icon_class  ,',
'       --''<span aria-hidden="true" class="fa fa-bullhorn fa-anim-vertical-shake" style="color: #000B79;"></span>''|| ''    '' ||INITCAP(GN_NOTI_HD) list_title,',
'       ''<style>',
'            #more''',
'|| GN_DOC_NO',
'|| ''{',
'                display: none;',
'            }',
'        </style>    ',
'        <script>',
'            function myFunction(GN_DOC_NO) {',
'            var dots = document.getElementById("dots" + GN_DOC_NO);',
'            var moreText = document.getElementById("more" + GN_DOC_NO);',
'            var btnText = document.getElementById("myBtn" + GN_DOC_NO);',
'                ',
'            if (dots.style.display === "none") {',
'                dots.style.display = "inline";',
'                btnText.innerHTML = "Read More"; ',
'                moreText.style.display = "none";',
'            } else {',
'                dots.style.display = "none";',
'                btnText.innerHTML = "Read Less"; ',
'                moreText.style.display = "inline";',
'            }',
'            }',
'            </script>''',
'|| ''<div class="a"><SPAN STYLE="font-size:12px; "> ''',
'||',
'CASE',
'    WHEN length(initcap(GN_NOTI)) > 100 THEN',
'            substr(initcap(GN_NOTI), 1, 100)',
'            || ''<span id="dots''',
'            || GN_DOC_NO',
'            || ''">..</span><span id="more''',
'            || GN_DOC_NO',
'            || ''">''',
'            || substr(initcap(GN_NOTI), 51, length(initcap(GN_NOTI)))',
'            || ''</span><p id="myBtn''',
'            || GN_DOC_NO',
'            || ''"  onclick="myFunction(''',
'            || GN_DOC_NO',
'            || '')" style="color:green; cursor: pointer;font-weight: 900;" >Read more</button>''',
'    ELSE',
'        initcap(GN_NOTI)',
'END',
'|| ''</SPAN></DIV>''  list_title,',
'       GN_NOTI_BY,',
'       GN_EFF_TO,',
'       GN_EFF_FROM,',
'       GN_DUE_DATE,',
'       GN_STATUS,',
'       GN_VISIBLITY,',
'       GN_CRE_BY,',
'       GN_CRE_IP_ADDR,',
'       GN_CRE_OS_USER,',
'       GN_CRE_DATE,',
'       GN_UPD_BY,',
'       GN_UPD_IP_ADDR,',
'       GN_UPD_OS_USER,',
'       GN_UPD_DATE,',
'       GN_CRE_EMP_ID,',
'       GN_UPD_EMP_ID,',
'       GN_ATTACH,',
'       GN_FILE_NAME,',
'       GN_MIME_TYPE',
'  from GROUP_NOTIFICATION'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650543409268505393)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013234779397733698)
,p_query_column_id=>24
,p_column_alias=>'GN_ATTACH'
,p_column_display_sequence=>240
,p_column_heading=>'Gn Attach'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013225685025733637)
,p_query_column_id=>1
,p_column_alias=>'GN_BU'
,p_column_display_sequence=>10
,p_column_heading=>'Gn Bu'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013230755023733674)
,p_query_column_id=>14
,p_column_alias=>'GN_CRE_BY'
,p_column_display_sequence=>140
,p_column_heading=>'Gn Cre By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013231949888733682)
,p_query_column_id=>17
,p_column_alias=>'GN_CRE_DATE'
,p_column_display_sequence=>170
,p_column_heading=>'Gn Cre Date'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013233990373733693)
,p_query_column_id=>22
,p_column_alias=>'GN_CRE_EMP_ID'
,p_column_display_sequence=>220
,p_column_heading=>'Gn Cre Emp Id'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013231183007733678)
,p_query_column_id=>15
,p_column_alias=>'GN_CRE_IP_ADDR'
,p_column_display_sequence=>150
,p_column_heading=>'Gn Cre Ip Addr'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013231628720733679)
,p_query_column_id=>16
,p_column_alias=>'GN_CRE_OS_USER'
,p_column_display_sequence=>160
,p_column_heading=>'Gn Cre Os User'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013226336205733646)
,p_query_column_id=>3
,p_column_alias=>'GN_DOC_DATE'
,p_column_display_sequence=>30
,p_column_heading=>'Gn Doc Date'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013226129126733637)
,p_query_column_id=>2
,p_column_alias=>'GN_DOC_NO'
,p_column_display_sequence=>20
,p_column_heading=>'Gn Doc No'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013229610123733662)
,p_query_column_id=>11
,p_column_alias=>'GN_DUE_DATE'
,p_column_display_sequence=>110
,p_column_heading=>'Gn Due Date'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013229233359733660)
,p_query_column_id=>10
,p_column_alias=>'GN_EFF_FROM'
,p_column_display_sequence=>100
,p_column_heading=>'Gn Eff From'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013228808998733659)
,p_query_column_id=>9
,p_column_alias=>'GN_EFF_TO'
,p_column_display_sequence=>90
,p_column_heading=>'Gn Eff To'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013235169769733701)
,p_query_column_id=>25
,p_column_alias=>'GN_FILE_NAME'
,p_column_display_sequence=>250
,p_column_heading=>'Gn File Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013235588660733704)
,p_query_column_id=>26
,p_column_alias=>'GN_MIME_TYPE'
,p_column_display_sequence=>260
,p_column_heading=>'Gn Mime Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013228347901733656)
,p_query_column_id=>8
,p_column_alias=>'GN_NOTI_BY'
,p_column_display_sequence=>80
,p_column_heading=>'Gn Noti By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013229979774733667)
,p_query_column_id=>12
,p_column_alias=>'GN_STATUS'
,p_column_display_sequence=>120
,p_column_heading=>'Gn Status'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013232341619733685)
,p_query_column_id=>18
,p_column_alias=>'GN_UPD_BY'
,p_column_display_sequence=>180
,p_column_heading=>'Gn Upd By'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013233608991733690)
,p_query_column_id=>21
,p_column_alias=>'GN_UPD_DATE'
,p_column_display_sequence=>210
,p_column_heading=>'Gn Upd Date'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013234347399733696)
,p_query_column_id=>23
,p_column_alias=>'GN_UPD_EMP_ID'
,p_column_display_sequence=>230
,p_column_heading=>'Gn Upd Emp Id'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013232804049733687)
,p_query_column_id=>19
,p_column_alias=>'GN_UPD_IP_ADDR'
,p_column_display_sequence=>190
,p_column_heading=>'Gn Upd Ip Addr'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013233162201733688)
,p_query_column_id=>20
,p_column_alias=>'GN_UPD_OS_USER'
,p_column_display_sequence=>200
,p_column_heading=>'Gn Upd Os User'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013230408039733670)
,p_query_column_id=>13
,p_column_alias=>'GN_VISIBLITY'
,p_column_display_sequence=>130
,p_column_heading=>'Gn Visiblity'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013227603938733651)
,p_query_column_id=>6
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>60
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013227155379733649)
,p_query_column_id=>5
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>50
,p_column_heading=>'List Badge'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013226751497733648)
,p_query_column_id=>4
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'List Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013227952571733654)
,p_query_column_id=>7
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>70
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(27977375131387805985)
,p_name=>'Dashboard - Buyer'
,p_static_id=>'dashboard-buyer'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--3cols:t-Cards--animColorFill'
,p_region_attributes=>'\'
,p_grid_column_span=>9
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT ''#4bb38c'' card_color,',
'       ''Pending PR Lines'' name,',
'       COUNT (*) "VALUE",',
'       NULL "CARD_TITLE",',
'       APEX_UTIL.PREPARE_URL (''f?p=2911:16151310407:&APP_SESSION.'') CARD_LINK,',
'       1 seq_no',
'  FROM pur_req_ln_scdle_view ',
' WHERE prh_bu = :global_bu',
'   AND prl_rfq = ''N''',
'   AND (prl_requested_qty -(prl_rfq_qty + prl_cls_qty +prl_ordered_qty +prl_prof_qty)) > 0',
'UNION ALL',
'SELECT ''#939b00'' card_color,',
'        ''Open RFQ'' name,',
'       COUNT (*) "VALUE",',
'       NULL "CARD_TITLE",',
'       owa_util.get_cgi_env(''REQUEST_PROTOCOL'')||''://''||owa_util.get_cgi_env(''HTTP_HOST'')||''/ords/r/''||LOWER(:GLOBAL_SCHEMA)||''/''||''rmver27_us-scm-us9009''||''/''||''request-for-quotation''||''?session=''||:app_session||''&P1615131058_HD_LN_TYPE=Y&P161513105'
||'8_RADIO_GRP=L&P1615131058_STATUS=N'' CARD_LINK,',
'       2 seq_no',
'  FROM rfq_hd,rfq_ln,RFQ_LN_SUPLR',
'  where RFQHD_BU          = RFQLN_BU(+)',
'    AND RFQHD_RFQ_NO      = RFQLN_RFQ_NO(+)',
'    AND RLS_BU(+)       = RFQLN_bu',
'    AND RLS_RFQ_NO(+)   = RFQHD_RFQ_NO',
'    AND RLS_SEQ_NO(+)   = RFQLN_SEQ_NO',
'    and RFQHD_BU          = :global_bu',
'    AND rfqhd_status = ''N'' ',
'UNION ALL',
'SELECT ''#c17289'' card_color,',
'        ''No. Of Items'' name,',
'--''<span style = "color:#020202; margin-left: 8px;font-weight: bolder;text-align:center;">No. Of Items</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "VALUE",',
'       NULL "CARD_TITLE",',
'       owa_util.get_cgi_env(''REQUEST_PROTOCOL'')||''://''||owa_util.get_cgi_env(''HTTP_HOST'')||''/ords/r/''||LOWER(:GLOBAL_SCHEMA)||''/''||''rmver27_us-scm-us9011''||''/''||''item-entity-level''||''?session=''||:app_session||''&P3670200_FILTER_TYPE=Y&P3670200_FIND_RP'
||'T=Y&P3670200_STATUS=A'' CARD_LINK,',
'       3 seq_no',
'  FROM products',
' WHERE prod_bu =:GLOBAL_bu',
'   AND prod_status = ''A''',
'UNION ALL',
'SELECT ''#17a5cd'' card_color,',
'        ''Waiting for approval (RFQ)'' name,',
'--''<span style = "color:#020202; margin-left: 8px;font-weight: bolder;text-align:center;">Waiting for approval (RFQ)</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "VALUE",',
'       NULL "CARD_TITLE",',
'       NULL CARD_LINK,',
'       4 seq_no',
'  FROM rfq_hd,rfq_ln',
' WHERE rfqhd_bu= :GLOBAL_bu',
'   AND rfqhd_bu = rfqln_bu',
'   AND rfqhd_rfq_no = rfqln_rfq_no',
'   AND rfqhd_status = ''I'' ',
'UNION ALL',
'SELECT ''#aa7aab'' card_color,',
'        ''Waiting for approval (PO)'' name,',
'--''<span style = "color:#020202; margin-left: 8px;font-weight: bolder;text-align:center;">Waiting for approval (PO)</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "VALUE",',
'       NULL "CARD_TITLE",',
'       owa_util.get_cgi_env(''REQUEST_PROTOCOL'')||''://''||owa_util.get_cgi_env(''HTTP_HOST'')||''/ords/r/''||LOWER(:GLOBAL_SCHEMA)||''/''||''rmver27_us-scm-us9009''||''/''||''find-po''||''?session=''||:app_session||''&P1615131061_TYPE=Y&P1615131061_TYPE_1=Y'' CARD_LIN'
||'K,',
'       5 seq_no',
'  FROM pur_order_hd,pur_order_ln',
' WHERE poh_bu = :GLOBAL_bu',
'   AND poh_bu = pol_bu',
'   AND poh_order_no = pol_order_no',
'   AND pol_pr_no IS NOT NULL',
'   AND poh_status = ''E'' ',
'   AND poh_mode = ''PO''',
'UNION ALL',
'SELECT ''#a76d29'' card_color,',
'        ''PO Overdues'' name,',
'--''<span style = "color:#020202; margin-left: 8px;font-weight: bolder;text-align:center;">PO Overdues</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "VALUE",',
'       NULL "CARD_TITLE",',
'       NULL CARD_LINK,',
'       6 seq_no',
'  FROM pur_order_hd,pur_order_ln,fin_periods',
' WHERE poh_bu = pol_bu',
'   AND poh_order_no = pol_order_no',
'   AND poh_bu=fp_bu',
'   AND poh_order_period=fp_period',
'   AND poh_order_year=fp_year',
'   AND poh_mode = ''PO''',
'   AND poh_status IN (''A'',''P'')',
'   and pol_status not in (''C'')',
'  AND (pol_ordered_qty- (pol_received_qty + pol_cls_qty + pol_proc_qty)) > 0',
'   AND poh_bu = :GLOBAL_Bu',
'UNION ALL',
'SELECT ''#c17289'' card_color,',
'        ''Rate Contract Expiry'' name,',
'--''<span style = "color:#020202; margin-left: 8px;font-weight: bolder;text-align:center;">Rate Contract Expiry</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "VALUE",',
'       NULL "CARD_TITLE",',
'       NULL CARD_LINK,',
'       7 seq_no',
'  FROM PUR_RATE_CONTR_HD,PUR_RATE_CONTR_LN',
' WHERE prchd_bu = prcln_bu',
'   AND prchd_plnt = prcln_plnt',
'   AND prchd_po_pfx = prcln_po_pfx',
'   AND prchd_po_no = prcln_po_no',
'   AND (sysdate -10) > prchd_end_date ',
'   AND prchd_prod_type IN (''PR'',''PO'')',
'   AND prchd_status =''A''',
'UNION ALL',
'SELECT ''#939b00'' card_color,',
'        ''Price List Expiry'' name,',
'--''<span style = "color:#020202; margin-left: 8px;font-weight: bolder;text-align:center;">Price List Expiry</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "VALUE",',
'       NULL "CARD_TITLE",',
'       NULL CARD_LINK,',
'       8 seq_no',
'  FROM PUR_SC_PRICE_LIST',
' WHERE PSPL_BU =:global_bu',
'   AND PSPL_STATUS =''A''',
'   AND PSPL_TYPE =''PR''',
'   AND (sysdate - 10) > PSPL_EFF_DATE_TO',
'UNION ALL',
'SELECT ''#c17289'' card_color,',
'        ''Pending Purchase Receipt'' name,',
'--''<span style = "color:#020202; margin-left: 8px;font-weight: bolder;text-align:center;">Pending Purchase Receipt</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "VALUE",',
'       NULL "CARD_TITLE",',
'       owa_util.get_cgi_env(''REQUEST_PROTOCOL'')||''://''||owa_util.get_cgi_env(''HTTP_HOST'')||''/ords/r/''||LOWER(:GLOBAL_SCHEMA)||''/''||''rmver27_us-scm-us9009''||''/''||''grn-srn''||''?session=''||:app_session||''&P1615131103_HD_LN_TYPE=Y&P1615131103_FIND_RPT=Y&P'
||'1615131103_STATUS=N'' CARD_LINK,',
'       9 seq_no',
'  FROM pur_ord_receipt_hd_view,pur_ord_receipt_ln_view, pur_rcpt_addr_vw, suppliers',
' WHERE porh_bu = porl_bu',
'   AND porh_receipt_no = porl_receipt_no',
'   AND suplr_bu = porh_bu',
'   AND suplr_suplr_id = porh_suplr_id',
'   AND pra_bu(+) = porh_bu',
'  -- AND pra_rcpt_pfx(+) = porh_receipt_pfx',
'   AND pra_rcpt_no(+) = porh_receipt_no',
'   AND porh_mode = ''PR''',
'   AND porh_bu = :Global_bu',
'   AND porh_wf_status = ''N'' --porh_status = ''N''',
'UNION ALL',
'SELECT ''#2874F0'' card_color,',
'        ''Pending Purchase Receipt (Bill Booking)'' name,',
'--''<span style = "color:#020202; margin-left: 8px;font-weight: bolder;text-align:center;">Pending Purchase Receipt (Bill Booking)</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "VALUE",',
'       NULL "CARD_TITLE",',
'       NULL CARD_LINK,',
'       10 seq_no',
'  FROM  pur_ord_receipt_hd_view ,pur_ord_receipt_ln_view',
'         WHERE     porh_bu = porl_bu',
'               AND porh_receipt_no = porl_receipt_no',
'               AND porh_mode = ''PR''',
'               AND porl_status = ''R''',
'               AND porh_bu = :Global_bu',
'               AND ( (porl_temp_inv_qty',
'                      - (  NVL (porl_inv_qty, 0)',
'                         + NVL (porl_temp_in_progress, 0)',
'                         + NVL (porl_cls_qty, 0))) > 0)',
'UNION ALL',
'SELECT ''#2874F0'' card_color,',
'        ''Open Purchase Rejection'' name,',
'--''<span style = "color:#020202; margin-left: 8px;font-weight: bolder;text-align:center;">Open Purchase Rejection</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "VALUE",',
'       NULL "CARD_TITLE",',
'       NULL CARD_LINK,',
'       11 seq_no',
'  FROM sales_invoices_hd,sales_invoices_ln',
' WHERE sihd_bu =:GLOBAL_bu',
'   AND sihd_bu = siln_bu',
'   AND sihd_doc_no = siln_doc_no',
'   AND sihd_status = ''N''',
'   AND sihd_type =''PR''',
'UNION ALL',
'SELECT  ''#2874F0'' card_color,',
'        ''Overdue Bills'' name,',
'--''<span style = "color:#020202; margin-left: 8px;font-weight: bolder;text-align:center;">Overdue Bills</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "VALUE",',
'       NULL "CARD_TITLE",',
'       NULL CARD_LINK,',
'       12 seq_no',
'  FROM DUAL',
'UNION ALL',
'SELECT ''#2874F0'' card_color,',
'        ''Waiting For QC'' name,',
' --''<span style = "color:#020202; margin-left: 8px;font-weight: bolder;text-align:center;">Waiting For QC</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "VALUE",',
'       NULL "CARD_TITLE",',
'       NULL CARD_LINK,',
'       13 seq_no',
'  FROM tqm_qc_hd,tqm_qc_ln',
' WHERE tqhd_bu =:GLOBAL_bu',
'   AND tqhd_bu = tqln_bu',
'   AND tqhd_qc_no = tqln_qc_no',
'   AND tqhd_status =''E''',
'ORDER BY seq_no ASC'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(8011271552534964784)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013222918050733603)
,p_query_column_id=>1
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>70
,p_column_heading=>'Card Color'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013224062083733610)
,p_query_column_id=>5
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>50
,p_column_heading=>'Card Link'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013223668755733607)
,p_query_column_id=>4
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013224852531733615)
,p_query_column_id=>2
,p_column_alias=>'NAME'
,p_column_display_sequence=>80
,p_column_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013224458905733613)
,p_query_column_id=>6
,p_column_alias=>'SEQ_NO'
,p_column_display_sequence=>40
,p_column_heading=>'Seq No'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8013223315166733606)
,p_query_column_id=>3
,p_column_alias=>'VALUE'
,p_column_display_sequence=>60
,p_column_heading=>'Value'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8013239773175733795)
,p_name=>'Date_Submit'
,p_static_id=>'date-submit'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_DATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8013240249795733796)
,p_event_id=>wwv_flow_imp.id(8013239773175733795)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8013236204353733773)
,p_name=>'Submit'
,p_static_id=>'submit'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_DUMMY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8013236587631733781)
,p_event_id=>wwv_flow_imp.id(8013236204353733773)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8013238922578733787)
,p_name=>'Submit_page_unit'
,p_static_id=>'submit-page-unit'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_UNIT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8013239390815733788)
,p_event_id=>wwv_flow_imp.id(8013238922578733787)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8013236995401733784)
,p_name=>'Unit Group'
,p_static_id=>'unit-group'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P120_UNIT_GROUP'
,p_condition_element=>'P120_UNIT_GROUP'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8013237513934733785)
,p_event_id=>wwv_flow_imp.id(8013236995401733784)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P120_UNIT,P120_DUMMY',
  'items_to_submit', 'P120_UNIT_GROUP',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P120_UNIT_GROUP  IS NOT NULL  THEN',
    '   SELECT LISTAGG(bup_plant_id,'':'') WITHIN GROUP (ORDER BY bup_plant_id) INTO :P120_UNIT',
    '     FROM(SELECT  bup_bu || '' - '' || bup_name1,bup_plant_id ',
    '            FROM business_units, bus_unit_plants, appl_user_plant_access',
    '           WHERE bup_bu = bu_id',
    '             AND bup_bu = auba_bu',
    '             AND bup_plant_id = auba_plant',
    '             AND auba_user_id = :global_user         ',
    '             AND (NVL (:P120_UNIT_GROUP, ''0'') = ''0''',
    '              OR INSTR (:P120_UNIT_GROUP || '':'',bup_group_id  || '':'') >    0)',
    '             AND (TRUNC (SYSDATE) BETWEEN auba_from AND auba_to)         ',
    '             AND bup_bu = :global_bu',
    '        ORDER BY bup_rpt_print_seq);',
    '   :P120_DUMMY := 0;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8013238009175733787)
,p_event_id=>wwv_flow_imp.id(8013236995401733784)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P120_UNIT,P120_DUMMY',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ':P120_DUMMY :=1;',
    ':P120_UNIT := NULL;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8013238505670733787)
,p_event_id=>wwv_flow_imp.id(8013236995401733784)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
