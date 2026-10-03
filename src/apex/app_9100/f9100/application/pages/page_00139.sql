prompt --application/pages/page_00139
begin
--   Manifest
--     PAGE: 00139
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
 p_id=>139
,p_name=>'HRM Notifaction'
,p_alias=>'HRM-NOTIFACTION'
,p_page_mode=>'MODAL'
,p_step_title=>'HRM Notifaction'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-GV-table th.a-GV-headerGroup {',
'    font-weight: var(--a-gv-header-cell-font-weight, var(--a-base-font-weight-bold, 700));',
'    background: white !important;',
'    color: black !important;',
'}',
'',
'.a-IRR-table {',
'           white-space: nowrap;',
'           word-wrap: break-word;',
'  }',
''))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1400'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6458701833467292832)
,p_plug_name=>'Employee Profiles'
,p_static_id=>'employee-profiles'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT ephd_bu,',
'        ephd_doc_no,',
'        ephd_emp_id,',
'        emp_first_name1,',
'        emp_middle_name1,',
'        emp_last_name1,',
'		initcap(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1) emp_name,',
'        ephd_action_id,',
'		(SELECT pact_action_desc1 ',
'           FROM profile_actions',
'          WHERE pact_bu = ephd_bu',
'            AND pact_action_id = ephd_action_id) action_desc,',
'		(SELECT CASE pact_action_type WHEN ''N'' THEN ''New Hire''',
'		                              WHEN ''O'' THEN ''Others''',
'		                              WHEN ''R'' THEN ''Retirement''',
'		                              WHEN ''T'' THEN ''Termination''',
'		                              WHEN ''C'' THEN ''To Confirmation''',
'		                              WHEN ''P'' THEN ''To Probation''',
'		                              WHEN ''S'' THEN ''Suspend''',
'		                              WHEN ''J'' THEN ''Rejoin'' END action_type ',
'      FROM profile_actions',
'       WHERE pact_bu = ephd_bu',
'       AND pact_action_id = ephd_action_id) action_type,',
'      to_char(ephd_date,func_find_date_format(:global_bu))ephd_date,',
'      ephd_year,',
'      (SELECT pcp_long_desc',
'         FROM payroll_cal_period',
'        WHERE pcp_bu = ephd_bu',
'          AND pcp_clndr_id = (SELECT emp_clndr_id ',
'                                FROM employees',
'                               WHERE emp_bu     = ephd_bu',
'                                 AND emp_emp_id = ephd_emp_id)',
'          AND pcp_year = ephd_year',
'          AND pcp_period = ephd_period) ephd_period,',
'      ephd_period ephd_period1,',
'      decode (ephd_period ,''1'' , ''April''    ,',
'                           ''2'' , ''May''      ,',
'                           ''3'' , ''June''     ,',
'                           ''4'' , ''July''     ,',
'                           ''5'' , ''August''   ,',
'                           ''6'' , ''September'',',
'                           ''7'' , ''October''  ,',
'                           ''8'' , ''November'' ,',
'                           ''9'' , ''December'' ,',
'                           ''10'' , ''January'' ,',
'                           ''11'' , ''February'',',
'                           ''12'' , ''March''   ) ephd_period2,',
'      to_char(ephd_eff_date,func_find_date_format(:global_bu))ephd_eff_date,',
'      ephd_eff_date ephd_eff_date1,',
'      ephd_cur_plnt,',
'      ephd_cur_dept_id,',
'      ephd_cur_dept_name,',
'      ephd_cur_job_id,',
'      ephd_cur_job_title,',
'      ephd_cur_pos_id,',
'      ephd_cur_pos_name,',
'      ephd_cur_loc_id,',
'      ephd_cur_loc_name,',
'      ephd_cur_grade_id,',
'	  (SELECT grade_desc1 ',
'         FROM grades',
'        WHERE grade_bu = ephd_bu',
'          AND grade_grade_id = ephd_cur_grade_id )grade_desc,',
'      ephd_cur_basic_sal,',
'      (SELECT bup_name1',
'         FROM bus_unit_plants',
'        WHERE bup_bu = ephd_bu',
'          AND emp_bu = :global_bu',
'          AND ephd_emp_id =emp_emp_id',
'          AND bup_plant_id = ephd_new_plnt) ephd_new_plnt,',
'      func_find_plnt_qry_desc(ephd_bu,ephd_new_plnt,1) plnt_desc,',
'      ephd_new_dept_id,',
'      ephd_new_dept_name,',
'      ephd_new_job_id,',
'      ephd_new_job_title,',
'      ephd_new_pos_id,',
'      ephd_new_pos_name,',
'      ephd_new_loc_id,',
'      ephd_new_loc_name,',
'      ephd_new_grade_id,',
'	  (SELECT grade_desc1 ',
'         FROM grades',
'        WHERE grade_bu = ephd_bu',
'          AND grade_grade_id = ephd_new_grade_id ) new_grade_desc,',
'      ephd_new_basic_sal,',
'      to_char(ephd_cntr_date_from,func_find_date_format(:global_bu))ephd_cntr_date_from,',
'      to_char(ephd_cntr_date_to,func_find_date_format(:global_bu))ephd_cntr_date_to,',
'      ephd_status ephd_status1,',
'	  (CASE ephd_status WHEN ''E'' THEN ''Draft''',
'		                WHEN ''N'' THEN ''Confirmed''',
'						WHEN ''A'' THEN ''Approved''',
'						WHEN ''C'' THEN ''Cancelled'' END) ephd_status,',
'      decode(ephd_status,''E'',''Draft'',''N'',''Confirmed'',''A'',''Approved'',''C'',''Cancelled'')status1,',
'      decode(ephd_status,''E'',''blue'',''A'',''cornflowerblue'',''A'',''green'',''C'',''red'')color,      ',
'      ephd_next_increment_due,',
'	  (CASE ephd_emp_type WHEN ''F'' THEN ''Company''',
'		                  WHEN ''C'' THEN ''Contract''',
'						  WHEN ''S'' THEN ''Subcontractor''',
'						  WHEN ''T'' THEN ''Temporary''',
'						  WHEN ''R'' THEN ''Trainee''',
'						  WHEN ''A'' THEN ''Apprentice'' END) ephd_emp_type,',
'      to_char(ephd_new_basic_eff_from,func_find_date_format(:global_bu))ephd_new_basic_eff_from,',
'      ephd_subcntr_id,',
'      ephd_next_appraisal_due,',
'      ephd_appraisal_type,',
'      ephd_appraisal_method,',
'      ephd_appr_flag,',
'      ephd_ref,',
'      ephd_cur_per_day_wage,',
'      ephd_new_per_day_wage,',
'      ephd_prof_batch_no,',
'      ephd_tcolumn,',
'      ephd_file_name,',
'      ephd_ter_req_no,',
'      ephd_cur_mon_gross,',
'      ephd_new_mon_gross,',
'      ephd_cur_mon_ctc,',
'      ephd_new_mon_ctc,',
'      emp_gender,',
'      (SELECT pact_action_type',
'         FROM profile_actions',
'        WHERE pact_bu = ephd_bu',
'          AND pact_action_id = ephd_action_id) ephd_action_type,',
'      decode(emp_gender,''F'',''Female'',''M'',''Male'') gender  ',
' FROM employees,',
'      emp_profiles_hd,',
'      emp_active_infos',
'WHERE emp_bu     = emp_bu',
'  AND emp_emp_id = ephd_emp_id',
'  AND emp_bu     = empai_bu',
'  AND emp_emp_id = empai_emp_id',
'  AND emp_bu     = :global_bu ',
'  AND ephd_status = ''N'''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
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
 p_id=>wwv_flow_imp.id(6458701877654292833)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>976740042110681805
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458703193424292846)
,p_db_column_name=>'ACTION_DESC'
,p_display_order=>310
,p_column_identifier=>'M'
,p_column_label=>'Action'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458703324485292847)
,p_db_column_name=>'ACTION_TYPE'
,p_display_order=>320
,p_column_identifier=>'N'
,p_column_label=>'Action Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459732444887452935)
,p_db_column_name=>'COLOR'
,p_display_order=>730
,p_column_identifier=>'AZ'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458702904921292843)
,p_db_column_name=>'EMP_FIRST_NAME1'
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>'Emp First Name1'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458702359025292837)
,p_db_column_name=>'EMP_GENDER'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Emp Gender'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458703111823292845)
,p_db_column_name=>'EMP_LAST_NAME1'
,p_display_order=>100
,p_column_identifier=>'L'
,p_column_label=>'Emp Last Name1'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458702993803292844)
,p_db_column_name=>'EMP_MIDDLE_NAME1'
,p_display_order=>90
,p_column_identifier=>'K'
,p_column_label=>'Emp Middle Name1'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458702105962292835)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458702506581292839)
,p_db_column_name=>'EPHD_ACTION_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Ephd Action Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459734392629452955)
,p_db_column_name=>'EPHD_ACTION_TYPE'
,p_display_order=>820
,p_column_identifier=>'BT'
,p_column_label=>'Ephd Action Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459733124549452942)
,p_db_column_name=>'EPHD_APPRAISAL_METHOD'
,p_display_order=>760
,p_column_identifier=>'BG'
,p_column_label=>'Ephd Appraisal Method'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459732973124452941)
,p_db_column_name=>'EPHD_APPRAISAL_TYPE'
,p_display_order=>750
,p_column_identifier=>'BF'
,p_column_label=>'Ephd Appraisal Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459733226886452943)
,p_db_column_name=>'EPHD_APPR_FLAG'
,p_display_order=>770
,p_column_identifier=>'BH'
,p_column_label=>'Ephd Appr Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458702584494292840)
,p_db_column_name=>'EPHD_BU'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Ephd Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459731948856452930)
,p_db_column_name=>'EPHD_CNTR_DATE_FROM'
,p_display_order=>250
,p_column_identifier=>'AU'
,p_column_label=>'Ephd Cntr Date From'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459732012737452931)
,p_db_column_name=>'EPHD_CNTR_DATE_TO'
,p_display_order=>260
,p_column_identifier=>'AV'
,p_column_label=>'Ephd Cntr Date To'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458705222526292866)
,p_db_column_name=>'EPHD_CUR_BASIC_SAL'
,p_display_order=>430
,p_column_identifier=>'AG'
,p_column_label=>'Basic Salary'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458704189469292856)
,p_db_column_name=>'EPHD_CUR_DEPT_ID'
,p_display_order=>140
,p_column_identifier=>'W'
,p_column_label=>'Cur Dept. ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458704288091292857)
,p_db_column_name=>'EPHD_CUR_DEPT_NAME'
,p_display_order=>380
,p_column_identifier=>'X'
,p_column_label=>'Cur. Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458705062808292864)
,p_db_column_name=>'EPHD_CUR_GRADE_ID'
,p_display_order=>180
,p_column_identifier=>'AE'
,p_column_label=>'Ephd Cur Grade Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458704449441292858)
,p_db_column_name=>'EPHD_CUR_JOB_ID'
,p_display_order=>150
,p_column_identifier=>'Y'
,p_column_label=>'Cur. Job ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458704521313292859)
,p_db_column_name=>'EPHD_CUR_JOB_TITLE'
,p_display_order=>390
,p_column_identifier=>'Z'
,p_column_label=>'Cur. Job Title'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458704785425292862)
,p_db_column_name=>'EPHD_CUR_LOC_ID'
,p_display_order=>170
,p_column_identifier=>'AC'
,p_column_label=>'Ephd Cur Loc Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458704958230292863)
,p_db_column_name=>'EPHD_CUR_LOC_NAME'
,p_display_order=>410
,p_column_identifier=>'AD'
,p_column_label=>'Cur. Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459734232271452953)
,p_db_column_name=>'EPHD_CUR_MON_CTC'
,p_display_order=>800
,p_column_identifier=>'BR'
,p_column_label=>'Ephd Cur Mon Ctc'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459733977594452951)
,p_db_column_name=>'EPHD_CUR_MON_GROSS'
,p_display_order=>780
,p_column_identifier=>'BP'
,p_column_label=>'Ephd Cur Mon Gross'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459733447045452945)
,p_db_column_name=>'EPHD_CUR_PER_DAY_WAGE'
,p_display_order=>650
,p_column_identifier=>'BJ'
,p_column_label=>'Cur. Wages /Day'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458704133418292855)
,p_db_column_name=>'EPHD_CUR_PLNT'
,p_display_order=>370
,p_column_identifier=>'V'
,p_column_label=>'Cur. Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458704577720292860)
,p_db_column_name=>'EPHD_CUR_POS_ID'
,p_display_order=>160
,p_column_identifier=>'AA'
,p_column_label=>'Cur. Pos Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458704681210292861)
,p_db_column_name=>'EPHD_CUR_POS_NAME'
,p_display_order=>400
,p_column_identifier=>'AB'
,p_column_label=>'Cur. Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458703375485292848)
,p_db_column_name=>'EPHD_DATE'
,p_display_order=>330
,p_column_identifier=>'O'
,p_column_label=>'Doc. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458702714400292841)
,p_db_column_name=>'EPHD_DOC_NO'
,p_display_order=>290
,p_column_identifier=>'H'
,p_column_label=>'Profile'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458703911168292853)
,p_db_column_name=>'EPHD_EFF_DATE'
,p_display_order=>360
,p_column_identifier=>'T'
,p_column_label=>'Eff. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458703998799292854)
,p_db_column_name=>'EPHD_EFF_DATE1'
,p_display_order=>130
,p_column_identifier=>'U'
,p_column_label=>'Ephd Eff Date1'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458702836557292842)
,p_db_column_name=>'EPHD_EMP_ID'
,p_display_order=>300
,p_column_identifier=>'I'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459732654118452937)
,p_db_column_name=>'EPHD_EMP_TYPE'
,p_display_order=>550
,p_column_identifier=>'BB'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459733799739452949)
,p_db_column_name=>'EPHD_FILE_NAME'
,p_display_order=>710
,p_column_identifier=>'BN'
,p_column_label=>'Ephd File Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459732682047452938)
,p_db_column_name=>'EPHD_NEW_BASIC_EFF_FROM'
,p_display_order=>560
,p_column_identifier=>'BC'
,p_column_label=>'Effective From'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458706530918292879)
,p_db_column_name=>'EPHD_NEW_BASIC_SAL'
,p_display_order=>500
,p_column_identifier=>'AT'
,p_column_label=>'New Basic Salary'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458705509105292869)
,p_db_column_name=>'EPHD_NEW_DEPT_ID'
,p_display_order=>200
,p_column_identifier=>'AJ'
,p_column_label=>'Ephd New Dept Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458705614161292870)
,p_db_column_name=>'EPHD_NEW_DEPT_NAME'
,p_display_order=>450
,p_column_identifier=>'AK'
,p_column_label=>'New Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458706278605292877)
,p_db_column_name=>'EPHD_NEW_GRADE_ID'
,p_display_order=>240
,p_column_identifier=>'AR'
,p_column_label=>'Ephd New Grade Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458705709231292871)
,p_db_column_name=>'EPHD_NEW_JOB_ID'
,p_display_order=>210
,p_column_identifier=>'AL'
,p_column_label=>'Ephd New Job Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458705777789292872)
,p_db_column_name=>'EPHD_NEW_JOB_TITLE'
,p_display_order=>460
,p_column_identifier=>'AM'
,p_column_label=>'New Job Title'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458706137445292875)
,p_db_column_name=>'EPHD_NEW_LOC_ID'
,p_display_order=>230
,p_column_identifier=>'AP'
,p_column_label=>'Ephd New Loc Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458706255041292876)
,p_db_column_name=>'EPHD_NEW_LOC_NAME'
,p_display_order=>480
,p_column_identifier=>'AQ'
,p_column_label=>'New Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459734272082452954)
,p_db_column_name=>'EPHD_NEW_MON_CTC'
,p_display_order=>810
,p_column_identifier=>'BS'
,p_column_label=>'Ephd New Mon Ctc'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459734071553452952)
,p_db_column_name=>'EPHD_NEW_MON_GROSS'
,p_display_order=>790
,p_column_identifier=>'BQ'
,p_column_label=>'Ephd New Mon Gross'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459733469328452946)
,p_db_column_name=>'EPHD_NEW_PER_DAY_WAGE'
,p_display_order=>660
,p_column_identifier=>'BK'
,p_column_label=>'New Wages /Day'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458705367066292867)
,p_db_column_name=>'EPHD_NEW_PLNT'
,p_display_order=>190
,p_column_identifier=>'AH'
,p_column_label=>'Ephd New Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458705940079292873)
,p_db_column_name=>'EPHD_NEW_POS_ID'
,p_display_order=>220
,p_column_identifier=>'AN'
,p_column_label=>'Ephd New Pos Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458706048808292874)
,p_db_column_name=>'EPHD_NEW_POS_NAME'
,p_display_order=>470
,p_column_identifier=>'AO'
,p_column_label=>'New Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459732892986452940)
,p_db_column_name=>'EPHD_NEXT_APPRAISAL_DUE'
,p_display_order=>690
,p_column_identifier=>'BE'
,p_column_label=>'Ephd Next Appraisal Due'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459732525816452936)
,p_db_column_name=>'EPHD_NEXT_INCREMENT_DUE'
,p_display_order=>540
,p_column_identifier=>'BA'
,p_column_label=>'Next. Incre. Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458703598921292850)
,p_db_column_name=>'EPHD_PERIOD'
,p_display_order=>110
,p_column_identifier=>'Q'
,p_column_label=>'Ephd Period'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458703684548292851)
,p_db_column_name=>'EPHD_PERIOD1'
,p_display_order=>120
,p_column_identifier=>'R'
,p_column_label=>'Ephd Period1'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458703854980292852)
,p_db_column_name=>'EPHD_PERIOD2'
,p_display_order=>350
,p_column_identifier=>'S'
,p_column_label=>'Period'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459733640037452947)
,p_db_column_name=>'EPHD_PROF_BATCH_NO'
,p_display_order=>670
,p_column_identifier=>'BL'
,p_column_label=>'Batch No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459733309860452944)
,p_db_column_name=>'EPHD_REF'
,p_display_order=>640
,p_column_identifier=>'BI'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459732217288452933)
,p_db_column_name=>'EPHD_STATUS'
,p_display_order=>280
,p_column_identifier=>'AX'
,p_column_label=>'Ephd Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459732120690452932)
,p_db_column_name=>'EPHD_STATUS1'
,p_display_order=>270
,p_column_identifier=>'AW'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459732855673452939)
,p_db_column_name=>'EPHD_SUBCNTR_ID'
,p_display_order=>740
,p_column_identifier=>'BD'
,p_column_label=>'Ephd Subcntr Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459733723489452948)
,p_db_column_name=>'EPHD_TCOLUMN'
,p_display_order=>700
,p_column_identifier=>'BM'
,p_column_label=>'Ephd Tcolumn'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459733945580452950)
,p_db_column_name=>'EPHD_TER_REQ_NO'
,p_display_order=>720
,p_column_identifier=>'BO'
,p_column_label=>'Ephd Ter Req No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458703503287292849)
,p_db_column_name=>'EPHD_YEAR'
,p_display_order=>340
,p_column_identifier=>'P'
,p_column_label=>'Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459734560460452956)
,p_db_column_name=>'GENDER'
,p_display_order=>680
,p_column_identifier=>'BU'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458705088653292865)
,p_db_column_name=>'GRADE_DESC'
,p_display_order=>420
,p_column_identifier=>'AF'
,p_column_label=>'Cur. Grade'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458706424151292878)
,p_db_column_name=>'NEW_GRADE_DESC'
,p_display_order=>490
,p_column_identifier=>'AS'
,p_column_label=>'New Grade'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6458705374854292868)
,p_db_column_name=>'PLNT_DESC'
,p_display_order=>440
,p_column_identifier=>'AI'
,p_column_label=>'New Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6459732313782452934)
,p_db_column_name=>'STATUS1'
,p_display_order=>520
,p_column_identifier=>'AY'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#STATUS1#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6459286955732387386)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4883927'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EPHD_DOC_NO:EPHD_DATE:EPHD_EMP_ID:EMP_NAME:GENDER:ACTION_DESC:EPHD_EMP_TYPE:ACTION_TYPE:EPHD_CUR_POS_NAME:EPHD_CUR_DEPT_NAME:GRADE_DESC:EPHD_CUR_JOB_TITLE:EPHD_CUR_LOC_NAME:EPHD_CUR_PLNT:EPHD_CUR_BASIC_SAL:EPHD_CUR_PER_DAY_WAGE:EPHD_NEW_BASIC_EFF_FRO'
||'M:EPHD_NEW_POS_NAME:EPHD_NEW_DEPT_NAME:EPHD_NEW_JOB_TITLE:NEW_GRADE_DESC:EPHD_NEW_LOC_NAME:PLNT_DESC:EPHD_NEW_BASIC_SAL:EPHD_NEW_PER_DAY_WAGE:EPHD_PROF_BATCH_NO:EPHD_NEXT_INCREMENT_DUE:EPHD_YEAR:EPHD_PERIOD2:EPHD_REF:STATUS1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5970941124056044518)
,p_name=>'link'
,p_static_id=>'link'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5970941560037044518)
,p_event_id=>wwv_flow_imp.id(5970941124056044518)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''a.nolink'').attr("onclick","return false;" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5970940136979044517)
,p_name=>'New_2'
,p_static_id=>'new'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P139_UNIT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5970940699665044518)
,p_event_id=>wwv_flow_imp.id(5970940136979044517)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P139_UNIT',
  'language', 'PLSQL',
  'plsql_code', ':P139_NEW := :P139_UNIT;',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5970939810847044517)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Process'
,p_static_id=>'delete-process'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   UPDATE doc_mgmt ',
'      SET dm_status  = ''D''',
'    WHERE dm_bu      = :GLOBAL_bu',
'      AND dm_doc_no  = :P139_DOC_NO;',
'   COMMIT;',
'  APEX_APPLICATION.G_PRINT_SUCCESS_MESSAGE := ''Line Deleted.'';',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'delete'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>488977975303433489
);
wwv_flow_imp.component_end;
end;
/
