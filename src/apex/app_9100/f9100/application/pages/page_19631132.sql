prompt --application/pages/page_19631132
begin
--   Manifest
--     PAGE: 19631132
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
 p_id=>19631132
,p_name=>'Prod. Comp.  Entry(Mach. Automatic)'
,p_alias=>'PROD-COMP-ENTRY-MACH-AUTOMATIC1'
,p_step_title=>'Prod. Comp.  Entry(Mach. Automatic)'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-table {',
'    border-collapse: collapse;',
'    table-layout: auto;',
'    border-spacing: 0;',
'    white-space: nowrap;',
'    word-wrap: break-word;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6604324991028791434)
,p_plug_name=>'Machine Automatic'
,p_static_id=>'machine-automatic'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT "ROWID",',
'       "MPCH_BU",',
'       "MPCH_PLNT",',
'       "MPCH_DOC_NO",',
'       "MPCH_DOC_DATE",',
'       "MPCH_MCHN_ID",',
'		 (SELECT MFGR_NAME1 FROM mfg_resources',
'        WHERE MFGR_BU=MPCH_BU',
'        AND MFGR_RES_ID=MPCH_MCHN_ID)Machine,',
'       "MPCH_SHIFT_ID",',
'		 (SELECT shifthd_desc1',
'       FROM shifts_hd',
'       WHERE shifthd_bu = MPCH_BU',
'        AND shifthd_plnt = MPCH_PLNT',
'        AND shifthd_shift_id = MPCH_SHIFT_ID)Shift,',
'       (To_Char(MPCH_TIME_FROM, ''HH24:MI:SS'')) "Time From",',
'	   (To_Char(MPCH_TIME_TO, ''HH24:MI:SS'')) "Time To",',
'       "MPCH_TOT_HRS",',
'       "MPCH_TOT_MI",',
'       "MPCH_IDLE_HRS",',
'       "MPCH_IDLE_MI",',
'       "MPCH_OPER_1_ID",',
'	   (SELECT emp_first_name1',
'       FROM employees',
'      WHERE emp_bu = MPCH_BU ',
'		AND emp_emp_id = MPCH_OPER_1_ID)Operator1,',
'       "MPCH_OPER_2_ID",',
'		 (SELECT emp_first_name1',
'       FROM employees',
'      WHERE emp_bu = MPCH_BU ',
'		AND emp_emp_id = MPCH_OPER_2_ID)Operator2,',
'       "MPCH_PROD_ID",',
'       "MPCH_PROD_REV",',
'		 (SELECT PROD_DESC11 FROM PRODUCTS',
'		 WHERE PROD_BU=MPCH_BU',
'		 AND PROD_ID=MPCH_PROD_ID',
'		 AND PROD_REV=MPCH_PROD_REV)Item_Desc,',
'       "MPCH_PLAN_QTY",',
'       "MPCH_COMP_QTY",',
'       "MPCH_ACC_QTY",',
'       "MPCH_PRIM_REJ",',
'       "MPCH_SEC_REJ",',
'       "MPCH_STATUS",',
'       "MPCH_OPER_3_ID",',
'       "MPCH_OPER_4_ID",',
'       "MPCH_QC_REQ_FLAG",',
'       decode("MPCH_PROC_MOVE_TYPE",''O'',''Single'',''T'',''Multiple'')"Proc. Type",',
'       "MPCH_OPRN_ID",',
'		    (SELECT mfgo_desc1',
'            FROM mfg_oprns,mfg_oprns_plnt',
'           WHERE mfgo_bu = mfgop_bu',
'             AND mfgo_oprn_id  = mfgop_oprn_id',
'             AND mfgop_bu      =   MPCH_BU',
'             AND (mfgop_plnt   = MPCH_PLNT OR MPCH_PLNT IS NULL)',
'             AND mfgop_oprn_id = MPCH_OPRN_ID)Process,',
'       "MPCH_ENTRY_TYPE",',
'       "MPCH_PRE_PROC_REJ_QTY",',
'       "MPCH_INJ_FLAG",',
'       "MPCH_SEC_FLAG",',
'       "MPCH_ASSEM_FLAG",',
'       "MPCH_REMARKS",',
'       "MPCH_UNIT_WEIGHT",',
'       "MPCH_INC_JRNL",',
'       "MPCH_CRATE_ID",',
'       "MPCH_CRE_BY",',
'       "MPCH_CRE_IP_ADDR",',
'       "MPCH_CRE_OS_USER",',
'       "MPCH_CRE_DATE",',
'       "MPCH_UPD_BY",',
'       "MPCH_UPD_IP_ADDR",',
'       "MPCH_UPD_OS_USER",',
'       "MPCH_UPD_DATE",',
'       "MPCH_CUTR_SIZE",',
'       "MPCH_SCREW_SPEED",',
'       "MPCH_BATCH_NO",',
'       "MPCH_LOT_NO",',
'       "MPCH_SYS_LS_NO",',
'       "MPCH_SOURCE_ID",',
'       "MPCH_SOURCE_TYPE",',
'       "MPCH_NO_OF_YARN",',
'       "MPCH_YARN_DENIER",',
'       "MPCH_MAX_YARN",',
'       "MPCH_BEAM_CODE",',
'       "MPCH_BEAM_WGT",',
'       "MPCH_GROSS_WGT",',
'       "MPCH_MC_RPM",',
'       "MPCH_COLOR",',
'       "MPCH_WIDTH",',
'       "MPCH_TEMP_Z1",',
'       "MPCH_TEMP_Z2",',
'       "MPCH_TEMP_Z3",',
'       "MPCH_START_CNT",',
'       "MPCH_ENT_CNT",',
'       "MPCH_GSM",',
'       "MPCH_TOT",',
'       "MPCH_CRE_EMP_ID",',
'       "MPCH_UPD_EMP_ID",',
'       "MPCH_PROC_TBL",',
'       "MPCH_FAB_PROD_DATE",',
'       "MPCH_ROLL_NO",',
'       "MPCH_PROD_ORD_NO",',
'       "MPCH_PROC_START_DATE",',
'       "MPCH_PROC_END_DATE",',
'       "MPCH_IDLE_START_DATE",',
'       "MPCH_IDLE_END_DATE",',
'       sys.DBMS_LOB.getlength ("MPCH_IMAGE") "MPCH_IMAGE",',
'       "MPCH_MIME_TYPE",',
'       "MPCH_FILE_NAME",',
'       "MPCH_OPRN_LN_SEQ",',
'       "MPCH_TSA_DOC_NO",',
'       "MPCH_CRE_INSP",',
'       "MPCH_HEIGHT",',
'       "MPCH_PROJ_ID",',
'       "MPCH_CYCLE_TIME_STD",',
'       "MPCH_NO_OF_CVTY_STD",',
'       "MPCH_CYCLE_TIME_ACT",',
'       "MPCH_NO_OF_CVTY_ACT",',
'       "MPCH_NO_OF_BOX_PACKED",',
'       "MPCH_QTY_PER_BOX",',
'       "MPCH_UNPACKED_QTY",',
'       "MPCH_END_COUNTER",',
'       "MPCH_STD_CYCLE_HRS",',
'       "MPCH_STD_CYCLE_SECS",',
'       "MPCH_ACT_CYCLE_HRS",',
'       "MPCH_ACT_CYCLE_SECS",',
'       "MPCH_STKNG_NO",',
'       "MPCH_STKNG_HEIGHT",',
'       "MPCH_HEAT_NO",',
'       "MPCH_T_FROM",',
'       "MPCH_T_TO",',
'       "MPCH_SEQ_NO",',
'       "MPCH_CAST_DOC_NO",',
'       "MPCH_CAST_SEQ_NO",',
'       "MPCH_DOWNTIME_HRS",',
'       "MPCH_SHIFT_HRS",',
'       "MPCH_LOC_ID",',
'       "MPCH_REJ_REFERENCE",',
'       "MPCH_SOU_DOC_NO",',
'       "MPCH_RM_PROD_ID",',
'       "MPCH_RM_PROD_REV",',
'       "MPCH_RM_QTY"',
'  FROM "MCNG_PROC_COMP_HD"',
'  --WHERE MPCH_BU=''SKSMH'''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Machine Automatic'
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
 p_id=>wwv_flow_imp.id(6604325379909791434)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:1963113201:&SESSION.::&DEBUG.:RP:P1963113201_ROWID:\#ROWID#\'
,p_detail_link_text=>'<span aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>'
,p_internal_uid=>1122363544366180406
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597108399829982745)
,p_db_column_name=>'ITEM_DESC'
,p_display_order=>164
,p_column_identifier=>'DO'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597107865264982740)
,p_db_column_name=>'MACHINE'
,p_display_order=>124
,p_column_identifier=>'DK'
,p_column_label=>'Machine'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604332942329791481)
,p_db_column_name=>'MPCH_ACC_QTY'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Acc. Qty.'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604363600524791707)
,p_db_column_name=>'MPCH_ACT_CYCLE_HRS'
,p_display_order=>97
,p_column_identifier=>'CS'
,p_column_label=>'Mpch Act Cycle Hrs'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604363947134791721)
,p_db_column_name=>'MPCH_ACT_CYCLE_SECS'
,p_display_order=>98
,p_column_identifier=>'CT'
,p_column_label=>'Mpch Act Cycle Secs'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604338162748791528)
,p_db_column_name=>'MPCH_ASSEM_FLAG'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Mpch Assem Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604344082368791560)
,p_db_column_name=>'MPCH_BATCH_NO'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'Mpch Batch No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604347250395791587)
,p_db_column_name=>'MPCH_BEAM_CODE'
,p_display_order=>56
,p_column_identifier=>'BD'
,p_column_label=>'Mpch Beam Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604347726664791588)
,p_db_column_name=>'MPCH_BEAM_WGT'
,p_display_order=>57
,p_column_identifier=>'BE'
,p_column_label=>'Mpch Beam Wgt'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604325898734791443)
,p_db_column_name=>'MPCH_BU'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Mpch Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604366799059791748)
,p_db_column_name=>'MPCH_CAST_DOC_NO'
,p_display_order=>105
,p_column_identifier=>'DA'
,p_column_label=>'Mpch Cast Doc No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604367220512791749)
,p_db_column_name=>'MPCH_CAST_SEQ_NO'
,p_display_order=>106
,p_column_identifier=>'DB'
,p_column_label=>'Mpch Cast Seq No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604348837346791593)
,p_db_column_name=>'MPCH_COLOR'
,p_display_order=>60
,p_column_identifier=>'BH'
,p_column_label=>'Mpch Color'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604332595863791479)
,p_db_column_name=>'MPCH_COMP_QTY'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Comp. Qty.'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604339804446791535)
,p_db_column_name=>'MPCH_CRATE_ID'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Mpch Crate Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604340219324791537)
,p_db_column_name=>'MPCH_CRE_BY'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Mpch Cre By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604341375494791545)
,p_db_column_name=>'MPCH_CRE_DATE'
,p_display_order=>41
,p_column_identifier=>'AO'
,p_column_label=>'Mpch Cre Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604352522356791632)
,p_db_column_name=>'MPCH_CRE_EMP_ID'
,p_display_order=>69
,p_column_identifier=>'BQ'
,p_column_label=>'Mpch Cre Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604358418000791670)
,p_db_column_name=>'MPCH_CRE_INSP'
,p_display_order=>84
,p_column_identifier=>'CF'
,p_column_label=>'Mpch Cre Insp'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604340587429791538)
,p_db_column_name=>'MPCH_CRE_IP_ADDR'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Mpch Cre Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604341025406791542)
,p_db_column_name=>'MPCH_CRE_OS_USER'
,p_display_order=>40
,p_column_identifier=>'AN'
,p_column_label=>'Mpch Cre Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604343296998791556)
,p_db_column_name=>'MPCH_CUTR_SIZE'
,p_display_order=>46
,p_column_identifier=>'AT'
,p_column_label=>'Mpch Cutr Size'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604360416201791687)
,p_db_column_name=>'MPCH_CYCLE_TIME_ACT'
,p_display_order=>89
,p_column_identifier=>'CK'
,p_column_label=>'Mpch Cycle Time Act'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604359614604791682)
,p_db_column_name=>'MPCH_CYCLE_TIME_STD'
,p_display_order=>87
,p_column_identifier=>'CI'
,p_column_label=>'Mpch Cycle Time Std'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604327043903791448)
,p_db_column_name=>'MPCH_DOC_DATE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604326695132791446)
,p_db_column_name=>'MPCH_DOC_NO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604367550203791751)
,p_db_column_name=>'MPCH_DOWNTIME_HRS'
,p_display_order=>107
,p_column_identifier=>'DC'
,p_column_label=>'Mpch Downtime Hrs'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604362349660791699)
,p_db_column_name=>'MPCH_END_COUNTER'
,p_display_order=>94
,p_column_identifier=>'CP'
,p_column_label=>'Mpch End Counter'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604336555369791507)
,p_db_column_name=>'MPCH_ENTRY_TYPE'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Mpch Entry Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604351237692791624)
,p_db_column_name=>'MPCH_ENT_CNT'
,p_display_order=>66
,p_column_identifier=>'BN'
,p_column_label=>'Mpch Ent Cnt'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604353724928791642)
,p_db_column_name=>'MPCH_FAB_PROD_DATE'
,p_display_order=>72
,p_column_identifier=>'BT'
,p_column_label=>'Mpch Fab Prod Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604357202163791663)
,p_db_column_name=>'MPCH_FILE_NAME'
,p_display_order=>81
,p_column_identifier=>'CC'
,p_column_label=>'Mpch File Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604348128132791590)
,p_db_column_name=>'MPCH_GROSS_WGT'
,p_display_order=>58
,p_column_identifier=>'BF'
,p_column_label=>'Mpch Gross Wgt'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604351714673791626)
,p_db_column_name=>'MPCH_GSM'
,p_display_order=>67
,p_column_identifier=>'BO'
,p_column_label=>'Mpch Gsm'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604365227408791731)
,p_db_column_name=>'MPCH_HEAT_NO'
,p_display_order=>101
,p_column_identifier=>'CW'
,p_column_label=>'Mpch Heat No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604358824356791676)
,p_db_column_name=>'MPCH_HEIGHT'
,p_display_order=>85
,p_column_identifier=>'CG'
,p_column_label=>'Mpch Height'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604356014202791654)
,p_db_column_name=>'MPCH_IDLE_END_DATE'
,p_display_order=>78
,p_column_identifier=>'BZ'
,p_column_label=>'Mpch Idle End Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604329800913791462)
,p_db_column_name=>'MPCH_IDLE_HRS'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Mpch Idle Hrs'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604330145106791463)
,p_db_column_name=>'MPCH_IDLE_MI'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Mpch Idle Mi'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604355606997791653)
,p_db_column_name=>'MPCH_IDLE_START_DATE'
,p_display_order=>77
,p_column_identifier=>'BY'
,p_column_label=>'Mpch Idle Start Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604356363345791654)
,p_db_column_name=>'MPCH_IMAGE'
,p_display_order=>79
,p_column_identifier=>'CA'
,p_column_label=>'Mpch Image'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DOWNLOAD:MCNG_PROC_COMP_HD:MPCH_IMAGE:ROWID'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604339427550791534)
,p_db_column_name=>'MPCH_INC_JRNL'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Mpch Inc Jrnl'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604337412720791517)
,p_db_column_name=>'MPCH_INJ_FLAG'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Mpch Inj Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604368323873791757)
,p_db_column_name=>'MPCH_LOC_ID'
,p_display_order=>109
,p_column_identifier=>'DE'
,p_column_label=>'Mpch Loc Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604344496921791565)
,p_db_column_name=>'MPCH_LOT_NO'
,p_display_order=>49
,p_column_identifier=>'AW'
,p_column_label=>'Mpch Lot No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604346863304791584)
,p_db_column_name=>'MPCH_MAX_YARN'
,p_display_order=>55
,p_column_identifier=>'BC'
,p_column_label=>'Mpch Max Yarn'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604327486375791451)
,p_db_column_name=>'MPCH_MCHN_ID'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Mpch Mchn Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604348475472791592)
,p_db_column_name=>'MPCH_MC_RPM'
,p_display_order=>59
,p_column_identifier=>'BG'
,p_column_label=>'Mpch Mc Rpm'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604356773119791659)
,p_db_column_name=>'MPCH_MIME_TYPE'
,p_display_order=>80
,p_column_identifier=>'CB'
,p_column_label=>'Mpch Mime Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604361170908791692)
,p_db_column_name=>'MPCH_NO_OF_BOX_PACKED'
,p_display_order=>91
,p_column_identifier=>'CM'
,p_column_label=>'Mpch No Of Box Packed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604360777182791688)
,p_db_column_name=>'MPCH_NO_OF_CVTY_ACT'
,p_display_order=>90
,p_column_identifier=>'CL'
,p_column_label=>'Mpch No Of Cvty Act'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604359967635791685)
,p_db_column_name=>'MPCH_NO_OF_CVTY_STD'
,p_display_order=>88
,p_column_identifier=>'CJ'
,p_column_label=>'Mpch No Of Cvty Std'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604346072149791579)
,p_db_column_name=>'MPCH_NO_OF_YARN'
,p_display_order=>53
,p_column_identifier=>'BA'
,p_column_label=>'Mpch No Of Yarn'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604330568864791465)
,p_db_column_name=>'MPCH_OPER_1_ID'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Mpch Oper 1 Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604330986252791467)
,p_db_column_name=>'MPCH_OPER_2_ID'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Mpch Oper 2 Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604334552575791488)
,p_db_column_name=>'MPCH_OPER_3_ID'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Mpch Oper 3 Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604334995168791492)
,p_db_column_name=>'MPCH_OPER_4_ID'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Mpch Oper 4 Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604336191222791506)
,p_db_column_name=>'MPCH_OPRN_ID'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Mpch Oprn Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604357627008791665)
,p_db_column_name=>'MPCH_OPRN_LN_SEQ'
,p_display_order=>82
,p_column_identifier=>'CD'
,p_column_label=>'Oprn. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604332149252791478)
,p_db_column_name=>'MPCH_PLAN_QTY'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Mpch Plan Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604326335304791445)
,p_db_column_name=>'MPCH_PLNT'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604337006441791513)
,p_db_column_name=>'MPCH_PRE_PROC_REJ_QTY'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Self Rej. Qty.'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604333416526791482)
,p_db_column_name=>'MPCH_PRIM_REJ'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Prim. Rej.'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604355244851791651)
,p_db_column_name=>'MPCH_PROC_END_DATE'
,p_display_order=>76
,p_column_identifier=>'BX'
,p_column_label=>'Mpch Proc End Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604354842416791649)
,p_db_column_name=>'MPCH_PROC_START_DATE'
,p_display_order=>75
,p_column_identifier=>'BW'
,p_column_label=>'Mpch Proc Start Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604353237185791637)
,p_db_column_name=>'MPCH_PROC_TBL'
,p_display_order=>71
,p_column_identifier=>'BS'
,p_column_label=>'Mpch Proc Tbl'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604331381399791468)
,p_db_column_name=>'MPCH_PROD_ID'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604354517345791646)
,p_db_column_name=>'MPCH_PROD_ORD_NO'
,p_display_order=>74
,p_column_identifier=>'BV'
,p_column_label=>'Mpch Prod Ord No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604331776805791473)
,p_db_column_name=>'MPCH_PROD_REV'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Rev.'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604359211118791681)
,p_db_column_name=>'MPCH_PROJ_ID'
,p_display_order=>86
,p_column_identifier=>'CH'
,p_column_label=>'Mpch Proj Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604335380133791498)
,p_db_column_name=>'MPCH_QC_REQ_FLAG'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Mpch Qc Req Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604361583336791695)
,p_db_column_name=>'MPCH_QTY_PER_BOX'
,p_display_order=>92
,p_column_identifier=>'CN'
,p_column_label=>'Mpch Qty Per Box'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604368639363791762)
,p_db_column_name=>'MPCH_REJ_REFERENCE'
,p_display_order=>110
,p_column_identifier=>'DF'
,p_column_label=>'Mpch Rej Reference'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604338564182791531)
,p_db_column_name=>'MPCH_REMARKS'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Mpch Remarks'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604369472506791778)
,p_db_column_name=>'MPCH_RM_PROD_ID'
,p_display_order=>112
,p_column_identifier=>'DH'
,p_column_label=>'Mpch Rm Prod Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604369877359791779)
,p_db_column_name=>'MPCH_RM_PROD_REV'
,p_display_order=>113
,p_column_identifier=>'DI'
,p_column_label=>'Mpch Rm Prod Rev'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604370240661791782)
,p_db_column_name=>'MPCH_RM_QTY'
,p_display_order=>114
,p_column_identifier=>'DJ'
,p_column_label=>'Mpch Rm Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604354055872791643)
,p_db_column_name=>'MPCH_ROLL_NO'
,p_display_order=>73
,p_column_identifier=>'BU'
,p_column_label=>'Mpch Roll No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604343685389791557)
,p_db_column_name=>'MPCH_SCREW_SPEED'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'Mpch Screw Speed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604337740163791523)
,p_db_column_name=>'MPCH_SEC_FLAG'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Mpch Sec Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604333787371791484)
,p_db_column_name=>'MPCH_SEC_REJ'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Sec. Rej.'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604366343020791738)
,p_db_column_name=>'MPCH_SEQ_NO'
,p_display_order=>104
,p_column_identifier=>'CZ'
,p_column_label=>'Mpch Seq No'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604367863010791754)
,p_db_column_name=>'MPCH_SHIFT_HRS'
,p_display_order=>108
,p_column_identifier=>'DD'
,p_column_label=>'Mpch Shift Hrs'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604327755346791454)
,p_db_column_name=>'MPCH_SHIFT_ID'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Mpch Shift Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604345253848791576)
,p_db_column_name=>'MPCH_SOURCE_ID'
,p_display_order=>51
,p_column_identifier=>'AY'
,p_column_label=>'Mpch Source Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604345645442791578)
,p_db_column_name=>'MPCH_SOURCE_TYPE'
,p_display_order=>52
,p_column_identifier=>'AZ'
,p_column_label=>'Mpch Source Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604369036718791778)
,p_db_column_name=>'MPCH_SOU_DOC_NO'
,p_display_order=>111
,p_column_identifier=>'DG'
,p_column_label=>'Mpch Sou Doc No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604350889873791620)
,p_db_column_name=>'MPCH_START_CNT'
,p_display_order=>65
,p_column_identifier=>'BM'
,p_column_label=>'Mpch Start Cnt'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604334188477791485)
,p_db_column_name=>'MPCH_STATUS'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Mpch Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604362761822791701)
,p_db_column_name=>'MPCH_STD_CYCLE_HRS'
,p_display_order=>95
,p_column_identifier=>'CQ'
,p_column_label=>'Mpch Std Cycle Hrs'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604363135805791706)
,p_db_column_name=>'MPCH_STD_CYCLE_SECS'
,p_display_order=>96
,p_column_identifier=>'CR'
,p_column_label=>'Mpch Std Cycle Secs'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604364739370791726)
,p_db_column_name=>'MPCH_STKNG_HEIGHT'
,p_display_order=>100
,p_column_identifier=>'CV'
,p_column_label=>'Mpch Stkng Height'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604364336416791723)
,p_db_column_name=>'MPCH_STKNG_NO'
,p_display_order=>99
,p_column_identifier=>'CU'
,p_column_label=>'Mpch Stkng No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604344900815791571)
,p_db_column_name=>'MPCH_SYS_LS_NO'
,p_display_order=>50
,p_column_identifier=>'AX'
,p_column_label=>'Mpch Sys Ls No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604349676965791612)
,p_db_column_name=>'MPCH_TEMP_Z1'
,p_display_order=>62
,p_column_identifier=>'BJ'
,p_column_label=>'Mpch Temp Z1'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604350039513791613)
,p_db_column_name=>'MPCH_TEMP_Z2'
,p_display_order=>63
,p_column_identifier=>'BK'
,p_column_label=>'Mpch Temp Z2'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604350534910791617)
,p_db_column_name=>'MPCH_TEMP_Z3'
,p_display_order=>64
,p_column_identifier=>'BL'
,p_column_label=>'Mpch Temp Z3'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604352097212791629)
,p_db_column_name=>'MPCH_TOT'
,p_display_order=>68
,p_column_identifier=>'BP'
,p_column_label=>'Mpch Tot'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604328996195791459)
,p_db_column_name=>'MPCH_TOT_HRS'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Mpch Tot Hrs'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604329380337791460)
,p_db_column_name=>'MPCH_TOT_MI'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Mpch Tot Mi'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604358003244791667)
,p_db_column_name=>'MPCH_TSA_DOC_NO'
,p_display_order=>83
,p_column_identifier=>'CE'
,p_column_label=>'Mpch Tsa Doc No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604365536064791734)
,p_db_column_name=>'MPCH_T_FROM'
,p_display_order=>102
,p_column_identifier=>'CX'
,p_column_label=>'Mpch T From'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604365969050791737)
,p_db_column_name=>'MPCH_T_TO'
,p_display_order=>103
,p_column_identifier=>'CY'
,p_column_label=>'Mpch T To'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604339004085791532)
,p_db_column_name=>'MPCH_UNIT_WEIGHT'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Mpch Unit Weight'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604362030708791698)
,p_db_column_name=>'MPCH_UNPACKED_QTY'
,p_display_order=>93
,p_column_identifier=>'CO'
,p_column_label=>'Mpch Unpacked Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604341739794791549)
,p_db_column_name=>'MPCH_UPD_BY'
,p_display_order=>42
,p_column_identifier=>'AP'
,p_column_label=>'Mpch Upd By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604342925827791554)
,p_db_column_name=>'MPCH_UPD_DATE'
,p_display_order=>45
,p_column_identifier=>'AS'
,p_column_label=>'Mpch Upd Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604352844603791634)
,p_db_column_name=>'MPCH_UPD_EMP_ID'
,p_display_order=>70
,p_column_identifier=>'BR'
,p_column_label=>'Mpch Upd Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604342175090791551)
,p_db_column_name=>'MPCH_UPD_IP_ADDR'
,p_display_order=>43
,p_column_identifier=>'AQ'
,p_column_label=>'Mpch Upd Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604342465033791553)
,p_db_column_name=>'MPCH_UPD_OS_USER'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'Mpch Upd Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604349261819791604)
,p_db_column_name=>'MPCH_WIDTH'
,p_display_order=>61
,p_column_identifier=>'BI'
,p_column_label=>'Mpch Width'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604346448412791581)
,p_db_column_name=>'MPCH_YARN_DENIER'
,p_display_order=>54
,p_column_identifier=>'BB'
,p_column_label=>'Mpch Yarn Denier'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597108046078982742)
,p_db_column_name=>'OPERATOR1'
,p_display_order=>134
,p_column_identifier=>'DL'
,p_column_label=>'Operator 1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597108335437982744)
,p_db_column_name=>'OPERATOR2'
,p_display_order=>154
,p_column_identifier=>'DN'
,p_column_label=>'Operator 2'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597108464798982746)
,p_db_column_name=>'PROCESS'
,p_display_order=>174
,p_column_identifier=>'DP'
,p_column_label=>'Process'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597108542811982747)
,p_db_column_name=>'Proc. Type'
,p_display_order=>184
,p_column_identifier=>'DQ'
,p_column_label=>'Proc. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6604325446060791434)
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
 p_id=>wwv_flow_imp.id(6597108185478982743)
,p_db_column_name=>'SHIFT'
,p_display_order=>144
,p_column_identifier=>'DM'
,p_column_label=>'Shift'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597108828584982749)
,p_db_column_name=>'Time From'
,p_display_order=>194
,p_column_identifier=>'DS'
,p_column_label=>'Time From'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6597108837105982750)
,p_db_column_name=>'Time To'
,p_display_order=>204
,p_column_identifier=>'DT'
,p_column_label=>'Time To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6604386327769799160)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'11224245'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'MPCH_PLNT:MPCH_DOC_DATE:MPCH_DOC_NO:MACHINE:OPERATOR1:OPERATOR2:SHIFT:MPCH_PROD_ID:MPCH_PROD_REV:ITEM_DESC:Time From:Time To:PROCESS:MPCH_OPRN_LN_SEQ:MPCH_COMP_QTY:MPCH_ACC_QTY:MPCH_PRIM_REJ:MPCH_SEC_REJ:MPCH_PRE_PROC_REJ_QTY:Proc. Type'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6604370811892791784)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6604324991028791434)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1963113201:&SESSION.::&DEBUG.:1963113201'
);
wwv_flow_imp.component_end;
end;
/
