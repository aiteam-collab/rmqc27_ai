prompt --application/pages/page_00007
begin
--   Manifest
--     PAGE: 00007
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
 p_id=>7
,p_name=>'Home - Copy (Ganesh)'
,p_alias=>'HOME-COPY-GANESH'
,p_step_title=>'Home - Copy (Ganesh)'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(15686749137436185347)
,p_name=>'Menu'
,p_static_id=>'menu'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--featured t-Cards--block force-fa-lg:t-Cards--displayIcons:t-Cards--4cols:t-Cards--hideBody:t-Cards--iconsRounded:t-Cards--animRaiseCard'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''f?p=''||nvl(701,''&APP_ID.'')||'':''||''erp_fin''||''::BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||:APP_SESSION CARD_LINK,',
'       ''Finance''CARD_TITLE,',
'       ''fa-dollar'' CARD_ICON,',
'       ''Finance Entry Screen and Report Details''  CARD_SUBTITLE',
'  FROM DUAL ',
'UNION ALL',
'SELECT ''f?p=''||nvl(702,''&APP_ID.'')||'':''||''erp_scm''||''::BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||:APP_SESSION CARD_LINK,',
'        ''Supply Chain Management''CARD_TITLE,',
'       ''fa-users'' CARD_ICON,',
'       ''SCM Entry Screen and Report Details''',
'  FROM DUAL',
'UNION ALL',
'SELECT ''f?p=''||nvl(703,''&APP_ID.'')||'':''||''erp_pmf''||''::BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||:APP_SESSION CARD_LINK,',
'         ''Planning and Manufacturing''CARD_TITLE,',
'       ''fa-code-fork'' CARD_ICON,',
'       ''PMF Entry Screen and Report Details''',
'  FROM DUAL',
' UNION ALL',
' SELECT ''f?p=''||nvl(704,''&APP_ID.'')||'':''||''erp_hrm''||''::BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||:APP_SESSION CARD_LINK,',
'        ''Human Resources / Payroll''CARD_TITLE,',
'       ''fa-users'' CARD_ICON,',
'       ''HR Entry Screen and Report Details''',
'  FROM DUAL'))
,p_customized=>'2'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11171900768603257117)
,p_query_column_id=>3
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>2
,p_column_heading=>'Card Icon'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11171901545826257118)
,p_query_column_id=>1
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>4
,p_column_heading=>'Card Link'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11171901176163257117)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>3
,p_column_heading=>'Card Subtitle'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11171900368723257117)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card Title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7509589707883433744)
,p_plug_name=>'UNIT'
,p_static_id=>'unit'
,p_parent_plug_id=>wwv_flow_imp.id(15686749137436185347)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7509589581897433743)
,p_plug_name=>'Unit Location'
,p_static_id=>'unit-location'
,p_parent_plug_id=>wwv_flow_imp.id(15686749137436185347)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11171901973798257118)
,p_name=>'P7_NEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(15686749137436185347)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''https://mis.roadmaperp.com/apex/f?p=''||nvl(702,''&APP_ID.'')||'':''||''erp_scm''||''::BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE:GLOBAL_SESSION:''||:GLOBAL_USER||'',''||:GLOBAL_P||'',''||:APP_SESSION CARD_LINK',
'  FROM DUAL ',
'  '))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
