prompt --application/pages/page_04011
begin
--   Manifest
--     PAGE: 04011
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
 p_id=>4011
,p_name=>'Attrition Analysis Dashboard'
,p_alias=>'ATTRITION-ANALYSIS-DASHBOARD'
,p_step_title=>'Attrition Analysis Dashboard'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
' $(".t-Body-content").removeClass("collapsible");  ',
'  $(".t-Body-side").removeClass("collapsible");  ',
'',
'',
' $("#D").css({''background-color'': ''orange''});',
' $("#M").css({''background-color'': ''#3ead2a''});',
' $("#U").css({''background-color'': ''#3ead2a''});',
' $("#D").css({''color'': ''white''});',
' $("#M").css({''color'': ''white''});',
' $("#U").css({''color'': ''white''});'))
,p_step_template=>wwv_flow_imp.id(10650482615684505314)
,p_page_css_classes=>'side-filters'
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10157464027840643378)
,p_plug_name=>'Attrition Analysis Chart Department'
,p_static_id=>'attrition-analysis-chart-department'
,p_title=>'Attrition Chart'
,p_region_name=>'Dept'
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>130
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(6190598304280792952)
,p_region_id=>wwv_flow_imp.id(10157464027840643378)
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
,p_fill_multi_series_gaps=>false
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
 p_id=>wwv_flow_imp.id(6190600073199792953)
,p_chart_id=>wwv_flow_imp.id(6190598304280792952)
,p_static_id=>'attrition-department'
,p_seq=>10
,p_name=>'Attrition Department'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUM(Attrition_Rate) "Attrition Rate",',
'    --    UPPER(pcp_year||''~''||pcp_short_desc) "Label",',
'       UPPER(dept_name) "Label",',
'       dept_id "dept_id",',
'    --    pcp_year "Link"',
'       NULL "Link"',
'FROM',
'(  SELECT emp_bu,',
'         P_loc_id,',
'         ps_emp_new "Employe Joined",',
'         ps_emp_old "Employee Left",',
'         pcp_year,',
'         pcp_period,',
'         pcp_start_date,',
'         pcp_long_desc,',
'         pcp_short_desc,',
'         dept_name,',
'         dept_id,',
'         (total_opn_bal - ps_emp_old_bef) "Opening Balance",',
'         ((total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new) "Employee Closing",',
'         (case when ( (total_opn_bal - ps_emp_old_bef) + ( (total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new) )/2 = 0 then',
'            0',
'          ELSE',
'          ROUND( (ps_emp_old/(((total_opn_bal - ps_emp_old_bef)  + ( (total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new)) /2))*100,2) ',
'          END )Attrition_Rate',
'    FROM (SELECT emp_bu,',
'                 P_loc_id,',
'                 ps_emp_new,',
'                 ps_emp_old,',
'                 pcp_year,',
'                 pcp_period,',
'                 pcp_start_date,',
'                 ps_emp_old_bef,',
'                 pcp_long_desc,',
'                 pcp_short_desc,',
'                 dept_name,',
'                 dept_id,',
'                 ((SELECT COUNT (*)',
'                      FROM employees, emp_active_infos',
'                     WHERE emp_bu = empai_bu',
'                           AND emp_emp_id = empai_emp_id',
'                           AND emp_bu = :global_bu',
'                           and empai_dept_id =  dept_id',
'                           AND TRUNC (emp_start_date) < pcp_start_date',
'                           AND emp_status <> ''E''))',
'                    total_opn_bal',
'            FROM (SELECT   emp_bu,',
'                           P_loc_id,',
'                           SUM (PS_EMP_NEW) AS PS_EMP_NEW,',
'                           SUM (PS_EMP_OLD) AS PS_EMP_OLD,',
'                           SUM (ps_emp_old_bef) ps_emp_old_bef,',
'                           dept_name,',
'                           empai_dept_id as dept_id,',
'                           pcp_year,',
'                           pcp_period,',
'                           pcp_start_date,',
'                           pcp_end_date,',
'                           pcp_long_desc,',
'                           pcp_short_desc',
'                      FROM (SELECT emp_bu,',
'                                   empai_loc_id AS P_loc_id,',
'                                   COUNT (*) ps_emp_new,',
'                                   0 ps_emp_old,',
'                                   0 ps_emp_old_bef,',
'                                   (select (dept_name1) from departments',
'                                          where dept_bu = empai_bu',
'                                            and dept_id = empai_dept_id)dept_name,',
'                                     empai_dept_id,',
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
'                                     AND ( (       ',
'                                            TRUNC (',
'                                               emp_start_date) BETWEEN fp_from_date',
'                                                                   AND fp_end_date))',
'                                   AND (INSTR (:P4011_YEAR || '':'',fp_year || '':'') > 0) ',
'                                   AND ((instr (:P4011_GROUP || '':'', emp_group_id || '':'') > 0) OR :P4011_GROUP IS NULL ) ',
'                            GROUP BY emp_bu,',
'                                     emp_status,',
'                                     empai_bu,',
'                                     empai_dept_id,',
'                                     fp_year,',
'                                     fp_period,',
'                                     fp_from_date,',
'                                     fp_short_desc,',
'                                     fp_long_desc,',
'                                     fp_end_date,',
'                                     empai_loc_id',
'                            UNION ALL',
'                              SELECT emp_bu,',
'                                     empai_loc_id AS P_loc_id,',
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
'                                       (select (dept_name1) from departments',
'                                          where dept_bu = empai_bu',
'                                            and dept_id = empai_dept_id)dept_name,',
'                                     empai_dept_id,  ',
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
'                                   AND (INSTR (:P4011_YEAR || '':'',fp_year || '':'') > 0)',
'                                   AND ((instr (:P4011_GROUP || '':'', emp_group_id || '':'') > 0) OR :P4011_GROUP IS NULL )  ',
'                            GROUP BY emp_bu,',
'                                     emp_status,',
'                                     empai_bu,',
'                                     empai_dept_id,',
'                                     fp_year,',
'                                     fp_period,',
'                                     fp_from_date,',
'                                     fp_short_desc,',
'                                     fp_long_desc,',
'                                     fp_end_date,',
'                                     empai_loc_id',
'                            UNION ALL',
'                              SELECT emp_bu,',
'                                     empai_loc_id AS P_loc_id,',
'                                     0 ps_emp_new,',
'                                     0 ps_emp_old,',
'                                     CASE',
'                                        WHEN emp_status <> ''A'' THEN COUNT (*)',
'                                        ELSE 0',
'                                     END',
'                                        ps_emp_old_bef,',
'                                     (select (dept_name1) from departments',
'                                          where dept_bu = empai_bu',
'                                            and dept_id = empai_dept_id)dept_name,',
'                                     empai_dept_id,  ',
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
'                                     AND (INSTR (:P4011_YEAR || '':'',fp_year || '':'') > 0) ',
'                                     AND ((instr (:P4011_GROUP || '':'', emp_group_id || '':'') > 0) OR :P4011_GROUP IS NULL ) ',
'                            GROUP BY emp_bu,',
'                                     emp_status,',
'                                     empai_bu,',
'                                     empai_dept_id,',
'                                     fp_year,',
'                                     fp_period,',
'                                     fp_from_date,',
'                                     fp_short_desc,',
'                                     fp_long_desc,',
'                                     fp_end_date,',
'                                     empai_loc_id)',
'                  GROUP BY emp_bu,',
'                           pcp_year,',
'                           pcp_period,',
'                           pcp_start_date,',
'                           pcp_end_date,',
'                           pcp_short_desc,',
'                           pcp_long_desc,',
'                           dept_name,',
'                           empai_dept_id,',
'                           P_loc_id))',
'  ORDER BY pcp_period)                         ',
' GROUP BY dept_id,',
'        --   Attrition_Rate,',
'          dept_name',
'        --   pcp_year',
'  Order BY dept_id ASC ',
'',
''))
,p_ajax_items_to_submit=>'P4011_YEAR,P4011_PERIOD,P4011_LOACTION,P4011_GROUP'
,p_series_type=>'bar'
,p_series_name_column_name=>'Link'
,p_items_value_column_name=>'Attrition Rate'
,p_items_label_column_name=>'Label'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:4012:&SESSION.::&DEBUG.::P4012_DEPT_ID,P4012_LOACTION,P4012_PERIOD,P4012_YEAR,P4012_GROUP,P4012_TYPE:&"dept_id".,&P4011_LOACTION.,&P4011_PERIOD.,&P4011_YEAR.,&P4011_GROUP.,D'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(6190598828987792952)
,p_chart_id=>wwv_flow_imp.id(6190598304280792952)
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
 p_id=>wwv_flow_imp.id(6190599437223792953)
