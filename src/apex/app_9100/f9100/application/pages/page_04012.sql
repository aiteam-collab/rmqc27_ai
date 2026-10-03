prompt --application/pages/page_04012
begin
--   Manifest
--     PAGE: 04012
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
 p_id=>4012
,p_name=>'Attrition Analysis Dashboard'
,p_alias=>'ATTRITION-ANALYSIS-DASHBOARD1'
,p_page_mode=>'MODAL'
,p_step_title=>'Attrition Analysis Dashboard'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'apex.util.getTopApex().jQuery(".ui-dialog-content").dialog("option", "title", "&P4012_TITLE.");'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'}',
'',
' .t-fht-thead {',
'    overflow: auto !important;',
' }',
''))
,p_step_template=>wwv_flow_imp.id(10650472729025505304)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1300'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9851376569064075973)
,p_plug_name=>'Dependent'
,p_static_id=>'dependent'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>100
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT emp_bu,',
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
'                                     AND ( ( TRUNC (emp_start_date) BETWEEN fp_from_date AND fp_end_date))',
'                                     AND (INSTR (:P4012_YEAR || '':'',fp_year || '':'') > 0) ',
'                                     AND ((instr (:P4012_GROUP || '':'', emp_group_id || '':'') > 0) OR :P4012_GROUP IS NULL ) ',
'                                     AND ((instr (:P4012_DEPT_ID || '':'', empai_dept_id || '':'') > 0) OR :P4012_DEPT_ID IS NULL ) ',
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
'                                   AND (INSTR (:P4012_YEAR || '':'',fp_year || '':'') > 0)',
'                                   AND ((instr (:P4012_GROUP || '':'', emp_group_id || '':'') > 0) OR :P4012_GROUP IS NULL )  ',
'                                   AND ((instr (:P4012_DEPT_ID || '':'', empai_dept_id || '':'') > 0) OR :P4012_DEPT_ID IS NULL )  ',
'                                   ',
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
'                                     AND (INSTR (:P4012_YEAR || '':'',fp_year || '':'') > 0) ',
'                                     AND ((instr (:P4012_GROUP || '':'', emp_group_id || '':'') > 0) OR :P4012_GROUP IS NULL ) ',
'                                     AND ((instr (:P4012_DEPT_ID || '':'', empai_dept_id || '':'') > 0) OR :P4012_DEPT_ID IS NULL ) ',
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
'  ORDER BY pcp_period'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P4012_DEPT_ID,P4012_YEAR,P4012_GROUP'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(9851376607062075974)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>4371855623277155772
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9851378076901075988)
,p_db_column_name=>'ATTRITION_RATE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Attrition Rate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9851377739875075985)
,p_db_column_name=>'DEPT_ID'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Dependent'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9851377606914075984)
,p_db_column_name=>'DEPT_NAME'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9851376726746075975)
,p_db_column_name=>'EMP_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Emp Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9851376905198075977)
,p_db_column_name=>'Employe Joined'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Employe Joined'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9851377969988075987)
,p_db_column_name=>'Employee Closing'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Employee Closing'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9851377067682075978)
,p_db_column_name=>'Employee Left'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Employee Left'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9851377843119075986)
,p_db_column_name=>'Opening Balance'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Opening Balance'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9851377457072075982)
,p_db_column_name=>'PCP_LONG_DESC'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Period'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9851377223592075980)
,p_db_column_name=>'PCP_PERIOD'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Period'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9851377509875075983)
,p_db_column_name=>'PCP_SHORT_DESC'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Pcp Short Desc'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9851377350251075981)
,p_db_column_name=>'PCP_START_DATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'DOJ'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9851377128538075979)
,p_db_column_name=>'PCP_YEAR'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9851376877326075976)
,p_db_column_name=>'P_LOC_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'P Loc Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9852941288833548102)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'9725895'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'DEPT_NAME:PCP_YEAR:PCP_LONG_DESC:Employe Joined:Employee Left:Opening Balance:Employee Closing:ATTRITION_RATE'
,p_sum_columns_on_break=>'ATTRITION_RATE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9853470696959917063)
,p_plug_name=>'Monthly'
,p_static_id=>'monthly'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>110
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT emp_bu,',
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
'                                     AND ( ( TRUNC (emp_start_date) BETWEEN fp_from_date AND fp_end_date))',
'                                     AND (INSTR (:P4012_YEAR || '':'',fp_year || '':'') > 0) ',
'                                     AND ((instr (:P4012_GROUP || '':'', emp_group_id || '':'') > 0) OR :P4012_GROUP IS NULL ) ',
'                                     AND ((instr (:P4012_PERIOD || '':'', fp_short_desc || '':'') > 0) OR :P4012_PERIOD IS NULL ) ',
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
'                                   AND (INSTR (:P4012_YEAR || '':'',fp_year || '':'') > 0)',
'                                   AND ((instr (:P4012_GROUP || '':'', emp_group_id || '':'') > 0) OR :P4012_GROUP IS NULL )  ',
'                                   AND ((instr (:P4012_PERIOD || '':'', fp_short_desc || '':'') > 0) OR :P4012_PERIOD IS NULL )  ',
'                                   ',
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
'                                     AND (INSTR (:P4012_YEAR || '':'',fp_year || '':'') > 0) ',
'                                     AND ((instr (:P4012_GROUP || '':'', emp_group_id || '':'') > 0) OR :P4012_GROUP IS NULL ) ',
'                                     AND ((instr (:P4012_PERIOD || '':'', fp_short_desc || '':'') > 0) OR :P4012_PERIOD IS NULL )  ',
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
'  ORDER BY pcp_period'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P4012_DEPT_ID,P4012_YEAR,P4012_GROUP'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P4012_TYPE'
,p_plug_display_when_cond2=>'M'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(9853470844131917064)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>4373949860346996862
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853472280816917078)
,p_db_column_name=>'ATTRITION_RATE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Attrition Rate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853471904923917075)
,p_db_column_name=>'DEPT_ID'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Dependent'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853471854096917074)
,p_db_column_name=>'DEPT_NAME'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853470912144917065)
,p_db_column_name=>'EMP_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Emp Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853471135978917067)
,p_db_column_name=>'Employe Joined'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Employe Joined'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853472130819917077)
,p_db_column_name=>'Employee Closing'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Employee Closing'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853471267600917068)
,p_db_column_name=>'Employee Left'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Employee Left'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853472024244917076)
,p_db_column_name=>'Opening Balance'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Opening Balance'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853471658188917072)
,p_db_column_name=>'PCP_LONG_DESC'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Period'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853471432113917070)
,p_db_column_name=>'PCP_PERIOD'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Period'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853471733125917073)
,p_db_column_name=>'PCP_SHORT_DESC'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Pcp Short Desc'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853471570505917071)
,p_db_column_name=>'PCP_START_DATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'DOJ'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853471338195917069)
,p_db_column_name=>'PCP_YEAR'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853471017520917066)
,p_db_column_name=>'P_LOC_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'P Loc Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9853481504331918426)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'9731298'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EMP_BU:P_LOC_ID:Employe Joined:Employee Left:PCP_YEAR:PCP_PERIOD:PCP_START_DATE:PCP_LONG_DESC:PCP_SHORT_DESC:DEPT_NAME:DEPT_ID:Opening Balance:Employee Closing:ATTRITION_RATE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9853472766520917083)
,p_plug_name=>'Unit'
,p_static_id=>'unit'
,p_title=>'Unit'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>120
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT emp_bu,',
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
'                                     AND ( ( TRUNC (emp_start_date) BETWEEN fp_from_date AND fp_end_date))',
'                                     AND (INSTR (:P4012_YEAR || '':'',fp_year || '':'') > 0) ',
'                                     AND ((instr (:P4012_GROUP || '':'', emp_group_id || '':'') > 0) OR :P4012_GROUP IS NULL ) ',
'                                     AND ((instr (:P4012_DEPT_ID || '':'', empai_dept_id || '':'') > 0) OR :P4012_DEPT_ID IS NULL ) ',
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
'                                   AND (INSTR (:P4012_YEAR || '':'',fp_year || '':'') > 0)',
'                                   AND ((instr (:P4012_GROUP || '':'', emp_group_id || '':'') > 0) OR :P4012_GROUP IS NULL )  ',
'                                   AND ((instr (:P4012_DEPT_ID || '':'', empai_dept_id || '':'') > 0) OR :P4012_DEPT_ID IS NULL )  ',
'                                   ',
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
'                                     AND (INSTR (:P4012_YEAR || '':'',fp_year || '':'') > 0) ',
'                                     AND ((instr (:P4012_GROUP || '':'', emp_group_id || '':'') > 0) OR :P4012_GROUP IS NULL ) ',
'                                     AND ((instr (:P4012_DEPT_ID || '':'', empai_dept_id || '':'') > 0) OR :P4012_DEPT_ID IS NULL ) ',
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
'  ORDER BY pcp_period'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P4012_DEPT_ID,P4012_YEAR,P4012_GROUP'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P4012_TYPE'
,p_plug_display_when_cond2=>'U'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(9853472867980917084)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>4373951884195996882
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853474243153917098)
,p_db_column_name=>'ATTRITION_RATE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Attrition Rate'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853473982086917095)
,p_db_column_name=>'DEPT_ID'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Dependent'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853473821518917094)
,p_db_column_name=>'DEPT_NAME'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853472952495917085)
,p_db_column_name=>'EMP_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Emp Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853473170157917087)
,p_db_column_name=>'Employe Joined'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Employe Joined'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853474132280917097)
,p_db_column_name=>'Employee Closing'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Employee Closing'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853473191870917088)
,p_db_column_name=>'Employee Left'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Employee Left'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853474019509917096)
,p_db_column_name=>'Opening Balance'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Opening Balance'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853473638605917092)
,p_db_column_name=>'PCP_LONG_DESC'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Period'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853473419166917090)
,p_db_column_name=>'PCP_PERIOD'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Period'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853473734294917093)
,p_db_column_name=>'PCP_SHORT_DESC'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Pcp Short Desc'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853473529379917091)
,p_db_column_name=>'PCP_START_DATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'DOJ'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853473293423917089)
,p_db_column_name=>'PCP_YEAR'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9853473041049917086)
,p_db_column_name=>'P_LOC_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'P Loc Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9853697876081109602)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'9733461'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EMP_BU:P_LOC_ID:Employe Joined:Employee Left:PCP_YEAR:PCP_PERIOD:PCP_START_DATE:PCP_LONG_DESC:PCP_SHORT_DESC:DEPT_NAME:DEPT_ID:Opening Balance:Employee Closing:ATTRITION_RATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9851407462646076020)
,p_name=>'P4012_DEPT_ID'
,p_item_sequence=>10
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9851408079828076026)
,p_name=>'P4012_GROUP'
,p_item_sequence=>70
,p_source=>'P4011_GROUP'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9851407720688076023)
,p_name=>'P4012_LOACTION'
,p_item_sequence=>40
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9851407523199076021)
,p_name=>'P4012_MONTH'
,p_item_sequence=>20
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9851407923681076025)
,p_name=>'P4012_PERIOD'
,p_item_sequence=>60
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9853504023945917134)
,p_name=>'P4012_TITLE'
,p_item_sequence=>90
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9851408140911076027)
,p_name=>'P4012_TYPE'
,p_item_sequence=>80
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9851407682123076022)
,p_name=>'P4012_UNIT'
,p_item_sequence=>30
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9851407916705076024)
,p_name=>'P4012_YEAR'
,p_item_sequence=>50
,p_source=>'P4011_YEAR'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
