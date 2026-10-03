prompt --application/pages/page_00101
begin
--   Manifest
--     PAGE: 00101
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
 p_id=>101
,p_name=>' Plan Maintenance'
,p_alias=>'PLAN-MAINTENANCE'
,p_step_title=>' Plan Maintenance'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(6339300137962061229)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(10435071315620846217)
,p_name=>'BILL OF MATERIL'
,p_static_id=>'bill-of-materil'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUM(V_COUNT) Total FROM (',
'select count(*)V_COUNT from bom_hd',
'  UNION ALL ',
'select count(*) V_COUNT from bom_hd_hist',
') '))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7971900110757466407)
,p_query_column_id=>1
,p_column_alias=>'TOTAL'
,p_column_display_sequence=>10
,p_column_heading=>'Bill Of Material '
,p_column_alignment=>'CENTER'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10435075098223846254)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_parent_plug_id=>wwv_flow_imp.id(10435071315620846217)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(7971900759923466517)
,p_region_id=>wwv_flow_imp.id(10435075098223846254)
,p_chart_type=>'pie'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_fill_multi_series_gaps=>false
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(7971901162558466551)
,p_chart_id=>wwv_flow_imp.id(7971900759923466517)
,p_static_id=>'new'
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUM(V_COUNT)coun,DECODE(status,''E'',''Draft'',''A'',''Active'',''N'',''Entry Complete'',''I'',''Inactive'')status FROM (',
'select count(*)V_COUNT,bomhd_status status from bom_hd',
'group by bomhd_status',
'  UNION ALL ',
'select count(*) V_COUNT,bomhdh_status  status from bom_hd_hist',
'group by bomhdh_status ) ',
'group by status',
''))
,p_series_type=>'pie'
,p_series_name_column_name=>'STATUS'
,p_items_value_column_name=>'COUN'
,p_items_label_column_name=>'STATUS'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10435072406045846228)
,p_plug_name=>'New'
,p_static_id=>'new-2'
,p_parent_plug_id=>wwv_flow_imp.id(10435072265706846226)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(7971908825826466592)
,p_region_id=>wwv_flow_imp.id(10435072406045846228)
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
 p_id=>wwv_flow_imp.id(7971910467495466595)
,p_chart_id=>wwv_flow_imp.id(7971908825826466592)
,p_static_id=>'new'
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUM(V_COUNT),Decode(STATUS,''E'',''Unreleased'',''N'',''Entry Completed'',''P'',''Inprogress'',''H'',''On Hold'',''L'',''Close Shorted'',''R'',''Completed'',''C'',''Cancelled'')STATUS FROM (SELECT COUNT(*)V_COUNT,PROHD_STATUS STATUS FROM PROD_ORDER_HD',
'   GROUP BY PROHD_STATUS',
'UNION ALL ',
'SELECT COUNT(*) V_COUNT,PROHDH_STATUS STATUS FROM PROD_ORDER_HD_HIST',
'GROUP BY PROHDH_STATUS)',
'GROUP BY STATUS'))
,p_series_type=>'bar'
,p_series_name_column_name=>'STATUS'
,p_items_value_column_name=>'SUM(V_COUNT)'
,p_items_label_column_name=>'STATUS'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(7971909331290466593)
,p_chart_id=>wwv_flow_imp.id(7971908825826466592)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title_font_color=>'#000000'
,p_format_scaling=>'thousand'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(7971909862913466595)
,p_chart_id=>wwv_flow_imp.id(7971908825826466592)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'thousand'
,p_scaling=>'linear'
,p_baseline_scaling=>'min'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10435073154531846235)
,p_plug_name=>'New'
,p_static_id=>'new-3'
,p_parent_plug_id=>wwv_flow_imp.id(10435072902480846233)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(7971912330832466598)
,p_region_id=>wwv_flow_imp.id(10435073154531846235)
,p_chart_type=>'lineWithArea'
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
 p_id=>wwv_flow_imp.id(7971913973767466603)
,p_chart_id=>wwv_flow_imp.id(7971912330832466598)
,p_static_id=>'new'
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUM(V_COUNT),DECODE(STATUS,''E'',''Draft'',''N'',''Entry Completed'',''A'',''Approved'',''C'',''Completed'',''L'',''Cancelled'')STATUS FROM (SELECT COUNT(*) V_COUNT,RWOHD_STATUS STATUS FROM REWORK_ORDER_HD',
'group by RWOHD_STATUS',
'UNION ALL ',
'SELECT COUNT(*)V_COUNT, RWOHDh_STATUS STATUS FROM REWORK_ORDER_HD_HIST',
'group by RWOHDh_STATUS)',
'GROUP BY STATUS'))
,p_series_type=>'lineWithArea'
,p_series_name_column_name=>'STATUS'
,p_items_value_column_name=>'SUM(V_COUNT)'
,p_items_label_column_name=>'STATUS'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(7971912781253466599)
,p_chart_id=>wwv_flow_imp.id(7971912330832466598)
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
 p_id=>wwv_flow_imp.id(7971913355838466601)
