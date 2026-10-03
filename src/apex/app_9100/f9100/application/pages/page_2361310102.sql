prompt --application/pages/page_2361310102
begin
--   Manifest
--     PAGE: 2361310102
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
 p_id=>2361310102
,p_name=>'Work Flow'
,p_alias=>'WORK-FLOW'
,p_step_title=>'Work Flow'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Cards--basic .t-Card-wrap ',
'{',
'    display: flex;',
'    flex-direction: column;',
'    overflow: hidden;',
'    border-radius: 10px;',
'}',
'/*',
'.t-Cards--basic .t-Card-titleWrap ',
'{',
'    display: flex;',
'    flex-direction: column;',
'    justify-content: center;',
'    padding: 12px 64px 12px 16px;',
'    min-height: 64px;',
'    box-shadow: 0 -1px 0 rgba(0,0,0,.05) inset;',
'    background : #EAF2F8;/*   #ecf0f1;*/',
'}*/',
'',
'#P335_WF_SRCH',
'	{',
'	  width:40px;',
'	  transition: 0.5s;',
'	  border-radius:50px;',
'	  text-indent: 2rem;',
'	  font-size: 1.1rem;',
'	  font-family: Arial;',
'	}',
'	',
'	#P335_WF_SRCH:focus',
'	{',
'	  width:450px;',
'	  transition: 0.5s;',
'}',
'',
'',
'.t-Cards--basic .t-Card-titleWrap {',
'    display: flex;',
'    flex-direction: column;',
'    justify-content: center;',
'    padding: 12px 64px 12px 16px;',
'    min-height: 22px;',
'    box-shadow: 0 -1px 0 rgba(0,0,0,.05) inset;',
'    background-image: linear-gradient(to top, #4b6696 0%, #56a6ea 100%);',
'}',
'.t-Cards--basic .t-Card-title {',
'    font-size: 1.6rem;',
'    line-height: 0.8rem;',
'    margin: 0;',
'    font-weight: 500;',
'    overflow: hidden;',
'    text-overflow: ellipsis;',
'}',
'.t-Form--xlarge .apex-item-file, .t-Form--xlarge .apex-item-text, .t-Form-fieldContainer--xlarge .apex-item-file, .t-Form-fieldContainer--xlarge .apex-item-text {',
'    height: 3.1rem;',
'}',
'',
'.t-Cards--basic .t-Card-icon {',
'    position: absolute;',
'    right: 16px;',
'    top: 0px;',
'    width: 32px;',
'    height: 32px;',
'    line-height: 32px;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650482615684505314)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10819691417164868977)
,p_plug_name=>'Approval'
,p_static_id=>'approval'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
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
 p_id=>wwv_flow_imp.id(10824193448695132408)