,p_chart_id=>wwv_flow_imp.id(6190598304280792952)
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(10207503762211625698)
,p_name=>'Attrition Rate'
,p_static_id=>'attrition-rate'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>140
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--hiddenOverflow:margin-top-none'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--float:t-Cards--animColorFill'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT emp_bu,',
'         P_loc_id,',
'         ps_emp_new "Employe Joined",',
'         ps_emp_old "Employee Left",',
'         pcp_year,',
'         pcp_period,',
'         ps_emp_plnt_id,',
'         pcp_start_date,',
'         pcp_long_desc,',
'         pcp_short_desc,',
'          ps_emp_unit_cent,',
'         (total_opn_bal - ps_emp_old_bef) "Opening Balance",',
'         ( (total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new)  "Employee Closing",',
'         (case when ( (total_opn_bal - ps_emp_old_bef) + ( (total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new) )/2 = 0 then',
'            0',
'         ELSE',
'          ROUND( (ps_emp_old/(((total_opn_bal - ps_emp_old_bef)  + ( (total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new)) /2))*100,2) ',
'          END )" Attrition Rate"',
'    FROM (SELECT emp_bu,',
'                 P_loc_id,',
'                 ps_emp_new,',
'                 ps_emp_old,',
'                 ps_emp_plnt_id,',
'                 pcp_year,',
'                 pcp_period,',
'                 pcp_start_date,',
'                 ps_emp_old_bef,',
'                 pcp_long_desc,',
'                 pcp_short_desc,',
'                  ps_emp_unit_cent,',
'                 ( (SELECT COUNT (*)',
'                      FROM employees, emp_active_infos',
'                     WHERE     emp_bu = empai_bu',
'                           AND emp_emp_id = empai_emp_id',
'                           AND emp_bu = :global_bu',
'                           and empai_plnt = ps_emp_plnt_id',
'                           AND TRUNC (emp_start_date) < pcp_start_date',
'                           AND emp_status <> ''E'' ))',
'                    total_opn_bal',
'            FROM (  SELECT emp_bu,',
'                           P_loc_id,',
'                           SUM (PS_EMP_NEW) AS PS_EMP_NEW,',
'                           SUM (PS_EMP_OLD) AS PS_EMP_OLD,',
'                           SUM (ps_emp_old_bef) ps_emp_old_bef,',
'                           ps_emp_unit_cent,',
'                           ps_emp_plnt_id,',
'                           pcp_year,',
'                           pcp_period,',
'                           pcp_start_date,',
'                           pcp_end_date,',
'                           pcp_long_desc,',
'                           pcp_short_desc',
'                      FROM (  SELECT emp_bu,',
'                                     empai_loc_id AS P_loc_id,',
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
'                               WHERE emp_bu = :global_bu',
'                                     AND empai_bu = emp_bu',
'                                     AND empai_emp_id = emp_emp_id',
'                                     AND emp_emp_id NOT LIKE (''ERP%'')',
'                                     AND fp_bu = emp_bu',
'                                     AND ( (         ',
'                                            TRUNC (',
'                                               emp_start_date) BETWEEN fp_from_date',
'                                                                   AND fp_end_date))',
'                                     AND (INSTR(:P401_LOACTION || '':'', EMPAI_LOC_ID || '':'') > 0)',
'                                     AND (INSTR (:P401_YEAR || '':'',fp_year || '':'') > 0)',
'                            GROUP BY emp_bu,',
'                                     emp_status,',
'                                     empai_plnt,',
'                                     empai_bu,',
'                                     fp_year,',
'                                     fp_period,',
'                                     fp_from_date,',
'                                     fp_short_desc,',
'                                     fp_long_desc,',
'                                     fp_end_date,',
'                                     empai_loc_id',
'                            UNION ALL',
'                              SELECT emp_bu,',
'                                     empai_loc_id AS P_loc_id,',
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
'                                     AND (INSTR(:P401_LOACTION || '':'', EMPAI_LOC_ID || '':'') > 0)',
'                                     AND (INSTR (:P401_YEAR || '':'',fp_year || '':'') > 0) ',
'                            GROUP BY emp_bu,',
'                                     emp_status,',
'                                     empai_plnt,',
'                                     empai_bu,',
'                                     fp_year,',
'                                     fp_period,',
'                                     fp_from_date,',
'                                     fp_short_desc,',
'                                     fp_long_desc,',
'                                     fp_end_date,',
'                                     empai_loc_id',
'                            UNION ALL',
'                              SELECT emp_bu,',
'                                     empai_loc_id AS P_loc_id,',
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
'                                     AND (INSTR(:P401_LOACTION || '':'', EMPAI_LOC_ID || '':'') > 0)',
'                                     AND (INSTR (:P401_YEAR || '':'',fp_year || '':'') > 0)',
'                            GROUP BY emp_bu,',
'                                     emp_status,',
'                                     empai_plnt,',
'                                     empai_bu,',
'                                     fp_year,',
'                                     fp_period,',
'                                     fp_from_date,',
'                                     fp_short_desc,',
'                                     fp_long_desc,',
'                                     fp_end_date,',
'                                     empai_loc_id)',
'                  GROUP BY emp_bu,',
'                           pcp_year,',
'                           pcp_period,',
'                           pcp_start_date,',
'                           pcp_end_date,',
'                           pcp_short_desc,',
'                           ps_emp_unit_cent,',
'                           ps_emp_plnt_id,',
'                           pcp_long_desc,',
'                           P_loc_id))',
'ORDER BY pcp_period'))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P4011_YEAR,P4011_PERIOD,P4011_UNIT'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650529407172505378)
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
 p_id=>wwv_flow_imp.id(6190606238263792959)
