prompt --application/pages/page_00013
begin
--   Manifest
--     PAGE: 00013
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
 p_id=>13
,p_name=>'Working Menu (ERP Screen )'
,p_alias=>'WORKING-MENU-ERP-SCREEN'
,p_page_mode=>'MODAL'
,p_step_title=>'Working Menu (ERP Screen )'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-HeroRegion-title {',
'    font-size: 1.5rem;',
'    line-height: 4rem;',
'    margin: 0;',
'    font-weight: 700;',
'    color: #5C6BC0;',
'}',
'',
'.t-HeroRegion-wrap {',
'    padding: 16px;',
'    display: flex;',
'    padding-bottom: 0px;',
'    flex-direction: row;',
'    align-items: center;',
'}',
'',
'.t-MediaList-title {',
'    font-size: 1.3rem;',
'    line-height: 3rem;',
'    font-weight: 500;',
'}',
'',
'.a-IRR-headerLink, .a-IRR-headerLink:hover {',
'    text-decoration: none;',
'    background: #3f51b5c7;',
'    color: white;',
'}',
'',
'#SCM .a-IRR-headerLink, #SCM .a-IRR-headerLink:hover {',
'    text-decoration: none;',
'    background: LIMEGREEN;',
'    color: black;',
'}',
'',
'#QC .a-IRR-headerLink, #QC .a-IRR-headerLink:hover {',
'    text-decoration: none;',
'    background: #b95f95b8;',
'    color: white;',
'}',
'',
'#PP .a-IRR-headerLink, #PP .a-IRR-headerLink:hover {',
'    text-decoration: none;',
'    background: #b5753fc7;',
'    color: white;',
'}',
'',
'#SF .a-IRR-headerLink, #SF .a-IRR-headerLink:hover {',
'    text-decoration: none;',
'    background: hsl(161deg 81% 47% / 58%);',
'    color: BLACK;',
'}',
'',
''))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16932716214179425516)
,p_plug_name=>'Alert Paramters'
,p_static_id=>'alert-paramters'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple:t-TabsRegion-mod--small'
,p_plug_template=>wwv_flow_imp.id(10650524481825505371)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16932890149403553624)
,p_plug_name=>'CRM'
,p_static_id=>'crm'
,p_parent_plug_id=>wwv_flow_imp.id(16932716214179425516)
,p_icon_css_classes=>'fa-mobile fam-x fam-is-danger'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--showIcon:t-ContentBlock--h3:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650506099144505346)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT apbuf_fun_id "Business Function",',
'            NVL(apbuf_fun_desc1,apbuf_fun_desc2) "Description",',
'            apbuf_module "Module",',
'            NULL "Assigned To"',
'   FROM appl_bus_fun',
'  WHERE apbuf_fun_id IN (''GLM1015'',''GLM1016'',''CDM1030'',''CDM1040'',''APM1010'',''APM1014'',''ARM1010'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(16932890237665553625)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>10789048208259032364
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555295297171358486)
,p_db_column_name=>'Assigned To'
,p_display_order=>40
,p_column_identifier=>'R'
,p_column_label=>'Assigned To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555294981540358483)
,p_db_column_name=>'Business Function'
,p_display_order=>10
,p_column_identifier=>'O'
,p_column_label=>'Business Function'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555295054831358484)
,p_db_column_name=>'Description'
,p_display_order=>20
,p_column_identifier=>'P'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555295162150358485)
,p_db_column_name=>'Module'
,p_display_order=>30
,p_column_identifier=>'Q'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(16932915331267594807)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'54108547'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'Business Function:Description:Module:Assigned To'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16932715656624425511)
,p_plug_name=>'Financial Management'
,p_static_id=>'financial-management'
,p_parent_plug_id=>wwv_flow_imp.id(16932716214179425516)
,p_icon_css_classes=>'fa-bell'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--showIcon:t-ContentBlock--h3:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650506099144505346)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT apbuf_fun_id "Business Function",',
'            NVL(apbuf_fun_desc1,apbuf_fun_desc2) "Description",',
'            apbuf_module "Module",',
'            ''Ganesh K'' "Assigned To",',
'            ''Pending'' "Status"',
'   FROM appl_bus_fun',
'  WHERE apbuf_fun_id IN (''GLM1015'',''GLM1016'',''CDM1030'',''CDM1040'',''APM1010'',''APM1014'',''ARM1010'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(16932715799060425512)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>10788873769653904251
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11524496782939386092)
,p_db_column_name=>'Assigned To'
,p_display_order=>40
,p_column_identifier=>'K'
,p_column_label=>'Assigned To'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11524496612203386090)
,p_db_column_name=>'Business Function'
,p_display_order=>20
,p_column_identifier=>'I'
,p_column_label=>'Business Function'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11524496670410386091)
,p_db_column_name=>'Description'
,p_display_order=>30
,p_column_identifier=>'J'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11554687485957259014)
,p_db_column_name=>'Module'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555498654142412965)
,p_db_column_name=>'Status'
,p_display_order=>50
,p_column_identifier=>'L'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(16932751212172600649)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'54108481'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'Module:Business Function:Description:Assigned To:Status'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16932720360343425558)
,p_plug_name=>'Human Resources'
,p_static_id=>'human-resources'
,p_parent_plug_id=>wwv_flow_imp.id(16932716214179425516)
,p_icon_css_classes=>'fa-envelope-open fam-x fam-is-danger'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--showIcon:t-ContentBlock--h3'
,p_plug_template=>wwv_flow_imp.id(10650506099144505346)
,p_plug_display_sequence=>110
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT apbuf_fun_id "Business Function",',
'            NVL(apbuf_fun_desc1,apbuf_fun_desc2) "Description",',
'            apbuf_module "Module",',
'            NULL "Assigned To"',
'   FROM appl_bus_fun',
'  WHERE apbuf_fun_id IN (''GLM1015'',''GLM1016'',''CDM1030'',''CDM1040'',''APM1010'',''APM1014'',''ARM1010'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(16932720486349425559)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>10788878456942904298
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555297707864358510)
,p_db_column_name=>'Assigned To'
,p_display_order=>40
,p_column_identifier=>'O'
,p_column_label=>'Assigned To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555297336334358507)
,p_db_column_name=>'Business Function'
,p_display_order=>10
,p_column_identifier=>'L'
,p_column_label=>'Business Function'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555297496266358508)
,p_db_column_name=>'Description'
,p_display_order=>20
,p_column_identifier=>'M'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555297629257358509)
,p_db_column_name=>'Module'
,p_display_order=>30
,p_column_identifier=>'N'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(16932897929606561434)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'54108644'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'Business Function:Description:Module:Assigned To'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16932718834403425542)
,p_plug_name=>'Plant Maintenance'
,p_static_id=>'plant-maintenance'
,p_parent_plug_id=>wwv_flow_imp.id(16932716214179425516)
,p_icon_css_classes=>'fa-commenting'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--showIcon:t-ContentBlock--h3'
,p_plug_template=>wwv_flow_imp.id(10650506099144505346)
,p_plug_display_sequence=>80
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT apbuf_fun_id "Business Function",',
'            NVL(apbuf_fun_desc1,apbuf_fun_desc2) "Description",',
'            apbuf_module "Module",',
'            NULL "Assigned To"',
'   FROM appl_bus_fun',
'  WHERE apbuf_fun_id IN (''GLM1015'',''GLM1016'',''CDM1030'',''CDM1040'',''APM1010'',''APM1014'',''ARM1010'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(16932718922437425543)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>10788876893030904282
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555498565535412964)
,p_db_column_name=>'Assigned To'
,p_display_order=>40
,p_column_identifier=>'I'
,p_column_label=>'Assigned To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555297775984358511)
,p_db_column_name=>'Business Function'
,p_display_order=>10
,p_column_identifier=>'F'
,p_column_label=>'Business Function'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555498335171412962)
,p_db_column_name=>'Description'
,p_display_order=>20
,p_column_identifier=>'G'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555498505455412963)
,p_db_column_name=>'Module'
,p_display_order=>30
,p_column_identifier=>'H'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(16932829918774368299)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'54108508'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'Business Function:Description:Module:Assigned To'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11524497852358386103)
,p_plug_name=>'Production Planning'
,p_static_id=>'production-planning'
,p_region_name=>'PP'
,p_parent_plug_id=>wwv_flow_imp.id(16932716214179425516)
,p_icon_css_classes=>'fa-mobile fam-x fam-is-danger'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--showIcon:t-ContentBlock--h3'
,p_plug_template=>wwv_flow_imp.id(10650506099144505346)
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT apbuf_fun_id "Business Function",',
'            NVL(apbuf_fun_desc1,apbuf_fun_desc2) "Description",',
'            apbuf_module "Module",',
'            NULL "Assigned To"',
'   FROM appl_bus_fun',
'  WHERE apbuf_fun_id IN (''GLM1015'',''GLM1016'',''CDM1030'',''CDM1040'',''APM1010'',''APM1014'',''ARM1010'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(11524497988427386104)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>5380655959020864843
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555296526423358498)
,p_db_column_name=>'Assigned To'
,p_display_order=>40
,p_column_identifier=>'L'
,p_column_label=>'Assigned To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555296228221358495)
,p_db_column_name=>'Business Function'
,p_display_order=>10
,p_column_identifier=>'I'
,p_column_label=>'Business Function'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555296247100358496)
,p_db_column_name=>'Description'
,p_display_order=>20
,p_column_identifier=>'J'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555296394506358497)
,p_db_column_name=>'Module'
,p_display_order=>30
,p_column_identifier=>'K'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11555366673708362684)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'54115247'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'Business Function:Description:Module:Assigned To'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11555293983980358473)
,p_plug_name=>'Project Management'
,p_static_id=>'project-management'
,p_parent_plug_id=>wwv_flow_imp.id(16932716214179425516)
,p_icon_css_classes=>'fa-mobile fam-x fam-is-danger'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--showIcon:t-ContentBlock--h3'
,p_plug_template=>wwv_flow_imp.id(10650506099144505346)
,p_plug_display_sequence=>100
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT apbuf_fun_id "Business Function",',
'            NVL(apbuf_fun_desc1,apbuf_fun_desc2) "Description",',
'            apbuf_module "Module",',
'            NULL "Assigned To"',
'   FROM appl_bus_fun',
'  WHERE apbuf_fun_id IN (''GLM1015'',''GLM1016'',''CDM1030'',''CDM1040'',''APM1010'',''APM1014'',''ARM1010'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(11555294096781358474)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>5411452067374837213
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555297270758358506)
,p_db_column_name=>'Assigned To'
,p_display_order=>40
,p_column_identifier=>'L'
,p_column_label=>'Assigned To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555297001131358503)
,p_db_column_name=>'Business Function'
,p_display_order=>10
,p_column_identifier=>'I'
,p_column_label=>'Business Function'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555297097138358504)
,p_db_column_name=>'Description'
,p_display_order=>20
,p_column_identifier=>'J'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555297146146358505)
,p_db_column_name=>'Module'
,p_display_order=>30
,p_column_identifier=>'K'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11555368118013362693)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'54115261'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'Business Function:Description:Module:Assigned To'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11524496923601386093)
,p_plug_name=>'Quality Management'
,p_static_id=>'quality-management'
,p_region_name=>'QC'
,p_parent_plug_id=>wwv_flow_imp.id(16932716214179425516)
,p_icon_css_classes=>'fa-mobile fam-x fam-is-danger'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--showIcon:t-ContentBlock--h3:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650506099144505346)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT apbuf_fun_id "Business Function",',
'            NVL(apbuf_fun_desc1,apbuf_fun_desc2) "Description",',
'            apbuf_module "Module",',
'            NULL "Assigned To"',
'   FROM appl_bus_fun',
'  WHERE apbuf_fun_id IN (''GLM1015'',''GLM1016'',''CDM1030'',''CDM1040'',''APM1010'',''APM1014'',''ARM1010'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(11524496930918386094)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>5380654901511864833
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555296109889358494)
,p_db_column_name=>'Assigned To'
,p_display_order=>40
,p_column_identifier=>'L'
,p_column_label=>'Assigned To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555295811015358491)
,p_db_column_name=>'Business Function'
,p_display_order=>10
,p_column_identifier=>'I'
,p_column_label=>'Business Function'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555295896088358492)
,p_db_column_name=>'Description'
,p_display_order=>20
,p_column_identifier=>'J'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555295973676358493)
,p_db_column_name=>'Module'
,p_display_order=>30
,p_column_identifier=>'K'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11555366038953362675)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'54115241'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'Business Function:Description:Module:Assigned To'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11555293020736358463)
,p_plug_name=>'Shop Floor'
,p_static_id=>'shop-floor'
,p_region_name=>'SF'
,p_parent_plug_id=>wwv_flow_imp.id(16932716214179425516)
,p_icon_css_classes=>'fa-mobile fam-x fam-is-danger'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--showIcon:t-ContentBlock--h3'
,p_plug_template=>wwv_flow_imp.id(10650506099144505346)
,p_plug_display_sequence=>70
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT apbuf_fun_id "Business Function",',
'            NVL(apbuf_fun_desc1,apbuf_fun_desc2) "Description",',
'            apbuf_module "Module",',
'            NULL "Assigned To"',
'   FROM appl_bus_fun',
'  WHERE apbuf_fun_id IN (''GLM1015'',''GLM1016'',''CDM1030'',''CDM1040'',''APM1010'',''APM1014'',''ARM1010'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(11555293085837358464)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>5411451056430837203
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555296870970358502)
,p_db_column_name=>'Assigned To'
,p_display_order=>40
,p_column_identifier=>'L'
,p_column_label=>'Assigned To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555296578654358499)
,p_db_column_name=>'Business Function'
,p_display_order=>10
,p_column_identifier=>'I'
,p_column_label=>'Business Function'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555296723416358500)
,p_db_column_name=>'Description'
,p_display_order=>20
,p_column_identifier=>'J'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555296802948358501)
,p_db_column_name=>'Module'
,p_display_order=>30
,p_column_identifier=>'K'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11555367410006362689)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'54115254'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'Business Function:Description:Module:Assigned To'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16932717110289425525)
,p_plug_name=>'Supply Chain Management'
,p_static_id=>'supply-chain-management'
,p_region_name=>'SCM'
,p_parent_plug_id=>wwv_flow_imp.id(16932716214179425516)
,p_icon_css_classes=>'fa-tasks'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--showIcon:t-ContentBlock--h3:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650506099144505346)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT apbuf_fun_id "Business Function",',
'            NVL(apbuf_fun_desc1,apbuf_fun_desc2) "Description",',
'            apbuf_module "Module",',
'            NULL "Assigned To"',
'   FROM appl_bus_fun',
'  WHERE apbuf_fun_id IN (''GLM1015'',''GLM1016'',''CDM1030'',''CDM1040'',''APM1010'',''APM1014'',''ARM1010'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(16932717162175425526)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>10788875132768904265
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555295648701358490)
,p_db_column_name=>'Assigned To'
,p_display_order=>40
,p_column_identifier=>'S'
,p_column_label=>'Assigned To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555295342068358487)
,p_db_column_name=>'Business Function'
,p_display_order=>10
,p_column_identifier=>'P'
,p_column_label=>'Business Function'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555295528322358488)
,p_db_column_name=>'Description'
,p_display_order=>20
,p_column_identifier=>'Q'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11555295549403358489)
,p_db_column_name=>'Module'
,p_display_order=>30
,p_column_identifier=>'R'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(16932825520749196355)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'54108597'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'Business Function:Description:Module:Assigned To'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11554707294142259057)
,p_name=>'Submit_Page'
,p_static_id=>'submit-page'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P13_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11554707814349259059)
,p_event_id=>wwv_flow_imp.id(11554707294142259057)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11554706843263259056)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Menu'
,p_static_id=>'menu'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :p13_search IS NOT NULL THEN',
'',
'DECLARE',
'   v_link   VARCHAR2 (200) := :p13_search;',
'   v_app_no NUMBER(5);',
'   v_node_type VARCHAR2(10);',
'BEGIN',
'',
'SELECT wbf_appl_no,wbf_node_type INTO v_app_no,v_node_type',
'FROM wapl_bus_fun',
'WHERE wbf_page_no=:p13_search;',
'',
'IF v_node_type =''RPT'' THEN ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':777:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:p13_search, 1));',
'   HTMLDB_APPLICATION.g_unrecoverable_error := TRUE;',
'',
'ELSE ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':106:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:p13_search, 1)',
'      || '',''',
'      || :app_session);',
'   HTMLDB_APPLICATION.g_unrecoverable_error := TRUE;',
'',
'END IF;',
'',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'Raise_Application_Error(-20999,''Application not defined for the Page.'');',
'   ',
'END;',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>6072745007719648028
);
wwv_flow_imp.component_end;
end;
/
