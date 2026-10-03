prompt --application/pages/page_00090
begin
--   Manifest
--     PAGE: 00090
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
 p_id=>90
,p_name=>' Attachment'
,p_alias=>'90-ATTACHMENT'
,p_page_mode=>'MODAL'
,p_step_title=>'Attachment'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12336364190602622721)
,p_plug_name=>'Attachment'
,p_static_id=>'attachment'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT dm_bu,',
'       dm_doc_no,',
'       dm_vou_level,',
'       dm_vou_type,',
'       dm_vou_plnt,',
'       dm_vou_pfx,',
'       dm_vou_no,',
'       dm_vou_seq_no,',
'       dm_party_type,',
'       dm_party_id,',
'       dm_prod_id,',
'       dm_prod_rev,',
'       dm_file_narr,',
'       dm_doc_type,',
'       dm_doc_name,',
'       dm_blob,',
'       dm_cre_by,',
'       dm_cre_ip_addr,',
'       dm_cre_os_user,',
'       dm_cre_date,',
'       dm_upd_by,',
'       dm_upd_ip_addr,',
'       dm_upd_os_user,',
'       dm_upd_date,',
'       dm_cre_emp_id,',
'       dm_upd_emp_id,',
'       dm_attach_id,',
'       dm_bus_fun_id,',
'       dm_block_name,',
'       dm_table_name,',
'       dm_mime_type,',
'       dm_file_name,',
'       dm_party_name,',
'       dm_loc_type,',
'       dm_attach_dir,',
'       dm_module,',
'       dm_vou_seq2_no,',
'       dm_vou_seq3_no,',
'       dm_vou_seq4_no,',
'       dm_mail_flag,',
'       dm_att_seq_no,',
'       ''<span class="fa fa-download" aria-hidden="true" style = "color:green;font-weight:bold;"></span>'' Download,',
'		 ''<span class="fa fa-remove" aria-hidden="true" style = "color:red;font-weight:bold;"></span>'' Del,',
'       dm_type_desc',
'  FROM doc_mgmt',
' WHERE dm_bu = :Global_bu',
' AND dm_vou_type = :P90_DM_VOU_TYPE',
' AND  dm_vou_no   = :P90_DM_VOU_NO',
'--    AND (dm_vou_type = :P90_DM_VOU_TYPE OR :P90_DM_VOU_TYPE IS NULL) ',
'	AND (dm_vou_pfx  = :P90_DM_VOU_PFX  OR :P90_DM_VOU_PFX IS NULL) ',
'	-- AND (dm_vou_no   = :P90_DM_VOU_NO   OR :P90_DM_VOU_NO IS NULL) ',
'	AND (dm_party_id = :P90_DM_PARTY_ID OR :P90_DM_PARTY_ID IS NULL) ',
'	AND (dm_party_type = :P90_DM_PARTY_TYPE OR :P90_DM_PARTY_TYPE IS NULL) ',
'order by dm_att_seq_no asc',
'	'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P90_DM_VOU_TYPE,P90_DM_VOU_PFX,P90_DM_VOU_NO,P90_DM_PARTY_ID,P90_DM_PARTY_TYPE'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(12336364288850622722)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>6854402453307011694
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297757723400151741)
,p_db_column_name=>'DEL'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Action'
,p_column_link=>'javascript:$s(''P37_GB_DOC_NO'',''#DM_DOC_NO#'');apex.confirm("Do you want to Delete the document ? ",''DELETE'');'
,p_column_linktext=>'#DEL#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297754528948151738)
,p_db_column_name=>'DM_ATTACH_DIR'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Dm Attach Dir'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297751400296151733)
,p_db_column_name=>'DM_ATTACH_ID'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Dm Attach Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297756988048151739)
,p_db_column_name=>'DM_ATT_SEQ_NO'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297746950523151730)
,p_db_column_name=>'DM_BLOB'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Dm Blob'
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
 p_id=>wwv_flow_imp.id(9297752139968151735)
