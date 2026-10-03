prompt --application/pages/page_950100006022
begin
--   Manifest
--     PAGE: 950100006022
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
 p_id=>950100006022
,p_name=>'Human Resource'
,p_alias=>'HUMAN-RESOURCE'
,p_step_title=>'Human Resource'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.card-title span {',
'    color: #b56452;',
'    font-size: 12px;',
'    padding-left: 4px;',
'}',
'.t-Body-contentInner{',
'  background-color: #F3F2F2;',
'}',
'.t-Region-headerItems--title',
'{',
'        padding:4px;',
'        font-size:15px;',
'}',
'.t-BadgeList--circular .t-BadgeList-value a {',
'    box-shadow: none;',
'    color: white;',
'     font-size: 21px;',
'}',
'',
'.t-BadgeList--circular.t-BadgeList--xxlarge .t-BadgeList-label {',
'    font-size: 14px;',
'    padding-bottom: 4px ;',
'    color: rgba(41, 39, 39, 0.99);',
'    font-weight: bold;',
'}',
'',
'.t-BadgeList--circular.t-BadgeList--xxlarge .t-BadgeList-value {',
'    width: 218px;',
'    height: 83px;',
'    font-size: 28px;',
'    line-height: 43px; ',
'    border-radius: 12px;',
'      ',
'}',
'.a-IRR-header {',
'    background-color: #c1f4ff;',
'    border-top: 1px solid #e6e6e6;',
'    box-shadow: inset 1px 0 0 0 #e6e6e6;',
'}',
'',
'#OrderBooking .t-BadgeList .t-BadgeList-value {',
'    color: #ffffff;',
'    box-shadow: 0 0 0 1px rgba(64, 64, 64, 0.1) inset;',
'    background-image: linear-gradient(to right, #FF9800 0%, #FF9800 100%);',
'    /* background: olive; */',
'}',
'#sales .t-BadgeList .t-BadgeList-value {',
'    color: #ffffff;',
'    box-shadow: 0 0 0 1px rgba(64, 64, 64, 0.1) inset;',
'    background-image: linear-gradient(to top, #0000ff 0%, #0000ff 100%);',
' background-blend-mode: multiply,multiply;',
'    /* background: olive; */',
'}',
'',
'#SR .t-BadgeList .t-BadgeList-value {',
'    color: #ffffff;',
'    box-shadow: 0 0 0 1px rgba(64, 64, 64, 0.1) inset;',
'    background: linear-gradient(to bottom, #8bc34a 54%, #8bc34a 106%);',
'    /* background: olive; */',
'}',
'#NetSales .t-BadgeList .t-BadgeList-value {',
'    color: #ffffff;',
'    box-shadow: 0 0 0 1px rgba(64, 64, 64, 0.1) inset;',
'    background: linear-gradient(to bottom, #673ab7 54%, #673ab7 106%);',
'    /* background: olive; */',
'}',
'',
'#OTD .t-BadgeList .t-BadgeList-value {',
'    color: #ffffff;',
'    box-shadow: 0 0 0 1px rgba(64, 64, 64, 0.1) inset;',
'    background: linear-gradient(to bottom, rgba(255,255,255,0.15) 0%, rgba(0,0,0,0.15) 100%), radial-gradient(at top center, rgba(255,255,255,0.40) 0%, rgba(0,0,0,0.40) 120%) #0cd73b;',
'    /* background: olive; */',
'}',
'',
'#ETD .t-BadgeList .t-BadgeList-value {',
'    color: #ffffff;',
'    box-shadow: 0 0 0 1px rgba(64, 64, 64, 0.1) inset;',
'    background: linear-gradient(to bottom, rgba(255,255,255,0.15) 0%, rgba(0,0,0,0.15) 100%), radial-gradient(at top center, rgba(255,255,255,0.40) 0%, rgba(0,0,0,0.40) 120%) #3abbf8;',
'    /* background: olive; */',
'}',
'#PD .t-BadgeList .t-BadgeList-value {',
'    color: #ffffff;',
'    box-shadow: 0 0 0 1px rgba(64, 64, 64, 0.1) inset;',
'    background-image: linear-gradient(to top, #8a7d8e 0%, #8a7d8e 100%);',
'    /* background: olive; */',
'}',
'#PSO .t-BadgeList .t-BadgeList-value {',
'    color: #ffffff;',
'    box-shadow: 0 0 0 1px rgba(64, 64, 64, 0.1) inset;',
'    background-image: radial-gradient(circle 248px at center, #30CFD0 0%, #30CFD0 47%, #30CFD0 100%);',
'    /* background: olive; */',
'}',
'',
'#DS a {',
'    color: #2196F3;',
'}',
'',
'',
'#filter {',
'    margin: 36px 1px -31px;',
'    padding: 7px 6px 4px;',
'    -- color: white;',
'    background-color: rgba(255, 217, 0, 0.877); ',
'}',
'',
'#CLOSE .t-BadgeList .t-BadgeList-value {',
'    color: #ffffff;',
'    box-shadow: 0 0 0 1px rgba(64, 64, 64, 0.1) inset;',
'    background-image: linear-gradient(to top, #fbce4a 0%, #fbce4a 100%);',
'    background-blend-mode: multiply,multiply;',
'    /* background: olive; */',
'}',
'',
'',
'.t-Region--controlsPosEnd.a-Collapsible.is-collapsed .a-Collapsible-icon:before {',
'    rotate: 90deg !important;',
'}',
'',
'',
'',
'',
'',
'',
'',
'',
''))
,p_step_template=>wwv_flow_imp.id(10650482615684505314)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(33441224596812083459)
,p_name=>'% Attrition Rate'
,p_static_id=>'attrition-rate'
,p_region_name=>'ATR'
,p_parent_plug_id=>wwv_flow_imp.id(13633272223555794537)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>120
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--hiddenOverflow:margin-top-none'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--float:t-Cards--animColorFill'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  ',
'       ''% Attrition Rate'' NAME,',
'        sum(total_att_rate) value',
'      from (',
'  SELECT emp_bu,',
'         ps_emp_new,',
'         ps_emp_old,',
'         pcp_year,',
'         pcp_period,',
'         pcp_start_date,',
'         pcp_long_desc,',
'         pcp_short_desc,',
'         (total_opn_bal - ps_emp_old_bef) total_opn_bal,',
'         ( (total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new) cl_bal,',
'          NVL(ROUND( (ps_emp_old / NULLIF((((total_opn_bal - ps_emp_old_bef)  + ( (total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new))/2), 0))*100,2), 0) totaL_att_rate',
'    FROM (SELECT emp_bu,',
'                 ps_emp_new,',
'                 ps_emp_old,',
'                 pcp_year,',
'                 pcp_period,',
'                 pcp_start_date,',
'                 ps_emp_old_bef,',
'                 pcp_long_desc,',
'                 pcp_short_desc,',
'                 ( (SELECT COUNT (*)',
'                      FROM employees, emp_active_infos',
'                     WHERE     emp_bu = empai_bu',
'                           AND emp_emp_id = empai_emp_id',
'                           AND emp_bu = :global_bu',
'                           AND TRUNC (emp_start_date) < pcp_start_date',
'                           AND emp_status <> ''E'' ))',
'                    total_opn_bal',
'            FROM (  SELECT emp_bu,',
'                           SUM (PS_EMP_NEW) AS PS_EMP_NEW,',
'                           SUM (PS_EMP_OLD) AS PS_EMP_OLD,',
'                           SUM (ps_emp_old_bef) ps_emp_old_bef,',
'                           pcp_year,',
'                           pcp_period,',
'                           pcp_start_date,',
'                           pcp_end_date,',
'                           pcp_long_desc,',
'                           pcp_short_desc',
'                      FROM (  SELECT emp_bu,',
'                                     COUNT (*) ps_emp_new,',
'                                     0 ps_emp_old,',
'                                     0 ps_emp_old_bef,',
'                                     empai_plnt AS ps_emp_plnt_id,',
'                                     (SELECT bup_name1',
'                                        FROM bus_unit_plants',
'                                       WHERE bup_bu = empai_bu',
'                                             AND bup_plant_id = empai_plnt)',
'                                        ps_emp_unit_cent,',
'                                     fp_year AS pcp_year,',
'                                     fp_period AS pcp_period,',
'                                     fp_from_date AS pcp_start_date,',
'                                     fp_short_desc AS pcp_short_desc,',
'                                     fp_long_desc AS pcp_long_desc,',
'                                     fp_end_date AS pcp_end_date',
'                                FROM employees, emp_active_infos, fin_periods',
'                               WHERE     emp_bu = :global_bu',
'                                     AND empai_bu = emp_bu',
'                                     AND empai_emp_id = emp_emp_id',
'                                     AND emp_emp_id NOT LIKE (''ERP%'')',
'                                     AND fp_bu = emp_bu',
'                                     AND ( (         /*emp_status = ''A'' AND */',
'                                            TRUNC (',
'                                               emp_start_date) BETWEEN fp_from_date',
'                                                                   AND fp_end_date))',
'                                      AND (:p950100006022_unit_loc IS NULL OR (instr (:p950100006022_unit_loc || '':'', empai_loc_id || '':'') > 0) )',
'                                      AND ((instr (:p950100006022_PERIOD || '':'', fp_short_desc || '':'') > 0) OR :p950100006022_PERIOD IS NULL)   ',
'                                      AND ((instr (:p950100006022_YEAR  || '':'', fp_year || '':'') > 0) OR :p950100006022_YEAR IS NULL) ',
'                            GROUP BY emp_bu,',
'                                     emp_status,',
'                                     empai_plnt,',
'                                     empai_bu,',
'                                     fp_year,',
'                                     fp_period,',
'                                     fp_from_date,',
'                                     fp_short_desc,',
'                                     fp_long_desc,',
'                                     fp_end_date',
'                            UNION ALL',
'                              SELECT emp_bu,',
'                                     CASE',
'                                        WHEN emp_status = ''A'' THEN COUNT (*)',
'                                        ELSE 0',
'                                     END',
'                                        ps_emp_new,',
'                                     CASE',
'                                        WHEN emp_status <> ''A'' THEN COUNT (*)',
'                                        ELSE 0',
'                                     END',
'                                        ps_emp_old,',
'                                     0 ps_emp_old_bef,',
'                                     empai_plnt AS ps_emp_plnt_id,',
'                                     (SELECT bup_name1',
'                                        FROM bus_unit_plants',
'                                       WHERE bup_bu = empai_bu',
'                                             AND bup_plant_id = empai_plnt)',
'                                        ps_emp_unit_cent,',
'                                     fp_year AS pcp_year,',
'                                     fp_period AS pcp_period,',
'                                     fp_from_date AS pcp_start_date,',
'                                     fp_short_desc AS pcp_short_desc,',
'                                     fp_long_desc AS pcp_long_desc,',
'                                     fp_end_date AS pcp_end_date',
'                                FROM employees, emp_active_infos, fin_periods',
'                               WHERE     emp_bu = :global_bu',
'                                     AND empai_bu = emp_bu',
'                                     AND empai_emp_id = emp_emp_id',
'                                     AND emp_emp_id NOT LIKE (''ERP%'')',
'                                     AND emp_status IN (''A'', ''T'', ''R'')',
'                                     AND fp_bu = emp_bu',
'                                     AND ( (emp_status IN (''T'', ''R'')',
'                                            AND TRUNC (emp_end_date) BETWEEN fp_from_date',
'                                                                         AND fp_end_date))',
'                                       AND (:p950100006022_unit_loc IS NULL OR (instr (:p950100006022_unit_loc || '':'', empai_loc_id || '':'') > 0) )',
'                                      AND ((instr (:p950100006022_PERIOD || '':'', fp_short_desc || '':'') > 0) OR :p950100006022_PERIOD IS NULL)   ',
'                                      AND ((instr (:p950100006022_YEAR  || '':'', fp_year || '':'') > 0) OR :p950100006022_YEAR IS NULL)',
'                            GROUP BY emp_bu,',
'                                     emp_status,',
'                                     empai_plnt,',
'                                     empai_bu,',
'                                     fp_year,',
'                                     fp_period,',
'                                     fp_from_date,',
'                                     fp_short_desc,',
'                                     fp_long_desc,',
'                                     fp_end_date',
'                            UNION ALL',
'                              SELECT emp_bu,',
'                                     0 ps_emp_new,',
'                                     0 ps_emp_old,',
'                                     CASE',
'                                        WHEN emp_status <> ''A'' THEN COUNT (*)',
'                                        ELSE 0',
'                                     END',
'                                        ps_emp_old_bef,',
'                                     empai_plnt AS ps_emp_plnt_id,',
'                                     (SELECT bup_name1',
'                                        FROM bus_unit_plants',
'                                       WHERE bup_bu = empai_bu',
'                                             AND bup_plant_id = empai_plnt)',
'                                        ps_emp_unit_cent,',
'                                     fp_year AS pcp_year,',
'                                     fp_period AS pcp_period,',
'                                     fp_from_date AS pcp_start_date,',
'                                     fp_short_desc AS pcp_short_desc,',
'                                     fp_long_desc AS pcp_long_desc,',
'                                     fp_end_date AS pcp_end_date',
'                                FROM employees, emp_active_infos, fin_periods',
'                               WHERE     emp_bu = :global_bu',
'                                     AND empai_bu = emp_bu',
'                                     AND empai_emp_id = emp_emp_id',
'                                     AND emp_emp_id NOT LIKE (''ERP%'')',
'                                     AND emp_status IN (''A'', ''T'', ''R'')',
'                                     AND fp_bu = emp_bu',
'                                     AND ( (emp_status IN (''T'', ''R'')',
'                                            AND TRUNC (emp_end_date) < fp_from_date))',
'                                     AND (:p950100006022_unit_loc IS NULL OR (instr (:p950100006022_unit_loc || '':'', empai_loc_id || '':'') > 0) )',
'                                      AND ((instr (:p950100006022_PERIOD || '':'', fp_short_desc || '':'') > 0) OR :p950100006022_PERIOD IS NULL)   ',
'                                      AND ((instr (:p950100006022_YEAR  || '':'', fp_year || '':'') > 0) OR :p950100006022_YEAR IS NULL)',
'                            GROUP BY emp_bu,',
'                                     emp_status,',
'                                     empai_plnt,',
'                                     empai_bu,',
'                                     fp_year,',
'                                     fp_period,',
'                                     fp_from_date,',
'                                     fp_short_desc,',
'                                     fp_long_desc,',
'                                     fp_end_date)',
'                  GROUP BY emp_bu,',
'                           pcp_year,',
'                           pcp_period,',
'                           pcp_start_date,',
'                           pcp_end_date,',
'                           pcp_short_desc,',
'                           pcp_long_desc))',
'ORDER BY pcp_period)',
''))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_PERIOD,P950100006022_YEAR'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(77760404339222550)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'0'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190465311614781359)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190465742931781361)
,p_query_column_id=>2
,p_column_alias=>'VALUE'
,p_column_display_sequence=>40
,p_column_heading=>'Value'
,p_column_format=>'&GLOBAL_FMT_MASK.'
,p_column_link=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.::P95010000610_TYPE,P95010000610_REGION_NAME,P95010000610_PERIOD,P95010000610_GROUP:ATR,Attrition Rate %,,&P950100006022_GROUP.'
,p_column_linktext=>'#VALUE#'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(33441224285037083456)
,p_plug_name=>'% Attrition Rate'
,p_static_id=>'attrition-rate-2'
,p_region_name=>'H'
,p_parent_plug_id=>wwv_flow_imp.id(33441224596812083459)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--hiddenOverflow:margin-top-sm:margin-bottom-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(6190466571567781361)
,p_region_id=>wwv_flow_imp.id(33441224285037083456)
,p_chart_type=>'bar'
,p_height=>'220'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_fill_multi_series_gaps=>false
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'Attrition Rate Not Found.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(6190468217362781362)
,p_chart_id=>wwv_flow_imp.id(6190466571567781361)
,p_static_id=>'attrition-rate'
,p_seq=>10
,p_name=>'% Attrition Rate'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUM(total_att_rate) total_att_rate,pcp_period,pcp_year,',
'       INITCAP(period) period FROM(',
'  SELECT emp_bu,',
'         ps_emp_new,',
'         ps_emp_old,',
'         pcp_year,',
'         pcp_period,',
'         pcp_start_date,',
'         pcp_long_desc,',
'         pcp_short_desc period,',
'         (total_opn_bal - ps_emp_old_bef) total_opn_bal,',
'         ( (total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new) cl_bal,',
'          NVL(ROUND( (ps_emp_old / NULLIF((((total_opn_bal - ps_emp_old_bef)  + ( (total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new))/2), 0))*100,2), 0) totaL_att_rate',
'    FROM (SELECT emp_bu,',
'                 ps_emp_new,',
'                 ps_emp_old,',
'                 pcp_year,',
'                 pcp_period,',
'                 pcp_start_date,',
'                 ps_emp_old_bef,',
'                 pcp_long_desc,',
'                 pcp_short_desc,',
'                 ( (SELECT COUNT (*)',
'                      FROM employees, emp_active_infos',
'                     WHERE     emp_bu = empai_bu',
'                           AND emp_emp_id = empai_emp_id',
'                           AND emp_bu = :global_bu',
'                           AND TRUNC (emp_start_date) < pcp_start_date',
'                           AND emp_status <> ''E'' ))',
'                    total_opn_bal',
'            FROM (  SELECT emp_bu,',
'                           SUM (PS_EMP_NEW) AS PS_EMP_NEW,',
'                           SUM (PS_EMP_OLD) AS PS_EMP_OLD,',
'                           SUM (ps_emp_old_bef) ps_emp_old_bef,',
'                           pcp_year,',
'                           pcp_period,',
'                           pcp_start_date,',
'                           pcp_end_date,',
'                           pcp_long_desc,',
'                           pcp_short_desc',
'                      FROM (  SELECT emp_bu,',
'                                     COUNT (*) ps_emp_new,',
'                                     0 ps_emp_old,',
'                                     0 ps_emp_old_bef,',
'                                     empai_plnt AS ps_emp_plnt_id,',
'                                     (SELECT bup_name1',
'                                        FROM bus_unit_plants',
'                                       WHERE bup_bu = empai_bu',
'                                             AND bup_plant_id = empai_plnt)',
'                                        ps_emp_unit_cent,',
'                                     fp_year AS pcp_year,',
'                                     fp_period AS pcp_period,',
'                                     fp_from_date AS pcp_start_date,',
'                                     fp_short_desc AS pcp_short_desc,',
'                                     fp_long_desc AS pcp_long_desc,',
'                                     fp_end_date AS pcp_end_date',
'                                FROM employees, emp_active_infos, fin_periods',
'                               WHERE     emp_bu = :global_bu',
'                                     AND empai_bu = emp_bu',
'                                     AND empai_emp_id = emp_emp_id',
'                                     AND emp_emp_id NOT LIKE (''ERP%'')',
'                                     AND fp_bu = emp_bu',
'                                     AND ( (         /*emp_status = ''A'' AND */',
'                                            TRUNC (',
'                                               emp_start_date) BETWEEN fp_from_date',
'                                                                   AND fp_end_date))',
'                                      AND (:p950100006022_unit_loc IS NULL OR (instr (:p950100006022_unit_loc || '':'', empai_loc_id || '':'') > 0) )',
'                                      AND ((instr (:p950100006022_PERIOD || '':'', fp_short_desc || '':'') > 0) OR :p950100006022_PERIOD IS NULL)   ',
'                                      AND ((instr (:p950100006022_YEAR  || '':'', fp_year || '':'') > 0) OR :p950100006022_YEAR IS NULL) ',
'                                      AND ((instr (:P950100006022_GROUP || '':'', emp_group_id || '':'') > 0) OR :P950100006022_GROUP IS NULL ) ',
'                            GROUP BY emp_bu,',
'                                     emp_status,',
'                                     empai_plnt,',
'                                     empai_bu,',
'                                     fp_year,',
'                                     fp_period,',
'                                     fp_from_date,',
'                                     fp_short_desc,',
'                                     fp_long_desc,',
'                                     fp_end_date',
'                            UNION ALL',
'                              SELECT emp_bu,',
'                                     CASE',
'                                        WHEN emp_status = ''A'' THEN COUNT (*)',
'                                        ELSE 0',
'                                     END',
'                                        ps_emp_new,',
'                                     CASE',
'                                        WHEN emp_status <> ''A'' THEN COUNT (*)',
'                                        ELSE 0',
'                                     END',
'                                        ps_emp_old,',
'                                     0 ps_emp_old_bef,',
'                                     empai_plnt AS ps_emp_plnt_id,',
'                                     (SELECT bup_name1',
'                                        FROM bus_unit_plants',
'                                       WHERE bup_bu = empai_bu',
'                                             AND bup_plant_id = empai_plnt)',
'                                        ps_emp_unit_cent,',
'                                     fp_year AS pcp_year,',
'                                     fp_period AS pcp_period,',
'                                     fp_from_date AS pcp_start_date,',
'                                     fp_short_desc AS pcp_short_desc,',
'                                     fp_long_desc AS pcp_long_desc,',
'                                     fp_end_date AS pcp_end_date',
'                                FROM employees, emp_active_infos, fin_periods',
'                               WHERE     emp_bu = :global_bu',
'                                     AND empai_bu = emp_bu',
'                                     AND empai_emp_id = emp_emp_id',
'                                     AND emp_emp_id NOT LIKE (''ERP%'')',
'                                     AND emp_status IN (''A'', ''T'', ''R'')',
'                                     AND fp_bu = emp_bu',
'                                     AND ( (emp_status IN (''T'', ''R'')',
'                                            AND TRUNC (emp_end_date) BETWEEN fp_from_date',
'                                                                         AND fp_end_date))',
'                                       AND (:p950100006022_unit_loc IS NULL OR (instr (:p950100006022_unit_loc || '':'', empai_loc_id || '':'') > 0) )',
'                                      AND ((instr (:p950100006022_PERIOD || '':'', fp_short_desc || '':'') > 0) OR :p950100006022_PERIOD IS NULL)   ',
'                                      AND ((instr (:p950100006022_YEAR  || '':'', fp_year || '':'') > 0) OR :p950100006022_YEAR IS NULL)',
'                                      AND ((instr (:P950100006022_GROUP || '':'', emp_group_id || '':'') > 0) OR :P950100006022_GROUP IS NULL ) ',
'                            GROUP BY emp_bu,',
'                                     emp_status,',
'                                     empai_plnt,',
'                                     empai_bu,',
'                                     fp_year,',
'                                     fp_period,',
'                                     fp_from_date,',
'                                     fp_short_desc,',
'                                     fp_long_desc,',
'                                     fp_end_date',
'                            UNION ALL',
'                              SELECT emp_bu,',
'                                     0 ps_emp_new,',
'                                     0 ps_emp_old,',
'                                     CASE',
'                                        WHEN emp_status <> ''A'' THEN COUNT (*)',
'                                        ELSE 0',
'                                     END',
'                                        ps_emp_old_bef,',
'                                     empai_plnt AS ps_emp_plnt_id,',
'                                     (SELECT bup_name1',
'                                        FROM bus_unit_plants',
'                                       WHERE bup_bu = empai_bu',
'                                             AND bup_plant_id = empai_plnt)',
'                                        ps_emp_unit_cent,',
'                                     fp_year AS pcp_year,',
'                                     fp_period AS pcp_period,',
'                                     fp_from_date AS pcp_start_date,',
'                                     fp_short_desc AS pcp_short_desc,',
'                                     fp_long_desc AS pcp_long_desc,',
'                                     fp_end_date AS pcp_end_date',
'                                FROM employees, emp_active_infos, fin_periods',
'                               WHERE     emp_bu = :global_bu',
'                                     AND empai_bu = emp_bu',
'                                     AND empai_emp_id = emp_emp_id',
'                                     AND emp_emp_id NOT LIKE (''ERP%'')',
'                                     AND emp_status IN (''A'', ''T'', ''R'')',
'                                     AND fp_bu = emp_bu',
'                                     AND ( (emp_status IN (''T'', ''R'')',
'                                            AND TRUNC (emp_end_date) < fp_from_date))',
'                                     AND (:p950100006022_unit_loc IS NULL OR (instr (:p950100006022_unit_loc || '':'', empai_loc_id || '':'') > 0) )',
'                                      AND ((instr (:p950100006022_PERIOD || '':'', fp_short_desc || '':'') > 0) OR :p950100006022_PERIOD IS NULL)   ',
'                                      AND ((instr (:p950100006022_YEAR  || '':'', fp_year || '':'') > 0) OR :p950100006022_YEAR IS NULL)',
'                                      AND ((instr (:P950100006022_GROUP || '':'', emp_group_id || '':'') > 0) OR :P950100006022_GROUP IS NULL ) ',
'                            GROUP BY emp_bu,',
'                                     emp_status,',
'                                     empai_plnt,',
'                                     empai_bu,',
'                                     fp_year,',
'                                     fp_period,',
'                                     fp_from_date,',
'                                     fp_short_desc,',
'                                     fp_long_desc,',
'                                     fp_end_date)',
'                  GROUP BY emp_bu,',
'                           pcp_year,',
'                           pcp_period,',
'                           pcp_start_date,',
'                           pcp_end_date,',
'                           pcp_short_desc,',
'                           pcp_long_desc))',
'ORDER BY pcp_period)',
'GROUP BY period, ',
'         pcp_period,',
'         pcp_year',
'         ORDER BY pcp_period',
''))
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_PERIOD,P950100006022_YEAR,P950100006022_GROUP'
,p_series_type=>'bar'
,p_series_name_column_name=>'PCP_YEAR'
,p_items_value_column_name=>'TOTAL_ATT_RATE'
,p_items_label_column_name=>'PERIOD'
,p_color=>'#ea8fa0'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.:RP,:P95010000610_TYPE,P95010000610_REGION_NAME,P95010000610_PERIOD:ATR,Attrition Rate %,&PERIOD.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(6190467645397781361)
,p_chart_id=>wwv_flow_imp.id(6190466571567781361)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title_font_size=>'10'
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
 p_id=>wwv_flow_imp.id(6190467079804781361)
