prompt --application/pages/page_00142
begin
--   Manifest
--     PAGE: 00142
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
 p_id=>142
,p_name=>'Pending Leave Entry'
,p_alias=>'PENDING-LEAVE-ENTRY'
,p_page_mode=>'MODAL'
,p_step_title=>'Pending Leave Entry'
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
 p_id=>wwv_flow_imp.id(5971246992867279834)
,p_plug_name=>'Pending Leave Entry'
,p_static_id=>'pending-leave-entry'
,p_title=>'Pending Leave Entry'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT lr_bu,',
'       lr_req_date,',
'       lr_req_no,',
'       lr_year,',
'       lr_period,',
'       lr_emp_id,',
'       lr_emp_name,',
'       lr_plnt,',
'       lr_plnt_desc,',
'       lr_pos_id,',
'       lr_pos_desc,',
'       lr_dept_id,',
'       lr_dept_desc,',
'       lr_job_id,',
'       lr_job_desc,',
'       lr_grade,',
'       lr_grade_desc,',
'       lr_loc_id,',
'       lr_loc_desc,',
'       lr_cat_id,',
'       lr_cat_desc,',
'       lr_group_id,',
'       lr_group_desc,',
'       lr_acct_cat_id,',
'       lr_acct_cat_desc,',
'       lr_leave_id,',
'       lr_leave_desc,',
'       lr_leave_type,',
'       TO_CHAR(lr_start_date,func_find_date_format(:global_bu))start_date,',
'       TO_CHAR(lr_end_date,func_find_date_format(:global_bu))end_date,',
'       lr_applied_days,',
'       lr_briefdesc,',
'       lr_chk_flag,',
'       lr_type,',
'       lr_work_off_incl,',
'       lr_vacation_flag,',
'       lr_encash_opt,',
'       lr_start_sess,',
'       lr_end_sess,',
'       lr_status',
'  FROM emp_pend_leave_rqst_vw',
' WHERE lr_bu = :global_bu',
'ORDER BY lr_req_no DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Pending Leave Entry'
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
 p_id=>wwv_flow_imp.id(5971247106274279835)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>489285270730668807
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971250048017279865)
,p_db_column_name=>'END_DATE'
,p_display_order=>330
,p_column_identifier=>'AD'
,p_column_label=>'End Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971249621519279860)
,p_db_column_name=>'LR_ACCT_CAT_DESC'
,p_display_order=>140
,p_column_identifier=>'Y'
,p_column_label=>'Lr Acct Cat Desc'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971249464309279859)
,p_db_column_name=>'LR_ACCT_CAT_ID'
,p_display_order=>130
,p_column_identifier=>'X'
,p_column_label=>'Lr Acct Cat Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971250192268279866)
,p_db_column_name=>'LR_APPLIED_DAYS'
,p_display_order=>350
,p_column_identifier=>'AE'
,p_column_label=>'Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971250297573279867)
,p_db_column_name=>'LR_BRIEFDESC'
,p_display_order=>360
,p_column_identifier=>'AF'
,p_column_label=>'Reason'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971247154904279836)
,p_db_column_name=>'LR_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Lr Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971249148695279856)
,p_db_column_name=>'LR_CAT_DESC'
,p_display_order=>110
,p_column_identifier=>'U'
,p_column_label=>'Lr Cat Desc'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971249046933279855)
,p_db_column_name=>'LR_CAT_ID'
,p_display_order=>90
,p_column_identifier=>'T'
,p_column_label=>'Lr Cat Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971250365449279868)
,p_db_column_name=>'LR_CHK_FLAG'
,p_display_order=>370
,p_column_identifier=>'AG'
,p_column_label=>'Lr Chk Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971248433271279848)
,p_db_column_name=>'LR_DEPT_DESC'
,p_display_order=>230
,p_column_identifier=>'M'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971248312818279847)
,p_db_column_name=>'LR_DEPT_ID'
,p_display_order=>40
,p_column_identifier=>'L'
,p_column_label=>'Lr Dept Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971247636866279841)
,p_db_column_name=>'LR_EMP_ID'
,p_display_order=>190
,p_column_identifier=>'F'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971247817673279842)
,p_db_column_name=>'LR_EMP_NAME'
,p_display_order=>200
,p_column_identifier=>'G'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971250801740279872)
,p_db_column_name=>'LR_ENCASH_OPT'
,p_display_order=>410
,p_column_identifier=>'AK'
,p_column_label=>'Lr Encash Opt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971250967573279874)
,p_db_column_name=>'LR_END_SESS'
,p_display_order=>340
,p_column_identifier=>'AM'
,p_column_label=>'End Sess.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971248672963279851)
,p_db_column_name=>'LR_GRADE'
,p_display_order=>70
,p_column_identifier=>'P'
,p_column_label=>'Lr Grade'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971248778551279852)
,p_db_column_name=>'LR_GRADE_DESC'
,p_display_order=>240
,p_column_identifier=>'Q'
,p_column_label=>'Grade'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971249412676279858)
,p_db_column_name=>'LR_GROUP_DESC'
,p_display_order=>120
,p_column_identifier=>'W'
,p_column_label=>'Group '
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971249277552279857)
,p_db_column_name=>'LR_GROUP_ID'
,p_display_order=>100
,p_column_identifier=>'V'
,p_column_label=>'Lr Group Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971248624451279850)
,p_db_column_name=>'LR_JOB_DESC'
,p_display_order=>60
,p_column_identifier=>'O'
,p_column_label=>'Lr Job Desc'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971248466458279849)
,p_db_column_name=>'LR_JOB_ID'
,p_display_order=>50
,p_column_identifier=>'N'
,p_column_label=>'Lr Job Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971249794740279862)
,p_db_column_name=>'LR_LEAVE_DESC'
,p_display_order=>280
,p_column_identifier=>'AA'
,p_column_label=>'Leave Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971249641328279861)
,p_db_column_name=>'LR_LEAVE_ID'
,p_display_order=>270
,p_column_identifier=>'Z'
,p_column_label=>'Leave ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971249853088279863)
,p_db_column_name=>'LR_LEAVE_TYPE'
,p_display_order=>290
,p_column_identifier=>'AB'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971248960735279854)
,p_db_column_name=>'LR_LOC_DESC'
,p_display_order=>250
,p_column_identifier=>'S'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971248851067279853)
,p_db_column_name=>'LR_LOC_ID'
,p_display_order=>80
,p_column_identifier=>'R'
,p_column_label=>'Lr Loc Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971247575740279840)
,p_db_column_name=>'LR_PERIOD'
,p_display_order=>180
,p_column_identifier=>'E'
,p_column_label=>'Period'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971247884052279843)
,p_db_column_name=>'LR_PLNT'
,p_display_order=>20
,p_column_identifier=>'H'
,p_column_label=>'Lr Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971248006210279844)
,p_db_column_name=>'LR_PLNT_DESC'
,p_display_order=>210
,p_column_identifier=>'I'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971248161763279846)
,p_db_column_name=>'LR_POS_DESC'
,p_display_order=>220
,p_column_identifier=>'K'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971248098834279845)
,p_db_column_name=>'LR_POS_ID'
,p_display_order=>30
,p_column_identifier=>'J'
,p_column_label=>'Lr Pos Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971247331615279837)
,p_db_column_name=>'LR_REQ_DATE'
,p_display_order=>150
,p_column_identifier=>'B'
,p_column_label=>'Request Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971247351873279838)
,p_db_column_name=>'LR_REQ_NO'
,p_display_order=>160
,p_column_identifier=>'C'
,p_column_label=>'Request No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971250930394279873)
,p_db_column_name=>'LR_START_SESS'
,p_display_order=>310
,p_column_identifier=>'AL'
,p_column_label=>'Start Sess.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971251043485279875)
,p_db_column_name=>'LR_STATUS'
,p_display_order=>420
,p_column_identifier=>'AN'
,p_column_label=>'Lr Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971250484735279869)
,p_db_column_name=>'LR_TYPE'
,p_display_order=>380
,p_column_identifier=>'AH'
,p_column_label=>'Lr Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971250635896279871)
,p_db_column_name=>'LR_VACATION_FLAG'
,p_display_order=>400
,p_column_identifier=>'AJ'
,p_column_label=>'Lr Vacation Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971250602806279870)
,p_db_column_name=>'LR_WORK_OFF_INCL'
,p_display_order=>390
,p_column_identifier=>'AI'
,p_column_label=>'Lr Work Off Incl'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971247533831279839)
,p_db_column_name=>'LR_YEAR'
,p_display_order=>170
,p_column_identifier=>'D'
,p_column_label=>'Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971250030227279864)
,p_db_column_name=>'START_DATE'
,p_display_order=>300
,p_column_identifier=>'AC'
,p_column_label=>'Start Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5971501928526785360)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4895401'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'LR_REQ_NO:LR_REQ_DATE:LR_EMP_ID:LR_EMP_NAME:LR_LEAVE_ID:LR_LEAVE_DESC:START_DATE:LR_APPLIED_DAYS:END_DATE:LR_YEAR:LR_PERIOD:LR_POS_DESC:LR_DEPT_DESC:LR_PLNT_DESC:LR_BRIEFDESC'
);
wwv_flow_imp.component_end;
end;
/
