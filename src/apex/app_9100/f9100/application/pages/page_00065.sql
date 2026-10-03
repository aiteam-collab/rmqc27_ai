prompt --application/pages/page_00065
begin
--   Manifest
--     PAGE: 00065
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
 p_id=>65
,p_name=>'Payroll Report 2'
,p_alias=>'PAYROLL-REPORT-2'
,p_step_title=>'Payroll Report 2'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6965193378179490834)
,p_name=>'Report 1'
,p_static_id=>'report'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ps_add_bu,',
'       ps_add_emp_id,',
'       ps_add_elmnt_id,',
'       ps_add_seq_no,',
'       ps_add_elmnt_desc,',
'       SUM(ps_add_amount) AS ps_add_amount',
'  FROM',
'     (',
'SELECT phhd_bu            AS ps_add_bu,',
'       phhd_emp_id        AS ps_add_emp_id,',
'       phln_elmnt_id      AS ps_add_elmnt_id,',
'       pehd_print_seq_no  AS ps_add_seq_no,',
'       pehd_desc1         AS ps_add_elmnt_desc,',
'       SUM(DECODE(phln_mode,''+'',phln_amount,''-'',phln_amount*-1)) AS ps_add_amount',
'  FROM payroll_hist_hd,',
'       payroll_hist_ln,',
'       payroll_elements_hd',
' WHERE phhd_bu        = :bu',
'   AND phhd_year      = :p_year',
'   AND phhd_period    = :p_period',
'   AND phhd_emp_id    = :ps_emp_id',
'   --AND phhd_pyrl_type IN (''N'',''T'')',
'   AND phln_bu        = phhd_bu   ',
'   AND phhd_pyrl_no   = phln_pyrl_no',
'   AND pehd_bu        = phln_bu',
'   AND pehd_elmnt_id  = phln_elmnt_id',
'   AND phln_mode      = ''+''',
'   AND pehd_type NOT LIKE  ''%3%''',
'  -- AND pehd_calc_mode = ''G'' -- ADDTION',
'   AND phln_elmnt_id IN    (SELECT pehd_elmnt_id ',
'                              FROM payroll_elements_hd ',
'                             WHERE pehd_bu   = phhd_bu ',
'                               AND pehd_type =''B''',
'                             UNION ALL ',
'                            SELECT epa_elmnt_id pehd_elmtn_id',
'                              FROM emp_pyrl_allowances ',
'                             WHERE epa_bu     = phhd_bu',
'                               AND epa_emp_id = phhd_emp_id',
'                             UNION ALL',
'                            SELECT DISTINCT epadj_elmnt_id pehd_elmtn_id',
'                              FROM emp_pyrl_adjustments',
'                             WHERE epadj_bu      = phhd_bu',
'                               AND epadj_emp_id  = phhd_emp_id',
'                               AND phln_mode = ''+''',
'                          )',
' GROUP BY phhd_bu,',
'          phhd_emp_id,',
'          phln_elmnt_id,',
'          pehd_print_seq_no,',
'          pehd_desc1',
' UNION ALL',
'SELECT :bu                AS ps_add_bu,',
'       :ps_emp_id         AS ps_add_emp_id,',
'       pehd_elmnt_id      AS ps_add_elmnt_id,',
'       pehd_print_seq_no  AS ps_add_seq_no,',
'       pehd_desc1         AS ps_add_elmnt_desc,',
'       0                  AS ps_add_amount',
'  FROM payroll_elements_hd',
' WHERE pehd_bu       = :bu',
'   AND pehd_type     NOT LIKE  ''%3%''  ',
'--   AND pehd_calc_mode = ''G'' -- ADDTION',
'   AND pehd_elmnt_id  IN (SELECT DISTINCT phln_elmnt_id ',
'                            FROM payroll_hist_hd,',
'                                 payroll_hist_ln',
'                           WHERE phhd_bu        = ''VIKK''',
'                             AND phhd_year      = ''202122''',
'                             AND phhd_period    = ''10''',
'                             AND (phhd_emp_id   = :p_emp_id OR :p_emp_id IS NULL)   ',
'                             --AND phhd_pyrl_type IN (''N'')',
'                             AND phln_bu        = phhd_bu   ',
'                             AND phhd_pyrl_no   = phln_pyrl_no',
'                             AND phln_mode      = ''+'')  ',
'     )                   ',
' GROUP BY ps_add_bu,',
'          ps_add_emp_id,',
'          ps_add_elmnt_id,',
'          ps_add_seq_no,',
'          ps_add_elmnt_desc',
' ORDER BY ps_add_bu,',
'          ps_add_emp_id,',
'          ps_add_seq_no,',
'          ps_add_elmnt_id'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650546578386505396)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6965195794200490848)
,p_query_column_id=>6
,p_column_alias=>'PS_ADD_AMOUNT'
,p_column_display_sequence=>60
,p_column_heading=>'Ps Add Amount'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6965193759915490838)
,p_query_column_id=>1
,p_column_alias=>'PS_ADD_BU'
,p_column_display_sequence=>10
,p_column_heading=>'Ps Add Bu'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6965195416214490846)
,p_query_column_id=>5
,p_column_alias=>'PS_ADD_ELMNT_DESC'
,p_column_display_sequence=>50
,p_column_heading=>'Ps Add Elmnt Desc'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6965194598038490842)
,p_query_column_id=>3
,p_column_alias=>'PS_ADD_ELMNT_ID'
,p_column_display_sequence=>30
,p_column_heading=>'Ps Add Elmnt Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6965194219485490838)
,p_query_column_id=>2
,p_column_alias=>'PS_ADD_EMP_ID'
,p_column_display_sequence=>20
,p_column_heading=>'Ps Add Emp Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6965195006680490843)
,p_query_column_id=>4
,p_column_alias=>'PS_ADD_SEQ_NO'
,p_column_display_sequence=>40
,p_column_heading=>'Ps Add Seq No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp.component_end;
end;
/
