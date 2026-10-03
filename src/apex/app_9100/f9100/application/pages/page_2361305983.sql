prompt --application/pages/page_2361305983
begin
--   Manifest
--     PAGE: 2361305983
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
 p_id=>2361305983
,p_name=>'Cards'
,p_alias=>'CARDS'
,p_step_title=>'Cards'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7071822636520748632)
,p_name=>'SMS Unsend'
,p_static_id=>'sms-unsend'
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--featured force-fa-lg:t-Cards--displayIcons:t-Cards--3cols:t-Cards--animColorFill'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    select',
'       SOH_BU,',
'		 (SELECT',
'            bu_name1',
'        FROM',
'            business_units',
'        WHERE',
'            bu_id = SOH_BU)"BUS_NAME",',
'       SOH_DOC_NO,',
'		 soh_doc_date,',
' ( SELECT',
'    DECODE(',
'        (SELECT applctrl_desc_level FROM appl_control',
'        WHERE applctrl_bu = SOH_BU',
'        ),',
'        1,',
'        wf_bus_proc_desc,',
'        NVL(wf_bus_proc_desc2, wf_bus_proc_desc))',
'     AS Name',
'FROM',
'    work_flow',
'WHERE',
'   wf_bu         = SOH_BU',
'  AND   wf_bus_proc_id     = SOH_VOU_TYPE)"DOCUMENT_TYPE",',
'       SOH_BODY "CARD_TEXT",',
'       SOH_USER_ID,',
'       SOH_EMP_ID ,',
'       SOH_VOU_TYPE,',
'       SOH_VOU_PFX,',
'       SOH_VOU_NO "CARD_SUBTEXT",',
'       SOH_STATUS,',
'       SOH_CRE_BY,',
'       SOH_CRE_DATE,',
'       SOH_UPD_BY,',
'       SOH_UPD_DATE,',
'       SOH_UNIT,',
'       SOH_API_URL,',
'       SOH_SMS_TYPE,',
'       SORL_BU,',
'       SORL_DOC_NO,',
'       SORL_SEQ_NO,',
'       ''<span style= "color:green"; "font-style:bold">''||SORL_RCVR_MOB_NO||''</span>'' "CARD_TITLE",',
'       SORL_CRE_BY,',
'       SORL_CRE_DATE,',
'       SORL_UPD_BY,',
'       SORL_UPD_DATE,',
'       SORL_API_URL,',
'       SORL_SUB_SEQ_NO',
'  from SMS_OUTBOX_VW',
'  where sorl_bu = :global_bu'))
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
 p_id=>wwv_flow_imp.id(6011438875859280170)
