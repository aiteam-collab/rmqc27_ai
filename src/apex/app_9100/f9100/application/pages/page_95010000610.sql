prompt --application/pages/page_95010000610
begin
--   Manifest
--     PAGE: 95010000610
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
 p_id=>95010000610
,p_name=>'Dashboard'
,p_alias=>'DASHBOARD'
,p_page_mode=>'MODAL'
,p_step_title=>'Dashboard'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.util.getTopApex().jQuery(".ui-dialog-content").dialog("option", "title", "&P95010000610_REGION_NAME.")',
'',
'function Download(ID) {',
'	$("#" + ID).menu("find", "irDownload").action();',
'}'))
,p_step_template=>wwv_flow_imp.id(10650472729025505304)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'500'
,p_dialog_width=>'1250'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12511960113391783772)
,p_plug_name=>'% Attrition'
,p_static_id=>'attrition'
,p_title=>'% Attrition'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>80
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT empai_loc_id,emp_bu,Emp_Name,',
'            ps_emp_new,',
'            ps_emp_old,',
'         ps_emp_plnt_id,',
'         ps_emp_cost_cent,',
'         pcp_year,',
'         pcp_period,',
'         pcp_short_desc,',
'         pcp_start_date,',
'         total_opn_bal,',
'         total_cl_bal,',
'        ROUND( (ps_emp_old/((TOTAL_OPN_BAL + TOTAL_CL_BAL)/2))*100,2) totaL_att_rate',
' FROM (',
'  SELECT empai_loc_id,EMP_BU,Emp_Name,',
'         SUM (ps_emp_new) ps_emp_new,',
'         SUM (ps_emp_old) ps_emp_old,',
'         ps_emp_plnt_id,',
'         PS_EMP_COST_CENT,',
'         PCP_YEAR,',
'         PCP_PERIOD,',
'         pcp_short_desc,',
'         PCP_START_DATE,',
'        (SELECT COUNT(*) FROM employees ',
'                    WHERE EMP_BU =  :global_bu',
'                      AND (TRUNC(emp_start_date) < pcp_start_date )',
'                      AND emp_status = ''A'') + NVL(SUM (ps_emp_old),0) total_opn_bal,',
'            (SELECT COUNT(*) FROM employees ',
'                    WHERE EMP_BU =  :global_bu',
'                      AND (TRUNC(emp_start_date) < pcp_start_date )',
'                      AND emp_status = ''A'') + NVL(SUM (ps_emp_new),0)   total_cl_bal',
'    FROM (  SELECT emp_bu,',
'                   (CASE',
'                       WHEN DECODE (emp_status,',
'                                    ''A'', ''ADD'',',
'                                    ''T'', ''LEFT'',',
'                                    ''R'', ''LEFT'') = ''ADD''',
'                       THEN',
'                          COUNT (*)',
'                       ELSE',
'                          0',
'                    END)',
'                      ps_emp_new,',
'                   (CASE',
'                       WHEN DECODE (emp_status,',
'                                    ''A'', ''ADD'',',
'                                    ''T'', ''LEFT'',',
'                                    ''R'', ''LEFT'') <> ''ADD''',
'                       THEN',
'                          COUNT (*)',
'                       ELSE',
'                          0',
'                    END)',
'                      ps_emp_old,',
'                   empai_plnt AS ps_emp_plnt_id,',
'                   (SELECT bup_name1',
'                      FROM bus_unit_plants',
'                     WHERE bup_bu = empai_bu AND bup_plant_id = empai_plnt)',
'                      ps_emp_cost_cent,',
'                   pcp_year,',
'                   pcp_period,',
'                   pcp_start_date,',
'                   pcp_short_desc,empai_loc_id,',
'                   (emp_first_name1)Emp_Name',
'              FROM employees, emp_active_infos, payroll_cal_period',
'             WHERE     emp_bu = :global_bu',
'                   AND empai_bu = emp_bu',
'                   AND empai_emp_id = emp_emp_id',
'                   AND emp_emp_id NOT LIKE (''ERP%'')',
'                   AND emp_status IN (''A'', ''T'', ''R'')',
'                   AND pcp_bu = emp_bu',
'                   AND pcp_clndr_id = emp_clndr_id',
'                   AND ( (emp_status = ''A''',
'                          AND TRUNC (emp_start_date) BETWEEN pcp_start_date',
'                                                         AND pcp_end_date)',
'                        OR (emp_status IN (''T'', ''R'')',
'                            AND TRUNC (emp_end_date) BETWEEN pcp_start_date',
'                                                         AND pcp_end_date))',
'                  ',
'                   AND ((instr (:P95010000610_UNIT_LOCATION || '':'', empai_loc_id || '':'') > 0) OR :P95010000610_UNIT_LOCATION IS NULL)',
'                   AND ((instr (:P95010000610_PERIOD || '':'', PCP_SHORT_DESC || '':'') > 0) OR :P95010000610_PERIOD IS NULL)  ',
'                   AND ((instr (:P95010000610_YEAR || '':'', pcp_year || '':'') > 0) OR :P95010000610_YEAR IS NULL)         ',
'                   AND ((instr (:P95010000610_GROUP || '':'', emp_group_id || '':'') > 0) OR :P95010000610_GROUP IS NULL )                              ',
'          GROUP BY emp_bu,',
'                   emp_status,',
'                   empai_plnt,',
'                   empai_bu,',
'                   pcp_year,',
'                   pcp_period,',
'                   pcp_start_date,',
'                   pcp_short_desc,empai_loc_id,',
'                   emp_first_name1)',
'GROUP BY emp_bu,',
'         pcp_year,',
'         ps_emp_plnt_id,',
'         PS_EMP_COST_CENT,',
'         pcp_period,',
'         pcp_start_date,',
'         pcp_short_desc,empai_loc_id,Emp_Name)',
'   GROUP BY emp_bu,',
'            ps_emp_new,',
'            ps_emp_old,',
'         ps_emp_plnt_id,',
'         ps_emp_cost_cent,',
'         pcp_year,',
'         pcp_period,',
'         pcp_start_date,',
'         total_opn_bal,',
'         total_cl_bal,',
'         pcp_short_desc,empai_loc_id,Emp_Name'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P95010000610_UNIT_LOCATION,P95010000610_PERIOD,P95010000610_YEAR,P95010000610_GROUP'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P95010000610_TYPE'
,p_plug_display_when_cond2=>'ATR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'% Attrition'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(12511960227500783773)
,p_max_row_count=>'1000000'
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
,p_internal_uid=>7032439243715863571
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12530773780997864438)
,p_db_column_name=>'EMPAI_LOC_ID'
,p_display_order=>130
,p_column_identifier=>'W'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512286773548036834)
,p_db_column_name=>'EMP_BU'
,p_display_order=>10
,p_column_identifier=>'K'
,p_column_label=>'Emp Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12965722820427608250)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>140
,p_column_identifier=>'Y'
,p_column_label=>'Emp.  Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512287394199036840)
,p_db_column_name=>'PCP_PERIOD'
,p_display_order=>70
,p_column_identifier=>'Q'
,p_column_label=>'Pcp Period'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512287447054036841)
,p_db_column_name=>'PCP_SHORT_DESC'
,p_display_order=>80
,p_column_identifier=>'R'
,p_column_label=>'Period'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512287541774036842)
,p_db_column_name=>'PCP_START_DATE'
,p_display_order=>90
,p_column_identifier=>'S'
,p_column_label=>'DOJ'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512287233154036839)
,p_db_column_name=>'PCP_YEAR'
,p_display_order=>60
,p_column_identifier=>'P'
,p_column_label=>'Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512287158382036838)
,p_db_column_name=>'PS_EMP_COST_CENT'
,p_display_order=>50
,p_column_identifier=>'O'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12965722921209608251)
,p_db_column_name=>'PS_EMP_NEW'
,p_display_order=>150
,p_column_identifier=>'Z'
,p_column_label=>'Ps Emp New'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512286967129036836)
,p_db_column_name=>'PS_EMP_OLD'
,p_display_order=>30
,p_column_identifier=>'M'
,p_column_label=>' Emp. Old'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512287066790036837)
,p_db_column_name=>'PS_EMP_PLNT_ID'
,p_display_order=>40
,p_column_identifier=>'N'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512287875112036845)
,p_db_column_name=>'TOTAL_ATT_RATE'
,p_display_order=>120
,p_column_identifier=>'V'
,p_column_label=>' Att.  Rate %'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512287762046036844)
,p_db_column_name=>'TOTAL_CL_BAL'
,p_display_order=>110
,p_column_identifier=>'U'
,p_column_label=>'Cl.  Bal'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512287701675036843)
,p_db_column_name=>'TOTAL_OPN_BAL'
,p_display_order=>100
,p_column_identifier=>'T'
,p_column_label=>'Opng.  Bal'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12512393637774115580)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2666444'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'EMPAI_LOC_ID:PS_EMP_PLNT_ID:EMP_NAME:PS_EMP_OLD:PCP_START_DATE:TOTAL_OPN_BAL:TOTAL_CL_BAL:TOTAL_ATT_RATE:PCP_SHORT_DESC:PCP_YEAR'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12515280627423870735)
,p_plug_name=>'Average  AGE'
,p_static_id=>'average-age'
,p_title=>'Average  Age'
,p_region_name=>'AVG'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_emp_id,',
'       TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1)Emp_Name,',
'       emp_dob,',
'       emp_start_date,',
'       ( SELECT hrpos_pos_name1 ',
'            FROM hr_positions',
'          WHERE hrpos_bu = empai_bu',
'            AND  hrpos_pos_id = empai_pos_id)emp_pos,',
'       (SELECT dept_name1',
'          FROM departments',
'         WHERE dept_bu = empai_bu AND dept_id = empai_dept_id)',
'          emp_dept,',
'         (SELECT bup_name1 ',
'             FROM bus_unit_plants',
'           WHERE BUP_BU = empai_bu',
'              AND  bup_plant_id = empai_plnt)emp_units,',
'          decode(emp_gender,''M'',''Male'',''F'',''Female'') emp_gender,',
'              NVL (',
'                             ROUND (',
'                                (TRUNC (',
'                                    (TRUNC (SYSDATE)',
'                                     - TO_DATE (emp_dob, ''DD-MON-RRRR''))',
'                                    / 365))),',
'                             0) emp_age,',
'                             v_name',
' FROM (',
'SELECT  ("v_11") values_1, ''18-30'' AS v_name',
'  FROM (  SELECT (CASE',
'                     WHEN NVL (',
'                             ROUND (',
'                                (TRUNC (',
'                                    (TRUNC (SYSDATE)',
'                                     - TO_DATE (emp_dob, ''DD-MON-RRRR''))',
'                                    / 365))),',
'                             0) BETWEEN 18 AND 30',
'                     THEN',
'                         (emp_emp_id)',
'                  END)',
'                    "v_11"',
'            FROM employees, emp_active_infos',
'           WHERE     emp_bu = empai_bu',
'                 AND emp_emp_id = empai_emp_id',
'                 AND emp_bu = :GLOBAL_BU',
'                 AND emp_status = ''A''',
'                 AND emp_include_payroll = ''Y''',
'        GROUP BY emp_dob,emp_emp_id)',
'union all',
'SELECT  ("v_21") values_1, ''31-40'' AS v_name',
'  FROM (  SELECT (CASE',
'                     WHEN NVL (',
'                             ROUND (',
'                                (TRUNC (',
'                                    (TRUNC (SYSDATE)',
'                                     - TO_DATE (emp_dob, ''DD-MON-RRRR''))',
'                                    / 365))),',
'                             0) BETWEEN 31 AND 40',
'                     THEN',
'                         (emp_emp_id)',
'                  END)',
'                    "v_21"',
'            FROM employees, emp_active_infos',
'           WHERE     emp_bu = empai_bu',
'                 AND emp_emp_id = empai_emp_id',
'                 AND emp_bu = :GLOBAL_BU',
'                 AND emp_status = ''A''',
'                 AND emp_include_payroll = ''Y''',
'        GROUP BY emp_dob,emp_emp_id)',
'union all',
'SELECT  ("v_31") values_1, ''41-50'' AS v_name',
'  FROM (  SELECT (CASE',
'                     WHEN NVL (',
'                             ROUND (',
'                                (TRUNC (',
'                                    (TRUNC (SYSDATE)',
'                                     - TO_DATE (emp_dob, ''DD-MON-RRRR''))',
'                                    / 365))),',
'                             0) BETWEEN 41 AND 50',
'                     THEN',
'                         (emp_emp_id)',
'                  END)',
'                    "v_31"',
'            FROM employees, emp_active_infos',
'           WHERE     emp_bu = empai_bu',
'                 AND emp_emp_id = empai_emp_id',
'                 AND emp_bu = :GLOBAL_BU',
'                 AND emp_status = ''A''',
'                 AND emp_include_payroll = ''Y''',
'        GROUP BY emp_dob,emp_emp_id)      ',
'union all',
'SELECT  ("v_51") values_1, ''51- Above'' AS v_name',
'  FROM (  SELECT (CASE',
'                     WHEN NVL (',
'                             ROUND (',
'                                (TRUNC (',
'                                    (TRUNC (SYSDATE)',
'                                     - TO_DATE (emp_dob, ''DD-MON-RRRR''))',
'                                    / 365))),',
'                             0) BETWEEN 51 AND 99',
'                     THEN',
'                         (emp_emp_id)',
'                  END)',
'                    "v_51"',
'            FROM employees, emp_active_infos',
'           WHERE     emp_bu = empai_bu',
'                 AND emp_emp_id = empai_emp_id',
'                 AND emp_bu = :GLOBAL_BU',
'                 AND emp_status = ''A''',
'                 AND emp_include_payroll = ''Y''',
'        GROUP BY emp_dob,emp_emp_id)),employees,emp_active_infos --,fin_periods  ',
'        WHERE emp_bu = :global_bu',
'          AND emp_bu = empai_bu',
'          AND emp_emp_id = empai_emp_id',
'          AND values_1 = emp_emp_id',
'          AND values_1 IS NOT NULL ',
'        --   AND emp_bu = fp_bu ',
'         --AND pcp_clndr_id =  emp_clndr_id',
'        --   AND (emp_start_date BETWEEN fp_from_date AND fp_end_date)',
'          AND ((instr (:P95010000610_AGE_VALUE || '':'', v_name || '':'') > 0) OR :P95010000610_AGE_VALUE IS NULL )',
'          AND ((instr (:P95010000610_UNIT_LOCATION || '':'', EMPAI_LOC_ID || '':'') > 0) or :P95010000610_UNIT_LOCATION is null)',
'          AND ((instr (:P95010000610_GROUP || '':'', emp_group_id || '':'') > 0) OR :P95010000610_GROUP IS NULL)',
'          --AND ((instr (:P95010000610_PERIOD || '':'', fp_short_desc || '':'') > 0) OR :P95010000610_PERIOD IS NULL)   ',
'          ---AND ((instr (:P95010000610_YEAR || '':'', fp_year || '':'') > 0) OR :P95010000610_YEAR IS NULL)',
'        ORDER BY v_name DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P95010000610_AGE_VALUE,P95010000610_UNIT_LOCATION,P95010000610_PERIOD,P95010000610_YEAR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P95010000610_TYPE'
,p_plug_display_when_cond2=>'AVG'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Average  Age'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(12515280704961870736)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>7035759721176950534
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12515281679760870746)
,p_db_column_name=>'EMP_AGE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Age'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12515281237849870742)
,p_db_column_name=>'EMP_DEPT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12515280996141870739)
,p_db_column_name=>'EMP_DOB'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'DOB'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12515280764245870737)
,p_db_column_name=>'EMP_EMP_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12515281886150870748)
,p_db_column_name=>'EMP_GENDER'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12783334678983034569)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>150
,p_column_identifier=>'Q'
,p_column_label=>'Emp.  Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12515281739593870747)
,p_db_column_name=>'EMP_POS'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12515281062252870740)
,p_db_column_name=>'EMP_START_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'DOJ'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12632023075549245431)
,p_db_column_name=>'EMP_UNITS'
,p_display_order=>140
,p_column_identifier=>'P'
,p_column_label=>'Emp Units'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12515281985010870749)
,p_db_column_name=>'V_NAME'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'V Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12515787674758121027)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2700384'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'EMP_EMP_ID:EMP_NAME:EMP_DOB:EMP_START_DATE:EMP_POS:EMP_DEPT:EMP_GENDER:EMP_AGE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12502635058559558259)
,p_plug_name=>'Average  CTC'
,p_static_id=>'average-ctc'
,p_title=>'Average  CTC'
,p_region_name=>'ACTC'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'        round(((Value / value_cnt)/value_cnt),2) Value,',
'        empai_emp_id,',
'         emp_gender,',
'         emp_name,',
'         dept_name,',
'         emp_units,',
'         empai_loc_id,',
'         empai_plnt,',
'         emp_dob',
' FROM(',
'SELECT ',
'        (COUNT(empai_emp_id) OVER()) Value_CNT,',
'        value,',
'        empai_emp_id,',
'         emp_gender,',
'         emp_name,',
'         dept_name,',
'         emp_units,',
'         empai_loc_id,',
'         empai_plnt,',
'         emp_dob',
' FROM(SELECT ''Average CTC'' NAME,',
'        ',
'        ROUND(SUM(total_ctc) OVER(), 2) AS Value,',
'        empai_emp_id,',
'         emp_gender,',
'         emp_name,',
'         dept_name,',
'         emp_units,',
'         empai_loc_id,',
'         empai_plnt,',
'         emp_dob',
'FROM (',
'    SELECT ',
'        empai_emp_id,',
'        empai_dept_id AS dept_id,',
'        (SELECT dept_name1 ',
'           FROM departments ',
'          WHERE dept_bu = empai_bu AND dept_id = empai_dept_id) AS dept_name,',
'        --NVL(empai_basic_sal, 0) + ',
'        --NVL(empai_per_day_wage, 0) +',
'        (SELECT NVL(SUM(epa_per_amt), 0) ',
'           FROM emp_pyrl_allowances ',
'          WHERE epa_bu = empai_bu ',
'            AND epa_emp_id = empai_emp_id) AS total_ctc,',
'          decode(emp_gender,''M'',''Male'',''F'',''Female'')emp_gender,',
'        emp_first_name1 AS emp_name,',
'        (SELECT dept_name1',
'                            FROM departments',
'                           WHERE dept_bu = empai_bu ',
'                             AND dept_id = empai_dept_id)',
'                            department,',
'         (SELECT bup_name1 ',
'             FROM bus_unit_plants',
'           WHERE bup_bu = empai_bu',
'              AND  bup_plant_id = empai_plnt)emp_units,',
'        empai_loc_id,',
'        empai_plnt,',
'        emp_dob   ',
'    FROM ',
'        employees e',
'        JOIN emp_active_infos ei ON e.emp_bu = ei.empai_bu AND e.emp_emp_id = ei.empai_emp_id',
'        -- JOIN fin_periods fp ON e.emp_bu = fp.fp_bu',
'    WHERE ',
'        e.emp_bu = :global_bu',
'        AND e.emp_status = ''A''',
'        AND e.emp_include_payroll = ''Y''',
'        -- AND e.emp_start_date BETWEEN fp.fp_from_date AND fp.fp_end_date',
'       ---- AND (ei.empai_dept_id = :P95010000610_CTC_DEPT_ID OR :P95010000610_CTC_DEPT_ID IS NULL)',
'        AND (INSTR(:P95010000610_UNIT_LOCATION || '':'', ei.empai_loc_id || '':'') > 0 OR :P95010000610_UNIT_LOCATION IS NULL)',
'        AND ((instr (:P95010000610_GROUP || '':'', emp_group_id || '':'') > 0) OR :P95010000610_GROUP IS NULL )',
'        -- AND ((INSTR(:P95010000610_PERIOD || '':'', fp.fp_period || '':'') > 0))',
'        -- AND ((INSTR(:P95010000610_YEAR || '':'', fp.fp_year || '':'') > 0))',
')',
')',
'',
' )'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P95010000610_PERIOD,P95010000610_UNIT_LOCATION,P95010000610_CTC_DEPT_ID,P95010000610_YEAR,P95010000610_GROUP'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P95010000610_TYPE'
,p_plug_display_when_cond2=>'ACTC'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Average  CTC'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(12502635139771558260)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>7023114155986638058
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12965722077654608243)
,p_db_column_name=>'DEPT_NAME'
,p_display_order=>230
,p_column_identifier=>'AZ'
,p_column_label=>'Deptment'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12965721881242608241)
,p_db_column_name=>'EMPAI_EMP_ID'
,p_display_order=>210
,p_column_identifier=>'AX'
,p_column_label=>'Emp. Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12530773133283864432)
,p_db_column_name=>'EMPAI_LOC_ID'
,p_display_order=>110
,p_column_identifier=>'AB'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12965721505229608237)
,p_db_column_name=>'EMPAI_PLNT'
,p_display_order=>190
,p_column_identifier=>'AU'
,p_column_label=>'Empai Plnt'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512667439605305978)
,p_db_column_name=>'EMP_DOB'
,p_display_order=>30
,p_column_identifier=>'U'
,p_column_label=>'DOB'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12965721962767608242)
,p_db_column_name=>'EMP_GENDER'
,p_display_order=>220
,p_column_identifier=>'AY'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12965720839557608231)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>130
,p_column_identifier=>'AO'
,p_column_label=>'Emp.  Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12965721211843608234)
,p_db_column_name=>'EMP_UNITS'
,p_display_order=>160
,p_column_identifier=>'AR'
,p_column_label=>'Units'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12965721818000608240)
,p_db_column_name=>'VALUE'
,p_display_order=>200
,p_column_identifier=>'AW'
,p_column_label=>'Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12511894598836733352)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2661453'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'EMPAI_LOC_ID:EMP_UNITS:EMPAI_EMP_ID:EMP_NAME:EMP_DOB:DEPT_NAME:EMP_GENDER:VALUE'
,p_sum_columns_on_break=>'TOTAL_CTC:VALUE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12512288162371036848)
,p_plug_name=>'Avg. Service Period'
,p_static_id=>'avg-service-period'
,p_title=>'Avg. Service Period'
,p_region_name=>'AVGSP'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>100
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_emp_id,empai_loc_id,',
'       emp_first_name1,',
'       emp_dob,',
'       emp_start_date,',
'       ( SELECT hrpos_pos_name1 ',
'            FROM hr_positions',
'          WHERE hrpos_bu = empai_bu',
'            AND  hrpos_pos_id = empai_pos_id)emp_pos,',
'       (SELECT dept_name1',
'          FROM departments',
'         WHERE dept_bu = empai_bu AND dept_id = empai_dept_id)',
'          emp_dept,',
'         (SELECT bup_name1 ',
'             FROM bus_unit_plants',
'           WHERE BUP_BU = empai_bu',
'              AND  bup_plant_id = empai_plnt)emp_units,empai_plnt,',
'          decode(emp_gender,''M'',''Male'',''F'',''Female'') emp_gender,',
'              NVL (',
'                             ROUND (',
'                                ( (',
'                                    ( (SYSDATE)',
'                                     - TO_DATE (emp_start_date, ''DD-MON-RRRR''))',
'                                    / 365)),1),',
'                             0) emp_experience,',
'                             FLOOR(MONTHS_BETWEEN(SYSDATE, TO_DATE(emp_start_date, ''DD-MON-RRRR'')) / 12) ',
'                            || '' years, '' || ',
'                              MOD(FLOOR(MONTHS_BETWEEN(SYSDATE, TO_DATE(emp_start_date, ''DD-MON-RRRR''))), 12) ',
'                             || '' months'' AS emp_exp,',
'',
'                             v_name',
' FROM (',
'SELECT  ("v_10") values_1, ''0-10'' AS v_name',
'  FROM (  SELECT (CASE',
'                     WHEN NVL (',
'                             ROUND (',
'                                (TRUNC (',
'                                    (TRUNC (SYSDATE)',
'                                     - TO_DATE (emp_start_date, ''DD-MON-RRRR''))',
'                                    / 365))),',
'                             0) BETWEEN 0',
'                                    AND 10',
'                     THEN',
'                         (emp_emp_id)',
'                  END)',
'                    "v_10"',
'            FROM employees, emp_active_infos--,fin_periods',
'           WHERE     emp_bu = empai_bu',
'                 AND emp_emp_id = empai_emp_id',
'                 AND emp_bu = :GLOBAL_BU',
'                 AND emp_status = ''A''',
'                 AND emp_include_payroll = ''Y''',
'                --  AND emp_bu = fp_bu ',
'                --  AND (emp_start_date BETWEEN fp_from_date AND fp_end_date)',
'                -- AND ((instr (:P95010000610_UNIT_LOCATION || '':'', empai_loc_id || '':'') > 0) )',
'        GROUP BY emp_start_date,emp_emp_id)',
'union all',
'SELECT  ("v_11") values_1, ''11-20'' AS v_name',
'  FROM (  SELECT (CASE',
'                     WHEN NVL (',
'                             ROUND (',
'                                (TRUNC (',
'                                    (TRUNC (SYSDATE)',
'                                     - TO_DATE (emp_start_date, ''DD-MON-RRRR''))',
'                                    / 365))),',
'                             0) BETWEEN 11 AND 20',
'                     THEN',
'                         (emp_emp_id)',
'                  END)',
'                    "v_11"',
'            FROM employees, emp_active_infos--,fin_periods',
'           WHERE     emp_bu = empai_bu',
'                 AND emp_emp_id = empai_emp_id',
'                 AND emp_bu = :GLOBAL_BU',
'                 AND emp_status = ''A''',
'                 AND emp_include_payroll = ''Y''',
'                --  AND emp_bu = fp_bu ',
'                --  AND (emp_start_date BETWEEN fp_from_date AND fp_end_date) ',
'                --  AND ((instr (:P95010000610_UNIT_LOCATION || '':'', empai_loc_id || '':'') > 0))',
'        GROUP BY emp_start_date,emp_emp_id)',
'union all',
'SELECT  ("v_21") values_1, ''21-30'' AS v_name',
'  FROM (  SELECT (CASE',
'                     WHEN NVL (',
'                             ROUND (',
'                                (TRUNC (',
'                                    (TRUNC (SYSDATE)',
'                                     - TO_DATE (emp_start_date, ''DD-MON-RRRR''))',
'                                    / 365))),',
'                             0) BETWEEN 21 AND 30',
'                     THEN',
'                         (emp_emp_id)',
'                  END)',
'                    "v_21"',
'            FROM employees, emp_active_infos--,fin_periods',
'           WHERE     emp_bu = empai_bu',
'                 AND emp_emp_id = empai_emp_id',
'                 AND emp_bu = :GLOBAL_BU',
'                 AND emp_status = ''A''',
'                 AND emp_include_payroll = ''Y''',
'                --  AND emp_bu = fp_bu ',
'                --  AND (emp_start_date BETWEEN fp_from_date AND fp_end_date) ',
'                --  AND ((instr (:P95010000610_UNIT_LOCATION || '':'', empai_loc_id || '':'') > 0))',
'        GROUP BY emp_start_date,emp_emp_id)',
'union all',
'SELECT  ("v_31") values_1, ''31-40'' AS v_name',
'  FROM (  SELECT (CASE',
'                     WHEN NVL (',
'                             ROUND (',
'                                (TRUNC (',
'                                    (TRUNC (SYSDATE)',
'                                     - TO_DATE (emp_start_date, ''DD-MON-RRRR''))',
'                                    / 365))),',
'                             0) BETWEEN 31 AND 40',
'                     THEN',
'                         (emp_emp_id)',
'                  END)',
'                    "v_31"',
'            FROM employees, emp_active_infos--,fin_periods',
'           WHERE     emp_bu = empai_bu',
'                 AND emp_emp_id = empai_emp_id',
'                 AND emp_bu = :GLOBAL_BU',
'                 AND emp_status = ''A''',
'                 AND emp_include_payroll = ''Y''',
'                --  AND emp_bu = fp_bu ',
'                --  AND (emp_start_date BETWEEN fp_from_date AND fp_end_date)  ',
'                --  AND ((instr (:P95010000610_UNIT_LOCATION || '':'', empai_loc_id || '':'') > 0) )',
'        GROUP BY emp_start_date,emp_emp_id)',
'union all',
'SELECT  ("v_41") values_1, ''41-50'' AS v_name',
'  FROM (  SELECT (CASE',
'                     WHEN NVL (',
'                             ROUND (',
'                                (TRUNC (',
'                                    (TRUNC (SYSDATE)',
'                                     - TO_DATE (emp_start_date, ''DD-MON-RRRR''))',
'                                    / 365))),',
'                             0) BETWEEN 41 AND 50',
'                     THEN',
'                         (emp_emp_id)',
'                  END)',
'                    "v_41"',
'            FROM employees, emp_active_infos--,fin_periods',
'           WHERE     emp_bu = empai_bu',
'                 AND emp_emp_id = empai_emp_id',
'                 AND emp_bu = :GLOBAL_BU',
'                 AND emp_status = ''A''',
'                 AND emp_include_payroll = ''Y''',
'                --  AND emp_bu = fp_bu',
'                --  AND (emp_start_date BETWEEN fp_from_date AND fp_end_date)',
'                --  AND ((instr (:P95010000610_UNIT_LOCATION || '':'', empai_loc_id || '':'') > 0) )',
'        GROUP BY emp_start_date,emp_emp_id)        ',
'union all',
'SELECT  ("v_51") values_1, ''51- Above'' AS v_name',
'  FROM (  SELECT (CASE',
'                     WHEN NVL (',
'                             ROUND (',
'                                (TRUNC (',
'                                    (TRUNC (SYSDATE)',
'                                     - TO_DATE (emp_start_date, ''DD-MON-RRRR''))',
'                                    / 365))),',
'                             0) BETWEEN 51 AND 99',
'                     THEN',
'                         (emp_emp_id)',
'                  END)',
'                    "v_51"',
'            FROM employees, emp_active_infos--,fin_periods',
'           WHERE     emp_bu = empai_bu',
'                 AND emp_emp_id = empai_emp_id',
'                 AND emp_bu = :GLOBAL_BU',
'                 AND emp_status = ''A''',
'                 AND emp_include_payroll = ''Y''',
'                --  AND emp_bu = fp_bu',
'                --  AND (emp_start_date BETWEEN fp_from_date AND fp_end_date)',
'                --  AND ((instr (:P95010000610_UNIT_LOCATION || '':'', empai_loc_id || '':'') > 0) )',
'        GROUP BY emp_start_date,emp_emp_id))  ,employees,emp_active_infos   ',
'        WHERE emp_bu = :global_bu',
'          AND emp_bu = empai_bu',
'          AND emp_emp_id = empai_emp_id',
'          AND values_1 = emp_emp_id',
'          AND values_1 IS NOT NULL',
'          AND ((instr (:P95010000610_V_NAME || '':'', v_name || '':'') > 0) OR :P95010000610_V_NAME IS NULL )',
'          AND ((instr (:P95010000610_UNIT_LOCATION || '':'', EMPAI_LOC_ID || '':'') > 0)  or :P95010000610_UNIT_LOCATION is null)      ',
'          AND ((instr (:P95010000610_GROUP || '':'', emp_group_id || '':'') > 0) OR :P95010000610_GROUP IS NULL )    ',
'ORDER BY  emp_emp_id                     '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P95010000610_UNIT_LOCATION,P95010000610_PERIOD,P95010000610_YEAR,P95010000610_GROUP'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P95010000610_TYPE'
,p_plug_display_when_cond2=>'AVGSP'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Avg. Service Period'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(12512288313104036849)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>7032767329319116647
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12522497057789546864)
,p_db_column_name=>'EMPAI_LOC_ID'
,p_display_order=>150
,p_column_identifier=>'K'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12522497210255546865)
,p_db_column_name=>'EMPAI_PLNT'
,p_display_order=>160
,p_column_identifier=>'L'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512289370983036860)
,p_db_column_name=>'EMP_DEPT'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512289070538036857)
,p_db_column_name=>'EMP_DOB'
,p_display_order=>100
,p_column_identifier=>'D'
,p_column_label=>'DOB'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512288709895036853)
,p_db_column_name=>'EMP_EMP_ID'
,p_display_order=>40
,p_column_identifier=>'A'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12987740260207121578)
,p_db_column_name=>'EMP_EXP'
,p_display_order=>180
,p_column_identifier=>'N'
,p_column_label=>'Experience'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12987740148787121577)
,p_db_column_name=>'EMP_EXPERIENCE'
,p_display_order=>170
,p_column_identifier=>'M'
,p_column_label=>'Emp Experience'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512288789628036854)
,p_db_column_name=>'EMP_FIRST_NAME1'
,p_display_order=>50
,p_column_identifier=>'B'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512288894177036855)
,p_db_column_name=>'EMP_GENDER'
,p_display_order=>90
,p_column_identifier=>'C'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512289469703036861)
,p_db_column_name=>'EMP_POS'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512289141987036858)
,p_db_column_name=>'EMP_START_DATE'
,p_display_order=>110
,p_column_identifier=>'E'
,p_column_label=>'DOJ'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512289538055036862)
,p_db_column_name=>'EMP_UNITS'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Units'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512290078875036867)
,p_db_column_name=>'V_NAME'
,p_display_order=>140
,p_column_identifier=>'J'
,p_column_label=>'V Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12512538117196192966)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2667888'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'EMPAI_LOC_ID:EMPAI_PLNT:EMP_EMP_ID:EMP_FIRST_NAME1:EMP_GENDER:EMP_DOB:EMP_START_DATE:EMP_DEPT:EMP_POS:EMP_EXP'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12776768146575190231)
,p_plug_name=>'Gender'
,p_static_id=>'gender'
,p_title=>'Gender'
,p_region_name=>'MF'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT empai_loc_id,',
'       emp_emp_id,',
'       TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1)Emp_Name,',
'       emp_gender,',
'       DECODE(emp_gender,''M'',''Male'',''F'',''Female'')Gender,',
'       emp_status,',
'       emp_dob,',
'       emp_start_date,',
'       (SELECT dept_name1',
'          FROM departments',
'         WHERE dept_bu = empai_bu AND dept_id = empai_dept_id)',
'       emp_dept,',
'       empai_plnt,',
'        nvl(ROUND((TRUNC((TRUNC(SYSDATE) - TO_DATE(emp_dob, ''DD-MON-RRRR''))/365))),0) emp_age,',
'        nvl(empai_basic_sal,0) + ',
'            (SELECT nvl(sum(epa_per_amt) ,0)',
'              FROM emp_pyrl_allowances ',
'             WHERE  EPA_BU = empai_bu ',
'              AND EPA_EMP_ID = empai_emp_id ) total_ctc,',
'        TRUNC(MONTHS_BETWEEN(NVL (TRUNC (emp_end_date), TRUNC (SYSDATE)),',
'       TRUNC (emp_start_date))/ 12) ||'' Yr. ''',
'       ||MOD(TRUNC(MONTHS_BETWEEN(NVL(TRUNC(emp_end_date),TRUNC(SYSDATE)),TRUNC(emp_start_date))),12)||'' Mn.'' emp_exp,',
'       (SELECT hrpos_pos_name1',
'               FROM hr_positions',
'                 WHERE hrpos_bu=empai_bu',
'                 AND hrpos_pos_id= empai_pos_id)position,',
'           (SELECT bup_name1',
'             FROM bus_unit_plants',
'             WHERE bup_bu = emp_bu ',
'                AND bup_plant_id = empai_plnt)plnt_desc',
'FROM employees, ',
'     emp_active_infos/*,',
'       fin_periods*/',
' WHERE emp_bu = empai_bu',
'       AND emp_emp_id = empai_emp_id',
'       AND emp_bu = :global_bu',
'       AND emp_status = ''A''',
'       AND emp_include_payroll = ''Y''',
'      -- AND emp_bu = fp_bu ',
'      -- AND pcp_clndr_id =  emp_clndr_id',
'     --  AND (emp_start_date BETWEEN FP_FROM_DATE AND FP_END_DATE)',
'       AND ((instr (:P95010000610_UNIT_LOCATION || '':'', empai_loc_id || '':'') > 0) or :P95010000610_UNIT_LOCATION is null)',
'    --    AND (instr (:P95010000610_year || '':'', fp_year || '':'') > 0) ',
'    --    AND ((instr (:P95010000610_period || '':'', fp_period || '':'') > 0) )',
'       AND (emp_gender = :P95010000610_GENDER_1 OR :P95010000610_GENDER_1 IS NULL)',
'       AND ((instr (:P95010000610_GROUP || '':'', emp_group_id || '':'') > 0) OR :P95010000610_GROUP IS NULL )'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P95010000610_UNIT_LOCATION,P95010000610_PERIOD,P95010000610_YEAR,P95010000610_GENDER_1,P95010000610_GROUP'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P95010000610_TYPE'
,p_plug_display_when_cond2=>'MF'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Gender'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(12776768243089190232)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'10'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'XLSX'
,p_enable_mail_download=>'N'
,p_internal_uid=>7297247259304270030
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12776769340943190243)
,p_db_column_name=>'EMPAI_LOC_ID'
,p_display_order=>10
,p_column_identifier=>'H'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12776769687689190246)
,p_db_column_name=>'EMPAI_PLNT'
,p_display_order=>20
,p_column_identifier=>'K'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12776768849699190238)
,p_db_column_name=>'EMP_AGE'
,p_display_order=>110
,p_column_identifier=>'F'
,p_column_label=>'Age'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12776768780164190237)
,p_db_column_name=>'EMP_DEPT'
,p_display_order=>100
,p_column_identifier=>'E'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12776768562978190235)
,p_db_column_name=>'EMP_DOB'
,p_display_order=>80
,p_column_identifier=>'C'
,p_column_label=>'DOB'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12776768372485190233)
,p_db_column_name=>'EMP_EMP_ID'
,p_display_order=>30
,p_column_identifier=>'A'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12776769927014190248)
,p_db_column_name=>'EMP_EXP'
,p_display_order=>140
,p_column_identifier=>'M'
,p_column_label=>'Emp Exp'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12776769052542190240)
,p_db_column_name=>'EMP_GENDER'
,p_display_order=>50
,p_column_identifier=>'G'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12783334773094034570)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>170
,p_column_identifier=>'P'
,p_column_label=>'Emp.  Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12776768708597190236)
,p_db_column_name=>'EMP_START_DATE'
,p_display_order=>90
,p_column_identifier=>'D'
,p_column_label=>'DOJ'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12776769536946190245)
,p_db_column_name=>'EMP_STATUS'
,p_display_order=>70
,p_column_identifier=>'J'
,p_column_label=>'Emp Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12776769441648190244)
,p_db_column_name=>'GENDER'
,p_display_order=>60
,p_column_identifier=>'I'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12776770067526190250)
,p_db_column_name=>'PLNT_DESC'
,p_display_order=>160
,p_column_identifier=>'O'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12776769975305190249)
,p_db_column_name=>'POSITION'
,p_display_order=>150
,p_column_identifier=>'N'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12776769771200190247)
,p_db_column_name=>'TOTAL_CTC'
,p_display_order=>130
,p_column_identifier=>'L'
,p_column_label=>'Total Ctc'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12777109717453880838)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'5313604'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'EMPAI_LOC_ID:EMPAI_PLNT:EMP_EMP_ID:EMP_NAME:POSITION:EMP_DEPT:EMP_DOB:EMP_START_DATE:GENDER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12502636764565558276)
,p_plug_name=>'Hired '
,p_static_id=>'hired'
,p_title=>'Hired '
,p_region_name=>'HVR'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_emp_id,',
'         emp_first_name1,',
'         DECODE (emp_gender,  ''M'', ''Male'',  ''F'', ''Female'') Gender,',
'         emp_dob,',
'         emp_start_date,',
'          (SELECT hrpos_pos_name1',
'               FROM hr_positions',
'                 WHERE hrpos_bu=empai_bu',
'                 AND hrpos_pos_id= empai_pos_id)position,',
'         (SELECT dept_name1',
'            FROM departments',
'           WHERE dept_bu = empai_bu AND dept_id = empai_dept_id)',
'            emp_dept,',
'         empai_plnt,',
'         fp_year,',
'         fp_period',
'        -- pcp_short_desc,empai_loc_id',
'    FROM employees, ',
'         emp_active_infos, ',
'         fin_periods',
'   WHERE     emp_bu = empai_bu',
'         AND emp_emp_id = empai_emp_id',
'         AND emp_bu = :global_bu',
'         AND emp_status = ''A''',
'         AND emp_include_payroll = ''Y''',
'         AND fp_bu = empai_bu',
'         --AND pcp_clndr_id = emp_clndr_id',
'         AND (emp_start_date BETWEEN FP_FROM_DATE AND FP_END_DATE)',
'         --AND pcp_clndr_id =  emp_clndr_id',
'         AND ((instr (:P95010000610_PERIOD || '':'', fp_short_desc || '':'') > 0) OR :P95010000610_PERIOD IS NULL)',
'         AND ((instr (:P95010000610_UNIT_LOCATION || '':'', empai_loc_id || '':'') > 0) or :P95010000610_UNIT_LOCATION is null)    ',
'         AND ((instr (:P95010000610_YEAR || '':'', fp_year || '':'') > 0) OR :P95010000610_YEAR IS NULL)',
'         AND ((instr (:P95010000610_GROUP || '':'', emp_group_id || '':'') > 0) OR :P95010000610_GROUP IS NULL )',
'ORDER BY emp_start_date',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P95010000610_PERIOD,P95010000610_YEAR,P95010000610_UNIT_LOCATION,P95010000610_GROUP'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P95010000610_TYPE'
,p_plug_display_when_cond2=>'HVR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Hired '
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(12502636901934558277)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>7023115918149638075
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12530773363848864434)
,p_db_column_name=>'EMPAI_PLNT'
,p_display_order=>120
,p_column_identifier=>'N'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12511956146532783733)
,p_db_column_name=>'EMP_DEPT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12511955927141783730)
,p_db_column_name=>'EMP_DOB'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'DOB'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12502636951858558278)
,p_db_column_name=>'EMP_EMP_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12502637130137558279)
,p_db_column_name=>'EMP_FIRST_NAME1'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12511955985308783731)
,p_db_column_name=>'EMP_START_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'DOJ'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10015356983255128556)
,p_db_column_name=>'FP_PERIOD'
,p_display_order=>140
,p_column_identifier=>'P'
,p_column_label=>'Fp Period'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10015356867001128555)
,p_db_column_name=>'FP_YEAR'
,p_display_order=>130
,p_column_identifier=>'O'
,p_column_label=>'Fp Year'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12511956396087783735)
,p_db_column_name=>'GENDER'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12511956036054783732)
,p_db_column_name=>'POSITION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12511991847581813289)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2662426'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'EMPAI_PLNT:EMP_EMP_ID:EMP_FIRST_NAME1:EMP_DOB:EMP_START_DATE:POSITION:EMP_DEPT:GENDER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12502633198789558240)
,p_plug_name=>'Monthly CTC'
,p_static_id=>'monthly-ctc'
,p_title=>'Monthly CTC'
,p_region_name=>'MCTC'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT empai_loc_id,emp_emp_id,',
'       emp_first_name1,',
'       emp_gender,',
'DECODE(emp_gender,''M'',''Male'',''F'',''Female'')Gender,',
'       emp_status,',
'       emp_dob,',
'       emp_start_date,',
'       empai_dept_id,',
'       (SELECT dept_name1',
'          FROM departments',
'         WHERE dept_bu = empai_bu AND dept_id = empai_dept_id)',
'          emp_dept,',
'          empai_plnt,',
'          (SELECT bup_name1 ',
'             FROM bus_unit_plants',
'           WHERE BUP_BU = empai_bu',
'              AND  bup_plant_id = empai_plnt)emp_units,',
'          nvl(ROUND((TRUNC((TRUNC(SYSDATE) - TO_DATE(emp_dob, ''DD-MON-RRRR''))/365))),0) emp_age,',
'        --nvl(empai_basic_sal,0) + ',
'            (SELECT nvl(sum(epa_per_amt) ,0)',
'              FROM emp_pyrl_allowances ',
'             WHERE  EPA_BU = empai_bu ',
'              AND EPA_EMP_ID = empai_emp_id ) total_ctc,',
'       nvl(ROUND((TRUNC((TRUNC(SYSDATE) - TO_DATE(emp_start_date, ''DD-MON-RRRR''))/365))),0) emp_exp,',
'       (SELECT hrpos_pos_name1',
'               FROM hr_positions',
'                 WHERE hrpos_bu=empai_bu',
'                 AND hrpos_pos_id= empai_pos_id)position,',
'        ( case when  nvl(ROUND((TRUNC((TRUNC(SYSDATE) - TO_DATE(emp_start_date, ''DD-MON-RRRR''))/365))),0)  BETWEEN 0 AND 10 THEN',
'              ''0-10''',
'              when  nvl(ROUND((TRUNC((TRUNC(SYSDATE) - TO_DATE(emp_start_date, ''DD-MON-RRRR''))/365))),0)  BETWEEN 11 AND 20 THEN',
'              ''11-20''',
'              when  nvl(ROUND((TRUNC((TRUNC(SYSDATE) - TO_DATE(emp_start_date, ''DD-MON-RRRR''))/365))),0)  BETWEEN 21 AND 30 THEN',
'              ''21-30''',
'              when  nvl(ROUND((TRUNC((TRUNC(SYSDATE) - TO_DATE(emp_start_date, ''DD-MON-RRRR''))/365))),0)  BETWEEN 31 AND 99 THEN',
'              ''31- Above''',
'           end) exp_betwn_count,',
'           (SELECT bupld_loc_name ',
'    FROM bus_unit_plants_loc_dtls ',
'  WHERE bupld_bu = empai_bu',
'    AND empai_loc_id = bupld_loc_id)Location,',
'(SELECT bup_name1 ',
'   FROM bus_unit_plants',
'  WHERE bup_bu = empai_bu',
'    AND  bup_plant_id = empai_plnt)units',
'  FROM employees, emp_active_infos/*,',
'       fin_periods*/',
' WHERE     emp_bu = empai_bu',
'       AND emp_emp_id = empai_emp_id',
'       AND emp_bu = :global_bu',
'       AND emp_status = ''A''',
'       AND emp_include_payroll = ''Y'' ',
'    --    AND emp_bu = fp_bu ',
'       --AND pcp_clndr_id =  emp_clndr_id',
'    --    AND (emp_start_date BETWEEN FP_FROM_DATE AND FP_END_DATE)',
'       AND ((instr (:P95010000610_CTC_DEPT_ID || '':'', empai_dept_id || '':'') > 0) OR :P95010000610_CTC_DEPT_ID IS NULL)',
'       AND ((instr (:P95010000602_UNIT_LOC || '':'', empai_loc_id || '':'') > 0)OR :P95010000602_UNIT_LOC IS NULL )',
'       AND ((instr (:P95010000610_GROUP || '':'', emp_group_id || '':'') > 0) OR :P95010000610_GROUP IS NULL )     ',
'--       AND ((instr (:P95010000610_PERIOD || '':'', fp_period || '':'') > 0) OR :P95010000610_PERIOD IS NULL)    ',
'--       AND ((instr (:P95010000610_YEAR || '':'', fp_year || '':'') > 0) OR :P95010000610_YEAR IS NULL) '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P95010000610_CTC_DEPT_ID,P95010000610_UNIT_LOCATION,P95010000610_PERIOD,P95010000610_YEAR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P95010000610_TYPE'
,p_plug_display_when_cond2=>'MCTC'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Monthly CTC'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(12502633262595558241)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'XLSX'
,p_enable_mail_download=>'N'
,p_internal_uid=>7023112278810638039
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512665854803305962)
,p_db_column_name=>'EMPAI_DEPT_ID'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Empai Dept Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12530773069175864431)
,p_db_column_name=>'EMPAI_LOC_ID'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Loc.ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12502634469875558253)
,p_db_column_name=>'EMPAI_PLNT'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12502634594601558254)
,p_db_column_name=>'EMP_AGE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Age'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12502633851863558247)
,p_db_column_name=>'EMP_DEPT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12502633550827558244)
,p_db_column_name=>'EMP_DOB'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'DOB'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12502633378794558242)
,p_db_column_name=>'EMP_EMP_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Emp. ID '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12502634079545558249)
,p_db_column_name=>'EMP_EXP'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Experience'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12502633528935558243)
,p_db_column_name=>'EMP_FIRST_NAME1'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Emp.  Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12502634153044558250)
,p_db_column_name=>'EMP_GENDER'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12502633656588558245)
,p_db_column_name=>'EMP_START_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'DOJ'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12502634376467558252)
,p_db_column_name=>'EMP_STATUS'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12502634005348558248)
,p_db_column_name=>'EMP_UNITS'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Units'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12502634807151558256)
,p_db_column_name=>'EXP_BETWN_COUNT'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Exp Betwn Count'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12502634265888558251)
,p_db_column_name=>'GENDER'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12965722502950608247)
,p_db_column_name=>'LOCATION'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12502633734806558246)
,p_db_column_name=>'POSITION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12502634688090558255)
,p_db_column_name=>'TOTAL_CTC'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Salary'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'&GLOBAL_COST_MASK.'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12965722576273608248)
,p_db_column_name=>'UNITS'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Units'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12511567537421463413)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2658183'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'LOCATION:EMP_UNITS:EMP_EMP_ID:EMP_FIRST_NAME1:EMP_DOB:EMP_START_DATE:POSITION:EMP_DEPT:GENDER:TOTAL_CTC'
,p_sum_columns_on_break=>'TOTAL_CTC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12496597972368182034)
,p_plug_name=>'No. of Employees'
,p_static_id=>'no-of-employees'
,p_title=>'No. of Employees'
,p_region_name=>'NE'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT empai_loc_id,',
'        emp_emp_id,',
'       TRIM(EMP_FIRST_NAME1||'' ''||EMP_MIDDLE_NAME1||'' ''||EMP_LAST_NAME1)Emp_Name,',
'       emp_gender,',
'DECODE(emp_gender,''M'',''Male'',''F'',''Female'')Gender,',
'       emp_status,',
'       emp_dob,',
'       emp_start_date,',
'       (SELECT dept_name1',
'          FROM departments',
'         WHERE dept_bu = empai_bu AND dept_id = empai_dept_id)',
'          emp_dept,',
'          empai_plnt,',
'         nvl(ROUND((TRUNC((TRUNC(SYSDATE) - TO_DATE(emp_dob, ''DD-MON-RRRR''))/365))),0) emp_age,',
'        nvl(empai_basic_sal,0) + ',
'            (SELECT nvl(sum(epa_per_amt) ,0)',
'              FROM emp_pyrl_allowances ',
'             WHERE  EPA_BU = empai_bu ',
'              AND EPA_EMP_ID = empai_emp_id ) total_ctc,',
'       nvl(ROUND((TRUNC((TRUNC(SYSDATE) - TO_DATE(emp_start_date, ''DD-MON-RRRR''))/365))),0) emp_exp,',
'       (SELECT hrpos_pos_name1',
'               FROM hr_positions',
'                 WHERE hrpos_bu=empai_bu',
'                 AND hrpos_pos_id= empai_pos_id)position,',
'        ( case when  nvl(ROUND((TRUNC((TRUNC(SYSDATE) - TO_DATE(emp_start_date, ''DD-MON-RRRR''))/365))),0)  BETWEEN 0 AND 10 THEN',
'              ''0-10''',
'              when  nvl(ROUND((TRUNC((TRUNC(SYSDATE) - TO_DATE(emp_start_date, ''DD-MON-RRRR''))/365))),0)  BETWEEN 11 AND 20 THEN',
'              ''11-20''',
'              when  nvl(ROUND((TRUNC((TRUNC(SYSDATE) - TO_DATE(emp_start_date, ''DD-MON-RRRR''))/365))),0)  BETWEEN 21 AND 30 THEN',
'              ''21-30''',
'              when  nvl(ROUND((TRUNC((TRUNC(SYSDATE) - TO_DATE(emp_start_date, ''DD-MON-RRRR''))/365))),0)  BETWEEN 31 AND 99 THEN',
'              ''31- Above''',
'           end) exp_betwn_count ,',
'            (SELECT bup_name1 ',
'             FROM bus_unit_plants',
'           WHERE bup_bu = empai_bu',
'              AND  bup_plant_id = empai_plnt)units,',
'       (SELECT bupld_loc_name ',
'          FROM bus_unit_plants_loc_dtls ',
'         WHERE bupld_bu = empai_bu',
'           AND empai_loc_id = bupld_loc_id)Location       ',
'  FROM employees, ',
'       emp_active_infos',
'       --,fin_periods',
' WHERE     emp_bu = empai_bu',
'       AND emp_emp_id = empai_emp_id',
'       AND emp_bu = :global_bu',
'       AND emp_status = ''A''',
'       AND emp_include_payroll = ''Y''',
'     --  AND emp_bu = fp_bu ',
'    --   AND pcp_clndr_id =  emp_clndr_id',
'     -- AND (emp_start_date BETWEEN FP_FROM_DATE AND FP_END_DATE)',
'       AND ((instr (:P95010000610_CTC_DEPT_ID || '':'', empai_dept_id || '':'') > 0) OR :P95010000610_CTC_DEPT_ID IS NULL)',
'     -- AND ((instr (:P95010000610_PERIOD || '':'', fp_period || '':'') > 0) OR :P95010000610_PERIOD IS NULL)',
'       AND ((instr (:P95010000602_UNIT_LOC || '':'', empai_loc_id || '':'') > 0)OR :P95010000602_UNIT_LOC IS NULL )   ',
'       AND ((instr (:P95010000610_GROUP || '':'', emp_group_id || '':'') > 0) OR :P95010000610_GROUP IS NULL )  ',
'   -- AND ((instr (:P95010000610_YEAR || '':'', fp_year || '':'') > 0) OR :P95010000610_YEAR IS NULL) '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P95010000610_PERIOD,P95010000610_YEAR,P95010000610_UNIT_LOCATION,P95010000610_GROUP'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P95010000610_TYPE =''NOE'''
,p_plug_display_when_cond2=>'PLSQL'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'No. of Employees'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(12496599752970182052)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'XLSX'
,p_enable_mail_download=>'N'
,p_internal_uid=>7017078769185261850
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12530773007304864430)
,p_db_column_name=>'EMPAI_LOC_ID'
,p_display_order=>170
,p_column_identifier=>'P'
,p_column_label=>' Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12496600646544182061)
,p_db_column_name=>'EMPAI_PLNT'
,p_display_order=>130
,p_column_identifier=>'I'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12496600912739182063)
,p_db_column_name=>'EMP_AGE'
,p_display_order=>140
,p_column_identifier=>'K'
,p_column_label=>'Age'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12496600597608182060)
,p_db_column_name=>'EMP_DEPT'
,p_display_order=>60
,p_column_identifier=>'H'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12496600413973182058)
,p_db_column_name=>'EMP_DOB'
,p_display_order=>30
,p_column_identifier=>'F'
,p_column_label=>'DOB'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12496599920807182053)
,p_db_column_name=>'EMP_EMP_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12496601087154182065)
,p_db_column_name=>'EMP_EXP'
,p_display_order=>80
,p_column_identifier=>'M'
,p_column_label=>'Experience'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12496600060567182055)
,p_db_column_name=>'EMP_GENDER'
,p_display_order=>90
,p_column_identifier=>'C'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12783333645811034559)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>180
,p_column_identifier=>'Q'
,p_column_label=>' Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12496600502846182059)
,p_db_column_name=>'EMP_START_DATE'
,p_display_order=>40
,p_column_identifier=>'G'
,p_column_label=>'DOJ'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12496600321018182057)
,p_db_column_name=>'EMP_STATUS'
,p_display_order=>120
,p_column_identifier=>'E'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12496601241821182067)
,p_db_column_name=>'EXP_BETWN_COUNT'
,p_display_order=>160
,p_column_identifier=>'O'
,p_column_label=>'Exp Betwn Count'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12496600145135182056)
,p_db_column_name=>'GENDER'
,p_display_order=>100
,p_column_identifier=>'D'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12965722328511608245)
,p_db_column_name=>'LOCATION'
,p_display_order=>200
,p_column_identifier=>'S'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12496601216655182066)
,p_db_column_name=>'POSITION'
,p_display_order=>50
,p_column_identifier=>'N'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12496600996760182064)
,p_db_column_name=>'TOTAL_CTC'
,p_display_order=>150
,p_column_identifier=>'L'
,p_column_label=>'Total Ctc'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12965722230054608244)
,p_db_column_name=>'UNITS'
,p_display_order=>190
,p_column_identifier=>'R'
,p_column_label=>'Units'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12497398297980816429)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2516490'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'UNITS:LOCATION:EMP_EMP_ID:EMP_NAME:EMP_DOB:EMP_START_DATE:POSITION:EMP_DEPT:EMP_EXP:GENDER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12512663380094305937)
,p_plug_name=>'Notice Period'
,p_static_id=>'notice-period'
,p_title=>'Notice Period'
,p_region_name=>'NOP'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>120
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  (emp_emp_id) emp_count,',
'         emp_first_name1,',
'          (SELECT UPPER(eaidv_plnt_desc)',
'          FROM emp_active_info_dtl_view',
'         WHERE eaidv_bu = emp_bu',
'           AND eaidv_emp_id = emp_emp_id) unit ,',
'         empai_dept_id, ',
'         (SELECT dept_name1',
'          FROM departments',
'         WHERE dept_bu = empai_bu AND dept_id = empai_dept_id) emp_dept,',
'         (SELECT hrpos_pos_name1',
'               FROM hr_positions',
'                 WHERE hrpos_bu=empai_bu',
'                 AND hrpos_pos_id= empai_pos_id) position ,',
'              PCP_YEAR,',
'              pcp_period,',
'              EMP_DOB,',
'              EMP_END_DATE,',
'              Decode(EMP_GENDER,''M'',''Male'',''F'',''Female'')Gender',
'    FROM employees,',
'         departments,',
'         emp_active_infos,',
'         emp_relieve,',
'         payroll_cal_period',
'   WHERE     emp_bu = empai_bu',
'         AND emp_emp_id = empai_emp_id',
'         AND empai_bu = emprel_bu',
'         AND empai_emp_id = emprel_emp_id',
'         AND emp_bu = :global_bu',
'         AND dept_bu = empai_bu',
'                AND dept_id = empai_dept_id',
'         AND emp_status = ''T''',
'         AND emprel_status = ''I''',
'         AND emp_include_payroll = ''Y''',
'         AND pcp_bu = empai_bu',
'         AND pcp_clndr_id = emp_clndr_id',
'         AND empai_dept_id is not null',
'         AND (emp_end_date BETWEEN pcp_start_date AND pcp_end_date)',
'         AND ((instr (:P95010000610_UNIT_LOCATION || '':'', empai_loc_id || '':'') > 0) )',
'         AND ((instr (:P95010000610_PERIOD || '':'', upper(pcp_short_desc)|| '':'') > 0)  )',
'         AND ((instr (:P95010000610_YEAR || '':'', pcp_year || '':'') > 0) )',
'         AND ((instr (:P95010000610_GROUP || '':'', emp_group_id || '':'') > 0) OR :P95010000610_GROUP IS NULL )',
'         AND (empai_dept_id =:P95010000610_CTC_DEPT_ID OR :P95010000610_CTC_DEPT_ID IS NULL)',
' ',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P95010000610_UNIT_LOCATION,P95010000610_PERIOD,P95010000610_YEAR,P95010000610_CTC_DEPT_ID,P95010000610_GROUP'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P95010000610_TYPE'
,p_plug_display_when_cond2=>'NOP'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Notice Period'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(12512663462040305938)
,p_max_row_count=>'1000000'
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
,p_internal_uid=>7033142478255385736
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12959627810535474069)
,p_db_column_name=>'EMPAI_DEPT_ID'
,p_display_order=>200
,p_column_identifier=>'AC'
,p_column_label=>'Empai Dept Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12959627532541474067)
,p_db_column_name=>'EMP_COUNT'
,p_display_order=>180
,p_column_identifier=>'AA'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512663861447305942)
,p_db_column_name=>'EMP_DEPT'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12959626603905474057)
,p_db_column_name=>'EMP_DOB'
,p_display_order=>100
,p_column_identifier=>'Y'
,p_column_label=>'DOB'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12959627251378474064)
,p_db_column_name=>'EMP_END_DATE'
,p_display_order=>170
,p_column_identifier=>'Z'
,p_column_label=>'DOE'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12965722405738608246)
,p_db_column_name=>'EMP_FIRST_NAME1'
,p_display_order=>250
,p_column_identifier=>'AH'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12959626476903474056)
,p_db_column_name=>'GENDER'
,p_display_order=>90
,p_column_identifier=>'X'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12959628203677474073)
,p_db_column_name=>'PCP_PERIOD'
,p_display_order=>240
,p_column_identifier=>'AG'
,p_column_label=>'Period'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12959628039604474072)
,p_db_column_name=>'PCP_YEAR'
,p_display_order=>230
,p_column_identifier=>'AF'
,p_column_label=>'Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12639854500657369354)
,p_db_column_name=>'POSITION'
,p_display_order=>270
,p_column_identifier=>'AJ'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12639854366626369353)
,p_db_column_name=>'UNIT'
,p_display_order=>260
,p_column_identifier=>'AI'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12513068793814488196)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2673195'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'UNIT:EMP_COUNT:EMP_FIRST_NAME1:POSITION:EMP_DEPT:EMP_DOB:EMP_END_DATE:GENDER:PCP_YEAR'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12852503943608556979)
,p_plug_name=>'Parameter'
,p_static_id=>'parameter'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12512290409729036870)
,p_plug_name=>'Probation'
,p_static_id=>'probation'
,p_title=>'Probation'
,p_region_name=>'Prob'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>110
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT distinct emp_emp_id,',
'         (emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1)name,',
'         DECODE (emp_gender,  ''M'', ''Male'',  ''F'', ''Female'') Gender,',
'         emp_dob,',
'         emp_start_date,',
'          (SELECT hrpos_pos_name1',
'               FROM hr_positions',
'                 WHERE hrpos_bu=empai_bu',
'                 AND hrpos_pos_id= empai_pos_id) position,',
'         (SELECT dept_name1',
'            FROM departments',
'           WHERE dept_bu = empai_bu AND dept_id = empai_dept_id)',
'            emp_dept,',
'         (SELECT bup_name1',
'            FROM bus_unit_plants',
'           WHERE BUP_BU = empai_bu AND bup_plant_id = empai_plnt)',
'            emp_units,',
'         pcp_year,',
'         pcp_period,',
'         pcp_short_desc,',
'         empai_dept_id,',
'         empai_plnt,',
'         empai_loc_id',
'    FROM employees, ',
'         emp_active_infos, ',
'         payroll_cal_period',
'   WHERE     emp_bu = empai_bu',
'         AND emp_emp_id = empai_emp_id',
'         AND emp_bu = :global_bu',
'        AND emp_status IN (''A'')   ',
'        AND emp_include_payroll =''Y''',
'        AND emp_bu = pcp_bu ',
'        AND pcp_clndr_id =  emp_clndr_id',
'        AND (emp_start_date BETWEEN pcp_start_date AND pcp_end_date)',
'        AND emp_prob_period_status =''A''',
'        AND (emp_prob_start_date between pcp_start_date and pcp_end_date)',
'         AND ((instr(:P95010000610_CTC_DEPT_ID || '':'', empai_dept_id  || '':'') > 0) OR :P95010000610_CTC_DEPT_ID is null)',
'        AND ((instr (:P95010000610_UNIT_LOCATION || '':'', empai_loc_id || '':'') > 0) OR :P95010000610_UNIT_LOCATION IS NULL)',
'        AND ((instr (:P95010000610_YEAR || '':'', pcp_year || '':'') > 0) OR :P95010000610_YEAR IS NULL)',
'        AND ((instr (:P95010000610_GROUP || '':'', emp_group_id || '':'') > 0) OR :P95010000610_GROUP IS NULL )',
'    group by emp_emp_id,',
'         (emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1),',
'         emp_gender,',
'         emp_start_date,',
'         emp_dob,',
'         empai_bu,',
'         empai_pos_id,',
'         empai_dept_id,',
'         empai_plnt,',
'         pcp_year,',
'         pcp_period,',
'         pcp_short_desc,',
'         empai_loc_id',
'ORDER BY emp_start_date'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P95010000610_PERIOD,P95010000610_YEAR,P95010000610_UNIT_LOCATION,P95010000610_GROUP'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P95010000610_TYPE'
,p_plug_display_when_cond2=>'Prob'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Probation'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(12512290499586036871)
,p_max_row_count=>'1000000'
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
,p_internal_uid=>7032769515801116669
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12515282172373870751)
,p_db_column_name=>'EMPAI_DEPT_ID'
,p_display_order=>130
,p_column_identifier=>'P'
,p_column_label=>'Empai Dept Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12959625637279474048)
,p_db_column_name=>'EMPAI_LOC_ID'
,p_display_order=>250
,p_column_identifier=>'AH'
,p_column_label=>'Loc.ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12959625550745474047)
,p_db_column_name=>'EMPAI_PLNT'
,p_display_order=>240
,p_column_identifier=>'AG'
,p_column_label=>'Empai Plnt'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12959625114416474042)
,p_db_column_name=>'EMP_DEPT'
,p_display_order=>190
,p_column_identifier=>'AB'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12959624828131474039)
,p_db_column_name=>'EMP_DOB'
,p_display_order=>160
,p_column_identifier=>'Y'
,p_column_label=>'DOB'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12959624617116474037)
,p_db_column_name=>'EMP_EMP_ID'
,p_display_order=>140
,p_column_identifier=>'W'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12959624852636474040)
,p_db_column_name=>'EMP_START_DATE'
,p_display_order=>170
,p_column_identifier=>'Z'
,p_column_label=>'DOJ'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12959625170587474043)
,p_db_column_name=>'EMP_UNITS'
,p_display_order=>200
,p_column_identifier=>'AC'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12512662832669305932)
,p_db_column_name=>'GENDER'
,p_display_order=>80
,p_column_identifier=>'K'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12959624649929474038)
,p_db_column_name=>'NAME'
,p_display_order=>150
,p_column_identifier=>'X'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12959625351198474045)
,p_db_column_name=>'PCP_PERIOD'
,p_display_order=>220
,p_column_identifier=>'AE'
,p_column_label=>'Period'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12959625471865474046)
,p_db_column_name=>'PCP_SHORT_DESC'
,p_display_order=>230
,p_column_identifier=>'AF'
,p_column_label=>'Period'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12959625283741474044)
,p_db_column_name=>'PCP_YEAR'
,p_display_order=>210
,p_column_identifier=>'AD'
,p_column_label=>'Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12959624947222474041)
,p_db_column_name=>'POSITION'
,p_display_order=>180
,p_column_identifier=>'AA'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12512915790971421688)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2671665'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'EMPAI_LOC_ID:EMP_EMP_ID:NAME:POSITION:EMP_DEPT:EMP_DOB:EMP_START_DATE:EMP_UNITS:PCP_SHORT_DESC:PCP_YEAR'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12511956949830783741)
,p_plug_name=>'Relieved Employee'
,p_static_id=>'relieved-employee'
,p_title=>'Relieved'
,p_region_name=>'REL'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>90
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_emp_id,empai_loc_id,',
'        TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1)Emp_Name,',
'       DECODE (emp_gender,  ''M'', ''Male'',  ''F'', ''Female'') emp_gender,',
'       emp_status,',
'       emp_dob,',
'       emp_start_date,',
'       emp_end_date,',
'       (SELECT dept_name1',
'          FROM departments',
'         WHERE dept_bu = empai_bu AND dept_id = empai_dept_id)',
'          emp_dept,',
'       (SELECT hrpos_pos_name1',
'          FROM hr_positions',
'         WHERE hrpos_bu = empai_bu AND hrpos_pos_id = empai_pos_id)',
'          emp_pos,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE BUP_BU = empai_bu AND bup_plant_id = empai_plnt)',
'          emp_units,',
'       empai_plnt,',
'    --    pcp_year,',
'    --    pcp_period,',
'    --    pcp_short_desc,',
'       (SELECT emprel_reference',
'          FROM emp_relieve',
'         WHERE     emprel_bu = emp_bu',
'               AND emprel_emp_id = emp_emp_id',
'               AND emprel_status = ''R'')',
'          EMP_REF,',
'       (SELECT emprel_opt_relvd_date',
'          FROM emp_relieve',
'         WHERE     emprel_bu = emp_bu',
'               AND emprel_emp_id = emp_emp_id',
'               AND emprel_status = ''R'')',
'          EMP_OPTIONAL',
'  FROM employees, emp_active_infos,fin_periods --, payroll_cal_period',
' WHERE     emp_bu = empai_bu',
'       AND emp_emp_id = empai_emp_id',
'       AND emp_bu = :GLOBAL_BU',
'       AND emp_status IN (''T'', ''R'')',
'       AND fp_bu = empai_bu',
'    --    AND fp_clndr_id = emp_clndr_id',
'       AND (emp_end_date BETWEEN FP_FROM_DATE AND FP_END_DATE)',
'       AND ((instr (:P95010000610_UNIT_LOCATION || '':'', empai_loc_id || '':'') > 0) OR :P95010000610_UNIT_LOCATION IS NULL)',
'       AND ((instr (:P95010000610_PERIOD || '':'',  fp_short_desc || '':'') > 0) OR :P95010000610_PERIOD IS NULL)   ',
'       AND ((instr (:P95010000610_YEAR || '':'', fp_year  || '':'') > 0) OR :P95010000610_YEAR IS NULL)',
'       AND ((instr (:P95010000610_GROUP || '':'', emp_group_id || '':'') > 0) OR :P95010000610_GROUP IS NULL )',
'/*UNION ALL',
'          SELECT 0 emp_resign,',
'                 fp_year year,',
'                 fp_period period,',
'                 fp_short_desc period_desc',
'            FROM fin_periods',
'           WHERE fp_bu = :global_bu ',
'             AND ((instr (:P95010000610_PERIOD || '':'', fp_short_desc || '':'') > 0) OR :P95010000610_PERIOD IS NULL)   ',
'             AND ((instr (:P95010000610_YEAR || '':'', fp_year || '':'') > 0) OR :P95010000610_YEAR IS NULL ) )          ',
'             )  ',
'          -- group by ',
'                   -- period,',
'                    --period_desc',
'--ORDER BY period ASC*/',
'',
'',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P95010000610_PERIOD,P95010000610_YEAR,P95010000610_UNIT_LOCATION,P95010000610_GROUP'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P95010000610_TYPE'
,p_plug_display_when_cond2=>'REL'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Relieved'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(12511957079782783742)
,p_max_row_count=>'1000000'
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
,p_internal_uid=>7032436095997863540
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12522496949042546863)
,p_db_column_name=>'EMPAI_LOC_ID'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12511959786283783769)
,p_db_column_name=>'EMPAI_PLNT'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12511959503575783766)
,p_db_column_name=>'EMP_DEPT'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12511959202108783763)
,p_db_column_name=>'EMP_DOB'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'DOB'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12511958778240783759)
,p_db_column_name=>'EMP_EMP_ID'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Emp. ID '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12511959363232783765)
,p_db_column_name=>'EMP_END_DATE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'DOE'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12511958999456783761)
,p_db_column_name=>'EMP_GENDER'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12783334868581034571)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Emp.  Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12511959982166783771)
,p_db_column_name=>'EMP_OPTIONAL'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Emp Optional'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12511959624321783767)
,p_db_column_name=>'EMP_POS'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12511959922193783770)
,p_db_column_name=>'EMP_REF'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Emp Ref'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12511959302024783764)
,p_db_column_name=>'EMP_START_DATE'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'DOJ'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12511959113773783762)
,p_db_column_name=>'EMP_STATUS'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Emp Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12511959655992783768)
,p_db_column_name=>'EMP_UNITS'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12523423018389243649)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2776737'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'EMPAI_LOC_ID:EMPAI_PLNT:EMP_EMP_ID:EMP_NAME:EMP_DOB:EMP_START_DATE:EMP_END_DATE:EMP_POS:EMP_DEPT:EMP_GENDER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6190511244222783377)
,p_button_sequence=>10
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:95010000602:&SESSION.::&DEBUG.:::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-arrow-left-alt'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6190564415283783433)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(12515280627423870735)
,p_button_name=>'Download_AA'
,p_static_id=>'download-aa'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6190545305644783416)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(12502635058559558259)
,p_button_name=>'Download_AC'
,p_static_id=>'download-ac'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6190521988357783394)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(12512288162371036848)
,p_button_name=>'Download_AS'
,p_static_id=>'download-as'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6190516759678783387)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(12511960113391783772)
,p_button_name=>'Download_AT'
,p_static_id=>'download-at'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6190570358633783439)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(12776768146575190231)
,p_button_name=>'Download_GEN'
,p_static_id=>'download-gen'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6190549701118783419)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(12502636764565558276)
,p_button_name=>'Download_HI'
,p_static_id=>'download-hi'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6190541253354783412)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(12502633198789558240)
,p_button_name=>'Download_MC'
,p_static_id=>'download-mc'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6190534158428783405)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12496597972368182034)
,p_button_name=>'Download_NE'
,p_static_id=>'download-ne'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6190560071446783428)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(12512663380094305937)
,p_button_name=>'Download_NP'
,p_static_id=>'download-np'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6190527629927783398)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(12512290409729036870)
,p_button_name=>'Download_PR'
,p_static_id=>'download-pr'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6190555352489783425)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(12511956949830783741)
,p_button_name=>'Download_RE'
,p_static_id=>'download-re'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12959986225557474493)
,p_name=>'P95010000610_AGE_VALUE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(12852503943608556979)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12959986092095474492)
,p_name=>'P95010000610_CTC_DEPT_ID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(12852503943608556979)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12966083921280608701)
,p_name=>'P95010000610_CTC_DEPT_ID_1'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(12852503943608556979)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12852864990017557429)
,p_name=>'P95010000610_GENDER_1'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(12852503943608556979)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9853343883885879307)
,p_name=>'P95010000610_GROUP'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(12852503943608556979)
,p_source=>'P95010000610_GROUP'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12496964208043182536)
,p_name=>'P95010000610_PERIOD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12852503943608556979)
,p_use_cache_before_default=>'NO'
,p_source=>'P95010000602_PERIOD'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12502997139193558719)
,p_name=>'P95010000610_REGION_NAME'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(12852503943608556979)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12502994503000558693)
,p_name=>'P95010000610_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(12852503943608556979)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12502994414245558692)
,p_name=>'P95010000610_UNIT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12852503943608556979)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12496964086241182535)
,p_name=>'P95010000610_UNIT_LOCATION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12852503943608556979)
,p_use_cache_before_default=>'NO'
,p_source=>'P95010000602_UNIT_LOC'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12959986323935474494)
,p_name=>'P95010000610_V_NAME'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(12852503943608556979)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12496964354021182537)
,p_name=>'P95010000610_YEAR'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12852503943608556979)
,p_use_cache_before_default=>'NO'
,p_source=>'P95010000602_YEAR'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190578526781783444)
,p_name=>'DOWN_AA'
,p_static_id=>'down-aa'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190564415283783433)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190579058927783445)
,p_event_id=>wwv_flow_imp.id(6190578526781783444)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Download("AVG_actions_menu");',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190576738034783444)
,p_name=>'DOWN_AC'
,p_static_id=>'down-ac'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190545305644783416)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190577279565783444)
,p_event_id=>wwv_flow_imp.id(6190576738034783444)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'Download("ACTC_actions_menu");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190581281674783445)
,p_name=>'DOWN_AS'
,p_static_id=>'down-as'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190521988357783394)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190581739804783445)
,p_event_id=>wwv_flow_imp.id(6190581281674783445)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'Download("AVGSP_actions_menu");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190579475313783445)
,p_name=>'Down_AT'
,p_static_id=>'down-at'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190516759678783387)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190579903619783445)
,p_event_id=>wwv_flow_imp.id(6190579475313783445)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'Download("ATR_actions_menu");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190583948267783447)
,p_name=>'DOWN_GEN'
,p_static_id=>'down-gen'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190570358633783439)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190584442255783447)
,p_event_id=>wwv_flow_imp.id(6190583948267783447)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Download("MF_actions_menu");',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190577673374783444)
,p_name=>'DOWN_HI'
,p_static_id=>'down-hi'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190549701118783419)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190578093214783444)
,p_event_id=>wwv_flow_imp.id(6190577673374783444)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'Download("HVR_actions_menu");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190575844075783442)
,p_name=>'DOWN_MC'
,p_static_id=>'down-mc'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190541253354783412)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190576302904783444)
,p_event_id=>wwv_flow_imp.id(6190575844075783442)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'Download("MCTC_actions_menu");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190583058533783447)
,p_name=>'DOWN_NP'
,p_static_id=>'down-np'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190560071446783428)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190583501689783447)
,p_event_id=>wwv_flow_imp.id(6190583058533783447)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Download("NOP_actions_menu");',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190582112366783445)
,p_name=>'DOWN_PR'
,p_static_id=>'down-pr'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190527629927783398)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190582661293783445)
,p_event_id=>wwv_flow_imp.id(6190582112366783445)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'Download("Prob_actions_menu");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190580308848783445)
,p_name=>'DOWN_RE'
,p_static_id=>'down-re'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190555352489783425)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190580825664783445)
,p_event_id=>wwv_flow_imp.id(6190580308848783445)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Download("REL_actions_menu");',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6190574950099783442)
,p_name=>'Download_NE'
,p_static_id=>'download-ne'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6190534158428783405)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6190575460163783442)
,p_event_id=>wwv_flow_imp.id(6190574950099783442)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'Download("NE_actions_menu");')).to_clob
);
wwv_flow_imp.component_end;
end;
/
