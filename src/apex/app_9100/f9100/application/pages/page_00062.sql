prompt --application/pages/page_00062
begin
--   Manifest
--     PAGE: 00062
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
 p_id=>62
,p_name=>'Buyers'
,p_alias=>'BUYERS'
,p_step_title=>'Buyers'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'  }',
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6706767081218734692)
,p_plug_name=>'Buyers'
,p_static_id=>'buyers'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:is-expanded:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>'select * from buyers where buyer_bu = :Global_bu'
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Buyers'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6706767152643734692)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_max_rows_per_page=>'10'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1224805317100123664
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6706769884796734703)
,p_db_column_name=>'BUYER_ADMIN_FLAG'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Buyer Admin Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6706767542287734693)
,p_db_column_name=>'BUYER_BU'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Buyer Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6706770247086734703)
,p_db_column_name=>'BUYER_CRE_BY'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Buyer Cre By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6706771452871734704)
,p_db_column_name=>'BUYER_CRE_DATE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Buyer Cre Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6706773455311734707)
,p_db_column_name=>'BUYER_CRE_EMP_ID'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Buyer Cre Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6706770709579734703)
,p_db_column_name=>'BUYER_CRE_IP_ADDR'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Buyer Cre Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6706771055743734704)
,p_db_column_name=>'BUYER_CRE_OS_USER'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Buyer Cre Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6706769471432734701)
,p_db_column_name=>'BUYER_DFLT_FLG'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Buyer Dflt Flg'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6706768732764734701)
,p_db_column_name=>'BUYER_EFF_FROM'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Buyer Eff From'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6706769107501734701)
,p_db_column_name=>'BUYER_EFF_TO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Buyer Eff To'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6706768320665734699)
,p_db_column_name=>'BUYER_EMP_ID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Buyer Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6706767942529734699)
,p_db_column_name=>'BUYER_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Buyer Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6706771838575734704)
,p_db_column_name=>'BUYER_UPD_BY'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Buyer Upd By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6706773060578734706)
,p_db_column_name=>'BUYER_UPD_DATE'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Buyer Upd Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6706773850301734707)
,p_db_column_name=>'BUYER_UPD_EMP_ID'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Buyer Upd Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6706772261146734706)
,p_db_column_name=>'BUYER_UPD_IP_ADDR'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Buyer Upd Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6706772701393734706)
,p_db_column_name=>'BUYER_UPD_OS_USER'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Buyer Upd Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6706775007630736813)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'12248132'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'BUYER_BU:BUYER_ID:BUYER_EMP_ID:BUYER_EFF_FROM:BUYER_EFF_TO:BUYER_DFLT_FLG:BUYER_ADMIN_FLAG:BUYER_CRE_BY:BUYER_CRE_IP_ADDR:BUYER_CRE_OS_USER:BUYER_CRE_DATE:BUYER_UPD_BY:BUYER_UPD_IP_ADDR:BUYER_UPD_OS_USER:BUYER_UPD_DATE:BUYER_CRE_EMP_ID:BUYER_UPD_EMP_'
||'ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6701547178936416162)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(6701547244973416163)
,p_region_id=>wwv_flow_imp.id(6701547178936416162)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(6701547430797416164)
,p_chart_id=>wwv_flow_imp.id(6701547244973416163)
,p_static_id=>'new'
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select poh_suplr_id,',
'		 sum(poh_tot_amt) poh_tot_amt',
' from pur_order_hd',
'where poh_bu = :global_bu',
'group by poh_suplr_id',
''))
,p_series_type=>'bar'
,p_items_value_column_name=>'POH_TOT_AMT'
,p_group_short_desc_column_name=>'POH_SUPLR_ID'
,p_items_label_column_name=>'POH_SUPLR_ID'
,p_color=>'#d8d1f2'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(6701547527648416165)
,p_chart_id=>wwv_flow_imp.id(6701547244973416163)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(6701547637824416167)
,p_chart_id=>wwv_flow_imp.id(6701547244973416163)
,p_static_id=>'y'
,p_axis=>'y2'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_split_dual_y=>'auto'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(6701547630460416166)
,p_chart_id=>wwv_flow_imp.id(6701547244973416163)
,p_static_id=>'y-2'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp.component_end;
end;
/