,p_query_column_id=>14
,p_column_alias=>' Attrition Rate'
,p_column_display_sequence=>150
,p_column_heading=>' Attrition Rate'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190601046350792955)
,p_query_column_id=>1
,p_column_alias=>'EMP_BU'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190601838110792956)
,p_query_column_id=>3
,p_column_alias=>'Employe Joined'
,p_column_display_sequence=>30
,p_column_heading=>'Employe Joined'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190605820157792959)
,p_query_column_id=>13
,p_column_alias=>'Employee Closing'
,p_column_display_sequence=>120
,p_column_heading=>'Employee Closing'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190602219806792956)
,p_query_column_id=>4
,p_column_alias=>'Employee Left'
,p_column_display_sequence=>40
,p_column_heading=>'Employee Left'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190605436931792959)
,p_query_column_id=>12
,p_column_alias=>'Opening Balance'
,p_column_display_sequence=>110
,p_column_heading=>'Opening Balance'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190604269441792958)
,p_query_column_id=>9
,p_column_alias=>'PCP_LONG_DESC'
,p_column_display_sequence=>80
,p_column_heading=>'Pcp Long Desc'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190602989323792956)
,p_query_column_id=>6
,p_column_alias=>'PCP_PERIOD'
,p_column_display_sequence=>60
,p_column_heading=>'Pcp Period'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190604673891792958)
,p_query_column_id=>10
,p_column_alias=>'PCP_SHORT_DESC'
,p_column_display_sequence=>90
,p_column_heading=>'Pcp Short Desc'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190603811085792958)
,p_query_column_id=>8
,p_column_alias=>'PCP_START_DATE'
,p_column_display_sequence=>70
,p_column_heading=>'Pcp Start Date'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190602612100792956)
,p_query_column_id=>5
,p_column_alias=>'PCP_YEAR'
,p_column_display_sequence=>50
,p_column_heading=>'Pcp Year'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190603456630792958)
,p_query_column_id=>7
,p_column_alias=>'PS_EMP_PLNT_ID'
,p_column_display_sequence=>130
,p_column_heading=>'Ps Emp Plnt Id'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190604994571792958)
,p_query_column_id=>11
,p_column_alias=>'PS_EMP_UNIT_CENT'
,p_column_display_sequence=>140
,p_column_heading=>'Ps Emp Unit Cent'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6190601458087792956)
,p_query_column_id=>2
,p_column_alias=>'P_LOC_ID'
,p_column_display_sequence=>20
,p_column_heading=>'P Loc Id'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13340930623806287169)
,p_plug_name=>'<b>Month</b>'
,p_static_id=>'b-month-b'
,p_region_name=>'MTH'
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_region_attributes=>'style=display:none;'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT emp_bu,',
'         pcp_year,',
'         pcp_period,',
'         pcp_start_date,',
'         pcp_long_desc,',
'         pcp_short_desc,',
'         ps_emp_new "Employe Joined",',
'         ps_emp_old "Employee Left",',
'         (total_opn_bal - ps_emp_old_bef) "Opening Balance",',
'         ( (total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new) "Employee Closing",',
'          (case when ( (total_opn_bal - ps_emp_old_bef) + ( (total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new) )/2 = 0 then',
'            0',
'         ELSE',
'          ROUND( (ps_emp_old/(((total_opn_bal - ps_emp_old_bef)  + ( (total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new)) /2))*100,2) ',
'          END )" Attrition Rate"',
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
'                                     AND ( (        ',
'                                            TRUNC (',
'                                               emp_start_date) BETWEEN fp_from_date',
'                                                                   AND fp_end_date))',
'                                      AND (INSTR(:P4011_LOACTION || '':'', EMPAI_LOC_ID || '':'') > 0)',
'                                     AND (INSTR (:P4011_YEAR || '':'',fp_year || '':'') > 0) ',
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
'                                     AND (INSTR(:P4011_LOACTION || '':'', EMPAI_LOC_ID || '':'') > 0)',
'                                     AND (INSTR (:P4011_YEAR || '':'',fp_year || '':'') > 0)                                    ',
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
'                                     AND (INSTR(:P4011_LOACTION || '':'', EMPAI_LOC_ID || '':'') > 0)',
'                                     AND (INSTR (:P4011_YEAR || '':'',fp_year || '':'') > 0)       ',
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
'ORDER BY pcp_period'))
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(6190608601001792962)
,p_region_id=>wwv_flow_imp.id(13340930623806287169)
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
,p_fill_multi_series_gaps=>false
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
 p_id=>wwv_flow_imp.id(6190610358369792962)
