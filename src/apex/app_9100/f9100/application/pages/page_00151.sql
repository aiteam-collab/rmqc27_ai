prompt --application/pages/page_00151
begin
--   Manifest
--     PAGE: 00151
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
 p_id=>151
,p_name=>'Bus Fun'
,p_alias=>'BUS-FUN1'
,p_step_title=>'Bus Fun'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6168934137895010229)
,p_name=>'New'
,p_static_id=>'new'
,p_template=>wwv_flow_imp.id(10650515782604505361)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT LEVEL,',
'       LPAD('' '', LEVEL * 2) || parent_NAME||Child_NAME AS MENU_NAME,',
'       WBF_BUS_FUN_ID,',
'       WBF_PAR_FUN_ID,',
'       WBF_FORM_ICON,',
'       parent_NAME,',
'       Child_NAME,',
'       WBF_SEQ_NO',
'       FROM(',
'       SELECT',
'       WBF_BUS_FUN_ID,',
'       WBF_PAR_FUN_ID,',
'       WBF_FORM_ICON,',
'       WBF_SEQ_NO,',
'       DECODE(WBF_PAR_FUN_ID,NULL,WBF_BUS_FUN_NAME) parent_NAME,',
'       DECODE(WBF_PAR_FUN_ID,NULL,NULL,WBF_BUS_FUN_NAME) Child_NAME',
'FROM wapl_bus_fun)',
'START WITH WBF_PAR_FUN_ID IS NULL',
'CONNECT BY PRIOR WBF_BUS_FUN_ID = WBF_PAR_FUN_ID'))
,p_query_row_template=>wwv_flow_imp.id(11674032448645407953)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6168938652740010274)
,p_query_column_id=>7
,p_column_alias=>'CHILD_NAME'
,p_column_display_sequence=>70
,p_column_heading=>'Child Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6168938092859010268)
,p_query_column_id=>1
,p_column_alias=>'LEVEL'
,p_column_display_sequence=>10
,p_column_heading=>'Level'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6168938138020010269)
,p_query_column_id=>2
,p_column_alias=>'MENU_NAME'
,p_column_display_sequence=>20
,p_column_heading=>'Menu Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6168938569638010273)
,p_query_column_id=>6
,p_column_alias=>'PARENT_NAME'
,p_column_display_sequence=>60
,p_column_heading=>'Parent Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6168938309492010270)
,p_query_column_id=>3
,p_column_alias=>'WBF_BUS_FUN_ID'
,p_column_display_sequence=>30
,p_column_heading=>'Wbf Bus Fun Id'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6168938464598010272)
,p_query_column_id=>5
,p_column_alias=>'WBF_FORM_ICON'
,p_column_display_sequence=>50
,p_column_heading=>'Wbf Form Icon'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6168938398022010271)
,p_query_column_id=>4
,p_column_alias=>'WBF_PAR_FUN_ID'
,p_column_display_sequence=>40
,p_column_heading=>'Wbf Par Fun Id'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6168938789003010275)
,p_query_column_id=>8
,p_column_alias=>'WBF_SEQ_NO'
,p_column_display_sequence=>80
,p_column_heading=>'Wbf Seq No'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp.component_end;
end;
/
