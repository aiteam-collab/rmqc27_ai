prompt --application/pages/page_00223
begin
--   Manifest
--     PAGE: 00223
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
 p_id=>223
,p_name=>'Security Policy Update'
,p_alias=>'SECURITY-POLICY-UPDATE1'
,p_page_mode=>'MODAL'
,p_step_title=>'Security Policy Update'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'}',
'',
' .t-fht-thead {',
'    overflow: auto !important;',
' }'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1300'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(3828739318034221261)
,p_plug_name=>'Security Policy Update'
,p_static_id=>'security-policy-update'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select --A.ROWID,',
'       PDU_BU,',
'       PDU_DOC_NO,',
'       PDU_DOC_DATE,',
'       DECODE(PDU_NEW_OTP_FLAG,''Y'',''Yes'',''N'',''No'') AS PDU_NEW_OTP_FLAG ,',
'       DECODE(PDU_NEW_OTP_SOURCE,''E'',''Email'',''S'',''SMS'',''B'',''Both'') AS PDU_NEW_OTP_SOURCE,',
'       DECODE(PDU_NEW_PW_EXP_RQRD,''Y'',''Yes'',''N'',''No'') AS PDU_NEW_PW_EXP_RQRD,',
'       PDU_NEW_PW_EXP_DAYS,',
'       PDU_NEW_PW_EXP_DATE,',
'       PDU_NEW_PW_FREQ,',
'       PDU_NEW_USER_ID_MAX,',
'       PDU_NEW_USER_ID_MIN,',
'       PDU_NEW_USER_PASS_MAX,',
'       PDU_NEW_USER_PASS_MIN,',
'       DECODE(PDU_NEW_OTP_EXP_TIME,''1'',''1 Minutes'',''2'',''2 Minutes'',''3'',''3 Minutes'',''4'',''4 Minutes'',''5'',''5 Minutes'') AS PDU_NEW_OTP_EXP_TIME,',
'       PDU_NEW_NO_SESSION,',
'       PDU_NEW_IDLE_TIME,',
'       PDU_NEW_LOGIN_ATTEMPT,',
'       DECODE(PDU_OLD_OTP_FLAG,''Y'',''Yes'',''N'',''No'') AS PDU_OLD_OTP_FLAG,',
'       DECODE(PDU_OLD_OTP_SOURCE,''E'',''Email'',''S'',''SMS'',''B'',''Both'') AS PDU_OLD_OTP_SOURCE,',
'       DECODE(PDU_OLD_PW_EXP_RQRD,''Y'',''Yes'',''N'',''No'') AS PDU_OLD_PW_EXP_RQRD,',
'       PDU_OLD_PW_EXP_DAYS,',
'       PDU_OLD_PW_EXP_DATE,',
'       PDU_OLD_PW_FREQ,',
'       PDU_OLD_USER_ID_MAX,',
'       PDU_OLD_USER_ID_MIN,',
'       PDU_OLD_USER_PASS_MAX,',
'       PDU_OLD_USER_PASS_MIN,',
'       DECODE(PDU_OLD_OTP_EXP_TIME,''1'',''1 Minutes'',''2'',''2 Minutes'',''3'',''3 Minutes'',''4'',''4 Minutes'',''5'',''5 Minutes'') AS PDU_OLD_OTP_EXP_TIME,',
'       PDU_OLD_NO_SESSION,',
'       PDU_OLD_IDLE_TIME,',
'       PDU_OLD_LOGIN_ATTEMPT,',
'       PDU_STATUS,',
'       PDU_REMARKS,',
'       PDU_APPR_BY,',
'       PDU_APPR_EMP_ID,',
'       PDU_APPR_IP_ADDR,',
'       PDU_APPR_OS_USER,',
'       PDU_APPR_DATE,',
'       PDU_CRE_BY,',
'       PDU_CRE_IP_ADDR,',
'       PDU_CRE_OS_USER,',
'       PDU_CRE_EMP_ID,',
'       PDU_CRE_DATE,',
'       PDU_UPD_BY,',
'       PDU_UPD_IP_ADDR,',
'       PDU_UPD_OS_USER,',
'       PDU_UPD_EMP_ID,',
'       PDU_UPD_DATE',
'  from POLICY_DATA_UPD A,FIN_PERIODS',
' where PDU_BU = :global_bu',
'   and PDU_BU = fp_bu',
'   and (PDU_CRE_DATE between fp_from_date and fp_end_date)',
'   and (fp_short_desc = :P90_MONTH OR :P90_MONTH IS NULL)       ',
'   and (fp_year = :P90_YEAR OR :P90_YEAR IS NULL)',
'   and pdu_status <> ''C''',
' order by pdu_doc_no Desc , pdu_cre_date Desc',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Security Policy Update'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(3828739399459221261)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:224:&SESSION.::&DEBUG.:RP,:P224_ROWID:#ROWID#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>3756635627131033931
);
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(3838074772605032739)
,p_name=>'No. of Sessions'
,p_static_id=>'no-of-sessions'
,p_display_sequence=>30
);
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(3838074899643032740)
,p_name=>'OTP Login'
,p_static_id=>'otp-login'
,p_display_sequence=>40
);
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(3838075037424032741)
,p_name=>'Password Expiry'
,p_static_id=>'password-expiry'
,p_display_sequence=>50
);
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(3838074756628032738)
,p_name=>'Password Length'
,p_static_id=>'password-length'
,p_display_sequence=>20
);
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(3838074628425032737)
,p_name=>'User Name Length'
,p_static_id=>'user-name-length'
,p_display_sequence=>10
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828753415201221276)
,p_db_column_name=>'PDU_APPR_BY'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Approved By'
,p_column_type=>'STRING'
,p_static_id=>'PDU_APPR_BY'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828754991406221278)
,p_db_column_name=>'PDU_APPR_DATE'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Approved Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_static_id=>'PDU_APPR_DATE'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828753794047221278)
,p_db_column_name=>'PDU_APPR_EMP_ID'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Approved Emp. ID'
,p_column_type=>'STRING'
,p_static_id=>'PDU_APPR_EMP_ID'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828754192930221278)
,p_db_column_name=>'PDU_APPR_IP_ADDR'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Approved IP Addr.'
,p_column_type=>'STRING'
,p_static_id=>'PDU_APPR_IP_ADDR'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828754646275221278)
,p_db_column_name=>'PDU_APPR_OS_USER'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Approved OS User'
,p_column_type=>'STRING'
,p_static_id=>'PDU_APPR_OS_USER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828740099135221265)
,p_db_column_name=>'PDU_BU'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'Pdu Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828755435875221278)
,p_db_column_name=>'PDU_CRE_BY'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_static_id=>'PDU_CRE_BY'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828756996574221280)
,p_db_column_name=>'PDU_CRE_DATE'
,p_display_order=>43
,p_column_identifier=>'AQ'
,p_column_label=>'Created Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_static_id=>'PDU_CRE_DATE'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828756621205221280)
,p_db_column_name=>'PDU_CRE_EMP_ID'
,p_display_order=>42
,p_column_identifier=>'AP'
,p_column_label=>'Created Emp. ID'
,p_column_type=>'STRING'
,p_static_id=>'PDU_CRE_EMP_ID'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828755831774221278)
,p_db_column_name=>'PDU_CRE_IP_ADDR'
,p_display_order=>40
,p_column_identifier=>'AN'
,p_column_label=>'Created IP Addr.'
,p_column_type=>'STRING'
,p_static_id=>'PDU_CRE_IP_ADDR'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828756205184221280)
,p_db_column_name=>'PDU_CRE_OS_USER'
,p_display_order=>41
,p_column_identifier=>'AO'
,p_column_label=>'Created OS User'
,p_column_type=>'STRING'
,p_static_id=>'PDU_CRE_OS_USER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828740960644221267)
,p_db_column_name=>'PDU_DOC_DATE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828740532005221267)
,p_db_column_name=>'PDU_DOC_NO'
,p_display_order=>0
,p_column_identifier=>'B'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828746172849221272)
,p_db_column_name=>'PDU_NEW_IDLE_TIME'
,p_display_order=>16
,p_group_id=>wwv_flow_imp.id(3838074772605032739)
,p_column_identifier=>'P'
,p_column_label=>'New Idle. Time'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'PDU_NEW_IDLE_TIME'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828746587197221272)
,p_db_column_name=>'PDU_NEW_LOGIN_ATTEMPT'
,p_display_order=>17
,p_group_id=>wwv_flow_imp.id(3838075037424032741)
,p_column_identifier=>'Q'
,p_column_label=>'New Login Attempt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'PDU_NEW_LOGIN_ATTEMPT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828745773364221272)
,p_db_column_name=>'PDU_NEW_NO_SESSION'
,p_display_order=>15
,p_group_id=>wwv_flow_imp.id(3838074772605032739)
,p_column_identifier=>'O'
,p_column_label=>'New No. Session'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'PDU_NEW_NO_SESSION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3838074035627032731)
,p_db_column_name=>'PDU_NEW_OTP_EXP_TIME'
,p_display_order=>58
,p_column_identifier=>'AW'
,p_column_label=>'Pdu New Otp Exp Time'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_static_id=>'PDU_NEW_OTP_EXP_TIME'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828741308321221269)
,p_db_column_name=>'PDU_NEW_OTP_FLAG'
,p_display_order=>4
,p_group_id=>wwv_flow_imp.id(3838074899643032740)
,p_column_identifier=>'D'
,p_column_label=>'New OTP Flag'
,p_column_type=>'STRING'
,p_static_id=>'PDU_NEW_OTP_FLAG'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828741716793221269)
,p_db_column_name=>'PDU_NEW_OTP_SOURCE'
,p_display_order=>5
,p_group_id=>wwv_flow_imp.id(3838074899643032740)
,p_column_identifier=>'E'
,p_column_label=>'New OTP Source'
,p_column_type=>'STRING'
,p_static_id=>'PDU_NEW_OTP_SOURCE'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828743035402221270)
,p_db_column_name=>'PDU_NEW_PW_EXP_DATE'
,p_display_order=>8
,p_group_id=>wwv_flow_imp.id(3838074899643032740)
,p_column_identifier=>'H'
,p_column_label=>'New Pw. Exp. Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_static_id=>'PDU_NEW_PW_EXP_DATE'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828742614972221269)
,p_db_column_name=>'PDU_NEW_PW_EXP_DAYS'
,p_display_order=>7
,p_group_id=>wwv_flow_imp.id(3838075037424032741)
,p_column_identifier=>'G'
,p_column_label=>'New Pw. Exp. Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'PDU_NEW_PW_EXP_DAYS'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828742229635221269)
,p_db_column_name=>'PDU_NEW_PW_EXP_RQRD'
,p_display_order=>6
,p_group_id=>wwv_flow_imp.id(3838075037424032741)
,p_column_identifier=>'F'
,p_column_label=>'New Pw. Exp. Rqrd.'
,p_column_type=>'STRING'
,p_static_id=>'PDU_NEW_PW_EXP_RQRD'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828743446163221270)
,p_db_column_name=>'PDU_NEW_PW_FREQ'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'New Pw. Freq.'
,p_column_type=>'STRING'
,p_static_id=>'PDU_NEW_PW_FREQ'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828743859149221270)
,p_db_column_name=>'PDU_NEW_USER_ID_MAX'
,p_display_order=>10
,p_group_id=>wwv_flow_imp.id(3838074628425032737)
,p_column_identifier=>'J'
,p_column_label=>'New User ID Max'
,p_column_type=>'STRING'
,p_static_id=>'PDU_NEW_USER_ID_MAX'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828744180300221270)
,p_db_column_name=>'PDU_NEW_USER_ID_MIN'
,p_display_order=>11
,p_group_id=>wwv_flow_imp.id(3838074628425032737)
,p_column_identifier=>'K'
,p_column_label=>'New User ID Min.'
,p_column_type=>'STRING'
,p_static_id=>'PDU_NEW_USER_ID_MIN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828744636902221270)
,p_db_column_name=>'PDU_NEW_USER_PASS_MAX'
,p_display_order=>12
,p_group_id=>wwv_flow_imp.id(3838074756628032738)
,p_column_identifier=>'L'
,p_column_label=>'New User Pass. Max.'
,p_column_type=>'STRING'
,p_static_id=>'PDU_NEW_USER_PASS_MAX'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828744987543221272)
,p_db_column_name=>'PDU_NEW_USER_PASS_MIN'
,p_display_order=>13
,p_group_id=>wwv_flow_imp.id(3838074756628032738)
,p_column_identifier=>'M'
,p_column_label=>'New User Pass. Min.'
,p_column_type=>'STRING'
,p_static_id=>'PDU_NEW_USER_PASS_MIN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828751830957221276)
,p_db_column_name=>'PDU_OLD_IDLE_TIME'
,p_display_order=>30
,p_group_id=>wwv_flow_imp.id(3838074772605032739)
,p_column_identifier=>'AD'
,p_column_label=>'Old Idle Time'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'PDU_OLD_IDLE_TIME'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828752227144221276)
,p_db_column_name=>'PDU_OLD_LOGIN_ATTEMPT'
,p_display_order=>31
,p_group_id=>wwv_flow_imp.id(3838075037424032741)
,p_column_identifier=>'AE'
,p_column_label=>'Old Login Attempt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'PDU_OLD_LOGIN_ATTEMPT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828751431352221276)
,p_db_column_name=>'PDU_OLD_NO_SESSION'
,p_display_order=>29
,p_group_id=>wwv_flow_imp.id(3838074772605032739)
,p_column_identifier=>'AC'
,p_column_label=>'Old No. Session'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'PDU_OLD_NO_SESSION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3838074121235032732)
,p_db_column_name=>'PDU_OLD_OTP_EXP_TIME'
,p_display_order=>68
,p_column_identifier=>'AX'
,p_column_label=>'Pdu Old Otp Exp Time'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_static_id=>'PDU_OLD_OTP_EXP_TIME'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828746992446221273)
,p_db_column_name=>'PDU_OLD_OTP_FLAG'
,p_display_order=>18
,p_group_id=>wwv_flow_imp.id(3838074899643032740)
,p_column_identifier=>'R'
,p_column_label=>'Old OTP Flag'
,p_column_type=>'STRING'
,p_static_id=>'PDU_OLD_OTP_FLAG'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828747464130221273)
,p_db_column_name=>'PDU_OLD_OTP_SOURCE'
,p_display_order=>19
,p_group_id=>wwv_flow_imp.id(3838074899643032740)
,p_column_identifier=>'S'
,p_column_label=>'Old OTP Source'
,p_column_type=>'STRING'
,p_static_id=>'PDU_OLD_OTP_SOURCE'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828748583535221273)
,p_db_column_name=>'PDU_OLD_PW_EXP_DATE'
,p_display_order=>22
,p_group_id=>wwv_flow_imp.id(3838074899643032740)
,p_column_identifier=>'V'
,p_column_label=>'Old Pw. Exp. Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_static_id=>'PDU_OLD_PW_EXP_DATE'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828748195074221273)
,p_db_column_name=>'PDU_OLD_PW_EXP_DAYS'
,p_display_order=>21
,p_group_id=>wwv_flow_imp.id(3838075037424032741)
,p_column_identifier=>'U'
,p_column_label=>'Old Pw. Exp. Days'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_static_id=>'PDU_OLD_PW_EXP_DAYS'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828747856901221273)
,p_db_column_name=>'PDU_OLD_PW_EXP_RQRD'
,p_display_order=>20
,p_group_id=>wwv_flow_imp.id(3838075037424032741)
,p_column_identifier=>'T'
,p_column_label=>'Old Pw. Exp. Rqrd.'
,p_column_type=>'STRING'
,p_static_id=>'PDU_OLD_PW_EXP_RQRD'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828749034300221273)
,p_db_column_name=>'PDU_OLD_PW_FREQ'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Old Pw. Freq.'
,p_column_type=>'STRING'
,p_static_id=>'PDU_OLD_PW_FREQ'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828749439850221275)
,p_db_column_name=>'PDU_OLD_USER_ID_MAX'
,p_display_order=>24
,p_group_id=>wwv_flow_imp.id(3838074628425032737)
,p_column_identifier=>'X'
,p_column_label=>'Old User ID Max.'
,p_column_type=>'STRING'
,p_static_id=>'PDU_OLD_USER_ID_MAX'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828749833138221275)
,p_db_column_name=>'PDU_OLD_USER_ID_MIN'
,p_display_order=>25
,p_group_id=>wwv_flow_imp.id(3838074628425032737)
,p_column_identifier=>'Y'
,p_column_label=>'Old User ID Min.'
,p_column_type=>'STRING'
,p_static_id=>'PDU_OLD_USER_ID_MIN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828750216737221275)
,p_db_column_name=>'PDU_OLD_USER_PASS_MAX'
,p_display_order=>26
,p_group_id=>wwv_flow_imp.id(3838074756628032738)
,p_column_identifier=>'Z'
,p_column_label=>'Old User Pass. Max.'
,p_column_type=>'STRING'
,p_static_id=>'PDU_OLD_USER_PASS_MAX'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828750575659221275)
,p_db_column_name=>'PDU_OLD_USER_PASS_MIN'
,p_display_order=>27
,p_group_id=>wwv_flow_imp.id(3838074756628032738)
,p_column_identifier=>'AA'
,p_column_label=>'Old User Pass. Min.'
,p_column_type=>'STRING'
,p_static_id=>'PDU_OLD_USER_PASS_MIN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828753058879221276)
,p_db_column_name=>'PDU_REMARKS'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Remarks'
,p_column_type=>'STRING'
,p_static_id=>'PDU_REMARKS'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828752621884221276)
,p_db_column_name=>'PDU_STATUS'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_static_id=>'PDU_STATUS'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828757399508221280)
,p_db_column_name=>'PDU_UPD_BY'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_static_id=>'PDU_UPD_BY'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828759034793221281)
,p_db_column_name=>'PDU_UPD_DATE'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'Updated Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_static_id=>'PDU_UPD_DATE'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828758617788221281)
,p_db_column_name=>'PDU_UPD_EMP_ID'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'Updated Emp. ID'
,p_column_type=>'STRING'
,p_static_id=>'PDU_UPD_EMP_ID'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828757830611221280)
,p_db_column_name=>'PDU_UPD_IP_ADDR'
,p_display_order=>45
,p_column_identifier=>'AS'
,p_column_label=>'Updated IP Addr.'
,p_column_type=>'STRING'
,p_static_id=>'PDU_UPD_IP_ADDR'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3828758197912221280)
,p_db_column_name=>'PDU_UPD_OS_USER'
,p_display_order=>46
,p_column_identifier=>'AT'
,p_column_label=>'Updated OS User'
,p_column_type=>'STRING'
,p_static_id=>'PDU_UPD_OS_USER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(3828768577687225836)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'37566649'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PDU_DOC_NO:PDU_DOC_DATE:PDU_OLD_USER_ID_MIN:PDU_NEW_USER_ID_MIN:PDU_OLD_USER_ID_MAX:PDU_NEW_USER_ID_MAX:PDU_OLD_USER_PASS_MIN:PDU_NEW_USER_PASS_MIN:PDU_OLD_USER_PASS_MAX:PDU_NEW_USER_PASS_MAX:PDU_OLD_NO_SESSION:PDU_NEW_NO_SESSION:PDU_OLD_IDLE_TIME:PD'
||'U_NEW_IDLE_TIME:PDU_OLD_OTP_FLAG:PDU_NEW_OTP_FLAG:PDU_OLD_OTP_SOURCE:PDU_NEW_OTP_SOURCE:PDU_OLD_PW_EXP_DATE:PDU_NEW_PW_EXP_DATE:PDU_OLD_PW_EXP_RQRD:PDU_NEW_PW_EXP_RQRD:PDU_OLD_PW_EXP_DAYS:PDU_NEW_PW_EXP_DAYS:PDU_OLD_LOGIN_ATTEMPT:PDU_NEW_LOGIN_ATTEMP'
||'T:PDU_APPR_BY:PDU_APPR_DATE:PDU_APPR_EMP_ID:PDU_APPR_IP_ADDR:PDU_APPR_OS_USER:PDU_CRE_BY:PDU_CRE_DATE:PDU_CRE_EMP_ID:PDU_CRE_IP_ADDR:PDU_CRE_OS_USER:PDU_UPD_BY:PDU_UPD_DATE:PDU_UPD_EMP_ID:PDU_UPD_IP_ADDR:PDU_UPD_OS_USER:PDU_REMARKS:PDU_STATUS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3828759545835221281)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(3828739318034221261)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:224:&APP_SESSION.::&DEBUG.:224::'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3828759798941221281)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(3828739318034221261)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3828760332720221283)
,p_event_id=>wwv_flow_imp.id(3828759798941221281)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3828739318034221261)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3838074471923032735)
,p_name=>'IG'
,p_static_id=>'ig'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(3828739318034221261)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3838074562179032736)
,p_event_id=>wwv_flow_imp.id(3838074471923032735)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'plugin-com-clarifit-apexplugin-ir-column-grouping'
,p_action=>'PLUGIN_COM.CLARIFIT.APEXPLUGIN.IR_COLUMN_GROUPING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'true')).to_clob
);
wwv_flow_imp.component_end;
end;
/
