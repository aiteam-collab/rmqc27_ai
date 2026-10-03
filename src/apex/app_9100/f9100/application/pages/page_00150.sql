prompt --application/pages/page_00150
begin
--   Manifest
--     PAGE: 00150
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
 p_id=>150
,p_name=>'Expiry Documents'
,p_alias=>'EXPIRY-DOCUMENTS'
,p_page_mode=>'MODAL'
,p_step_title=>'Expiry Documents'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-table {',
'          white-space: nowrap;',
'          word-wrap: break-word;',
'  }'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1400'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5971958339273163130)
,p_plug_name=>'Expiry Documents'
,p_static_id=>'expiry-documents'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT dm_bu,',
'       nvl(dm_entity,(SELECT bu_id',
'        FROM business_units',
'		WHERE bu_id = :global_bu))entity_desc,',
'       dm_doc_no,',
'       dm_req_doc_no,',
'       dm_req_doc_rev,',
'       TRUNC(nvl(dm_upd_date,dm_cre_date))vou_date,',
'       decode(dm_status,''A'',''Available'',''D'',''Deleted'')dm_type,',
'       dm_vou_level,',
'       decode(dm_vou_level,''O'',''Order Level'',''L'',''Line Level'',''T'',''Third Level'',''F'',''Fourth Level'')dm_vou_level_desc,',
'       dm_vou_type,',
'       (SELECT apst_sub_type_desc',
'          FROM appl_vou_sub_types',
'         WHERE apst_bu = dm_bu ',
'           AND apst_sub_type = dm_sub_vou_type) dm_vou_type_desc,',
'       dm_module,',
'       dm_vou_plnt,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = dm_bu ',
'           AND bup_plant_id = dm_vou_plnt) dm_vou_plnt_desc,',
'       dm_vou_pfx,',
'       dm_vou_no,',
'       dm_vou_seq_no,',
'       dm_vou_seq2_no,',
'       dm_vou_seq3_no,',
'       dm_vou_seq4_no,',
'       dm_party_type,',
'       dm_party_id,',
'       dm_party_name,',
'       dm_prod_id,',
'       dm_prod_rev,',
'       (SELECT (prod_desc11 || '' '' || prod_desc21)',
'          FROM products',
'         WHERE prod_bu = dm_bu',
'           AND prod_id = dm_prod_id',
'           AND prod_rev = dm_prod_rev) dm_prod_desc,',
'       dm_attach_id,',
'       (SELECT dmag_attach_desc',
'          FROM doc_mgmt_attach_group',
'         WHERE dmag_attach_id = dm_attach_id) dm_attach_desc,',
'       dm_file_narr,',
'       dm_doc_type,',
'       (SELECT dmdt_desc',
'          FROM doc_mgmt_doc_type',
'         WHERE dmdt_doc_type = dm_doc_type) dm_doc_type_desc,',
'       dm_file_name,',
'       dm_mime_type,',
'       dm_loc_type,',
'       dm_attach_dir,',
'       dm_blob,',
'       dm_mail_flag,',
'       dm_cre_by,',
'       to_char(dm_cre_date,''DD-MM-RRRR HH12:MI PM'') dm_cre_date,',
'       dm_cre_emp_id,',
'       dm_cre_ip_addr,',
'       dm_cre_os_user,',
'       dm_upd_by,',
'       dm_upd_date,',
'       dm_upd_emp_id,',
'       dm_upd_ip_addr,',
'       dm_upd_os_user,',
'       dm_loc_id,',
'       (SELECT bupld_loc_name',
'          FROM bus_unit_plants_loc_dtls',
'         WHERE bupld_bu     = dm_bu',
'           AND bupld_plnt   = dm_vou_plnt',
'           AND bupld_loc_id = dm_loc_id) dm_loc_name,',
'       dm_exp_date,',
'       TO_DATE(dm_from_date,''DD-MM-RRRR'')dm_from_date,',
'       TO_DATE(dm_to_date,''DD-MM-RRRR'')dm_to_date,',
'       dm_type_desc,',
'       dm_sub_vou_type,',
'       dm_emp_id,          ',
'       (SELECT TRIM (emp_first_name1 || emp_middle_name1 || emp_last_name1)',
'          FROM employees',
'         WHERE emp_bu = dm_bu AND emp_emp_id = dm_emp_id) dm_emp_name',
' FROM doc_mgmt_doc_type,',
'      doc_mgmt',
'WHERE dm_bu = :global_bu',
'  AND dmdt_desc = dm_type_desc',
'  AND dmdt_exp_flag = ''Y''',
'  AND dmdt_type IN (SELECT wudal_type',
'                      FROM wapl_user_dashboard_accs_ln',
'                     WHERE wudal_bu = :global_bu',
'                       AND wudal_user_id = :global_user)',
'  AND dm_to_date <=  (dm_from_date+dmdt_exp_days)',
'  AND dm_status = ''A''',
'  AND dmdt_exp_days IS NOT NULL',
''))
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
 p_id=>wwv_flow_imp.id(5971958535237163131)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>489996699693552103
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971961298911163159)
,p_db_column_name=>'DM_ATTACH_DESC'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Dm Attach Desc'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971961998872163166)
,p_db_column_name=>'DM_ATTACH_DIR'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Dm Attach Dir'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971961213112163158)
,p_db_column_name=>'DM_ATTACH_ID'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Dm Attach Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971962127759163167)
,p_db_column_name=>'DM_BLOB'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Dm Blob'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971958547897163132)
,p_db_column_name=>'DM_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Dm Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971962326025163169)
,p_db_column_name=>'DM_CRE_BY'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Dm Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971962348744163170)
,p_db_column_name=>'DM_CRE_DATE'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Dm Cre Date'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971962527726163171)
,p_db_column_name=>'DM_CRE_EMP_ID'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Dm Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971962560381163172)
,p_db_column_name=>'DM_CRE_IP_ADDR'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Dm Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971962636663163173)
,p_db_column_name=>'DM_CRE_OS_USER'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Dm Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971958787240163134)
,p_db_column_name=>'DM_DOC_NO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971961526676163161)
,p_db_column_name=>'DM_DOC_TYPE'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Dm Doc Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971961616424163162)
,p_db_column_name=>'DM_DOC_TYPE_DESC'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Doc. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5972307105043556136)
,p_db_column_name=>'DM_EMP_ID'
,p_display_order=>550
,p_column_identifier=>'BC'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5972307177981556137)
,p_db_column_name=>'DM_EMP_NAME'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5972306602594556131)
,p_db_column_name=>'DM_EXP_DATE'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'Exp. Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971961704894163163)
,p_db_column_name=>'DM_FILE_NAME'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Dm File Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971961369618163160)
,p_db_column_name=>'DM_FILE_NARR'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Dm File Narr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5972306707954556132)
,p_db_column_name=>'DM_FROM_DATE'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'From Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5972306411120556129)
,p_db_column_name=>'DM_LOC_ID'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'Dm Loc Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5972306515218556130)
,p_db_column_name=>'DM_LOC_NAME'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971961874361163165)
,p_db_column_name=>'DM_LOC_TYPE'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Dm Loc Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971962147206163168)
,p_db_column_name=>'DM_MAIL_FLAG'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Mail Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971961832897163164)
,p_db_column_name=>'DM_MIME_TYPE'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Dm Mime Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971959703539163143)
,p_db_column_name=>'DM_MODULE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971960718226163153)
,p_db_column_name=>'DM_PARTY_ID'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Party ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971960806454163154)
,p_db_column_name=>'DM_PARTY_NAME'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971960634044163152)
,p_db_column_name=>'DM_PARTY_TYPE'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Party Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971961080442163157)
,p_db_column_name=>'DM_PROD_DESC'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971960921367163155)
,p_db_column_name=>'DM_PROD_ID'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971960973666163156)
,p_db_column_name=>'DM_PROD_REV'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Item Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971958878124163135)
,p_db_column_name=>'DM_REQ_DOC_NO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Dm Req Doc No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971959027247163136)
,p_db_column_name=>'DM_REQ_DOC_REV'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Dm Req Doc Rev'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5972306944386556135)
,p_db_column_name=>'DM_SUB_VOU_TYPE'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Sub. Vou. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5972306809685556133)
,p_db_column_name=>'DM_TO_DATE'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'To Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971959201870163138)
,p_db_column_name=>'DM_TYPE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5972306887008556134)
,p_db_column_name=>'DM_TYPE_DESC'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971962773530163174)
,p_db_column_name=>'DM_UPD_BY'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Dm Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971962849087163175)
,p_db_column_name=>'DM_UPD_DATE'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Dm Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971962946508163176)
,p_db_column_name=>'DM_UPD_EMP_ID'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Dm Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971963062328163177)
,p_db_column_name=>'DM_UPD_IP_ADDR'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Dm Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971963181104163178)
,p_db_column_name=>'DM_UPD_OS_USER'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Dm Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971959309917163139)
,p_db_column_name=>'DM_VOU_LEVEL'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Dm Vou Level'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971959356222163140)
,p_db_column_name=>'DM_VOU_LEVEL_DESC'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Vou Level'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971960099970163147)
,p_db_column_name=>'DM_VOU_NO'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Vou. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971959966371163146)
,p_db_column_name=>'DM_VOU_PFX'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Vou. Pfx.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971959826634163144)
,p_db_column_name=>'DM_VOU_PLNT'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Dm Vou Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971959914525163145)
,p_db_column_name=>'DM_VOU_PLNT_DESC'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Vou. Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971960301244163149)
,p_db_column_name=>'DM_VOU_SEQ2_NO'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Vou. Seq2 No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971960374938163150)
,p_db_column_name=>'DM_VOU_SEQ3_NO'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Vou. Seq3 No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971960442836163151)
,p_db_column_name=>'DM_VOU_SEQ4_NO'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Vou. Seq4 No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971960148372163148)
,p_db_column_name=>'DM_VOU_SEQ_NO'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Vou. Seq. No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971959450734163141)
,p_db_column_name=>'DM_VOU_TYPE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Dm Vou Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971959550239163142)
,p_db_column_name=>'DM_VOU_TYPE_DESC'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Vou. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971958676127163133)
,p_db_column_name=>'ENTITY_DESC'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Entity'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5971959127488163137)
,p_db_column_name=>'VOU_DATE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Vou. Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(5972364093121573520)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4904023'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'DM_BU:ENTITY_DESC:DM_DOC_NO:DM_REQ_DOC_NO:DM_REQ_DOC_REV:VOU_DATE:DM_TYPE:DM_VOU_LEVEL:DM_VOU_LEVEL_DESC:DM_VOU_TYPE:DM_VOU_TYPE_DESC:DM_MODULE:DM_VOU_PLNT:DM_VOU_PLNT_DESC:DM_VOU_PFX:DM_VOU_NO:DM_VOU_SEQ_NO:DM_VOU_SEQ2_NO:DM_VOU_SEQ3_NO:DM_VOU_SEQ4_'
||'NO:DM_PARTY_TYPE:DM_PARTY_ID:DM_PARTY_NAME:DM_PROD_ID:DM_PROD_REV:DM_PROD_DESC:DM_ATTACH_ID:DM_ATTACH_DESC:DM_FILE_NARR:DM_DOC_TYPE:DM_DOC_TYPE_DESC:DM_FILE_NAME:DM_MIME_TYPE:DM_LOC_TYPE:DM_ATTACH_DIR:DM_BLOB:DM_MAIL_FLAG:DM_CRE_BY:DM_CRE_DATE:DM_CRE'
||'_EMP_ID:DM_CRE_IP_ADDR:DM_CRE_OS_USER:DM_UPD_BY:DM_UPD_DATE:DM_UPD_EMP_ID:DM_UPD_IP_ADDR:DM_UPD_OS_USER:DM_LOC_ID:DM_LOC_NAME:DM_EXP_DATE:DM_FROM_DATE:DM_TO_DATE:DM_TYPE_DESC:DM_SUB_VOU_TYPE:DM_EMP_ID:DM_EMP_NAME'
);
wwv_flow_imp.component_end;
end;
/