,p_chart_id=>wwv_flow_imp.id(6190466571567781361)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'off'
,p_title_font_size=>'10'
,p_format_type=>'currency'
,p_numeric_pattern=>'&GLOBAL_CHART_FMT_MASK.'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(33443303815194903854)
,p_name=>'Average Age'
,p_static_id=>'average-age'
,p_region_name=>'AV'
,p_parent_plug_id=>wwv_flow_imp.id(13633272223555794537)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>100
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--hiddenOverflow:margin-top-none:margin-left-sm:margin-right-sm'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--float:t-Cards--animColorFill'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Average Age'' AS NAME,',
'         TO_CHAR(ROUND(NVL(AVG(TRUNC(MONTHS_BETWEEN(SYSDATE, emp_dob) / 12)), 0)), ''FM990'') AS VALUE',
'    FROM employees, emp_active_infos',
'   WHERE emp_bu = empai_bu',
'     AND emp_emp_id = empai_emp_id',
'     AND emp_bu = :GLOBAL_BU',
'     AND emp_status = ''A''',
'     AND emp_include_payroll = ''Y''',
'     AND emp_dob IS NOT NULL',
'     AND (:p950100006022_unit_loc IS NULL OR INSTR('':'' || :p950100006022_unit_loc || '':'', '':'' || empai_loc_id || '':'') > 0)',
'     AND (:P950100006022_GROUP IS NULL OR INSTR('':'' || :P950100006022_GROUP || '':'', '':'' || emp_group_id || '':'') > 0)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_PERIOD,P950100006022_YEAR,P950100006022_GROUP'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(77760404339222550)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'0'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190461415226781356)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>10
,p_column_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190461878015781356)
,p_query_column_id=>2
,p_column_alias=>'VALUE'
,p_column_display_sequence=>20
,p_column_heading=>'Value'
,p_column_link=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.::P95010000610_TYPE,P95010000610_REGION_NAME,P95010000610_AGE_VALUE,P95010000610_GROUP:AVG,Average Age,,&P950100006022_GROUP.'
,p_column_linktext=>'#VALUE#'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(33443303566820903852)
,p_plug_name=>'Average Age'
,p_static_id=>'average-age-2'
,p_region_name=>'E'
,p_parent_plug_id=>wwv_flow_imp.id(33443303815194903854)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--accent12:t-Region--textContent:t-Region--hiddenOverflow:margin-top-sm:margin-bottom-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(6190462641687781356)
,p_region_id=>wwv_flow_imp.id(33443303566820903852)
,p_chart_type=>'bar'
,p_height=>'220'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_fill_multi_series_gaps=>false
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'Average Age Details Not Found.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(6190464284060781358)
,p_chart_id=>wwv_flow_imp.id(6190462641687781356)
,p_static_id=>'average-age'
,p_seq=>10
,p_name=>'Average Age'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH emp_ages AS (',
'    SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, emp_dob) / 12) AS age',
'      FROM employees, emp_active_infos',
'     WHERE emp_bu = empai_bu',
'       AND emp_emp_id = empai_emp_id',
'       AND emp_bu = :GLOBAL_BU',
'       AND emp_status = ''A''',
'       AND emp_include_payroll = ''Y''',
'       AND emp_dob IS NOT NULL',
'       AND (:p950100006022_unit_loc IS NULL OR INSTR('':'' || :p950100006022_unit_loc || '':'', '':'' || empai_loc_id || '':'') > 0)',
'       AND (:P950100006022_GROUP IS NULL OR INSTR('':'' || :P950100006022_GROUP || '':'', '':'' || emp_group_id || '':'') > 0)',
')',
'SELECT COUNT(CASE WHEN age BETWEEN 18 AND 30 THEN 1 END) AS values_1, ''18-30'' AS v_name FROM emp_ages',
'UNION ALL',
'SELECT COUNT(CASE WHEN age BETWEEN 31 AND 40 THEN 1 END) AS values_1, ''31-40'' AS v_name FROM emp_ages',
'UNION ALL',
'SELECT COUNT(CASE WHEN age BETWEEN 41 AND 50 THEN 1 END) AS values_1, ''41-50'' AS v_name FROM emp_ages',
'UNION ALL',
'SELECT COUNT(CASE WHEN age > 50 THEN 1 END) AS values_1, ''50+'' AS v_name FROM emp_ages'))
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_PERIOD,P950100006022_YEAR,P950100006022_GROUP'
,p_series_type=>'bar'
,p_items_value_column_name=>'VALUES_1'
,p_items_label_column_name=>'V_NAME'
,p_color=>'#ea96f5'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.:RP,:P95010000610_TYPE,P95010000610_REGION_NAME,P95010000610_AGE_VALUE:AVG,Average Age,&V_NAME.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(6190463109424781356)
,p_chart_id=>wwv_flow_imp.id(6190462641687781356)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title_font_size=>'10'
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
 p_id=>wwv_flow_imp.id(6190463704767781358)
