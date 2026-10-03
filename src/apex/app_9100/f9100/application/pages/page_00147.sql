prompt --application/pages/page_00147
begin
--   Manifest
--     PAGE: 00147
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
 p_id=>147
,p_name=>'Pending Encashment'
,p_alias=>'PENDING-ENCASHMENT'
,p_page_mode=>'MODAL'
,p_step_title=>'Pending Encashment'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-table {',
'          white-space: nowrap;',
'          word-wrap: break-word;',
'  }',
'#Clear{',
'   background-image: url(#APP_FILES#clearclear-removebg- ',
'   preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: #D2D2DF;',
'   background-size: 25px;',
'   width: 26px;',
'   height: 23px;',
'   top: -3px;',
'}',
'#Clear1{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: #D2D2DF;',
'   background-size: 25px;',
'   width: 26px;',
'   height: 23px;',
'   top: -3px;',
'}',
'#Clear2{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: #D2D2DF;',
'   background-size: 25px;',
'   width: 26px;',
'   height: 23px;',
'   top: -3px;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1400'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5971676454299900265)
,p_plug_name=>'Pending Encashment'
,p_static_id=>'pending-encashment'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    eplerv_bu,',
'    eplerv_req_date,',
'    eplerv_req_no,',
'    eplerv_year,',
'    eplerv_period,',
'    eplerv_emp_id,',
'    eplerv_emp_name,',
'    eplerv_emp_start_date,',
'    eplerv_emp_plnt,',
'    eplerv_emp_plnt_desc,',
'    eplerv_pos_id,',
'    eplerv_pos_desc,',
'    eplerv_dept_id,',
'    eplerv_dept_desc,',
'    eplerv_job_id,',
'    eplerv_job_desc,',
'    eplerv_grade,',
'    eplerv_grade_desc,',
'    eplerv_loc_id,',
'    eplerv_loc_desc,',
'    eplerv_last_proc_year,',
'    eplerv_last_proc_period,',
'    eplerv_encash_elmnt_id,',
'    eplerv_emp_cur_acct,',
'    eplerv_leave_id',
'    || ''-''',
'    || eplerv_leave_desc "leave",',
'    eplerv_leave_desc,',
'    eplerv_leave_type,',
'    eplerv_start_date,',
'    eplerv_end_date,',
'    eplerv_applied_days,',
'    eplerv_briefdesc,',
'    eplerv_chk_flag,',
'    eplerv_type,',
'    eplerv_encash_opt,',
'    eplerv_encash_amt,',
'    eplerv_emp_bank_acct_no,',
'    eplerv_encash_adj_no,',
'    eplerv_status,',
'    eplerv_cre_by,',
'    eplerv_cre_date,',
'    eplerv_upd_by,',
'    eplerv_upd_date',
'FROM emp_pend_leave_encash_rqst_vw',
' WHERE eplerv_bu = :global_bu',
'ORDER BY eplerv_req_no DESC'))
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
 p_id=>wwv_flow_imp.id(5971676620286900266)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>489714784743289238
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971779859281982346)
,p_db_column_name=>'EPLERV_APPLIED_DAYS'
,p_display_order=>310
,p_column_identifier=>'AD'
,p_column_label=>'Applied Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971779983234982347)
,p_db_column_name=>'EPLERV_BRIEFDESC'
,p_display_order=>320
,p_column_identifier=>'AE'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971676712163900267)
,p_db_column_name=>'EPLERV_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Eplerv Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971780045651982348)
,p_db_column_name=>'EPLERV_CHK_FLAG'
,p_display_order=>440
,p_column_identifier=>'AF'
,p_column_label=>'Eplerv Chk Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971780829079982355)
,p_db_column_name=>'EPLERV_CRE_BY'
,p_display_order=>400
,p_column_identifier=>'AM'
,p_column_label=>'Eplerv Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971780912207982356)
,p_db_column_name=>'EPLERV_CRE_DATE'
,p_display_order=>410
,p_column_identifier=>'AN'
,p_column_label=>'Eplerv Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971778286544982330)
,p_db_column_name=>'EPLERV_DEPT_DESC'
,p_display_order=>260
,p_column_identifier=>'N'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971778180507982329)
,p_db_column_name=>'EPLERV_DEPT_ID'
,p_display_order=>40
,p_column_identifier=>'M'
,p_column_label=>'Eplerv Dept Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971780446995982352)
,p_db_column_name=>'EPLERV_EMP_BANK_ACCT_NO'
,p_display_order=>370
,p_column_identifier=>'AJ'
,p_column_label=>'Eplerv Emp Bank Acct No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971779269905982340)
,p_db_column_name=>'EPLERV_EMP_CUR_ACCT'
,p_display_order=>140
,p_column_identifier=>'X'
,p_column_label=>'Eplerv Emp Cur Acct'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971677163220900272)
,p_db_column_name=>'EPLERV_EMP_ID'
,p_display_order=>210
,p_column_identifier=>'F'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971677282424900273)
,p_db_column_name=>'EPLERV_EMP_NAME'
,p_display_order=>220
,p_column_identifier=>'G'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971677492833900275)
,p_db_column_name=>'EPLERV_EMP_PLNT'
,p_display_order=>20
,p_column_identifier=>'I'
,p_column_label=>'Eplerv Emp Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971677583979900276)
,p_db_column_name=>'EPLERV_EMP_PLNT_DESC'
,p_display_order=>240
,p_column_identifier=>'J'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971677435192900274)
,p_db_column_name=>'EPLERV_EMP_START_DATE'
,p_display_order=>230
,p_column_identifier=>'H'
,p_column_label=>'DOJ'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971780582748982353)
,p_db_column_name=>'EPLERV_ENCASH_ADJ_NO'
,p_display_order=>380
,p_column_identifier=>'AK'
,p_column_label=>'Eplerv Encash Adj No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971780368488982351)
,p_db_column_name=>'EPLERV_ENCASH_AMT'
,p_display_order=>360
,p_column_identifier=>'AI'
,p_column_label=>'Encash Amt.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971779148360982339)
,p_db_column_name=>'EPLERV_ENCASH_ELMNT_ID'
,p_display_order=>130
,p_column_identifier=>'W'
,p_column_label=>'Elmnt. ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971780252066982350)
,p_db_column_name=>'EPLERV_ENCASH_OPT'
,p_display_order=>460
,p_column_identifier=>'AH'
,p_column_label=>'Eplerv Encash Opt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971779788354982345)
,p_db_column_name=>'EPLERV_END_DATE'
,p_display_order=>300
,p_column_identifier=>'AC'
,p_column_label=>'End Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971778626561982333)
,p_db_column_name=>'EPLERV_GRADE'
,p_display_order=>70
,p_column_identifier=>'Q'
,p_column_label=>'Eplerv Grade'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971778693362982334)
,p_db_column_name=>'EPLERV_GRADE_DESC'
,p_display_order=>100
,p_column_identifier=>'R'
,p_column_label=>'Eplerv Grade Desc'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971778493547982332)
,p_db_column_name=>'EPLERV_JOB_DESC'
,p_display_order=>60
,p_column_identifier=>'P'
,p_column_label=>'Eplerv Job Desc'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971778396709982331)
,p_db_column_name=>'EPLERV_JOB_ID'
,p_display_order=>50
,p_column_identifier=>'O'
,p_column_label=>'Eplerv Job Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971779039189982338)
,p_db_column_name=>'EPLERV_LAST_PROC_PERIOD'
,p_display_order=>120
,p_column_identifier=>'V'
,p_column_label=>'Eplerv Last Proc Period'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971778957585982337)
,p_db_column_name=>'EPLERV_LAST_PROC_YEAR'
,p_display_order=>110
,p_column_identifier=>'U'
,p_column_label=>'Last Proc Year'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971779465674982342)
,p_db_column_name=>'EPLERV_LEAVE_DESC'
,p_display_order=>150
,p_column_identifier=>'Z'
,p_column_label=>'Eplerv Leave Desc'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971779590601982343)
,p_db_column_name=>'EPLERV_LEAVE_TYPE'
,p_display_order=>160
,p_column_identifier=>'AA'
,p_column_label=>'Eplerv Leave Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971778900464982336)
,p_db_column_name=>'EPLERV_LOC_DESC'
,p_display_order=>90
,p_column_identifier=>'T'
,p_column_label=>'Eplerv Loc Desc'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971778805481982335)
,p_db_column_name=>'EPLERV_LOC_ID'
,p_display_order=>80
,p_column_identifier=>'S'
,p_column_label=>'Eplerv Loc Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971677041036900271)
,p_db_column_name=>'EPLERV_PERIOD'
,p_display_order=>200
,p_column_identifier=>'E'
,p_column_label=>'Period'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971677776484900278)
,p_db_column_name=>'EPLERV_POS_DESC'
,p_display_order=>250
,p_column_identifier=>'L'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971677694380900277)
,p_db_column_name=>'EPLERV_POS_ID'
,p_display_order=>30
,p_column_identifier=>'K'
,p_column_label=>'Eplerv Pos Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971676826569900268)
,p_db_column_name=>'EPLERV_REQ_DATE'
,p_display_order=>170
,p_column_identifier=>'B'
,p_column_label=>'Request Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971676847263900269)
,p_db_column_name=>'EPLERV_REQ_NO'
,p_display_order=>180
,p_column_identifier=>'C'
,p_column_label=>'Request No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971779637960982344)
,p_db_column_name=>'EPLERV_START_DATE'
,p_display_order=>290
,p_column_identifier=>'AB'
,p_column_label=>'Start Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971780651958982354)
,p_db_column_name=>'EPLERV_STATUS'
,p_display_order=>390
,p_column_identifier=>'AL'
,p_column_label=>'Eplerv Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971780190852982349)
,p_db_column_name=>'EPLERV_TYPE'
,p_display_order=>450
,p_column_identifier=>'AG'
,p_column_label=>'Eplerv Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971781004755982357)
,p_db_column_name=>'EPLERV_UPD_BY'
,p_display_order=>420
,p_column_identifier=>'AO'
,p_column_label=>'Eplerv Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971781121101982358)
,p_db_column_name=>'EPLERV_UPD_DATE'
,p_display_order=>430
,p_column_identifier=>'AP'
,p_column_label=>'Eplerv Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971676977073900270)
,p_db_column_name=>'EPLERV_YEAR'
,p_display_order=>190
,p_column_identifier=>'D'
,p_column_label=>'Year'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971779430811982341)
,p_db_column_name=>'leave'
,p_display_order=>270
,p_column_identifier=>'Y'
,p_column_label=>'Leave'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5971802899642987340)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4898411'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'EPLERV_REQ_NO:EPLERV_REQ_DATE:EPLERV_EMP_ID:EPLERV_EMP_NAME:EPLERV_EMP_START_DATE:EPLERV_POS_DESC:EPLERV_DEPT_DESC:EPLERV_EMP_PLNT_DESC:EPLERV_ENCASH_AMT'
);
wwv_flow_imp.component_end;
end;
/