,p_query_column_id=>2
,p_column_alias=>'BUS_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Bus Name'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030505802362094949)
,p_query_column_id=>11
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>310
,p_column_heading=>'Card Subtext'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030505718243094948)
,p_query_column_id=>6
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>300
,p_column_heading=>'Card Text'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030505921118094950)
,p_query_column_id=>23
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>320
,p_column_heading=>'Card Title'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6011439181725280173)
,p_query_column_id=>5
,p_column_alias=>'DOCUMENT_TYPE'
,p_column_display_sequence=>50
,p_column_heading=>'Document Type'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030504483795094936)
,p_query_column_id=>18
,p_column_alias=>'SOH_API_URL'
,p_column_display_sequence=>180
,p_column_heading=>'Soh Api Url'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6011438753516280169)
,p_query_column_id=>1
,p_column_alias=>'SOH_BU'
,p_column_display_sequence=>10
,p_column_heading=>'Soh Bu'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030503980880094931)
,p_query_column_id=>13
,p_column_alias=>'SOH_CRE_BY'
,p_column_display_sequence=>130
,p_column_heading=>'Soh Cre By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030504056597094932)
,p_query_column_id=>14
,p_column_alias=>'SOH_CRE_DATE'
,p_column_display_sequence=>140
,p_column_heading=>'Soh Cre Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6011439061037280172)
,p_query_column_id=>4
,p_column_alias=>'SOH_DOC_DATE'
,p_column_display_sequence=>40
,p_column_heading=>'Soh Doc Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6011438950854280171)
,p_query_column_id=>3
,p_column_alias=>'SOH_DOC_NO'
,p_column_display_sequence=>30
,p_column_heading=>'Soh Doc No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6011439443553280176)
,p_query_column_id=>8
,p_column_alias=>'SOH_EMP_ID'
,p_column_display_sequence=>80
,p_column_heading=>'Soh Emp Id'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030504571725094937)
,p_query_column_id=>19
,p_column_alias=>'SOH_SMS_TYPE'
,p_column_display_sequence=>190
,p_column_heading=>'Soh Sms Type'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030503906582094930)
,p_query_column_id=>12
,p_column_alias=>'SOH_STATUS'
,p_column_display_sequence=>120
,p_column_heading=>'Soh Status'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030504401825094935)
,p_query_column_id=>17
,p_column_alias=>'SOH_UNIT'
,p_column_display_sequence=>170
,p_column_heading=>'Soh Unit'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030504200322094933)
,p_query_column_id=>15
,p_column_alias=>'SOH_UPD_BY'
,p_column_display_sequence=>150
,p_column_heading=>'Soh Upd By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030504256106094934)
,p_query_column_id=>16
,p_column_alias=>'SOH_UPD_DATE'
,p_column_display_sequence=>160
,p_column_heading=>'Soh Upd Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6011439381667280175)
,p_query_column_id=>7
,p_column_alias=>'SOH_USER_ID'
,p_column_display_sequence=>70
,p_column_heading=>'Soh User Id'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6011439695955280178)
,p_query_column_id=>10
,p_column_alias=>'SOH_VOU_PFX'
,p_column_display_sequence=>100
,p_column_heading=>'Soh Vou Pfx'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6011439570836280177)
,p_query_column_id=>9
,p_column_alias=>'SOH_VOU_TYPE'
,p_column_display_sequence=>90
,p_column_heading=>'Soh Vou Type'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030505454934094946)
,p_query_column_id=>28
,p_column_alias=>'SORL_API_URL'
,p_column_display_sequence=>280
,p_column_heading=>'Sorl Api Url'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030504715676094938)
,p_query_column_id=>20
,p_column_alias=>'SORL_BU'
,p_column_display_sequence=>200
,p_column_heading=>'Sorl Bu'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030505086513094942)
,p_query_column_id=>24
,p_column_alias=>'SORL_CRE_BY'
,p_column_display_sequence=>240
,p_column_heading=>'Sorl Cre By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030505190593094943)
,p_query_column_id=>25
,p_column_alias=>'SORL_CRE_DATE'
,p_column_display_sequence=>250
,p_column_heading=>'Sorl Cre Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030504802783094939)
,p_query_column_id=>21
,p_column_alias=>'SORL_DOC_NO'
,p_column_display_sequence=>210
,p_column_heading=>'Sorl Doc No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030504914805094940)
,p_query_column_id=>22
,p_column_alias=>'SORL_SEQ_NO'
,p_column_display_sequence=>220
,p_column_heading=>'Sorl Seq No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030505600194094947)
,p_query_column_id=>29
,p_column_alias=>'SORL_SUB_SEQ_NO'
,p_column_display_sequence=>290
,p_column_heading=>'Sorl Sub Seq No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030505290856094944)
,p_query_column_id=>26
,p_column_alias=>'SORL_UPD_BY'
,p_column_display_sequence=>260
,p_column_heading=>'Sorl Upd By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030505368529094945)
,p_query_column_id=>27
,p_column_alias=>'SORL_UPD_DATE'
,p_column_display_sequence=>270
,p_column_heading=>'Sorl Upd Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6030479348872961020)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7071822636520748632)
,p_button_name=>'Resend'
,p_static_id=>'resend'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Resend'
,p_button_condition_type=>'NEVER'
,p_grid_new_row=>'Y'
);
wwv_flow_imp.component_end;
end;
/