,p_chart_id=>wwv_flow_imp.id(6190462641687781356)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title_font_size=>'10'
,p_format_type=>'currency'
,p_numeric_pattern=>'&GLOBAL_CHART_FMT_MASK.'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38119315848320993882)
,p_plug_name=>'Average CTC'
,p_static_id=>'average-ctc'
,p_region_name=>'C'
,p_parent_plug_id=>wwv_flow_imp.id(20264007521518763913)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--accent1:t-Region--textContent:t-Region--hiddenOverflow:margin-top-sm:margin-bottom-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Average CTC'' AS NAME,',
'       ROUND(NVL(AVG(total_ctc), 0)) AS VALUE',
'  FROM (',
'    SELECT (SELECT NVL(SUM(epa_per_amt), 0)',
'              FROM emp_pyrl_allowances',
'             WHERE epa_bu = empai_bu AND epa_emp_id = empai_emp_id) AS total_ctc',
'      FROM employees, emp_active_infos',
'     WHERE emp_bu = empai_bu',
'       AND emp_emp_id = empai_emp_id',
'       AND emp_bu = :global_bu',
'       AND emp_status = ''A''',
'       AND emp_include_payroll = ''Y''',
'       AND (:P950100006022_UNIT_LOC IS NULL OR INSTR('':'' || :P950100006022_UNIT_LOC || '':'', '':'' || empai_loc_id || '':'') > 0)',
'       AND (:P950100006022_GROUP IS NULL OR INSTR('':'' || :P950100006022_GROUP || '':'', '':'' || emp_group_id || '':'') > 0)',
'  )'))
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(6190442522687781341)
,p_region_id=>wwv_flow_imp.id(38119315848320993882)
,p_chart_type=>'donut'
,p_height=>'220'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_legend_font_size=>'10'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_no_data_found_message=>'Average CTC Not Found.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(6190442994588781341)
,p_chart_id=>wwv_flow_imp.id(6190442522687781341)
,p_static_id=>'average-ctc'
,p_seq=>10
,p_name=>'Average CTC'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    dept_name AS "Department Name",',
'    dept_id AS "Department ID",',
'    ROUND(SUM(total_ctc) / NULLIF(COUNT(DISTINCT empai_emp_id), 0), 2) AS "Average CTC"',
'FROM (',
'    SELECT ',
'        ei.empai_emp_id,',
'        ei.empai_dept_id AS dept_id,',
'        (SELECT dept_name1 ',
'           FROM departments ',
'          WHERE dept_bu = ei.empai_bu AND dept_id = ei.empai_dept_id) AS dept_name,',
'        (SELECT NVL(SUM(epa_per_amt), 0) ',
'           FROM emp_pyrl_allowances ',
'          WHERE epa_bu = ei.empai_bu ',
'            AND epa_emp_id = ei.empai_emp_id) AS total_ctc',
'    FROM ',
'        employees e',
'        JOIN emp_active_infos ei ON e.emp_bu = ei.empai_bu AND e.emp_emp_id = ei.empai_emp_id',
'    WHERE ',
'        e.emp_bu = :global_bu',
'        AND e.emp_status = ''A''',
'        AND e.emp_include_payroll = ''Y''',
'        AND (ei.empai_dept_id = :P950100006022_DEPT_ID OR :P950100006022_DEPT_ID IS NULL)',
'        AND (:P950100006022_UNIT_LOC IS NULL OR INSTR('':'' || :P950100006022_UNIT_LOC || '':'', '':'' || ei.empai_loc_id || '':'') > 0)',
'        AND (:P950100006022_GROUP IS NULL OR INSTR('':'' || :P950100006022_GROUP || '':'', '':'' || e.emp_group_id || '':'') > 0)',
')',
'GROUP BY dept_name, dept_id'))
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_YEAR,P950100006022_PERIOD,P950100006022_GROUP'
,p_series_type=>'donut'
,p_items_value_column_name=>'Average CTC'
,p_items_label_column_name=>'Department Name'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
,p_items_label_font_size=>'10'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.:RP,:P95010000610_REGION_NAME,P95010000610_TYPE,P95010000610_CTC_DEPT_ID,P95010000610_GROUP:Average CTC,ACTC,&"Department ID".,&P950100006022_GROUP.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(13425033114916947380)
,p_name=>'Avg.  Service Period'
,p_static_id=>'avg-service-period'
,p_region_name=>'AVGSP'
,p_parent_plug_id=>wwv_flow_imp.id(13633272223555794537)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>130
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--hiddenOverflow:margin-top-none:margin-left-sm:margin-right-sm'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--float:t-Cards--animColorFill'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Avg. Service Period'' AS NAME,',
'         TO_CHAR(ROUND(NVL(AVG(TRUNC(MONTHS_BETWEEN(SYSDATE, emp_start_date) / 12)), 0)), ''FM990'') AS VALUE',
'    FROM employees, emp_active_infos',
'   WHERE emp_bu = empai_bu',
'     AND emp_emp_id = empai_emp_id',
'     AND emp_bu = :GLOBAL_BU',
'     AND emp_status = ''A''',
'     AND emp_include_payroll = ''Y''',
'     AND emp_start_date IS NOT NULL',
'     AND (:p950100006022_unit_loc IS NULL OR INSTR('':'' || :p950100006022_unit_loc || '':'', '':'' || empai_loc_id || '':'') > 0)',
'     AND (:P950100006022_GROUP IS NULL OR INSTR('':'' || :P950100006022_GROUP || '':'', '':'' || emp_group_id || '':'') > 0)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_YEAR,P950100006022_PERIOD,P950100006022_GROUP'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(77760404339222550)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'0'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190469202133781364)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190469669912781364)
,p_query_column_id=>2
,p_column_alias=>'VALUE'
,p_column_display_sequence=>40
,p_column_heading=>'Value'
,p_column_format=>'&GLOBAL_FMT_MASK.'
,p_column_link=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.::P95010000610_TYPE,P95010000610_REGION_NAME,P95010000610_GROUP:AVGSP,Avg. Service Period,&P950100006022_GROUP.'
,p_column_linktext=>'#VALUE#'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13425033721441947386)
,p_plug_name=>'Avg. Service Period'
,p_static_id=>'avg-service-period-2'
,p_region_name=>'I'
,p_parent_plug_id=>wwv_flow_imp.id(13425033114916947380)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--accent12:t-Region--textContent:t-Region--hiddenOverflow:margin-top-sm:margin-bottom-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>120
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(6190470396642781366)
,p_region_id=>wwv_flow_imp.id(13425033721441947386)
,p_chart_type=>'bar'
,p_height=>'220'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'horizontal'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_fill_multi_series_gaps=>false
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'Total Breakdown Details Not Found.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(6190472111765781366)
,p_chart_id=>wwv_flow_imp.id(6190470396642781366)
,p_static_id=>'avg-service-period'
,p_js_static_id=>'AVGSP'
,p_seq=>10
,p_name=>'Avg. Service Period'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH emp_service AS (',
'    SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, emp_start_date) / 12) AS service_yrs',
'      FROM employees, emp_active_infos',
'     WHERE emp_bu = empai_bu',
'       AND emp_emp_id = empai_emp_id',
'       AND emp_bu = :GLOBAL_BU',
'       AND emp_status = ''A''',
'       AND emp_include_payroll = ''Y''',
'       AND emp_start_date IS NOT NULL',
'       AND (:P950100006022_UNIT_LOC IS NULL OR INSTR('':'' || :P950100006022_UNIT_LOC || '':'', '':'' || empai_loc_id || '':'') > 0)',
'       AND (:P950100006022_GROUP IS NULL OR INSTR('':'' || :P950100006022_GROUP || '':'', '':'' || emp_group_id || '':'') > 0)',
')',
'SELECT COUNT(CASE WHEN service_yrs BETWEEN 0 AND 10 THEN 1 END) AS values_1, ''0-10'' AS v_name FROM emp_service',
'UNION ALL',
'SELECT COUNT(CASE WHEN service_yrs BETWEEN 11 AND 20 THEN 1 END) AS values_1, ''11-20'' AS v_name FROM emp_service',
'UNION ALL',
'SELECT COUNT(CASE WHEN service_yrs BETWEEN 21 AND 30 THEN 1 END) AS values_1, ''21-30'' AS v_name FROM emp_service',
'UNION ALL',
'SELECT COUNT(CASE WHEN service_yrs > 30 THEN 1 END) AS values_1, ''31+'' AS v_name FROM emp_service'))
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_YEAR,P950100006022_PERIOD,P950100006022_GROUP'
,p_series_type=>'bar'
,p_items_value_column_name=>'VALUES_1'
,p_items_label_column_name=>'V_NAME'
,p_color=>'#9fdee8'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.:RP,:P95010000610_TYPE,P95010000610_V_NAME,P95010000610_REGION_NAME,P95010000610_GROUP:AVGSP,&V_NAME.,Avg. Service Period,&P950100006022_GROUP.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(6190471521226781366)
,p_chart_id=>wwv_flow_imp.id(6190470396642781366)
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
 p_id=>wwv_flow_imp.id(6190470977580781366)
