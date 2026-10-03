prompt --application/pages/page_00149
begin
--   Manifest
--     PAGE: 00149
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
 p_id=>149
,p_name=>'Waiting for approval Loan'
,p_alias=>'WAITING-FOR-APPROVAL-LOAN'
,p_page_mode=>'MODAL'
,p_step_title=>'Waiting for approval Loan'
,p_warn_on_unsaved_changes=>'N'
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
 p_id=>wwv_flow_imp.id(5971866092801055649)
,p_plug_name=>'Waiting for approval Loan'
,p_static_id=>'waiting-for-approval-loan'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT elr_rqst_no,',
'       elr_emp_id,',
'       (SELECT UPPER(emp_first_name1 || '' '' || emp_middle_name1 || '' '' || emp_last_name1) emp_name',
'          FROM employees',
'         WHERE emp_emp_id = elr_emp_id',
'           AND emp_bu = elr_bu ) emp_name,',
'       (SELECT emp_first_name1',
'         FROM employees',
'        WHERE emp_emp_id = elr_emp_id',
'          AND emp_bu = elr_bu ) employee,',
'       (SELECT hrpos_pos_id',
'          FROM hr_positions,',
'               emp_active_infos',
'         WHERE hrpos_bu     = empai_bu',
'          AND hrpos_pos_id = empai_pos_id',
'          AND hrpos_bu     = elr_bu',
'          AND empai_emp_id = elr_emp_id ) pos_id,',
'       (SELECT UPPER(hrpos_pos_name1)',
'          FROM hr_positions,',
'               emp_active_infos',
'         WHERE hrpos_bu  = empai_bu',
'           AND hrpos_pos_id = empai_pos_id',
'           AND hrpos_bu = elr_bu',
'           AND empai_emp_id = elr_emp_id )position_desc, ',
'        (SELECT UPPER(dept_id)',
'           FROM departments,',
'                emp_active_infos',
'          WHERE dept_bu      = empai_bu',
'            AND dept_id      = empai_dept_id',
'            AND empai_bu     = elr_bu',
'            AND empai_emp_id = elr_emp_id ) dept_id,',
'        (SELECT UPPER(dept_name1)',
'           FROM departments,',
'                emp_active_infos',
'          WHERE dept_bu = empai_bu',
'            AND dept_id = empai_dept_id',
'            AND empai_bu = elr_bu',
'            AND empai_emp_id = elr_emp_id)dept_name,',
'         (SELECT UPPER(bup_plant_id)',
'            FROM bus_unit_plants,',
'                 emp_active_infos',
'           WHERE bup_bu = empai_bu',
'             AND bup_plant_id = empai_plnt',
'             AND empai_bu = elr_bu',
'             AND empai_emp_id = elr_emp_id)unit,',
'         (SELECT UPPER(bup_name1)',
'            FROM bus_unit_plants,',
'                 emp_active_infos',
'           WHERE bup_bu = empai_bu',
'             AND bup_plant_id = empai_plnt',
'             AND empai_bu = elr_bu',
'             AND empai_emp_id = elr_emp_id ) unit_desc,',
'          elr_loan_id,',
'         (SELECT loan_desc1',
'            FROM loans',
'           WHERE loan_bu = elr_bu',
'             AND loan_loan_id = elr_loan_id ) elr_loan_desc,',
'       elr_rqst_date,',
'       elr_rqst_amt,',
'       elr_rqrd_date,',
'       elr_aprvd_amt,',
'       elr_rtn_inst,',
'       elr_pay_mode,',
'       elr_start_year,',
'       elr_start_period,',
'       elr_rjct_reason,',
'       elr_status,',
'       CASE elr_status WHEN ''E'' THEN ''Draft''',
'                       WHEN ''N'' THEN ''Entry Completed''',
'                       WHEN ''P'' THEN ''Posted''',
'                       WHEN ''C'' THEN ''Cancelled''',
'       END AS status,',
'       CASE elr_status WHEN ''E'' THEN ''Blue''',
'                       WHEN ''N'' THEN ''Green''',
'                       WHEN ''P'' THEN ''Green''',
'                       WHEN ''C'' THEN ''Red''',
'       END AS color,',
'       elr_rqst_briefdesc,',
'       decode(elr_inst_ded_type,''I'',''No. of Instl.'',''A'',''Instl. Amt.'')elr_inst_ded_type,',
'       elt_inst_amt,',
'       elr_cre_by,',
'       to_char (elr_cre_date,''DD-MM-RRRR HH12:MI AM'') elr_cre_date',
'  FROM emp_loans_request',
' WHERE elr_bu = :global_bu',
'   AND elr_status = ''N'''))
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
 p_id=>wwv_flow_imp.id(5971866169038055650)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>489904333494444622
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971868629618055674)
,p_db_column_name=>'COLOR'
,p_display_order=>370
,p_column_identifier=>'X'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971866867618055657)
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
 p_id=>wwv_flow_imp.id(5971866974044055658)