,p_chart_id=>wwv_flow_imp.id(6190608601001792962)
,p_static_id=>'attrition-month'
,p_seq=>10
,p_name=>'Attrition Month'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUM(Attrition_Rate) "Attrition Rate",',
'    --    UPPER(pcp_year||''~''||pcp_short_desc) "Label",',
'       UPPER(pcp_short_desc) "Label",',
'       pcp_period "Period",',
'    --    pcp_year "Link"',
'       NULL "Link"',
'FROM',
'(  SELECT emp_bu,',
'         P_loc_id,',
'         ps_emp_new "Employe Joined",',
'         ps_emp_old "Employee Left",',
'         pcp_year,',
'         pcp_period,',
'         pcp_start_date,',
'         pcp_long_desc,',
'         pcp_short_desc,',
'         dept_name,',
'         (total_opn_bal - ps_emp_old_bef) "Opening Balance",',
'         ((total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new) "Employee Closing",',
'         (case when ( (total_opn_bal - ps_emp_old_bef) + ( (total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new) )/2 = 0 then',
'            0',
'          ELSE',
'          ROUND( (ps_emp_old/(((total_opn_bal - ps_emp_old_bef)  + ( (total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new)) /2))*100,2) ',
'          END )Attrition_Rate',
'    FROM (SELECT emp_bu,',
'                 P_loc_id,',
'                 ps_emp_new,',
'                 ps_emp_old,',
'                 pcp_year,',
'                 pcp_period,',
'                 pcp_start_date,',
'                 ps_emp_old_bef,',
'                 pcp_long_desc,',
'                 pcp_short_desc,',
'                 dept_name,',
'                 ((SELECT COUNT (*)',
'                      FROM employees, emp_active_infos',
'                     WHERE emp_bu = empai_bu',
'                           AND emp_emp_id = empai_emp_id',
'                           AND emp_bu = :global_bu',
'                           and empai_dept_id =  dept_id',
'                           AND TRUNC (emp_start_date) < pcp_start_date',
'                           AND emp_status <> ''E''))',
'                    total_opn_bal',
'            FROM (SELECT   emp_bu,',
'                           P_loc_id,',
'                           SUM (PS_EMP_NEW) AS PS_EMP_NEW,',
'                           SUM (PS_EMP_OLD) AS PS_EMP_OLD,',
'                           SUM (ps_emp_old_bef) ps_emp_old_bef,',
'                           dept_name,',
'                           empai_dept_id as dept_id,',
'                           pcp_year,',
'                           pcp_period,',
'                           pcp_start_date,',
'                           pcp_end_date,',
'                           pcp_long_desc,',
'                           pcp_short_desc',
'                      FROM (SELECT emp_bu,',
'                                   empai_loc_id AS P_loc_id,',
'                                   COUNT (*) ps_emp_new,',
'                                   0 ps_emp_old,',
'                                   0 ps_emp_old_bef,',
'                                   (select (dept_name1) from departments',
'                                          where dept_bu = empai_bu',
'                                            and dept_id = empai_dept_id)dept_name,',
'                                     empai_dept_id,',
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
'                                     AND ( (       ',
'                                            TRUNC (',
'                                               emp_start_date) BETWEEN fp_from_date',
'                                                                   AND fp_end_date))',
'                                   AND (INSTR (:P4011_YEAR || '':'',fp_year || '':'') > 0) ',
'                                   AND ((instr (:P4011_GROUP || '':'', emp_group_id || '':'') > 0) OR :P4011_GROUP IS NULL ) ',
'                            GROUP BY emp_bu,',
'                                     emp_status,',
'                                     empai_bu,',
'                                     empai_dept_id,',
'                                     fp_year,',
'                                     fp_period,',
'                                     fp_from_date,',
'                                     fp_short_desc,',
'                                     fp_long_desc,',
'                                     fp_end_date,',
'                                     empai_loc_id',
'                            UNION ALL',
'                              SELECT emp_bu,',
'                                     empai_loc_id AS P_loc_id,',
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
'                                       (select (dept_name1) from departments',
'                                          where dept_bu = empai_bu',
'                                            and dept_id = empai_dept_id)dept_name,',
'                                     empai_dept_id,  ',
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
'                                   AND (INSTR (:P4011_YEAR || '':'',fp_year || '':'') > 0) ',
'                                   AND ((instr (:P4011_GROUP || '':'', emp_group_id || '':'') > 0) OR :P4011_GROUP IS NULL ) ',
'                            GROUP BY emp_bu,',
'                                     emp_status,',
'                                     empai_bu,',
'                                     empai_dept_id,',
'                                     fp_year,',
'                                     fp_period,',
'                                     fp_from_date,',
'                                     fp_short_desc,',
'                                     fp_long_desc,',
'                                     fp_end_date,',
'                                     empai_loc_id',
'                            UNION ALL',
'                              SELECT emp_bu,',
'                                     empai_loc_id AS P_loc_id,',
'                                     0 ps_emp_new,',
'                                     0 ps_emp_old,',
'                                     CASE',
'                                        WHEN emp_status <> ''A'' THEN COUNT (*)',
'                                        ELSE 0',
'                                     END',
'                                        ps_emp_old_bef,',
'                                     (select (dept_name1) from departments',
'                                          where dept_bu = empai_bu',
'                                            and dept_id = empai_dept_id)dept_name,',
'                                     empai_dept_id,  ',
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
'                                     AND (INSTR (:P4011_YEAR || '':'',fp_year || '':'') > 0) ',
'                                     AND ((instr (:P4011_GROUP || '':'', emp_group_id || '':'') > 0) OR :P4011_GROUP IS NULL ) ',
'                            GROUP BY emp_bu,',
'                                     emp_status,',
'                                     empai_bu,',
'                                     empai_dept_id,',
'                                     fp_year,',
'                                     fp_period,',
'                                     fp_from_date,',
'                                     fp_short_desc,',
'                                     fp_long_desc,',
'                                     fp_end_date,',
'                                     empai_loc_id)',
'                  GROUP BY emp_bu,',
'                           pcp_year,',
'                           pcp_period,',
'                           pcp_start_date,',
'                           pcp_end_date,',
'                           pcp_short_desc,',
'                           pcp_long_desc,',
'                           dept_name,',
'                           empai_dept_id,',
'                           P_loc_id))',
'  ORDER BY pcp_period)                         ',
' GROUP BY pcp_period,',
'        --   Attrition_Rate,',
'          pcp_short_desc',
'        --   pcp_year',
'  Order BY pcp_period ASC ',
'',
''))
,p_ajax_items_to_submit=>'P4011_YEAR,P4011_PERIOD,P4011_LOACTION,P4011_GROUP'
,p_series_type=>'bar'
,p_items_value_column_name=>'Attrition Rate'
,p_items_label_column_name=>'Label'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:4013:&SESSION.::&DEBUG.::P4013_PERIOD,P4013_YEAR,P4013_TYPE,P4013_GROUP:&"Label".,&P4011_YEAR.,M,&P4011_GROUP.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(6190609138909792962)
,p_chart_id=>wwv_flow_imp.id(6190608601001792962)
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
 p_id=>wwv_flow_imp.id(6190609717960792962)