,p_chart_id=>wwv_flow_imp.id(6190470396642781366)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'currency'
,p_numeric_pattern=>'&GLOBAL_CHART_FMT_MASK.'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(20264007521518763913)
,p_name=>'% Average CTC'
,p_static_id=>'b-font-size-2-average-ctc-font-b'
,p_title=>'Average CTC'
,p_region_name=>'ACTC'
,p_parent_plug_id=>wwv_flow_imp.id(13633272223555794537)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>60
,p_region_css_classes=>'schedule'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--accent1:t-Region--noUI:t-Region--hiddenOverflow:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--float:t-Cards--animColorFill'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Average CTC'' AS NAME,',
'         TO_CHAR(ROUND(NVL(AVG(total_ctc), 0)), ''FM999,999,999,990'') AS VALUE',
'    FROM (',
'      SELECT (SELECT NVL(SUM(epa_per_amt), 0)',
'                FROM emp_pyrl_allowances',
'               WHERE epa_bu = empai_bu AND epa_emp_id = empai_emp_id) AS total_ctc',
'        FROM employees, emp_active_infos',
'       WHERE emp_bu = empai_bu',
'         AND emp_emp_id = empai_emp_id',
'         AND emp_bu = :global_bu',
'         AND emp_status = ''A''',
'         AND emp_include_payroll = ''Y''',
'         AND (:P950100006022_UNIT_LOC IS NULL OR INSTR('':'' || :P950100006022_UNIT_LOC || '':'', '':'' || empai_loc_id || '':'') > 0)',
'         AND (:P950100006022_GROUP IS NULL OR INSTR('':'' || :P950100006022_GROUP || '':'', '':'' || emp_group_id || '':'') > 0)',
'    )'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_YEAR,P950100006022_PERIOD,P950100006022_GROUP'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(77760404339222550)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'0'
,p_query_no_data_found=>'No Data Found'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190441687270781339)
,p_query_column_id=>2
,p_column_alias=>'NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190441300037781339)
,p_query_column_id=>1
,p_column_alias=>'VALUE'
,p_column_display_sequence=>40
,p_column_heading=>'Value'
,p_column_format=>'&GLOBAL_FMT_MASK.'
,p_column_link=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.:RP,:P95010000610_TYPE,P95010000610_REGION_NAME,P95010000610_CTC_DEPT_ID,P95010000610_GROUP:ACTC,Average CTC,,&P950100006022_GROUP.'
,p_column_linktext=>'#VALUE#'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(13441636375339832037)
,p_name=>'Gender'
,p_static_id=>'gender'
,p_region_name=>'F'
,p_parent_plug_id=>wwv_flow_imp.id(13633272223555794537)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>110
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--hiddenOverflow:margin-top-none'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--float:t-Cards--animColorFill'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Gender'' AS NAME,',
'         TO_CHAR(COUNT(emp_emp_id), ''FM999,999,990'') AS VALUE',
'    FROM employees, ',
'         emp_active_infos',
'   WHERE emp_bu = empai_bu',
'     AND emp_emp_id = empai_emp_id',
'     AND emp_bu = :global_bu',
'     AND emp_status = ''A''',
'     AND emp_include_payroll = ''Y''',
'     AND (:P950100006022_unit_loc IS NULL OR INSTR('':'' || :P950100006022_unit_loc || '':'', '':'' || empai_loc_id || '':'') > 0)',
'     AND (:P950100006022_GENDER IS NULL OR INSTR('':'' || :P950100006022_GENDER || '':'', '':'' || emp_gender || '':'') > 0)',
'     AND (:P950100006022_GROUP IS NULL OR INSTR('':'' || :P950100006022_GROUP || '':'', '':'' || emp_group_id || '':'') > 0)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_PERIOD,P950100006022_YEAR,P950100006022_GROUP'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(77760404339222550)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'0'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190437810365781336)
,p_query_column_id=>2
,p_column_alias=>'NAME'
,p_column_display_sequence=>50
,p_column_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190437482059781336)
,p_query_column_id=>1
,p_column_alias=>'VALUE'
,p_column_display_sequence=>40
,p_column_heading=>'Value'
,p_column_format=>'&GLOBAL_FMT_MASK.'
,p_column_link=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.::P95010000610_REGION_NAME,P95010000610_TYPE,P95010000610_GROUP:Employee Gender,MF,&P950100006022_GROUP.#GENDER1#'
,p_column_linktext=>'#VALUE#'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13441636671501832040)
,p_plug_name=>'Gender'
,p_static_id=>'gender-2'
,p_region_name=>'G'
,p_parent_plug_id=>wwv_flow_imp.id(13441636375339832037)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--accent12:t-Region--textContent:t-Region--hiddenOverflow:margin-top-sm:margin-bottom-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(6190438635415781337)
,p_region_id=>wwv_flow_imp.id(13441636671501832040)
,p_chart_type=>'bar'
,p_height=>'220'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_fill_multi_series_gaps=>false
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'Average Age Details Not Found.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(6190440363190781337)
,p_chart_id=>wwv_flow_imp.id(6190438635415781337)
,p_static_id=>'gender'
,p_seq=>10
,p_name=>'Gender'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT count(emp_emp_id) Value,',
'       emp_gender,',
'       Decode(emp_gender,''M'',''Male'',''F'',''Female'') Gender',
'  FROM employees, ',
'       emp_active_infos',
' WHERE emp_bu = empai_bu',
'   AND emp_emp_id = empai_emp_id',
'   AND emp_bu = :global_bu',
'   AND emp_status = ''A''',
'   AND emp_include_payroll = ''Y''',
'   AND (:P950100006022_UNIT_LOC IS NULL OR INSTR('':'' || :P950100006022_UNIT_LOC || '':'', '':'' || empai_loc_id || '':'') > 0)',
'   AND (:P950100006022_GENDER IS NULL OR INSTR('':'' || :P950100006022_GENDER || '':'', '':'' || emp_gender || '':'') > 0)',
'   AND (:P950100006022_GROUP IS NULL OR INSTR('':'' || :P950100006022_GROUP || '':'', '':'' || emp_group_id || '':'') > 0)',
' GROUP BY emp_gender'))
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_PERIOD,P950100006022_YEAR,P950100006022_GROUP'
,p_series_type=>'bar'
,p_items_value_column_name=>'VALUE'
,p_items_label_column_name=>'GENDER'
,p_color=>'#0076df'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.:RP,:P95010000610_TYPE,P95010000610_REGION_NAME,P95010000610_GENDER_1:MF,Gender,&EMP_GENDER.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(6190439707534781337)
,p_chart_id=>wwv_flow_imp.id(6190438635415781337)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title_font_size=>'10'
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
 p_id=>wwv_flow_imp.id(6190439174808781337)
,p_chart_id=>wwv_flow_imp.id(6190438635415781337)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title_font_size=>'10'
,p_format_type=>'currency'
,p_numeric_pattern=>'&GLOBAL_CHART_FMT_MASK.'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10512647617110969334)
,p_plug_name=>'Hired Vs Relieved'
,p_static_id=>'hired-vs-relieved'
,p_region_name=>'DD'
,p_parent_plug_id=>wwv_flow_imp.id(10512646624171969324)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--hiddenOverflow:margin-top-sm:margin-bottom-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(6190449180960781345)
,p_region_id=>wwv_flow_imp.id(10512647617110969334)
,p_chart_type=>'bar'
,p_height=>'220'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_fill_multi_series_gaps=>false
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'Contract Employees Hired  Vs Contract Relieved Details  Not Found.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(6190450858925781347)
,p_chart_id=>wwv_flow_imp.id(6190449180960781345)
,p_static_id=>'hired-contract'
,p_js_static_id=>'HVRR'
,p_seq=>10
,p_name=>'Hired - Contract'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   SELECT SUM (new_hier) new_hier, period,',
'              Initcap (period_desc),',
'              period_desc',
'    FROM (SELECT (CASE WHEN emp_status = ''A'' THEN emp_emp_id END) new_hier,',
'                  fp_year year,',
'                  fp_period period,',
'                  (fp_short_desc) period_desc',
'            FROM (SELECT COUNT (emp_emp_id) emp_emp_id,',
'                           emp_status,',
'                           fp_year,',
'                           fp_period,',
'                           fp_short_desc',
'                      FROM employees, ',
'                           emp_active_infos, ',
'                           fin_periods',
'                     WHERE emp_bu = empai_bu',
'                           AND emp_emp_id = empai_emp_id',
'                           AND emp_bu = :global_bu',
'                           AND emp_status = ''A''',
'						   ----AND emp_pay_basis= ''W''  --Wage Payroll',
'                           AND emp_include_payroll = ''Y''',
'                           AND fp_bu = empai_bu',
'                           AND (emp_start_date BETWEEN FP_FROM_DATE AND FP_END_DATE)',
'                           AND ((instr (:P950100006022_UNIT_LOC || '':'', empai_loc_id || '':'') > 0) or :P950100006022_UNIT_LOC is null)',
'                           AND ((instr (:P950100006022_PERIOD || '':'', fp_short_desc || '':'') > 0) OR :P950100006022_PERIOD IS NULL ) ',
'                           AND ((instr (:P950100006022_YEAR || '':'', fp_year || '':'') > 0) OR :P950100006022_YEAR IS NULL  ) ',
'                           AND ((instr (:P950100006022_GROUP || '':'', emp_group_id || '':'') > 0) OR :P950100006022_GROUP IS NULL )                                               ',
'                  GROUP BY emp_status, fp_year, fp_period,fp_short_desc)',
'  UNION ALL',
'          SELECT 0 new_hier,',
'                 fp_year year,',
'                 fp_period period,',
'                 fp_short_desc period_desc',
'            FROM fin_periods',
'           WHERE fp_bu = :global_bu ',
'             AND ((instr (:P950100006022_PERIOD || '':'', fp_short_desc || '':'') > 0) OR :P950100006022_PERIOD IS NULL)   ',
'             AND ((instr (:P950100006022_YEAR || '':'', fp_year || '':'') > 0) OR :P950100006022_YEAR IS NULL )     ',
'             --AND ((instr (:P950100006022_GROUP || '':'', emp_group_id || '':'') > 0) OR :P950100006022_GROUP IS NULL)                                     ',
'           )',
'GROUP BY  period,period_desc',
'ORDER BY period ASC  '))
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_YEAR,P950100006022_PERIOD,P950100006022_GROUP'
,p_series_type=>'bar'
,p_items_value_column_name=>'NEW_HIER'
,p_items_label_column_name=>'INITCAP(PERIOD_DESC)'
,p_color=>'#e2d088'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:950100006100:&SESSION.::&DEBUG.::P950100006100_TYPE,P950100006100_REGION_NAME,P950100006100_PERIOD:HVRR,Contract Hired Employees,&PERIOD_DESC.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(6190451420208781347)
,p_chart_id=>wwv_flow_imp.id(6190449180960781345)
,p_static_id=>'relieve-contract'
,p_js_static_id=>'RR'
,p_seq=>20
,p_name=>'Relieve - Contract'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sum(emp_resign) emp_resign,period,',
'         initcap(period_desc),',
'         period_desc',
'  from (',
'  SELECT (CASE WHEN emp_status <> ''A'' THEN emp_emp_id END) emp_resign,',
'         fp_period year,',
'         fp_period period,',
'         fp_short_desc period_desc',
'    FROM (  SELECT COUNT (emp_emp_id) emp_emp_id,',
'                   emp_status,',
'                   fp_year,',
'                   fp_period,',
'                   fp_short_desc',
'              FROM employees, emp_active_infos, fin_periods',
'             WHERE emp_bu = empai_bu',
'                   AND emp_emp_id = empai_emp_id',
'                   AND emp_bu = :global_bu',
'                   AND emp_status IN (''T'', ''R'')',
'                   AND fp_bu = empai_bu',
'                   --AND pcp_clndr_id = emp_clndr_id',
'                   AND (emp_end_date BETWEEN FP_FROM_DATE AND FP_END_DATE)',
'                   AND ((instr (:P950100006022_UNIT_LOC || '':'', empai_loc_id || '':'') > 0) or :P950100006022_UNIT_LOC is null)',
'                   AND ((instr (:P950100006022_PERIOD || '':'', fp_short_desc || '':'') > 0) OR :P950100006022_PERIOD IS NULL )',
'                --    AND ((instr (:P95010000602_PERIOD || '':'', fp_period || '':'') > 0) OR :P95010000602_PERIOD IS NULL)   ',
'                   AND ((instr (:P950100006022_YEAR || '':'', fp_year || '':'') > 0 OR :P950100006022_YEAR IS NULL)) ',
'                   AND ((instr (:P950100006022_GROUP || '':'', emp_group_id || '':'') > 0) OR :P950100006022_GROUP IS NULL)',
'          GROUP BY emp_status, fp_year, fp_period,fp_short_desc)',
' UNION ALL',
'          SELECT 0 emp_resign,',
'                 fp_year year,',
'                 fp_period period,',
'                 fp_short_desc period_desc',
'            FROM fin_periods',
'           WHERE fp_bu = :global_bu ',
'             AND ((instr (:P950100006022_PERIOD || '':'', fp_short_desc || '':'') > 0) OR :P950100006022_PERIOD IS NULL)   ',
'             AND ((instr (:P950100006022_YEAR || '':'', fp_year || '':'') > 0) OR :P950100006022_YEAR IS NULL )           ',
'             )  ',
'           group by ',
'                    period,',
'                    period_desc',
'ORDER BY period ASC',
'',
'',
'',
'/*select sum(emp_resign) emp_resign',
'  from (',
'  SELECT (CASE WHEN emp_status <> ''A'' THEN emp_emp_id END) emp_resign',
'    FROM (  SELECT COUNT (emp_emp_id) emp_emp_id,',
'                   emp_status',
'              FROM employees, emp_active_infos',
'             WHERE     emp_bu = empai_bu',
'                   AND emp_emp_id = empai_emp_id',
'                   AND emp_bu = :global_bu',
'                   AND emp_status IN (''T'', ''R'')',
'--                   AND fp_bu = empai_bu',
'                   --AND pcp_clndr_id = emp_clndr_id',
'--                   AND (emp_end_date BETWEEN FP_FROM_DATE AND FP_END_DATE)',
'                  AND ((instr (:P95010000602_UNIT_LOC || '':'', empai_loc_id || '':'') > 0) )',
'--                   AND ((instr (:P95010000602_PERIOD || '':'', fp_short_desc || '':'') > 0) OR :P95010000602_PERIOD IS NULL )',
'                --    AND ((instr (:P95010000602_PERIOD || '':'', fp_period || '':'') > 0) OR :P95010000602_PERIOD IS NULL)   ',
'--                   AND ((instr (:P95010000602_YEAR || '':'', fp_year || '':'') > 0 OR :P95010000602_YEAR IS NULL)) ',
'          GROUP BY emp_status))  */             ',
''))
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_YEAR,P950100006022_PERIOD,P950100006022_GROUP'
,p_series_type=>'bar'
,p_items_value_column_name=>'EMP_RESIGN'
,p_items_label_column_name=>'INITCAP(PERIOD_DESC)'
,p_color=>'#9fdee8'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:950100006100:&SESSION.::&DEBUG.::P950100006100_PERIOD,P950100006100_TYPE,P950100006100_REGION_NAME:&PERIOD_DESC.,RELL,Contract Relieved Employees'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(6190449637785781345)
,p_chart_id=>wwv_flow_imp.id(6190449180960781345)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title_font_size=>'10'
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
 p_id=>wwv_flow_imp.id(6190450238338781345)