,p_plug_name=>'Approval'
,p_static_id=>'approval-2'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ROWID,',
'       wfdc_bu,',
'       wfdc_type,',
'       wfdc_doc_pfx,',
'       wfdc_doc_no,',
'       wfdc_status,',
'       wfdc_ctrl_person,',
'       wfdc_spplr_id,',
'       wfdc_cust_id,',
'       wfdc_lvl1,',
'       wfdc_lvl2,',
'       wfdc_lvl3,',
'       wfdc_lvl4,',
'       wfdc_accts,',
'       wfdc_prj_id,',
'       wfdc_rnd_prj_id,',
'       wfdc_value,',
'       wfdc_jrnl_type,',
'       wfdc_frwd_rtn,',
'       wfdc_po_mode,',
'       wfdc_message,',
'       wfdc_seq_no,',
'       wfdc_action_date,',
'       wfdc_qc_rev,',
'       wfdc_qc_ins_mode,',
'       wfdc_prod_id,',
'       wfdc_prod_rev,',
'       wfdc_priority,',
'       wfdc_wf_no,',
'       wfdc_doc_sfx,',
'       wfdc_wrk_cntr,',
'       wfdc_plnt,',
'       wfdc_select_flag,',
'       wfdc_mail_flag,',
'       wfdc_int_msg_flag,',
'       wfdc_sms_flag,',
'       wfdc_fwd_person,',
'       wfdc_doc_brief,',
'       wfdc_fwd_to,',
'       wfdc_nxt_status,',
'       wfdc_act,',
'       wfdc_nxt_fwd_person,',
'       wfdc_nxt_message,',
'       wfdc_fwd_on,',
'       wfdc_src_bu,',
'       wfdc_src_plnt,',
'       wfdc_nxt_fwd_entity,',
'       wfdc_src_user,',
'       wfdc_nxt_fwd_plnt,',
'       wfdc_mail_send_flag,',
'       wfdc_doc_date,',
'       wfdc_lvl_prj,',
'       wfdc_auth_type,',
'       wfdc_disc_pct,',
'       wfdc_benf_type,',
'       wfdc_benf_id,',
'       wfdc_bill_date,',
'       wfdc_bill_no,',
'       wfdc_gross_amt,',
'       wfdc_tax_amt,',
'       wfdc_bill_amt,',
'       wfdc_inv_pfx,',
'       wfdc_inv_no,',
'       wfdc_emp_id,',
'       wfdc_cre_by,',
'       wfdc_cre_ip_addr,',
'       wfdc_cre_os_user,',
'       wfdc_cre_date,',
'       wfdc_upd_by,',
'       wfdc_upd_ip_addr,',
'       wfdc_upd_os_user,',
'       wfdc_upd_date,',
'       wfdc_coll_centr_id,',
'       wfdc_cre_emp_id,',
'       wfdc_upd_emp_id,',
'       wfdc_inst_id,',
'       wfdc_inst_ser_no',
'  FROM work_flow_doc_control',
' WHERE wfdc_bu = :GLOBAL_BU'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'NEVER'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Approval'
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
 p_id=>wwv_flow_imp.id(10824193864158132408)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>4680351834751611147
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317070127359561801)
,p_db_column_name=>'ROWID'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'ROWID'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317075317431561817)
,p_db_column_name=>'WFDC_ACCTS'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Wfdc Accts'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317086670716561832)
,p_db_column_name=>'WFDC_ACT'
,p_display_order=>41
,p_column_identifier=>'AO'
,p_column_label=>'Wfdc Act'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317079157455561823)
,p_db_column_name=>'WFDC_ACTION_DATE'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Wfdc Action Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317091480541561843)
,p_db_column_name=>'WFDC_AUTH_TYPE'
,p_display_order=>53
,p_column_identifier=>'BA'
,p_column_label=>'Wfdc Auth Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317092679126561845)
,p_db_column_name=>'WFDC_BENF_ID'
,p_display_order=>56
,p_column_identifier=>'BD'
,p_column_label=>'Wfdc Benf Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317092248137561843)
,p_db_column_name=>'WFDC_BENF_TYPE'
,p_display_order=>55
,p_column_identifier=>'BC'
,p_column_label=>'Wfdc Benf Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317094717756561846)
,p_db_column_name=>'WFDC_BILL_AMT'
,p_display_order=>61
,p_column_identifier=>'BI'
,p_column_label=>'Wfdc Bill Amt'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317093069981561845)
,p_db_column_name=>'WFDC_BILL_DATE'
,p_display_order=>57
,p_column_identifier=>'BE'
,p_column_label=>'Wfdc Bill Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317093515523561845)
,p_db_column_name=>'WFDC_BILL_NO'
,p_display_order=>58
,p_column_identifier=>'BF'
,p_column_label=>'Wfdc Bill No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317070436895561807)
,p_db_column_name=>'WFDC_BU'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Wfdc Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317099452122561859)
,p_db_column_name=>'WFDC_COLL_CENTR_ID'
,p_display_order=>73
,p_column_identifier=>'BU'
,p_column_label=>'Wfdc Coll Centr Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317096316843561850)
,p_db_column_name=>'WFDC_CRE_BY'
,p_display_order=>65
,p_column_identifier=>'BM'
,p_column_label=>'Wfdc Cre By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317097446841561857)
,p_db_column_name=>'WFDC_CRE_DATE'
,p_display_order=>68
,p_column_identifier=>'BP'
,p_column_label=>'Wfdc Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317099840154561861)
,p_db_column_name=>'WFDC_CRE_EMP_ID'
,p_display_order=>74
,p_column_identifier=>'BV'
,p_column_label=>'Wfdc Cre Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317096652468561850)
,p_db_column_name=>'WFDC_CRE_IP_ADDR'
,p_display_order=>66
,p_column_identifier=>'BN'
,p_column_label=>'Wfdc Cre Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317097078204561851)
,p_db_column_name=>'WFDC_CRE_OS_USER'
,p_display_order=>67
,p_column_identifier=>'BO'
,p_column_label=>'Wfdc Cre Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317072450398561814)
,p_db_column_name=>'WFDC_CTRL_PERSON'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Wfdc Ctrl Person'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317073325854561814)
,p_db_column_name=>'WFDC_CUST_ID'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Wfdc Cust Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317091879377561843)
,p_db_column_name=>'WFDC_DISC_PCT'
,p_display_order=>54
,p_column_identifier=>'BB'
,p_column_label=>'Wfdc Disc Pct'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317085524038561831)
,p_db_column_name=>'WFDC_DOC_BRIEF'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Wfdc Doc Brief'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317090658391561842)
,p_db_column_name=>'WFDC_DOC_DATE'
,p_display_order=>51
,p_column_identifier=>'AY'
,p_column_label=>'Wfdc Doc Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317071688470561812)
,p_db_column_name=>'WFDC_DOC_NO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Wfdc Doc No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317071259352561812)
,p_db_column_name=>'WFDC_DOC_PFX'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Wfdc Doc Pfx'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317082326177561826)
,p_db_column_name=>'WFDC_DOC_SFX'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Wfdc Doc Sfx'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317095910675561850)
,p_db_column_name=>'WFDC_EMP_ID'
,p_display_order=>64
,p_column_identifier=>'BL'
,p_column_label=>'Wfdc Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317077552686561820)
,p_db_column_name=>'WFDC_FRWD_RTN'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Wfdc Frwd Rtn'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317087831417561834)
,p_db_column_name=>'WFDC_FWD_ON'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'Wfdc Fwd On'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317085123445561831)
,p_db_column_name=>'WFDC_FWD_PERSON'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Wfdc Fwd Person'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317085840120561832)
,p_db_column_name=>'WFDC_FWD_TO'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Wfdc Fwd To'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317093892040561846)
,p_db_column_name=>'WFDC_GROSS_AMT'
,p_display_order=>59
,p_column_identifier=>'BG'
,p_column_label=>'Wfdc Gross Amt'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317100638920561862)
,p_db_column_name=>'WFDC_INST_ID'
,p_display_order=>76
,p_column_identifier=>'BX'
,p_column_label=>'Wfdc Inst Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317101088172561864)
,p_db_column_name=>'WFDC_INST_SER_NO'
,p_display_order=>77
,p_column_identifier=>'BY'
,p_column_label=>'Wfdc Inst Ser No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317084304070561829)
,p_db_column_name=>'WFDC_INT_MSG_FLAG'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Wfdc Int Msg Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317095482549561848)
,p_db_column_name=>'WFDC_INV_NO'
,p_display_order=>63
,p_column_identifier=>'BK'
,p_column_label=>'Wfdc Inv No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317095078617561846)
,p_db_column_name=>'WFDC_INV_PFX'
,p_display_order=>62
,p_column_identifier=>'BJ'
,p_column_label=>'Wfdc Inv Pfx'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317077221696561820)
,p_db_column_name=>'WFDC_JRNL_TYPE'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Wfdc Jrnl Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317073703569561815)
,p_db_column_name=>'WFDC_LVL1'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Wfdc Lvl1'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317074061122561815)
,p_db_column_name=>'WFDC_LVL2'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Wfdc Lvl2'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317074524556561817)
,p_db_column_name=>'WFDC_LVL3'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Wfdc Lvl3'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317074868263561817)
,p_db_column_name=>'WFDC_LVL4'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Wfdc Lvl4'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317091055737561842)
,p_db_column_name=>'WFDC_LVL_PRJ'
,p_display_order=>52
,p_column_identifier=>'AZ'
,p_column_label=>'Wfdc Lvl Prj'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317083879136561829)
,p_db_column_name=>'WFDC_MAIL_FLAG'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Wfdc Mail Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317090282519561840)
,p_db_column_name=>'WFDC_MAIL_SEND_FLAG'
,p_display_order=>50
,p_column_identifier=>'AX'
,p_column_label=>'Wfdc Mail Send Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317078352992561821)
,p_db_column_name=>'WFDC_MESSAGE'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Wfdc Message'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317089029774561836)
,p_db_column_name=>'WFDC_NXT_FWD_ENTITY'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'Wfdc Nxt Fwd Entity'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317087066281561834)
,p_db_column_name=>'WFDC_NXT_FWD_PERSON'
,p_display_order=>42
,p_column_identifier=>'AP'
,p_column_label=>'Wfdc Nxt Fwd Person'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317089891364561840)
,p_db_column_name=>'WFDC_NXT_FWD_PLNT'
,p_display_order=>49
,p_column_identifier=>'AW'
,p_column_label=>'Wfdc Nxt Fwd Plnt'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317087521947561834)
,p_db_column_name=>'WFDC_NXT_MESSAGE'
,p_display_order=>43
,p_column_identifier=>'AQ'
,p_column_label=>'Wfdc Nxt Message'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317086277930561832)
,p_db_column_name=>'WFDC_NXT_STATUS'
,p_display_order=>40
,p_column_identifier=>'AN'
,p_column_label=>'Wfdc Nxt Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317083105893561828)
,p_db_column_name=>'WFDC_PLNT'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Wfdc Plnt'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317078014404561821)
,p_db_column_name=>'WFDC_PO_MODE'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Wfdc Po Mode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317081475983561826)
,p_db_column_name=>'WFDC_PRIORITY'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Wfdc Priority'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317075644376561818)
,p_db_column_name=>'WFDC_PRJ_ID'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Wfdc Prj Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317080369808561825)
,p_db_column_name=>'WFDC_PROD_ID'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Wfdc Prod Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317080828759561825)
,p_db_column_name=>'WFDC_PROD_REV'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Wfdc Prod Rev'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317079952902561823)
,p_db_column_name=>'WFDC_QC_INS_MODE'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Wfdc Qc Ins Mode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317079606286561823)
,p_db_column_name=>'WFDC_QC_REV'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Wfdc Qc Rev'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317076046931561818)
,p_db_column_name=>'WFDC_RND_PRJ_ID'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Wfdc Rnd Prj Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317083499581561828)
,p_db_column_name=>'WFDC_SELECT_FLAG'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Wfdc Select Flag'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317078745687561821)
,p_db_column_name=>'WFDC_SEQ_NO'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Wfdc Seq No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317084665910561829)
,p_db_column_name=>'WFDC_SMS_FLAG'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Wfdc Sms Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317072883951561814)
,p_db_column_name=>'WFDC_SPPLR_ID'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Wfdc Spplr Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317088246218561834)
,p_db_column_name=>'WFDC_SRC_BU'
,p_display_order=>45
,p_column_identifier=>'AS'
,p_column_label=>'Wfdc Src Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317088644164561836)
,p_db_column_name=>'WFDC_SRC_PLNT'
,p_display_order=>46
,p_column_identifier=>'AT'
,p_column_label=>'Wfdc Src Plnt'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317089460211561839)
,p_db_column_name=>'WFDC_SRC_USER'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'Wfdc Src User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317072060299561812)
,p_db_column_name=>'WFDC_STATUS'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Wfdc Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317094306707561846)
,p_db_column_name=>'WFDC_TAX_AMT'
,p_display_order=>60
,p_column_identifier=>'BH'
,p_column_label=>'Wfdc Tax Amt'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317070870024561809)
,p_db_column_name=>'WFDC_TYPE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Wfdc Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317097841397561857)
,p_db_column_name=>'WFDC_UPD_BY'
,p_display_order=>69
,p_column_identifier=>'BQ'
,p_column_label=>'Wfdc Upd By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317099097281561859)
,p_db_column_name=>'WFDC_UPD_DATE'
,p_display_order=>72
,p_column_identifier=>'BT'
,p_column_label=>'Wfdc Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317100302430561862)
,p_db_column_name=>'WFDC_UPD_EMP_ID'
,p_display_order=>75
,p_column_identifier=>'BW'
,p_column_label=>'Wfdc Upd Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317098279164561857)
,p_db_column_name=>'WFDC_UPD_IP_ADDR'
,p_display_order=>70
,p_column_identifier=>'BR'
,p_column_label=>'Wfdc Upd Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317098676589561859)
,p_db_column_name=>'WFDC_UPD_OS_USER'
,p_display_order=>71
,p_column_identifier=>'BS'
,p_column_label=>'Wfdc Upd Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317076468048561820)
,p_db_column_name=>'WFDC_VALUE'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Wfdc Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317081881839561826)
,p_db_column_name=>'WFDC_WF_NO'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Wfdc Wf No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317082677816561828)
,p_db_column_name=>'WFDC_WRK_CNTR'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Wfdc Wrk Cntr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(10824231268023133516)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'41609182'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ROWID:WFDC_BU:WFDC_TYPE:WFDC_DOC_PFX:WFDC_DOC_NO:WFDC_STATUS:WFDC_CTRL_PERSON:WFDC_SPPLR_ID:WFDC_CUST_ID:WFDC_LVL1:WFDC_LVL2:WFDC_LVL3:WFDC_LVL4:WFDC_ACCTS:WFDC_PRJ_ID:WFDC_RND_PRJ_ID:WFDC_VALUE:WFDC_JRNL_TYPE:WFDC_FRWD_RTN:WFDC_PO_MODE:WFDC_MESSAGE:'
||'WFDC_SEQ_NO:WFDC_ACTION_DATE:WFDC_QC_REV:WFDC_QC_INS_MODE:WFDC_PROD_ID:WFDC_PROD_REV:WFDC_PRIORITY:WFDC_WF_NO:WFDC_DOC_SFX:WFDC_WRK_CNTR:WFDC_PLNT:WFDC_SELECT_FLAG:WFDC_MAIL_FLAG:WFDC_INT_MSG_FLAG:WFDC_SMS_FLAG:WFDC_FWD_PERSON:WFDC_DOC_BRIEF:WFDC_FWD'
||'_TO:WFDC_NXT_STATUS:WFDC_ACT:WFDC_NXT_FWD_PERSON:WFDC_NXT_MESSAGE:WFDC_FWD_ON:WFDC_SRC_BU:WFDC_SRC_PLNT:WFDC_NXT_FWD_ENTITY:WFDC_SRC_USER:WFDC_NXT_FWD_PLNT:WFDC_MAIL_SEND_FLAG:WFDC_DOC_DATE:WFDC_LVL_PRJ:WFDC_AUTH_TYPE:WFDC_DISC_PCT:WFDC_BENF_TYPE:WFD'
||'C_BENF_ID:WFDC_BILL_DATE:WFDC_BILL_NO:WFDC_GROSS_AMT:WFDC_TAX_AMT:WFDC_BILL_AMT:WFDC_INV_PFX:WFDC_INV_NO:WFDC_EMP_ID:WFDC_CRE_BY:WFDC_CRE_IP_ADDR:WFDC_CRE_OS_USER:WFDC_CRE_DATE:WFDC_UPD_BY:WFDC_UPD_IP_ADDR:WFDC_UPD_OS_USER:WFDC_UPD_DATE:WFDC_COLL_CEN'
||'TR_ID:WFDC_CRE_EMP_ID:WFDC_UPD_EMP_ID:WFDC_INST_ID:WFDC_INST_SER_NO'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6318004620952816662)
,p_name=>'Cards'
,p_static_id=>'cards'
,p_parent_plug_id=>wwv_flow_imp.id(10819691417164868977)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:margin-top-none'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--5cols:t-Cards--animRaiseCard'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT *',
'  FROM (',
'SELECT ROWID,',
'       ''<B><SPAN STYLE="font-size:10px; font-family:verdana; color: #ffffff">''||func_find_apex_wf_desc(wfdc_bu, wfdc_plnt, NVL(wfdc_src_bu, wfdc_bu), wfdc_type, wfdc_doc_no)||''</SPAN></B>'' "CARD_TITLE",',
'       ''<B><SPAN STYLE="font-size:10px; font-family:verdana; color: #ef9a9a">''||(SELECT INITCAP(TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1))',
'                                                                                   FROM employees,',
'                                                                                        appl_users',
'                                                                                  WHERE emp_bu      = appluser_bu',
'                                                                                    AND emp_emp_id  = appluser_emp_id ',
'                                                                                    AND appluser_bu = wfdc_bu',
'                                                                                    AND appluser_id = wfdc_fwd_person)||''</SPAN></B>'' "CARD_SUBTITLE",',
'',
'       ''<table style="width:100%" border="0">''||',
'         CASE WHEN wfdc_message IS NOT NULL THEN      ',
'         ''<tr>',
'            <td style="width:10%" align="center"><span aria-hidden="true" class="fa fa-commenting" style="color:#1F618D"></span></td>',
'            <td style="width:90%; vertical-align:top"><span style="color: #5d6d7e; font-size:11px; font-family: Calibri">''||NVL(INITCAP(wfdc_message), ''--No Message--'')||''</span></td> ',
'         </tr>''',
'         END||''',
'         <tr>',
'            <td style="width:10%" align="center"><span aria-hidden="true" class="fa fa-building" style="color:#1F618D"></span></td>',
'            <td style="width:90%; vertical-align:top"><span style="color: #5d6d7e; font-size:11px; font-family: Calibri">''||wfdc_src_bu||''</span></td> ',
'         </tr>',
'         <tr>',
'            <td style="width:10%" align="center"><span aria-hidden="true" class="fa fa-sitemap-vertical" style="color:#1F618D"></span></td>',
'            <td style="width:90%"><span style="color: #5d6d7e; font-size:11px; font-family: Calibri">''||(SELECT bup_name1',
'                                                                                                           FROM bus_unit_plants',
'                                                                                                          WHERE bup_bu = NVL(wfdc_src_bu, wfdc_bu) ',
'                                                                                                            AND bup_plant_id = wfdc_src_plnt)||''</span></td> ',
'         </tr>',
'         <tr>''||CASE WHEN wfdc_doc_no IS NOT NULL THEN ',
'            ''<td style="width:10%" align="center"><span aria-hidden="true" class="fa fa-book" style="color:#1F618D"></span></td>',
'            <td style="width:90%"><span style="color: #5d6d7e; font-size:11px; font-family: Calibri">''||DECODE(wfdc_doc_pfx, NULL, NULL, wfdc_doc_pfx||''/'')||wfdc_doc_no||''</span></td> ',
'         </tr>'' END||',
'         CASE WHEN wfdc_value IS NOT NULL THEN',
'         ''<tr>',
'            <td style="width:10%" align="center"><span aria-hidden="true" class="fa fa-money" style="color:#1F618D"></span></td>',
'            <td style="width:90%"><span style="color: #5d6d7e; font-size:11px; font-family: Calibri">''||TO_CHAR(wfdc_value, func_get_cost_format_mask(wfdc_bu))||''</span></td> ',
'         </tr>''    ',
'         END||',
'         CASE WHEN wfdc_benf_id IS NOT NULL THEN',
'         ''<tr>',
'            <td style="width:10%" align="center">''||',
'            CASE WHEN wfdc_benf_type = ''S'' THEN',
'               ''<span aria-hidden="true" class="fa fa-truck" style="color:#1F618D"></span>''',
'            WHEN wfdc_benf_type = ''C'' THEN',
'               ''<span aria-hidden="true" class="fa fa-users" style="color:#1F618D"></span>''',
'            WHEN wfdc_benf_type = ''P'' THEN',
'               ''<span aria-hidden="true" class="fa fa-binoculars" style="color:#1F618D"></span>''',
'            WHEN wfdc_benf_type = ''N'' THEN',
'               ''<span aria-hidden="true" class="fa fa-user-secret" style="color:#1F618D"></span>''',
'            END||''',
'            </td>',
'            <td style="width:90%"><span style="color: #5d6d7e; font-size:11px; font-family: Calibri">''||CASE WHEN wfdc_benf_id IS NOT NULL THEN',
'                                                                                                             CASE WHEN wfdc_benf_type = ''S'' THEN',
'                                                                                                                       INITCAP(func_find_suplr_name(NVL(wfdc_src_bu, wfdc_bu), wfdc_benf_id, 1))',
'                                                                                                                  WHEN wfdc_benf_type = ''C'' THEN',
'                                                                                                                       INITCAP(func_find_cust_name(NVL(wfdc_src_bu, wfdc_bu), wfdc_benf_id, 1))',
'                                                                                                                  WHEN wfdc_benf_type = ''P'' THEN',
'                                                                                                                       INITCAP(func_find_prospect_desc(NVL(wfdc_src_bu, wfdc_bu), wfdc_benf_id, 1))',
'                                                                                                                  WHEN wfdc_benf_type = ''N'' THEN',
'                                                                                                                       INITCAP(func_find_sale_pers_desc(NVL(wfdc_src_bu, wfdc_bu), wfdc_benf_id, 1))',
'                                                                                                                  END',
'                                                                                                            END||''</span></td> ',
'         </tr>''    ',
'         END||',
'         CASE WHEN wfdc_doc_brief IS NOT NULL THEN',
'         ''<tr>',
'            <td style="width:10%" align="center"><span aria-hidden="true" class="fa fa-file-text-o" style="color:#1F618D"></span></td>',
'            <td style="width:90%"><span style="color: #5d6d7e; font-size:11px; font-family: Calibri">''||wfdc_doc_brief||''</span></td> ',
'         </tr>''',
'         END||''',
'        </table>'' "CARD_TEXT",',
'        CASE ',
'        WHEN wfdc_priority = ''1'' THEN ',
'             ''H''',
'        WHEN wfdc_priority = ''2'' THEN       ',
'             ''M''',
'        WHEN wfdc_priority = ''3'' THEN       ',
'             ''L''',
'        END "CARD_INITIALS",',
'       ''<BR><span class="fa fa-dynamic-content" aria-hidden="true" style="color:#28a745" title="View Log"></span>'' "ATTRIBUTE_1",',
'            ''<span class="fa fa-tiles-2x2" aria-hidden="true" style="color:#ABB2B9" title="View Details"></span>'' "ATTRIBUTE_2",',
'           --''<span aria-hidden="true" class="fa fa-reply" style="color:#2980B9" title="Return"></span>'' "ATTRIBUTE_3",',
'           --''<span class="fa fa-times-circle" aria-hidden="true" style="color:#E74C3C" title="Cancel"></span>'' "ATTRIBUTE_4",           ',
'           --''<span aria-hidden="true" class="fa fa-share" style="color:#E67E22" title="Forward"></span>'' "ATTRIBUTE_5",',
'           NULL "ATTRIBUTE_3",',
'           NULL "ATTRIBUTE_4",',
'           NULL "ATTRIBUTE_5",           ',
'           ''<span style="color:  #707b7c; font-family:Arial; font-size:9px">''||CASE WHEN MOD(TRUNC((SYSDATE - NVL(wfdc_fwd_on, wfdc_cre_date)) * 24), 24) = 0 THEN',
'                                                                                        MOD(TRUNC((SYSDATE - NVL(wfdc_fwd_on, wfdc_cre_date)) * 1440), 60)||'' min ago''',
'                                                                                     ELSE',
'                                                                                        TRUNC(SYSDATE - NVL(wfdc_fwd_on, wfdc_cre_date))||'' Days ''||MOD(TRUNC((SYSDATE - NVL(wfdc_fwd_on, wfdc_cre_date)) * 24), 24)||'' hour ''||MOD(TRUNC((SYSDATE - NVL(w'
||'fdc_fwd_on, wfdc_cre_date)) * 1440), 60)||'' min ago''',
'                                                                                     END||''</SPAN>'' "CARD_DATE",',
'       ',
'       CASE WHEN wfdc_mail_flag = ''N'' THEN ',
'                 ''<span class="fa fa-square-o" aria-hidden="true"></span><span style="color: #5d6d7e; font-size:11px; font-family: Calibri">  Mail</span>''',
'            ELSE',
'                 ''<span class="fa fa-square-selected-o" aria-hidden="true"></span><span style="color: #5d6d7e; font-size:11px; font-family: Calibri"> Mail</span>''',
'            END "CARD_SUBTEXT",    ',
'       CASE WHEN wfdc_sms_flag = ''N'' THEN ',
'                 ''<span class="fa fa-square-o" aria-hidden="true"></span><span style="color: #5d6d7e; font-size:11px; font-family: Calibri">  SMS</span>''',
'            ELSE',
'                 ''<span class="fa fa-square-selected-o" aria-hidden="true"></span><span style="color: #5d6d7e; font-size:11px; font-family: Calibri">  SMS</span>''',
'            END "ATTRIBUTE_6",      ',
'      CASE WHEN wfdc_int_msg_flag = ''N'' THEN ',
'                 ''<span class="fa fa-square-o" aria-hidden="true"></span><span style="color: #5d6d7e; font-size:11px; font-family: Calibri">  Internal Msg.</span>''',
'            ELSE',
'                 ''<span class="fa fa-square-selected-o" aria-hidden="true"></span><span style="color: #5d6d7e; font-size:11px; font-family: Calibri">  Internal Msg.</span>''',
'            END "ATTRIBUTE_7",',
'       CASE WHEN wfdc_type = ''WF_PRJ_EMPTC'' THEN 511 ELSE 335 END wfdc_call_page_no,',
'       wfdc_bu,',
'       wfdc_type,',
'       wfdc_doc_pfx,',
'       wfdc_doc_no,',
'       wfdc_status,',
'       wfdc_ctrl_person,',
'       wfdc_spplr_id,',
'       wfdc_cust_id,',
'       wfdc_lvl1,',
'       wfdc_lvl2,',
'       wfdc_lvl3,',
'       wfdc_lvl4,',
'       wfdc_accts,',
'       wfdc_prj_id,',
'       wfdc_rnd_prj_id,',
'       wfdc_value,',
'       wfdc_jrnl_type,',
'       wfdc_frwd_rtn,',
'       wfdc_po_mode,',
'       wfdc_message,',
'       wfdc_seq_no,',
'       wfdc_action_date,',
'       wfdc_qc_rev,',
'       wfdc_qc_ins_mode,',
'       wfdc_prod_id,',
'       wfdc_prod_rev,',
'       wfdc_priority,',
'       wfdc_wf_no,',
'       wfdc_doc_sfx,',
'       wfdc_wrk_cntr,',
'       wfdc_plnt,',
'       wfdc_select_flag,',
'       wfdc_mail_flag,',
'       wfdc_int_msg_flag,',
'       wfdc_sms_flag,',
'       wfdc_fwd_person,',
'       wfdc_doc_brief,',
'       wfdc_fwd_to,',
'       wfdc_nxt_status,',
'       wfdc_act,',
'       wfdc_nxt_fwd_person,',
'       wfdc_nxt_message,',
'       wfdc_fwd_on,',
'       wfdc_src_bu,',
'       wfdc_src_plnt,',
'       wfdc_nxt_fwd_entity,',
'       wfdc_src_user,',
'       wfdc_nxt_fwd_plnt,',
'       wfdc_mail_send_flag,',
'       wfdc_doc_date,',
'       wfdc_lvl_prj,',
'       wfdc_auth_type,',
'       wfdc_disc_pct,',
'       wfdc_benf_type,',
'       wfdc_benf_id,',
'       wfdc_bill_date,',
'       wfdc_bill_no,',
'       wfdc_gross_amt,',
'       wfdc_tax_amt,',
'       wfdc_bill_amt,',
'       wfdc_inv_pfx,',
'       wfdc_inv_no,',
'       wfdc_emp_id,',
'       wfdc_cre_by,',
'       wfdc_cre_ip_addr,',
'       wfdc_cre_os_user,',
'       wfdc_cre_date,',
'       wfdc_upd_by,',
'       wfdc_upd_ip_addr,',
'       wfdc_upd_os_user,',
'       wfdc_upd_date,',
'       wfdc_coll_centr_id,',
'       wfdc_cre_emp_id,',
'       wfdc_upd_emp_id,',
'       func_find_apex_wf_desc(wfdc_bu, wfdc_plnt, NVL(wfdc_src_bu, wfdc_bu), wfdc_type, wfdc_doc_no) wfdc_type_desc,',
'       (SELECT INITCAP(TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1))',
'          FROM employees,',
'               appl_users',
'         WHERE emp_bu      = appluser_bu',
'           AND emp_emp_id  = appluser_emp_id ',
'           AND appluser_bu = wfdc_bu',
'           AND appluser_id = wfdc_fwd_person) wfdc_fwd_per_name,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = NVL(wfdc_src_bu, wfdc_bu) ',
'           AND bup_plant_id = wfdc_src_plnt) wfdc_src_plnt_desc,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = wfdc_bu ',
'           AND bup_plant_id = wfdc_plnt) wfdc_plnt_desc,',
'       NVL((SELECT INITCAP(wfaa_desc)',
'            FROM work_flow_appr_actvt',
'           WHERE wfaa_bu     = NVL(wfdc_src_bu, wfdc_bu)',
'             AND wfaa_wf_id  = wfdc_type',
'             AND wfaa_seq_no = wfdc_seq_no + 1), ''Message Not Specified.'') wfdc_nxt_process',
'  FROM work_flow_doc_control  ',
' WHERE wfdc_bu = :GLOBAL_BU',
'   AND (wfdc_auth_type = ''P'' AND wfdc_ctrl_person = func_find_position_id(:GLOBAL_BU, :GLOBAL_USER) ',
'    OR  wfdc_auth_type = ''E'' AND wfdc_ctrl_person = func_find_emp_id(:GLOBAL_BU, :GLOBAL_USER))',
'   AND (wfdc_type, wfdc_status) NOT IN (SELECT wfaa_wf_id, wfaa_status',
'                                          FROM work_flow_appr_actvt',
'                                         WHERE wfaa_bu = :GLOBAL_BU ',
'                                           AND (wfaa_wf_id, wfaa_seq_no) IN (SELECT wfaa_wf_id, MAX(wfaa_seq_no) wfaa_seq_no',
'                                                                               FROM work_flow_appr_actvt',
'                                                                              WHERE wfaa_bu = :GLOBAL_BU ',
'                                                                              GROUP BY wfaa_wf_id))',
'  AND wfdc_status NOT IN (''C'',''R'',''S''))',
'WHERE (INSTR(UPPER(wfdc_type_desc), UPPER(NVL(:P2361310102_WF_SRCH, wfdc_type_desc))) > 0 OR',
'       INSTR(UPPER(wfdc_fwd_per_name), UPPER(NVL(:P2361310102_WF_SRCH, wfdc_fwd_per_name))) > 0 OR',
'       INSTR(UPPER(wfdc_src_plnt_desc), UPPER(NVL(:P2361310102_WF_SRCH, wfdc_src_plnt_desc))) > 0 OR       ',
'       INSTR(UPPER(wfdc_doc_pfx), UPPER(NVL(:P2361310102_WF_SRCH, wfdc_doc_pfx))) > 0 OR',
'       INSTR(UPPER(wfdc_doc_no), UPPER(NVL(:P2361310102_WF_SRCH, wfdc_doc_no))) > 0 OR       ',
'       INSTR(UPPER(wfdc_src_bu), UPPER(NVL(:P2361310102_WF_SRCH, wfdc_src_bu))) > 0 OR',
'       INSTR(UPPER(wfdc_plnt_desc), UPPER(NVL(:P2361310102_WF_SRCH, wfdc_plnt_desc))) > 0)',
'ORDER BY wfdc_priority, NVL(wfdc_fwd_on, wfdc_cre_date) DESC'))
,p_display_condition_type=>'NEVER'
,p_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'.switch ',
'    {',
'      position: relative;',
'      display: inline-block;',
'      width: 30px;',
'      height: 17px;',
'    }',
'',
'.switch input ',
'    { ',
'      opacity: 0;',
'      width: 0;',
'      height: 0;',
'    }',
'',
'.slider ',
'    {',
'      position: absolute;',
'      cursor: pointer;',
'      top: 0;',
'      left: 0;',
'      right: 0;',
'      bottom: 0;',
'      background-color: #ccc;',
'      -webkit-transition: .4s;',
'      transition: .4s;',
'    }',
'',
'.slider:before {',
'  position: absolute;',
'  content: "";',
'  height: 13px;',
'  width: 13px;',
'  left: 2px;',
'  bottom: 2px;',
'  background-color: white;',
'  -webkit-transition: .4s;',
'  transition: .4s;',
'}',
'',
'input:checked + .slider {',
'  background-color: #148F77;',
'}',
'',
'input:focus + .slider {',
'  box-shadow: 0 0 1px #2196F3;',
'}',
'',
'input:checked + .slider:before {',
'  -webkit-transform: translateX(13px);',
'  -ms-transform: translateX(13px);',
'  transform: translateX(13px);',
'}',
'',
'/* Rounded sliders */',
'.slider.round {',
'  border-radius: 17px;',
'}',
'',
'.slider.round:before {',
'  border-radius: 40%;',
'}',
'',
'/* Tooltip */',
'    ',
'.tooltip {',
'  position: relative;',
'  display: inline-block;',
'  border-bottom: 1px dotted black;',
'}',
'',
'.tooltip .tooltiptext {',
'  visibility: hidden;',
'  width: 120px;',
'  background-color: black;',
'  color: #fff;',
'  text-align: center;',
'  border-radius: 6px;',
'  padding: 5px 0;',
'  position: absolute;',
'  z-index: 1;',
'  top: 150%;',
'  left: 50%;',
'  margin-left: -60px;',
'}',
'',
'.tooltip .tooltiptext::after {',
'  content: "";',
'  position: absolute;',
'  bottom: 100%;',
'  left: 50%;',
'  margin-left: -5px;',
'  border-width: 5px;',
'  border-style: solid;',
'  border-color: transparent transparent black transparent;',
'}',
'',
'.tooltip:hover .tooltiptext {',
'  visibility: visible;',
'}',
'</style>'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P2361310102_WF_SRCH'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6317347974241491467)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318013152438816798)
,p_query_column_id=>6
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>810
,p_column_heading=>'Attribute 1'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318013274097816799)
,p_query_column_id=>7
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>820
,p_column_heading=>'Attribute 2'
,p_column_link=>'f?p=&APP_ID.:#WFDC_CALL_PAGE_NO#:&SESSION.::&DEBUG.::P511_WF_BU,P511_WF_PLNT,P511_WF_DOC_NO,P511_WF_NO,P511_WF_TYPE,P511_WF_SOU_BU,P511_WF_CTRL_PRSN,P511_WF_SOU_PLNT,P511_WF_SEQ_NO:#WFDC_BU#,#WFDC_PLNT#,#WFDC_DOC_NO#,#WFDC_WF_NO#,#WFDC_TYPE#,#WFDC_SR'
||'C_BU#,#WFDC_CTRL_PERSON#,#WFDC_SRC_PLNT#,#WFDC_SEQ_NO#'
,p_column_linktext=>'#ATTRIBUTE_2#'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318013379446816800)
,p_query_column_id=>8
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>830
,p_column_heading=>'Attribute 3'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318013451368816801)
,p_query_column_id=>9
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>840
,p_column_heading=>'Attribute 4'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318013569413816802)
,p_query_column_id=>10
,p_column_alias=>'ATTRIBUTE_5'
,p_column_display_sequence=>850
,p_column_heading=>'Attribute 5'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318014177845816808)
,p_query_column_id=>13
,p_column_alias=>'ATTRIBUTE_6'
,p_column_display_sequence=>910
,p_column_heading=>'Mail'
,p_column_link=>'javascript:$s(''P335_WF_NO'', ''#WFDC_WF_NO#''); 	   $s(''P335_SMS_FLAG'', ''S'');'
,p_column_linktext=>'#ATTRIBUTE_6#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318014269431816809)
,p_query_column_id=>14
,p_column_alias=>'ATTRIBUTE_7'
,p_column_display_sequence=>920
,p_column_heading=>'Attribute 7'
,p_column_link=>'javascript:$s(''P335_WF_NO'', ''#WFDC_WF_NO#''); 	   $s(''P335_INT_MSG'', ''I'');'
,p_column_linktext=>'#ATTRIBUTE_7#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318014373012816810)
,p_query_column_id=>11
,p_column_alias=>'CARD_DATE'
,p_column_display_sequence=>930
,p_column_heading=>'Card Date'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318013116871816797)
,p_query_column_id=>5
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>800
,p_column_heading=>'Card Initials'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318012841166816795)
,p_query_column_id=>12
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>780
,p_column_heading=>'Card Subtext'
,p_column_link=>'javascript:$s(''P335_WF_NO'', ''#WFDC_WF_NO#''); 	   $s(''P335_MAIL_FLAG'', ''M'');'
,p_column_linktext=>'#CARD_SUBTEXT#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318012808553816794)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>770
,p_column_heading=>'Card Subtitle'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318012935433816796)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>790
,p_column_heading=>'Card Text'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318012660621816793)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>760
,p_column_heading=>'Card Title'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318005181987816668)
,p_query_column_id=>1
,p_column_alias=>'ROWID'
,p_column_display_sequence=>10
,p_column_heading=>'Rowid'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318006499754816681)
,p_query_column_id=>28
,p_column_alias=>'WFDC_ACCTS'
,p_column_display_sequence=>140
,p_column_heading=>'Wfdc Accts'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318009152580816708)
,p_query_column_id=>55
,p_column_alias=>'WFDC_ACT'
,p_column_display_sequence=>410
,p_column_heading=>'Wfdc Act'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318007385884816690)
,p_query_column_id=>37
,p_column_alias=>'WFDC_ACTION_DATE'
,p_column_display_sequence=>230
,p_column_heading=>'Wfdc Action Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318010350637816770)
,p_query_column_id=>67
,p_column_alias=>'WFDC_AUTH_TYPE'
,p_column_display_sequence=>530
,p_column_heading=>'Wfdc Auth Type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318010694209816773)
,p_query_column_id=>70
,p_column_alias=>'WFDC_BENF_ID'
,p_column_display_sequence=>560
,p_column_heading=>'Wfdc Benf Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318010615609816772)
,p_query_column_id=>69
,p_column_alias=>'WFDC_BENF_TYPE'
,p_column_display_sequence=>550
,p_column_heading=>'Wfdc Benf Type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318011182206816778)
,p_query_column_id=>75
,p_column_alias=>'WFDC_BILL_AMT'
,p_column_display_sequence=>610
,p_column_heading=>'Wfdc Bill Amt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318010740358816774)
,p_query_column_id=>71
,p_column_alias=>'WFDC_BILL_DATE'
,p_column_display_sequence=>570
,p_column_heading=>'Wfdc Bill Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318010853068816775)
,p_query_column_id=>72
,p_column_alias=>'WFDC_BILL_NO'
,p_column_display_sequence=>580
,p_column_heading=>'Wfdc Bill No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318005229654816669)
,p_query_column_id=>16
,p_column_alias=>'WFDC_BU'
,p_column_display_sequence=>20
,p_column_heading=>'Wfdc Bu'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318014466809816811)
,p_query_column_id=>15
,p_column_alias=>'WFDC_CALL_PAGE_NO'
,p_column_display_sequence=>940
,p_column_heading=>'Wfdc Call Page No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318012355798816790)
,p_query_column_id=>87
,p_column_alias=>'WFDC_COLL_CENTR_ID'
,p_column_display_sequence=>730
,p_column_heading=>'Wfdc Coll Centr Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318011553093816782)
,p_query_column_id=>79
,p_column_alias=>'WFDC_CRE_BY'
,p_column_display_sequence=>650
,p_column_heading=>'Wfdc Cre By'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318011844241816785)
,p_query_column_id=>82
,p_column_alias=>'WFDC_CRE_DATE'
,p_column_display_sequence=>680
,p_column_heading=>'Wfdc Cre Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318012467066816791)
,p_query_column_id=>88
,p_column_alias=>'WFDC_CRE_EMP_ID'
,p_column_display_sequence=>740
,p_column_heading=>'Wfdc Cre Emp Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318011678585816783)
,p_query_column_id=>80
,p_column_alias=>'WFDC_CRE_IP_ADDR'
,p_column_display_sequence=>660
,p_column_heading=>'Wfdc Cre Ip Addr'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318011740387816784)
,p_query_column_id=>81
,p_column_alias=>'WFDC_CRE_OS_USER'
,p_column_display_sequence=>670
,p_column_heading=>'Wfdc Cre Os User'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318005744291816674)
,p_query_column_id=>21
,p_column_alias=>'WFDC_CTRL_PERSON'
,p_column_display_sequence=>70
,p_column_heading=>'Wfdc Ctrl Person'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318005982286816676)
,p_query_column_id=>23
,p_column_alias=>'WFDC_CUST_ID'
,p_column_display_sequence=>90
,p_column_heading=>'Wfdc Cust Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318010437374816771)
,p_query_column_id=>68
,p_column_alias=>'WFDC_DISC_PCT'
,p_column_display_sequence=>540
,p_column_heading=>'Wfdc Disc Pct'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318008849507816705)
,p_query_column_id=>52
,p_column_alias=>'WFDC_DOC_BRIEF'
,p_column_display_sequence=>380
,p_column_heading=>'Wfdc Doc Brief'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318010144058816768)
,p_query_column_id=>65
,p_column_alias=>'WFDC_DOC_DATE'
,p_column_display_sequence=>510
,p_column_heading=>'Wfdc Doc Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318005585598816672)
,p_query_column_id=>19
,p_column_alias=>'WFDC_DOC_NO'
,p_column_display_sequence=>50
,p_column_heading=>'Wfdc Doc No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318005491845816671)
,p_query_column_id=>18
,p_column_alias=>'WFDC_DOC_PFX'
,p_column_display_sequence=>40
,p_column_heading=>'Wfdc Doc Pfx'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318008033358816697)
,p_query_column_id=>44
,p_column_alias=>'WFDC_DOC_SFX'
,p_column_display_sequence=>300
,p_column_heading=>'Wfdc Doc Sfx'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318011483130816781)
,p_query_column_id=>78
,p_column_alias=>'WFDC_EMP_ID'
,p_column_display_sequence=>640
,p_column_heading=>'Wfdc Emp Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318006937228816686)
,p_query_column_id=>33
,p_column_alias=>'WFDC_FRWD_RTN'
,p_column_display_sequence=>190
,p_column_heading=>'Wfdc Frwd Rtn'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318009432129816711)
,p_query_column_id=>58
,p_column_alias=>'WFDC_FWD_ON'
,p_column_display_sequence=>440
,p_column_heading=>'Wfdc Fwd On'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318008750005816704)
,p_query_column_id=>51
,p_column_alias=>'WFDC_FWD_PERSON'
,p_column_display_sequence=>370
,p_column_heading=>'Wfdc Fwd Person'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318013736287816804)
,p_query_column_id=>91
,p_column_alias=>'WFDC_FWD_PER_NAME'
,p_column_display_sequence=>870
,p_column_heading=>'Wfdc Fwd Per Name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318008943880816706)
,p_query_column_id=>53
,p_column_alias=>'WFDC_FWD_TO'
,p_column_display_sequence=>390
,p_column_heading=>'Wfdc Fwd To'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318011020832816776)
,p_query_column_id=>73
,p_column_alias=>'WFDC_GROSS_AMT'
,p_column_display_sequence=>590
,p_column_heading=>'Wfdc Gross Amt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318008536988816702)
,p_query_column_id=>49
,p_column_alias=>'WFDC_INT_MSG_FLAG'
,p_column_display_sequence=>350
,p_column_heading=>'Wfdc Int Msg Flag'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318011358317816780)
,p_query_column_id=>77
,p_column_alias=>'WFDC_INV_NO'
,p_column_display_sequence=>630
,p_column_heading=>'Wfdc Inv No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318011271748816779)
,p_query_column_id=>76
,p_column_alias=>'WFDC_INV_PFX'
,p_column_display_sequence=>620
,p_column_heading=>'Wfdc Inv Pfx'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318006915949816685)
,p_query_column_id=>32
,p_column_alias=>'WFDC_JRNL_TYPE'
,p_column_display_sequence=>180
,p_column_heading=>'Wfdc Jrnl Type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318006118957816677)
,p_query_column_id=>24
,p_column_alias=>'WFDC_LVL1'
,p_column_display_sequence=>100
,p_column_heading=>'Wfdc Lvl1'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318006219682816678)
,p_query_column_id=>25
,p_column_alias=>'WFDC_LVL2'
,p_column_display_sequence=>110
,p_column_heading=>'Wfdc Lvl2'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318006276137816679)
,p_query_column_id=>26
,p_column_alias=>'WFDC_LVL3'
,p_column_display_sequence=>120
,p_column_heading=>'Wfdc Lvl3'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318006392187816680)
,p_query_column_id=>27
,p_column_alias=>'WFDC_LVL4'
,p_column_display_sequence=>130
,p_column_heading=>'Wfdc Lvl4'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318010285339816769)
,p_query_column_id=>66
,p_column_alias=>'WFDC_LVL_PRJ'
,p_column_display_sequence=>520
,p_column_heading=>'Wfdc Lvl Prj'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318008466619816701)
,p_query_column_id=>48
,p_column_alias=>'WFDC_MAIL_FLAG'
,p_column_display_sequence=>340
,p_column_heading=>'Wfdc Mail Flag'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318010074223816767)
,p_query_column_id=>64
,p_column_alias=>'WFDC_MAIL_SEND_FLAG'
,p_column_display_sequence=>500
,p_column_heading=>'Wfdc Mail Send Flag'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318007158224816688)
,p_query_column_id=>35
,p_column_alias=>'WFDC_MESSAGE'
,p_column_display_sequence=>210
,p_column_heading=>'Wfdc Message'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318009803518816764)
,p_query_column_id=>61
,p_column_alias=>'WFDC_NXT_FWD_ENTITY'
,p_column_display_sequence=>470
,p_column_heading=>'Wfdc Nxt Fwd Entity'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318009271492816709)
,p_query_column_id=>56
,p_column_alias=>'WFDC_NXT_FWD_PERSON'
,p_column_display_sequence=>420
,p_column_heading=>'Wfdc Nxt Fwd Person'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318009957172816766)
,p_query_column_id=>63
,p_column_alias=>'WFDC_NXT_FWD_PLNT'
,p_column_display_sequence=>490
,p_column_heading=>'Wfdc Nxt Fwd Plnt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318009341144816710)
,p_query_column_id=>57
,p_column_alias=>'WFDC_NXT_MESSAGE'
,p_column_display_sequence=>430
,p_column_heading=>'Wfdc Nxt Message'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318014064340816807)
,p_query_column_id=>94
,p_column_alias=>'WFDC_NXT_PROCESS'
,p_column_display_sequence=>900
,p_column_heading=>'Wfdc Nxt Process'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318009060413816707)
,p_query_column_id=>54
,p_column_alias=>'WFDC_NXT_STATUS'
,p_column_display_sequence=>400
,p_column_heading=>'Wfdc Nxt Status'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318008253638816699)
,p_query_column_id=>46
,p_column_alias=>'WFDC_PLNT'
,p_column_display_sequence=>320
,p_column_heading=>'Wfdc Plnt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318014005324816806)
,p_query_column_id=>93
,p_column_alias=>'WFDC_PLNT_DESC'
,p_column_display_sequence=>890
,p_column_heading=>'Wfdc Plnt Desc'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318007119666816687)
,p_query_column_id=>34
,p_column_alias=>'WFDC_PO_MODE'
,p_column_display_sequence=>200
,p_column_heading=>'Wfdc Po Mode'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318007909831816695)
,p_query_column_id=>42
,p_column_alias=>'WFDC_PRIORITY'
,p_column_display_sequence=>280
,p_column_heading=>'Wfdc Priority'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318006590036816682)
,p_query_column_id=>29
,p_column_alias=>'WFDC_PRJ_ID'
,p_column_display_sequence=>150
,p_column_heading=>'Wfdc Prj Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318007650438816693)
,p_query_column_id=>40
,p_column_alias=>'WFDC_PROD_ID'
,p_column_display_sequence=>260
,p_column_heading=>'Wfdc Prod Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318007784006816694)
,p_query_column_id=>41
,p_column_alias=>'WFDC_PROD_REV'
,p_column_display_sequence=>270
,p_column_heading=>'Wfdc Prod Rev'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318007552994816692)
,p_query_column_id=>39
,p_column_alias=>'WFDC_QC_INS_MODE'
,p_column_display_sequence=>250
,p_column_heading=>'Wfdc Qc Ins Mode'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318007518375816691)
,p_query_column_id=>38
,p_column_alias=>'WFDC_QC_REV'
,p_column_display_sequence=>240
,p_column_heading=>'Wfdc Qc Rev'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318006713971816683)
,p_query_column_id=>30
,p_column_alias=>'WFDC_RND_PRJ_ID'
,p_column_display_sequence=>160
,p_column_heading=>'Wfdc Rnd Prj Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318008371649816700)
,p_query_column_id=>47
,p_column_alias=>'WFDC_SELECT_FLAG'
,p_column_display_sequence=>330
,p_column_heading=>'Wfdc Select Flag'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318007270230816689)
,p_query_column_id=>36
,p_column_alias=>'WFDC_SEQ_NO'
,p_column_display_sequence=>220
,p_column_heading=>'Wfdc Seq No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318008668925816703)
,p_query_column_id=>50
,p_column_alias=>'WFDC_SMS_FLAG'
,p_column_display_sequence=>360
,p_column_heading=>'Wfdc Sms Flag'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318005839110816675)
,p_query_column_id=>22
,p_column_alias=>'WFDC_SPPLR_ID'
,p_column_display_sequence=>80
,p_column_heading=>'Wfdc Spplr Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318009604802816762)
,p_query_column_id=>59
,p_column_alias=>'WFDC_SRC_BU'
,p_column_display_sequence=>450
,p_column_heading=>'Wfdc Src Bu'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318009669358816763)
,p_query_column_id=>60
,p_column_alias=>'WFDC_SRC_PLNT'
,p_column_display_sequence=>460
,p_column_heading=>'Wfdc Src Plnt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318013862098816805)
,p_query_column_id=>92
,p_column_alias=>'WFDC_SRC_PLNT_DESC'
,p_column_display_sequence=>880
,p_column_heading=>'Wfdc Src Plnt Desc'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318009831068816765)
,p_query_column_id=>62
,p_column_alias=>'WFDC_SRC_USER'
,p_column_display_sequence=>480
,p_column_heading=>'Wfdc Src User'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318005724701816673)
,p_query_column_id=>20
,p_column_alias=>'WFDC_STATUS'
,p_column_display_sequence=>60
,p_column_heading=>'Wfdc Status'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318011049113816777)
,p_query_column_id=>74
,p_column_alias=>'WFDC_TAX_AMT'
,p_column_display_sequence=>600
,p_column_heading=>'Wfdc Tax Amt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318005336397816670)
,p_query_column_id=>17
,p_column_alias=>'WFDC_TYPE'
,p_column_display_sequence=>30
,p_column_heading=>'Wfdc Type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318013714142816803)
,p_query_column_id=>90
,p_column_alias=>'WFDC_TYPE_DESC'
,p_column_display_sequence=>860
,p_column_heading=>'Wfdc Type Desc'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318012013228816786)
,p_query_column_id=>83
,p_column_alias=>'WFDC_UPD_BY'
,p_column_display_sequence=>690
,p_column_heading=>'Wfdc Upd By'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318012264041816789)
,p_query_column_id=>86
,p_column_alias=>'WFDC_UPD_DATE'
,p_column_display_sequence=>720
,p_column_heading=>'Wfdc Upd Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318012560722816792)
,p_query_column_id=>89
,p_column_alias=>'WFDC_UPD_EMP_ID'
,p_column_display_sequence=>750
,p_column_heading=>'Wfdc Upd Emp Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318012070230816787)
,p_query_column_id=>84
,p_column_alias=>'WFDC_UPD_IP_ADDR'
,p_column_display_sequence=>700
,p_column_heading=>'Wfdc Upd Ip Addr'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318012135900816788)
,p_query_column_id=>85
,p_column_alias=>'WFDC_UPD_OS_USER'
,p_column_display_sequence=>710
,p_column_heading=>'Wfdc Upd Os User'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318006795552816684)
,p_query_column_id=>31
,p_column_alias=>'WFDC_VALUE'
,p_column_display_sequence=>170
,p_column_heading=>'Wfdc Value'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318007948277816696)
,p_query_column_id=>43
,p_column_alias=>'WFDC_WF_NO'
,p_column_display_sequence=>290
,p_column_heading=>'Wfdc Wf No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318008203676816698)
,p_query_column_id=>45
,p_column_alias=>'WFDC_WRK_CNTR'
,p_column_display_sequence=>310
,p_column_heading=>'Wfdc Wrk Cntr'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(10819691534941868978)
,p_name=>'Cards'
,p_static_id=>'cards-2'
,p_parent_plug_id=>wwv_flow_imp.id(10819691417164868977)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:margin-top-none'
,p_component_template_options=>'t-Cards--basic:t-Cards--displayIcons:t-Cards--4cols:t-Cards--animColorFill'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT *',
'  FROM (',
'SELECT ROWID,',
'       ''<B><SPAN STYLE="font-size:11px; font-family:verdana; color: #ffffff">''||func_find_apex_wf_desc(wfdc_bu, wfdc_plnt, NVL(wfdc_src_bu, wfdc_bu), wfdc_type, wfdc_doc_no)||''</SPAN></B>'' "CARD_TITLE",',
'       ''<B><SPAN STYLE="font-size:11px; font-family:verdana; color: #ef9a9a">''||(SELECT INITCAP(TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1))',
'                                                                                   FROM employees,',
'                                                                                        appl_users',
'                                                                                  WHERE emp_bu      = appluser_bu',
'                                                                                    AND emp_emp_id  = appluser_emp_id ',
'                                                                                    AND appluser_bu = wfdc_bu',
'                                                                                    AND appluser_id = wfdc_fwd_person)||''</SPAN></B>'' "CARD_SUBTITLE",',
'',
'       ''<table style="width:100%" border="0">''||',
'         CASE WHEN wfdc_message IS NOT NULL THEN      ',
'         ''<tr>',
'            <td style="width:10%" align="center"><span aria-hidden="true" class="fa fa-commenting" style="color:#1F618D"></span></td>',
'            <td style="width:90%; vertical-align:top"><span style="color: #5d6d7e;font-weight:bolder; font-size:12px; font-family: Calibri">''||NVL(INITCAP(wfdc_message), ''--No Message--'')||''</span></td> ',
'         </tr>''',
'         END||''         ',
'        ',
'         <tr>''||CASE WHEN wfdc_doc_no IS NOT NULL THEN ',
'            ''<td style="width:10%" align="center"><span aria-hidden="true" class="fa fa-book" style="color:#1F618D"></span></td>',
'            <td style="width:90%"><span style="color: #015e07; font-weight:bolder;font-size:12px; font-family: Calibri">''||DECODE(wfdc_doc_pfx, NULL, NULL, wfdc_doc_pfx||''/'')||wfdc_doc_no||''</span></td> ',
'         </tr>'' END||         ',
'         CASE WHEN wfdc_benf_id IS NOT NULL THEN',
'         ''<tr>',
'            <td style="width:10%" align="center">''||',
'            CASE WHEN wfdc_benf_type = ''S'' THEN',
'               ''<span aria-hidden="true" class="fa fa-truck" style="color:#1F618D"></span>''',
'            WHEN wfdc_benf_type = ''C'' THEN',
'               ''<span aria-hidden="true" class="fa fa-users" style="color:#1F618D"></span>''',
'            WHEN wfdc_benf_type = ''P'' THEN',
'               ''<span aria-hidden="true" class="fa fa-binoculars" style="color:#1F618D"></span>''',
'            WHEN wfdc_benf_type = ''N'' THEN',
'               ''<span aria-hidden="true" class="fa fa-user-secret" style="color:#1F618D"></span>''',
'            END||''',
'            </td>',
'            <td style="width:90%"><span style="color: #5d6d7e; font-weight:bolder;font-size:12px; font-family: Calibri">''||CASE WHEN wfdc_benf_id IS NOT NULL THEN',
'                                                                                                             CASE WHEN wfdc_benf_type = ''S'' THEN',
'                                                                                                                       INITCAP(func_find_suplr_name(NVL(wfdc_src_bu, wfdc_bu), wfdc_benf_id, 1))',
'                                                                                                                  WHEN wfdc_benf_type = ''C'' THEN',
'                                                                                                                       INITCAP(func_find_cust_name(NVL(wfdc_src_bu, wfdc_bu), wfdc_benf_id, 1))',
'                                                                                                                  WHEN wfdc_benf_type = ''P'' THEN',
'                                                                                                                       INITCAP(func_find_prospect_desc(NVL(wfdc_src_bu, wfdc_bu), wfdc_benf_id, 1))',
'                                                                                                                  WHEN wfdc_benf_type = ''N'' THEN',
'                                                                                                                       INITCAP(func_find_sale_pers_desc(NVL(wfdc_src_bu, wfdc_bu), wfdc_benf_id, 1))',
'                                                                                                                  END',
'                                                                                                            END||''</span></td> ',
'         </tr>''    ',
'         END||',
'         CASE WHEN wfdc_doc_brief IS NOT NULL THEN',
'         ''<tr>',
'            <td style="width:10%" align="center"><span aria-hidden="true" class="fa fa-file-text-o" style="color:#1F618D"></span></td>',
'            <td style="width:90%"><span style="color: #5e003d; font-weight:bolder;font-size:12px; font-family: Calibri">''||wfdc_doc_brief||''</span></td> ',
'         </tr>''',
'         END||',
'         CASE WHEN wfdc_value IS NOT NULL THEN',
'         ''<tr>',
'            <td style="width:10%" align="center"><span aria-hidden="true" class="fa fa-money" style="color:#1F618D"></span></td>',
'            <td style="width:90%"><span style="color: #5d6d7e; font-weight:bolder;font-size:12px; font-family: Calibri">''||TO_CHAR(wfdc_value, func_get_cost_format_mask(wfdc_bu))||''</span></td> ',
'         </tr>''    ',
'         END||''',
'        </table>'' "CARD_TEXT",',
'        CASE ',
'        WHEN wfdc_priority = ''1'' THEN ',
'             ''H''',
'        WHEN wfdc_priority = ''2'' THEN       ',
'             ''M''',
'        WHEN wfdc_priority = ''3'' THEN       ',
'             ''L''',
'        END "CARD_INITIALS",',
'       ''<BR><span class="fa fa-dynamic-content" aria-hidden="true" style="color:#28a745" title="View Log"></span>'' "ATTRIBUTE_1",',
'            ''<span class="fa fa-tiles-2x2" aria-hidden="true" style="color:#ABB2B9" title="View Details"></span>'' "ATTRIBUTE_2",',
'           --''<span aria-hidden="true" class="fa fa-reply" style="color:#2980B9" title="Return"></span>'' "ATTRIBUTE_3",',
'           --''<span class="fa fa-times-circle" aria-hidden="true" style="color:#E74C3C" title="Cancel"></span>'' "ATTRIBUTE_4",           ',
'           --''<span aria-hidden="true" class="fa fa-share" style="color:#E67E22" title="Forward"></span>'' "ATTRIBUTE_5",',
'           NULL "ATTRIBUTE_3",',
'           NULL "ATTRIBUTE_4",',
'           NULL "ATTRIBUTE_5",           ',
'           ''<span style="color:  #707b7c; font-family:Arial; font-size:9px">''||CASE WHEN MOD(TRUNC((SYSDATE - NVL(wfdc_fwd_on, wfdc_cre_date)) * 24), 24) = 0 THEN',
'                                                                                        MOD(TRUNC((SYSDATE - NVL(wfdc_fwd_on, wfdc_cre_date)) * 1440), 60)||'' min ago''',
'                                                                                     ELSE',
'                                                                                        TRUNC(SYSDATE - NVL(wfdc_fwd_on, wfdc_cre_date))||'' Days ''||MOD(TRUNC((SYSDATE - NVL(wfdc_fwd_on, wfdc_cre_date)) * 24), 24)||'' hour ''||MOD(TRUNC((SYSDATE - NVL(w'
||'fdc_fwd_on, wfdc_cre_date)) * 1440), 60)||'' min ago''',
'                                                                                     END||''</SPAN>'' "CARD_DATE",',
'       ',
'       /*CASE WHEN wfdc_mail_flag = ''N'' THEN ',
'                 ''<span class="fa fa-square-o" aria-hidden="true"></span><span style="color: #5d6d7e; font-size:12px; font-family: Calibri">  Mail</span>''',
'            ELSE',
'                 ''<span class="fa fa-square-selected-o" aria-hidden="true"></span><span style="color: #5d6d7e; font-size:12px; font-family: Calibri"> Mail</span>''',
'            END */',
'            ''<span class="fa fa-paper-plane" aria-hidden="true"></span><span style="color: #3BAA2C; font-size:12px; font-family: Calibri"></span>'' "CARD_SUBTEXT",    ',
'       CASE WHEN wfdc_sms_flag = ''N'' THEN ',
'                 ''<span class="fa fa-square-o" aria-hidden="true"></span><span style="color: #5d6d7e; font-size:12px; font-family: Calibri">  SMS</span>''',
'            ELSE',
'                 ''<span class="fa fa-square-selected-o" aria-hidden="true"></span><span style="color: #5d6d7e; font-size:12px; font-family: Calibri">  SMS</span>''',
'            END "ATTRIBUTE_6",      ',
'      CASE WHEN wfdc_int_msg_flag = ''N'' THEN ',
'                 ''<span class="fa fa-square-o" aria-hidden="true"></span><span style="color: #5d6d7e; font-size:12px; font-family: Calibri">  Internal Msg.</span>''',
'            ELSE',
'                 ''<span class="fa fa-square-selected-o" aria-hidden="true"></span><span style="color: #5d6d7e; font-size:12px; font-family: Calibri">  Internal Msg.</span>''',
'            END "ATTRIBUTE_7",',
'       CASE WHEN wfdc_type = ''WF_PRJ_EMPTC'' THEN 511 ELSE 335 END wfdc_call_page_no,        ',
'        ''fa-paper-plane'' "CARD_ICON",    ',
'       wfdc_bu,',
'       wfdc_type,',
'       wfdc_doc_pfx,',
'       wfdc_doc_no,',
'       wfdc_status,',
'       wfdc_ctrl_person,',
'       wfdc_spplr_id,',
'       wfdc_cust_id,',
'       wfdc_lvl1,',
'       wfdc_lvl2,',
'       wfdc_lvl3,',
'       wfdc_lvl4,',
'       wfdc_accts,',
'       wfdc_prj_id,',
'       wfdc_rnd_prj_id,',
'       wfdc_value,',
'       wfdc_jrnl_type,',
'       wfdc_frwd_rtn,',
'       wfdc_po_mode,',
'       wfdc_message,',
'       wfdc_seq_no,',
'       wfdc_action_date,',
'       wfdc_qc_rev,',
'       wfdc_qc_ins_mode,',
'       wfdc_prod_id,',
'       wfdc_prod_rev,',
'       wfdc_priority,',
'       wfdc_wf_no,',
'       wfdc_doc_sfx,',
'       wfdc_wrk_cntr,',
'       wfdc_plnt,',
'       wfdc_select_flag,',
'       wfdc_mail_flag,',
'       wfdc_int_msg_flag,',
'       wfdc_sms_flag,',
'       wfdc_fwd_person,',
'       wfdc_doc_brief,',
'       wfdc_fwd_to,',
'       wfdc_nxt_status,',
'       wfdc_act,',
'       wfdc_nxt_fwd_person,',
'       wfdc_nxt_message,',
'       wfdc_fwd_on,',
'       wfdc_src_bu,',
'       wfdc_src_plnt,',
'       wfdc_nxt_fwd_entity,',
'       wfdc_src_user,',
'       wfdc_nxt_fwd_plnt,',
'       wfdc_mail_send_flag,',
'       wfdc_doc_date,',
'       wfdc_lvl_prj,',
'       wfdc_auth_type,',
'       wfdc_disc_pct,',
'       wfdc_benf_type,',
'       wfdc_benf_id,',
'       wfdc_bill_date,',
'       wfdc_bill_no,',
'       wfdc_gross_amt,',
'       wfdc_tax_amt,',
'       wfdc_bill_amt,',
'       wfdc_inv_pfx,',
'       wfdc_inv_no,',
'       wfdc_emp_id,',
'       wfdc_cre_by,',
'       wfdc_cre_ip_addr,',
'       wfdc_cre_os_user,',
'       wfdc_cre_date,',
'       wfdc_upd_by,',
'       wfdc_upd_ip_addr,',
'       wfdc_upd_os_user,',
'       wfdc_upd_date,',
'       wfdc_coll_centr_id,',
'       wfdc_cre_emp_id,',
'       wfdc_upd_emp_id,',
'       func_find_apex_wf_desc(wfdc_bu, wfdc_plnt, NVL(wfdc_src_bu, wfdc_bu), wfdc_type, wfdc_doc_no) wfdc_type_desc,',
'       (SELECT INITCAP(TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1))',
'          FROM employees,',
'               appl_users',
'         WHERE emp_bu      = appluser_bu',
'           AND emp_emp_id  = appluser_emp_id ',
'           AND appluser_bu = wfdc_bu',
'           AND appluser_id = wfdc_fwd_person) wfdc_fwd_per_name,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = NVL(wfdc_src_bu, wfdc_bu) ',
'           AND bup_plant_id = wfdc_src_plnt) wfdc_src_plnt_desc,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = wfdc_bu ',
'           AND bup_plant_id = wfdc_plnt) wfdc_plnt_desc,',
'       NVL((SELECT INITCAP(wfaa_desc)',
'            FROM work_flow_appr_actvt',
'           WHERE wfaa_bu     = NVL(wfdc_src_bu, wfdc_bu)',
'             AND wfaa_wf_id  = wfdc_type',
'             AND wfaa_seq_no = wfdc_seq_no + 1), ''Message Not Specified.'') wfdc_nxt_process',
'  FROM work_flow_doc_control  ',
' WHERE wfdc_bu = :GLOBAL_BU',
'   AND (wfdc_auth_type = ''P'' AND wfdc_ctrl_person = func_find_position_id(:GLOBAL_BU, :GLOBAL_USER) ',
'    OR  wfdc_auth_type = ''E'' AND wfdc_ctrl_person = func_find_emp_id(:GLOBAL_BU, :GLOBAL_USER))',
'   AND (wfdc_type, wfdc_status) NOT IN (SELECT wfaa_wf_id, wfaa_status',
'                                          FROM work_flow_appr_actvt',
'                                         WHERE wfaa_bu = :GLOBAL_BU ',
'                                           AND (wfaa_wf_id, wfaa_seq_no) IN (SELECT wfaa_wf_id, MAX(wfaa_seq_no) wfaa_seq_no',
'                                                                               FROM work_flow_appr_actvt',
'                                                                              WHERE wfaa_bu = :GLOBAL_BU ',
'                                                                              GROUP BY wfaa_wf_id))',
'  AND wfdc_status NOT IN (''C'',''R'',''S''))',
'WHERE (INSTR(UPPER(wfdc_type_desc), UPPER(NVL(:P2361310102_WF_SRCH, wfdc_type_desc))) > 0 OR',
'       INSTR(UPPER(wfdc_fwd_per_name), UPPER(NVL(:P2361310102_WF_SRCH, wfdc_fwd_per_name))) > 0 OR',
'       INSTR(UPPER(wfdc_src_plnt_desc), UPPER(NVL(:P2361310102_WF_SRCH, wfdc_src_plnt_desc))) > 0 OR       ',
'       INSTR(UPPER(wfdc_doc_pfx), UPPER(NVL(:P2361310102_WF_SRCH, wfdc_doc_pfx))) > 0 OR',
'       INSTR(UPPER(wfdc_doc_no), UPPER(NVL(:P2361310102_WF_SRCH, wfdc_doc_no))) > 0 OR       ',
'       INSTR(UPPER(wfdc_src_bu), UPPER(NVL(:P2361310102_WF_SRCH, wfdc_src_bu))) > 0 OR',
'       INSTR(UPPER(wfdc_plnt_desc), UPPER(NVL(:P2361310102_WF_SRCH, wfdc_plnt_desc))) > 0)',
'ORDER BY wfdc_priority, NVL(wfdc_fwd_on, wfdc_cre_date) DESC,wfdc_type'))
,p_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'.switch ',
'    {',
'      position: relative;',
'      display: inline-block;',
'      width: 30px;',
'      height: 17px;',
'    }',
'',
'.switch input ',
'    { ',
'      opacity: 0;',
'      width: 0;',
'      height: 0;',
'    }',
'',
'.slider ',
'    {',
'      position: absolute;',
'      cursor: pointer;',
'      top: 0;',
'      left: 0;',
'      right: 0;',
'      bottom: 0;',
'      background-color: #ccc;',
'      -webkit-transition: .4s;',
'      transition: .4s;',
'    }',
'',
'.slider:before {',
'  position: absolute;',
'  content: "";',
'  height: 13px;',
'  width: 13px;',
'  left: 2px;',
'  bottom: 2px;',
'  background-color: white;',
'  -webkit-transition: .4s;',
'  transition: .4s;',
'}',
'',
'input:checked + .slider {',
'  background-color: #148F77;',
'}',
'',
'input:focus + .slider {',
'  box-shadow: 0 0 1px #2196F3;',
'}',
'',
'input:checked + .slider:before {',
'  -webkit-transform: translateX(13px);',
'  -ms-transform: translateX(13px);',
'  transform: translateX(13px);',
'}',
'',
'/* Rounded sliders */',
'.slider.round {',
'  border-radius: 17px;',
'}',
'',
'.slider.round:before {',
'  border-radius: 40%;',
'}',
'',
'/* Tooltip */',
'    ',
'.tooltip {',
'  position: relative;',
'  display: inline-block;',
'  border-bottom: 1px dotted black;',
'}',
'',
'.tooltip .tooltiptext {',
'  visibility: hidden;',
'  width: 120px;',
'  background-color: black;',
'  color: #fff;',
'  text-align: center;',
'  border-radius: 6px;',
'  padding: 5px 0;',
'  position: absolute;',
'  z-index: 1;',
'  top: 150%;',
'  left: 50%;',
'  margin-left: -60px;',
'}',
'',
'.tooltip .tooltiptext::after {',
'  content: "";',
'  position: absolute;',
'  bottom: 100%;',
'  left: 50%;',
'  margin-left: -5px;',
'  border-width: 5px;',
'  border-style: solid;',
'  border-color: transparent transparent black transparent;',
'}',
'',
'.tooltip:hover .tooltiptext {',
'  visibility: visible;',
'}',
'</style>'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P2361310102_WF_SRCH'
,p_lazy_loading=>true
,p_query_row_template=>wwv_flow_imp.id(6318305432300118882)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'SEARCH_ENGINE'
,p_query_row_count_max=>50
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317032712010561295)
,p_query_column_id=>6
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>81
,p_column_heading=>'Attribute 1'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317033031889561298)
,p_query_column_id=>7
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>82
,p_column_heading=>'Attribute 2'
,p_column_link=>'f?p=&APP_ID.:#WFDC_CALL_PAGE_NO#:&SESSION.::&DEBUG.::P511_WF_BU,P511_WF_PLNT,P511_WF_DOC_NO,P511_WF_NO,P511_WF_TYPE,P511_WF_SOU_BU,P511_WF_CTRL_PRSN,P511_WF_SOU_PLNT,P511_WF_SEQ_NO:#WFDC_BU#,#WFDC_PLNT#,#WFDC_DOC_NO#,#WFDC_WF_NO#,#WFDC_TYPE#,#WFDC_SR'
||'C_BU#,#WFDC_CTRL_PERSON#,#WFDC_SRC_PLNT#,#WFDC_SEQ_NO#'
,p_column_linktext=>'#ATTRIBUTE_2#'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317033484340561304)
,p_query_column_id=>8
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>83
,p_column_heading=>'Attribute 3'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317033860556561311)
,p_query_column_id=>9
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>84
,p_column_heading=>'Attribute 4'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317034310389561317)
,p_query_column_id=>10
,p_column_alias=>'ATTRIBUTE_5'
,p_column_display_sequence=>85
,p_column_heading=>'Attribute 5'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317035477564561357)
,p_query_column_id=>13
,p_column_alias=>'ATTRIBUTE_6'
,p_column_display_sequence=>91
,p_column_heading=>'Mail'
,p_column_link=>'javascript:$s(''P335_WF_NO'', ''#WFDC_WF_NO#''); 	   $s(''P335_SMS_FLAG'', ''S'');'
,p_column_linktext=>'#ATTRIBUTE_6#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317035852446561362)
,p_query_column_id=>14
,p_column_alias=>'ATTRIBUTE_7'
,p_column_display_sequence=>92
,p_column_heading=>'Attribute 7'
,p_column_link=>'javascript:$s(''P335_WF_NO'', ''#WFDC_WF_NO#''); 	   $s(''P335_INT_MSG'', ''I'');'
,p_column_linktext=>'#ATTRIBUTE_7#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317034700732561337)
,p_query_column_id=>11
,p_column_alias=>'CARD_DATE'
,p_column_display_sequence=>93
,p_column_heading=>'Card Date'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6318740565896505664)
,p_query_column_id=>16
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>104
,p_column_heading=>'Card Icon'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317032323790561289)
,p_query_column_id=>5
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>80
,p_column_heading=>'Card Initials'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317035080650561351)
,p_query_column_id=>12
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>78
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317031587685561273)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>77
,p_column_heading=>'Card Subtitle'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317031880135561282)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>79
,p_column_heading=>'Card Text'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317031183093561267)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>76
,p_column_heading=>'Card Title'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317030801718561261)
,p_query_column_id=>1
,p_column_alias=>'ROWID'
,p_column_display_sequence=>1
,p_column_heading=>'Rowid'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317041340819561440)
,p_query_column_id=>29
,p_column_alias=>'WFDC_ACCTS'
,p_column_display_sequence=>14
,p_column_heading=>'Wfdc Accts'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317051695313561570)
,p_query_column_id=>56
,p_column_alias=>'WFDC_ACT'
,p_column_display_sequence=>41
,p_column_heading=>'Wfdc Act'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317044844163561487)
,p_query_column_id=>38
,p_column_alias=>'WFDC_ACTION_DATE'
,p_column_display_sequence=>23
,p_column_heading=>'Wfdc Action Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317056336387561634)
,p_query_column_id=>68
,p_column_alias=>'WFDC_AUTH_TYPE'
,p_column_display_sequence=>53
,p_column_heading=>'Wfdc Auth Type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317057612330561648)
,p_query_column_id=>71
,p_column_alias=>'WFDC_BENF_ID'
,p_column_display_sequence=>56
,p_column_heading=>'Wfdc Benf Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317057205075561645)
,p_query_column_id=>70
,p_column_alias=>'WFDC_BENF_TYPE'
,p_column_display_sequence=>55
,p_column_heading=>'Wfdc Benf Type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317059963063561667)
,p_query_column_id=>76
,p_column_alias=>'WFDC_BILL_AMT'
,p_column_display_sequence=>61
,p_column_heading=>'Wfdc Bill Amt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317058015457561651)
,p_query_column_id=>72
,p_column_alias=>'WFDC_BILL_DATE'
,p_column_display_sequence=>57
,p_column_heading=>'Wfdc Bill Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317058349841561653)
,p_query_column_id=>73
,p_column_alias=>'WFDC_BILL_NO'
,p_column_display_sequence=>58
,p_column_heading=>'Wfdc Bill No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317036709994561373)
,p_query_column_id=>17
,p_column_alias=>'WFDC_BU'
,p_column_display_sequence=>2
,p_column_heading=>'Wfdc Bu'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317036250037561368)
,p_query_column_id=>15
,p_column_alias=>'WFDC_CALL_PAGE_NO'
,p_column_display_sequence=>94
,p_column_heading=>'Wfdc Call Page No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317064704387561737)
,p_query_column_id=>88
,p_column_alias=>'WFDC_COLL_CENTR_ID'
,p_column_display_sequence=>73
,p_column_heading=>'Wfdc Coll Centr Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317061491644561686)
,p_query_column_id=>80
,p_column_alias=>'WFDC_CRE_BY'
,p_column_display_sequence=>65
,p_column_heading=>'Wfdc Cre By'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317062644420561712)
,p_query_column_id=>83
,p_column_alias=>'WFDC_CRE_DATE'
,p_column_display_sequence=>68
,p_column_heading=>'Wfdc Cre Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317065113356561740)
,p_query_column_id=>89
,p_column_alias=>'WFDC_CRE_EMP_ID'
,p_column_display_sequence=>74
,p_column_heading=>'Wfdc Cre Emp Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317061850635561695)
,p_query_column_id=>81
,p_column_alias=>'WFDC_CRE_IP_ADDR'
,p_column_display_sequence=>66
,p_column_heading=>'Wfdc Cre Ip Addr'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317062243467561704)
,p_query_column_id=>82
,p_column_alias=>'WFDC_CRE_OS_USER'
,p_column_display_sequence=>67
,p_column_heading=>'Wfdc Cre Os User'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317038593691561400)
,p_query_column_id=>22
,p_column_alias=>'WFDC_CTRL_PERSON'
,p_column_display_sequence=>7
,p_column_heading=>'Wfdc Ctrl Person'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317039413239561414)
,p_query_column_id=>24
,p_column_alias=>'WFDC_CUST_ID'
,p_column_display_sequence=>9
,p_column_heading=>'Wfdc Cust Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317056761645561640)
,p_query_column_id=>69
,p_column_alias=>'WFDC_DISC_PCT'
,p_column_display_sequence=>54
,p_column_heading=>'Wfdc Disc Pct'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317050434864561557)
,p_query_column_id=>53
,p_column_alias=>'WFDC_DOC_BRIEF'
,p_column_display_sequence=>38
,p_column_heading=>'Wfdc Doc Brief'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317055545489561625)
,p_query_column_id=>66
,p_column_alias=>'WFDC_DOC_DATE'
,p_column_display_sequence=>51
,p_column_heading=>'Wfdc Doc Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317037804205561386)
,p_query_column_id=>20
,p_column_alias=>'WFDC_DOC_NO'
,p_column_display_sequence=>5
,p_column_heading=>'Wfdc Doc No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317037395261561382)
,p_query_column_id=>19
,p_column_alias=>'WFDC_DOC_PFX'
,p_column_display_sequence=>4
,p_column_heading=>'Wfdc Doc Pfx'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317047706391561523)
,p_query_column_id=>45
,p_column_alias=>'WFDC_DOC_SFX'
,p_column_display_sequence=>30
,p_column_heading=>'Wfdc Doc Sfx'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317061094371561682)
,p_query_column_id=>79
,p_column_alias=>'WFDC_EMP_ID'
,p_column_display_sequence=>64
,p_column_heading=>'Wfdc Emp Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317043412736561467)
,p_query_column_id=>34
,p_column_alias=>'WFDC_FRWD_RTN'
,p_column_display_sequence=>19
,p_column_heading=>'Wfdc Frwd Rtn'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317052751450561582)
,p_query_column_id=>59
,p_column_alias=>'WFDC_FWD_ON'
,p_column_display_sequence=>44
,p_column_heading=>'Wfdc Fwd On'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317050070425561554)
,p_query_column_id=>52
,p_column_alias=>'WFDC_FWD_PERSON'
,p_column_display_sequence=>37
,p_column_heading=>'Wfdc Fwd Person'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317066239794561767)
,p_query_column_id=>92
,p_column_alias=>'WFDC_FWD_PER_NAME'
,p_column_display_sequence=>87
,p_column_heading=>'Wfdc Fwd Per Name'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317050849304561562)
,p_query_column_id=>54
,p_column_alias=>'WFDC_FWD_TO'
,p_column_display_sequence=>39
,p_column_heading=>'Wfdc Fwd To'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317058797088561656)
,p_query_column_id=>74
,p_column_alias=>'WFDC_GROSS_AMT'
,p_column_display_sequence=>59
,p_column_heading=>'Wfdc Gross Amt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317049245699561548)
,p_query_column_id=>50
,p_column_alias=>'WFDC_INT_MSG_FLAG'
,p_column_display_sequence=>35
,p_column_heading=>'Wfdc Int Msg Flag'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317060710404561678)
,p_query_column_id=>78
,p_column_alias=>'WFDC_INV_NO'
,p_column_display_sequence=>63
,p_column_heading=>'Wfdc Inv No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317060387554561671)
,p_query_column_id=>77
,p_column_alias=>'WFDC_INV_PFX'
,p_column_display_sequence=>62
,p_column_heading=>'Wfdc Inv Pfx'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317042999088561461)
,p_query_column_id=>33
,p_column_alias=>'WFDC_JRNL_TYPE'
,p_column_display_sequence=>18
,p_column_heading=>'Wfdc Jrnl Type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317039747254561421)
,p_query_column_id=>25
,p_column_alias=>'WFDC_LVL1'
,p_column_display_sequence=>10
,p_column_heading=>'Wfdc Lvl1'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317040133527561428)
,p_query_column_id=>26
,p_column_alias=>'WFDC_LVL2'
,p_column_display_sequence=>11
,p_column_heading=>'Wfdc Lvl2'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317040568128561431)
,p_query_column_id=>27
,p_column_alias=>'WFDC_LVL3'
,p_column_display_sequence=>12
,p_column_heading=>'Wfdc Lvl3'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317040981366561434)
,p_query_column_id=>28
,p_column_alias=>'WFDC_LVL4'
,p_column_display_sequence=>13
,p_column_heading=>'Wfdc Lvl4'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317055986697561628)
,p_query_column_id=>67
,p_column_alias=>'WFDC_LVL_PRJ'
,p_column_display_sequence=>52
,p_column_heading=>'Wfdc Lvl Prj'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317048858478561543)
,p_query_column_id=>49
,p_column_alias=>'WFDC_MAIL_FLAG'
,p_column_display_sequence=>34
,p_column_heading=>'Wfdc Mail Flag'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317055146298561614)
,p_query_column_id=>65
,p_column_alias=>'WFDC_MAIL_SEND_FLAG'
,p_column_display_sequence=>50
,p_column_heading=>'Wfdc Mail Send Flag'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317044083519561478)
,p_query_column_id=>36
,p_column_alias=>'WFDC_MESSAGE'
,p_column_display_sequence=>21
,p_column_heading=>'Wfdc Message'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317053946131561596)
,p_query_column_id=>62
,p_column_alias=>'WFDC_NXT_FWD_ENTITY'
,p_column_display_sequence=>47
,p_column_heading=>'Wfdc Nxt Fwd Entity'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317052035658561573)
,p_query_column_id=>57
,p_column_alias=>'WFDC_NXT_FWD_PERSON'
,p_column_display_sequence=>42
,p_column_heading=>'Wfdc Nxt Fwd Person'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317054756341561607)
,p_query_column_id=>64
,p_column_alias=>'WFDC_NXT_FWD_PLNT'
,p_column_display_sequence=>49
,p_column_heading=>'Wfdc Nxt Fwd Plnt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317052401999561579)
,p_query_column_id=>58
,p_column_alias=>'WFDC_NXT_MESSAGE'
,p_column_display_sequence=>43
,p_column_heading=>'Wfdc Nxt Message'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317067380004561781)
,p_query_column_id=>95
,p_column_alias=>'WFDC_NXT_PROCESS'
,p_column_display_sequence=>90
,p_column_heading=>'Wfdc Nxt Process'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317051246924561565)
,p_query_column_id=>55
,p_column_alias=>'WFDC_NXT_STATUS'
,p_column_display_sequence=>40
,p_column_heading=>'Wfdc Nxt Status'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317048054434561529)
,p_query_column_id=>47
,p_column_alias=>'WFDC_PLNT'
,p_column_display_sequence=>32
,p_column_heading=>'Wfdc Plnt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317067089259561775)
,p_query_column_id=>94
,p_column_alias=>'WFDC_PLNT_DESC'
,p_column_display_sequence=>89
,p_column_heading=>'Wfdc Plnt Desc'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317043750678561473)
,p_query_column_id=>35
,p_column_alias=>'WFDC_PO_MODE'
,p_column_display_sequence=>20
,p_column_heading=>'Wfdc Po Mode'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317046904901561514)
,p_query_column_id=>43
,p_column_alias=>'WFDC_PRIORITY'
,p_column_display_sequence=>28
,p_column_heading=>'Wfdc Priority'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317041760975561445)
,p_query_column_id=>30
,p_column_alias=>'WFDC_PRJ_ID'
,p_column_display_sequence=>15
,p_column_heading=>'Wfdc Prj Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317046125407561504)
,p_query_column_id=>41
,p_column_alias=>'WFDC_PROD_ID'
,p_column_display_sequence=>26
,p_column_heading=>'Wfdc Prod Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317046514633561509)
,p_query_column_id=>42
,p_column_alias=>'WFDC_PROD_REV'
,p_column_display_sequence=>27
,p_column_heading=>'Wfdc Prod Rev'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317045643938561500)
,p_query_column_id=>40
,p_column_alias=>'WFDC_QC_INS_MODE'
,p_column_display_sequence=>25
,p_column_heading=>'Wfdc Qc Ins Mode'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317045288799561495)
,p_query_column_id=>39
,p_column_alias=>'WFDC_QC_REV'
,p_column_display_sequence=>24
,p_column_heading=>'Wfdc Qc Rev'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317042136002561450)
,p_query_column_id=>31
,p_column_alias=>'WFDC_RND_PRJ_ID'
,p_column_display_sequence=>16
,p_column_heading=>'Wfdc Rnd Prj Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317048493285561539)
,p_query_column_id=>48
,p_column_alias=>'WFDC_SELECT_FLAG'
,p_column_display_sequence=>33
,p_column_heading=>'Wfdc Select Flag'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317044483773561482)
,p_query_column_id=>37
,p_column_alias=>'WFDC_SEQ_NO'
,p_column_display_sequence=>22
,p_column_heading=>'Wfdc Seq No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317049721818561551)
,p_query_column_id=>51
,p_column_alias=>'WFDC_SMS_FLAG'
,p_column_display_sequence=>36
,p_column_heading=>'Wfdc Sms Flag'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317039021733561407)
,p_query_column_id=>23
,p_column_alias=>'WFDC_SPPLR_ID'
,p_column_display_sequence=>8
,p_column_heading=>'Wfdc Spplr Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317053166366561586)
,p_query_column_id=>60
,p_column_alias=>'WFDC_SRC_BU'
,p_column_display_sequence=>45
,p_column_heading=>'Wfdc Src Bu'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317053579025561595)
,p_query_column_id=>61
,p_column_alias=>'WFDC_SRC_PLNT'
,p_column_display_sequence=>46
,p_column_heading=>'Wfdc Src Plnt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317066646084561770)
,p_query_column_id=>93
,p_column_alias=>'WFDC_SRC_PLNT_DESC'
,p_column_display_sequence=>88
,p_column_heading=>'Wfdc Src Plnt Desc'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317054368053561601)
,p_query_column_id=>63
,p_column_alias=>'WFDC_SRC_USER'
,p_column_display_sequence=>48
,p_column_heading=>'Wfdc Src User'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317038163248561392)
,p_query_column_id=>21
,p_column_alias=>'WFDC_STATUS'
,p_column_display_sequence=>6
,p_column_heading=>'Wfdc Status'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317059570320561664)
,p_query_column_id=>75
,p_column_alias=>'WFDC_TAX_AMT'
,p_column_display_sequence=>60
,p_column_heading=>'Wfdc Tax Amt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317036939302561376)
,p_query_column_id=>18
,p_column_alias=>'WFDC_TYPE'
,p_column_display_sequence=>3
,p_column_heading=>'Wfdc Type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317065891075561753)
,p_query_column_id=>91
,p_column_alias=>'WFDC_TYPE_DESC'
,p_column_display_sequence=>86
,p_column_heading=>'Wfdc Type Desc'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317063125816561717)
,p_query_column_id=>84
,p_column_alias=>'WFDC_UPD_BY'
,p_column_display_sequence=>69
,p_column_heading=>'Wfdc Upd By'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317064253055561731)
,p_query_column_id=>87
,p_column_alias=>'WFDC_UPD_DATE'
,p_column_display_sequence=>72
,p_column_heading=>'Wfdc Upd Date'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317065504296561748)
,p_query_column_id=>90
,p_column_alias=>'WFDC_UPD_EMP_ID'
,p_column_display_sequence=>75
,p_column_heading=>'Wfdc Upd Emp Id'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317063503894561721)
,p_query_column_id=>85
,p_column_alias=>'WFDC_UPD_IP_ADDR'
,p_column_display_sequence=>70
,p_column_heading=>'Wfdc Upd Ip Addr'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317063839007561725)
,p_query_column_id=>86
,p_column_alias=>'WFDC_UPD_OS_USER'
,p_column_display_sequence=>71
,p_column_heading=>'Wfdc Upd Os User'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317042611977561456)
,p_query_column_id=>32
,p_column_alias=>'WFDC_VALUE'
,p_column_display_sequence=>17
,p_column_heading=>'Wfdc Value'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317047287753561521)
,p_query_column_id=>44
,p_column_alias=>'WFDC_WF_NO'
,p_column_display_sequence=>29
,p_column_heading=>'Wfdc Wf No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317059134935561659)
,p_query_column_id=>46
,p_column_alias=>'WFDC_WRK_CNTR'
,p_column_display_sequence=>31
,p_column_heading=>'Wfdc Wrk Cntr'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6317101731102561867)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(10824193448695132408)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:338:&SESSION.::&DEBUG.:338'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6308668210936486288)
,p_branch_name=>'Multi Approval'
,p_branch_action=>'f?p=&APP_ID.:236131010:&SESSION.::&DEBUG.::P236131010_TYPE1:MA&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P2361310102_TYPE'
,p_branch_condition_text=>'MA'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6317069411174561800)
,p_name=>'P2361310102_INT_MSG'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6318004620952816662)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6318005119530816667)
,p_name=>'P2361310102_INT_MSG_1'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6318004620952816662)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6317068562706561798)
,p_name=>'P2361310102_MAIL_FLAG'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6318004620952816662)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6318004863643816665)
,p_name=>'P2361310102_MAIL_FLAG_1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6318004620952816662)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6317068954341561798)
,p_name=>'P2361310102_SMS_FLAG'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6318004620952816662)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6318005003684816666)
,p_name=>'P2361310102_SMS_FLAG_1'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6318004620952816662)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6308668033144486287)
,p_name=>'P2361310102_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6318004620952816662)
,p_item_default=>'CA'
,p_prompt=>'&nbsp'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Cards View;CA,Tabular View;MA'
,p_cHeight=>1
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6317068136717561796)
,p_name=>'P2361310102_WF_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6318004620952816662)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6318004764791816664)
,p_name=>'P2361310102_WF_NO_1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6318004620952816662)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6317067801509561786)
,p_name=>'P2361310102_WF_SRCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10819691534941868978)
,p_prompt=>'Search'
,p_placeholder=>'Search'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge:margin-bottom-sm'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6318004652213816663)
,p_name=>'P2361310102_WF_SRCH_1'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6318004620952816662)
,p_prompt=>'Search'
,p_placeholder=>'Search'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578510291505431)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--xlarge:margin-bottom-sm'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6317104385735561945)
,p_name=>'Int. Msg.'
,p_static_id=>'int-msg'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2361310102_INT_MSG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6317104845946561945)
,p_event_id=>wwv_flow_imp.id(6317104385735561945)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P2361310102_WF_NO,P2361310102_INT_MSG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P2361310102_INT_MSG = ''I'' THEN',
    '',
    '   UPDATE work_flow_doc_control',
    '      SET wfdc_int_msg_flag = DECODE(wfdc_int_msg_flag, ''Y'', ''N'', ''N'', ''Y''),',
    '          wfdc_upd_by    = :GLOBAL_USER,',
    '          wfdc_upd_date  = SYSDATE',
    '    WHERE wfdc_bu = :GLOBAL_BU',
    '      AND wfdc_wf_no = :P2361310102_WF_NO;',
    '      ',
    '   ',
    '   COMMIT;',
    '',
    'END IF;',
    '      ')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6317105367689561945)
