prompt --application/pages/page_90232000104
begin
--   Manifest
--     PAGE: 90232000104
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
 p_id=>90232000104
,p_name=>'Subcontract - Manager (SCO)'
,p_alias=>'SUBCONTRACT-MANAGER-SCO'
,p_step_title=>'Subcontract - Manager (SCO)'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#ANMT .t-MediaList-badge {',
'    color: #6e6b6b;',
'    font-size: small;',
'    background-color: transparent;',
'}',
'',
'.t-MediaList-icon {',
'    background-color: transparent;',
'    color: #386273;',
'}',
'.t-Card-wrap {',
'    border-radius: 2px;',
'    border-color: rgba(0, 0, 0, 0.075);',
'    box-shadow: 0px 16px 16px 0 rgba(255, 255, 255, 0.36);',
'    background-color: #c0dae79e;',
'}',
'',
'',
'.t-Cards--featured .t-Card-wrap {',
'    display: flex;',
'    flex-direction: column;',
'    overflow: hidden;',
'    border-radius: 8px 8px 8px 8px;',
'    max-width: 223px;',
'    margin-top: 0px;',
'    margin-bottom: 0px;',
'}',
'',
'/*.t-Cards--iconsRounded .t-Card-icon, .t-Cards--iconsRounded .t-Icon {',
'    border-radius: initial;',
'    background-color: #ffffff;',
'    color: black;',
'}',
'*/',
'',
' .t-Region{',
'  box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;',
'}',
'',
'',
'.t-Cards--featured.t-Cards--displayIcons .t-Card-titleWrap, .t-Cards--featured.t-Cards--displayInitials .t-Card-titleWrap {',
'    padding-top: 0px;',
'    color: #ede2e2;',
'    background-color: #050505;',
'}',
'.t-Cards--block .t-Card-titleWrap {',
'    box-shadow: inset 0px -8px 0px 0px;',
'    color: #386273;',
'}',
'',
'.t-Cards--featured.t-Cards--displaySubtitle .t-Card-subtitle {',
'    font-size: 10px;',
'};',
'',
'',
'.t-Cards--block .t-Card-icon {',
'    display: flex;',
'    align-items: center;',
'    justify-content: center;',
'    margin: 0;',
'    padding: 10px;',
'    width: auto;',
'    height: auto;',
'}',
'',
'.t-Cards--iconsRounded .t-Card-icon, .t-Cards--iconsRounded .t-Icon {',
'    border-radius: initial;',
'    background-color: #ffffff;',
'    color: black;',
'    height: 30px;',
'}',
'',
'',
'.t-Cards--featured .t-Card-titleWrap {',
'    font-size: 16px;',
'    font-weight: 500;',
'    text-align: center;',
'    display: flex;',
'    align-items: center;',
'    justify-content: center;',
'    flex-direction: column;',
'    padding: 12px 16px;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650482615684505314)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(18065547397654531658)
,p_name=>'Announcement'
,p_static_id=>'announcement'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody:t-Form--slimPadding'
,p_component_template_options=>'#DEFAULT#:t-MediaList--stack'
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
 p_id=>wwv_flow_imp.id(8007762292968810653)
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
 p_id=>wwv_flow_imp.id(8007753142263810584)
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
 p_id=>wwv_flow_imp.id(8007758291385810623)
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
 p_id=>wwv_flow_imp.id(8007759441453810632)
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
 p_id=>wwv_flow_imp.id(8007761528145810648)
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
 p_id=>wwv_flow_imp.id(8007758669126810626)
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
 p_id=>wwv_flow_imp.id(8007759080945810629)
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
 p_id=>wwv_flow_imp.id(8007753938644810587)
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
 p_id=>wwv_flow_imp.id(8007753573017810587)
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
 p_id=>wwv_flow_imp.id(8007757135345810613)
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
 p_id=>wwv_flow_imp.id(8007756666662810609)
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
 p_id=>wwv_flow_imp.id(8007756335278810606)
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
 p_id=>wwv_flow_imp.id(8007762729325810656)
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
 p_id=>wwv_flow_imp.id(8007763080667810657)
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
 p_id=>wwv_flow_imp.id(8007755933217810599)
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
 p_id=>wwv_flow_imp.id(8007757513738810615)
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
 p_id=>wwv_flow_imp.id(8007759912076810635)
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
 p_id=>wwv_flow_imp.id(8007761115475810646)
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
 p_id=>wwv_flow_imp.id(8007761924314810649)
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
 p_id=>wwv_flow_imp.id(8007760265079810640)
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
 p_id=>wwv_flow_imp.id(8007760667874810642)
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
 p_id=>wwv_flow_imp.id(8007757916751810618)
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
 p_id=>wwv_flow_imp.id(8007755100375810593)
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
 p_id=>wwv_flow_imp.id(8007754696228810593)
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
 p_id=>wwv_flow_imp.id(8007754383141810590)
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
 p_id=>wwv_flow_imp.id(8007755480816810596)
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
 p_id=>wwv_flow_imp.id(27925886605806996607)