,p_chart_id=>wwv_flow_imp.id(6190449180960781345)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'off'
,p_title_font_size=>'10'
,p_format_type=>'currency'
,p_decimal_places=>0
,p_numeric_pattern=>'&GLOBAL_CHART_FMT_MASK.'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(33234444829461508085)
,p_name=>'Hired VS Relieved'
,p_static_id=>'hired-vs-relieved-2'
,p_region_name=>'HVR'
,p_parent_plug_id=>wwv_flow_imp.id(13633272223555794537)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>80
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--hiddenOverflow:margin-top-none'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--float:t-Cards--animColorFill'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Hired'' LABEL1,',
'         ''Relieved'' LABEL2,',
'         ''Hired Vs Relieved'' NAME,',
'         TO_CHAR(NVL(SUM(Hired), 0), ''FM999,999,990'') Total, ',
'         TO_CHAR(NVL(SUM(Relieved), 0), ''FM999,999,990'') Average',
'    FROM (',
'      SELECT COUNT(emp_emp_id) Hired, 0 Relieved',
'        FROM employees, emp_active_infos, fin_periods',
'       WHERE emp_bu = empai_bu',
'         AND emp_emp_id = empai_emp_id',
'         AND emp_bu = :global_bu',
'         AND emp_status = ''A''',
'         AND emp_include_payroll = ''Y''',
'         AND fp_bu = empai_bu',
'         AND (emp_start_date BETWEEN fp_from_date AND fp_end_date)',
'         AND (:p950100006022_unit_loc IS NULL OR INSTR('':'' || :p950100006022_unit_loc || '':'', '':'' || empai_loc_id || '':'') > 0)',
'         AND (:P950100006022_PERIOD IS NULL OR INSTR('':'' || :P950100006022_PERIOD || '':'', '':'' || fp_short_desc || '':'') > 0)',
'         AND (:P950100006022_YEAR IS NULL OR INSTR('':'' || :P950100006022_YEAR || '':'', '':'' || fp_year || '':'') > 0)',
'         AND (:P950100006022_GROUP IS NULL OR INSTR('':'' || :P950100006022_GROUP || '':'', '':'' || emp_group_id || '':'') > 0)',
'      UNION ALL',
'      SELECT 0 Hired, COUNT(emp_emp_id) Relieved',
'        FROM employees, emp_active_infos, fin_periods',
'       WHERE emp_bu = empai_bu',
'         AND emp_emp_id = empai_emp_id',
'         AND emp_bu = :global_bu',
'         AND emp_status IN (''T'', ''R'')',
'         AND fp_bu = empai_bu',
'         AND (emp_end_date BETWEEN fp_from_date AND fp_end_date)',
'         AND (:p950100006022_unit_loc IS NULL OR INSTR('':'' || :p950100006022_unit_loc || '':'', '':'' || empai_loc_id || '':'') > 0)',
'         AND (:P950100006022_PERIOD IS NULL OR INSTR('':'' || :P950100006022_PERIOD || '':'', '':'' || fp_short_desc || '':'') > 0)',
'         AND (:P950100006022_YEAR IS NULL OR INSTR('':'' || :P950100006022_YEAR || '':'', '':'' || fp_year || '':'') > 0)',
'         AND (:P950100006022_GROUP IS NULL OR INSTR('':'' || :P950100006022_GROUP || '':'', '':'' || emp_group_id || '':'') > 0)',
'  )'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_PERIOD,P950100006022_YEAR,P950100006022_GROUP'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(77760528479222550)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'0'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190454016387781348)
,p_query_column_id=>5
,p_column_alias=>'AVERAGE'
,p_column_display_sequence=>50
,p_column_heading=>'Average'
,p_column_link=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.::P95010000610_TYPE,P95010000610_REGION_NAME,P95010000610_PERIOD,P95010000610_GROUP:REL, Relieved Employee,,&P950100006022_GROUP.'
,p_column_linktext=>'#AVERAGE#'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190452429705781348)
,p_query_column_id=>1
,p_column_alias=>'LABEL1'
,p_column_display_sequence=>10
,p_column_heading=>'Label1'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190452823122781348)
,p_query_column_id=>2
,p_column_alias=>'LABEL2'
,p_column_display_sequence=>20
,p_column_heading=>'Label2'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190453203039781348)
,p_query_column_id=>3
,p_column_alias=>'NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190453656245781348)
,p_query_column_id=>4
,p_column_alias=>'TOTAL'
,p_column_display_sequence=>40
,p_column_heading=>'Total'
,p_column_link=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.:RP,:P95010000610_TYPE,P95010000610_REGION_NAME,P95010000610_PERIOD,P95010000610_GROUP:HVR,Hired Employees,,&P950100006022_GROUP.'
,p_column_linktext=>'#TOTAL#'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(33234444541539508082)
,p_plug_name=>'Hired VS Relieved'
,p_static_id=>'hired-vs-relieved-3'
,p_region_name=>'D'
,p_parent_plug_id=>wwv_flow_imp.id(33234444829461508085)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--hiddenOverflow:margin-top-sm:margin-bottom-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(6190454811267781350)
,p_region_id=>wwv_flow_imp.id(33234444541539508082)
,p_chart_type=>'bar'
,p_height=>'220'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_fill_multi_series_gaps=>false
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'Employees Hired  Vs Relieved Details  Not Found.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(6190456491270781350)
,p_chart_id=>wwv_flow_imp.id(6190454811267781350)
,p_static_id=>'hired'
,p_js_static_id=>'HVR'
,p_seq=>10
,p_name=>'Hired '
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUM(new_hier) new_hier, period,',
'       Initcap(period_desc),',
'       period_desc',
'  FROM (',
'    SELECT (CASE WHEN emp_status = ''A'' THEN emp_emp_id END) new_hier,',
'           fp_year year,',
'           fp_period period,',
'           fp_short_desc period_desc',
'      FROM (',
'        SELECT COUNT(emp_emp_id) emp_emp_id,',
'               emp_status,',
'               fp_year,',
'               fp_period,',
'               fp_short_desc',
'          FROM employees, emp_active_infos, fin_periods',
'         WHERE emp_bu = empai_bu',
'           AND emp_emp_id = empai_emp_id',
'           AND emp_bu = :global_bu',
'           AND emp_status = ''A''',
'           AND emp_include_payroll = ''Y''',
'           AND fp_bu = empai_bu',
'           AND (emp_start_date BETWEEN fp_from_date AND fp_end_date)',
'           AND (:p950100006022_unit_loc IS NULL OR INSTR('':'' || :p950100006022_unit_loc || '':'', '':'' || empai_loc_id || '':'') > 0)',
'           AND (:P950100006022_PERIOD IS NULL OR INSTR('':'' || :P950100006022_PERIOD || '':'', '':'' || fp_short_desc || '':'') > 0)',
'           AND (:P950100006022_YEAR IS NULL OR INSTR('':'' || :P950100006022_YEAR || '':'', '':'' || fp_year || '':'') > 0)',
'           AND (:P950100006022_GROUP IS NULL OR INSTR('':'' || :P950100006022_GROUP || '':'', '':'' || emp_group_id || '':'') > 0)',
'         GROUP BY emp_status, fp_year, fp_period, fp_short_desc',
'      )',
'  )',
' GROUP BY period, period_desc'))
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_PERIOD,P950100006022_YEAR,P950100006022_GROUP'
,p_series_type=>'bar'
,p_items_value_column_name=>'NEW_HIER'
,p_items_label_column_name=>'INITCAP(PERIOD_DESC)'
,p_color=>'#e2d088'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.:RP,:P95010000610_TYPE,P95010000610_REGION_NAME,P95010000610_PERIOD,P95010000610_GROUP:HVR,Hired Employees,&PERIOD_DESC.,&P950100006022_GROUP.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(6190457162622781352)
,p_chart_id=>wwv_flow_imp.id(6190454811267781350)
,p_static_id=>'relieved'
,p_js_static_id=>'R'
,p_seq=>20
,p_name=>'Relieved'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUM(emp_resign) emp_resign, period,',
'       Initcap(period_desc),',
'       period_desc',
'  FROM (',
'    SELECT (CASE WHEN emp_status <> ''A'' THEN emp_emp_id END) emp_resign,',
'           fp_period year,',
'           fp_period period,',
'           fp_short_desc period_desc',
'      FROM (',
'        SELECT COUNT(emp_emp_id) emp_emp_id,',
'               emp_status,',
'               fp_year,',
'               fp_period,',
'               fp_short_desc',
'          FROM employees, emp_active_infos, fin_periods',
'         WHERE emp_bu = empai_bu',
'           AND emp_emp_id = empai_emp_id',
'           AND emp_bu = :global_bu',
'           AND emp_status IN (''T'', ''R'')',
'           AND fp_bu = empai_bu',
'           AND (emp_end_date BETWEEN fp_from_date AND fp_end_date)',
'           AND (:P950100006022_UNIT_LOC IS NULL OR INSTR('':'' || :P950100006022_UNIT_LOC || '':'', '':'' || empai_loc_id || '':'') > 0)',
'           AND (:P950100006022_PERIOD IS NULL OR INSTR('':'' || :P950100006022_PERIOD || '':'', '':'' || fp_short_desc || '':'') > 0)',
'           AND (:P950100006022_YEAR IS NULL OR INSTR('':'' || :P950100006022_YEAR || '':'', '':'' || fp_year || '':'') > 0)',
'           AND (:P950100006022_GROUP IS NULL OR INSTR('':'' || :P950100006022_GROUP || '':'', '':'' || emp_group_id || '':'') > 0)',
'         GROUP BY emp_status, fp_year, fp_period, fp_short_desc',
'      )',
'  )',
' GROUP BY period, period_desc'))
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_PERIOD,P950100006022_YEAR,P950100006022_GROUP'
,p_series_type=>'bar'
,p_items_value_column_name=>'EMP_RESIGN'
,p_items_label_column_name=>'INITCAP(PERIOD_DESC)'
,p_color=>'#9fdee8'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.::P95010000610_PERIOD,P95010000610_TYPE,P95010000610_REGION_NAME,P95010000610_GROUP:&PERIOD_DESC.,REL,Relieved Employees,&P950100006022_GROUP.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(6190455906506781350)
,p_chart_id=>wwv_flow_imp.id(6190454811267781350)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title_font_size=>'10'
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
 p_id=>wwv_flow_imp.id(6190455317084781350)
