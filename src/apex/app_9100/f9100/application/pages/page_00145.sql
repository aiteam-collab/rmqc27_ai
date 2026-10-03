prompt --application/pages/page_00145
begin
--   Manifest
--     PAGE: 00145
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
 p_id=>145
,p_name=>'Waiting for approval Comp.Off'
,p_alias=>'WAITING-FOR-APPROVAL-COMP-OFF'
,p_page_mode=>'MODAL'
,p_step_title=>'Waiting for approval Comp.Off'
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
 p_id=>wwv_flow_imp.id(5971563729285820266)
,p_plug_name=>'Waiting for approval Comp. Off'
,p_static_id=>'waiting-for-approval-comp-off'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT heco_doc_no,',
'       heco_doc_date,',
'       heco_emp_id,',
'       UPPER(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1)  employee_name,',
'      emp_first_name1 employee,',
'      emp_gender emp_gender,',
'      decode(emp_gender,''M'',''MALE'',''F'',''FEMALE'') gender,     ',
'      (SELECT UPPER(hrpos_pos_name1)',
'         FROM hr_positions',
'        WHERE hrpos_bu     = empai_bu',
'          AND hrpos_pos_id = empai_pos_id)pos_desc,',
'       empai_pos_id pos_id,',
'       empai_dept_id dept_id,',
'       (SELECT UPPER(dept_name1)',
'         FROM departments',
'        WHERE dept_bu      = empai_bu',
'          AND dept_id      = empai_dept_id) dept_desc,',
'      empai_plnt plnt_id,     ',
'      (SELECT bup_name1',
'         FROM bus_unit_plants',
'        WHERE bup_bu      = empai_bu',
'          AND bup_plant_id = empai_plnt) plnt_desc,',
'       heco_comp_off_date,',
'       heco_comp_off_days,',
'       heco_reference,',
'       CASE heco_status WHEN ''N'' THEN ''Draft''',
'                        WHEN ''E'' THEN ''Entry Completed''',
'                        WHEN ''A'' THEN ''Approved''',
'                        WHEN ''L'' THEN ''Cancelled''',
'                        END AS heco_status,',
'        CASE heco_status WHEN ''N'' THEN ''Blue''',
'                        WHEN ''E'' THEN ''Brown''',
'                        WHEN ''A'' THEN ''Green''',
'                        WHEN ''L'' THEN ''Red''',
'                        END AS color,',
'       heco_inproc_days,',
'       heco_cre_by,',
'       heco_cre_date       ',
'  FROM hrm_emp_comp_off ,',
'       employees,',
'       emp_active_infos',
' WHERE heco_bu       = emp_bu',
'   AND emp_emp_id    = heco_emp_id',
'   AND empai_bu      = emp_bu',
'   AND empai_emp_id  = emp_emp_id',
'   AND heco_bu       = :global_bu',
'   AND heco_status   = ''E''',
'  ORDER BY heco_doc_no DESC',
''))
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
 p_id=>wwv_flow_imp.id(5971563788113820267)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>489601952570209239
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971673505494900235)
,p_db_column_name=>'COLOR'
,p_display_order=>230
,p_column_identifier=>'R'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971564854666820278)
,p_db_column_name=>'DEPT_DESC'
,p_display_order=>120
,p_column_identifier=>'K'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971564754989820277)
,p_db_column_name=>'DEPT_ID'
,p_display_order=>40
,p_column_identifier=>'J'
,p_column_label=>'Dept Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971564324436820272)
,p_db_column_name=>'EMPLOYEE'
,p_display_order=>10
,p_column_identifier=>'E'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971564228108820271)
,p_db_column_name=>'EMPLOYEE_NAME'
,p_display_order=>90
,p_column_identifier=>'D'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971564366607820273)
,p_db_column_name=>'EMP_GENDER'
,p_display_order=>20
,p_column_identifier=>'F'
,p_column_label=>'Emp Gender'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971564446759820274)
,p_db_column_name=>'GENDER'
,p_display_order=>100
,p_column_identifier=>'G'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971673105986900231)
,p_db_column_name=>'HECO_COMP_OFF_DATE'
,p_display_order=>150
,p_column_identifier=>'N'
,p_column_label=>'Comp. Off Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971673225798900232)
,p_db_column_name=>'HECO_COMP_OFF_DAYS'
,p_display_order=>160
,p_column_identifier=>'O'
,p_column_label=>'Comp. Off Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971673641180900237)
,p_db_column_name=>'HECO_CRE_BY'
,p_display_order=>210
,p_column_identifier=>'T'
,p_column_label=>'Heco Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971673789398900238)
,p_db_column_name=>'HECO_CRE_DATE'
,p_display_order=>220
,p_column_identifier=>'U'
,p_column_label=>'Heco Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971564028514820269)
,p_db_column_name=>'HECO_DOC_DATE'
,p_display_order=>70
,p_column_identifier=>'B'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971563875733820268)
,p_db_column_name=>'HECO_DOC_NO'
,p_display_order=>60
,p_column_identifier=>'A'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971564120694820270)
,p_db_column_name=>'HECO_EMP_ID'
,p_display_order=>80
,p_column_identifier=>'C'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971673549028900236)
,p_db_column_name=>'HECO_INPROC_DAYS'
,p_display_order=>200
,p_column_identifier=>'S'
,p_column_label=>'Heco Inproc Days'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971673287360900233)
,p_db_column_name=>'HECO_REFERENCE'
,p_display_order=>170
,p_column_identifier=>'P'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971673402120900234)
,p_db_column_name=>'HECO_STATUS'
,p_display_order=>180
,p_column_identifier=>'Q'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#HECO_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971672970228900230)
,p_db_column_name=>'PLNT_DESC'
,p_display_order=>140
,p_column_identifier=>'M'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971672845263900229)
,p_db_column_name=>'PLNT_ID'
,p_display_order=>50
,p_column_identifier=>'L'
,p_column_label=>'Plnt Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971564566469820275)
,p_db_column_name=>'POS_DESC'
,p_display_order=>110
,p_column_identifier=>'H'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971564698009820276)
,p_db_column_name=>'POS_ID'
,p_display_order=>30
,p_column_identifier=>'I'
,p_column_label=>'Pos Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5971686667514902035)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4897249'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'HECO_DOC_NO:HECO_DOC_DATE:HECO_EMP_ID:EMPLOYEE_NAME:GENDER:HECO_COMP_OFF_DATE:HECO_COMP_OFF_DAYS:POS_DESC:DEPT_DESC:PLNT_DESC:HECO_REFERENCE:HECO_STATUS'
);
wwv_flow_imp.component_end;
end;
/