,p_chart_id=>wwv_flow_imp.id(7971912330832466598)
,p_static_id=>'y'
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10435074567335846249)
,p_plug_name=>'New'
,p_static_id=>'new-4'
,p_parent_plug_id=>wwv_flow_imp.id(10435074313309846247)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(7971902991451466567)
,p_region_id=>wwv_flow_imp.id(10435074567335846249)
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
 p_id=>wwv_flow_imp.id(7971904654517466574)
,p_chart_id=>wwv_flow_imp.id(7971902991451466567)
,p_static_id=>'new'
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUM(V_COUNT)COUN, decode(STATUS,''N'',''Draft'',''A'',''Posted'',''F'',''Forwarded To QC'',''Q'',''QC Completed'',''C'',''Cancelled'')STATUS FROM(SELECT COUNT(*)V_COUNT,PT_STATUS STATUS FROM PROD_TRANSFER',
'WHERE  PT_PROD_TYPE  IN (''EQMS'')',
'GROUP BY  PT_STATUS',
'UNION ALL ',
'SELECT COUNT(*)V_COUNT ,PTH_STATUS STATUS  FROM PROD_TRANSFER_HIST',
'WHERE  PTH_PROD_TYPE   IN (''EQMS'')',
'GROUP BY  PTH_STATUS )',
'GROUP BY STATUS'))
,p_series_type=>'bar'
,p_series_name_column_name=>'STATUS'
,p_items_value_column_name=>'COUN'
,p_items_label_column_name=>'STATUS'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(7971903477624466568)
,p_chart_id=>wwv_flow_imp.id(7971902991451466567)
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
 p_id=>wwv_flow_imp.id(7971904092384466574)