,p_chart_id=>wwv_flow_imp.id(6190608601001792962)
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
 p_id=>wwv_flow_imp.id(13342431252819259063)
,p_plug_name=>'<b>Units</b>'
,p_static_id=>'b-units-b'
,p_region_name=>'UNIT'
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_region_attributes=>'style=display:none;'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT emp_bu,',
'         P_loc_id,',
'         ps_emp_new "Employe Joined",',
'         ps_emp_old "Employee Left",',
'         pcp_year,',
'         pcp_period,',
'         ps_emp_plnt_id,',
'         pcp_start_date,',
'         pcp_long_desc,',
'         pcp_short_desc,',
'          ps_emp_unit_cent,',
'         (total_opn_bal - ps_emp_old_bef) "Opening Balance",',
'         ( (total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new)  "Employee Closing",',
'         (case when ( (total_opn_bal - ps_emp_old_bef) + ( (total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new) )/2 = 0 then',
'            0',
'         ELSE',
'          ROUND( (ps_emp_old/(((total_opn_bal - ps_emp_old_bef)  + ( (total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new)) /2))*100,2) ',
'          END )" Attrition Rate"',
'    FROM (SELECT emp_bu,',
'                 P_loc_id,',
'                 ps_emp_new,',
'                 ps_emp_old,',
'                 ps_emp_plnt_id,',
'                 pcp_year,',
'                 pcp_period,',
'                 pcp_start_date,',
'                 ps_emp_old_bef,',
'                 pcp_long_desc,',
'                 pcp_short_desc,',
'                  ps_emp_unit_cent,',
'                 ( (SELECT COUNT (*)',
'                      FROM employees, emp_active_infos',
'                     WHERE     emp_bu = empai_bu',
'                           AND emp_emp_id = empai_emp_id',
'                           AND emp_bu = :global_bu',
'                           and empai_plnt = ps_emp_plnt_id',
'                           AND TRUNC (emp_start_date) < pcp_start_date',
'                           AND emp_status <> ''E'' ))',
'                    total_opn_bal',
'            FROM (  SELECT emp_bu,',
'                           P_loc_id,',
'                           SUM (PS_EMP_NEW) AS PS_EMP_NEW,',
'                           SUM (PS_EMP_OLD) AS PS_EMP_OLD,',
'                           SUM (ps_emp_old_bef) ps_emp_old_bef,',
'                           ps_emp_unit_cent,',
'                           ps_emp_plnt_id,',
'                           pcp_year,',
'                           pcp_period,',
'                           pcp_start_date,',
'                           pcp_end_date,',
'                           pcp_long_desc,',
'                           pcp_short_desc',
'                      FROM (  SELECT emp_bu,',
'                                     empai_loc_id AS P_loc_id,',
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
'                               WHERE emp_bu = :global_bu',
'                                     AND empai_bu = emp_bu',
'                                     AND empai_emp_id = emp_emp_id',
'                                     AND emp_emp_id NOT LIKE (''ERP%'')',
'                                     AND fp_bu = emp_bu',
'                                     AND ( (         ',
'                                            TRUNC (',
'                                               emp_start_date) BETWEEN fp_from_date',
'                                                                   AND fp_end_date))',
'                                     AND (INSTR(:P4011_LOACTION || '':'', EMPAI_LOC_ID || '':'') > 0)',
'                                     AND (INSTR (:P4011_YEAR || '':'',fp_year || '':'') > 0)',
'                            GROUP BY emp_bu,',
'                                     emp_status,',
'                                     empai_plnt,',
'                                     empai_bu,',
'                                     fp_year,',
'                                     fp_period,',
'                                     fp_from_date,',
'                                     fp_short_desc,',
'                                     fp_long_desc,',
'                                     fp_end_date,',
'                                     empai_loc_id',
'                            UNION ALL',
'                              SELECT emp_bu,',
'                                     empai_loc_id AS P_loc_id,',
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
'                                     AND (INSTR(:P4011_LOACTION || '':'', EMPAI_LOC_ID || '':'') > 0)',
'                                     AND (INSTR (:P4011_YEAR || '':'',fp_year || '':'') > 0) ',
'                            GROUP BY emp_bu,',
'                                     emp_status,',
'                                     empai_plnt,',
'                                     empai_bu,',
'                                     fp_year,',
'                                     fp_period,',
'                                     fp_from_date,',
'                                     fp_short_desc,',
'                                     fp_long_desc,',
'                                     fp_end_date,',
'                                     empai_loc_id',
'                            UNION ALL',
'                              SELECT emp_bu,',
'                                     empai_loc_id AS P_loc_id,',
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
'                                      AND (INSTR(:P4011_LOACTION || '':'', EMPAI_LOC_ID || '':'') > 0)',
'                                     AND (INSTR (:P4011_YEAR || '':'',fp_year || '':'') > 0)',
'                            GROUP BY emp_bu,',
'                                     emp_status,',
'                                     empai_plnt,',
'                                     empai_bu,',
'                                     fp_year,',
'                                     fp_period,',
'                                     fp_from_date,',
'                                     fp_short_desc,',
'                                     fp_long_desc,',
'                                     fp_end_date,',
'                                     empai_loc_id)',
'                  GROUP BY emp_bu,',
'                           pcp_year,',
'                           pcp_period,',
'                           pcp_start_date,',
'                           pcp_end_date,',
'                           pcp_short_desc,',
'                           ps_emp_unit_cent,',
'                           ps_emp_plnt_id,',
'                           pcp_long_desc,',
'                           P_loc_id))',
'ORDER BY pcp_period'))
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(6190611318825792966)
,p_region_id=>wwv_flow_imp.id(13342431252819259063)
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
 p_id=>wwv_flow_imp.id(6190613040981792967)
