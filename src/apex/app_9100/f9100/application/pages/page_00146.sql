prompt --application/pages/page_00146
begin
--   Manifest
--     PAGE: 00146
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
 p_id=>146
,p_name=>'Waiting for approval Encashment Request'
,p_alias=>'WAITING-FOR-APPROVAL-ENCASHMENT-REQUEST'
,p_page_mode=>'MODAL'
,p_step_title=>'Waiting for approval Encashment Request'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-table {',
'          white-space: nowrap;',
'          word-wrap: break-word;',
'  }'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1400'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5971673915909900239)
,p_plug_name=>'Waiting for approval Encashment Request'
,p_static_id=>'waiting-for-approval-encashment-request'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lr_req_date,',
'       lr_req_no,',
'       lr_emp_id,',
'       (SELECT INITCAP(UPPER(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1))',
'          FROM employees',
'         WHERE emp_bu     = lr_bu',
'           AND emp_emp_id = lr_emp_id) emp_name,',
'       (SELECT hrpos_pos_id',
'          FROM hr_positions, ',
'               emp_active_infos',
'         WHERE hrpos_bu       = lr_bu',
'           AND hrpos_bu       = empai_bu',
'           AND hrpos_pos_id     = empai_pos_id',
'           AND empai_emp_id     = lr_emp_id) lr_pos_id,',
'       (SELECT UPPER(hrpos_pos_name1)',
'          FROM hr_positions, ',
'               emp_active_infos',
'         WHERE hrpos_bu     = lr_bu',
'           AND hrpos_bu        = empai_bu',
'           AND hrpos_pos_id     = empai_pos_id',
'           AND empai_emp_id     = lr_emp_id) designation,',
'       (SELECT dept_id ',
'          FROM departments,',
'               emp_active_infos',
'         WHERE empai_bu    = dept_bu',
'           AND lr_bu        = empai_bu',
'           AND empai_emp_id    = lr_emp_id',
'           AND empai_dept_id    = dept_id) dept_id,       ',
'       (SELECT UPPER(dept_name1) ',
'          FROM departments,',
'               emp_active_infos',
'         WHERE empai_bu    = dept_bu',
'           AND lr_bu        = empai_bu',
'           AND empai_emp_id    = lr_emp_id',
'           AND empai_dept_id    = dept_id) department,           ',
'       (SELECT UPPER(bup_plant_id) ',
'          FROM bus_unit_plants, ',
'               emp_active_infos',
'         WHERE bup_bu         = empai_bu ',
'           AND empai_bu        = lr_bu',
'           AND bup_plant_id     = empai_plnt',
'           AND empai_emp_id     = lr_emp_id) unit_id,          ',
'       (SELECT UPPER(bup_name1)',
'          FROM bus_unit_plants, ',
'               emp_active_infos',
'         WHERE bup_bu         = empai_bu ',
'           AND empai_bu        = lr_bu',
'           AND bup_plant_id     = empai_plnt',
'           AND empai_emp_id     = lr_emp_id) Unit,',
'       lr_leave_id,',
'       (SELECT UPPER(leave_desc1)',
'          FROM leaves',
'         WHERE leave_bu = :Global_bu',
'           AND leave_leave_id = lr_leave_id) Leave_Name,',
'       (SELECT DECODE(leave_type,''I'',''Information'',''S'',''Sick Leave'',''P'',''Leave without Pay'',''A'',''Paid Leave/Accurals'')leave_type',
'	      FROM leaves',
'	     WHERE leave_bu       = lr_bu',
'	       AND leave_leave_id = lr_leave_id )lr_leave_type,',
'       lr_applied_days,',
'       lr_start_date,',
'       lr_end_date,',
'       lr_leave_doc_no,',
'       lr_status status,',
'       CASE lr_status WHEN ''E'' THEN ''Draft''',
'              WHEN ''N'' THEN ''Entry Completed''',
'              WHEN ''P'' then ''Posted''',
'              WHEN ''C'' then ''Cancelled''',
'                  WHEN ''R'' then ''Reversed''',
'       END lr_status,',
'       CASE lr_status WHEN ''E'' THEN ''Blue''',
'              WHEN ''N'' then ''Brown''',
'              WHEN ''P'' then ''Green''',
'              WHEN ''C'' then ''Red''',
'              WHEN ''R'' then ''Orange''',
'       END color,',
'       DECODE(lr_type,''E'',''Encashment'',''L'',''Leave'') el_type,',
'       lr_type,',
'       lr_cre_by,',
'       TO_CHAR(lr_cre_date, ''DD-MM-RRRR HH12:MI AM'') AS lr_cre_date',
'  FROM leave_request',
' WHERE lr_bu = :global_bu',
'   AND lr_status = ''N''',
'   AND lr_type = ''E''',
' ORDER BY lr_req_no DESC '))
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
 p_id=>wwv_flow_imp.id(5971673982848900240)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>489712147305289212
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971675993671900260)
,p_db_column_name=>'COLOR'
,p_display_order=>60
,p_column_identifier=>'T'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971674789362900248)
,p_db_column_name=>'DEPARTMENT'
,p_display_order=>120
,p_column_identifier=>'H'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971674716301900247)
,p_db_column_name=>'DEPT_ID'
,p_display_order=>20
,p_column_identifier=>'G'
,p_column_label=>'Dept Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971674540640900246)
,p_db_column_name=>'DESIGNATION'
,p_display_order=>110
,p_column_identifier=>'F'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971676105677900261)
,p_db_column_name=>'EL_TYPE'
,p_display_order=>220
,p_column_identifier=>'U'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971674360703900244)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>100
,p_column_identifier=>'D'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971675208194900252)
,p_db_column_name=>'LEAVE_NAME'
,p_display_order=>150
,p_column_identifier=>'L'
,p_column_label=>'Leave Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971675382740900254)
,p_db_column_name=>'LR_APPLIED_DAYS'
,p_display_order=>170
,p_column_identifier=>'N'
,p_column_label=>'Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971676309877900263)
,p_db_column_name=>'LR_CRE_BY'
,p_display_order=>240
,p_column_identifier=>'W'
,p_column_label=>'Lr Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971676377797900264)
,p_db_column_name=>'LR_CRE_DATE'
,p_display_order=>250
,p_column_identifier=>'X'
,p_column_label=>'Lr Cre Date'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971674267728900243)
,p_db_column_name=>'LR_EMP_ID'
,p_display_order=>90
,p_column_identifier=>'C'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971675589684900256)
,p_db_column_name=>'LR_END_DATE'
,p_display_order=>190
,p_column_identifier=>'P'
,p_column_label=>'Request End Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971675687823900257)
,p_db_column_name=>'LR_LEAVE_DOC_NO'
,p_display_order=>50
,p_column_identifier=>'Q'
,p_column_label=>'Lr Leave Doc No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971675134379900251)
,p_db_column_name=>'LR_LEAVE_ID'
,p_display_order=>140
,p_column_identifier=>'K'
,p_column_label=>'Leave ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971675317991900253)
,p_db_column_name=>'LR_LEAVE_TYPE'
,p_display_order=>160
,p_column_identifier=>'M'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971674480685900245)
,p_db_column_name=>'LR_POS_ID'
,p_display_order=>10
,p_column_identifier=>'E'
,p_column_label=>'Lr Pos Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971674089947900241)
,p_db_column_name=>'LR_REQ_DATE'
,p_display_order=>70
,p_column_identifier=>'A'
,p_column_label=>'Req. Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971674148994900242)
,p_db_column_name=>'LR_REQ_NO'
,p_display_order=>80
,p_column_identifier=>'B'
,p_column_label=>'Req. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971675495530900255)
,p_db_column_name=>'LR_START_DATE'
,p_display_order=>180
,p_column_identifier=>'O'
,p_column_label=>'Request Start Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971675889652900259)
,p_db_column_name=>'LR_STATUS'
,p_display_order=>200
,p_column_identifier=>'S'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#LR_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971676179046900262)
,p_db_column_name=>'LR_TYPE'
,p_display_order=>230
,p_column_identifier=>'V'
,p_column_label=>'Lr Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971675746795900258)
,p_db_column_name=>'STATUS'
,p_display_order=>40
,p_column_identifier=>'R'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971674958149900250)
,p_db_column_name=>'UNIT'
,p_display_order=>130
,p_column_identifier=>'J'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971674894772900249)
,p_db_column_name=>'UNIT_ID'
,p_display_order=>30
,p_column_identifier=>'I'
,p_column_label=>'Unit Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5971747273132948478)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4897855'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'LR_REQ_NO:LR_REQ_DATE:LR_EMP_ID:EMP_NAME:LR_LEAVE_ID:LEAVE_NAME:LR_LEAVE_TYPE:LR_START_DATE:LR_APPLIED_DAYS:LR_END_DATE:DESIGNATION:DEPARTMENT:UNIT:LR_STATUS'
);
wwv_flow_imp.component_end;
end;
/