,p_db_column_name=>'DEPT_NAME'
,p_display_order=>130
,p_column_identifier=>'H'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971867834514055666)
,p_db_column_name=>'ELR_APRVD_AMT'
,p_display_order=>40
,p_column_identifier=>'P'
,p_column_label=>'Elr Aprvd Amt'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971868998036055678)
,p_db_column_name=>'ELR_CRE_BY'
,p_display_order=>300
,p_column_identifier=>'AB'
,p_column_label=>'Elr Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971958280682163129)
,p_db_column_name=>'ELR_CRE_DATE'
,p_display_order=>320
,p_column_identifier=>'AC'
,p_column_label=>'Elr Cre Date'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971866412803055652)
,p_db_column_name=>'ELR_EMP_ID'
,p_display_order=>100
,p_column_identifier=>'B'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971868736019055676)
,p_db_column_name=>'ELR_INST_DED_TYPE'
,p_display_order=>280
,p_column_identifier=>'Z'
,p_column_label=>'Instl. Ded. Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971867429392055662)
,p_db_column_name=>'ELR_LOAN_DESC'
,p_display_order=>150
,p_column_identifier=>'L'
,p_column_label=>'Loan'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971867289547055661)
,p_db_column_name=>'ELR_LOAN_ID'
,p_display_order=>50
,p_column_identifier=>'K'
,p_column_label=>'Elr Loan Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971867962653055668)
,p_db_column_name=>'ELR_PAY_MODE'
,p_display_order=>340
,p_column_identifier=>'R'
,p_column_label=>'Elr Pay Mode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971868324346055671)
,p_db_column_name=>'ELR_RJCT_REASON'
,p_display_order=>220
,p_column_identifier=>'U'
,p_column_label=>'Rjct. Reason'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971867655536055665)
,p_db_column_name=>'ELR_RQRD_DATE'
,p_display_order=>170
,p_column_identifier=>'O'
,p_column_label=>'Rqrd. Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971867600751055664)
,p_db_column_name=>'ELR_RQST_AMT'
,p_display_order=>30
,p_column_identifier=>'N'
,p_column_label=>'Rqst. Amt'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971868703037055675)
,p_db_column_name=>'ELR_RQST_BRIEFDESC'
,p_display_order=>270
,p_column_identifier=>'Y'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971867462429055663)
,p_db_column_name=>'ELR_RQST_DATE'
,p_display_order=>160
,p_column_identifier=>'M'
,p_column_label=>'Rqst. Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971866249011055651)
,p_db_column_name=>'ELR_RQST_NO'
,p_display_order=>90
,p_column_identifier=>'A'
,p_column_label=>'Request No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971867864919055667)
,p_db_column_name=>'ELR_RTN_INST'
,p_display_order=>310
,p_column_identifier=>'Q'
,p_column_label=>'Elr Rtn Inst'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971868140248055670)
,p_db_column_name=>'ELR_START_PERIOD'
,p_display_order=>360
,p_column_identifier=>'T'
,p_column_label=>'Elr Start Period'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971868111851055669)
,p_db_column_name=>'ELR_START_YEAR'
,p_display_order=>350
,p_column_identifier=>'S'
,p_column_label=>'Elr Start Year'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971868424048055672)
,p_db_column_name=>'ELR_STATUS'
,p_display_order=>330
,p_column_identifier=>'V'
,p_column_label=>'Elr Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971868917457055677)
,p_db_column_name=>'ELT_INST_AMT'
,p_display_order=>290
,p_column_identifier=>'AA'
,p_column_label=>'Instl. Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971866606954055654)
,p_db_column_name=>'EMPLOYEE'
,p_display_order=>70
,p_column_identifier=>'D'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971866512452055653)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>110
,p_column_identifier=>'C'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971866741847055656)
,p_db_column_name=>'POSITION_DESC'
,p_display_order=>120
,p_column_identifier=>'F'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971866661100055655)
,p_db_column_name=>'POS_ID'
,p_display_order=>10
,p_column_identifier=>'E'
,p_column_label=>'Pos Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971868460099055673)
,p_db_column_name=>'STATUS'
,p_display_order=>240
,p_column_identifier=>'W'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971867053025055659)
,p_db_column_name=>'UNIT'
,p_display_order=>60
,p_column_identifier=>'I'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971867168807055660)
,p_db_column_name=>'UNIT_DESC'
,p_display_order=>140
,p_column_identifier=>'J'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5971976081808166459)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4900143'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'ELR_RQST_NO:ELR_RQST_DATE:ELR_EMP_ID:EMP_NAME:ELR_LOAN_DESC:ELR_RQRD_DATE:ELR_INST_DED_TYPE:ELT_INST_AMT:POSITION_DESC:DEPT_NAME:UNIT_DESC:ELR_RQST_BRIEFDESC:STATUS'
);
wwv_flow_imp.component_end;
end;
/