,p_chart_id=>wwv_flow_imp.id(7971902991451466567)
,p_static_id=>'y'
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10454672207296383917)
,p_plug_name=>'New'
,p_static_id=>'new-5'
,p_parent_plug_id=>wwv_flow_imp.id(10454672033229383915)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(7971906473173466582)
,p_region_id=>wwv_flow_imp.id(10454672207296383917)
,p_chart_type=>'pie'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_fill_multi_series_gaps=>false
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(7971907008380466585)
,p_chart_id=>wwv_flow_imp.id(7971906473173466582)
,p_static_id=>'new'
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUM(V_COUNT)TOTAL,Decode(STATUS,''N'',''Draft'',''E'',''Entry Completed'',''F'',''Forwarded to QC'',''Q'',''QC Completed'',''P'',''Posted'',''C'',''Cancelled'')STATUS FROM(SELECT COUNT(*)V_COUNT,RWOCHD_STATUS STATUS FROM REWORK_ORDER_COMP_HD',
'group by RWOCHD_STATUS',
'UNION ALL ',
'SELECT COUNT(*)V_COUNT,RWOCHDH_STATUS STATUS FROM REWORK_ORDER_COMP_HD_HIST',
'GROUP BY RWOCHDH_STATUS)',
'GROUP BY STATUS',
''))
,p_series_type=>'pie'
,p_series_name_column_name=>'STATUS'
,p_items_value_column_name=>'TOTAL'
,p_items_label_column_name=>'STATUS'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(10454672737401383922)
,p_name=>'New'
,p_static_id=>'new-6'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--textContent:t-Region--hiddenOverflow:t-Form--slimPadding:margin-top-md'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--featured force-fa-lg:t-Cards--displayInitials:t-Cards--5cols:t-Cards--hideBody:t-Cards--animColorFill:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''<span style = "color:#386273; margin-left: 10px;font-weight: bolder;text-align:center;">Bill Of Materil </span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       1 seq_no',
' FROM bom_hd',
' WHERE bomhd_status=''E''',
'  -- AND bomhd_bu=:global_bu',
'UNION ALL',
'SELECT ''<span style = "color:#386273; margin-left: 10px;font-weight: bolder;text-align:center;">BOM Completed</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       2 seq_no',
'  FROM bom_hd',
' WHERE bomhd_status=''N''',
'   --AND bomhd_bu=:global_bu',
'UNION ALL',
'SELECT ''<span style = "color:#386273; margin-left: 10px;font-weight: bolder;text-align:center;">Production Order Unreleases</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       3 seq_no',
' from (SELECT 1 FROM prod_order_hd',
'where PROHD_STATUS=''E''',
'--and prohd_bu=:global_bu',
'UNION ALL ',
'  SELECT 1 FROM prod_order_hd_hist',
'  WHERE prohdh_status=''E''',
'  --and prohdh_bu=:global_bu',
'  )',
'UNION ALL',
'SELECT ''<span style = "color:#386273; margin-left: 10px;font-weight: bolder;text-align:center;">Production Order Inprogress</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       4 seq_no',
' from (SELECT 1 FROM prod_order_hd',
'where PROHD_STATUS=''P''',
'UNION ALL ',
'  SELECT 1 FROM prod_order_hd_hist',
'  WHERE prohdh_status=''P'')',
'UNION ALL',
'SELECT ''<span style = "color:#386273; margin-left: 10px;font-weight: bolder;text-align:center;">Production Order Completed</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       5 seq_no',
'  FROM  (SELECT 1 FROM prod_order_hd',
'where PROHD_STATUS=''N''',
'UNION ALL ',
'  SELECT 1 FROM prod_order_hd_hist',
'  WHERE prohdh_status=''N'')',
'UNION ALL',
'SELECT ''<span style = "color:#386273; margin-left: 10px;font-weight: bolder;text-align:center;">Prod.Ord. Process Wise Pending</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       6 seq_no',
'  FROM prod_transfer',
'where pt_status=''N''',
'UNION ALL',
'SELECT ''<span style = "color:#386273; margin-left: 10px;font-weight: bolder;text-align:center;">Process Wise Completed</span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       8 seq_no',
' from prod_transfer_hist',
'where pth_status=''A''',
'UNION ALL',
'SELECT ''<span style = "color:#386273; margin-left: 10px;font-weight: bolder;text-align:center;">Serial Wise pending </span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       10 seq_no',
'FROM PROD_TRANSFER',
'WHERE  PT_PROD_TYPE IN (''EQMS'')',
'AND PT_STATUS=''N''',
'UNION ALL ',
'SELECT ''<span style = "color:#386273; margin-left: 10px;font-weight: bolder;text-align:center;">Serial Wise Completed </span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       10 seq_no',
'FROM PROD_TRANSFER_HIST',
'WHERE  PTH_PROD_TYPE IN (''EQMS'')',
'AND PTH_STATUS=''E''',
'UNION ALL ',
' SELECT ''<span style = "color:#386273; margin-left: 10px;font-weight: bolder;text-align:center;">Rework Order Pending </span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       10 seq_no',
' FROM REWORK_ORDER_HD',
' WHERE rwohd_status =''E''',
'/*UNION ALL ',
' SELECT ''<span style = "color:#386273; margin-left: 10px;font-weight: bolder;text-align:center;">Rework Order Completion </span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       10 seq_no',
'FROM rework_order_dtls_view*/',
'/*UNION ALL ',
' SELECT ''<span style = "color:#386273; margin-left: 10px;font-weight: bolder;text-align:center;">Rework Order Completion Pending </span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       10 seq_no',
' FROM REWORK_ORDER_HD',
' WHERE rwohd_status =''E''*/',
' UNION ALL ',
' SELECT ''<span style = "color:#386273; margin-left: 10px;font-weight: bolder;text-align:center;">Rework Order Completion  </span>'' "CARD_SUBTITLE",',
'       COUNT (*) "CARD_INITIALS",',
'       NULL "CARD_TITLE",',
'       10 seq_no',
' FROM rework_order_comp_view',
' where RWOCHD_STATUS NOT IN (''N'')',
' ',
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
 p_id=>wwv_flow_imp.id(7971917243191466617)