,p_name=>'Dashboard - Buyer'
,p_static_id=>'dashboard-buyer'
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding:margin-top-lg:margin-left-lg:margin-right-lg'
,p_component_template_options=>'#DEFAULT#:t-Cards--displaySubtitle:t-Cards--featured t-Cards--block force-fa-lg:t-Cards--4cols:t-Cards--hideBody:t-Cards--iconsRounded:t-Cards--animColorFill:t-Report--hideNoPagination'
,p_grid_column_span=>9
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''<span style = "color:#020202; margin-left: 10px;font-weight: bolder;text-align:center;">No Of Items</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       3 seq_no',
'  FROM products',
' WHERE prod_bu =:GLOBAL_bu',
'   AND prod_status = ''A''',
'UNION ALL',
'SELECT ''<span style = "color:#020202; margin-left: 10px;font-weight: bolder;text-align:center;">Waiting for approval (PO)</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       5 seq_no',
'  FROM pur_order_hd,pur_order_ln',
' WHERE poh_bu = :GLOBAL_bu',
'   AND poh_bu = pol_bu',
'   AND poh_order_no = pol_order_no',
'   AND pol_pr_no IS NOT NULL',
'   AND poh_status = ''N'' ',
'   AND poh_mode = ''SC''',
'UNION ALL',
'SELECT ''<span style = "color:#020202; margin-left: 10px;font-weight: bolder;text-align:center;">Rate Contract (SC) Expiry</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       5 seq_no',
'  FROM SUBCTR_PROC_RATE_CONTR_HD,SUBCTR_PROC_RATE_CONTR_LN',
' WHERE SPRCLN_BU = SPRCLN_BU',
'   AND SPRCLN_PLNT = SPRCHD_PLNT',
'   AND SPRCLN_PO_PFX = SPRCHD_PO_PFX',
'   AND SPRCLN_PO_NO = SPRCHD_PO_NO',
'   AND sysdate > SPRCHD_EFF_TO',
'   AND SPRCHD_STATUS = ''A''',
'   AND SPRCHD_LVL_TYPE =''P''',
'UNION ALL',
'SELECT ''<span style = "color:#020202; margin-left: 10px;font-weight: bolder;text-align:center;">PO Overdues</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       6 seq_no',
'  FROM pur_order_hd,pur_order_ln,fin_periods',
' WHERE poh_bu = pol_bu',
'   AND poh_order_no = pol_order_no',
'   AND poh_bu=fp_bu',
'   AND poh_order_period=fp_period',
'   AND poh_order_year=fp_year',
'   AND poh_mode = ''SC''',
'   AND poh_status IN (''A'',''P'')',
'   and pol_status not in (''C'')',
'  AND (pol_ordered_qty- (pol_received_qty + pol_cls_qty + pol_proc_qty)) > 0',
'   AND poh_bu = :GLOBAL_Bu',
'UNION ALL',
'SELECT ''<span style = "color:#020202; margin-left: 10px;font-weight: bolder;text-align:center;">Open GRN</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       9 seq_no',
'  FROM pur_ord_receipt_hd,pur_ord_receipt_ln',
' WHERE porh_bu =:GLOBAL_bu',
'   AND porh_bu = porl_bu',
'   AND porh_receipt_no = porl_receipt_no',
'   AND porl_po_no IS NOT NULL',
'   AND porh_status = ''N''',
'   AND porh_mode = ''SC''',
'UNION ALL',
'SELECT ''<span style = "color:#020202; margin-left: 10px;font-weight: bolder;text-align:center;">Pending GRN (Bill Booking)</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       10 seq_no',
'  FROM  pur_ord_receipt_hd_view ,pur_ord_receipt_ln_view',
'         WHERE     porh_bu = porl_bu',
'               AND porh_receipt_no = porl_receipt_no',
'               AND porh_mode = ''SC''',
'               AND porl_status = ''R''',
'               AND porh_bu = :Global_bu',
'               AND ( (porl_temp_inv_qty',
'                      - (  NVL (porl_inv_qty, 0)',
'                         + NVL (porl_temp_in_progress, 0)',
'                         + NVL (porl_cls_qty, 0))) > 0)',
'UNION ALL',
'SELECT ''<span style = "color:#020202; margin-left: 10px;font-weight: bolder;text-align:center;">Open Purchase Rejection</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       11 seq_no',
'  FROM sales_invoices_hd,sales_invoices_ln',
' WHERE sihd_bu =:GLOBAL_bu',
'   AND sihd_bu = siln_bu',
'   AND sihd_doc_no = siln_doc_no',
'   AND sihd_status = ''N''',
'   AND sihd_type =''SW''',
'UNION ALL',
'SELECT ''<span style = "color:#020202; margin-left: 10px;font-weight: bolder;text-align:center;">Overdue Bills</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       12 seq_no',
'  FROM DUAL',
'UNION ALL',
'SELECT ''<span style = "color:#020202; margin-left: 10px;font-weight: bolder;text-align:center;">Waiting For QC</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       13 seq_no',
'  FROM tqm_qc_hd,tqm_qc_ln',
' WHERE tqhd_bu =:GLOBAL_bu',
'   AND tqhd_bu = tqln_bu',
'   AND tqhd_qc_no = tqln_qc_no',
'   AND tqhd_insp_mode =''SC''',
'   AND tqhd_status =''E''',
'ORDER BY seq_no ASC'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8007764332191810668)
,p_query_column_id=>2
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>30
,p_column_heading=>'Card Initials'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8007763911597810662)
,p_query_column_id=>1
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Subtitle'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8007764687689810671)
,p_query_column_id=>3
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8007765081344810676)
,p_query_column_id=>4
,p_column_alias=>'SEQ_NO'
,p_column_display_sequence=>40
,p_column_heading=>'Seq No'
,p_column_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8007769344240810688)
,p_name=>'Date_Submit'
,p_static_id=>'date-submit'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P90232000104_DATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8007769901230810693)
,p_event_id=>wwv_flow_imp.id(8007769344240810688)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8007765704337810682)
,p_name=>'Submit'
,p_static_id=>'submit'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P90232000104_DUMMY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8007766232825810682)
,p_event_id=>wwv_flow_imp.id(8007765704337810682)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8007768458554810687)
,p_name=>'Submit_page_unit'
,p_static_id=>'submit-page-unit'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P90232000104_UNIT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8007768984011810688)
,p_event_id=>wwv_flow_imp.id(8007768458554810687)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(8007766572819810682)
,p_name=>'Unit Group'
,p_static_id=>'unit-group'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P90232000104_UNIT_GROUP'
,p_condition_element=>'P90232000104_UNIT_GROUP'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8007767094433810685)
,p_event_id=>wwv_flow_imp.id(8007766572819810682)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P90232000104_UNIT,P90232000104_DUMMY',
  'items_to_submit', 'P90232000104_UNIT_GROUP',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P90232000104_UNIT_GROUP  IS NOT NULL  THEN',
    '   SELECT LISTAGG(bup_plant_id,'':'') WITHIN GROUP (ORDER BY bup_plant_id) INTO :P90232000104_UNIT',
    '     FROM(SELECT  bup_bu || '' - '' || bup_name1,bup_plant_id ',
    '            FROM business_units, bus_unit_plants, appl_user_plant_access',
    '           WHERE bup_bu = bu_id',
    '             AND bup_bu = auba_bu',
    '             AND bup_plant_id = auba_plant',
    '             AND auba_user_id = :global_user         ',
    '             AND (NVL (:P90232000104_UNIT_GROUP, ''0'') = ''0''',
    '              OR INSTR (:P90232000104_UNIT_GROUP || '':'',bup_group_id  || '':'') >    0)',
    '             AND (TRUNC (SYSDATE) BETWEEN auba_from AND auba_to)         ',
    '             AND bup_bu = :global_bu',
    '        ORDER BY bup_rpt_print_seq);',
    '   :P90232000104_DUMMY := 0;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8007767634194810685)
,p_event_id=>wwv_flow_imp.id(8007766572819810682)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P90232000104_UNIT,P90232000104_DUMMY',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ':P90232000104_DUMMY :=1;',
    ':P90232000104_UNIT := NULL;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8007768084505810687)
,p_event_id=>wwv_flow_imp.id(8007766572819810682)
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
