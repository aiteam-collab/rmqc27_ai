prompt --application/pages/page_00189
begin
--   Manifest
--     PAGE: 00189
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
 p_id=>189
,p_name=>'Audit View'
,p_alias=>'AUDIT-VIEW'
,p_page_mode=>'MODAL'
,p_step_title=>'Audit View'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1200'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6794841966371627964)
,p_plug_name=>'Audit View'
,p_static_id=>'audit-view'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT dma_bu,',
'       dma_doc_no,',
'       nvl(dma_doc_rev,0) AS dma_doc_rev,',
'       dma_doc_no||''-''||nvl(dma_doc_rev,0) AS doc_no,',
'       dma_req_doc_no,',
'       DECODE(dma_activity_type,''A'',''Add'',''V'',''View'',''D'',''Download'',''U'',''Update'') AS dma_activity_type,',
'       DECODE(dma_activity_type,''A'',''DodgerBlue'',''V'',''Brown'',''D'',''LimeGreen'',''U'',''DarkOrange'') AS color,',
'       dma_activity_type AS dma_activity_type1,',
'       dma_user_name,',
'       dma_cre_by,',
'       to_char(dma_cre_date,''DD-MM-RRRR HH24:MI:SS'')dma_cre_date,',
'       dma_upd_by,',
'       to_char(dma_upd_date,''DD-MM-RRRR HH24:MI:SS'')dma_upd_date,',
'       dma_cre_emp_id,',
'       (SELECT (emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1) AS emp_name',
'          FROM employees',
'         WHERE emp_bu = dma_bu',
'           AND emp_emp_id = dma_cre_emp_id) dma_emp_name,',
'       (SELECT initcap(eaidv_dept_desc)',
'          FROM emp_active_info_dtl_view',
'         WHERE eaidv_bu = dma_bu',
'           AND eaidv_emp_id = dma_cre_emp_id) dma_deparment,',
'       (SELECT initcap(eaidv_pos_desc)',
'          FROM emp_active_info_dtl_view',
'         WHERE eaidv_bu = dma_bu',
'           AND eaidv_emp_id = dma_cre_emp_id) dma_pos_desc,           ',
'        dma_vou_pfx,',
'        dma_vou_no,',
'        dma_vou_seq_no,',
'        dma_type_desc,',
'        (SELECT apst_sub_type_desc',
'             FROM appl_vou_sub_types',
'            WHERE apst_bu = dma_bu AND apst_sub_type = dma_sub_vou_type) dma_sub_vou_type,',
'        dma_vou_pfx||''-''||dma_vou_no||''-''||dma_vou_seq_no AS pfx_no,',
'        to_char(dma_doc_date,''DD-MM-RRRR'') dma_doc_date,',
'        (CASE WHEN UPPER(substr(nvl(dma_doc_name,dma_file_name),instr (nvl(dma_doc_name,dma_file_name) ,''.'')+1)) IN (''XLS'',''XLSX'',''XLSM'',''XLSB'',''CSV'',''XLT(X)'') THEN',
'                 ''<span class="fa fa-file-excel-o" style="color: green ;font-weight: bold"></span>''||'' ''||nvl(dma_doc_name,dma_file_name)',
'         WHEN UPPER(substr(nvl(dma_doc_name,dma_file_name),instr (nvl(dma_doc_name,dma_file_name) ,''.'')+1)) = ''PDF''  THEN',
'                ''<span class="fa fa-file-pdf-o" style="color: red ;font-weight: bold"></span>''||'' ''||nvl(dma_doc_name,dma_file_name)',
'         WHEN  UPPER(substr(nvl(dma_doc_name,dma_file_name),instr (nvl(dma_doc_name,dma_file_name) ,''.'')+1)) = ''MP4''  THEN',
'               ''<span class="fa fa-file-video-o" style="color: deepskyblue ;font-weight: bold"></span>''||'' ''||nvl(dma_doc_name,dma_file_name)',
'         WHEN  UPPER(substr(nvl(dma_doc_name,dma_file_name),instr (nvl(dma_doc_name,dma_file_name) ,''.'')+1)) IN (''DOC'',''DOCX'',''DOT'',''DOTX'',''DOTM'',''DOCM'',''RTF'',''TXT'')  THEN',
'               ''<span class="fa fa-file-word-o" style="color: blue ;font-weight: bold"></span>''||'' ''||nvl(dma_doc_name,dma_file_name)',
'         WHEN  UPPER(substr(nvl(dma_doc_name,dma_file_name),instr (nvl(dma_doc_name,dma_file_name) ,''.'')+1)) IN (''JPEG'',''JPG'',''PNG'',''GIF'',''BMP'',''TIFF'',''WebP'')  THEN',
'               ''<span class="fa fa-file-image-o" style="color: orange ;font-weight: bold"></span>''||'' ''||nvl(dma_doc_name,dma_file_name)',
'         ELSE',
'              ''<span class="fa fa-file-word-o" style="color: blue ;font-weight: bold"></span>''||'' ''||nvl(dma_doc_name,dma_file_name)',
'         END) dma_doc_name,',
'        dma_blob,',
'        dma_mime_type,',
'        dma_file_name,',
'        dma_file_narr,',
'        dma_attach_dir,',
'        ''<span aria-hidden="true" class="fa fa-download" style="color: blue ;font-weight: bold"></span>'' download,',
'        to_char(dma_ret_date,''DD-MM-RRRR'') dma_ret_date,',
'        to_char(dma_ret_end_date,''DD-MM-RRRR HH24:MI:SS'') dma_ret_end_date,',
'        to_char(dma_due_date,''DD-MM-RRRR HH24:MI:SS'') dma_due_date,',
'        dma_tags,',
'        dma_emp_id,',
'        (SELECT TRIM (',
'                     emp_first_name1 || emp_middle_name1 || emp_last_name1)',
'           FROM employees',
'          WHERE emp_bu = dma_bu AND emp_emp_id = dma_emp_id)',
'        dma_doc_emp_name,',
'        dma_loc_id,',
'        (SELECT bupld_loc_name',
'           FROM bus_unit_plants_loc_dtls',
'          WHERE bupld_bu = dma_bu',
'            AND bupld_loc_id = dma_loc_id)dma_loc_dec,',
'        dma_party_id,',
'        (SELECT suplr_name1',
'           FROM suppliers',
'          WHERE suplr_bu = dma_bu ',
'            AND suplr_suplr_id = dma_party_id) AS dma_party_name,',
'        (SELECT (prod_desc11 || '' '' || prod_desc21)',
'           FROM products',
'          WHERE prod_bu = dma_bu',
'            AND prod_id = dma_prod_id',
'            AND prod_rev = dma_prod_rev) dma_prod_desc,',
'        dma_prod_id,',
'        dma_prod_rev,',
'        dma_entity,',
'         (SELECT bup_name1',
'             FROM bus_unit_plants',
'            WHERE bup_bu = dma_bu AND bup_plant_id = dma_plnt_id) dma_plnt_desc,',
'        dma_plnt_id,',
'        dma_notes',
'  FROM doc_mgmt_audit',
' WHERE dma_bu = :global_bu',
'   AND (dma_doc_no = :P189_DOC_NO OR :P189_DOC_NO IS NULL)',
'--    AND (dma_req_doc_no = :p136_req_doc_no OR :p136_req_doc_no IS NULL)',
' ORDER BY dma_cre_date '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P189_DOC_NO'
,p_prn_page_header=>'Audit View'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6794842025222627964)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1315321041437707762
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794844988480627980)
,p_db_column_name=>'COLOR'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794844594463627980)
,p_db_column_name=>'DMA_ACTIVITY_TYPE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Dma Activity Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794845451711627980)
,p_db_column_name=>'DMA_ACTIVITY_TYPE1'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Dma Activity Type1'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794854191160627987)
,p_db_column_name=>'DMA_ATTACH_DIR'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Dma Attach Dir'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794852606537627986)
,p_db_column_name=>'DMA_BLOB'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Dma Blob'
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
,p_heading_alignment=>'LEFT'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794842648149627973)
,p_db_column_name=>'DMA_BU'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Dma Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794846249813627981)
,p_db_column_name=>'DMA_CRE_BY'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Dma Cre By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794846680818627981)
,p_db_column_name=>'DMA_CRE_DATE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Dma Cre Date'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794847830082627983)
,p_db_column_name=>'DMA_CRE_EMP_ID'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Dma Cre Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794848648207627983)
,p_db_column_name=>'DMA_DEPARMENT'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Dma Deparment'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794851790879627984)
,p_db_column_name=>'DMA_DOC_DATE'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Dma Doc Date'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794857074556627989)
,p_db_column_name=>'DMA_DOC_EMP_NAME'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Dma Doc Emp Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794852257078627986)
,p_db_column_name=>'DMA_DOC_NAME'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Dma Doc Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794843015363627978)
,p_db_column_name=>'DMA_DOC_NO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Dma Doc No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794843446561627978)
,p_db_column_name=>'DMA_DOC_REV'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Dma Doc Rev'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794855820077627987)
,p_db_column_name=>'DMA_DUE_DATE'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Dma Due Date'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794856619283627989)
,p_db_column_name=>'DMA_EMP_ID'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Dma Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794848184161627983)
,p_db_column_name=>'DMA_EMP_NAME'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Dma Emp Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794860282156627991)
,p_db_column_name=>'DMA_ENTITY'
,p_display_order=>45
,p_column_identifier=>'AS'
,p_column_label=>'Dma Entity'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794853475764627986)
,p_db_column_name=>'DMA_FILE_NAME'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Dma File Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794853863304627986)
,p_db_column_name=>'DMA_FILE_NARR'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Dma File Narr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794857816930627989)
,p_db_column_name=>'DMA_LOC_DEC'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Dma Loc Dec'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794857472678627989)
,p_db_column_name=>'DMA_LOC_ID'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Dma Loc Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794853049790627986)
,p_db_column_name=>'DMA_MIME_TYPE'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Dma Mime Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794861473945627992)
,p_db_column_name=>'DMA_NOTES'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'Dma Notes'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794858189600627991)
,p_db_column_name=>'DMA_PARTY_ID'
,p_display_order=>40
,p_column_identifier=>'AN'
,p_column_label=>'Dma Party Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794858669906627991)
,p_db_column_name=>'DMA_PARTY_NAME'
,p_display_order=>41
,p_column_identifier=>'AO'
,p_column_label=>'Dma Party Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794860602012627992)
,p_db_column_name=>'DMA_PLNT_DESC'
,p_display_order=>46
,p_column_identifier=>'AT'
,p_column_label=>'Dma Plnt Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794861026240627992)
,p_db_column_name=>'DMA_PLNT_ID'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'Dma Plnt Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794849002077627983)
,p_db_column_name=>'DMA_POS_DESC'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Dma Pos Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794859014197627991)
,p_db_column_name=>'DMA_PROD_DESC'
,p_display_order=>42
,p_column_identifier=>'AP'
,p_column_label=>'Dma Prod Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794859463505627991)
,p_db_column_name=>'DMA_PROD_ID'
,p_display_order=>43
,p_column_identifier=>'AQ'
,p_column_label=>'Dma Prod Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794859861472627991)
,p_db_column_name=>'DMA_PROD_REV'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'Dma Prod Rev'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794844225082627980)
,p_db_column_name=>'DMA_REQ_DOC_NO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Dma Req Doc No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794855000941627987)
,p_db_column_name=>'DMA_RET_DATE'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Dma Ret Date'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794855401807627987)
,p_db_column_name=>'DMA_RET_END_DATE'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Dma Ret End Date'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794851061884627984)
,p_db_column_name=>'DMA_SUB_VOU_TYPE'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Dma Sub Vou Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794856283770627989)
,p_db_column_name=>'DMA_TAGS'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Dma Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794850609887627984)
,p_db_column_name=>'DMA_TYPE_DESC'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Dma Type Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794847031413627981)
,p_db_column_name=>'DMA_UPD_BY'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Dma Upd By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794847415715627981)
,p_db_column_name=>'DMA_UPD_DATE'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Dma Upd Date'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794845796403627980)
,p_db_column_name=>'DMA_USER_NAME'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Dma User Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794849817485627983)
,p_db_column_name=>'DMA_VOU_NO'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Dma Vou No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794849412096627983)
,p_db_column_name=>'DMA_VOU_PFX'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Dma Vou Pfx'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794850222875627984)
,p_db_column_name=>'DMA_VOU_SEQ_NO'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Dma Vou Seq No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794843789119627978)
,p_db_column_name=>'DOC_NO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Doc No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794854624224627987)
,p_db_column_name=>'DOWNLOAD'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Download'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6794851416365627984)
,p_db_column_name=>'PFX_NO'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Pfx No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6794868753434655461)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'13153478'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DMA_BU:DMA_DOC_NO:DMA_DOC_REV:DOC_NO:DMA_REQ_DOC_NO:DMA_ACTIVITY_TYPE:COLOR:DMA_ACTIVITY_TYPE1:DMA_USER_NAME:DMA_CRE_BY:DMA_CRE_DATE:DMA_UPD_BY:DMA_UPD_DATE:DMA_CRE_EMP_ID:DMA_EMP_NAME:DMA_DEPARMENT:DMA_POS_DESC:DMA_VOU_PFX:DMA_VOU_NO:DMA_VOU_SEQ_NO:'
||'DMA_TYPE_DESC:DMA_SUB_VOU_TYPE:PFX_NO:DMA_DOC_DATE:DMA_DOC_NAME:DMA_BLOB:DMA_MIME_TYPE:DMA_FILE_NAME:DMA_FILE_NARR:DMA_ATTACH_DIR:DOWNLOAD:DMA_RET_DATE:DMA_RET_END_DATE:DMA_DUE_DATE:DMA_TAGS:DMA_EMP_ID:DMA_DOC_EMP_NAME:DMA_LOC_ID:DMA_LOC_DEC:DMA_PART'
||'Y_ID:DMA_PARTY_NAME:DMA_PROD_DESC:DMA_PROD_ID:DMA_PROD_REV:DMA_ENTITY:DMA_PLNT_DESC:DMA_PLNT_ID:DMA_NOTES'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6794353728156952604)
,p_name=>'P189_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6794841966371627964)
,p_prompt=>'Doc No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp.component_end;
end;
/