,p_chart_id=>wwv_flow_imp.id(6190454811267781350)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'off'
,p_title_font_size=>'10'
,p_format_type=>'currency'
,p_numeric_pattern=>'&GLOBAL_CHART_FMT_MASK.'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(10512646624171969324)
,p_name=>'Hired VS Relieved (Contract)'
,p_static_id=>'hired-vs-relieved-contract'
,p_title=>'Hired VS Relieved (Contract)'
,p_region_name=>'HVRR'
,p_parent_plug_id=>wwv_flow_imp.id(13425034709399947396)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--float:t-Cards--animColorFill'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Hired'' LABEL1,',
'         ''Relieved'' LABEL2,',
'         ''Hired Vs Relieved (Contract)'' NAME,',
'         TO_CHAR(NVL(SUM(Hired), 0), ''FM999,999,990'') Total, ',
'         TO_CHAR(NVL(SUM(Relived), 0), ''FM999,999,990'') Average',
'    FROM (',
'      SELECT COUNT(emp_emp_id) Hired, 0 Relived',
'        FROM employees, emp_active_infos, fin_periods',
'       WHERE emp_bu = empai_bu',
'         AND emp_emp_id = empai_emp_id',
'         AND emp_bu = :global_bu',
'         AND emp_status = ''A''',
'         AND fp_bu = empai_bu',
'         AND (emp_start_date BETWEEN FP_FROM_DATE AND FP_END_DATE)',
'         AND ((instr (:P950100006022_UNIT_LOC || '':'', empai_loc_id || '':'') > 0) OR :P950100006022_UNIT_LOC is null )',
'         AND ((instr (:P950100006022_PERIOD || '':'', fp_short_desc || '':'') > 0) )   ',
'         AND ((instr (:P950100006022_YEAR || '':'', fp_year || '':'') > 0))',
'         AND ((instr (:P950100006022_GROUP || '':'', emp_group_id || '':'') > 0) OR :P950100006022_GROUP IS NULL )                        ',
'         AND empai_loc_id is not NULL',
'         AND :P950100006022_UNIT_LOC is not  NULL',
'       GROUP BY emp_status',
'      UNION ALL',
'      SELECT 0, COUNT(emp_emp_id)',
'        FROM employees, emp_active_infos, fin_periods',
'       WHERE emp_bu = empai_bu',
'         AND emp_emp_id = empai_emp_id',
'         AND emp_bu = :global_bu',
'         AND emp_status IN (''T'', ''R'')',
'         AND fp_bu = empai_bu',
'         AND (emp_end_date BETWEEN FP_FROM_DATE AND FP_END_DATE)',
'         AND ((instr (:P950100006022_UNIT_LOC || '':'', empai_loc_id || '':'') > 0) )',
'         AND ((instr (:P950100006022_PERIOD || '':'', fp_short_desc || '':'') > 0) )',
'         AND ((instr (:P950100006022_YEAR || '':'', fp_year || '':'') > 0))',
'         AND ((instr (:P950100006022_GROUP || '':'', emp_group_id || '':'') > 0) OR :P950100006022_GROUP IS NULL )',
'    )'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_YEAR,P950100006022_PERIOD,P950100006022_GROUP'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(77760528479222550)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190448289410781345)
,p_query_column_id=>5
,p_column_alias=>'AVERAGE'
,p_column_display_sequence=>50
,p_column_heading=>'Average'
,p_column_link=>'f?p=&APP_ID.:950100006100:&SESSION.::&DEBUG.::P950100006100_TYPE,P950100006100_REGION_NAME,P950100006100_PERIOD,P950100006022_GROUP:RELL,Contract Relieved Employee,,&P950100006022_GROUP.'
,p_column_linktext=>'#AVERAGE#'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190446717806781344)
,p_query_column_id=>1
,p_column_alias=>'LABEL1'
,p_column_display_sequence=>10
,p_column_heading=>'Label1'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190447087189781344)
,p_query_column_id=>2
,p_column_alias=>'LABEL2'
,p_column_display_sequence=>20
,p_column_heading=>'Label2'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190447517435781344)
,p_query_column_id=>3
,p_column_alias=>'NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190447921948781344)
,p_query_column_id=>4
,p_column_alias=>'TOTAL'
,p_column_display_sequence=>40
,p_column_heading=>'Total'
,p_column_link=>'f?p=&APP_ID.:950100006100:&SESSION.::&DEBUG.::P950100006100_TYPE,P950100006100_REGION_NAME,P950100006100_PERIOD,P950100006022_GROUP:HVRR,Contract Hired Employees,,&P950100006022_GROUP.'
,p_column_linktext=>'#TOTAL#'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(19542077933913848591)
,p_plug_name=>'Location'
,p_static_id=>'location'
,p_title=>'Location'
,p_region_name=>'collexprep'
,p_parent_plug_id=>wwv_flow_imp.id(24426404478777831052)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13194927443663241158)
,p_plug_name=>'Monthly'
,p_static_id=>'monthly'
,p_region_name=>'B'
,p_parent_plug_id=>wwv_flow_imp.id(33235997380504434705)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--accent12:t-Region--noUI:t-Region--hiddenOverflow:margin-top-sm:margin-bottom-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(6190459588757781355)
,p_region_id=>wwv_flow_imp.id(13194927443663241158)
,p_chart_type=>'pie'
,p_height=>'220'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'currency'
,p_value_decimal_places=>0
,p_value_numeric_pattern=>'&GLOBAL_CHART_FMT_MASK.'
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_legend_font_size=>'10'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(6190460102468781355)
,p_chart_id=>wwv_flow_imp.id(6190459588757781355)
,p_static_id=>'new'
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT dept_name,',
'        sum(total_ctc) total,',
'        empai_dept_id',
'    FROM (',
'SELECT ',
'       (SELECT dept_name1',
'          FROM departments',
'         WHERE dept_bu = empai_bu AND dept_id = empai_dept_id) dept_name,',
'       -- nvl(empai_basic_sal,0) + ',
'            (SELECT nvl(sum(epa_per_amt) ,0)',
'              FROM emp_pyrl_allowances ',
'             WHERE  EPA_BU = empai_bu ',
'              AND EPA_EMP_ID = empai_emp_id ) total_ctc,',
'              empai_dept_id',
'  FROM employees, ',
'       emp_active_infos/*,',
'       fin_periods*/',
' WHERE     emp_bu = empai_bu',
'       AND emp_emp_id = empai_emp_id',
'       AND emp_bu = :global_bu',
'       AND emp_status = ''A''',
'       AND emp_include_payroll = ''Y'' ',
'    --    AND emp_bu = fp_bu ',
'       --AND pcp_clndr_id = emp_clndr_id',
'    --    AND (emp_start_date BETWEEN FP_FROM_DATE AND FP_END_DATE)',
'       AND ((instr (:P950100006022_UNIT_LOC || '':'', empai_loc_id || '':'') > 0) )',
'       --AND ((instr (:P950100006022_PERIOD || '':'', fp_period || '':'') > 0) OR :P950100006022_PERIOD IS NULL)    ',
'       --AND ((instr (:P950100006022_YEAR || '':'', fp_year || '':'') > 0) OR :P950100006022_YEAR IS NULL)',
'        AND ((instr (:P950100006022_GROUP || '':'', emp_group_id || '':'') > 0) OR :P950100006022_GROUP IS NULL ) ',
'       )',
'       GROUP BY dept_name,empai_dept_id',
'         '))
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_PERIOD,P950100006022_YEAR,P950100006022_GROUP'
,p_series_type=>'donut'
,p_items_value_column_name=>'TOTAL'
,p_items_label_column_name=>'DEPT_NAME'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
,p_items_label_font_size=>'10'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.:RP,:P95010000610_TYPE,P95010000610_REGION_NAME,P95010000610_CTC_DEPT_ID,P95010000610_GROUP:MCTC,Monthly CTC,&EMPAI_DEPT_ID.,&P950100006022_GROUP.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(33235997380504434705)
,p_name=>'Monthly CTC'
,p_static_id=>'monthly-ctc'
,p_region_name=>'MCTC'
,p_parent_plug_id=>wwv_flow_imp.id(13633272223555794537)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--accent1:t-Region--noUI:t-Region--hiddenOverflow:margin-top-none:margin-left-sm:margin-right-sm'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--float:t-Cards--animColorFill'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Monthly CTC'' AS NAME,',
'         TO_CHAR(ROUND(NVL(SUM(total_ctc), 0)), ''FM999,999,999,990'') AS VALUE',
'    FROM (',
'      SELECT (SELECT NVL(SUM(epa_per_amt), 0)',
'                FROM emp_pyrl_allowances ',
'               WHERE epa_bu = empai_bu AND epa_emp_id = empai_emp_id) AS total_ctc',
'        FROM employees, ',
'             emp_active_infos',
'       WHERE emp_bu = empai_bu',
'         AND emp_emp_id = empai_emp_id',
'         AND emp_bu = :global_bu',
'         AND emp_status = ''A''',
'         AND emp_include_payroll = ''Y'' ',
'         AND (:P950100006022_UNIT_LOC IS NULL OR INSTR('':'' || :P950100006022_UNIT_LOC || '':'', '':'' || empai_loc_id || '':'') > 0)',
'         AND (:P950100006022_GROUP IS NULL OR INSTR('':'' || :P950100006022_GROUP || '':'', '':'' || emp_group_id || '':'') > 0)',
'  )'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_YEAR,P950100006022_PERIOD,P950100006022_GROUP'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(77760404339222550)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'0'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190458421302781353)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>40
,p_column_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190458810477781355)
,p_query_column_id=>2
,p_column_alias=>'VALUE'
,p_column_display_sequence=>50
,p_column_heading=>'Value'
,p_column_format=>'&GLOBAL_FMT_MASK.'
,p_column_link=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.::P95010000610_REGION_NAME,P95010000610_TYPE,P95010000610_CTC_DEPT_ID,P95010000610_GROUP:Monthly CTC,MCTC,,&P950100006022_GROUP.'
,p_column_linktext=>'#VALUE#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13224572002268557256)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13633272223555794537)
,p_plug_name=>'New'
,p_static_id=>'new-2'
,p_region_template_options=>'#DEFAULT#:margin-left-none:margin-right-none'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(38104368863804186927)
,p_name=>'No. of Employee'
,p_static_id=>'no-of-employee'
,p_region_name=>'NOE'
,p_parent_plug_id=>wwv_flow_imp.id(13633272223555794537)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--hiddenOverflow:margin-top-none:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--float:t-Cards--animColorFill'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''No. of Employees'' AS NAME,',
'         TO_CHAR(COUNT(emp_emp_id), ''FM999,999,990'') AS VALUE',
'    FROM employees, ',
'         emp_active_infos',
'   WHERE emp_bu = empai_bu',
'     AND emp_emp_id = empai_emp_id',
'     AND emp_bu = :global_bu',
'     AND emp_status = ''A''',
'     AND emp_include_payroll = ''Y''',
'     AND ((instr(:P950100006022_GROUP || '':'', emp_group_id || '':'') > 0) OR :P950100006022_GROUP IS NULL) ',
'     AND ((instr (:P950100006022_unit_loc || '':'', empai_loc_id || '':'') > 0) OR :P950100006022_unit_loc IS NULL)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_PERIOD,P950100006022_YEAR,P950100006022_GROUP'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(77760404339222550)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'0'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190473573944781367)
,p_query_column_id=>2
,p_column_alias=>'NAME'
,p_column_display_sequence=>40
,p_column_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190473145316781367)
,p_query_column_id=>1
,p_column_alias=>'VALUE'
,p_column_display_sequence=>50
,p_column_heading=>'Value'
,p_column_format=>'&GLOBAL_FMT_MASK.'
,p_column_link=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.:RP,:P95010000610_TYPE,P95010000610_REGION_NAME,P95010000610_CTC_DEPT_ID,P95010000610_GROUP:NOE,No. of Employees,,&P950100006022_GROUP.'
,p_column_linktext=>'#VALUE#'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13176313819346263054)
,p_plug_name=>'No of Employees'
,p_static_id=>'no-of-employees'
,p_region_name=>'A'
,p_parent_plug_id=>wwv_flow_imp.id(38104368863804186927)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--accent12:t-Region--textContent:t-Region--hiddenOverflow:margin-top-sm:margin-bottom-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(6190474341061781369)
,p_region_id=>wwv_flow_imp.id(13176313819346263054)
,p_chart_type=>'donut'
,p_height=>'220'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_legend_font_size=>'10'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_no_data_found_message=>'No of employees Not Found.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(6190474859394781369)
,p_chart_id=>wwv_flow_imp.id(6190474341061781369)
,p_static_id=>'employee'
,p_seq=>10
,p_name=>'Employee'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT count(emp_emp_id) emp_id,',
'            (SELECT dept_name1',
'          FROM departments',
'         WHERE dept_bu = empai_bu AND dept_id = empai_dept_id)',
'          emp_dept,',
'          empai_dept_id',
'  FROM employees, ',
'       emp_active_infos/*,',
'       fin_periods*/',
' WHERE emp_bu = empai_bu',
'       AND emp_emp_id = empai_emp_id',
'       AND emp_bu = :global_bu',
'       AND emp_status = ''A''',
'       AND emp_include_payroll = ''Y''',
'    --    AND emp_bu = fp_bu ',
'       ---AND pcp_clndr_id =  emp_clndr_id',
'    --   AND (emp_start_date BETWEEN FP_FROM_DATE AND FP_END_DATE)',
'       AND ((instr (:P950100006022_unit_loc || '':'', empai_loc_id || '':'') > 0) OR :P950100006022_unit_loc IS NULL)',
'    --    AND ((instr (:P950100006022_period || '':'', fp_period || '':'') > 0) )   ',
'    --    AND ((instr (:P950100006022_year || '':'', fp_year || '':'') > 0) )',
'    AND ((instr (:P950100006022_GROUP || '':'', emp_group_id || '':'') > 0) OR :P950100006022_GROUP IS NULL ) ',
'       group by empai_dept_id,empai_bu',
'',
'',
'     ',
''))
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_PERIOD,P950100006022_YEAR,P950100006022_GROUP'
,p_series_type=>'donut'
,p_items_value_column_name=>'EMP_ID'
,p_items_label_column_name=>'EMP_DEPT'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
,p_items_label_font_size=>'10'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.::P95010000610_TYPE,P95010000610_YEAR,P95010000610_REGION_NAME,P95010000610_CTC_DEPT_ID,P95010000610_GROUP:NOE,&P950100006022_YEAR.,No. of Employees,&EMPAI_DEPT_ID.,&P950100006022_GROUP.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(13425033438379947384)
,p_name=>'Notice Period'
,p_static_id=>'notice-period'
,p_region_name=>'NOP'
,p_parent_plug_id=>wwv_flow_imp.id(13633272223555794537)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>150
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--hiddenOverflow:margin-top-none'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--float:t-Cards--animColorFill'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Notice Period'' AS NAME,',
'         TO_CHAR(NVL(SUM(emp_count), 0), ''FM999,999,990'') AS VALUE',
'    FROM (',
'      SELECT COUNT(emp_emp_id) emp_count,',
'             empai_dept_id,',
'             (SELECT dept_name1',
'                FROM departments',
'               WHERE dept_bu = empai_bu',
'                 AND dept_id = empai_dept_id',
'                 AND ROWNUM = 1) AS emp_dept,',
'             PCP_YEAR,',
'             pcp_period',
'        FROM employees,',
'             emp_active_infos,',
'             emp_relieve,',
'             payroll_cal_period',
'       WHERE emp_bu = empai_bu',
'         AND emp_emp_id = empai_emp_id',
'         AND empai_bu = emprel_bu',
'         AND empai_emp_id = emprel_emp_id',
'         AND emp_bu = :global_bu',
'         AND emp_status = ''T''',
'         AND emprel_status = ''I''',
'         AND emp_include_payroll = ''Y''',
'         AND pcp_bu = empai_bu',
'         AND pcp_clndr_id = emp_clndr_id',
'         AND empai_dept_id IS NOT NULL',
'         AND (emp_end_date BETWEEN pcp_start_date AND pcp_end_date)',
'         AND (:P950100006022_UNIT_LOC IS NULL OR INSTR('':'' || :P950100006022_UNIT_LOC || '':'', '':'' || empai_loc_id || '':'') > 0)',
'         AND (:P950100006022_PERIOD IS NULL OR INSTR('':'' || :P950100006022_PERIOD || '':'', '':'' || pcp_short_desc || '':'') > 0)',
'         AND (:P950100006022_YEAR IS NULL OR INSTR('':'' || :P950100006022_YEAR || '':'', '':'' || pcp_year || '':'') > 0)',
'         AND (:P950100006022_GROUP IS NULL OR INSTR('':'' || :P950100006022_GROUP || '':'', '':'' || emp_group_id || '':'') > 0)',
'       GROUP BY empai_bu, empai_dept_id, pcp_period, PCP_YEAR',
'    )'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_PERIOD,P950100006022_YEAR,P950100006022_GROUP'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(77760404339222550)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'0'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190444030462781342)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190444400332781342)
,p_query_column_id=>2
,p_column_alias=>'VALUE'
,p_column_display_sequence=>40
,p_column_heading=>'Value'
,p_column_format=>'&GLOBAL_FMT_MASK.'
,p_column_link=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.:RP,:P95010000610_TYPE,P95010000610_REGION_NAME,P95010000610_CTC_DEPT_ID,P95010000610_GROUP:NOP,Notice Period,,&P950100006022_GROUP.'
,p_column_linktext=>'#VALUE#'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13425034709399947396)
,p_plug_name=>'Notice Period'
,p_static_id=>'notice-period-2'
,p_region_name=>'K'
,p_parent_plug_id=>wwv_flow_imp.id(13425033438379947384)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--textContent:t-Region--hiddenOverflow:margin-top-sm:margin-bottom-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(6190445240410781342)
,p_region_id=>wwv_flow_imp.id(13425034709399947396)
,p_chart_type=>'donut'
,p_height=>'220'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_no_data_found_message=>'Notice Period Details Not Found.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(6190445725274781342)
,p_chart_id=>wwv_flow_imp.id(6190445240410781342)
,p_static_id=>'notice-period'
,p_seq=>10
,p_name=>'Notice Period'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT sum(emp_count) as emp_count,',
'       emp_dept, empai_dept_id',
'  FROM (',
'    SELECT COUNT (emp_emp_id) emp_count,',
'           empai_dept_id,',
'           (SELECT dept_name1',
'              FROM departments',
'             WHERE dept_bu = empai_bu',
'               AND dept_id = empai_dept_id',
'               AND ROWNUM = 1) AS emp_dept,',
'           pcp_year,',
'           pcp_period',
'      FROM employees,',
'           emp_active_infos,',
'           emp_relieve,',
'           payroll_cal_period',
'     WHERE emp_bu = empai_bu',
'       AND emp_emp_id = empai_emp_id',
'       AND empai_bu = emprel_bu',
'       AND empai_emp_id = emprel_emp_id',
'       AND emp_bu = :global_bu',
'       AND emp_status = ''T''',
'       AND emprel_status = ''I''',
'       AND emp_include_payroll = ''Y''',
'       AND pcp_bu = empai_bu',
'       AND pcp_clndr_id = emp_clndr_id',
'       AND empai_dept_id IS NOT NULL',
'       AND (emp_end_date BETWEEN pcp_start_date AND pcp_end_date)',
'       AND (:P950100006022_UNIT_LOC IS NULL OR INSTR('':'' || :P950100006022_UNIT_LOC || '':'', '':'' || empai_loc_id || '':'') > 0)',
'       AND (:P950100006022_PERIOD IS NULL OR INSTR('':'' || :P950100006022_PERIOD || '':'', '':'' || pcp_short_desc || '':'') > 0)',
'       AND (:P950100006022_YEAR IS NULL OR INSTR('':'' || :P950100006022_YEAR || '':'', '':'' || pcp_year || '':'') > 0)',
'       AND (:P950100006022_GROUP IS NULL OR INSTR('':'' || :P950100006022_GROUP || '':'', '':'' || emp_group_id || '':'') > 0)',
'     GROUP BY empai_bu, empai_dept_id, pcp_period, pcp_year',
')',
'GROUP BY emp_dept, empai_dept_id'))
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_PERIOD,P950100006022_YEAR,P950100006022_GROUP'
,p_series_type=>'donut'
,p_items_value_column_name=>'EMP_COUNT'
,p_items_label_column_name=>'EMP_DEPT'
,p_color=>'#7eeba4'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'LABEL'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.::P95010000610_TYPE,P95010000610_REGION_NAME,P95010000610_CTC_DEPT_ID:NOP,Notice Period,&EMPAI_DEPT_ID.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(13425033275863947382)
,p_name=>'Probation'
,p_static_id=>'probation'
,p_region_name=>'Prob'
,p_parent_plug_id=>wwv_flow_imp.id(13633272223555794537)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>140
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--hiddenOverflow:margin-top-none'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--float:t-Cards--animColorFill'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Probation'' AS NAME,',
'         TO_CHAR(COUNT(DISTINCT emp_emp_id), ''FM999,999,990'') AS VALUE',
'    FROM employees,',
'         emp_active_infos,',
'         payroll_cal_period',
'   WHERE emp_bu = pcp_bu',
'     AND emp_bu = :global_bu',
'     AND empai_bu = emp_bu',
'     AND empai_emp_id = emp_emp_id',
'     AND emp_status IN (''A'')   ',
'     AND emp_include_payroll = ''Y''',
'     AND emp_prob_period_status = ''A''',
'     AND (emp_prob_start_date BETWEEN pcp_start_date AND pcp_end_date)',
'     AND pcp_clndr_id = emp_clndr_id',
'     AND (emp_start_date BETWEEN pcp_start_date AND pcp_end_date)',
'     AND (:p950100006022_unit_loc IS NULL OR INSTR('':'' || :p950100006022_unit_loc || '':'', '':'' || empai_loc_id || '':'') > 0)',
'     AND (:p950100006022_period IS NULL OR INSTR('':'' || :p950100006022_period || '':'', '':'' || pcp_short_desc || '':'') > 0)    ',
'     AND (:p950100006022_year IS NULL OR INSTR('':'' || :p950100006022_year || '':'', '':'' || pcp_year || '':'') > 0)',
'     AND (:P950100006022_GROUP IS NULL OR INSTR('':'' || :P950100006022_GROUP || '':'', '':'' || emp_group_id || '':'') > 0)'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_YEAR,P950100006022_PERIOD,P950100006022_GROUP'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(77760404339222550)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'0'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190433566181781330)
,p_query_column_id=>1
,p_column_alias=>'NAME'
,p_column_display_sequence=>30
,p_column_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190433886761781331)
,p_query_column_id=>2
,p_column_alias=>'VALUE'
,p_column_display_sequence=>40
,p_column_heading=>'Value'
,p_column_format=>'&GLOBAL_FMT_MASK.'
,p_column_link=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.::P95010000610_TYPE,P95010000610_REGION_NAME,P95010000610_CTC_DEPT_ID,P95010000610_GROUP:Prob,Probation,,&P950100006022_GROUP.'
,p_column_linktext=>'#VALUE#'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13425034138000947391)
,p_plug_name=>'Probation'
,p_static_id=>'probation-2'
,p_region_name=>'J'
,p_parent_plug_id=>wwv_flow_imp.id(13425033275863947382)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--accent12:t-Region--textContent:t-Region--hiddenOverflow:margin-top-sm:margin-bottom-sm'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(6190434761743781333)
,p_region_id=>wwv_flow_imp.id(13425034138000947391)
,p_chart_type=>'bar'
,p_height=>'220'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'on'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_fill_multi_series_gaps=>false
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>false
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'Probation Details Not Found.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(6190436411151781334)
,p_chart_id=>wwv_flow_imp.id(6190434761743781333)
,p_static_id=>'probation'
,p_seq=>10
,p_name=>'Probation'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT count(distinct (emp_emp_id)) emp_count,',
'       (SELECT dept_name1 ',
'          FROM departments ',
'         WHERE dept_bu = empai_bu ',
'           AND dept_id = empai_dept_id) ps_emp_dept_desc,',
'       empai_dept_id',
'  FROM employees,',
'       emp_active_infos,',
'       payroll_cal_period',
' WHERE emp_bu = pcp_bu',
'   AND emp_bu = :global_bu',
'   AND empai_bu = emp_bu',
'   AND empai_emp_id = emp_emp_id',
'   AND emp_status IN (''A'')   ',
'   AND emp_include_payroll = ''Y''',
'   AND emp_prob_period_status = ''A''',
'   AND (emp_prob_start_date between pcp_start_date and pcp_end_date)',
'   AND pcp_clndr_id = emp_clndr_id',
'   AND (emp_start_date BETWEEN pcp_start_date AND pcp_end_date)',
'   AND (:p950100006022_unit_loc IS NULL OR INSTR('':'' || :p950100006022_unit_loc || '':'', '':'' || empai_loc_id || '':'') > 0)',
'   AND (:p950100006022_period IS NULL OR INSTR('':'' || :p950100006022_period || '':'', '':'' || pcp_short_desc || '':'') > 0)    ',
'   AND (:p950100006022_year IS NULL OR INSTR('':'' || :p950100006022_year || '':'', '':'' || pcp_year || '':'') > 0)',
'   AND (:P950100006022_GROUP IS NULL OR INSTR('':'' || :P950100006022_GROUP || '':'', '':'' || emp_group_id || '':'') > 0)',
' GROUP BY empai_dept_id, empai_bu'))
,p_ajax_items_to_submit=>'P950100006022_UNIT_LOC,P950100006022_YEAR,P950100006022_PERIOD,P950100006022_GROUP'
,p_series_type=>'bar'
,p_items_value_column_name=>'EMP_COUNT'
,p_items_label_column_name=>'PS_EMP_DEPT_DESC'
,p_color=>'#ef94a5'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:95010000610:&SESSION.::&DEBUG.:RP,:P95010000610_TYPE,P95010000610_REGION_NAME,P95010000610_CTC_DEPT_ID:Prob,Probation,&EMPAI_DEPT_ID.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(6190435269318781333)
,p_chart_id=>wwv_flow_imp.id(6190434761743781333)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title_font_size=>'10'
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
 p_id=>wwv_flow_imp.id(6190435807822781334)