,p_query_column_id=>2
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>20
,p_column_heading=>'Card Initials'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7971918388503466634)
,p_query_column_id=>1
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Subtitle'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7971917621021466618)
,p_query_column_id=>3
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'Card Title'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7971918025962466631)
,p_query_column_id=>4
,p_column_alias=>'SEQ_NO'
,p_column_display_sequence=>40
,p_column_heading=>'Seq No'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(10435072265706846226)
,p_name=>'Production'
,p_static_id=>'production'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUM(V_COUNT) TOTAL FROM (SELECT COUNT(*)V_COUNT FROM PROD_ORDER_HD',
'UNION ALL ',
'SELECT COUNT(*) V_COUNT FROM PROD_ORDER_HD_HIST)',
''))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7971907964608466588)
,p_query_column_id=>1
,p_column_alias=>'TOTAL'
,p_column_display_sequence=>10
,p_column_heading=>'Production Order '
,p_column_alignment=>'CENTER'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10435073886553846242)
,p_plug_name=>'Production Completion Process Wise'
,p_static_id=>'production-completion-process-wise'
,p_parent_plug_id=>wwv_flow_imp.id(10435073615340846240)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(7971915791233466607)
,p_region_id=>wwv_flow_imp.id(10435073886553846242)
,p_chart_type=>'pie'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_fill_multi_series_gaps=>false
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(7971916310614466610)
,p_chart_id=>wwv_flow_imp.id(7971915791233466607)
,p_static_id=>'new'
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUM(V_COUNT)COUN, decode(STATUS,''N'',''Draft'',''A'',''Posted'',''F'',''Forwarded To QC'',''Q'',''QC Completed'',''C'',''Cancelled'')STATUS FROM(SELECT COUNT(*)V_COUNT,PT_STATUS STATUS FROM PROD_TRANSFER',
'WHERE  PT_PROD_TYPE NOT IN (''EQMS'')',
'GROUP BY  PT_STATUS',
'UNION ALL ',
'SELECT COUNT(*)V_COUNT ,PTH_STATUS STATUS  FROM PROD_TRANSFER_HIST',
'WHERE  PTH_PROD_TYPE NOT  IN (''EQMS'')',
'GROUP BY  PTH_STATUS )',
'GROUP BY STATUS'))
,p_series_type=>'pie'
,p_series_name_column_name=>'STATUS'
,p_items_value_column_name=>'COUN'
,p_items_label_column_name=>'STATUS'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(10435073615340846240)
,p_name=>'Production Process'
,p_static_id=>'production-process'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUM(V_COUNT)TOTAL FROM(SELECT COUNT(*)V_COUNT FROM PROD_TRANSFER',
'WHERE  PT_PROD_TYPE NOT IN (''EQMS'')',
'UNION ALL ',
'SELECT COUNT(*)V_COUNT FROM PROD_TRANSFER_HIST',
'WHERE  PTH_PROD_TYPE NOT IN (''EQMS'') )'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7971914948382466606)
,p_query_column_id=>1
,p_column_alias=>'TOTAL'
,p_column_display_sequence=>10
,p_column_heading=>'Production Completion Process Wise'
,p_column_alignment=>'CENTER'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(10435074313309846247)
,p_name=>'Production Serila wise'
,p_static_id=>'production-serila-wise'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUM(V_COUNT)TOTAL FROM(SELECT COUNT(*)V_COUNT FROM PROD_TRANSFER',
'WHERE  PT_PROD_TYPE IN (''EQMS'')',
'UNION ALL ',
'SELECT COUNT(*)V_COUNT FROM PROD_TRANSFER_HIST',
'WHERE  PTH_PROD_TYPE  IN (''EQMS'') )'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7971902172474466563)
,p_query_column_id=>1
,p_column_alias=>'TOTAL'
,p_column_display_sequence=>10
,p_column_heading=>'Production Completion Serial Wise'
,p_column_alignment=>'CENTER'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(10435072902480846233)
,p_name=>'REWORK ORDER'
,p_static_id=>'rework-order'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUM(V_COUNT) TOTAL FROM (SELECT COUNT(*) V_COUNT FROM REWORK_ORDER_HD',
'UNION ALL ',
'SELECT COUNT(*)V_COUNT FROM REWORK_ORDER_HD_HIST)'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7971911512607466596)
,p_query_column_id=>1
,p_column_alias=>'TOTAL'
,p_column_display_sequence=>10
,p_column_heading=>'Rework order'
,p_column_alignment=>'CENTER'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(10454672033229383915)
,p_name=>'REWORK ORDER Completion'
,p_static_id=>'rework-order-completion'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>60
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'SELECT SUM(V_COUNT)TOTAL FROM(SELECT COUNT(*)V_COUNT FROM REWORK_ORDER_COMP_HD',
'UNION ALL ',
'SELECT COUNT(*)V_COUNT FROM REWORK_ORDER_COMP_HD_HIST',
')'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7971905712195466579)
,p_query_column_id=>1
,p_column_alias=>'TOTAL'
,p_column_display_sequence=>10
,p_column_heading=>'Rework order Completion'
,p_column_alignment=>'CENTER'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp.component_end;
end;
/