,p_chart_id=>wwv_flow_imp.id(6190611318825792966)
,p_static_id=>'attrition-unit'
,p_seq=>10
,p_name=>'Attrition Unit'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT SUM(Attrition_Rate) "Attrition Rate",',
'       UPPER(unit_name) "Label",',
'       plnt_id "plnt_id",',
'       NULL "Link"',
'FROM',
'(  SELECT emp_bu,',
'         P_loc_id,',
'         ps_emp_new "Employe Joined",',
'         ps_emp_old "Employee Left",',
'         pcp_year,',
'         pcp_period,',
'         pcp_start_date,',
'         pcp_long_desc,',
'         pcp_short_desc,',
'         unit_name,',
'         plnt_id,',
'         (total_opn_bal - ps_emp_old_bef) "Opening Balance",',
'         ((total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new) "Employee Closing",',
'         (case when ( (total_opn_bal - ps_emp_old_bef) + ( (total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new) )/2 = 0 then',
'            0',
'          ELSE',
'          ROUND( (ps_emp_old/(((total_opn_bal - ps_emp_old_bef)  + ( (total_opn_bal - ps_emp_old_bef) - ps_emp_old + ps_emp_new)) /2))*100,2) ',
'          END )Attrition_Rate',
'    FROM (SELECT emp_bu,',
'                 P_loc_id,',
'                 ps_emp_new,',
'                 ps_emp_old,',
'                 pcp_year,',
'                 pcp_period,',
'                 pcp_start_date,',
'                 ps_emp_old_bef,',
'                 pcp_long_desc,',
'                 pcp_short_desc,',
'                 unit_name,',
'                 plnt_id,',
'                 ((SELECT COUNT (*)',
'                      FROM employees, emp_active_infos',
'                     WHERE emp_bu = empai_bu',
'                           AND emp_emp_id = empai_emp_id',
'                           AND emp_bu = :global_bu',
'                           and empai_plnt =  plnt_id',
'                           AND TRUNC (emp_start_date) < pcp_start_date',
'                           AND emp_status <> ''E''))',
'                    total_opn_bal',
'            FROM (SELECT   emp_bu,',
'                           P_loc_id,',
'                           SUM (PS_EMP_NEW) AS PS_EMP_NEW,',
'                           SUM (PS_EMP_OLD) AS PS_EMP_OLD,',
'                           SUM (ps_emp_old_bef) ps_emp_old_bef,',
'                           unit_name,',
'                           empai_plnt as plnt_id,',
'                           pcp_year,',
'                           pcp_period,',
'                           pcp_start_date,',
'                           pcp_end_date,',
'                           pcp_long_desc,',
'                           pcp_short_desc',
'                      FROM (SELECT emp_bu,',
'                                   empai_loc_id AS P_loc_id,',
'                                   COUNT (*) ps_emp_new,',
'                                   0 ps_emp_old,',
'                                   0 ps_emp_old_bef,',
'                                   ( SELECT bup_name1',
'                                       FROM bus_unit_plants',
'                                      WHERE bup_bu = :GLOBAL_BU',
'                                        AND bup_plant_id = empai_plnt)unit_name,',
'                                     empai_plnt,',
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
'                                     AND ( (       ',
'                                            TRUNC (',
'                                               emp_start_date) BETWEEN fp_from_date',
'                                                                   AND fp_end_date))',
'                                   AND (INSTR (:P4011_YEAR || '':'',fp_year || '':'') > 0) ',
'                                   AND ((instr (:P4011_GROUP || '':'', emp_group_id || '':'') > 0) OR :P4011_GROUP IS NULL ) ',
'                            GROUP BY emp_bu,',
'                                     emp_status,',
'                                     empai_bu,',
'                                     empai_plnt,',
'                                     fp_year,',
'                                     fp_period,',
'                                     fp_from_date,',
'                                     fp_short_desc,',
'                                     fp_long_desc,',
'                                     fp_end_date,',
'                                     empai_loc_id',
'                            UNION ALL',
'                              SELECT emp_bu,',
'                                     empai_loc_id AS P_loc_id,',
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
'                                      (SELECT bup_name1',
'                                         FROM bus_unit_plants',
'                                        WHERE bup_bu = :GLOBAL_BU',
'                                          AND bup_plant_id = empai_plnt )unit_name,',
'                                     empai_plnt,  ',
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
'                                   AND (INSTR (:P4011_YEAR || '':'',fp_year || '':'') > 0) ',
'                                   AND ((instr (:P4011_GROUP || '':'', emp_group_id || '':'') > 0) OR :P4011_GROUP IS NULL ) ',
'                            GROUP BY emp_bu,',
'                                     emp_status,',
'                                     empai_bu,',
'                                     empai_plnt,',
'                                     fp_year,',
'                                     fp_period,',
'                                     fp_from_date,',
'                                     fp_short_desc,',
'                                     fp_long_desc,',
'                                     fp_end_date,',
'                                     empai_loc_id',
'                            UNION ALL',
'                              SELECT emp_bu,',
'                                     empai_loc_id AS P_loc_id,',
'                                     0 ps_emp_new,',
'                                     0 ps_emp_old,',
'                                     CASE',
'                                        WHEN emp_status <> ''A'' THEN COUNT (*)',
'                                        ELSE 0',
'                                     END',
'                                        ps_emp_old_bef,',
'                                    (SELECT bup_name1',
'                                       FROM bus_unit_plants',
'                                      WHERE bup_bu = :GLOBAL_BU',
'                                        AND bup_plant_id = empai_plnt)unit_name,',
'                                     empai_plnt,  ',
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
'                                     AND (INSTR (:P4011_YEAR || '':'',fp_year || '':'') > 0)',
'                                     AND ((instr (:P4011_GROUP || '':'', emp_group_id || '':'') > 0) OR :P4011_GROUP IS NULL )  ',
'                            GROUP BY emp_bu,',
'                                     emp_status,',
'                                     empai_bu,',
'                                     empai_plnt,',
'                                     fp_year,',
'                                     fp_period,',
'                                     fp_from_date,',
'                                     fp_short_desc,',
'                                     fp_long_desc,',
'                                     fp_end_date,',
'                                     empai_loc_id)',
'                  GROUP BY emp_bu,',
'                           pcp_year,',
'                           pcp_period,',
'                           pcp_start_date,',
'                           pcp_end_date,',
'                           pcp_short_desc,',
'                           pcp_long_desc,',
'                           unit_name,',
'                           empai_plnt,',
'                           P_loc_id))',
'  ORDER BY pcp_period)                         ',
' GROUP BY plnt_id,',
'          unit_name',
'  Order BY plnt_id ASC ',
'',
''))
,p_ajax_items_to_submit=>'P4011_YEAR,P4011_PERIOD,P4011_LOACTION,P4011_GROUP'
,p_series_type=>'bar'
,p_items_value_column_name=>'Attrition Rate'
,p_items_label_column_name=>'Label'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:4014:&SESSION.::&DEBUG.::P4014_GROUP,P4014_YEAR,P4014_TYPE,P4014_UNIT:&P4011_GROUP.,&P4011_YEAR.,U,&"plnt_id".'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(6190611788680792966)
,p_chart_id=>wwv_flow_imp.id(6190611318825792966)
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
 p_id=>wwv_flow_imp.id(6190612425848792966)