,p_db_column_name=>'DM_BLOCK_NAME'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Dm Block Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297740972237151719)
,p_db_column_name=>'DM_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Dm Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297751776262151733)
,p_db_column_name=>'DM_BUS_FUN_ID'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Dm Bus Fun Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297747340557151730)
,p_db_column_name=>'DM_CRE_BY'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Dm Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297748573061151731)
,p_db_column_name=>'DM_CRE_DATE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Dm Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297750579126151733)
,p_db_column_name=>'DM_CRE_EMP_ID'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Dm Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297747733462151730)
,p_db_column_name=>'DM_CRE_IP_ADDR'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Dm Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297748209592151731)
,p_db_column_name=>'DM_CRE_OS_USER'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Dm Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297746572319151730)
,p_db_column_name=>'DM_DOC_NAME'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'File Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297741404119151724)
,p_db_column_name=>'DM_DOC_NO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Dm Doc No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297746122007151730)
,p_db_column_name=>'DM_DOC_TYPE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Dm Doc Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297753413635151736)
,p_db_column_name=>'DM_FILE_NAME'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297745766693151728)
,p_db_column_name=>'DM_FILE_NARR'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297754174732151738)
,p_db_column_name=>'DM_LOC_TYPE'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Dm Loc Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297756600359151739)
,p_db_column_name=>'DM_MAIL_FLAG'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Dm Mail Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297752944168151736)
,p_db_column_name=>'DM_MIME_TYPE'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Dm Mime Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297754941459151738)
,p_db_column_name=>'DM_MODULE'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Dm Module'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297744577542151727)
,p_db_column_name=>'DM_PARTY_ID'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Dm Party Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297753793605151738)
,p_db_column_name=>'DM_PARTY_NAME'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Dm Party Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297744163153151727)
,p_db_column_name=>'DM_PARTY_TYPE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Dm Party Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297744933433151728)
,p_db_column_name=>'DM_PROD_ID'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Dm Prod Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297745338216151728)
,p_db_column_name=>'DM_PROD_REV'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Dm Prod Rev'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297752518186151736)
,p_db_column_name=>'DM_TABLE_NAME'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Dm Table Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8089852229955128856)
,p_db_column_name=>'DM_TYPE_DESC'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Doc. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297748989569151731)
,p_db_column_name=>'DM_UPD_BY'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Dm Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297750189516151733)
,p_db_column_name=>'DM_UPD_DATE'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Dm Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297750982711151733)
,p_db_column_name=>'DM_UPD_EMP_ID'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Dm Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297749341174151731)
,p_db_column_name=>'DM_UPD_IP_ADDR'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Dm Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297749786777151731)
,p_db_column_name=>'DM_UPD_OS_USER'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Dm Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297741748244151724)
,p_db_column_name=>'DM_VOU_LEVEL'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Dm Vou Level'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297743344015151727)
,p_db_column_name=>'DM_VOU_NO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Dm Vou No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297742978781151725)
,p_db_column_name=>'DM_VOU_PFX'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Dm Vou Pfx'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297742543510151725)
,p_db_column_name=>'DM_VOU_PLNT'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Dm Vou Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297755374544151739)
,p_db_column_name=>'DM_VOU_SEQ2_NO'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Dm Vou Seq2 No'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297755779272151739)
,p_db_column_name=>'DM_VOU_SEQ3_NO'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Dm Vou Seq3 No'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297756129795151739)
,p_db_column_name=>'DM_VOU_SEQ4_NO'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Dm Vou Seq4 No'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297743736455151727)
,p_db_column_name=>'DM_VOU_SEQ_NO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Dm Vou Seq No'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297742159797151725)
,p_db_column_name=>'DM_VOU_TYPE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Dm Vou Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9297757384248151741)
,p_db_column_name=>'DOWNLOAD'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Download'
,p_column_link=>'javascript:window.open(''&GLOBAL_API_URL.attachment/download/#DM_BU#/#DM_DOC_NO#'', ''_self'');'
,p_column_linktext=>'#DOWNLOAD#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12342797951994048858)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'15183026'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'DM_ATT_SEQ_NO:DM_TYPE_DESC:DM_FILE_NARR:DM_DOC_NAME:DOWNLOAD:DEL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13084519928643125966)
,p_plug_name=>'Attachment'
,p_static_id=>'attachment-2'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P90_ROWID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10823477490742895535)
,p_plug_name=>'Parameter'
,p_static_id=>'parameter'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7007633067538397632)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(13084519928643125966)
,p_button_name=>'Upload'
,p_static_id=>'upload'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--link:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload'
,p_icon_css_classes=>'fa-upload'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7007641294301397728)
,p_branch_name=>'Go To Page &P37_PAGE_NO.'
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(7007633067538397632)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9297751386610151882)
,p_name=>'P90_DM_DOC_NO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(13084519928643125966)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9297754586442151883)
,p_name=>'P90_DM_MODULE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(13084519928643125966)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9297754129625151883)
,p_name=>'P90_DM_PARTY_ID'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(13084519928643125966)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9297753772202151883)
,p_name=>'P90_DM_PARTY_TYPE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(13084519928643125966)
,p_item_default=>'S'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9297753375108151883)
,p_name=>'P90_DM_SEQ_NO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(13084519928643125966)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9297751788500151882)
,p_name=>'P90_DM_VOU_LEVEL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(13084519928643125966)
,p_item_default=>'O'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9297750962060151882)
,p_name=>'P90_DM_VOU_NO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(13084519928643125966)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9297752930076151883)
,p_name=>'P90_DM_VOU_PFX'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(13084519928643125966)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9297752562170151882)
,p_name=>'P90_DM_VOU_PLNT'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(13084519928643125966)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9297752213557151882)
,p_name=>'P90_DM_VOU_TYPE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(13084519928643125966)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8089852090668128855)
,p_name=>'P90_DOC_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(13084519928643125966)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Doc. Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT dmdt_desc d,',
'         dmdt_desc r',
'    FROM doc_mgmt_doc_type'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9297750569117151880)
,p_name=>'P90_FILE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(13084519928643125966)
,p_prompt=>'File'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-md'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'allow_multiple_files', 'N',
  'display_as', 'INLINE',
  'dropzone_title', 'Choose your File',
  'purge_file_at', 'SESSION',
  'storage_type', 'APEX_APPLICATION_TEMP_FILES')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9297750182617151879)
