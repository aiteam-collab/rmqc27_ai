prompt --application/pages/page_00148
begin
--   Manifest
--     PAGE: 00148
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
 p_id=>148
,p_name=>'Waiting for approval Overtime'
,p_alias=>'WAITING-FOR-APPROVAL-OVERTIME'
,p_page_mode=>'MODAL'
,p_step_title=>'Waiting for approval Overtime'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-table {',
'          white-space: nowrap;',
'          word-wrap: break-word;',
'  }',
''))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1400'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5971781226724982359)
,p_plug_name=>'Waiting for approval Overtime'
,p_static_id=>'waiting-for-approval-overtime'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    a.eohd_bu,',
'    a.eohd_plnt,',
'    a.eohd_year,',
'    DECODE(A.eohd_period,''1'',''April'',',
'                                    ''2'',''May'',',
'                                    ''3'',''June'',',
'                                    ''4'',''July'',',
'                                    ''5'',''August'',',
'                                    ''6'',''September'',',
'                                    ''7'',''October'',',
'                                    ''8'',''November'',',
'                                    ''9'',''December'',',
'                                    ''10'',''January'',',
'                                    ''11'',''February'',',
'                                    ''12'',''March'')eohd_period,',
'    ( SELECT pcp_start_date',
'        FROM payroll_cal_period',
'       WHERE pcp_bu       = a.eohd_bu',
'         AND pcp_clndr_id = a.eohd_clndr_id',
'         AND pcp_year     = a.eohd_year',
'         AND pcp_period   = a.eohd_period',
'    )  date_from,',
'    ( SELECT pcp_end_date',
'        FROM payroll_cal_period',
'       WHERE pcp_bu = a.eohd_bu',
'         AND pcp_clndr_id = a.eohd_clndr_id',
'         AND pcp_year = a.eohd_year',
'         AND pcp_period = a.eohd_period',
'    ) date_to,',
'    a.eohd_status,',
'    decode(a.eohd_status, ''E'', ''Draft'', ''N'', ''Entry Completed'',''A'', ''Approved'', ''C'', ''Cancelled'', ''D'', ''Reversed'') status,',
'    decode(a.eohd_status, ''E'', ''blue'', ''N'', ''cornflowerblue'',''A'', ''green'', ''C'', ''red'') color,',
'    a.eohd_doc_no,',
'    a.eohd_date,',
'    a.eohd_reference,',
'    a.eohd_chk_flag,',
'    a.eohd_tcolumn,',
'    a.eohd_file_name,',
'    eoln_type,',
'    a.eohd_ot_type,',
'    a.eohd_cre_by,',
'    a.eohd_cre_ip_addr,',
'    a.eohd_cre_os_user,',
'    a.eohd_cre_date,',
'    a.eohd_upd_by,',
'    a.eohd_upd_ip_addr,',
'    a.eohd_upd_os_user,',
'    a.eohd_upd_date,',
'    a.eohd_clndr_id,',
'    ( SELECT pc_clndr_name',
'        FROM pyrl_clndr',
'       WHERE pc_bu = a.eohd_bu',
'         AND pc_clndr_id = a.eohd_clndr_id',
'         AND pc_active_flag = ''Y''',
'    ) clndr_desc,',
'    eoln_emp_id,',
'    ( SELECT TRIM(emp_first_name1',
'                 || '' ''',
'                 || emp_middle_name1',
'                 || '' ''',
'                 || emp_last_name1) emp_name',
'        FROM employees',
'       WHERE emp_bu = eoln_bu',
'         AND emp_emp_id = eoln_emp_id',
'    ) emp_name,',
'    eoln_dept_id,',
'    ( SELECT hrpos_pos_name1',
'        FROM hr_positions,',
'             emp_active_infos',
'       WHERE hrpos_bu = empai_bu',
'         AND hrpos_pos_id = empai_pos_id',
'         AND empai_bu = eoln_bu',
'         AND empai_emp_id = eoln_emp_id',
'         AND eohd_bu = eoln_bu',
'    ) designation_desc,',
'    ( SELECT dept_name1',
'        FROM departments',
'       WHERE dept_bu = eoln_bu',
'         AND dept_id = eoln_dept_id',
'    ) department_desc,',
'    ( SELECT bup_name1',
'        FROM bus_unit_plants,',
'             employees',
'       WHERE bup_bu = emp_bu',
'         AND bup_plant_id = emp_asgnd_plnt',
'         AND eoln_bu = emp_bu',
'         AND eoln_emp_id = emp_emp_id',
'    ) unit_name,',
'    ( SELECT bup_plant_id',
'        FROM bus_unit_plants,',
'             employees',
'       WHERE bup_bu = emp_bu',
'         AND bup_plant_id = emp_asgnd_plnt',
'         AND eoln_bu = emp_bu',
'         AND eoln_emp_id = emp_emp_id',
'    ) unit,',
'    a.eohd_cre_emp_id,',
'    a.eohd_upd_emp_id,',
'    eoln_cre_by,',
'    to_char(eoln_cre_date, ''DD-MM-RRRR HH12:MI AM'')    eoln_cre_date',
'  FROM emp_ovrt_hd a, ',
'       emp_ovrt_ln',
' WHERE eohd_bu = eoln_bu',
'   AND eohd_doc_no = eoln_doc_no',
'   AND eohd_bu = :global_bu',
'   AND eohd_status = ''N''',
'ORDER BY eohd_doc_no DESC'))
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
 p_id=>wwv_flow_imp.id(5971781310664982360)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>489819475121371332
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971864921659055637)
,p_db_column_name=>'CLNDR_DESC'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Calendar'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971782145943982369)
,p_db_column_name=>'COLOR'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971781773470982365)
,p_db_column_name=>'DATE_FROM'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'OT Date From'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971781886603982366)
,p_db_column_name=>'DATE_TO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'OT Date To'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971865396396055642)
,p_db_column_name=>'DEPARTMENT_DESC'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971865315560055641)
,p_db_column_name=>'DESIGNATION_DESC'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971865049997055639)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971781354759982361)
,p_db_column_name=>'EOHD_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Eohd Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971782537290982373)
,p_db_column_name=>'EOHD_CHK_FLAG'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Eohd Chk Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971864830160055636)
,p_db_column_name=>'EOHD_CLNDR_ID'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Eohd Clndr Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971783115446982378)
,p_db_column_name=>'EOHD_CRE_BY'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Eohd Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971864250858055631)
,p_db_column_name=>'EOHD_CRE_DATE'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Eohd Cre Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971865654689055645)
,p_db_column_name=>'EOHD_CRE_EMP_ID'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Eohd Cre Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971864099136055629)
,p_db_column_name=>'EOHD_CRE_IP_ADDR'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Eohd Cre Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971864187649055630)
,p_db_column_name=>'EOHD_CRE_OS_USER'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Eohd Cre Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971782338959982371)
,p_db_column_name=>'EOHD_DATE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971782250837982370)
,p_db_column_name=>'EOHD_DOC_NO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971782783482982375)
,p_db_column_name=>'EOHD_FILE_NAME'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Eohd File Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971783028249982377)
,p_db_column_name=>'EOHD_OT_TYPE'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Eohd Ot Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971781722046982364)
,p_db_column_name=>'EOHD_PERIOD'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Period'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971781491848982362)
,p_db_column_name=>'EOHD_PLNT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Eohd Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971782506383982372)
,p_db_column_name=>'EOHD_REFERENCE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Eohd Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971782015500982367)
,p_db_column_name=>'EOHD_STATUS'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Eohd Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971782729811982374)
,p_db_column_name=>'EOHD_TCOLUMN'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Eohd Tcolumn'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971864378670055632)
,p_db_column_name=>'EOHD_UPD_BY'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Eohd Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971864694952055635)
,p_db_column_name=>'EOHD_UPD_DATE'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Eohd Upd Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971865784970055646)
,p_db_column_name=>'EOHD_UPD_EMP_ID'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Eohd Upd Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971864534463055633)
,p_db_column_name=>'EOHD_UPD_IP_ADDR'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Eohd Upd Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971864557963055634)
,p_db_column_name=>'EOHD_UPD_OS_USER'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Eohd Upd Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971781591235982363)
,p_db_column_name=>'EOHD_YEAR'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Year'
,p_column_type=>'NUMBER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971865915557055647)
,p_db_column_name=>'EOLN_CRE_BY'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Eoln Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971866002774055648)
,p_db_column_name=>'EOLN_CRE_DATE'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Eoln Cre Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971865148816055640)
,p_db_column_name=>'EOLN_DEPT_ID'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Eoln Dept Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971864954808055638)
,p_db_column_name=>'EOLN_EMP_ID'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971782892441982376)
,p_db_column_name=>'EOLN_TYPE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Eoln Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971782116187982368)
,p_db_column_name=>'STATUS'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971865619381055644)
,p_db_column_name=>'UNIT'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971865444029055643)
,p_db_column_name=>'UNIT_NAME'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5971881401138058010)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4899196'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'EOHD_DOC_NO:EOHD_DATE:EOHD_YEAR:EOHD_PERIOD:DATE_FROM:DATE_TO:EOLN_EMP_ID:EMP_NAME:DESIGNATION_DESC:DEPARTMENT_DESC:UNIT_NAME'
);
wwv_flow_imp.component_end;
end;
/
