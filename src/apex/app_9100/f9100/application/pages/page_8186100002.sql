prompt --application/pages/page_8186100002
begin
--   Manifest
--     PAGE: 8186100002
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
 p_id=>8186100002
,p_name=>'Employees'
,p_alias=>'EMPLOYEES'
,p_step_title=>'Employees'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(11124861197562318725)
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11092000482950780589)
,p_name=>'Employees'
,p_static_id=>'employees'
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ROWID,',
'       emp_emp_id,',
'       TRIM(emp_salution||'' ''||INITCAP(TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1))) emp_name,',
'       emp_start_date,',
'       (SELECT bup_name1||'' - ''||bup_plant_id',
'          FROM bus_unit_plants',
'         WHERE bup_bu       = emp_bu',
'           AND bup_plant_id = emp_asgnd_plnt) emp_asgnd_plnt,',
'       DECODE(emp_type, ''E'', ''Company'', ''C'', ''Contract'', ''S'', ''Subcontractor'', ''R'', ''Trainee'', ''A'', ''Apprentice'', ''T'', ''Temporary'') emp_type,',
'       DECODE(emp_gender, ''M'', ''Male'', ''F'', ''Female'') emp_gender,',
'       emp_off_email_id,',
'       (SELECT empimg_bu',
'          FROM employee_images',
'         WHERE empimg_bu = emp_bu',
'           AND empimg_emp_id = emp_emp_id) emp_img',
'  FROM employees',
' WHERE emp_bu = :GLOBAL_BU',
'   AND emp_type NOT IN (''O'')',
'   AND emp_wfm_emp_type IN (''S'')',
'   AND emp_asgnd_plnt IN (SELECT auba_plant',
'                            FROM appl_user_plant_access',
'                           WHERE auba_bu      = :GLOBAL_BU',
'                             AND auba_user_id = :GLOBAL_USER',
'                             AND TRUNC(SYSDATE) BETWEEN TRUNC(auba_from) AND TRUNC(auba_to))',
'ORDER BY emp_emp_id  '))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650549206308505401)
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
 p_id=>wwv_flow_imp.id(11092001348647780598)
,p_query_column_id=>5
,p_column_alias=>'EMP_ASGND_PLNT'
,p_column_display_sequence=>3
,p_column_heading=>'Unit'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11158727164797811262)
,p_query_column_id=>2
,p_column_alias=>'EMP_EMP_ID'
,p_column_display_sequence=>8
,p_column_heading=>'Emp Emp Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11092001543899780600)
,p_query_column_id=>7
,p_column_alias=>'EMP_GENDER'
,p_column_display_sequence=>5
,p_column_heading=>'Gender'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11092001765507780602)
,p_query_column_id=>9
,p_column_alias=>'EMP_IMG'
,p_column_display_sequence=>7
,p_column_heading=>'Emp Img'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11158727272805811263)
,p_query_column_id=>3
,p_column_alias=>'EMP_NAME'
,p_column_display_sequence=>9
,p_column_heading=>'Emp Name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11092001713648780601)
,p_query_column_id=>8
,p_column_alias=>'EMP_OFF_EMAIL_ID'
,p_column_display_sequence=>6
,p_column_heading=>'Work Email'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11092001274540780597)
,p_query_column_id=>4
,p_column_alias=>'EMP_START_DATE'
,p_column_display_sequence=>2
,p_column_heading=>'Date of Join'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11092001520223780599)
,p_query_column_id=>6
,p_column_alias=>'EMP_TYPE'
,p_column_display_sequence=>4
,p_column_heading=>'Type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11092000974191780594)
,p_query_column_id=>1
,p_column_alias=>'ROWID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp.component_end;
end;
/