,p_event_id=>wwv_flow_imp.id(6317104385735561945)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10819691534941868978)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6317105801400561946)
,p_name=>'P2361310102_MAIL_FLAG'
,p_static_id=>'p2361310102-mail-flag'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2361310102_MAIL_FLAG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6317106251547561946)
,p_event_id=>wwv_flow_imp.id(6317105801400561946)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P2361310102_WF_NO,P2361310102_MAIL_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P2361310102_MAIL_FLAG = ''M'' THEN',
    '',
    '   UPDATE work_flow_doc_control',
    '      SET wfdc_mail_flag = DECODE(wfdc_mail_flag, ''Y'', ''N'', ''N'', ''Y''),',
    '          wfdc_upd_by    = :GLOBAL_USER,',
    '          wfdc_upd_date  = SYSDATE',
    '    WHERE wfdc_bu = :GLOBAL_BU',
    '      AND wfdc_wf_no = :P2361310102_WF_NO;',
    '      ',
    '   COMMIT;',
    '',
    'END IF;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6317106758150561946)
,p_event_id=>wwv_flow_imp.id(6317105801400561946)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10819691534941868978)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6317102198937561939)
,p_name=>'P2361310102_WF_SRCH'
,p_static_id=>'p2361310102-wf-srch'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2361310102_WF_SRCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6317102609899561942)
,p_event_id=>wwv_flow_imp.id(6317102198937561939)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10819691534941868978)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6317103029040561943)
,p_name=>'SMS Flag'
,p_static_id=>'sms-flag'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P2361310102_SMS_FLAG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6317103514375561943)
,p_event_id=>wwv_flow_imp.id(6317103029040561943)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P2361310102_WF_NO,P2361310102_SMS_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P2361310102_SMS_FLAG = ''S'' THEN',
    '',
    '   UPDATE work_flow_doc_control',
    '      SET wfdc_sms_flag = DECODE(wfdc_sms_flag, ''Y'', ''N'', ''N'', ''Y''),',
    '          wfdc_upd_by   = :GLOBAL_USER,',
    '          wfdc_upd_date = SYSDATE',
    '    WHERE wfdc_bu = :GLOBAL_BU',
    '      AND wfdc_wf_no = :P2361310102_WF_NO;',
    '   ',
    '   COMMIT;',
    '   ',
    'END IF;',
    '      ')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6317103940747561945)
,p_event_id=>wwv_flow_imp.id(6317103029040561943)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10819691534941868978)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
