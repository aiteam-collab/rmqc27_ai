prompt --application/pages/page_81828314
begin
--   Manifest
--     PAGE: 81828314
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
 p_id=>81828314
,p_name=>'Appointment Letter'
,p_alias=>'APPOINTMENT-LETTER1'
,p_step_title=>'Appointment Letter'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (document.getElementById("P341310346_DUMMY").value ==0){',
'   apex.item( "FD" ).show();',
'   apex.item( "AP" ).hide();',
'}',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#Clear{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: rgba(0, 0, 0, 0.15);',
'   background-size: 25px;',
'   width: 25px;',
'   height: 22px;',
'   top: 0px;',
'}',
'',
'.a-IRR-table {',
'           border-collapse: collapse;',
'           table-layout: auto;',
'           border-spacing: 0;',
'           white-space: nowrap;',
'           word-wrap: break-word;',
'       } ',
'#cancelbtn{',
'                color: #ff0000;',
'                background-color: rgba(0, 0, 0, 0.15);',
'}       ',
''))
,p_step_template=>wwv_flow_imp.id(5737223025593288595)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8468493655831935236)
,p_plug_name=>'Report : Appointment Letter'
,p_static_id=>'report-appointment-letter'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8469335707492078341)
,p_plug_name=>'Result(s)'
,p_static_id=>'result-s'
,p_region_name=>'DOC_ID'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--stacked:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ROWID,',
'       hralr_app_bu,',
'       hralr_app_doc_no,',
'       hralr_app_doc_date,',
'       hralr_app_ltr_date,',
'       hralr_app_doc_sgn_empid,',
'       hralr_app_doc_sgn_posid,',
'       hralr_off_doc_no,',
'       hralr_off_doc_date,',
'       hralr_off_ltr_ref_pfx,',
'       hralr_off_ltr_ref_no,',
'       hralr_off_ltr_ref_date,',
'       DECODE (hralr_cand_gender,''M'',''MALE'',''F'',''FEMALE'') gender,',
'       hralr_cand_name,',
'       hralr_cand_adds,',
'       hralr_cand_mob,',
'       hralr_cand_email,',
'       hralr_subject,',
'        (SELECT hrpos_pos_name1',
'           FROM hr_positions',
'          WHERE hrpos_bu = hralr_app_bu',
'            AND hrpos_pos_id = hralr_cand_pos_id) hralr_cand_pos_id ,',
'        (SELECT dept_name1  ',
'           FROM departments',
'          WHERE dept_bu = hralr_app_bu',
'            AND dept_id = hralr_cand_dept_id) hralr_cand_dept_id ,',
'        (SELECT hrwl_loc_name1',
'           FROM hr_work_locations',
'          WHERE hrwl_bu = hralr_app_bu',
'            AND hrwl_loc_id = hralr_cand_loc_id) hralr_cand_loc_id ,',
'		(SELECT LTRIM (RTRIM (emp_first_name1)) || '' '' || LTRIM (RTRIM (emp_middle_name1)) || '' '' || LTRIM (RTRIM (emp_last_name1))',
'           FROM employees',
'          WHERE emp_bu     = hralr_app_bu',
'            AND emp_emp_id = hralr_rptg_emp_id) hralr_rptg_emp_id ,',
'       hralr_rptg_emp_pos,',
'       hralr_rptg_emp_dept,',
'       hralr_cand_doj,',
'       hralr_clfy_emp_id,',
'       hralr_clfy_emp_email,',
'       hralr_clfy_emp_mob_no,',
'       (SELECT LTRIM (RTRIM (emp_first_name1)) || '' '' || LTRIM (RTRIM (emp_middle_name1)) || '' '' || LTRIM (RTRIM (emp_last_name1))',
'          FROM employees',
'         WHERE emp_bu = hralr_app_bu',
'           AND emp_emp_id = hralr_off_doc_sgn_empid) hralr_off_doc_sgn_empid ,',
'       (SELECT hrpos_pos_name1',
'          FROM hr_positions',
'         WHERE hrpos_bu = hralr_app_bu',
'           AND hrpos_pos_id = hralr_off_doc_sgn_posid) hralr_off_doc_sgn_posid  ,',
'		DECODE(hralr_status,''N'',''New'',''E'',''Entry Completed'',''F'',''Pending To Post'',''P'',''Posted'',''L'',''Cancelled'')doc_status,	',
'		DECODE(hralr_status,''N'',''blue'',''E'',''blue'',''F'',''brown'',''P'',''green'',''L'',''red'',''blue'') color,',
'	   ''<span aria-hidden="true" class="fa fa-print" style="color: #004153;font-size : 16px "></span>'' print,',
'       hralr_tot_earn,',
'       hralr_tot_dedn,',
'       hralr_tot_net,',
'       hralr_tot_benefit,',
'       hralr_tot_mly_ctc,',
'       hralr_tot_yly_ctc,',
'       hralr_status',
'  FROM hrm_appt_ltr',
' WHERE hralr_app_bu = :global_bu'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P81828314_DOC_NO,P81828314_DEPT_ID,P81828314_DESIGN_ID,P81828314_STATUS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Result(s)'
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
 p_id=>wwv_flow_imp.id(8469335775758078342)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No Data Found'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>2989814791973158140
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995255777835582266)
,p_db_column_name=>'COLOR'
,p_display_order=>420
,p_column_identifier=>'DB'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995255348071582266)
,p_db_column_name=>'DOC_STATUS'
,p_display_order=>310
,p_column_identifier=>'DA'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#DOC_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995254610237582264)
,p_db_column_name=>'GENDER'
,p_display_order=>300
,p_column_identifier=>'CY'
,p_column_label=>'Gender'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995254935962582264)
,p_db_column_name=>'HRALR_APP_BU'
,p_display_order=>410
,p_column_identifier=>'CZ'
,p_column_label=>'Hralr App Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995240939996582237)
,p_db_column_name=>'HRALR_APP_DOC_DATE'
,p_display_order=>30
,p_column_identifier=>'BF'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995240545856582234)
,p_db_column_name=>'HRALR_APP_DOC_NO'
,p_display_order=>20
,p_column_identifier=>'BE'
,p_column_label=>'Doc. No.'
,p_column_link=>'f?p=&APP_ID.:8186323422:&SESSION.::&DEBUG.::P8186323422_ROWID:#ROWID#'
,p_column_linktext=>'#HRALR_APP_DOC_NO#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995241721268582239)
,p_db_column_name=>'HRALR_APP_DOC_SGN_EMPID'
,p_display_order=>50
,p_column_identifier=>'BH'
,p_column_label=>'Hralr App Doc Sgn Empid'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995242163768582239)
,p_db_column_name=>'HRALR_APP_DOC_SGN_POSID'
,p_display_order=>60
,p_column_identifier=>'BI'
,p_column_label=>'Hralr App Doc Sgn Posid'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995241357719582237)
,p_db_column_name=>'HRALR_APP_LTR_DATE'
,p_display_order=>40
,p_column_identifier=>'BG'
,p_column_label=>'Letter Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995244927719582244)
,p_db_column_name=>'HRALR_CAND_ADDS'
,p_display_order=>140
,p_column_identifier=>'BQ'
,p_column_label=>'Candidate Address'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995247014875582250)
,p_db_column_name=>'HRALR_CAND_DEPT_ID'
,p_display_order=>190
,p_column_identifier=>'BV'
,p_column_label=>'Candidate Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995248925164582253)
,p_db_column_name=>'HRALR_CAND_DOJ'
,p_display_order=>240
,p_column_identifier=>'CA'
,p_column_label=>'Candidate Date Of Join'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995245734493582245)
,p_db_column_name=>'HRALR_CAND_EMAIL'
,p_display_order=>160
,p_column_identifier=>'BS'
,p_column_label=>'Candidate E-mail'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995247360750582250)
,p_db_column_name=>'HRALR_CAND_LOC_ID'
,p_display_order=>200
,p_column_identifier=>'BW'
,p_column_label=>'Candidate Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995245411384582245)
,p_db_column_name=>'HRALR_CAND_MOB'
,p_display_order=>150
,p_column_identifier=>'BR'
,p_column_label=>'Candidate Mobile No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995244599360582244)
,p_db_column_name=>'HRALR_CAND_NAME'
,p_display_order=>130
,p_column_identifier=>'BP'
,p_column_label=>'Candidate Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995246579808582248)
,p_db_column_name=>'HRALR_CAND_POS_ID'
,p_display_order=>180
,p_column_identifier=>'BU'
,p_column_label=>'Candidate Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995249749180582255)
,p_db_column_name=>'HRALR_CLFY_EMP_EMAIL'
,p_display_order=>260
,p_column_identifier=>'CC'
,p_column_label=>'Hralr Clfy Emp Email'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995249372784582255)
,p_db_column_name=>'HRALR_CLFY_EMP_ID'
,p_display_order=>250
,p_column_identifier=>'CB'
,p_column_label=>'Hralr Clfy Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995250156032582256)
,p_db_column_name=>'HRALR_CLFY_EMP_MOB_NO'
,p_display_order=>270
,p_column_identifier=>'CD'
,p_column_label=>'Hralr Clfy Emp Mob No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995242922607582241)
,p_db_column_name=>'HRALR_OFF_DOC_DATE'
,p_display_order=>80
,p_column_identifier=>'BK'
,p_column_label=>'Offer Doc. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995242523543582241)
,p_db_column_name=>'HRALR_OFF_DOC_NO'
,p_display_order=>70
,p_column_identifier=>'BJ'
,p_column_label=>'Offer Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995250529495582256)
,p_db_column_name=>'HRALR_OFF_DOC_SGN_EMPID'
,p_display_order=>280
,p_column_identifier=>'CE'
,p_column_label=>'Doc. Signed By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995250921418582258)
,p_db_column_name=>'HRALR_OFF_DOC_SGN_POSID'
,p_display_order=>290
,p_column_identifier=>'CF'
,p_column_label=>'Doc. Signed Desig.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995244134499582244)
,p_db_column_name=>'HRALR_OFF_LTR_REF_DATE'
,p_display_order=>110
,p_column_identifier=>'BN'
,p_column_label=>'Offer Letter Ref. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995243750538582242)
,p_db_column_name=>'HRALR_OFF_LTR_REF_NO'
,p_display_order=>100
,p_column_identifier=>'BM'
,p_column_label=>'Offer Letter Ref. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995243387649582242)
,p_db_column_name=>'HRALR_OFF_LTR_REF_PFX'
,p_display_order=>90
,p_column_identifier=>'BL'
,p_column_label=>'Offer Letter Ref. Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995248558072582253)
,p_db_column_name=>'HRALR_RPTG_EMP_DEPT'
,p_display_order=>230
,p_column_identifier=>'BZ'
,p_column_label=>'Hralr Rptg Emp Dept'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995247750832582252)
,p_db_column_name=>'HRALR_RPTG_EMP_ID'
,p_display_order=>210
,p_column_identifier=>'BX'
,p_column_label=>'Reporting To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995248126784582252)
,p_db_column_name=>'HRALR_RPTG_EMP_POS'
,p_display_order=>220
,p_column_identifier=>'BY'
,p_column_label=>'Hralr Rptg Emp Pos'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995253718173582262)
,p_db_column_name=>'HRALR_STATUS'
,p_display_order=>390
,p_column_identifier=>'CM'
,p_column_label=>'Hralr Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995246162305582247)
,p_db_column_name=>'HRALR_SUBJECT'
,p_display_order=>170
,p_column_identifier=>'BT'
,p_column_label=>'Subject'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995252604328582261)
,p_db_column_name=>'HRALR_TOT_BENEFIT'
,p_display_order=>360
,p_column_identifier=>'CJ'
,p_column_label=>'Hralr Tot Benefit'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995251785401582259)
,p_db_column_name=>'HRALR_TOT_DEDN'
,p_display_order=>340
,p_column_identifier=>'CH'
,p_column_label=>'Hralr Tot Dedn'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995251321833582258)
,p_db_column_name=>'HRALR_TOT_EARN'
,p_display_order=>330
,p_column_identifier=>'CG'
,p_column_label=>'Hralr Tot Earn'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995252933646582261)
,p_db_column_name=>'HRALR_TOT_MLY_CTC'
,p_display_order=>370
,p_column_identifier=>'CK'
,p_column_label=>'Hralr Tot Mly Ctc'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995252211991582259)
,p_db_column_name=>'HRALR_TOT_NET'
,p_display_order=>350
,p_column_identifier=>'CI'
,p_column_label=>'Hralr Tot Net'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995253336762582262)
,p_db_column_name=>'HRALR_TOT_YLY_CTC'
,p_display_order=>380
,p_column_identifier=>'CL'
,p_column_label=>'Hralr Tot Yly Ctc'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995256195869582267)
,p_db_column_name=>'PRINT'
,p_display_order=>320
,p_column_identifier=>'DC'
,p_column_label=>'Print'
,p_column_link=>'javascript:window.open(''&JASPER_REPORT_URL1./HRF&JASPER_REPORT_URL2./HRF/HRF3239&p_bu=&GLOBAL_BU.&p_doc_no=#HOLHD_DOC_NO#&P_USER=&GLOBAL_USER.&j_username=&JASPER_REPORT_USR_ID.&j_password=&JASPER_REPORT_PWD.&output=pdf'');'
,p_column_linktext=>'#PRINT#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7995254165724582264)
,p_db_column_name=>'ROWID'
,p_display_order=>400
,p_column_identifier=>'CX'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8469723623686782426)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2170336'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PRINT:HRALR_APP_DOC_NO:HRALR_APP_DOC_DATE:HRALR_APP_LTR_DATE:HRALR_OFF_DOC_NO:HRALR_OFF_DOC_DATE:HRALR_CAND_NAME:GENDER:HRALR_CAND_DOJ:HRALR_CAND_POS_ID:HRALR_CAND_DEPT_ID:HRALR_CAND_LOC_ID:DOC_STATUS:HRALR_CAND_MOB:HRALR_CAND_EMAIL:HRALR_CAND_ADDS:H'
||'RALR_RPTG_EMP_ID:HRALR_OFF_DOC_SGN_EMPID:HRALR_OFF_DOC_SGN_POSID'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5736899288578137342)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8468493655831935236)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:81828304:&SESSION.::&DEBUG.:RP,81863234::'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5736898489673137342)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(8468493655831935236)
,p_button_name=>'Clear'
,p_static_id=>'clear'
,p_button_static_id=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5736898965466137342)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(8468493655831935236)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_button_css_classes=>'cancelbtn'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5736898083914137342)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8468493655831935236)
,p_button_name=>'Search'
,p_static_id=>'search'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generate'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7995244288898582248)
,p_name=>'P81828314_DEPT_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8468493655831935236)
,p_prompt=>'Department '
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT distinct (SELECT dept_name1  ',
'            FROM departments',
'            WHERE dept_bu = holhd_bu',
'            AND dept_id = holhd_cand_dept_id) D, ',
'            holhd_cand_dept_id R',
'  FROM HRM_OFFER_LTR_HD',
' WHERE HOLHD_BU = :GLOBAL_BU;',
''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select Department')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7995244732362582249)
,p_name=>'P81828314_DESIGN_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8468493655831935236)
,p_prompt=>'Designation '
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT distinct HRPOS_POS_NAME1,',
'HRPOS_POS_ID',
'    FROM hr_positions, HRM_OFFER_LTR_HD',
'WHERE HRPOS_POS_ID = HOLHD_CAND_POS_ID',
'AND HRPOS_BU = :GLOBAL_BU'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select Designation')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7995243939479582244)
,p_name=>'P81828314_DOC_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8468493655831935236)
,p_prompt=>'Document No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT HOLHD_DOC_NO D1, HOLHD_DOC_NO R1',
'  FROM HRM_OFFER_LTR_HD',
' WHERE HOLHD_BU = :GLOBAL_BU;',
''))
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select Document')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7995245928574582251)
,p_name=>'P81828314_DUMMY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8468493655831935236)
,p_item_default=>'0'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7995246284597582251)
,p_name=>'P81828314_HRMOL_DOC_NO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8468493655831935236)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7995245515069582251)
,p_name=>'P81828314_SHOW_DATA'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8468493655831935236)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7995245085406582249)
,p_name=>'P81828314_STATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8468493655831935236)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:New;N,Posted;P,Cancelled;L,Pending to Post;F'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-none'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5736916941214137362)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5736898489673137342)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5736917416270137362)
,p_event_id=>wwv_flow_imp.id(5736916941214137362)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P81828314_DOC_NO,P81828314_DEPT_ID,P81828314_DESIGN_ID,P81828314_STATUS'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5736915044179137361)
,p_name=>'Unhide_Region'
,p_static_id=>'unhide-region'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5736898083914137342)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5736915486403137361)
,p_event_id=>wwv_flow_imp.id(5736915044179137361)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8469335707492078341)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5736916058229137361)
,p_event_id=>wwv_flow_imp.id(5736915044179137361)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var region = $("#DOC_ID");',
    'if (region.is(":hidden")) { // Check if the region is hidden',
    '    region.show(); // Show the region only if it is hidden',
    '}',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5736916575603137362)
,p_event_id=>wwv_flow_imp.id(5736915044179137361)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8469335707492078341)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
