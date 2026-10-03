prompt --application/pages/page_00028
begin
--   Manifest
--     PAGE: 00028
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
 p_id=>28
,p_name=>'Edit Mail'
,p_alias=>'EDIT-MAIL1'
,p_step_title=>'Edit Mail'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6320967219263051806)
,p_plug_name=>'Report 1'
,p_static_id=>'report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       EOH_BU,',
'       EOH_DOC_NO,',
'       EOH_DOC_DATE,',
'       EOH_SNDR_EMAIL,',
'       EOH_SUBJ,',
'       EOH_BODY,',
'       EOH_USER_ID,',
'       EOH_EMP_ID,',
'       EOH_VOU_TYPE,',
'       EOH_VOU_PFX,',
'       EOH_VOU_NO,',
'       EOH_STATUS,',
'       EOH_UNIT,',
'       EOH_WF_TYPE,',
'       EOH_SEQ_NO,',
'       EOH_CRE_BY,',
'       EOH_CRE_IP_ADDR,',
'       EOH_CRE_OS_USER,',
'       EOH_CRE_DATE,',
'       EOH_UPD_BY,',
'       EOH_UPD_IP_ADDR,',
'       EOH_UPD_OS_USER,',
'       EOH_UPD_DATE,',
'       EOH_CRE_EMP_ID,',
'       EOH_UPD_EMP_ID,',
'       EOH_MAIL_TYPE,',
'       EOH_MAIL_SEND_OPT',
'  from EMAIL_OUTBOX_HD',
'  where EOH_BU = :global_bu',
'  -- AND eoh_mail_type = ''M'''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Report 1'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6320967600712051806)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:RP:P29_ROWID:\#ROWID#\'
,p_detail_link_text=>'<span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_internal_uid=>177125571305530545
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320970127183051812)
,p_db_column_name=>'EOH_BODY'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Eoh Body'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320968031951051811)
,p_db_column_name=>'EOH_BU'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Eoh Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320974098687051823)
,p_db_column_name=>'EOH_CRE_BY'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Eoh Cre By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320975313104051825)
,p_db_column_name=>'EOH_CRE_DATE'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Eoh Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320977260214051828)
,p_db_column_name=>'EOH_CRE_EMP_ID'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Eoh Cre Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320974518950051825)
,p_db_column_name=>'EOH_CRE_IP_ADDR'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Eoh Cre Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320974877434051825)
,p_db_column_name=>'EOH_CRE_OS_USER'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Eoh Cre Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320968900630051812)
,p_db_column_name=>'EOH_DOC_DATE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Eoh Doc Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320968486986051811)
,p_db_column_name=>'EOH_DOC_NO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Eoh Doc No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320970904769051815)
,p_db_column_name=>'EOH_EMP_ID'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Eoh Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6041299136700901143)
,p_db_column_name=>'EOH_MAIL_SEND_OPT'
,p_display_order=>37
,p_column_identifier=>'AB'
,p_column_label=>'Eoh Mail Send Opt'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320978072528051829)
,p_db_column_name=>'EOH_MAIL_TYPE'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Eoh Mail Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320973699431051823)
,p_db_column_name=>'EOH_SEQ_NO'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Eoh Seq No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320969307044051812)
,p_db_column_name=>'EOH_SNDR_EMAIL'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Eoh Sndr Email'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320972489131051817)
,p_db_column_name=>'EOH_STATUS'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Eoh Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320969629724051812)
,p_db_column_name=>'EOH_SUBJ'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Eoh Subj'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320972872518051817)
,p_db_column_name=>'EOH_UNIT'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Eoh Unit'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320975707590051826)
,p_db_column_name=>'EOH_UPD_BY'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Eoh Upd By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320976926776051828)
,p_db_column_name=>'EOH_UPD_DATE'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Eoh Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320977657563051828)
,p_db_column_name=>'EOH_UPD_EMP_ID'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Eoh Upd Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320976044161051826)
,p_db_column_name=>'EOH_UPD_IP_ADDR'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Eoh Upd Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320976491219051826)
,p_db_column_name=>'EOH_UPD_OS_USER'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Eoh Upd Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320970526153051814)
,p_db_column_name=>'EOH_USER_ID'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Eoh User Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320972046944051817)
,p_db_column_name=>'EOH_VOU_NO'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Eoh Vou No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320971666027051815)
,p_db_column_name=>'EOH_VOU_PFX'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Eoh Vou Pfx'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320971324120051815)
,p_db_column_name=>'EOH_VOU_TYPE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Eoh Vou Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320973261973051817)
,p_db_column_name=>'EOH_WF_TYPE'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Eoh Wf Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6320967646913051809)
,p_db_column_name=>'ROWID'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'ROWID'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6320980630626057537)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1771387'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ROWID:EOH_BU:EOH_DOC_NO:EOH_DOC_DATE:EOH_SNDR_EMAIL:EOH_SUBJ:EOH_BODY:EOH_USER_ID:EOH_EMP_ID:EOH_VOU_TYPE:EOH_VOU_PFX:EOH_VOU_NO:EOH_STATUS:EOH_UNIT:EOH_WF_TYPE:EOH_SEQ_NO:EOH_CRE_BY:EOH_CRE_IP_ADDR:EOH_CRE_OS_USER:EOH_CRE_DATE:EOH_UPD_BY:EOH_UPD_IP_'
||'ADDR:EOH_UPD_OS_USER:EOH_UPD_DATE:EOH_CRE_EMP_ID:EOH_UPD_EMP_ID:EOH_MAIL_TYPE:EOH_MAIL_SEND_OPT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6320978614222051829)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6320967219263051806)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:29'
);
wwv_flow_imp.component_end;
end;
/