,p_chart_id=>wwv_flow_imp.id(6190434761743781333)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'off'
,p_title_font_size=>'10'
,p_format_type=>'currency'
,p_numeric_pattern=>'&GLOBAL_CHART_FMT_MASK.'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(24426404478777831052)
,p_plug_name=>'<span class="t-Icon fa fa-filter" aria-hidden="true" style="margin-left: 5px; margin-top: 4px;"></span> Filters'
,p_static_id=>'span-class-t-icon-fa-fa-filter-aria-hidden-true-style-margin-left-5px-margin-top-4px-span-filters'
,p_region_css_classes=>'side-filters'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--controlsPosEnd:is-expanded:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6190475816678781369)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(24426404478777831052)
,p_button_name=>'Collexp'
,p_static_id=>'collexp'
,p_button_static_id=>'exp'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--padRight'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Expand/Collapse'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-arrows-v'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6190432032497781323)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(13224572002268557256)
,p_button_name=>'Generate'
,p_static_id=>'generate'
,p_button_static_id=>'BT1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Generate'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_grid_column_css_classes=>'savebtn'
,p_grid_new_row=>'N'
,p_grid_column=>5
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6190432348695781323)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(13224572002268557256)
,p_button_name=>'Unit_Filter'
,p_static_id=>'unit-filter'
,p_button_static_id=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--pillEnd:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Unit Filter'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13642097322723409528)
,p_name=>'P950100006022_DEPT_ID'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(19542077933913848591)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13224785064687557571)
,p_name=>'P950100006022_DUMMY'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(19542077933913848591)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19687400505571183300)
,p_name=>'P950100006022_DUMMY_1'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(19542077933913848591)
,p_use_cache_before_default=>'NO'
,p_item_default=>'1'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19574807397997531699)
,p_name=>'P950100006022_DUM_COL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(19542077933913848591)
,p_item_default=>'0'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13534975685477492460)
,p_name=>'P950100006022_GENDER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(19542077933913848591)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9828690086423862382)
,p_name=>'P950100006022_GROUP'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(19542077933913848591)
,p_prompt=>'<B>Group</B>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT eg_group_desc,',
'       eg_group_id ',
'  FROM emp_groups',
' WHERE eg_bu = :GLOBAL_BU',
'   AND eg_active_flag = ''Y'''))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>11
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-none'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_defaults', 'Y')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13285138992482082698)
,p_name=>'P950100006022_HIRE_COUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(33234444541539508082)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13671208059729817961)
,p_name=>'P950100006022_LOC'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(19542077933913848591)
,p_item_default=>'Y'
,p_prompt=>'<b>Select all</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none:margin-left-sm'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13671208385167817965)
,p_name=>'P950100006022_MONTH'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(19542077933913848591)
,p_item_default=>'Y'
,p_prompt=>'<b>Select all</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_grid_column=>9
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-none'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13283101820424114220)
,p_name=>'P950100006022_MONTHLY_CTC'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(13194927443663241158)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13224784500653557565)
,p_name=>'P950100006022_PERIOD'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(19542077933913848591)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  FP_SHORT_DESC ',
' FROM fin_periods',
'WHERE fP_bu = :GLOBAL_BU',
'  AND (FP_YEAR = :P950100006022_YEAR OR :P950100006022_YEAR IS NULL)',
'  ORDER BY FP_PERIOD; '))
,p_item_default_type=>'SQL_QUERY_COLON'
,p_prompt=>'<B>Month</B>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT D,R FROM (',
'SELECT DISTINCT Initcap(FP_SHORT_DESC)D ,FP_PERIOD ,FP_SHORT_DESC R ',
' FROM fin_periods',
'WHERE fP_bu = :GLOBAL_BU',
'  AND INSTR (:P950100006022_YEAR || '':'', fp_year || '':'') > 0 ',
'  ORDER BY FP_PERIOD )',
'  ORDER BY FP_PERIOD;',
''))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-none'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_defaults', 'Y')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19687407990370183322)
,p_name=>'P950100006022_UNIT'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(19542077933913848591)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'if :P950100006022_DUMMY_1 = 1 THEN ',
'SELECT LISTAGG(bup_plant_id,'':'') WITHIN GROUP (ORDER BY bup_plant_id)INTO :P950100006022_UNIT',
'FROM(SELECT  bup_bu || '' - '' || (SUBSTR(bup_name1,1,50)) bup_name1,bup_plant_id',
'FROM business_units, bus_unit_plants, appl_user_plant_access',
' WHERE bup_bu = bu_id',
'   AND bup_bu = auba_bu',
'   AND bup_plant_id = auba_plant',
'   AND auba_user_id = :global_user         ',
'   AND INSTR (:P950100006022_UNIT_LOC || '':'',auba_plnt_loc_id|| '':'') >    0',
'   AND (TRUNC (SYSDATE) BETWEEN auba_from AND auba_to)         ',
'   AND bup_bu = :global_bu',
'ORDER BY bup_rpt_print_seq);',
'END IF;',
'RETURN :P950100006022_UNIT;               ',
'END;  ',
'',
'-- bup_group_id  '))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13243136938082591330)
,p_name=>'P950100006022_UNIT_LOC'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(19542077933913848591)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P950100006022_DUMMY = 0 THEN',
'    SELECT LISTAGG(bupld_loc_id,'':'') WITHIN GROUP (ORDER BY bupld_loc_id)INTO :P950100006022_UNIT_LOC',
'    FROM(',
'       SELECT bupld_loc_name,bupld_loc_id ',
'         FROM bus_unit_plants_loc_dtls,',
'              appl_user_plant_access',
'        WHERE bupld_bu = :global_bu',
'          AND bupld_bu = auba_bu',
'          AND bupld_loc_id = auba_plnt_loc_id',
'          AND auba_user_id = :global_user',
'          AND bupld_actv_loc_flag = ''Y''',
'    ORDER BY bupld_loc_id);',
'RETURN :P950100006022_UNIT_LOC;        ',
'END IF;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'<b>Location</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_named_lov=>'UNIT_LOC3111'
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#:margin-top-none:margin-left-sm'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_defaults', 'Y')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(17833452783106605371)
,p_name=>'P950100006022_YEAR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(19542077933913848591)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'SELECT :GLOBAL_YEAR INTO :P950100006022_YEAR FROM DUAL;',
'',
'RETURN :P950100006022_YEAR;',
'',
'END;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'<B>Year</B>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT FP_YEAR D, FP_YEAR R',
'  FROM fin_periods',
' WHERE fp_bu = :GLOBAL_BU',
'   AND fp_year <= :GLOBAL_YEAR',
'order by fp_year desc'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>5
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-none'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_defaults', 'Y')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190491887828781389)
,p_name=>'CLEAR'
,p_static_id=>'clear'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190432348695781323)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190492483398781391)
,p_event_id=>wwv_flow_imp.id(6190491887828781389)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P950100006022_YEAR,P950100006022_UNIT_LOC,P950100006022_MONTH,P950100006022_PERIOD,P950100006022_LOC,P950100006022_GROUP'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190492962795781391)
,p_event_id=>wwv_flow_imp.id(6190491887828781389)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(24426404478777831052)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190488727990781387)
,p_name=>'Close'
,p_static_id=>'close'
,p_event_sequence=>150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190475816678781369)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190489707286781389)
,p_event_id=>wwv_flow_imp.id(6190488727990781387)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P950100006022_DUM_COL',
  'language', 'PLSQL',
  'plsql_code', ':P950100006022_DUM_COL:= 0;',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190489267147781387)