,p_chart_id=>wwv_flow_imp.id(6190611318825792966)
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
 p_id=>wwv_flow_imp.id(29393528325575215700)
,p_plug_name=>'<span class="t-Icon fa fa-filter" aria-hidden="true" style="margin-left: 5px; margin-top: 4px;"></span> Filters'
,p_static_id=>'span-class-t-icon-fa-fa-filter-aria-hidden-true-style-margin-left-5px-margin-top-4px-span-filters'
,p_region_css_classes=>'side-filters'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--controlsPosEnd:is-expanded:t-Region--noUI:t-Region--scrollBody:t-Form--noPadding'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13340930243602287165)
,p_plug_name=>'Tab_Button'
,p_static_id=>'tab-button'
,p_region_template_options=>'#DEFAULT#:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6190614423244792969)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(29393528325575215700)
,p_button_name=>'Clear'
,p_static_id=>'clear'
,p_button_static_id=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--warning:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Clear'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6190607046736792959)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(13340930243602287165)
,p_button_name=>'Dept'
,p_static_id=>'dept'
,p_button_static_id=>'D'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Department Wise Attrition Count'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6190614083200792969)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(29393528325575215700)
,p_button_name=>'Generate'
,p_static_id=>'generate'
,p_button_static_id=>'BT1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Generate'
,p_button_css_classes=>'savebtn'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6190607388328792961)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(13340930243602287165)
,p_button_name=>'Month'
,p_static_id=>'month'
,p_button_static_id=>'M'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Month Wise Attrition Count'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6190607849353792961)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(13340930243602287165)
,p_button_name=>'Unit'
,p_static_id=>'unit'
,p_button_static_id=>'U'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Unit Wise Attrition Count'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9847022012066883371)
,p_name=>'P4011_GROUP'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(29393528325575215700)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT eg_group_id ',
'  FROM emp_groups',
' WHERE eg_bu = :GLOBAL_BU',
'   AND eg_active_flag = ''Y'''))
,p_item_default_type=>'SQL_QUERY_COLON'
,p_prompt=>'<b> Group </b>'
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
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(13688895249615281112)
,p_name=>'P4011_LOACTION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(29393528325575215700)
,p_prompt=>'<b>Loaction</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_named_lov=>'UNIT_LOC35'
,p_cSize=>30
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-left-sm'
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
 p_id=>wwv_flow_imp.id(13557256883074019204)
,p_name=>'P4011_LOCATIONS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(29393528325575215700)
,p_item_default=>'Y'
,p_prompt=>'<b>Select all</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13557266332127033061)
,p_name=>'P4011_MONTH'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(29393528325575215700)
,p_item_default=>'Y'
,p_prompt=>'<b>Select all</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_grid_column=>9
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13694926086591362514)
,p_name=>'P4011_PERIOD'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(29393528325575215700)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT FP_PERIOD ',
' FROM fin_periods',
'WHERE fP_bu = :GLOBAL_BU',
'  AND (FP_YEAR = :P4011_YEAR OR :P4011_YEAR IS NULL)',
'  ORDER BY FP_PERIOD; '))
,p_item_default_type=>'SQL_QUERY_COLON'
,p_prompt=>'<B>Month</B>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT DISTINCT INITCAP(FP_SHORT_DESC)FP_SHORT_DESC ,FP_PERIOD ',
' FROM fin_periods',
'WHERE fP_bu = :GLOBAL_BU',
'  AND ((INSTR (:P4011_YEAR || '':'', fp_year || '':'') > 0) )',
'  ORDER BY FP_PERIOD; '))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-left-sm'
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
 p_id=>wwv_flow_imp.id(16837248045768784296)
,p_name=>'P4011_UNIT'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(29393528325575215700)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'if :P4011_DUMMY = 0 THEN ',
'SELECT LISTAGG(bup_plant_id,'':'') WITHIN GROUP (ORDER BY bup_plant_id) INTO :P4011_UNIT',
'FROM(SELECT  bup_bu || '' - '' || bup_name1,bup_plant_id ',
' FROM  bus_unit_plants',
'WHERE bup_bu=:GLOBAL_BU',
'ORDER BY bup_plant_id);',
'END IF;',
'RETURN :P4011_UNIT;',
'END;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Unit'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_named_lov=>'UNIT2'
,p_cSize=>30
,p_colspan=>3
,p_display_when=>':P4011_TYPE = ''UNIT'''
,p_display_when2=>'SQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-left-sm'
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
 p_id=>wwv_flow_imp.id(16837247946060784296)
