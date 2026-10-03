prompt --application/pages/page_2361300100
begin
--   Manifest
--     PAGE: 2361300100
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
 p_id=>2361300100
,p_name=>'Work Flow'
,p_alias=>'WORK-FLOW5'
,p_step_title=>'Work Flow'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-fht-thead {',
'    overflow: auto !important;',
'}',
'.a-IRR-table {',
'      border-collapse: collapse;',
'      table-layout: auto;',
'      border-spacing: 0;',
'      white-space: nowrap;',
'      word-wrap: break-word;',
'  }',
'',
'a {',
'    color: #608ab5;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5954680782649426595)
,p_plug_name=>'Work Flow'
,p_static_id=>'work-flow'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WF_BU,',
'       WF_SEQ_NO,',
'       WF_BUS_PROC_ID,',
'       WF_BUS_PROC_DESC,',
'       WF_BUS_PROC_DESC2,',
'       WF_MAIL_FLAG,',
'       WF_INT_MSG_FLAG,',
'       WF_SMS_FLAG,',
'       WF_REPORT_ID,',
'       WF_CALL_FORM,',
'       WF_AUTH_TYPE,',
'       DECODE(WF_AUTH_TYPE,''E'',''Employee'',''P'',''Position'')Auth_type,',
'       WF_BASIS,',
'       DECODE(WF_BASIS,''E'',''Entity'',''U'',''Unit'')Auth_Basis,',
'       WF_APPL,',
'       WF_VAL_BASED_FLAG,',
'       WF_MODULE,',
'       WF_MOD_SEQ_NO,',
'       WF_CLS_BASED,',
'       WF_DISC_PCT_BASED_FLAG,',
'       WF_PRINT_SEQ_NO,',
'       WF_HIER_TYPE,',
'       CASE WHEN WF_HIER_TYPE = ''E'' THEN ''Emp. Hierarchy''',
'            WHEN WF_HIER_TYPE = ''O'' THEN ''Organization Chart''',
'            WHEN WF_HIER_TYPE = ''U'' THEN ''User Defined''',
'            END Hierarchy_type,',
'       WF_CRE_BY,',
'       WF_CRE_IP_ADDR,',
'       WF_CRE_OS_USER,',
'       WF_CRE_DATE,',
'       WF_UPD_BY,',
'       WF_UPD_IP_ADDR,',
'       WF_UPD_OS_USER,',
'       WF_UPD_DATE,',
'       WF_SELF_APPR_FLAG,',
'       DECODE(WF_SELF_APPR_FLAG,''Y'',''Yes'',''N'',''No'')Self_approval,',
'       WF_CRE_EMP_ID,',
'       WF_UPD_EMP_ID,',
'       WF_PROJ_BASED_FLAG,',
'       WF_APPR_BASIS,',
'       DECODE(WF_APPR_BASIS,''V'',''Value'',''C'',''Class'',''D'',''Discount %'',''P'',''Project'',''X'',''Prefix'',''N'',''NA'')Approval_Basis,',
'       WF_VERT_TYPE,',
'       DECODE(WF_VERT_TYPE,''STD'',''Standard'',''VET'',''Vertical'')Std_Vert_Type,',
'       WF_MAIL_SEND_OPT,',
'       DECODE(WF_MAIL_SEND_OPT,''S'',''System'',''M'',''Manual'')Mail_Option,',
'       WF_SMS_SEND_OPT,',
'       WF_APEX_PAGE_NO,',
'       WF_APEX_APPL_NO',
'  from WORK_FLOW',
'  WHERE WF_BU = :GLOBAL_BU',
'    --AND WF_VERT_TYPE = ''STD'''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Work Flow'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(5954680913117426595)
,p_max_row_count=>'1000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>472719077573815567
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5955232430753866534)
,p_db_column_name=>'APPROVAL_BASIS'
,p_display_order=>405
,p_column_identifier=>'AQ'
,p_column_label=>'Approval Basis'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5955232170927866532)
,p_db_column_name=>'AUTH_BASIS'
,p_display_order=>385
,p_column_identifier=>'AO'
,p_column_label=>'Auth. Basis'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5955232042309866531)
,p_db_column_name=>'AUTH_TYPE'
,p_display_order=>375
,p_column_identifier=>'AN'
,p_column_label=>'Auth. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5955232258032866533)
,p_db_column_name=>'HIERARCHY_TYPE'
,p_display_order=>395
,p_column_identifier=>'AP'
,p_column_label=>'Hierarchy Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5955232556563866536)
,p_db_column_name=>'MAIL_OPTION'
,p_display_order=>425
,p_column_identifier=>'AS'
,p_column_label=>'Mail Option'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5955231909988866529)
,p_db_column_name=>'ROWID'
,p_display_order=>365
,p_column_identifier=>'AM'
,p_column_label=>'Rowid'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5955232689457866537)
,p_db_column_name=>'SELF_APPROVAL'
,p_display_order=>435
,p_column_identifier=>'AT'
,p_column_label=>'Self Approval'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5955232482310866535)
,p_db_column_name=>'STD_VERT_TYPE'
,p_display_order=>415
,p_column_identifier=>'AR'
,p_column_label=>'Std./Vert. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954696082920426651)
,p_db_column_name=>'WF_APEX_APPL_NO'
,p_display_order=>255
,p_column_identifier=>'AL'
,p_column_label=>'Wf Apex Appl No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954695704475426649)
,p_db_column_name=>'WF_APEX_PAGE_NO'
,p_display_order=>245
,p_column_identifier=>'AK'
,p_column_label=>'Wf Apex Page No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954686047723426632)
,p_db_column_name=>'WF_APPL'
,p_display_order=>155
,p_column_identifier=>'M'
,p_column_label=>'Wf Appl'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954694125037426648)
,p_db_column_name=>'WF_APPR_BASIS'
,p_display_order=>75
,p_column_identifier=>'AG'
,p_column_label=>'Approval Basis'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954685323301426631)
,p_db_column_name=>'WF_AUTH_TYPE'
,p_display_order=>55
,p_column_identifier=>'K'
,p_column_label=>'Auth Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954685666927426632)
,p_db_column_name=>'WF_BASIS'
,p_display_order=>65
,p_column_identifier=>'L'
,p_column_label=>'Auth. Basis'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954681243861426612)
,p_db_column_name=>'WF_BU'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Wf Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954682534364426626)
,p_db_column_name=>'WF_BUS_PROC_DESC'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Work Flow Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954682905627426628)
,p_db_column_name=>'WF_BUS_PROC_DESC2'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Wf Bus Proc Desc2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954682081527426623)
,p_db_column_name=>'WF_BUS_PROC_ID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'C'
,p_column_label=>'Work Flow ID'
,p_column_link=>'f?p=&APP_ID.:2361300102:&SESSION.::&DEBUG.::P2361300102_ROWID,P2361300102_WF_BU,P2361300102_WF_BUS_PROC_ID:#ROWID#,#WF_BU#,#WF_BUS_PROC_ID#'
,p_column_linktext=>'#WF_BUS_PROC_ID#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954684880503426631)
,p_db_column_name=>'WF_CALL_FORM'
,p_display_order=>15
,p_column_identifier=>'J'
,p_column_label=>'Call Form'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954687671248426634)
,p_db_column_name=>'WF_CLS_BASED'
,p_display_order=>185
,p_column_identifier=>'Q'
,p_column_label=>'Wf Cls Based'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954689330032426637)
,p_db_column_name=>'WF_CRE_BY'
,p_display_order=>265
,p_column_identifier=>'U'
,p_column_label=>'Wf Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954690498176426640)
,p_db_column_name=>'WF_CRE_DATE'
,p_display_order=>295
,p_column_identifier=>'X'
,p_column_label=>'Wf Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954692918906426645)
,p_db_column_name=>'WF_CRE_EMP_ID'
,p_display_order=>345
,p_column_identifier=>'AD'
,p_column_label=>'Wf Cre Emp ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954689653351426638)
,p_db_column_name=>'WF_CRE_IP_ADDR'
,p_display_order=>275
,p_column_identifier=>'V'
,p_column_label=>'Wf Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954690132298426638)
,p_db_column_name=>'WF_CRE_OS_USER'
,p_display_order=>285
,p_column_identifier=>'W'
,p_column_label=>'Wf Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954688079947426635)
,p_db_column_name=>'WF_DISC_PCT_BASED_FLAG'
,p_display_order=>195
,p_column_identifier=>'R'
,p_column_label=>'Wf Disc Pct Based Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954688924742426637)
,p_db_column_name=>'WF_HIER_TYPE'
,p_display_order=>45
,p_column_identifier=>'T'
,p_column_label=>'Hier Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954683670055426629)
,p_db_column_name=>'WF_INT_MSG_FLAG'
,p_display_order=>125
,p_column_identifier=>'G'
,p_column_label=>'Wf Int Msg Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954683280691426628)
,p_db_column_name=>'WF_MAIL_FLAG'
,p_display_order=>115
,p_column_identifier=>'F'
,p_column_label=>'Wf Mail Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954694892124426648)
,p_db_column_name=>'WF_MAIL_SEND_OPT'
,p_display_order=>95
,p_column_identifier=>'AI'
,p_column_label=>'Mail Option'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954686858174426634)
,p_db_column_name=>'WF_MODULE'
,p_display_order=>25
,p_column_identifier=>'O'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954687282939426634)
,p_db_column_name=>'WF_MOD_SEQ_NO'
,p_display_order=>175
,p_column_identifier=>'P'
,p_column_label=>'Wf Mod Seq No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954688506689426635)
,p_db_column_name=>'WF_PRINT_SEQ_NO'
,p_display_order=>205
,p_column_identifier=>'S'
,p_column_label=>'Wf Print Seq No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954693713726426646)
,p_db_column_name=>'WF_PROJ_BASED_FLAG'
,p_display_order=>225
,p_column_identifier=>'AF'
,p_column_label=>'Wf Proj Based Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954684499435426631)
,p_db_column_name=>'WF_REPORT_ID'
,p_display_order=>145
,p_column_identifier=>'I'
,p_column_label=>'Wf Report ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954692492292426643)
,p_db_column_name=>'WF_SELF_APPR_FLAG'
,p_display_order=>105
,p_column_identifier=>'AC'
,p_column_label=>'Self Approval'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954681663162426623)
,p_db_column_name=>'WF_SEQ_NO'
,p_display_order=>35
,p_column_identifier=>'B'
,p_column_label=>'Seq. No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954684089697426629)
,p_db_column_name=>'WF_SMS_FLAG'
,p_display_order=>135
,p_column_identifier=>'H'
,p_column_label=>'Wf Sms Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954695319372426649)
,p_db_column_name=>'WF_SMS_SEND_OPT'
,p_display_order=>235
,p_column_identifier=>'AJ'
,p_column_label=>'Wf Sms Send Opt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954690859007426640)
,p_db_column_name=>'WF_UPD_BY'
,p_display_order=>305
,p_column_identifier=>'Y'
,p_column_label=>'Wf Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954692061904426643)
,p_db_column_name=>'WF_UPD_DATE'
,p_display_order=>335
,p_column_identifier=>'AB'
,p_column_label=>'Wf Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954693309169426645)
,p_db_column_name=>'WF_UPD_EMP_ID'
,p_display_order=>355
,p_column_identifier=>'AE'
,p_column_label=>'Wf Upd Emp ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954691268752426642)
,p_db_column_name=>'WF_UPD_IP_ADDR'
,p_display_order=>315
,p_column_identifier=>'Z'
,p_column_label=>'Wf Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954691667469426642)
,p_db_column_name=>'WF_UPD_OS_USER'
,p_display_order=>325
,p_column_identifier=>'AA'
,p_column_label=>'Wf Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954686446690426632)
,p_db_column_name=>'WF_VAL_BASED_FLAG'
,p_display_order=>165
,p_column_identifier=>'N'
,p_column_label=>'Wf Val Based Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5954694479066426648)
,p_db_column_name=>'WF_VERT_TYPE'
,p_display_order=>85
,p_column_identifier=>'AH'
,p_column_label=>'Std./Vert. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5954703485939428817)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4727417'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WF_BUS_PROC_ID:WF_BUS_PROC_DESC:WF_CALL_FORM:WF_MODULE:WF_SEQ_NO:HIERARCHY_TYPE:AUTH_TYPE:AUTH_BASIS:APPROVAL_BASIS:STD_VERT_TYPE:MAIL_OPTION:SELF_APPROVAL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5954696601644426653)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(5954680782649426595)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Work Flow'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:2361300102:&APP_SESSION.::&DEBUG.:2361300102::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5954696874283426653)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(5954680782649426595)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5954697343268426656)
,p_event_id=>wwv_flow_imp.id(5954696874283426653)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(5954680782649426595)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