,p_event_id=>wwv_flow_imp.id(6190488727990781387)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#collexprep.a-Collapsible.is-expanded'').removeClass(''is-expanded'').addClass(''is-collapsed'');',
    '$(''#collexprep.a-Collapsible .a-Collapsible-content'').show();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190484500185781386)
,p_name=>'fetch_unit'
,p_static_id=>'fetch-unit'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P950100006022_UNIT1'
,p_condition_element=>'P950100006022_UNIT1'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190484990572781386)
,p_event_id=>wwv_flow_imp.id(6190484500185781386)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P950100006022_UNIT1',
  'items_to_submit', 'P950100006022_UNIT1',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :P950100006022_UNIT_GROUP  is not null  then',
    '',
    'SELECT LISTAGG(bup_plant_id,'':'') WITHIN GROUP (ORDER BY bup_plant_id) INTO :P950100006022_UNIT',
    'FROM(SELECT  bup_bu || '' - '' || bup_name1,bup_plant_id ',
    ' FROM business_units, bus_unit_plants, appl_user_plant_access',
    ' WHERE bup_bu = bu_id',
    '   AND bup_bu = auba_bu',
    '   AND bup_plant_id = auba_plant',
    '   AND auba_user_id = :global_user         ',
    '   AND (NVL (:P950100006022_UNIT_GROUP, ''0'') = ''0''',
    '    OR INSTR (:P950100006022_UNIT_GROUP || '':'',bup_group_id  || '':'') >    0)',
    '   AND (TRUNC (SYSDATE) BETWEEN auba_from AND auba_to)         ',
    '   AND bup_bu = :global_bu',
    'ORDER BY bup_rpt_print_seq);',
    ':P950100006022_DUMMY := 0;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190485568041781386)
,p_event_id=>wwv_flow_imp.id(6190484500185781386)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P950100006022_UNIT1',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ':P1915131043_DUMMY := 1;',
    ':P1915131043_UNIT := null;',
    ':P950100006022_NEW := NULL;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190486079288781387)
,p_event_id=>wwv_flow_imp.id(6190484500185781386)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190480428271781383)
,p_name=>'New_1'
,p_static_id=>'new'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P950100006022_DUMMY_2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190480943955781384)
,p_event_id=>wwv_flow_imp.id(6190480428271781383)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190481337136781384)
,p_name=>'New_3'
,p_static_id=>'new-2'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P950100006022_DUMMY_1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190481826545781384)
,p_event_id=>wwv_flow_imp.id(6190481337136781384)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190482278827781384)
,p_name=>'New_2'
,p_static_id=>'new-3'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P950100006022_DUMMY_1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190482763689781384)
,p_event_id=>wwv_flow_imp.id(6190482278827781384)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190483156235781384)
,p_name=>'New'
,p_static_id=>'new-4'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P950100006022_UNIT1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190483631991781386)
,p_event_id=>wwv_flow_imp.id(6190483156235781384)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P950100006022_UNIT1',
  'language', 'PLSQL',
  'plsql_code', ':P950100006022_NEW := :P950100006022_UNIT;',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190484098436781386)
,p_event_id=>wwv_flow_imp.id(6190483156235781384)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190493360342781391)
,p_name=>'New_4'
,p_static_id=>'new-5'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P950100006022_YEAR'
,p_condition_element=>'P950100006022_YEAR'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190493868938781391)
,p_event_id=>wwv_flow_imp.id(6190493360342781391)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P950100006022_PERIOD',
  'items_to_submit', 'P950100006022_YEAR',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT LISTAGG(fp_short_desc,'':'') WITHIN GROUP (ORDER BY fp_period) into :P950100006022_period',
    '    FROM fin_periods',
    '   WHERE fP_bu = :GLOBAL_BU',
    '         AND INSTR (NVL (:P950100006022_year, :global_year) || '':'', fp_year || '':'') > 0',
    'ORDER BY FP_PERIOD;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190486425444781387)
,p_name=>'Open'
,p_static_id=>'open'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190475816678781369)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190487438835781387)
,p_event_id=>wwv_flow_imp.id(6190486425444781387)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P950100006022_DUM_COL',
  'language', 'PLSQL',
  'plsql_code', ':P950100006022_DUM_COL:= 1;',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190486930516781387)
,p_event_id=>wwv_flow_imp.id(6190486425444781387)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#collexprep.a-Collapsible.is-collapsed'').removeClass(''is-collapsed'').addClass(''is-expanded'');',
    '$(''#collexprep.a-Collapsible .a-Collapsible-content'').show();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190494202972781391)
,p_name=>'REFRESH_REGION'
,p_static_id=>'refresh-region'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190432032497781323)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190494757819781392)
,p_event_id=>wwv_flow_imp.id(6190494202972781391)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var regions = [''NOE'', ''A'', ''MCTC'', ''B'', ''ACTC'', ''C'', ''HVR'',''HVRR'', ''D'', ''AV'', ''E'', ''F'', ''G'', ''ATR'', ''H'', ''AVGSP'', ''I'', ''Prob'', ''J'', ''NOP'', ''K''];',
    '',
    'for (var i = 0; i < regions.length; i++) {',
    '    apex.region(regions[i]).refresh();',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190487851386781387)
,p_name=>'SELECT / UN SELECT'
,p_static_id=>'select-un-select'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P950100006022_LOC'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190488346234781387)
,p_event_id=>wwv_flow_imp.id(6190487851386781387)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P950100006022_UNIT_LOC',
  'items_to_submit', 'P950100006022_LOC',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT CASE WHEN :P950100006022_LOC = ''Y'' ',
    '            THEN LISTAGG(bupld_loc_id,'':'') WITHIN GROUP (ORDER BY bupld_loc_id) ELSE NULL END ',
    '  INTO :P950100006022_UNIT_LOC',
    '  FROM bus_unit_plants_loc_dtls',
    ' WHERE BUPLD_BU = :GLOBAL_BU;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190490092437781389)
,p_name=>'Select / Unselect'
,p_static_id=>'select-unselect'
,p_event_sequence=>210
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P950100006022_MONTH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190490619643781389)
,p_event_id=>wwv_flow_imp.id(6190490092437781389)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P950100006022_PERIOD',
  'items_to_submit', 'P950100006022_MONTH',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ' SELECT CASE WHEN :P950100006022_MONTH = ''Y'' ',
    '            THEN LISTAGG(FP_short_desc,'':'') WITHIN GROUP (ORDER BY FP_PERIOD) ELSE NULL END ',
    '      INTO :P950100006022_PERIOD',
    '      FROM fin_periods',
    '     WHERE fP_bu = :GLOBAL_BU',
    '       AND INSTR (:P950100006022_YEAR || '':'', fp_year || '':'') > 0 ;',
    '    ')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190491057259781389)
,p_name=>'Unit_Fetch'
,p_static_id=>'unit-fetch'
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P950100006022_UNIT_LOC'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190491524231781389)
,p_event_id=>wwv_flow_imp.id(6190491057259781389)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P950100006022_UNIT',
  'items_to_submit', 'P950100006022_UNIT_LOC',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    'SELECT LISTAGG(bup_plant_id,'':'') WITHIN GROUP (ORDER BY bup_plant_id asc) INTO :P950100006022_UNIT',
    ' FROM (SELECT  DISTINCT  bup_name1 bu_name, bup_plant_id,bup_rpt_print_seq',
    '  FROM business_units, bus_unit_plants, appl_user_plant_access,bus_unit_plants_loc_dtls',
    ' WHERE bup_bu = bu_id',
    '   AND bup_bu = auba_bu',
    '   AND bup_plant_id = auba_plant',
    '   AND bupld_bu = bup_bu',
    '   AND bupld_plnt = bup_plant_id',
    '   AND auba_user_id = :global_user         ',
    '   AND (INSTR (:P950100006022_UNIT_LOC || '':'',bupld_loc_id  || '':'') > 0 OR :P950100006022_UNIT_LOC IS NULL)',
    '   AND (TRUNC (SYSDATE) BETWEEN auba_from AND auba_to)         ',
    '   AND bup_bu = :global_bu',
    'ORDER BY bup_rpt_print_seq);',
    'EXCEPTION WHEN OTHERS THEN NULL;',
    'END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