,p_name=>'P4011_YEAR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(29393528325575215700)
,p_item_default=>':Global_year'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'<b>Year</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT fy_year, fy_year year',
'    FROM fin_years',
'   WHERE fy_bu = :global_bu AND ROWNUM <= 5 AND fy_year <= :global_year',
'ORDER BY fy_year DESC'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-left-sm'
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190618079308792972)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190614423244792969)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190618510211792972)
,p_event_id=>wwv_flow_imp.id(6190618079308792972)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P4011_LOACTION,P4011_LOCATIONS,P4011_MONTH'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190624302729792975)
,p_name=>'Department_Wise_head_Count'
,p_static_id=>'department-wise-head-count'
,p_event_sequence=>180
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190607046736792959)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190624880136792975)
,p_event_id=>wwv_flow_imp.id(6190624302729792975)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item(''Dept'').show();',
    'apex.item(''MTH'').hide();',
    'apex.item(''UNIT'').hide();',
    ' $("#D").css({''background-color'': ''orange''});',
    ' $("#D").css({''color'': ''white''});',
    ' $("#M").css({''background-color'': ''#3ead2a''});',
    ' $("#M").css({''color'': ''white''});',
    ' $("#U").css({''background-color'': ''#3ead2a''});',
    ' $("#U").css({''color'': ''white''});')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190622488587792973)
,p_name=>'IR_COL'
,p_static_id=>'ir-col'
,p_event_sequence=>100
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190623040163792973)
,p_event_id=>wwv_flow_imp.id(6190622488587792973)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-com-clarifit-apexplugin-ir-column-grouping'
,p_action=>'PLUGIN_COM.CLARIFIT.APEXPLUGIN.IR_COLUMN_GROUPING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'true')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190625262986792975)
,p_name=>'Month_Wise_head_count'
,p_static_id=>'month-wise-head-count'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190607388328792961)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190625711852792975)
,p_event_id=>wwv_flow_imp.id(6190625262986792975)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item(''MTH'').show();',
    'apex.item(''Dept'').hide();',
    'apex.item(''UNIT'').hide();',
    '$("#M").css({''background-color'': ''orange''});',
    ' $("#M").css({''color'': ''white''});',
    ' $("#U").css({''background-color'': ''#3ead2a''});',
    ' $("#U").css({''color'': ''white''});',
    '  $("#D").css({''background-color'': ''#3ead2a''});',
    ' $("#D").css({''color'': ''white''});')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190619875151792972)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4011_AS_ON_DATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190620321833792972)
,p_event_id=>wwv_flow_imp.id(6190619875151792972)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190621593519792973)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4011_PERIOD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190622137655792973)
,p_event_id=>wwv_flow_imp.id(6190621593519792973)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190623446516792973)
,p_name=>'New_2'
,p_static_id=>'new-3'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4011_YEAR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190623907047792973)
,p_event_id=>wwv_flow_imp.id(6190623446516792973)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P4011_PERIOD',
  'items_to_submit', 'P4011_YEAR',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT LISTAGG(fp_short_desc,'':'') WITHIN GROUP (ORDER BY fp_period) into :P4011_PERIOD',
    '    FROM fin_periods',
    '   WHERE fP_bu = :GLOBAL_BU',
    '          AND INSTR (NVL (:P4011_YEAR, :global_year) || '':'', fp_year || '':'') > 0',
    'ORDER BY FP_PERIOD;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190627036010792975)
,p_name=>'SELECT / UN SELECT'
,p_static_id=>'select-un-select'
,p_event_sequence=>210
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4011_LOCATIONS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190627551931792975)
,p_event_id=>wwv_flow_imp.id(6190627036010792975)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P4011_LOACTION',
  'items_to_submit', 'P4011_LOCATIONS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT CASE WHEN :P4011_LOCATIONS = ''Y'' ',
    '            THEN LISTAGG(bupld_loc_id,'':'') WITHIN GROUP (ORDER BY bupld_loc_id) ELSE NULL END ',
    '  INTO :P4011_LOACTION',
    '  FROM bus_unit_plants_loc_dtls',
    ' WHERE BUPLD_BU = :GLOBAL_BU;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190627898189792977)
,p_name=>'Select / Unselect'
,p_static_id=>'select-unselect'
,p_event_sequence=>220
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4011_MONTH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190628397572792977)
,p_event_id=>wwv_flow_imp.id(6190627898189792977)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P4011_PERIOD',
  'items_to_submit', 'P4011_MONTH',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ' SELECT CASE WHEN :P4011_MONTH = ''Y'' ',
    '            THEN LISTAGG(FP_short_desc,'':'') WITHIN GROUP (ORDER BY FP_PERIOD) ELSE NULL END ',
    '      INTO :P4011_PERIOD',
    '      FROM fin_periods',
    '     WHERE fP_bu = :GLOBAL_BU',
    '       AND INSTR (:P4011_YEAR || '':'', fp_year || '':'') > 0 ;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190628841399792977)
,p_name=>'Select / Unselect1'
,p_static_id=>'select-unselect-2'
,p_event_sequence=>230
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4011_GROUP_ALL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190629348679792977)
,p_event_id=>wwv_flow_imp.id(6190628841399792977)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ' SELECT CASE WHEN :P4011_MONTH = ''Y'' ',
    '             THEN LISTAGG(eg_group_id,'':'') WITHIN GROUP (ORDER BY eg_group_id) ELSE NULL END ',
    '   INTO :P4011_PERIOD',
    '   FROM emp_groups',
    '  WHERE eg_bu = :GLOBAL_BU;',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190618941176792972)
,p_name=>'SUBMIT'
,p_static_id=>'submit'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4011_DUMMY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190619433184792972)
,p_event_id=>wwv_flow_imp.id(6190618941176792972)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190620731035792973)
,p_name=>'Submit'
,p_static_id=>'submit-2'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4011_CUSTOMER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190621252370792973)
,p_event_id=>wwv_flow_imp.id(6190620731035792973)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190617095344792970)
,p_name=>'Unit'
,p_static_id=>'unit'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4011_UNIT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190617589635792972)
,p_event_id=>wwv_flow_imp.id(6190617095344792970)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190626178094792975)
,p_name=>'Unit_Wise_Head_count'
,p_static_id=>'unit-wise-head-count'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190607849353792961)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190626683515792975)
,p_event_id=>wwv_flow_imp.id(6190626178094792975)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item(''UNIT'').show();',
    'apex.item(''Dept'').hide();',
    'apex.item(''MTH'').hide();',
    ' $("#U").css({''background-color'': ''orange''});',
    ' $("#U").css({''color'': ''white''});',
    ' $("#D").css({''background-color'': ''#3ead2a''});',
    ' $("#D").css({''color'': ''white''});',
    ' $("#M").css({''background-color'': ''#3ead2a''});',
    ' $("#M").css({''color'': ''white''});',
    '')))).to_clob
);
wwv_flow_imp.component_end;
end;
/