,p_name=>'P90_FILE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(13084519928643125966)
,p_use_cache_before_default=>'NO'
,p_prompt=>'File Name'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9297772479152151872)
,p_name=>'P90_GB_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12336364190602622721)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9297754969546151885)
,p_name=>'P90_PAGE_NO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(13084519928643125966)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9297755370717151885)
,p_name=>'P90_ROWID'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(13084519928643125966)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9297753106084151888)
,p_name=>'P90_STATUS'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(10823477490742895535)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9297753499689151890)
,p_name=>'P90_TYPE'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(10823477490742895535)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7007638842998397712)
,p_validation_name=>'FILE'
,p_static_id=>'file'
,p_validation_sequence=>10
,p_validation=>'P90_FILE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'File must be selected.'
,p_when_button_pressed=>wwv_flow_imp.id(7007633067538397632)
,p_associated_item=>wwv_flow_imp.id(9297750569117151880)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7007639314858397715)
,p_validation_name=>'FILE_NAME'
,p_static_id=>'file-name'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P90_FILE_NAME is null then ',
'return(''File Name must be entered.'');',
'end if;',
'',
'IF :P90_FILE_NAME IS NOT NULL THEN',
'DECLARE',
'	v_desc VARCHAR2(50);',
'BEGIN',
'  SELECT COUNT(*)',
'   INTO v_desc',
'   FROM doc_mgmt,',
'        prospects',
'  WHERE prosp_bu = dm_bu',
'    AND prosp_prosp_id = DM_PARTY_ID',
'    AND dm_bu = :GLOBAL_bu',
'    AND prosp_prosp_id = :P90_DM_PARTY_ID',
'    AND dm_file_narr = :P90_FILE_NAME;',
'    ',
'IF v_desc >0 THEN',
' return(''Cannot Insert Duplicate Entry.'');',
'END IF;',
'END;',
'END IF;',
'',
'if :P90_FILE_NAME is null then ',
'return(''File Name must be entered.'');',
'end if;',
'',
'',
'',
'IF :P90_FILE_NAME IS NOT NULL THEN',
'DECLARE',
'	v_desc VARCHAR2(50);',
'BEGIN',
'  SELECT COUNT(*)',
'   INTO v_desc',
'   FROM doc_mgmt',
'  WHERE DM_BU = :GLOBAL_BU',
'    AND dm_file_narr = :P90_FILE_NAME',
'	   AND dm_vou_type = :p90_dm_vou_type',
'      AND dm_vou_pfx = :P90_DM_VOU_PFX',
'      AND dm_vou_no = :P90_DM_VOU_NO;  ',
'    ',
'IF v_desc >0 THEN',
' return(''Cannot Insert Duplicate Entry.'');',
'END IF;',
'END;',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(7007633067538397632)
,p_associated_item=>wwv_flow_imp.id(9297750182617151879)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7007639980700397720)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_success_messages', 'N')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_process_success_message=>'Document Uploaded.'
,p_internal_uid=>1525678145156786692
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7007640374829397720)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Attachment'
,p_static_id=>'initialize-form-attachment'
,p_process_when_type=>'NEVER'
,p_internal_uid=>1525678539285786692
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7007640814373397721)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process For Delete Attach File'
,p_static_id=>'process-for-delete-attach-file'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'   proc_file_delete_web (:Global_bu, :P90_GB_DOC_NO);',
'   COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>1525678978829786693
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7007639592934397715)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process For  Upload File'
,p_static_id=>'process-for-upload-file'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 3/4/2023 4:55:32 PM (QP5 v5.163.1008.3004) */',
'DECLARE',
'   CURSOR C1',
'   IS',
'      SELECT dm_doc_no',
'        FROM doc_mgmt',
'       WHERE dm_bu = :global_bu',
'         AND dm_vou_pfx = :P90_DM_VOU_PFX',
'         AND dm_vou_no = :P90_DM_VOU_NO;',
'',
'   v_image        apex_application_temp_files.blob_content%TYPE;',
'   v_filename     apex_application_temp_files.filename%TYPE;',
'   v_doc_name     VARCHAR2 (200);',
'   v_doc_no       VARCHAR2 (15);',
'   v_mime_type    VARCHAR2 (200);',
'   v_att_seq_no   NUMBER (5);',
'   v_dir_name     VARCHAR2 (25);',
'',
'   CR1            C1%ROWTYPE;',
'BEGIN',
'   IF CR1.dm_doc_no IS NULL',
'   THEN',
'      SELECT NVL (MAX (TO_NUMBER (dm_doc_no)), 1000000000) + 1',
'        INTO v_doc_no',
'        FROM doc_mgmt',
'       WHERE dm_bu = :global_bu;',
'   END IF;',
'',
'-- raise_application_error(-20999,:P90_DM_VOU_TYPE||''-''||:P90_DM_VOU_PFX||''-''||:P90_DM_VOU_NO);',
'   SELECT NVL (MAX (dm_att_seq_no), 0) + 1',
'     INTO v_att_seq_no',
'     FROM doc_mgmt',
'    WHERE dm_bu = :global_bu',
'      AND dm_vou_type = :P90_DM_VOU_TYPE',
'      AND dm_module=:P90_DM_MODULE',
'      AND dm_vou_no = :P90_DM_VOU_NO;',
'',
'   SELECT blob_content,',
'          filename,',
'             SUBSTR (filename, 1, INSTR (filename, ''.'') - 1)',
'          || ''(''',
'          || v_doc_no',
'          || '')''',
'          || ''.''',
'          || SUBSTR (filename,',
'                     INSTR (filename, ''.'', -1) + 1,',
'                     LENGTH (filename) - INSTR (filename, ''.'', -1)),',
'          mime_type',
'     INTO v_image,',
'          v_filename,',
'          v_doc_name,',
'          v_mime_type',
'     FROM apex_application_temp_files',
'    WHERE UPPER (name) = UPPER (:P90_FILE);',
'',
'   IF v_image IS NOT NULL AND v_filename IS NOT NULL',
'   THEN',
'      v_dir_name := ''APEX_ATTACH_DIR'';',
'',
'      INSERT INTO doc_mgmt (dm_bu,',
'                            dm_doc_no,',
'                            dm_vou_level,',
'                            dm_vou_type,',
'                            dm_vou_plnt,',
'                            dm_vou_pfx,',
'                            dm_vou_no,',
'                            dm_vou_seq_no,',
'                            dm_party_type,',
'                            dm_party_id,',
'                            dm_prod_id,',
'                            dm_prod_rev,',
'                            dm_file_narr,',
'                            dm_doc_type,',
'                            dm_doc_name,',
'                            dm_blob,',
'                            dm_cre_by,',
'                            dm_cre_ip_addr,',
'                            dm_cre_os_user,',
'                            dm_cre_date,',
'                            dm_cre_emp_id,',
'                            dm_attach_id,',
'                            dm_bus_fun_id,',
'                            dm_block_name,',
'                            dm_table_name,',
'                            dm_mime_type,',
'                            dm_file_name,',
'                            dm_party_name,',
'                            dm_loc_type,',
'                            dm_attach_dir,',
'                            dm_module,',
'                            dm_vou_seq2_no,',
'                            dm_vou_seq3_no,',
'                            dm_vou_seq4_no,',
'                            dm_mail_flag,',
'                            dm_att_seq_no,',
'                            dm_type_desc)',
'           VALUES (:global_bu,',
'                   v_doc_no,',
'                   :P90_DM_VOU_LEVEL,',
'                   :P90_DM_VOU_TYPE,',
'                   :P90_DM_VOU_PLNT,',
'                   :P90_DM_VOU_PFX,',
'                   :P90_DM_VOU_NO,',
'                   v_att_seq_no,',
'                   :P90_DM_PARTY_TYPE,',
'                   :P90_DM_PARTY_ID,',
'                   NULL,',
'                   NULL,',
'                   :P90_FILE_NAME,',
'                   NULL,',
'                   v_doc_name,',
'                   NULL,',
'                   :global_user,',
'                   NULL,',
'                   NULL,',
'                   SYSDATE,',
'                   NULL,',
'                   NULL,',
'                   NULL,',
'                   NULL,',
'                   NULL,',
'                   V_MIME_TYPE,',
'                   v_doc_name,--v_filename,',
'                   NULL,',
'                   ''D'',',
'                   v_dir_name,',
'                   :P90_DM_MODULE,',
'                   NULL,',
'                   NULL,',
'                   NULL,',
'                   ''N'',',
'                   v_att_seq_no,',
'                   :P90_DOC_TYPE);',
'',
'',
'      proc_file_upload_web (v_image, v_dir_name, v_doc_name);',
'',
'      COMMIT;',
'   ELSE',
'      apex_error.add_error (',
'         p_message            => ''File not Attached properly, Kindly Re-attach.'',',
'         p_display_location   => apex_error.c_inline_in_notification);',
'   END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7007633067538397632)
,p_process_success_message=>'Document Uploaded.'
,p_internal_uid=>1525677757390786687
);
wwv_flow_imp.component_end;
end;
/
