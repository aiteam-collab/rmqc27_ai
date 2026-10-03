prompt --application/pages/page_00067
begin
--   Manifest
--     PAGE: 00067
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
 p_id=>67
,p_name=>'Open/Blanket PO Entry'
,p_alias=>'OPEN-BLANKET-PO-ENTRY'
,p_step_title=>'Open/Blanket PO Entry'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_imp.id(10650464521724505296)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9009432722661009274)
,p_plug_name=>'Attachment'
,p_static_id=>'attachment'
,p_parent_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9011037315220335359)
,p_plug_name=>'Attachment'
,p_static_id=>'attachment-2'
,p_parent_plug_id=>wwv_flow_imp.id(9009432722661009274)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>5
,p_plug_display_column=>5
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       DM_BU,',
'       DM_DOC_NO,',
'       DM_VOU_LEVEL,',
'       DM_VOU_TYPE,',
'       DM_VOU_PLNT,',
'       DM_VOU_PFX,',
'       DM_VOU_NO,',
'       DM_VOU_SEQ_NO,',
'       DM_PARTY_TYPE,',
'       DM_PARTY_ID,',
'       DM_PROD_ID,',
'       DM_PROD_REV,',
'       DM_FILE_NARR,',
'       DM_DOC_TYPE,',
'       DM_DOC_NAME,',
'       DM_BLOB,',
'       DM_CRE_BY,',
'       DM_CRE_IP_ADDR,',
'       DM_CRE_OS_USER,',
'       DM_CRE_DATE,',
'       DM_UPD_BY,',
'       DM_UPD_IP_ADDR,',
'       DM_UPD_OS_USER,',
'       DM_UPD_DATE,',
'       DM_CRE_EMP_ID,',
'       DM_UPD_EMP_ID,',
'       DM_ATTACH_ID,',
'       DM_BUS_FUN_ID,',
'       DM_BLOCK_NAME,',
'       DM_TABLE_NAME,',
'       DM_MIME_TYPE,',
'       DM_FILE_NAME,',
'       DM_PARTY_NAME,',
'       DM_LOC_TYPE,',
'       DM_ATTACH_DIR,',
'       DM_MODULE,',
'       DM_VOU_SEQ2_NO,',
'       DM_VOU_SEQ3_NO,',
'       DM_VOU_SEQ4_NO,',
'       DM_MAIL_FLAG,',
'       DM_ATT_SEQ_NO,',
'		  ''<button type="button" title="Download" aria-label="Download" class="t-Button t-Button--noLabel t-Button--icon t-Button--small t-Button--success t-Button--noUI"><span aria-hidden="true" class="t-Icon fa fa-download"></span></button>'' download,',
'		 ''<button type="button" title="Delete" aria-label="Download" class="t-Button t-Button--noLabel t-Button--icon t-Button--small t-Button--danger t-Button--simple"><span aria-hidden="true" class="t-Icon fa fa-folder-x"></span></button>'' delete_file',
'  from DOC_MGMT',
'   WHERE DM_BU=:GLOBAL_BU',
'	  AND DM_VOU_PLNT =:P67_PRCHD_PLNT',
'	  AND DM_VOU_NO =:P67_PRCHD_PO_NO',
'	  AND DM_VOU_PFX =:P67_PRCHD_PO_PFX',
'	  AND  DM_VOU_TYPE = ''PR''',
'	  ORDER BY DM_ATT_SEQ_NO'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P67_PRCHD_PO_PFX,P67_PRCHD_PO_NO,P67_PRCHD_PLNT'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Attachment'
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
 p_id=>wwv_flow_imp.id(9011037414644335360)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>3529075579100724332
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700486637486485546)
,p_db_column_name=>'DELETE_FILE'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Delete File'
,p_column_link=>'javascript:$s(''P161513102501_ATT_SEQ_NO'',''#DM_ATT_SEQ_NO#''),$s(''P161513102501_DOC_NO'',''#DM_DOC_NO#'');apex.confirm("Do you want to Delete the document ? ",''DELETE'');'
,p_column_linktext=>'#DELETE_FILE#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700483512229485542)
,p_db_column_name=>'DM_ATTACH_DIR'
,p_display_order=>370
,p_column_identifier=>'AJ'
,p_column_label=>'Dm Attach Dir'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700480334550485537)
,p_db_column_name=>'DM_ATTACH_ID'
,p_display_order=>290
,p_column_identifier=>'AB'
,p_column_label=>'Dm Attach Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700485887597485545)
,p_db_column_name=>'DM_ATT_SEQ_NO'
,p_display_order=>140
,p_column_identifier=>'AP'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700475874503485518)
,p_db_column_name=>'DM_BLOB'
,p_display_order=>180
,p_column_identifier=>'Q'
,p_column_label=>'Dm Blob'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700481037839485538)
,p_db_column_name=>'DM_BLOCK_NAME'
,p_display_order=>310
,p_column_identifier=>'AD'
,p_column_label=>'Dm Block Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700469896136485510)
,p_db_column_name=>'DM_BU'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Dm Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700480668367485537)
,p_db_column_name=>'DM_BUS_FUN_ID'
,p_display_order=>300
,p_column_identifier=>'AC'
,p_column_label=>'Dm Bus Fun Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700476271036485531)
,p_db_column_name=>'DM_CRE_BY'
,p_display_order=>190
,p_column_identifier=>'R'
,p_column_label=>'Dm Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700477442809485534)
,p_db_column_name=>'DM_CRE_DATE'
,p_display_order=>220
,p_column_identifier=>'U'
,p_column_label=>'Dm Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700479510500485535)
,p_db_column_name=>'DM_CRE_EMP_ID'
,p_display_order=>270
,p_column_identifier=>'Z'
,p_column_label=>'Dm Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700476676892485532)
,p_db_column_name=>'DM_CRE_IP_ADDR'
,p_display_order=>200
,p_column_identifier=>'S'
,p_column_label=>'Dm Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700477063828485532)
,p_db_column_name=>'DM_CRE_OS_USER'
,p_display_order=>210
,p_column_identifier=>'T'
,p_column_label=>'Dm Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700475495982485518)
,p_db_column_name=>'DM_DOC_NAME'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Document Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700470330166485510)
,p_db_column_name=>'DM_DOC_NO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Dm Doc No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700475061214485517)
,p_db_column_name=>'DM_DOC_TYPE'
,p_display_order=>170
,p_column_identifier=>'O'
,p_column_label=>'Dm Doc Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700482322681485540)
,p_db_column_name=>'DM_FILE_NAME'
,p_display_order=>340
,p_column_identifier=>'AG'
,p_column_label=>'Dm File Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700474712814485517)
,p_db_column_name=>'DM_FILE_NARR'
,p_display_order=>150
,p_column_identifier=>'N'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700483062110485542)
,p_db_column_name=>'DM_LOC_TYPE'
,p_display_order=>360
,p_column_identifier=>'AI'
,p_column_label=>'Dm Loc Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700485450573485545)
,p_db_column_name=>'DM_MAIL_FLAG'
,p_display_order=>420
,p_column_identifier=>'AO'
,p_column_label=>'Dm Mail Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700481886110485538)
,p_db_column_name=>'DM_MIME_TYPE'
,p_display_order=>330
,p_column_identifier=>'AF'
,p_column_label=>'Dm Mime Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700483890288485543)
,p_db_column_name=>'DM_MODULE'
,p_display_order=>380
,p_column_identifier=>'AK'
,p_column_label=>'Dm Module'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700473471530485515)
,p_db_column_name=>'DM_PARTY_ID'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Dm Party Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700482651630485542)
,p_db_column_name=>'DM_PARTY_NAME'
,p_display_order=>350
,p_column_identifier=>'AH'
,p_column_label=>'Dm Party Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700473080491485513)
,p_db_column_name=>'DM_PARTY_TYPE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Dm Party Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700473914668485515)
,p_db_column_name=>'DM_PROD_ID'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Dm Prod Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700474335082485517)
,p_db_column_name=>'DM_PROD_REV'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Dm Prod Rev'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700481532350485538)
,p_db_column_name=>'DM_TABLE_NAME'
,p_display_order=>320
,p_column_identifier=>'AE'
,p_column_label=>'Dm Table Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700477895213485534)
,p_db_column_name=>'DM_UPD_BY'
,p_display_order=>230
,p_column_identifier=>'V'
,p_column_label=>'Dm Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700479090434485535)
,p_db_column_name=>'DM_UPD_DATE'
,p_display_order=>260
,p_column_identifier=>'Y'
,p_column_label=>'Dm Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700479928756485537)
,p_db_column_name=>'DM_UPD_EMP_ID'
,p_display_order=>280
,p_column_identifier=>'AA'
,p_column_label=>'Dm Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700478315730485534)
,p_db_column_name=>'DM_UPD_IP_ADDR'
,p_display_order=>240
,p_column_identifier=>'W'
,p_column_label=>'Dm Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700478679698485535)
,p_db_column_name=>'DM_UPD_OS_USER'
,p_display_order=>250
,p_column_identifier=>'X'
,p_column_label=>'Dm Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700470717465485512)
,p_db_column_name=>'DM_VOU_LEVEL'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Dm Vou Level'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700472315039485513)
,p_db_column_name=>'DM_VOU_NO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Dm Vou No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700471890151485513)
,p_db_column_name=>'DM_VOU_PFX'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Dm Vou Pfx'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700471507261485512)
,p_db_column_name=>'DM_VOU_PLNT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Dm Vou Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700484323930485543)
,p_db_column_name=>'DM_VOU_SEQ2_NO'
,p_display_order=>390
,p_column_identifier=>'AL'
,p_column_label=>'Dm Vou Seq2 No'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700484711624485543)
,p_db_column_name=>'DM_VOU_SEQ3_NO'
,p_display_order=>400
,p_column_identifier=>'AM'
,p_column_label=>'Dm Vou Seq3 No'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700485051517485545)
,p_db_column_name=>'DM_VOU_SEQ4_NO'
,p_display_order=>410
,p_column_identifier=>'AN'
,p_column_label=>'Dm Vou Seq4 No'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700472678970485513)
,p_db_column_name=>'DM_VOU_SEQ_NO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Dm Vou Seq No'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700471092892485512)
,p_db_column_name=>'DM_VOU_TYPE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Dm Vou Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700486292784485546)
,p_db_column_name=>'DOWNLOAD'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Download'
,p_column_link=>'javascript:window.open(''&GLOBAL_API_URL.attachment/download/#DM_BU#/#DM_DOC_NO#'', ''_self'');'
,p_column_linktext=>'#DOWNLOAD#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7700469457931485506)
,p_db_column_name=>'ROWID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9011504375950548026)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'13111381'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ROWID:DM_BU:DM_DOC_NO:DM_VOU_LEVEL:DM_VOU_TYPE:DM_VOU_PLNT:DM_VOU_PFX:DM_VOU_NO:DM_VOU_SEQ_NO:DM_PARTY_TYPE:DM_PARTY_ID:DM_PROD_ID:DM_PROD_REV:DM_ATT_SEQ_NO:DM_FILE_NARR:DM_DOC_NAME:DM_DOC_TYPE:DM_BLOB:DM_CRE_BY:DM_CRE_IP_ADDR:DM_CRE_OS_USER:DM_CRE_D'
||'ATE:DM_UPD_BY:DM_UPD_IP_ADDR:DM_UPD_OS_USER:DM_UPD_DATE:DM_CRE_EMP_ID:DM_UPD_EMP_ID:DM_ATTACH_ID:DM_BUS_FUN_ID:DM_BLOCK_NAME:DM_TABLE_NAME:DM_MIME_TYPE:DM_FILE_NAME:DM_PARTY_NAME:DM_LOC_TYPE:DM_ATTACH_DIR:DM_MODULE:DM_VOU_SEQ2_NO:DM_VOU_SEQ3_NO:DM_VO'
||'U_SEQ4_NO:DM_MAIL_FLAG:DOWNLOAD:DELETE_FILE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9008047138365391098)
,p_plug_name=>'Attribute'
,p_static_id=>'attribute'
,p_region_name=>'ig_line2'
,p_parent_plug_id=>wwv_flow_imp.id(9008047045969391097)
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-Region--hideShowIconsMath:is-expanded:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       OHTA_BU,',
'       OHTA_PLNT,',
'       OHTA_PO_PFX,',
'       OHTA_PO_NO,',
'       OHTA_SEQ_NO,',
'       OHTA_ATTR_ID,',
'       OHTA_PRINT_SEQ,',
'       OHTA_CRE_BY,',
'       OHTA_CRE_IP_ADDR,',
'       OHTA_CRE_OS_USER,',
'       OHTA_CRE_DATE,',
'       OHTA_UPD_BY,',
'       OHTA_UPD_IP_ADDR,',
'       OHTA_UPD_OS_USER,',
'       OHTA_UPD_DATE,',
'       OHTA_CRE_EMP_ID,',
'       OHTA_UPD_EMP_ID,',
'       OHTA_TMPLT_NO,',
'		  ''<span class="fa fa-trash-o" aria-hidden="true" style="color:red"></span>'' del',
'  from OPO_HD_TNC_ATTR',
'  WHERE OHTA_BU = :GLOBAL_BU',
'    AND OHTA_PLNT =:P67_PRCHD_PLNT',
'	 AND OHTA_PO_PFX  =:P67_PRCHD_PO_PFX',
'	 AND OHTA_PO_NO = :P67_PRCHD_PO_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P67_PRCHD_PLNT,P67_PRCHD_PO_PFX,P67_PRCHD_PO_NO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Attribute'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009109022430837169)
,p_name=>'APEX$ROW_ACTION'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009109144344837170)
,p_name=>'APEX$ROW_SELECTOR'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9376506119596180579)
,p_name=>'DEL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Delete'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P161513102501_OHTA_PRINT_SEQ'',''&OHTA_SEQ_NO.'');apex.confirm("Do you want to Cancel the document?",''del_attr'');'
,p_link_text=>'&DEL.'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009107701122837155)
,p_name=>'OHTA_ATTR_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTA_ATTR_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Attribute'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ta_attr_desc,ta_attr_id',
'  FROM tnc_attr',
' WHERE ta_bu = :GLOBAL_BU'))
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008047326410391100)
,p_name=>'OHTA_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTA_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_BU'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009107817547837157)
,p_name=>'OHTA_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTA_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009108169609837160)
,p_name=>'OHTA_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTA_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009108683369837165)
,p_name=>'OHTA_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTA_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009107990458837158)
,p_name=>'OHTA_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTA_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009108054687837159)
,p_name=>'OHTA_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTA_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008047466933391101)
,p_name=>'OHTA_PLNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTA_PLNT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P67_PRCHD_PLNT'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008047631602391103)
,p_name=>'OHTA_PO_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTA_PO_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P67_PRCHD_PO_NO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008047570399391102)
,p_name=>'OHTA_PO_PFX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTA_PO_PFX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P67_PRCHD_PO_PFX'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009107794356837156)
,p_name=>'OHTA_PRINT_SEQ'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTA_PRINT_SEQ'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_enable_filter=>true
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009107585999837154)
,p_name=>'OHTA_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTA_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'seq'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009108814963837167)
,p_name=>'OHTA_TMPLT_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTA_TMPLT_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009108244463837161)
,p_name=>'OHTA_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTA_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009108531695837164)
,p_name=>'OHTA_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTA_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009108743644837166)
,p_name=>'OHTA_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTA_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009108336281837162)
,p_name=>'OHTA_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTA_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009108416130837163)
,p_name=>'OHTA_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTA_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009108930905837168)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(9008047252796391099)
,p_internal_uid=>3526085417252780071
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(9009122333280848682)
,p_interactive_grid_id=>wwv_flow_imp.id(9008047252796391099)
,p_static_id=>'13087561'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(9009122597875848682)
,p_report_id=>wwv_flow_imp.id(9009122333280848682)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009123039799848685)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(9008047326410391100)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009123997673848692)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(9008047466933391101)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009124895729848698)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(9008047570399391102)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009125742898848703)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(9008047631602391103)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009126694780848707)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(9009107585999837154)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009127564017848713)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(9009107701122837155)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>223.42
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009128469774848720)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(9009107794356837156)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>56
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009129363518848724)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(9009107817547837157)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009130287899848732)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(9009107990458837158)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009131207470848738)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(9009108054687837159)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009132013839848745)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(9009108169609837160)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009132968929848751)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(9009108244463837161)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009133827368848757)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(9009108336281837162)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009134807885848763)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(9009108416130837163)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009135710552848768)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(9009108531695837164)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009136426445848774)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(9009108683369837165)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009137347229848779)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(9009108743644837166)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009138277588848785)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(9009108814963837167)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009139145899848792)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(9009108930905837168)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009144074464856762)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(9009109022430837169)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009144983677856768)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(9009109144344837170)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9392547370754517059)
,p_view_id=>wwv_flow_imp.id(9009122597875848682)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(9376506119596180579)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9005855732814036792)
,p_plug_name=>'Charges'
,p_static_id=>'charges'
,p_region_name=>'ig_line1'
,p_parent_plug_id=>wwv_flow_imp.id(8996102937594367693)
,p_region_css_classes=>'js-dialog-size1200x400'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>12
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       PRCTC_BU,',
'       PRCTC_PLNT,',
'       PRCTC_PO_PFX,',
'       PRCTC_PO_NO,',
'       PRCTC_PRINT_SEQ_NO,',
'       PRCTC_MODE,',
'       PRCTC_TC_ID,',
'       PRCTC_TC_AMT,',
'       PRCTC_SOURCE_FLAG,',
'       PRCTC_CHARGE_FLAG,',
'       PRCTC_TC_PCT,',
'       PRCTC_TC_ACCES_VAL,',
'       PRCTC_UNIT_COST,',
'       PRCTC_LEVEL,',
'       PRCTC_SUPLR_CHRG_FLAG,',
'       PRCTC_CHG_FLAG,',
'       PRCTC_PVSNL_FLAG,',
'       PRCTC_GST_INC_FLAG,',
'       PRCTC_CRE_BY,',
'       PRCTC_CRE_IP_ADDR,',
'       PRCTC_CRE_OS_USER,',
'       PRCTC_CRE_DATE,',
'       PRCTC_UPD_BY,',
'       PRCTC_UPD_IP_ADDR,',
'       PRCTC_UPD_OS_USER,',
'       PRCTC_UPD_DATE,',
'       PRCTC_CRE_EMP_ID,',
'       PRCTC_UPD_EMP_ID',
'  from PUR_RATE_CONTR_TAX_CHARGES',
'  WHERE PRCTC_BU =:GLOBAL_BU',
'    AND PRCTC_PLNT =:P67_PRCHD_PLNT',
'	 AND PRCTC_PO_PFX =:P67_PRCHD_PO_PFX',
'	 AND PRCTC_PO_NO =:P67_PRCHD_PO_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P67_PRCHD_PLNT,P67_PRCHD_PO_PFX,P67_PRCHD_PO_NO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Charges'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008044630035391073)
,p_name=>'APEX$ROW_ACTION'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008044712913391074)
,p_name=>'APEX$ROW_SELECTOR'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9005855981188036794)
,p_name=>'PRCTC_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_BU'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9005856823237036803)
,p_name=>'PRCTC_CHARGE_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_CHARGE_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008043279875391059)
,p_name=>'PRCTC_CHG_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_CHG_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'AIC'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Avail;Y,Not Avail;N,Deferred;D'
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008043532458391062)
,p_name=>'PRCTC_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008043889535391065)
,p_name=>'PRCTC_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008044333755391070)
,p_name=>'PRCTC_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>310
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008043632684391063)
,p_name=>'PRCTC_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>240
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008043752595391064)
,p_name=>'PRCTC_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>250
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008043449923391061)
,p_name=>'PRCTC_GST_INC_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_GST_INC_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'GST Inc.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008043109715391057)
,p_name=>'PRCTC_LEVEL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_LEVEL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Level'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Value;V,%;P'
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'V'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9005856446676036799)
,p_name=>'PRCTC_MODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_MODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'PO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9005856071844036795)
,p_name=>'PRCTC_PLNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_PLNT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P67_PRCHD_PLNT'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9005856227337036797)
,p_name=>'PRCTC_PO_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_PO_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P67_PRCHD_PO_NO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9005856113013036796)
,p_name=>'PRCTC_PO_PFX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_PO_PFX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P67_PRCHD_PO_PFX'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9005856379118036798)
,p_name=>'PRCTC_PRINT_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_PRINT_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Line'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_enable_filter=>true
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008043357886391060)
,p_name=>'PRCTC_PVSNL_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_PVSNL_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9005856793551036802)
,p_name=>'PRCTC_SOURCE_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_SOURCE_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008043151759391058)
,p_name=>'PRCTC_SUPLR_CHRG_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_SUPLR_CHRG_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'PTS'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008042840702391055)
,p_name=>'PRCTC_TC_ACCES_VAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_TC_ACCES_VAL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Assessable Value'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'0'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9005856632852036801)
,p_name=>'PRCTC_TC_AMT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_TC_AMT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'TC Amt.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'0.00'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9005856514883036800)
,p_name=>'PRCTC_TC_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_TC_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Tax Charge'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT DECODE((SELECT APPLCTRL_DESC_LEVEL FROM APPL_CONTROL WHERE APPLCTRL_BU=:GLOBAL_BU),1,TC_DESC1, NVL(TC_DESC2,TC_DESC1)) DESCRIPTION,tc_tc_id',
'  FROM TAX_CHARGES,',
'tax_charges_types',
' WHERE tc_bu=:GLOBAL_bu ',
' AND TC_CHARGE_FLAG IN(''R'',''T'')',
'AND tc_bu = tctype_bu',
'AND tc_type_id = tctype_id',
'AND tctype_type_id NOT IN(''MED'',''MSED'',''MCED'',''MAD'',''MCVD'',''MCCVD'',''MSCVD'',''TAC'')',
'order by 1'))
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008042737239391054)
,p_name=>'PRCTC_TC_PCT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_TC_PCT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'TC %'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_item_attributes=>'readonly=readonly'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'.000'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008042923356391056)
,p_name=>'PRCTC_UNIT_COST'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_UNIT_COST'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'0'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008043913225391066)
,p_name=>'PRCTC_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>270
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008044296679391069)
,p_name=>'PRCTC_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>300
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008044445260391071)
,p_name=>'PRCTC_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>320
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008044070869391067)
,p_name=>'PRCTC_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>280
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008044157943391068)
,p_name=>'PRCTC_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCTC_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>290
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9008044539977391072)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>330
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(9005855882072036793)
,p_internal_uid=>3523894046528425765
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(9008182813887399523)
,p_interactive_grid_id=>wwv_flow_imp.id(9005855882072036793)
,p_static_id=>'13078166'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(9008183031000399523)
,p_report_id=>wwv_flow_imp.id(9008182813887399523)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008183515297399526)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(9005855981188036794)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008184437784399532)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(9005856071844036795)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008185372512399538)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(9005856113013036796)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008186260285399546)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(9005856227337036797)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008187210475399553)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(9005856379118036798)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008188094016399559)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(9005856446676036799)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008188975297399562)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(9005856514883036800)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>219.073
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008189822689399568)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(9005856632852036801)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>94.9688
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008190781373399574)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(9005856793551036802)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008191699443399579)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(9005856823237036803)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008192525257399585)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(9008042737239391054)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>66.625
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008193395959399592)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(9008042840702391055)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>126.986
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008194229601399598)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(9008042923356391056)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008195203684399604)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(9008043109715391057)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>81.969
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008196026088399610)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(9008043151759391058)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>62
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008196985401399613)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(9008043279875391059)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>89
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008197880077399618)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(9008043357886391060)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008198713633399621)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(9008043449923391061)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>83.0799
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008199666865399624)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(9008043532458391062)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008200551837399628)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(9008043632684391063)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008201417985399631)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(9008043752595391064)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008202358667399635)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(9008043889535391065)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008203268595399643)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(9008043913225391066)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008204154685399649)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(9008044070869391067)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008205051925399656)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(9008044157943391068)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008205941840399663)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(9008044296679391069)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008206855815399668)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(9008044333755391070)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008207715745399676)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(9008044445260391071)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008208697808399682)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(9008044539977391072)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008221342638412392)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(9008044630035391073)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9008222278146412398)
,p_view_id=>wwv_flow_imp.id(9008183031000399523)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(9008044712913391074)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9009432529019009272)
,p_plug_name=>'General'
,p_static_id=>'general'
,p_parent_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8996102937594367693)
,p_plug_name=>'Lines'
,p_static_id=>'lines'
,p_region_name=>'ig_line'
,p_parent_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:is-expanded:t-Region--noUI:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650486579108505317)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       PRCLN_BU,',
'       PRCLN_PLNT,',
'       PRCLN_PO_PFX,',
'       PRCLN_PO_NO,',
'       PRCLN_SEQ_NO,',
'       PRCLN_PROD_ID,',
'       PRCLN_PROD_REV,',
'		 PRCLN_PROD_ID||''~''||PRCLN_PROD_REV Dum_Prod,',
'		 (SELECT distinct PROD_DESC11',
'		   FROM PRODUCTS',
'		  WHERE PROD_BU = PRCLN_BU',
'		    AND PROD_ID = PRCLN_PROD_ID',
'			 AND PROD_REV= PRCLN_PROD_REV )Item_Desc,',
'       PRCLN_QTY_TYPE,',
'       PRCLN_QTY,',
'       PRCLN_UOM,',
'       PRCLN_PRICE_TYPE,',
'       PRCLN_PRICE,',
'       PRCLN_DISC_PCT,',
'       PRCLN_PG_FLAG,',
'       PRCLN_PG_ID,',
'       PRCLN_PG_DESC,',
'       PRCLN_PRINT_SEQ_NO,',
'       PRCLN_TAX_SET_ID,',
'       PRCLN_SUPLR_PROD_ID,',
'       PRCLN_SUPLR_PROD_DESC,',
'       PRCLN_BUDGET_FLAG,',
'       PRCLN_ALLOW_UPD_RATE_CONTR,',
'       PRCLN_TCF_ID,',
'       PRCLN_CONS_QTY,',
'       PRCLN_VALIDITY_OPT,',
'       PRCLN_HSN_CODE,',
'       PRCLN_PROC_ID,',
'       PRCLN_PROC_UOM,',
'       PRCLN_BATCH_QTY,',
'       PRCLN_BATCH_COST,',
'       PRCLN_MIN_FLAG,',
'       PRCLN_CONV_FACTOR,',
'       PRCLN_CRE_BY,',
'       PRCLN_CRE_IP_ADDR,',
'       PRCLN_CRE_OS_USER,',
'       PRCLN_CRE_DATE,',
'       PRCLN_UPD_BY,',
'       PRCLN_UPD_IP_ADDR,',
'       PRCLN_UPD_OS_USER,',
'       PRCLN_UPD_DATE,',
'       PRCLN_CRE_EMP_ID,',
'       PRCLN_UPD_EMP_ID,',
'       PRCLN_OPRN_LN_SEQ_NO,',
'       PRCLN_GST_EXEMPT_FLAG,',
'       PRCLN_GST_INPUT_TYPE,',
'       PRCLN_DISC_AMT,',
'       PRCLN_MILL_SUPLR_NAME,',
'       PRCLN_CC_CODE,',
'       PRCLN_REF,',
'       PRCLN_SKS_CURRENCY,',
'       PRCLN_SKS_EXCHANGE_RATE,',
'       PRCLN_SKS_FC_UNIT_COST,',
'       PRCLN_MIG_DOC_NO,',
'		 ''<span class="fa fa-trash-o" aria-hidden="true" style="color:red"></span>''"Delete",',
'		 (SELECT distinct mat_spec_desc ',
'		    FROM material_spec ',
'         WHERE mat_bu = PRCLN_BU)Mat_Spec,',
'		 (SELECT distinct PG_DESC1',
'          FROM prod_grades',
'         WHERE pg_bu = PRCLN_BU',
'           and rownum = 1) Grade,',
'		(SELECT distinct GSIZE_NAME ',
'		    FROM GAR_SIZES ',
'         WHERE gsize_bu = PRCLN_BU',
'			and rownum = 1)size_Desc,',
'			''<span class="fa fa-database-edit" aria-hidden="true" style="color:blue"></span>'' "Charge_Item",',
'				''<span class="fa fa-pencil-square-o" aria-hidden="true" style="color:purple"></span>'' "T_C",',
'				''<span class="fa fa-percent" aria-hidden="true" style="color:orange"></span>'' "Line_Tax",',
'				''<span class="fa fa-refresh" aria-hidden="true" style="color:green"></span>'' "Process",',
'				--''<span class="fa fa-badge-dollar" aria-hidden="true" style="color:#a3520b"></span>'' "Price",',
'	 CASE WHEN PRCLN_PRICE_TYPE = ''F'' THEN ''link'' ELSE ''nolink'' END link1,',
'  CASE WHEN PRCLN_PRICE_TYPE = ''R'' THEN ''link'' ELSE ''nolink'' END link2,',
'		CASE WHEN PRCLN_PRICE_TYPE = ''F'' THEN',
'         ''<span aria-hidden="true" class="fa fa-badge-dollar" style="color: #ffa50070"; cursor:no-drop;"></span>''',
'      ELSE',
'		  ''<span aria-hidden="true" class="fa fa-badge-dollar" style="color:#a3520b";></span>''',
'		END',
'         "Price",',
'	     (SELECT PRCHD_SUPLR_ID ',
'	     FROM PUR_RATE_CONTR_HD',
'		 WHERE PRCHD_BU = PRCLN_BU',
'		   AND PRCHD_PLNT = PRCLN_PLNT',
'			AND PRCHD_PO_NO = PRCLN_PO_NO',
'			AND PRCHD_PO_PFX = PRCLN_PO_PFX)Supllier',
'  from PUR_RATE_CONTR_LN',
' WHERE  PRCLN_BU =:GLOBAL_BU',
'   AND PRCLN_PLNT = :P67_PRCHD_PLNT',
'	AND PRCLN_PO_PFX =:P67_PRCHD_PO_PFX',
'	AND PRCLN_PO_NO =:P67_PRCHD_PO_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P67_PRCHD_PLNT,P67_PRCHD_PO_PFX,P67_PRCHD_PO_NO,P67_PRCHD_SERV_TYPE,P67_PRCHD_SUPLR,P67_PRCHD_PROD_TYPE,P67_PRCHD_SKS_MST_TY,P67_PRCHD_CURRY'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P67_ROWID  is not null'
,p_plug_display_when_cond2=>'PLSQL'
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
' :P67_PRCHD_TAX_FLAG in (''Y'') ',
''))
,p_plug_read_only_when2=>'PLSQL'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Lines'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999468747293848699)
,p_name=>'APEX$ROW_ACTION'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999468909399848700)
,p_name=>'APEX$ROW_SELECTOR'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9000182506477231198)
,p_name=>'Charge_Item'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Charge_Item'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Charge Item'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>620
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:161513102502:&SESSION.::&DEBUG.::P161513102502_PLNT,P161513102502_PO_NO,P161513102502_PO_PFX,P161513102502_SEQ_NO,P161513102502_PRICE,P161513102502TAX:&PRCLN_PLNT.,&PRCLN_PO_NO.,&PRCLN_PO_PFX.,&PRCLN_SEQ_NO.,&PRCLN_PRICE.,&P161513102501_'
||'PRCHD_TAX_FLAG.'
,p_link_text=>'&"Charge_Item".'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>':P67_PRCHD_STATUS IN (''E'')'
,p_display_condition2=>'PLSQL'
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9208280956899050877)
,p_name=>'DUM_PROD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_PROD_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Item')).to_clob
,p_is_required=>false
,p_max_length=>141
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(7700595922856485818)
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9376503943821180557)
,p_name=>'DUM_PROD_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DUM_PROD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Dum Prod'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>680
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>141
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9402062210129608858)
,p_name=>'Delete'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Delete'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>710
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P161513102501_PRCLN_SEQ_NO'',''&PRCLN_SEQ_NO.''),$s(''P161513102501_PRCLN_PRINT_NO'',''&PRCLN_PRINT_SEQ_NO.''),$s(''P161513102501_ROW_ID1'',''&ROWID.''),$s(''P161513102501_PO'',''&PRCLN_PO_NO.''),$s(''P161513102501_PFX'',''&PRCLN_PO_PFX.''),$s(''P16151310'
||'2501_PLNT'',''&PRCLN_PLNT.'');apex.submit(''Cancel_Line'');'
,p_link_text=>'&"Delete".'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9000178222500231156)
,p_name=>'GRADE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GRADE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Grade'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>600
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=readonly'
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999469142526848703)
,p_name=>'ITEM_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEM_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Item Desc.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=readonly'
,p_is_required=>false
,p_max_length=>150
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9376504164260180559)
,p_name=>'LINK1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LINK1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Link1'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>690
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>6
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9376504266501180560)
,p_name=>'LINK2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LINK2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Link2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>700
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>6
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9017178801896501887)
,p_name=>'Line_Tax'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Line_Tax'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Tax'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>640
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:161513102506:&SESSION.::&DEBUG.::P161513102506_PLNT,P161513102506_PO_NO,P161513102506_PO_PFX,P161513102506_SEQ_NO,P161513102506_TAX_FLAG:&PRCLN_PLNT.,&PRCLN_PO_NO.,&PRCLN_PO_PFX.,&PRCLN_SEQ_NO.,&P161513102501_PRCHD_TAX_FLAG.'
,p_link_text=>'&"Line_Tax".'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>':P67_PRCHD_TAX_FLAG IN (''Y'')'
,p_display_condition2=>'PLSQL'
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9000178209987231155)
,p_name=>'MAT_SPEC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MAT_SPEC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Mat Spec'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>590
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=readonly'
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999465438912848666)
,p_name=>'PRCLN_ALLOW_UPD_RATE_CONTR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_ALLOW_UPD_RATE_CONTR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Upd. Rate'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999466240919848674)
,p_name=>'PRCLN_BATCH_COST'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_BATCH_COST'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>430
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'0'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999466185119848673)
,p_name=>'PRCLN_BATCH_QTY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_BATCH_QTY'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>420
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'0'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8996103132769367695)
,p_name=>'PRCLN_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>5
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_BU'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999465369807848665)
,p_name=>'PRCLN_BUDGET_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_BUDGET_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Budget'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999468044035848692)
,p_name=>'PRCLN_CC_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_CC_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>560
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999465690257848668)
,p_name=>'PRCLN_CONS_QTY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_CONS_QTY'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>390
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'0.000'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999466426547848676)
,p_name=>'PRCLN_CONV_FACTOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_CONV_FACTOR'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Conv. Factor'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>300
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_item_attributes=>'readonly=readonly'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'1'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999466526455848677)
,p_name=>'PRCLN_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>450
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999466835378848680)
,p_name=>'PRCLN_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>480
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999467315438848685)
,p_name=>'PRCLN_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>530
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999466650518848678)
,p_name=>'PRCLN_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>460
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>20
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999466761799848679)
,p_name=>'PRCLN_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>470
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999467889649848690)
,p_name=>'PRCLN_DISC_AMT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_DISC_AMT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Disc. Amt.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'0'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999464600052848657)
,p_name=>'PRCLN_DISC_PCT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_DISC_PCT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Disc %'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'0.00'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'EXPRESSION'
,p_readonly_condition=>':PRCLN_PRICE_TYPE = ''R'''
,p_readonly_condition2=>'PLSQL'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999467682458848688)
,p_name=>'PRCLN_GST_EXEMPT_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_GST_EXEMPT_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'GST Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:GST Supply;G,NIL Rated;R,Exempted;Y,Non-GST Supply;N,NA;A'
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'G'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999467775018848689)
,p_name=>'PRCLN_GST_INPUT_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_GST_INPUT_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Input Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Inputs;I,Capital Goods;C,Input Services;S,Ineligible;N,NA;A'
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'I'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9814049510794841874)
,p_name=>'PRCLN_HSN_CODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_HSN_CODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'HSN Code'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ghc_hsn_code r,ghc_hsn_code s',
'  FROM gst_hsn_codes,hsn_sac_tax_rates',
' WHERE hstr_bu = :GLOBAL_bu',
'   AND hstr_hsnsac_code = ghc_hsn_code',
'   AND TRUNC(SYSDATE) BETWEEN TRUNC(hstr_date_from) AND TRUNC(hstr_date_to)',
'   AND hstr_status = ''A''',
'   AND ghc_hsn_code_type = ''H''',
'   AND EXISTS(SELECT 1',
'                FROM products',
'               WHERE prod_bu = :GLOBAL_bu',
'                 AND prod_id = :prcln_prod_id',
'                 AND prod_rev = :prcln_prod_rev',
'                 AND prod_stocked = ''Y'')',
'UNION ALL',
'SELECT ghc_hsn_code r,ghc_hsn_code s',
'  FROM gst_hsn_codes,hsn_sac_tax_rates',
' WHERE hstr_bu = :GLOBAL_bu',
'   AND hstr_hsnsac_code = ghc_hsn_code',
'   AND TRUNC(SYSDATE) BETWEEN TRUNC(hstr_date_from) AND TRUNC(hstr_date_to)',
'   AND hstr_status = ''A''',
'   AND ghc_hsn_code_type = ''S''',
'   AND EXISTS(SELECT 1',
'                FROM products',
'               WHERE prod_bu = :GLOBAL_bu',
'                 AND prod_id = :prcln_prod_id',
'                 AND prod_rev = :prcln_prod_rev',
'                 AND prod_stocked = ''N'')',
'ORDER BY 1'))
,p_lov_display_extra=>false
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'PRCLN_PROD_ID,PRCLN_PROD_REV'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999468549474848697)
,p_name=>'PRCLN_MIG_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_MIG_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>570
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999467926793848691)
,p_name=>'PRCLN_MILL_SUPLR_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_MILL_SUPLR_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Mill Suplr. Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>320
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999466402847848675)
,p_name=>'PRCLN_MIN_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_MIN_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>440
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999467577109848687)
,p_name=>'PRCLN_OPRN_LN_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_OPRN_LN_SEQ_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>550
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>20
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999464830053848660)
,p_name=>'PRCLN_PG_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_PG_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>370
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>500
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999464693396848658)
,p_name=>'PRCLN_PG_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_PG_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>350
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'N'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999464749953848659)
,p_name=>'PRCLN_PG_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_PG_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>360
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8996103306504367696)
,p_name=>'PRCLN_PLNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_PLNT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P67_PRCHD_PLNT'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8996103449334367698)
,p_name=>'PRCLN_PO_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_PO_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P67_PRCHD_PO_NO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8996103401104367697)
,p_name=>'PRCLN_PO_PFX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_PO_PFX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>5
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P67_PRCHD_PO_PFX'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999464463013848656)
,p_name=>'PRCLN_PRICE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_PRICE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Unit Cost'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'0'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_readonly_condition_type=>'EXPRESSION'
,p_readonly_condition=>':PRCLN_PRICE_TYPE = ''R'''
,p_readonly_condition2=>'PLSQL'
,p_readonly_for_each_row=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999464339786848655)
,p_name=>'PRCLN_PRICE_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_PRICE_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Price Lvl.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Line;F,Range;R'
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'F'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999464926183848661)
,p_name=>'PRCLN_PRINT_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_PRINT_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_enable_filter=>true
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999465999420848671)
,p_name=>'PRCLN_PROC_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_PROC_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>400
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999466037675848672)
,p_name=>'PRCLN_PROC_UOM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_PROC_UOM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>410
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>5
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8996103657033367700)
,p_name=>'PRCLN_PROD_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_PROD_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Item.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8996103762307367701)
,p_name=>'PRCLN_PROD_REV'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_PROD_REV'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Rev.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_item_attributes=>'readonly=readonly'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8996103950468367703)
,p_name=>'PRCLN_QTY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_QTY'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Qty.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>290
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'0.00'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8996103889241367702)
,p_name=>'PRCLN_QTY_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_QTY_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>340
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'O'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999468187358848693)
,p_name=>'PRCLN_REF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_REF'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ref.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>330
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>500
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8996103590437367699)
,p_name=>'PRCLN_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999468301901848694)
,p_name=>'PRCLN_SKS_CURRENCY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_SKS_CURRENCY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Currency'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>5
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P67_PRCHD_CURRY'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999468403616848695)
,p_name=>'PRCLN_SKS_EXCHANGE_RATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_SKS_EXCHANGE_RATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Ex. Rate'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>250
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'1.00000000'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999468483547848696)
,p_name=>'PRCLN_SKS_FC_UNIT_COST'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_SKS_FC_UNIT_COST'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Fc Unit Cost'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
,p_item_attributes=>'readonly=readonly'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'0'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999465242672848664)
,p_name=>'PRCLN_SUPLR_PROD_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_SUPLR_PROD_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Suplr. Item Desc.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>280
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=readonly'
,p_is_required=>false
,p_max_length=>150
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999465201671848663)
,p_name=>'PRCLN_SUPLR_PROD_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_SUPLR_PROD_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Suplr. Item'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=readonly'
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999465041047848662)
,p_name=>'PRCLN_TAX_SET_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_TAX_SET_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Tax Set'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct decode(applctrl_desc_level,1,tcset_desc1,NVL(tcset_desc2,tcset_desc1)) tcset_desc,tcset_set_id',
'from tax_charges_sets,tax_charges_set_ln,tax_charges,tax_charges_hd,appl_control',
'where tcset_bu = :global_bu',
'and applctrl_bu = tcset_bu and',
'TCSET_ACTIVE_FLAG = ''Y'' and',
'tcsetln_bu = tcset_bu AND ',
'tcsetln_bu = tc_bu AND ',
'tcsetln_tc_id = tc_tc_id AND ',
'tcsetln_set_id = tcset_set_id AND ',
'tc_bu = tchd_bu AND ',
'tc_tc_id = tchd_tc_id AND ',
'trunc(sysdate) BETWEEN tchd_eff_from AND tchd_eff_to',
'AND tchd_status = ''A''',
'order by 1'))
,p_lov_display_extra=>false
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999465522681848667)
,p_name=>'PRCLN_TCF_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_TCF_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>380
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999464254515848654)
,p_name=>'PRCLN_UOM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_UOM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'UOM'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct uom_uom r1,uom_uom r',
'  from unit_of_measures',
' where uom_bu = :global_bu'))
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999466990891848681)
,p_name=>'PRCLN_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>490
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999467248299848684)
,p_name=>'PRCLN_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>520
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999467463143848686)
,p_name=>'PRCLN_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>540
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999467086045848682)
,p_name=>'PRCLN_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>500
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>20
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999467209810848683)
,p_name=>'PRCLN_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>510
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999465799569848669)
,p_name=>'PRCLN_VALIDITY_OPT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCLN_VALIDITY_OPT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Validity Option'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>310
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC2:Time;T,Time with Qty.;Q'
,p_lov_display_extra=>false
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'T'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9238707866912715462)
,p_name=>'Price'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Price'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Price'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>670
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:161513102508:&SESSION.::&DEBUG.::P161513102508_PFX,P161513102508_PO_NO,P161513102508_SEQ_NO,P161513102508_PLNT:&PRCLN_PO_PFX.,&PRCLN_PO_NO.,&PRCLN_SEQ_NO.,&PRCLN_PLNT.'
,p_link_text=>'&"Price".'
,p_link_attributes=>'class=''&LINK2.'''
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9021773084995754268)
,p_name=>'Process'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Process'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Process'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>650
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:161513102507:&SESSION.::&DEBUG.::P161513102507_PFX,P161513102507_PLNT,P161513102507_PO_NO,P161513102507_SEQ_NO,P161513102507_PROD_ID,P161513102507_REV,P161513102507_SUPLR,P161513102507_UOM,P161513102507_PROD_TYPE:&PRCLN_PO_PFX.,&PRCLN_PL'
||'NT.,&PRCLN_PO_NO.,&PRCLN_SEQ_NO.,&PRCLN_PROD_ID.,&PRCLN_PROD_REV.,&P161513102501_PRCHD_SUPLR.,&PRCLN_UOM.,&P161513102501_PRCHD_PROD_TYPE.'
,p_link_text=>'&"Process".'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>':P67_PRCHD_PROD_TYPE = ''SC'' AND  :P67_PRCHD_STATUS IN (''E'')'
,p_display_condition2=>'PLSQL'
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(8999468619706848698)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>580
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9000178320573231157)
,p_name=>'SIZE_DESC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SIZE_DESC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Size'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>610
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=readonly'
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9021773619637754274)
,p_name=>'SUPLLIER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SUPLLIER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>660
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9017177483124501874)
,p_name=>'T_C'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'T_C'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'T & C'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>630
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:161513102505:&SESSION.::&DEBUG.::P161513102505_PLNT,P161513102505_PO_NO,P161513102505_PO_PFX,P161513102505_SEQ_NO:&PRCLN_PLNT.,&PRCLN_PO_NO.,&PRCLN_PO_PFX.,&PRCLN_SEQ_NO.'
,p_link_text=>'&T_C.'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>':P67_PRCHD_STATUS IN (''E'')'
,p_display_condition2=>'PLSQL'
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(8996103034801367694)
,p_internal_uid=>3514141199257756666
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(8999531181929860187)
,p_interactive_grid_id=>wwv_flow_imp.id(8996103034801367694)
,p_static_id=>'12991649'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(8999531411694860187)
,p_report_id=>wwv_flow_imp.id(8999531181929860187)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7700420303431527734)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(8999469142526848703)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>222
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(7701262408610192884)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>58
,p_column_id=>wwv_flow_imp.id(9000182506477231198)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>106
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999531715957860188)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(8996103132769367695)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999532704647860193)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(8996103306504367696)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999533514107860196)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(8996103401104367697)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999534455071860199)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(8996103449334367698)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999535371625860203)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(8996103590437367699)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999536275278860207)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(8996103657033367700)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>182
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999537156853860210)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(8996103762307367701)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999538029787860213)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(8996103889241367702)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999538973811860217)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(8996103950468367703)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999539828173860220)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(8999464254515848654)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>66
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999540809329860223)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(8999464339786848655)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999541664514860228)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(8999464463013848656)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>96
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999542588972860231)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(8999464600052848657)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>87
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999543476391860238)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(8999464693396848658)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999544347935860245)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(8999464749953848659)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999545259396860249)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(8999464830053848660)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999546209665860256)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(8999464926183848661)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>59
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999547050452860263)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(8999465041047848662)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999547919170860271)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(8999465201671848663)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>145
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999548828447860276)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(8999465242672848664)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>238
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999549771012860281)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(8999465369807848665)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>82
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999550669742860287)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(8999465438912848666)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>88
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999551442235860292)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(8999465522681848667)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999552349252860296)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(8999465690257848668)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999553305952860301)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>40
,p_column_id=>wwv_flow_imp.id(8999465799569848669)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999555099790860315)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>41
,p_column_id=>wwv_flow_imp.id(8999465999420848671)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999555975335860321)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>42
,p_column_id=>wwv_flow_imp.id(8999466037675848672)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999556835978860326)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>43
,p_column_id=>wwv_flow_imp.id(8999466185119848673)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999557783500860331)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>44
,p_column_id=>wwv_flow_imp.id(8999466240919848674)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999558684329860337)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>45
,p_column_id=>wwv_flow_imp.id(8999466402847848675)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999559601591860342)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(8999466426547848676)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999560466875860346)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>46
,p_column_id=>wwv_flow_imp.id(8999466526455848677)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999561346724860351)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>47
,p_column_id=>wwv_flow_imp.id(8999466650518848678)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999562243498860356)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>48
,p_column_id=>wwv_flow_imp.id(8999466761799848679)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999563187798860362)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>49
,p_column_id=>wwv_flow_imp.id(8999466835378848680)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999564083099860367)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>50
,p_column_id=>wwv_flow_imp.id(8999466990891848681)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999564918417860373)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>51
,p_column_id=>wwv_flow_imp.id(8999467086045848682)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999565895202860379)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>52
,p_column_id=>wwv_flow_imp.id(8999467209810848683)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999566798214860385)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>54
,p_column_id=>wwv_flow_imp.id(8999467248299848684)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999567585651860392)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>55
,p_column_id=>wwv_flow_imp.id(8999467315438848685)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999568455992860396)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>56
,p_column_id=>wwv_flow_imp.id(8999467463143848686)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999569354480860401)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(8999467577109848687)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999570295414860406)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(8999467682458848688)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>125
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999571203871860410)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(8999467775018848689)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999572084844860415)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(8999467889649848690)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999572920132860420)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>53
,p_column_id=>wwv_flow_imp.id(8999467926793848691)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>169
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999573857347860424)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>60
,p_column_id=>wwv_flow_imp.id(8999468044035848692)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999574796570860429)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>57
,p_column_id=>wwv_flow_imp.id(8999468187358848693)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999575683135860435)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(8999468301901848694)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>99
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999576513556860440)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(8999468403616848695)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999577488941860445)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(8999468483547848696)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>107
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999578322995860449)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>61
,p_column_id=>wwv_flow_imp.id(8999468549474848697)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999579307520860456)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>62
,p_column_id=>wwv_flow_imp.id(8999468619706848698)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999632391449873307)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(8999468747293848699)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(8999633611519873312)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>63
,p_column_id=>wwv_flow_imp.id(8999468909399848700)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9000274322688268809)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(9000178209987231155)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9000275251308268815)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(9000178222500231156)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9000276150909268820)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(9000178320573231157)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9018677636705345270)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>59
,p_column_id=>wwv_flow_imp.id(9017177483124501874)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>126
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9020211878130387440)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>59
,p_column_id=>wwv_flow_imp.id(9017178801896501887)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>108
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9021842202108991193)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>64
,p_column_id=>wwv_flow_imp.id(9021773084995754268)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>93
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9023312921403282031)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>65
,p_column_id=>wwv_flow_imp.id(9021773619637754274)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9213132895042776624)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(9208280956899050877)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>214
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9238855258167828446)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>64
,p_column_id=>wwv_flow_imp.id(9238707866912715462)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>68
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9386085102689767968)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>66
,p_column_id=>wwv_flow_imp.id(9376503943821180557)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9386163073784855842)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>67
,p_column_id=>wwv_flow_imp.id(9376504164260180559)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9386169340740855888)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>68
,p_column_id=>wwv_flow_imp.id(9376504266501180560)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9402093155298651645)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>69
,p_column_id=>wwv_flow_imp.id(9402062210129608858)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9817267559638362623)
,p_view_id=>wwv_flow_imp.id(8999531411694860187)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(9814049510794841874)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>101
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9009432706157009273)
,p_plug_name=>'Notes'
,p_static_id=>'notes'
,p_region_name=>'ig_line4'
,p_parent_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       PRCN_BU,',
'       PRCN_PLNT,',
'       PRCN_PO_PFX,',
'       PRCN_PO_NO,',
'       PRCN_SEQ_NO,',
'       PRCN_NOTE,',
'       PRCN_CRE_BY,',
'       PRCN_CRE_IP_ADDR,',
'       PRCN_CRE_OS_USER,',
'       PRCN_CRE_DATE,',
'       PRCN_UPD_BY,',
'       PRCN_UPD_IP_ADDR,',
'       PRCN_UPD_OS_USER,',
'       PRCN_UPD_DATE,',
'       PRCN_CRE_EMP_ID,',
'       PRCN_UPD_EMP_ID',
'  from PUR_RATE_CONTR_NOTES',
'  WHERE PRCN_BU=:GLOBAL_BU',
'    AND PRCN_PLNT  =:P67_PRCHD_PLNT',
'	 AND PRCN_PO_PFX  =:P67_PRCHD_PO_PFX',
'	 AND PRCN_PO_NO  =:P67_PRCHD_PO_NO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P67_PRCHD_PO_PFX,P67_PRCHD_PO_NO,P67_PRCHD_PLNT'
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P67_PRCHD_TAX_FLAG in (''Y'')'
,p_plug_read_only_when2=>'PLSQL'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Notes'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009434616886009293)
,p_name=>'APEX$ROW_ACTION'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009434767499009294)
,p_name=>'APEX$ROW_SELECTOR'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009432963958009276)
,p_name=>'PRCN_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCN_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_BU'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009433605307009282)
,p_name=>'PRCN_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCN_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009433864605009285)
,p_name=>'PRCN_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCN_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009434320656009290)
,p_name=>'PRCN_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCN_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009433629545009283)
,p_name=>'PRCN_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCN_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009433808258009284)
,p_name=>'PRCN_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCN_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009433502159009281)
,p_name=>'PRCN_NOTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCN_NOTE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Note'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>500
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009433042311009277)
,p_name=>'PRCN_PLNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCN_PLNT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P67_PRCHD_PLNT'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009433266915009279)
,p_name=>'PRCN_PO_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCN_PO_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P67_PRCHD_PO_NO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009433178740009278)
,p_name=>'PRCN_PO_PFX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCN_PO_PFX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P67_PRCHD_PO_PFX'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009433366001009280)
,p_name=>'PRCN_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCN_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_enable_filter=>true
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009433993632009286)
,p_name=>'PRCN_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCN_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':GLOBAL_USER'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009434225383009289)
,p_name=>'PRCN_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCN_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009434488558009291)
,p_name=>'PRCN_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCN_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009434101942009287)
,p_name=>'PRCN_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCN_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009434160579009288)
,p_name=>'PRCN_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PRCN_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009434598710009292)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(9009432825749009275)
,p_internal_uid=>3527470990205398247
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(9010825270867248613)
,p_interactive_grid_id=>wwv_flow_imp.id(9009432825749009275)
,p_static_id=>'13104590'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(9010825497219248613)
,p_report_id=>wwv_flow_imp.id(9010825270867248613)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9010825980784248617)
,p_view_id=>wwv_flow_imp.id(9010825497219248613)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(9009432963958009276)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9010826878038248623)
,p_view_id=>wwv_flow_imp.id(9010825497219248613)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(9009433042311009277)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9010827764289248629)
,p_view_id=>wwv_flow_imp.id(9010825497219248613)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(9009433178740009278)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9010828662120248635)
,p_view_id=>wwv_flow_imp.id(9010825497219248613)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(9009433266915009279)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9010829586346248640)
,p_view_id=>wwv_flow_imp.id(9010825497219248613)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(9009433366001009280)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>69.743
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9010830485934248646)
,p_view_id=>wwv_flow_imp.id(9010825497219248613)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(9009433502159009281)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9010831400217248654)
,p_view_id=>wwv_flow_imp.id(9010825497219248613)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(9009433605307009282)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9010832266010248660)
,p_view_id=>wwv_flow_imp.id(9010825497219248613)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(9009433629545009283)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9010833087619248667)
,p_view_id=>wwv_flow_imp.id(9010825497219248613)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(9009433808258009284)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9010833939452248673)
,p_view_id=>wwv_flow_imp.id(9010825497219248613)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(9009433864605009285)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9010834833640248678)
,p_view_id=>wwv_flow_imp.id(9010825497219248613)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(9009433993632009286)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9010835738157248682)
,p_view_id=>wwv_flow_imp.id(9010825497219248613)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(9009434101942009287)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9010836657818248687)
,p_view_id=>wwv_flow_imp.id(9010825497219248613)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(9009434160579009288)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9010837558683248690)
,p_view_id=>wwv_flow_imp.id(9010825497219248613)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(9009434225383009289)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9010838499991248693)
,p_view_id=>wwv_flow_imp.id(9010825497219248613)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(9009434320656009290)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9010839357925248696)
,p_view_id=>wwv_flow_imp.id(9010825497219248613)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(9009434488558009291)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9010840221157248699)
,p_view_id=>wwv_flow_imp.id(9010825497219248613)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(9009434598710009292)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9010841184250248704)
,p_view_id=>wwv_flow_imp.id(9010825497219248613)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(9009434616886009293)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9010842090904248707)
,p_view_id=>wwv_flow_imp.id(9010825497219248613)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(9009434767499009294)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8996153992665406123)
,p_plug_name=>'&P161513102501_DISPLAY.'
,p_static_id=>'p161513102501-display'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:is-expanded:t-Region--noUI:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(10650486579108505317)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'PUR_RATE_CONTR_HD'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P67_PRCHD_STATUS in (''N'',''A'',''C'')'
,p_plug_read_only_when2=>'PLSQL'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(10641226694882398681)
,p_name=>'Preview Cost'
,p_static_id=>'preview-cost'
,p_parent_plug_id=>wwv_flow_imp.id(9242460455010836264)
,p_template=>wwv_flow_imp.id(10650486579108505317)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:is-expanded:t-Region--noUI:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-AVPList--rightAligned'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(SUM(PRCLN_PRICE),0) "Gross Amount",',
'		 NVL(SUM(PRCLN_DISC_AMT),0) "Disc %",',
'       NVL(SUM((PRCLN_PRICE)-(PRCLN_DISC_AMT)),0) "Net Amount",',
'		 NVL(SUM(prcln_tc_amt),0)"Tax Amount",',
'		 NVL(SUM((PRCLN_PRICE)+(prcln_tc_amt)),0) "Tot Value"',
'  FROM (SELECT PRCLN_PRICE,PRCLN_DISC_AMT,',
'  (SELECT SUM(PRCT_TC_PCT) ',
'          FROM PUR_RATE_CONTR_TAXES',
'     WHERE PRCT_BU = PRCLN_BU',
'		AND PRCT_PO_NO = PRCLN_PO_NO',
'		AND PRCT_PO_PFX = PRCLN_PO_PFX',
'		AND PRCT_PLNT = PRCLN_PLNT',
'       AND prct_seq_no = PRCLN_SEQ_NO',
'		 AND PRCT_SUPLR_CHRG_FLAG = ''Y'')prcln_tc_amt',
'   FROM PUR_RATE_CONTR_LN',
'    WHERE PRCLN_BU  =:GLOBAL_BU',
'	AND PRCLN_PLNT =:P67_PRCHD_PLNT',
'	AND PRCLN_PO_NO =:P67_PRCHD_PO_NO',
'	AND PRCLN_PO_PFX =:P67_PRCHD_PO_PFX)',
'',
'',
'',
''))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P67_PRCHD_PLNT,P67_PRCHD_PO_PFX,P67_PRCHD_PO_NO'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650549553186505401)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7700534150696485687)
,p_query_column_id=>2
,p_column_alias=>'Disc %'
,p_column_display_sequence=>20
,p_column_heading=>'Disc %'
,p_column_format=>'999G999G999G999G990D00'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7700535025304485688)
,p_query_column_id=>1
,p_column_alias=>'Gross Amount'
,p_column_display_sequence=>10
,p_column_heading=>'Gross Amount'
,p_column_format=>'999G999G999G999G990D00'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7700534602892485687)
,p_query_column_id=>3
,p_column_alias=>'Net Amount'
,p_column_display_sequence=>30
,p_column_heading=>'Net Amount'
,p_column_format=>'999G999G999G999G990D00'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7700535351658485688)
,p_query_column_id=>4
,p_column_alias=>'Tax Amount'
,p_column_display_sequence=>40
,p_column_heading=>'Tax Amount'
,p_column_format=>'999G999G999G999G990D00'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7700533768908485684)
,p_query_column_id=>5
,p_column_alias=>'Tot Value'
,p_column_display_sequence=>50
,p_column_heading=>'Tot Value'
,p_column_format=>'999G999G999G999G990D00'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9242460455010836264)
,p_plug_name=>'Right Colunm'
,p_static_id=>'right-colunm'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9008047045969391097)
,p_plug_name=>'T & C'
,p_static_id=>'t-c'
,p_parent_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_region_css_classes=>'js-dialog-size1200x400'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9009110908254837187)
,p_plug_name=>'Value'
,p_static_id=>'value'
,p_region_name=>'ig_line3'
,p_parent_plug_id=>wwv_flow_imp.id(9008047045969391097)
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-Region--hideShowIconsMath:is-expanded:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       OHTAV_BU,',
'       OHTAV_PLNT,',
'       OHTAV_PO_PFX,',
'       OHTAV_PO_NO,',
'       OHTAV_SEQ_NO,',
'       OHTAV_SUB_SEQ_NO,',
'       OHTAV_ATTR_VAL,',
'       OHTAV_CRE_BY,',
'       OHTAV_CRE_IP_ADDR,',
'       OHTAV_CRE_OS_USER,',
'       OHTAV_CRE_DATE,',
'       OHTAV_UPD_BY,',
'       OHTAV_UPD_IP_ADDR,',
'       OHTAV_UPD_OS_USER,',
'       OHTAV_UPD_DATE,',
'       OHTAV_CRE_EMP_ID,',
'       OHTAV_UPD_EMP_ID,',
'		  ''<span class="fa fa-trash-o" aria-hidden="true" style="color:red"></span>'' del',
'  from OPO_HD_TNC_ATTR_VAL',
' /* where OHTAV_BU =:global_bu',
'    and OHTAV_PLNT = :P67_PRCHD_PLNT',
'	 and OHTAV_PO_PFX =:P67_PRCHD_PO_PFX',
'	 and OHTAV_PO_NO =:P67_PRCHD_PO_NO',
'	 and OHTAV_SEQ_NO = :P67_OHTA_PRINT_SEQ*/',
'',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(9008047138365391098)
,p_ajax_items_to_submit=>'P67_PRCHD_PLNT,P67_PRCHD_PO_PFX,P67_PRCHD_PO_NO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Value'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009431088611009257)
,p_name=>'APEX$ROW_ACTION'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009431163523009258)
,p_name=>'APEX$ROW_SELECTOR'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9376506270593180580)
,p_name=>'DEL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Delete'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>210
,p_value_alignment=>'CENTER'
,p_link_target=>'javascript:$s(''P161513102501_OHTAV_SUB_SEQ_NO'',''&OHTAV_SUB_SEQ_NO.''),$s(''P161513102501_SEQ_NO_VAL'',''&OHTAV_SEQ_NO.'');apex.confirm("Do you want to Cancel the document?",''del_val'');'
,p_link_text=>'&DEL.'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009111724766837196)
,p_name=>'OHTAV_ATTR_VAL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTAV_ATTR_VAL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Value'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009111132637837190)
,p_name=>'OHTAV_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTAV_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'BU'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(9008047326410391100)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009111844401837197)
,p_name=>'OHTAV_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTAV_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>110
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':global_user'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009112197063837200)
,p_name=>'OHTAV_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTAV_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'sysdate'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009430906193009255)
,p_name=>'OHTAV_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTAV_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>190
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009111939636837198)
,p_name=>'OHTAV_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTAV_CRE_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009112098538837199)
,p_name=>'OHTAV_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTAV_CRE_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009111261821837191)
,p_name=>'OHTAV_PLNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTAV_PLNT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'PLNT'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(9008047466933391101)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009111436258837193)
,p_name=>'OHTAV_PO_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTAV_PO_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'PO NO'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(9008047631602391103)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009111395479837192)
,p_name=>'OHTAV_PO_PFX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTAV_PO_PFX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'PO PFX'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(9008047570399391102)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009111597349837194)
,p_name=>'OHTAV_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTAV_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(9009107585999837154)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009111625036837195)
,p_name=>'OHTAV_SUB_SEQ_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTAV_SUB_SEQ_NO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DISPLAY_ONLY'
,p_heading=>'Line'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN')).to_clob
,p_enable_filter=>true
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009112291700837201)
,p_name=>'OHTAV_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTAV_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>':global_user'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009430778373009254)
,p_name=>'OHTAV_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTAV_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'EXPRESSION'
,p_default_language=>'PLSQL'
,p_default_expression=>'sysdate'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009430934087009256)
,p_name=>'OHTAV_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTAV_UPD_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>200
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009112407014837202)
,p_name=>'OHTAV_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTAV_UPD_IP_ADDR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009112425174837203)
,p_name=>'OHTAV_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OHTAV_UPD_OS_USER'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(9009111031322837189)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(9009111003887837188)
,p_internal_uid=>3527149168344226160
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(9009439641951018237)
,p_interactive_grid_id=>wwv_flow_imp.id(9009111003887837188)
,p_static_id=>'13090734'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(9009439818973018237)
,p_report_id=>wwv_flow_imp.id(9009439641951018237)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009440345391018238)
,p_view_id=>wwv_flow_imp.id(9009439818973018237)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(9009111031322837189)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009441305536018242)
,p_view_id=>wwv_flow_imp.id(9009439818973018237)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(9009111132637837190)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009442206916018245)
,p_view_id=>wwv_flow_imp.id(9009439818973018237)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(9009111261821837191)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009443024133018248)
,p_view_id=>wwv_flow_imp.id(9009439818973018237)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(9009111395479837192)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009443997878018251)
,p_view_id=>wwv_flow_imp.id(9009439818973018237)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(9009111436258837193)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009444895523018254)
,p_view_id=>wwv_flow_imp.id(9009439818973018237)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(9009111597349837194)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009445770726018257)
,p_view_id=>wwv_flow_imp.id(9009439818973018237)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(9009111625036837195)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>53
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009446638358018262)
,p_view_id=>wwv_flow_imp.id(9009439818973018237)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(9009111724766837196)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>241.927
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009447592094018265)
,p_view_id=>wwv_flow_imp.id(9009439818973018237)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(9009111844401837197)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009448442776018268)
,p_view_id=>wwv_flow_imp.id(9009439818973018237)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(9009111939636837198)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009449231313018274)
,p_view_id=>wwv_flow_imp.id(9009439818973018237)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(9009112098538837199)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009450166377018281)
,p_view_id=>wwv_flow_imp.id(9009439818973018237)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(9009112197063837200)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009451031282018287)
,p_view_id=>wwv_flow_imp.id(9009439818973018237)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(9009112291700837201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009452003360018293)
,p_view_id=>wwv_flow_imp.id(9009439818973018237)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(9009112407014837202)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009452833197018298)
,p_view_id=>wwv_flow_imp.id(9009439818973018237)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(9009112425174837203)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009453812081018306)
,p_view_id=>wwv_flow_imp.id(9009439818973018237)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(9009430778373009254)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009454647137018310)
,p_view_id=>wwv_flow_imp.id(9009439818973018237)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(9009430906193009255)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009455563214018317)
,p_view_id=>wwv_flow_imp.id(9009439818973018237)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(9009430934087009256)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009456416489018323)
,p_view_id=>wwv_flow_imp.id(9009439818973018237)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(9009431088611009257)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9009457372043018329)
,p_view_id=>wwv_flow_imp.id(9009439818973018237)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(9009431163523009258)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(9392548229997517101)
,p_view_id=>wwv_flow_imp.id(9009439818973018237)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(9376506270593180580)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700443619822485454)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(8996102937594367693)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P67_PRCHD_STATUS IN (''E'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700487398153485556)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9011037315220335359)
,p_button_name=>'Add_Attachment'
,p_static_id=>'add-attachment'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add '
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:41531000:&SESSION.::&DEBUG.:41531000:P41531000_DM_VOU_NO,P41531000_DM_VOU_PFX,P41531000_DM_VOU_PLNT,P41531000_ROWID,P41531000_PAGE_NO,P41531000_DM_MODULE,P41531000_DM_DOC_NO,P41531000_DM_PARTY_TYPE,P41531000_DM_VOU_TYPE,P41531000_DM_VOU_LEVEL:&P67_PRCHD_PO_NO.,&P67_PRCHD_PO_PFX.,&P67_PRCHD_PLNT.,&P67_ROWID.,161513102501,POM,&P67_DOC_NO.,S,PR,O'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700511600935485610)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9008047138365391098)
,p_button_name=>'Add_Attribute'
,p_static_id=>'add-attribute'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Attribute'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P67_PRCHD_STATUS IN (''E'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700465647726485496)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9005855732814036792)
,p_button_name=>'Add_Charges'
,p_static_id=>'add-charges'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Charges'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P67_PRCHD_STATUS IN (''E'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700497098350485573)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9009432706157009273)
,p_button_name=>'Add_Note'
,p_static_id=>'add-note'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Note'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P67_PRCHD_STATUS IN (''E'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700530419401485678)
,p_button_sequence=>20
,p_button_name=>'Add_OPEN_BLANK_ENTRY'
,p_static_id=>'add-open-blank-entry'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Open'
,p_button_position=>'LEGACY_ORPHAN_COMPONENTS'
,p_button_redirect_url=>'f?p=&APP_ID.:67:&SESSION.::&DEBUG.:CR,161513102501::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700523357073485654)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9009110908254837187)
,p_button_name=>'Add_Value'
,p_static_id=>'add-value'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Value'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P67_PRCHD_STATUS IN (''E'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700531184165485679)
,p_button_sequence=>130
,p_button_name=>'Attachment'
,p_static_id=>'attachment'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Attachment'
,p_button_position=>'LEGACY_ORPHAN_COMPONENTS'
,p_button_redirect_url=>'f?p=&APP_ID.:415310001:&SESSION.::&DEBUG.::P415310001_DM_VOU_NO,P415310001_DM_VOU_PFX,P415310001_DM_VOU_TYPE,P415310001_STATUS:&P67_PRCHD_PO_NO.,&P67_PRCHD_PO_PFX.,PO,&P67_PRCHD_STATUS.'
,p_button_condition=>'P67_ROWID'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-paperclip'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700528416626485676)
,p_button_sequence=>120
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'LEGACY_ORPHAN_COMPONENTS'
,p_button_redirect_url=>'&P67_PAGE_NAVIGATE.'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700529214917485678)
,p_button_sequence=>50
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'LEGACY_ORPHAN_COMPONENTS'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P67_PRCHD_TAX_FLAG IN (''N'') AND ',
':P67_PRCHD_PO_NO IS NOT NULL AND ',
':P67_PRCHD_STATUS IN (''E'')'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700443956773485454)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8996102937594367693)
,p_button_name=>'Charges'
,p_static_id=>'charges'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Charges'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700529985792485678)
,p_button_sequence=>30
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'LEGACY_ORPHAN_COMPONENTS'
,p_button_condition=>'P67_ROWID'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700366837089485156)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_grid_new_row=>'Y'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700443160500485454)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(8996102937594367693)
,p_button_name=>'Download'
,p_static_id=>'download'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700512432974485610)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9008047138365391098)
,p_button_name=>'Download_Attribute'
,p_static_id=>'download-attribute'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download Attribute'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700466532958485498)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9005855732814036792)
,p_button_name=>'Download_Charges'
,p_static_id=>'download-charges'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download Charges'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700497905972485573)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9009432706157009273)
,p_button_name=>'Download_Note'
,p_static_id=>'download-note'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download Note'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700524179616485668)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9009110908254837187)
,p_button_name=>'Download_Value'
,p_static_id=>'download-value'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download Value'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700527626310485674)
,p_button_sequence=>70
,p_button_name=>'Entry_Complete'
,p_static_id=>'entry-complete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'LEGACY_ORPHAN_COMPONENTS'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P67_PRCHD_STATUS IN (''E'',''L'') AND ',
' :prcln_prod_id IS  NULL AND ',
':P67_PRCHD_PO_NO IS NOT NULL'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700528767457485676)
,p_button_sequence=>10
,p_button_name=>'Fetch'
,p_static_id=>'fetch'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fetch'
,p_button_position=>'LEGACY_ORPHAN_COMPONENTS'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P67_PRCHD_TAX_FLAG IN (''N'') AND ',
':P67_PRCHD_PO_NO IS NOT NULL AND ',
':P67_PRCHD_STATUS IN (''E'')'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700531546783485679)
,p_button_sequence=>140
,p_button_name=>'First'
,p_static_id=>'first'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'First'
,p_button_position=>'LEGACY_ORPHAN_COMPONENTS'
,p_button_redirect_url=>'f?p=&APP_ID.:67:&SESSION.::&DEBUG.::P67_ROWID:&GLOBAL_FIRST_ROWID.'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-angle-double-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700444366665485456)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(8996102937594367693)
,p_button_name=>'General'
,p_static_id=>'general'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'General'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700526409992485673)
,p_button_sequence=>80
,p_button_name=>'Include_Tax'
,p_static_id=>'include-tax'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Inc. Tax'
,p_button_position=>'LEGACY_ORPHAN_COMPONENTS'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
':P67_ROWID IS NOT NULL AND :P67_PRCHD_TAX_FLAG = ''N'' AND :P67_PRCHD_STATUS in (''E'')'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700526818762485674)
,p_button_sequence=>90
,p_button_name=>'Include_Tax1'
,p_static_id=>'include-tax-2'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Inc. Tax'
,p_button_position=>'LEGACY_ORPHAN_COMPONENTS'
,p_button_condition=>':P67_ROWID IS NOT NULL AND :P67_PRCHD_TAX_FLAG = ''Y'' AND :P67_PRCHD_STATUS in (''E'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-check-square'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700532822470485681)
,p_button_sequence=>170
,p_button_name=>'Last'
,p_static_id=>'last'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Last'
,p_button_position=>'LEGACY_ORPHAN_COMPONENTS'
,p_button_redirect_url=>'f?p=&APP_ID.:67:&SESSION.::&DEBUG.::P67_ROWID:&GLOBAL_LAST_ROWID.'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-angle-double-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700532381539485681)
,p_button_sequence=>160
,p_button_name=>'Next'
,p_static_id=>'next'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next'
,p_button_position=>'LEGACY_ORPHAN_COMPONENTS'
,p_button_redirect_url=>'f?p=&APP_ID.:67:&SESSION.::&DEBUG.::P67_ROWID:&GLOBAL_NEXT_ROWID.'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-angle-right'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700444830864485456)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(8996102937594367693)
,p_button_name=>'Notes'
,p_static_id=>'notes'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Notes'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700532005312485681)
,p_button_sequence=>150
,p_button_name=>'Previous'
,p_static_id=>'previous'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Previous'
,p_button_position=>'LEGACY_ORPHAN_COMPONENTS'
,p_button_redirect_url=>'f?p=&APP_ID.:67:&SESSION.::&DEBUG.::P67_ROWID:&GLOBAL_PREV_ROWID.'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-angle-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700530762100485679)
,p_button_sequence=>110
,p_button_name=>'Print'
,p_static_id=>'print'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Print'
,p_button_position=>'LEGACY_ORPHAN_COMPONENTS'
,p_button_redirect_url=>'javascript:window.open(''&JASPER_SERVER_URL./POM/POM2020C.pdf?p_bu=&P67_PRCHD_BU.&p_plnt=&P67_PRCHD_PLNT.&p_doc_pfx=&P67_PRCHD_PO_PFX.&p_doc_no=&P67_PRCHD_PO_NO.&p_sup_id=&P67_PRCHD_SUPLR.&j_username=&JASPER_SERVER_USR_ID.&j_password=&JASPER_SERVER_PWD.'');'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700442803750485453)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(8996102937594367693)
,p_button_name=>'Save'
,p_static_id=>'save'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P67_PRCHD_STATUS IN (''E'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700511966544485610)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9008047138365391098)
,p_button_name=>'Save_Attribute'
,p_static_id=>'save-attribute'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Attribute'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P67_PRCHD_STATUS IN (''E'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700466115959485496)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9005855732814036792)
,p_button_name=>'Save_Charges'
,p_static_id=>'save-charges'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Charges'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P67_PRCHD_STATUS IN (''E'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700497439641485573)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9009432706157009273)
,p_button_name=>'Save_Note'
,p_static_id=>'save-note'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Note'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P67_PRCHD_STATUS IN (''E'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700523796179485656)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(9009110908254837187)
,p_button_name=>'Save_Value'
,p_static_id=>'save-value'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save Value'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P67_PRCHD_STATUS IN (''E'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700367699502485160)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_button_name=>'ShowLess'
,p_static_id=>'showless'
,p_button_static_id=>'ShowLess'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Show Less'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700367272314485159)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_button_name=>'ShowMore'
,p_static_id=>'showmore'
,p_button_static_id=>'ShowMore'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Show More'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-angle-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700445135712485456)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(8996102937594367693)
,p_button_name=>'T_C'
,p_static_id=>'t-c'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'T & C'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700529612364485678)
,p_button_sequence=>40
,p_button_name=>'Update'
,p_static_id=>'update'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'LEGACY_ORPHAN_COMPONENTS'
,p_button_condition=>':P67_ROWID is not null and :P67_PRCHD_STATUS in (''E'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700527156039485674)
,p_button_sequence=>60
,p_button_name=>'Update_Price'
,p_static_id=>'update-price'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Update Price'
,p_button_position=>'LEGACY_ORPHAN_COMPONENTS'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P67_PRCHD_TAX_FLAG IN (''N'') AND ',
':P67_PRCHD_PO_NO IS NOT NULL AND ',
':P67_PRCHD_STATUS IN (''E'')'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-badge-dollar'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7700528031922485676)
,p_button_sequence=>100
,p_button_name=>'WF_Hist'
,p_static_id=>'wf-hist'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'WF Hist'
,p_button_position=>'LEGACY_ORPHAN_COMPONENTS'
,p_button_redirect_url=>'f?p=&APP_ID.:235130060:&SESSION.::&DEBUG.::P235130060_P_DOC_NO,P235130060_P_DOC_PFX,P235130060_P_PLNT,P235130060_P_WF_TYPE:&P67_PRCHD_PO_NO.,&P67_PRCHD_PO_PFX.,&P67_PRCHD_PLNT.,&P67_PRCHD_PROD_TYPE.'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-mail-forward'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7700591408263485779)
,p_branch_name=>'Go to page 161513102503'
,p_branch_action=>'f?p=&APP_ID.:161513102503:&SESSION.::&DEBUG.::P161513102503_PLNT,P161513102503_PO_NO,P161513102503_PO_PFX:&P161513102501_PRCHD_PLNT.,&P161513102501_PRCHD_PO_NO.,&P161513102501_PRCHD_PO_PFX.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(7700528767457485676)
,p_branch_sequence=>30
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7700591795646485781)
,p_branch_name=>'Go to page 161513102504'
,p_branch_action=>'f?p=&APP_ID.:161513102504:&SESSION.::&DEBUG.::P161513102504_PLNT,P161513102504_PO_NO,P161513102504_PO_PFX:&P161513102501_PRCHD_PLNT.,&P161513102501_PRCHD_PO_NO.,&P161513102501_PRCHD_PO_PFX.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(7700527156039485674)
,p_branch_sequence=>40
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7700592194338485781)
,p_branch_name=>'Go to page 1615131025'
,p_branch_action=>'f?p=&APP_ID.:1615131025:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>50
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'Entry_Complete,CANCEL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7700592631289485781)
,p_branch_name=>'Go to page 1615131025'
,p_branch_action=>'f?p=&APP_ID.:1615131025:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(7700527626310485674)
,p_branch_sequence=>10
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>':P67_WF_COUNT = ''DIRECT'''
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7700593030870485781)
,p_branch_name=>'Go to page 236131090'
,p_branch_action=>'f?p=&APP_ID.:236131090:&SESSION.::&DEBUG.::P236131090_P_PLNT,P236131090_P_WF_TYPE,P236131090_P_DOC_PFX,P236131090_P_DOC_NO,P236131090_P_DATE,P236131090_P_PAGE_ID:&P161513102501_PRCHD_PLNT.,&P161513102501_WF_TYPE.,&P161513102501_PRCHD_PO_PFX.,&P161513102501_PRCHD_PO_NO.,&P161513102501_PRCHD_PO_DATE.,1615131025&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(7700527626310485674)
,p_branch_sequence=>20
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>':P67_WF_COUNT = ''FORWARD'''
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700499412171485578)
,p_name=>'67_P12501_PRCHD_FROM_CITY__1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_imp.id(9009432529019009272)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_prompt=>'From City'
,p_source=>'PRCHD_FROM_CITY_NAME'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT city_name1,city_id',
'      FROM cities',
' ORDER by 2'))
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'From City')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700379224364485182)
,p_name=>'67_P_PRCHD_PRICE_TERM_DESC'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_prompt=>'Price Term Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700378335881485181)
,p_name=>'67_P_PRCHD_SHIP_VIA_DESC'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_prompt=>'Ship  Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700488210566485557)
,p_name=>'P67_ATT_SEQ_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9011037315220335359)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700376828327485179)
,p_name=>'P67_CC_CODE_DESC'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_prompt=>'CPC Code Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700368123913485160)
,p_name=>'P67_DISPLAY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700487751444485556)
,p_name=>'P67_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9011037315220335359)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700368528776485163)
,p_name=>'P67_NEXT_LAST_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700524455680485668)
,p_name=>'P67_OHTAV_SUB_SEQ_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9009110908254837187)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700512761271485612)
,p_name=>'P67_OHTA_PRINT_SEQ'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9008047138365391098)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700371154817485170)
,p_name=>'P67_PAGE_NAVIGATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700377625490485181)
,p_name=>'P67_PAY_TERM_DESC'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_prompt=>'Pay Term Desc.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700447568848485460)
,p_name=>'P67_PFX'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8996102937594367693)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700447965724485460)
,p_name=>'P67_PLNT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8996102937594367693)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700379617265485182)
,p_name=>'P67_PLNT_DESC'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT bup_NAME1',
'  FROM business_units, bus_unit_plants, appl_user_plant_access',
' WHERE bup_bu = :global_bu',
'   AND  bup_bu = bu_id',
'       AND bup_bu = auba_bu',
'       AND bup_plant_id = auba_plant',
'       AND auba_user_id = :global_user',
'       AND (TRUNC (SYSDATE) BETWEEN auba_from AND auba_to)',
'       AND bup_mfg_flag = ''M''',
'       AND auba_deflt_flag = ''Y'''))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Unit'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P67_ROWID IS NOT NULL AND :P67_PRCHD_TAX_FLAG in (''Y'') AND ',
':P67_PRCHD_STATUS in (''A'',''N'',''C'')'))
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700447230931485459)
,p_name=>'P67_PO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8996102937594367693)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700372786072485173)
,p_name=>'P67_PRCHD_AGGR_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_prompt=>'Aggr. Date'
,p_source=>'PRCHD_AGGR_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P67_PRCHD_TAX_FLAG in (''Y'') AND ',
':P67_PRCHD_STATUS in (''A'',''N'',''C'')'))
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700372365829485171)
,p_name=>'P67_PRCHD_AGGR_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_prompt=>'Aggr. No.'
,p_source=>'PRCHD_AGGR_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>15
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P67_PRCHD_TAX_FLAG in (''Y'') AND ',
':P67_PRCHD_STATUS in (''A'',''N'',''C'')'))
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700388777800485196)
,p_name=>'P67_PRCHD_BILLFR_LOC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_BILLFR_LOC_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700369216247485167)
,p_name=>'P67_PRCHD_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'PRCHD_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700376427413485179)
,p_name=>'P67_PRCHD_CC_CODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_prompt=>'CPC'
,p_source=>'PRCHD_CC_CODE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sELECT pcc_desc,pcc_cc_code',
'		  FROM profit_cost_centers',
'		 WHERE pcc_bu = :GLOBAL_bu',
'		   AND pcc_active_flag = ''Y''',
'		   AND pcc_cc_code = :P67_PRCHD_CC_CODE'))
,p_lov_cascade_parent_items=>'P67_PRCHD_PLNT'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700387211733485193)
,p_name=>'P67_PRCHD_CERT_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_CERT_TYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700389193419485196)
,p_name=>'P67_PRCHD_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'PRCHD_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700390388333485198)
,p_name=>'P67_PRCHD_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'PRCHD_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700392427093485201)
,p_name=>'P67_PRCHD_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700389613621485198)
,p_name=>'P67_PRCHD_CRE_IP_ADD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700389984020485198)
,p_name=>'P67_PRCHD_CRE_OS_USE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700374813987485176)
,p_name=>'P67_PRCHD_CURRY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_prompt=>'Cur.'
,p_source=>'PRCHD_CURRY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>5
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P67_ROWID IS NOT NULL AND  :P67_PRCHD_TAX_FLAG in (''Y'') AND ',
':P67_PRCHD_STATUS in (''A'',''N'',''C'')'))
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700376003773485179)
,p_name=>'P67_PRCHD_CURR_AMD_N'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_default=>'0'
,p_prompt=>'Amnd. No.'
,p_source=>'PRCHD_CURR_AMD_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_colspan=>1
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P67_ROWID IS NOT NULL AND :P67_PRCHD_TAX_FLAG in (''Y'') AND ',
':P67_PRCHD_STATUS in (''A'',''N'',''C'')'))
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700380793012485185)
,p_name=>'P67_PRCHD_DELIVERY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_DELIVERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700383185912485188)
,p_name=>'P67_PRCHD_DEST'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_DEST'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700381209301485185)
,p_name=>'P67_PRCHD_ED'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_ED'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700375630062485178)
,p_name=>'P67_PRCHD_END_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_default=>'31.12.2999'
,p_prompt=>'Eff. To'
,p_format_mask=>'DD-MM-YYYY'
,p_source=>'PRCHD_END_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P67_PRCHD_TAX_FLAG in (''Y'') AND ',
':P67_PRCHD_STATUS in (''A'',''N'',''C'')'))
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700386434095485193)
,p_name=>'P67_PRCHD_FREIGHT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_FREIGHT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700393597198485203)
,p_name=>'P67_PRCHD_FROM_CITY_'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>660
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_FROM_CITY_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700382400228485187)
,p_name=>'P67_PRCHD_INSURANCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_INSURANCE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700387605072485195)
,p_name=>'P67_PRCHD_LD_CLASS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_LD_CLASS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700388393823485195)
,p_name=>'P67_PRCHD_LOC_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_LOC_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700385937045485193)
,p_name=>'P67_PRCHD_PACK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_PACK'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700382031063485187)
,p_name=>'P67_PRCHD_PACK_FORWD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_PACK_FORWD'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700386742004485193)
,p_name=>'P67_PRCHD_PAY_DTLS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_PAY_DTLS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700377230082485179)
,p_name=>'P67_PRCHD_PAY_TERM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_PAY_TERM'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700380025411485184)
,p_name=>'P67_PRCHD_PLNT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_PLNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700393138016485201)
,p_name=>'P67_PRCHD_PLNT_LOC_I'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>650
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_PLNT_LOC_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700369560985485167)
,p_name=>'P67_PRCHD_PLNT_LOC_N'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_default=>':GLOBAL_LOC_NAME'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Location'
,p_source=>'PRCHD_PLNT_LOC_NAME'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_LOCATION - ICM1137'
,p_cSize=>32
,p_cMaxlength=>50
,p_colspan=>2
,p_read_only_when=>':P67_ROWID IS NOT NULL '
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Location')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700370342619485170)
,p_name=>'P67_PRCHD_PO_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Date'
,p_format_mask=>'DD-MM-YYYY'
,p_source=>'PRCHD_PO_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700380379118485184)
,p_name=>'P67_PRCHD_PO_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_PO_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700370007805485168)
,p_name=>'P67_PRCHD_PO_PFX'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT adp_pfx',
'  FROM appl_doc_prefixes, user_prefix_access,appl_doc_pfx_loc',
' WHERE     adp_plnt = :P67_PRCHD_PLNT',
'       AND adp_bu = upa_bu',
'       AND adp_pfx = upa_pfx',
'       AND adp_bu = :GLOBAL_bu',
'       AND ((:P67_PRCHD_PROD_TYPE = ''PR'' AND adp_doc_type = ''POO'') OR ',
'            (:P67_PRCHD_PROD_TYPE = ''SC'' AND adp_doc_type = ''OBO'') )  ',
'       AND adp_appl = ''POM''',
'       AND upa_user_id = :GLOBAL_user',
'       AND adp_bu = adpl_bu',
'       AND adp_pfx = adpl_pfx',
'         AND adp_plnt = adpl_plnt',
'        AND adpl_loc_name  = :P67_PRCHD_PLNT_LOC_N',
'UNION ALL',
'SELECT  adp_pfx',
'  FROM appl_doc_prefixes, user_prefix_access,appl_doc_pfx_loc',
' WHERE     adp_plnt = :P67_PRCHD_PLNT',
'       AND adp_bu = upa_bu',
'       AND adp_pfx = upa_pfx',
'       AND adp_bu = :GLOBAL_bu',
'       AND ((:P67_PRCHD_PROD_TYPE = ''PR'' AND adp_doc_type = ''POO'') OR ',
'            (:P67_PRCHD_PROD_TYPE = ''SC'' AND adp_doc_type = ''OBO'') )  ',
'       AND adp_appl = ''SCM''',
'       AND upa_user_id = :GLOBAL_user',
'       AND adp_bu = adpl_bu',
'       AND adp_pfx = adpl_pfx',
'         AND adp_plnt = adpl_plnt',
'        AND adpl_loc_name  = :P67_PRCHD_PLNT_LOC_N'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Pfx.'
,p_source=>'PRCHD_PO_PFX'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT adp_pfx r, adp_pfx s',
'  FROM appl_doc_prefixes, user_prefix_access,appl_doc_pfx_loc',
' WHERE     adp_plnt = :P67_PRCHD_PLNT',
'       AND adp_bu = upa_bu',
'       AND adp_pfx = upa_pfx',
'       AND adp_bu = :GLOBAL_bu',
'       AND ((:P67_PRCHD_PROD_TYPE = ''PR'' AND adp_doc_type = ''POO'') OR ',
'            (:P67_PRCHD_PROD_TYPE = ''SC'' AND adp_doc_type = ''OBO'') )  ',
'       AND adp_appl = ''POM''',
'       AND upa_user_id = :GLOBAL_user',
'       AND adp_bu = adpl_bu',
'       AND adp_pfx = adpl_pfx',
'         AND adp_plnt = adpl_plnt',
'        AND adpl_loc_name  = :P67_PRCHD_PLNT_LOC_N',
'UNION ALL',
'SELECT adp_pfx r,adp_pfx s',
'  FROM appl_doc_prefixes, user_prefix_access,appl_doc_pfx_loc',
' WHERE     adp_plnt = :P67_PRCHD_PLNT',
'       AND adp_bu = upa_bu',
'       AND adp_pfx = upa_pfx',
'       AND adp_bu = :GLOBAL_bu',
'       AND ((:P67_PRCHD_PROD_TYPE = ''PR'' AND adp_doc_type = ''POO'') OR ',
'            (:P67_PRCHD_PROD_TYPE = ''SC'' AND adp_doc_type = ''OBO'') )  ',
'       AND adp_appl = ''SCM''',
'       AND upa_user_id = :GLOBAL_user',
'       AND adp_bu = adpl_bu',
'       AND adp_pfx = adpl_pfx',
'         AND adp_plnt = adpl_plnt',
'        AND adpl_loc_name  = :P67_PRCHD_PLNT_LOC_N'))
,p_lov_cascade_parent_items=>'P67_PRCHD_PLNT,P67_PRCHD_PLNT_LOC_N,P67_PRCHD_PROD_TYPE'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P67_PRCHD_PO_NO IS NOT NULL AND ',
':P67_ROWID IS NOT NULL'))
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650579001665505432)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700378834156485182)
,p_name=>'P67_PRCHD_PRICE_TERM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_PRICE_TERM'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700374011510485173)
,p_name=>'P67_PRCHD_PROD_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_default=>'PR'
,p_prompt=>'Type'
,p_source=>'PRCHD_PROD_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:PO;PR,SCO;SC'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_read_only_when=>':P67_ROWID IS NOT NULL '
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700373577066485173)
,p_name=>'P67_PRCHD_REF'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_default=>'OPEN PO'
,p_prompt=>'Reference'
,p_source=>'PRCHD_REF'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P67_PRCHD_TAX_FLAG in (''Y'') AND ',
':P67_PRCHD_STATUS in (''A'',''N'',''C'')'))
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700385567142485192)
,p_name=>'P67_PRCHD_REF_UNIT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_REF_UNIT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700384367198485188)
,p_name=>'P67_PRCHD_REMARKS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_REMARKS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700382794983485187)
,p_name=>'P67_PRCHD_SERV_CHARG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_SERV_CHARGE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700374377239485174)
,p_name=>'P67_PRCHD_SERV_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_default=>'ST'
,p_prompt=>'Serv. Type'
,p_source=>'PRCHD_SERV_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Standard(PO);ST,Standard(SCO);SP,Standard(Tools);SL,Standard(Service);SS,Stock Transfer;SF'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when=>':P67_ROWID IS NOT NULL '
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700377937799485181)
,p_name=>'P67_PRCHD_SHIP_VIA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_SHIP_VIA'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700373154240485173)
,p_name=>'P67_PRCHD_SKS_MST_TY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_default=>'M'
,p_prompt=>'PO Type'
,p_source=>'PRCHD_SKS_MST_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Material/Service;M,Transport - City;T,Transport - Location;L'
,p_cHeight=>1
,p_colspan=>2
,p_read_only_when=>':P67_ROWID IS NOT NULL'
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700384003278485188)
,p_name=>'P67_PRCHD_SP_INST'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_SP_INST'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700375203248485178)
,p_name=>'P67_PRCHD_START_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Eff. From'
,p_format_mask=>'DD-MM-YYYY'
,p_source=>'PRCHD_START_DATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P67_PRCHD_TAX_FLAG in (''Y'') AND ',
':P67_PRCHD_STATUS in (''A'',''N'',''C'')'))
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700385162765485190)
,p_name=>'P67_PRCHD_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_default=>'E'
,p_source=>'PRCHD_STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700371569476485171)
,p_name=>'P67_PRCHD_SUPLR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_prompt=>'Supplier'
,p_source=>'PRCHD_SUPLR_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'POM1020_LOV_SUPLR'
,p_cSize=>32
,p_cMaxlength=>10
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_read_only_when=>'P67_ROWID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Supplier')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700384758499485190)
,p_name=>'P67_PRCHD_TAX_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_default=>'N'
,p_source=>'PRCHD_TAX_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700393996720485203)
,p_name=>'P67_PRCHD_TO_CITY_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>670
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_TO_CITY_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700499767692485579)
,p_name=>'P67_PRCHD_TO_CITY_NA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_imp.id(9009432529019009272)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_prompt=>'To City'
,p_source=>'PRCHD_TO_CITY_NAME'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT city_name1,city_id',
'      FROM cities',
'ORDER by 2'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'To City')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700394419129485203)
,p_name=>'P67_PRCHD_TO_LOC_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>680
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_TO_LOC_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700500143988485579)
,p_name=>'P67_PRCHD_TO_LOC_NAM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>640
,p_item_plug_id=>wwv_flow_imp.id(9009432529019009272)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_prompt=>'To Location'
,p_source=>'PRCHD_TO_LOC_NAME'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT bupld_loc_name,bupld_loc_id',
'  FROM bus_unit_plants_loc_dtls, ',
'       bus_unit_plants',
' WHERE bup_bu = bupld_bu',
'   AND bup_plant_id = bupld_plnt',
'	AND bupld_bu =:GLOBAL_BU',
'   AND bupld_plnt= :P67_PRCHD_PLNT',
''))
,p_lov_cascade_parent_items=>'P67_PRCHD_PLNT'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
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
 p_id=>wwv_flow_imp.id(7700388000250485195)
,p_name=>'P67_PRCHD_TRANSPTR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_TRANSPTR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700390775923485199)
,p_name=>'P67_PRCHD_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'PRCHD_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700392006179485201)
,p_name=>'P67_PRCHD_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'PRCHD_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700392807336485201)
,p_name=>'P67_PRCHD_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>640
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700391167543485199)
,p_name=>'P67_PRCHD_UPD_IP_ADD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700391615594485199)
,p_name=>'P67_PRCHD_UPD_OS_USE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700381545853485185)
,p_name=>'P67_PRCHD_VAT_CST'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_VAT_CST'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700383552684485188)
,p_name=>'P67_PRCHD_WARRANTY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'PRCHD_WARRANTY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700446336943485457)
,p_name=>'P67_PRCLN_PRINT_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8996102937594367693)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700445961892485457)
,p_name=>'P67_PRCLN_SEQ_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8996102937594367693)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700368923717485163)
,p_name=>'P67_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_item_source_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700445595774485456)
,p_name=>'P67_ROWID1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8996102937594367693)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700446818444485457)
,p_name=>'P67_ROW_ID1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8996102937594367693)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700524882658485670)
,p_name=>'P67_SEQ_NO_VAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9009110908254837187)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700372020118485171)
,p_name=>'P67_SUPLR_DESC'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_prompt=>'Supplier Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700394825883485204)
,p_name=>'P67_WF_COUNT'
,p_item_sequence=>690
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700370740442485170)
,p_name=>'P67_WF_NO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7700395230001485204)
,p_name=>'P67_WF_TYPE'
,p_item_sequence=>700
,p_item_plug_id=>wwv_flow_imp.id(8996153992665406123)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7700542896057485701)
,p_validation_name=>'date'
,p_static_id=>'date'
,p_validation_sequence=>170
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P67_PRCHD_PO_DATE is  null then',
'return(''PO Date must be entered.'');',
'end if;',
'',
' IF TO_DATE(:P67_PRCHD_PO_DATE) > SYSDATE THEN',
'                       RETURN(''Transaction is not allowed for the future date.'');',
'                    END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(7700370342619485170)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7700541686140485699)
,p_validation_name=>'end_date'
,p_static_id=>'end-date'
,p_validation_sequence=>150
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF TO_DATE(:P67_PRCHD_END_DATE) < TO_DATE(:P67_PRCHD_START_DATE) THEN',
'	 Return(''End date should be greater than start date.'');',
'elsif TO_DATE(:P67_PRCHD_END_DATE) IS NULL THEN',
'   Return(''Effective To Date must be entered'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'Update,CREATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(7700375630062485178)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7700525414238485670)
,p_tabular_form_region_id=>wwv_flow_imp.id(9009110908254837187)
,p_validation_name=>'New'
,p_static_id=>'new'
,p_validation_sequence=>190
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :OHTAV_ATTR_VAL is null then ',
'return(''Value must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'OHTAV_ATTR_VAL'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7700513286737485612)
,p_tabular_form_region_id=>wwv_flow_imp.id(9008047138365391098)
,p_validation_name=>'New_1'
,p_static_id=>'new-2'
,p_validation_sequence=>200
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :OHTA_ATTR_ID is null then',
'return(''Attribute must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'OHTA_ATTR_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7700498409733485574)
,p_tabular_form_region_id=>wwv_flow_imp.id(9009432706157009273)
,p_validation_name=>'NOTES'
,p_static_id=>'notes'
,p_validation_sequence=>210
,p_validation=>'PRCN_NOTE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Notes must be entered.'
,p_associated_column=>'PRCN_NOTE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7700542518257485701)
,p_validation_name=>'PRCHD_PLNT_LOC_N'
,p_static_id=>'prchd-plnt-loc-n'
,p_validation_sequence=>180
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P67_PRCHD_PLNT_LOC_N IS NULL THEN ',
'RETURN(''Location must be enterd.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'CREATE,Update'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(7700369560985485167)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7700541289064485699)
,p_validation_name=>'PRCHD_SUPLR_ID'
,p_static_id=>'prchd-suplr-id'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P67_PRCHD_SUPLR IS NULL THEN ',
'RETURN (''Supplier must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'Update,CREATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(7700371569476485171)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7700449240518485463)
,p_tabular_form_region_id=>wwv_flow_imp.id(8996102937594367693)
,p_validation_name=>'PRCLN_DISC_AMT'
,p_static_id=>'prcln-disc-amt'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'IF :prcln_disc_amt < 0 THEN',
'	return(''Discount Amount should be greater than or equal to zero.'');',
'elsif :prcln_disc_amt > 100 then ',
'	return(''Discount Amount should not greater than 100.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'PRCLN_DISC_AMT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7700449656536485463)
,p_tabular_form_region_id=>wwv_flow_imp.id(8996102937594367693)
,p_validation_name=>'PRCLN_DISC_PCT'
,p_static_id=>'prcln-disc-pct'
,p_validation_sequence=>50
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :prcln_disc_pct > 100 THEN',
'	return(''Discount should not be greater than 100.'');',
'ELSIF :prcln_disc_pct < 0 OR :prcln_disc_pct IS NULL THEN',
'	return(''Discount should be greater then zero'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'PRCLN_DISC_PCT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7700450060305485463)
,p_tabular_form_region_id=>wwv_flow_imp.id(8996102937594367693)
,p_validation_name=>'PRCLN_HSN_CODE'
,p_static_id=>'prcln-hsn-code'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :prcln_hsn_code IS NOT NULL THEN	',
'  DECLARE',
'    CURSOR c1 IS     ',
'SELECT ghc_hsn_code_desc,ghc_hsn_code,hstr_cgst_tax_pct,hstr_sgst_tax_pct,hstr_igst_tax_pct',
'  FROM gst_hsn_codes,hsn_sac_tax_rates',
' WHERE hstr_bu = :GLOBAL_bu',
'   AND hstr_hsnsac_code = ghc_hsn_code',
'   AND TRUNC(SYSDATE) BETWEEN TRUNC(hstr_date_from) AND TRUNC(hstr_date_to)',
'   AND hstr_status = ''A''',
'   AND ghc_hsn_code_type = ''H''',
'   AND EXISTS(SELECT 1',
'                FROM products',
'               WHERE prod_bu = :GLOBAL_bu',
'                 AND prod_id = :prcln_prod_id',
'                 AND prod_rev = :prcln_prod_rev',
'                 AND prod_stocked = ''Y'')',
'   AND ghc_hsn_code = :prcln_hsn_code',
'UNION ALL',
'SELECT ghc_hsn_code_desc,ghc_hsn_code,hstr_cgst_tax_pct,hstr_sgst_tax_pct,hstr_igst_tax_pct',
'  FROM gst_hsn_codes,hsn_sac_tax_rates',
' WHERE hstr_bu = :GLOBAL_bu',
'   AND hstr_hsnsac_code = ghc_hsn_code',
'   AND TRUNC(SYSDATE) BETWEEN TRUNC(hstr_date_from) AND TRUNC(hstr_date_to)',
'   AND hstr_status = ''A''',
'   AND ghc_hsn_code_type = ''S''',
'   AND EXISTS(SELECT 1',
'                FROM products',
'               WHERE prod_bu = :GLOBAL_bu',
'                 AND prod_id = :prcln_prod_id',
'                 AND prod_rev = :prcln_prod_rev',
'                 AND prod_stocked = ''N'')',
'   AND ghc_hsn_code = :prcln_hsn_code',
'ORDER BY 1;',
'  	',
'  	cr1				c1%ROWTYPE;',
'  	',
'  BEGIN  ',
'  	OPEN c1;',
'  	FETCH c1 INTO cr1;',
'  	IF c1%NOTFOUND THEN ',
'  		RETURN(''HSN not found'');',
'  	END IF;',
'  	CLOSE c1;',
'  END;',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'PRCLN_HSN_CODE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7700448529473485462)
,p_tabular_form_region_id=>wwv_flow_imp.id(8996102937594367693)
,p_validation_name=>'PRCLN_PRICE'
,p_static_id=>'prcln-price'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'IF :prcln_price_TYPE IN (''F'') AND  :prcln_price = 0 THEN',
' Return (''Unit cost must be greater than zero.'');',
' END IF;',
'IF :prcln_price IS NULL THEN',
' Return (''Unit cost must be greater than zero.'');',
' END IF;',
'',
'--  IF TO_NUMBER(:prcln_price) is null OR  TO_NUMBER(:prcln_price) <= 0 THEN',
'--    Return (''Unit cost must be greater than zero.'');',
'-- END IF;',
'--  :prcln_price = 0 and',
'-- :prcln_price <= 0 and'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'PRCLN_PRICE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7700448924452485463)
,p_tabular_form_region_id=>wwv_flow_imp.id(8996102937594367693)
,p_validation_name=>'PRCLN_PROD_ID'
,p_static_id=>'prcln-prod-id'
,p_validation_sequence=>30
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :PRCLN_PROD_ID is null then ',
'return(''Item must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'DUM_PROD'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7700450427037485465)
,p_tabular_form_region_id=>wwv_flow_imp.id(8996102937594367693)
,p_validation_name=>'PRCLN_QTY'
,p_static_id=>'prcln-qty'
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :prcln_qty_type = ''Q'' then',
'	 if :prcln_qty = 0 then ',
'	 	RETURN(''Quntity must be entered.'');',
'	 elsif :prcln_qty IS NULL THEN',
'	 	 RETURN(''Quantity should not be null.'');',
'	 elsif :prcln_qty < 0 then',
'	 	 RETURN(''Quntity should be greater then Zero'');',
'	 end if;',
'	 end if;',
'	 ',
'	 if :prcln_qty IS NULL THEN',
'	 	 RETURN(''Quantity should not be null'');',
'	 elsif :prcln_qty < 0 then',
'	 	 RETURN(''Quntity should be greater then Zero'');',
'	 end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'PRCLN_QTY'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7700451178481485467)
,p_tabular_form_region_id=>wwv_flow_imp.id(8996102937594367693)
,p_validation_name=>'PRCLN_SKS_EXCHANGE_RATE'
,p_static_id=>'prcln-sks-exchange-rate'
,p_validation_sequence=>90
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :PRCLN_SKS_EXCHANGE_RATE < 0 THEN ',
'	RETURN(''Exchange rate should not be negative'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'PRCLN_SKS_EXCHANGE_RATE'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7700451615794485467)
,p_tabular_form_region_id=>wwv_flow_imp.id(8996102937594367693)
,p_validation_name=>'PRCLN_SKS_FC_UNIT_COST'
,p_static_id=>'prcln-sks-fc-unit-cost'
,p_validation_sequence=>100
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :PRCLN_PRICE < 0 THEN  ',
'  RETURN(''FC unit cost should not be negative'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition_type=>'NEVER'
,p_exec_cond_for_each_row=>'Y'
,p_associated_column=>'PRCLN_SKS_FC_UNIT_COST'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7700450754318485465)
,p_tabular_form_region_id=>wwv_flow_imp.id(8996102937594367693)
,p_validation_name=>'PRCLN_VALIDITY_OPT'
,p_static_id=>'prcln-validity-opt'
,p_validation_sequence=>80
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :PRCLN_VALIDITY_OPT = ''Q'' then',
'	IF :PRCLN_QTY = 0 THEN',
'		RETURN(''Quantity must be entered.'');',
'	END IF;',
'	END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'PRCLN_VALIDITY_OPT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7700467354540485498)
,p_tabular_form_region_id=>wwv_flow_imp.id(9005855732814036792)
,p_validation_name=>'PRCTC_TC_ACCES_VAL'
,p_static_id=>'prctc-tc-acces-val'
,p_validation_sequence=>120
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :PRCTC_TC_ACCES_VAL < 0 THEN',
'	return(''Negative value should not be allowed.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'Update,CREATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_exec_cond_for_each_row=>'Y'
,p_associated_column=>'PRCTC_TC_ACCES_VAL'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7700468150479485499)
,p_tabular_form_region_id=>wwv_flow_imp.id(9005855732814036792)
,p_validation_name=>'PRCTC_TC_AMT'
,p_static_id=>'prctc-tc-amt'
,p_validation_sequence=>140
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :PRCTC_TC_AMT < 0 THEN',
'	return(''Amount should be greater then zero.'');',
'elsif :PRCTC_TC_AMT >= 0 THEN',
'	IF :PRCTC_level = ''V'' then',
'		  return(''Amount should be greater then zero.'');',
'		  end if;',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'PRCTC_TC_AMT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7700466992499485498)
,p_tabular_form_region_id=>wwv_flow_imp.id(9005855732814036792)
,p_validation_name=>'PRCTC_TC_ID'
,p_static_id=>'prctc-tc-id'
,p_validation_sequence=>110
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :PRCTC_TC_ID is null then ',
'return(''Tax Charges must be entered.'');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'PRCTC_TC_ID'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7700467786347485499)
,p_tabular_form_region_id=>wwv_flow_imp.id(9005855732814036792)
,p_validation_name=>'PRCTC_TC_PCT'
,p_static_id=>'prctc-tc-pct'
,p_validation_sequence=>130
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :PRCTC_TC_PCT < 0 THEN',
'	return(''Negative value should not be allowed.'');',
'ELSIF :PRCTC_TC_PCT > 100 THEN',
'	return(''Percentage should not be greater then 100.'');',
'END IF;',
'		if :PRCTC_level =''P'' then',
'			return(''Percentage should be greater then Zero'');',
'		end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_column=>'PRCTC_TC_PCT'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7700542086678485699)
,p_validation_name=>'Start_Date'
,p_static_id=>'start-date'
,p_validation_sequence=>160
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'IF :P67_PRCHD_START_DATE IS NULL THEN',
'	 RETURN(''Start date must be enetered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition=>'Update,CREATE'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_imp.id(7700375203248485178)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700573794382485757)
,p_name=>'Add'
,p_static_id=>'add'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7700443619822485454)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700574247377485759)
,p_event_id=>wwv_flow_imp.id(7700573794382485757)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700563023098485748)
,p_name=>'Add_Attribute'
,p_static_id=>'add-attribute'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7700511600935485610)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700563515497485748)
,p_event_id=>wwv_flow_imp.id(7700563023098485748)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line2" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700570144552485754)
,p_name=>'Add_Charges'
,p_static_id=>'add-charges'
,p_event_sequence=>150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7700465647726485496)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700570702865485754)
,p_event_id=>wwv_flow_imp.id(7700570144552485754)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line1" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700555257640485734)
,p_name=>'Add_Note'
,p_static_id=>'add-note'
,p_event_sequence=>270
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7700497098350485573)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700555787666485735)
,p_event_id=>wwv_flow_imp.id(7700555257640485734)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line4" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700566544459485751)
,p_name=>'Add_Value'
,p_static_id=>'add-value'
,p_event_sequence=>230
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7700523357073485654)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700567094565485751)
,p_event_id=>wwv_flow_imp.id(7700566544459485751)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line3" ).widget().interactiveGrid( "getActions" ).invoke( "selection-add-row" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700575619404485762)
,p_name=>'Download'
,p_static_id=>'download'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7700443160500485454)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700576131622485762)
,p_event_id=>wwv_flow_imp.id(7700575619404485762)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line" ).call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700564749708485749)
,p_name=>'Download_Attribute'
,p_static_id=>'download-attribute'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7700512432974485610)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700565254830485749)
,p_event_id=>wwv_flow_imp.id(7700564749708485749)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line2" ).call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700571952066485756)
,p_name=>'Download_Charges'
,p_static_id=>'download-charges'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7700466532958485498)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700572439564485757)
,p_event_id=>wwv_flow_imp.id(7700571952066485756)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line1" ).call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700557076407485735)
,p_name=>'Download_Note'
,p_static_id=>'download-note'
,p_event_sequence=>290
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7700497905972485573)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700557592211485737)
,p_event_id=>wwv_flow_imp.id(7700557076407485735)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line4" ).call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700568433053485753)
,p_name=>'Download_Value'
,p_static_id=>'download-value'
,p_event_sequence=>250
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7700524179616485668)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700568878921485753)
,p_event_id=>wwv_flow_imp.id(7700568433053485753)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line3" ).call( "getActions" ).lookup("show-download-dialog").action();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700587709750485774)
,p_name=>'link_no_link'
,p_static_id=>'link-no-link'
,p_event_sequence=>370
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8996102937594367693)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700588199009485776)
,p_event_id=>wwv_flow_imp.id(7700587709750485774)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''a.nolink'').attr("onclick","return false;" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700586760785485774)
,p_name=>'link_nolink'
,p_static_id=>'link-nolink'
,p_event_sequence=>360
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8996102937594367693)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700587329048485774)
,p_event_id=>wwv_flow_imp.id(7700586760785485774)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''a.nolink'').attr("onclick","return false;" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700589473533485776)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>330
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P67_PRCLN_PRICE_TYPE1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700589995139485778)
,p_event_id=>wwv_flow_imp.id(7700589473533485776)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P67_PRCLN_PRICE_TYPE1',
  'items_to_submit', 'PRCLN_PRICE_TYPE',
  'language', 'PLSQL',
  'plsql_code', ':P67_PRCLN_PRICE_TYPE1 = :PRCLN_PRICE_TYPE',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700577841967485763)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>350
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(8996102937594367693)
,p_triggering_element=>'PRICE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700578423057485765)
,p_event_id=>wwv_flow_imp.id(7700577841967485763)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'PRICE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700578686551485765)
,p_name=>'New_2'
,p_static_id=>'new-3'
,p_event_sequence=>380
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7700445135712485456)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700579153973485765)
,p_event_id=>wwv_flow_imp.id(7700578686551485765)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9008047045969391097)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700579554358485765)
,p_name=>'New_3'
,p_static_id=>'new-4'
,p_event_sequence=>390
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7700444366665485456)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700580108638485767)
,p_event_id=>wwv_flow_imp.id(7700579554358485765)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9009432529019009272)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700580534009485767)
,p_name=>'New_4'
,p_static_id=>'new-5'
,p_event_sequence=>400
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7700444830864485456)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700581019685485767)
,p_event_id=>wwv_flow_imp.id(7700580534009485767)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9009432706157009273)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700581346316485767)
,p_name=>'New_5'
,p_static_id=>'new-6'
,p_event_sequence=>410
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7700443956773485454)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700581869949485768)
,p_event_id=>wwv_flow_imp.id(7700581346316485767)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9005855732814036792)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700583150645485770)
,p_name=>'New_6'
,p_static_id=>'new-7'
,p_event_sequence=>430
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7700367272314485159)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700583655518485770)
,p_event_id=>wwv_flow_imp.id(7700583150645485770)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item(''P67_PRCHD_CC_CODE'').show();',
    'apex.item(''P67_CC_CODE_DESC'').show();',
    'apex.item(''P67_PRCHD_CURR_AMD_N'').show();',
    'apex.item(''P67_PRCHD_PAY_TERM'').show();',
    'apex.item(''P67_PAY_TERM_DESC'').show();',
    '//apex.item(''P191513134001_SOH_REFERENCE'').show();',
    'apex.item(''P67_PRCHD_SHIP_VIA'').show();',
    'apex.item(''P_PRCHD_SHIP_VIA_DESC'').show();',
    'apex.item(''P67_PLNT_DESC'').show();',
    'apex.item(''P_PRCHD_PRICE_TERM_DESC'').show();',
    'apex.item( "ShowLess" ).show();',
    'apex.item( "ShowMore" ).hide();',
    '',
    '')))).to_clob
);
end;
/
begin
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700584103238485771)
,p_name=>'New_7'
,p_static_id=>'new-8'
,p_event_sequence=>450
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7700367699502485160)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700584547113485771)
,p_event_id=>wwv_flow_imp.id(7700584103238485771)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item(''P67_PRCHD_CC_CODE'').hide();',
    'apex.item(''P67_CC_CODE_DESC'').hide();',
    'apex.item(''P67_PRCHD_CURR_AMD_N'').hide();',
    'apex.item(''P67_PRCHD_PAY_TERM'').hide();',
    'apex.item(''P67_PAY_TERM_DESC'').hide();',
    '//apex.item(''P191513134001_SOH_REFERENCE'').show();',
    'apex.item(''P67_PRCHD_SHIP_VIA'').hide();',
    'apex.item(''P_PRCHD_SHIP_VIA_DESC'').hide();',
    'apex.item(''P67_PLNT_DESC'').hide();',
    'apex.item(''P_PRCHD_PRICE_TERM_DESC'').hide();',
    'apex.item( "ShowLess" ).hide();',
    'apex.item( "ShowMore" ).show();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700576464303485762)
,p_name=>'New_8'
,p_static_id=>'new-9'
,p_event_sequence=>470
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(8996102937594367693)
,p_triggering_element=>'PRCLN_PRICE_TYPE'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'PRCLN_PRICE_TYPE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'R'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700577027739485763)
,p_event_id=>wwv_flow_imp.id(7700576464303485762)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'PRCLN_PRICE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700577519405485763)
,p_event_id=>wwv_flow_imp.id(7700576464303485762)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'PRCLN_PRICE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700590396871485779)
,p_name=>'Nolink'
,p_static_id=>'nolink'
,p_event_sequence=>340
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700590894185485779)
,p_event_id=>wwv_flow_imp.id(7700590396871485779)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''a.nolink'').attr("onclick","return false;" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700561210847485745)
,p_name=>'P67_PRCHD_CC_CODE'
,p_static_id=>'p67-prchd-cc-code'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P67_PRCHD_CC_CODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700561653190485746)
,p_event_id=>wwv_flow_imp.id(7700561210847485745)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P67_CC_CODE_DESC',
  'items_to_submit', 'P67_PRCHD_CC_CODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P67_PRCHD_CC_CODE IS NOT NULL THEN',
    '	DECLARE',
    '		CURSOR c1',
    '		    IS',
    '		SELECT pcc_cc_code,pcc_desc',
    '		  FROM profit_cost_centers',
    '		 WHERE pcc_bu = :GLOBAL_bu',
    '		   AND pcc_active_flag = ''Y''',
    '		   AND pcc_cc_code = :P67_PRCHD_CC_CODE;',
    '		   ',
    '	cr1 c1%ROWTYPE;',
    '	',
    '	BEGIN',
    '		OPEN c1;',
    '		FETCH c1 INTO cr1;',
    '		  IF c1%FOUND THEN',
    '		  :P67_CC_CODE_DESC := cr1.pcc_desc;',
    '		  ELSE',
    '		  	RAISE_APPLICATION_ERROR(-20999,''CPC code not found.'');',
    '		  END IF;',
    '		CLOSE c1;',
    '	END;',
    '  END IF;						      ')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700560269474485745)
,p_name=>'PRCHD_PLNT_LOC_N'
,p_static_id=>'prchd-plnt-loc-n'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P67_PRCHD_PLNT_LOC_N'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700560759861485745)
,p_event_id=>wwv_flow_imp.id(7700560269474485745)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P67_PRCHD_PLNT_LOC_I,P67_PRCHD_PLNT,P67_PLNT_DESC',
  'items_to_submit', 'P67_PRCHD_PLNT_LOC_N',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P67_PRCHD_PLNT_LOC_N IS NOT NULL THEN',
    'DECLARE',
    ' CURSOR c1',
    '     IS',
    ' SELECT bupld_loc_id,bupld_loc_name,bupld_plnt,bup_name1',
    '   FROM bus_unit_plants_loc_dtls, ',
    '        bus_unit_plants',
    '  WHERE bup_bu = bupld_bu',
    '    AND bup_plant_id = bupld_plnt',
    '    AND bupld_bu = :GLOBAL_bu',
    '    AND bupld_loc_name = :P67_PRCHD_PLNT_LOC_N;',
    '',
    'cr1 c1%ROWTYPE;',
    '  BEGIN',
    '	  OPEN c1;',
    '	  FETCH c1 INTO cr1;',
    '	    IF c1%NOTFOUND THEN',
    '	      RAISE_APPLICATION_ERROR(-20999,''Location not found'');	',
    '	    ELSE  ',
    '	     :P67_PRCHD_PLNT_LOC_I := cr1.bupld_loc_id;',
    '	     :P67_PRCHD_PLNT := cr1.bupld_plnt; ',
    '	     :P67_PLNT_DESC := cr1.bup_name1;     	     ',
    '	    END IF;',
    '	  CLOSE c1;',
    '  END;',
    'ELSE',
    '  RAISE_APPLICATION_ERROR(-20999,''Location must be entered.'');',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700558857884485737)
,p_name=>'PRCHD_SUPLR_ID'
,p_static_id=>'prchd-suplr-id'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P67_PRCHD_SUPLR'
,p_condition_element=>'P67_PRCHD_SUPLR'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700559911238485738)
,p_event_id=>wwv_flow_imp.id(7700558857884485737)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P67_PRCHD_DELIVERY,P67_PRCHD_ED,P67_PRCHD_VAT_CST,P67_PRCHD_PACK_FORWD,P67_PRCHD_INSURANCE,P67_PRCHD_DEST,P67_PRCHD_WARRANTY,P67_PRCHD_SP_INST,P67_PRCHD_REMARKS,P67_PRCHD_PACK,P67_SUPLR_DESC,P67_PRCHD_CURRY,P67_PRCHD_PAY_TERM,P67_PAY_TERM_DESC,P67_PR'
||'CHD_SHIP_VIA,P_PRCHD_SHIP_VIA_DESC,P67_PRCHD_PRICE_TERM,P_PRCHD_PRICE_TERM_DESC',
  'items_to_submit', 'P67_PRCHD_SUPLR',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '   a VARCHAR2 (100);',
    '',
    '   CURSOR c1',
    '   IS',
    '      SELECT suprprod_destination,',
    '             suprprod_delivery,',
    '             suprprod_packing,',
    '             suprprod_forwarding,',
    '             suprprod_insurance,',
    '             suprprod_excise,',
    '             suprprod_tax,',
    '             suprprod_reference2,',
    '             suprprod_warranty,',
    '             suprprod_reference3',
    '        FROM suplr_products',
    '       WHERE suprprod_bu = :global_bu',
    '             AND suprprod_suplr_id = :P67_PRCHD_SUPLR;',
    '',
    '   cr1   c1%ROWTYPE;',
    'BEGIN',
    '  ',
    '      proc_get_suplr_details (:global_bu,',
    '                              :P67_PRCHD_SUPLR,',
    '                              :P67_SUPLR_DESC,',
    '                              :P67_PRCHD_CURRY,',
    '                              a,',
    '                              a,',
    '                              a,',
    '                              :P67_PRCHD_PAY_TERM,',
    '                              :P67_PAY_TERM_DESC,',
    '                              :P67_PRCHD_SHIP_VIA,',
    '                              :P_PRCHD_SHIP_VIA_DESC,',
    '                              :P67_PRCHD_PRICE_TERM,',
    '                              :P_PRCHD_PRICE_TERM_DESC,',
    '                              a,',
    '                              a);',
    '',
    '      OPEN c1;',
    '',
    '      FETCH c1 INTO cr1;',
    ' ',
    '      IF c1%FOUND',
    '      THEN',
    '         :P67_PRCHD_DELIVERY  := cr1.suprprod_delivery;',
    '         :P67_PRCHD_ED        := cr1.suprprod_excise;',
    '         :P67_PRCHD_VAT_CST   := cr1.suprprod_tax;',
    '         :P67_PRCHD_PACK_FORWD:= cr1.suprprod_forwarding;',
    '         :P67_PRCHD_INSURANCE := cr1.suprprod_insurance;',
    '         :P67_PRCHD_DEST      := cr1.suprprod_destination;',
    '         :P67_PRCHD_WARRANTY  := cr1.suprprod_warranty;',
    '         :P67_PRCHD_SP_INST   := cr1.suprprod_reference2;',
    '         :P67_PRCHD_REMARKS   := cr1.suprprod_reference3;',
    '         :P67_PRCHD_PACK      := cr1.suprprod_packing;',
    '',
    '',
    '      CLOSE c1;',
    '  /*  ELSE',
    '      RAISE_APPLICATION_ERROR(-20999,''Supplier must be entered.''); */',
    ' END IF;',
    'END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700559367279485738)
,p_event_id=>wwv_flow_imp.id(7700558857884485737)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P67_SUPLR_DESC',
  'items_to_submit', 'P67_PRCHD_SUPLR,P67_PRCHD_PROD_TYPE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P67_PRCHD_SUPLR IS NOT NULL THEN',
    '	DECLARE ',
    '  CURSOR c3 IS ',
    '              SELECT suplr_name1, suplr_suplr_id',
    '                FROM suppliers',
    '               WHERE suplr_bu = :GLOBAL_bu',
    '                 AND suplr_suplr_id = :P67_PRCHD_SUPLR',
    '                 AND suplr_status = ''A''',
    '                 AND suplr_class IN (''S'', ''K'')',
    '                -- AND suplr_black_list_flg = ''N''',
    '                 AND ''SC'' = :P67_PRCHD_PROD_TYPE',
    '          UNION',
    '              SELECT suplr_name1,',
    '                     suplr_suplr_id',
    '                FROM suppliers',
    '               WHERE suplr_bu = :GLOBAL_bu',
    '                 AND suplr_suplr_id = :P67_PRCHD_SUPLR',
    '                 AND suplr_status = ''A''',
    '                 AND suplr_class IN (''M'', ''K'')',
    '                 AND suplr_black_list_flg = ''N''',
    '                 AND ''PR'' = :P67_PRCHD_PROD_TYPE',
    '            ORDER BY suplr_name1;',
    '      ',
    '    cr3 c3%ROWTYPE;',
    '  BEGIN',
    '   OPEN c3;',
    '',
    '   FETCH c3 INTO cr3;',
    '',
    '   IF c3%FOUND THEN',
    '   	 ',
    '   	  :P67_SUPLR_DESC := cr3.suplr_name1;',
    '   	 ',
    '   ELSE',
    '   	  ',
    '   	  RAISE_APPLICATION_ERROR(-20999,''Supplier not found'');',
    '   	END IF;',
    '  END;  	   ',
    ' END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700550646631485728)
,p_name=>'PRCLN_DISC_AMT'
,p_static_id=>'prcln-disc-amt'
,p_event_sequence=>100
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(8996102937594367693)
,p_triggering_element=>'PRCLN_DISC_AMT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700551224572485729)
,p_event_id=>wwv_flow_imp.id(7700550646631485728)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'PRCLN_DISC_PCT',
  'items_to_submit', 'PRCLN_DISC_AMT,PRCLN_PRICE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '	IF :prcln_price > 0 THEN',
    '	  :prcln_disc_pct := (:prcln_disc_amt / :prcln_price) * 100;',
    '	END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700551562446485729)
,p_name=>'PRCLN_DISC_PCT'
,p_static_id=>'prcln-disc-pct'
,p_event_sequence=>110
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(8996102937594367693)
,p_triggering_element=>'PRCLN_DISC_PCT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700552097608485729)
,p_event_id=>wwv_flow_imp.id(7700551562446485729)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'PRCLN_DISC_AMT',
  'items_to_submit', 'PRCLN_PRICE,PRCLN_DISC_PCT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF  :prcln_disc_pct > 0 THEN',
    '	:prcln_disc_amt := :prcln_price * (:prcln_disc_pct / 100);	',
    'elsif :prcln_disc_pct = 0 THEN',
    ':prcln_disc_amt  :=:prcln_disc_pct;',
    'END IF;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700552509691485729)
,p_name=>'PRCLN_GST_EXEMPT_FLAG'
,p_static_id=>'prcln-gst-exempt-flag'
,p_event_sequence=>130
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(8996102937594367693)
,p_triggering_element=>'PRCLN_GST_EXEMPT_FLAG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700553499901485731)
,p_event_id=>wwv_flow_imp.id(7700552509691485729)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'PRCLN_GST_INPUT_TYPE',
  'items_to_submit', 'PRCLN_GST_EXEMPT_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :prcln_gst_exempt_flag = ''A'' THEN ',
    '	:prcln_gst_input_type := ''A'';',
    'END IF;',
    '',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700552939341485731)
,p_event_id=>wwv_flow_imp.id(7700552509691485729)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'PRCLN_TAX_SET_ID',
  'items_to_submit', 'P67_PRCHD_SUPLR,P67_PLNT,PRCLN_PROD_ID,PRCLN_PROD_REV,PRCLN_GST_EXEMPT_FLAG,PRCLN_GST_INPUT_TYPE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '	v_sub_cls     			VARCHAR2(10);',
    '	v_billfr_loc_id   	VARCHAR2(10);',
    'BEGIN',
    '	',
    '	BEGIN',
    '	SELECT ssl_loc_id',
    '	  INTO v_billfr_loc_id',
    '	  FROM suplr_ship_loc 	  ',
    '	 WHERE ssl_bu = :GLOBAL_bu',
    '	   AND ssl_suplr_id = :P67_PRCHD_SUPLR',
    '	   AND ROWNUM = 1;',
    '	EXCEPTION WHEN NO_DATA_FOUND THEN ',
    '	  v_billfr_loc_id := NULL;	',
    '  END;	',
    '	',
    '	BEGIN',
    '	SELECT prodplnt_sub_cls',
    '	  INTO v_sub_cls',
    '	  FROM prod_plants 	  ',
    '	 WHERE prodplnt_bu = :GLOBAL_bu',
    '	   AND prodplnt_plnt = :P67_PLNT',
    '	   AND prodplnt_prod_id = :prcln_prod_id',
    '	   AND prodplnt_prod_rev = :prcln_prod_rev;',
    '	EXCEPTION WHEN NO_DATA_FOUND THEN ',
    '	  v_sub_cls := NULL;	',
    '  END;	   ',
    '	',
    '  IF :prcln_prod_id IS NOT NULL THEN',
    '  	:prcln_tax_set_id := func_find_dflt_tax_set(:GLOBAL_bu,',
    '  	                                                       :P67_PLNT,',
    '  	                                                       ''S'',',
    '  	                                                       :P67_PRCHD_SUPLR,',
    '  	                                                       v_billfr_loc_id,',
    '  	                                                       v_sub_cls,',
    '  	                                                       :prcln_gst_exempt_flag,',
    '  	                                                       :prcln_gst_input_type',
    '  	                                                      );',
    '  	                                                      ',
    '  ',
    '  END IF;',
    '',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700588550563485776)
,p_name=>'PRCLN_PRICE_TYPE'
,p_static_id=>'prcln-price-type'
,p_event_sequence=>310
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(8996102937594367693)
,p_triggering_element=>'PRCLN_PRICE_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700589130616485776)
,p_event_id=>wwv_flow_imp.id(7700588550563485776)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'PRCLN_PRICE,PRCLN_DISC_AMT,PRCLN_DISC_PCT',
  'items_to_submit', 'PRCLN_PRICE_TYPE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :prcln_price_type = ''R'' THEN',
    '',
    '	:prcln_price := 0;',
    '   :prcln_disc_pct := 0;	',
    '	:prcln_qty := 0;	',
    '	 :prcln_disc_amt := 0;',
    'ELSIF :prcln_price_type = ''F'' THEN',
    ':prcln_price := 0;',
    '   :prcln_disc_pct := 0;	',
    '	:prcln_qty := 0;	',
    '	 :prcln_disc_amt := 0;',
    '	-- DELETE FROM pur_rate_contr_det',
    '   -- WHERE prcd_bu = :GLOBAL_BU',
    '   --   AND prcd_plnt = :P67_PRCHD_PLNT',
    '   --   AND prcd_po_pfx = :P67_PRCHD_PO_PFX',
    '   --   AND prcd_po_no = :P67_PRCHD_PO_NO',
    '   --   AND prcd_seq_no = :prcln_seq_no;    ',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700549253759485726)
,p_name=>'PRCLN_PROD_ID'
,p_static_id=>'prcln-prod-id'
,p_event_sequence=>40
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(8996102937594367693)
,p_triggering_element=>'DUM_PROD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700550311311485728)
,p_event_id=>wwv_flow_imp.id(7700549253759485726)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'PRCLN_PROD_ID,PRCLN_PROD_REV',
  'items_to_submit', 'DUM_PROD',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ':PRCLN_prod_id := SUBSTR(:DUM_PROD,1,INSTR(:DUM_PROD,''~'')-1);',
    ':pRCLN_prod_rev := SUBSTR(:DUM_PROD,-1,INSTR(:DUM_PROD,''~'')+1);')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700549739728485726)
,p_event_id=>wwv_flow_imp.id(7700549253759485726)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'PRCLN_PROD_REV,PRCLN_SUPLR_PROD_ID,PRCLN_SUPLR_PROD_DESC,PRCLN_TAX_SET_ID,ITEM_DESC,PRCLN_UOM,PRCLN_HSN_CODE',
  'items_to_submit', 'PRCLN_PROD_ID,PRCLN_PROD_REV,PRCLN_TAX_SET_ID,P67_PRCHD_SERV_TYPE,P67_PRCHD_PO_NO,P67_PRCHD_PO_PFX,P67_PRCHD_PLNT,P67_PRCHD_SUPLR,P67_PRCHD_PROD_TYPE,P67_PRCHD_SKS_MST_TY',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'proc_item_asign_apex(:global_bu,',
    '							:PRCLN_PROD_ID,',
    '							 1,',
    '							:PRCLN_PROD_REV,',
    '							:P67_PRCHD_PO_NO,',
    '							:P67_PRCHD_PO_PFX,',
    '							:P67_PRCHD_PLNT,',
    '							:P67_PRCHD_SUPLR,',
    '							:P67_PRCHD_SERV_TYPE,',
    '							:P67_PRCHD_PROD_TYPE,',
    '							:P67_PRCHD_SKS_MST_TY,',
    '							:prcln_suplr_prod_id,  -- out',
    '							:prcln_suplr_prod_desc,',
    '							:prcln_tax_set_id,',
    '							:prcln_prod_rev,',
    '							:ITEM_DESC,',
    '							:PRCLN_UOM);',
    '							',
    '												  ',
    ' DECLARE',
    '	CURSOR c_sl IS',
    '	SELECT ssl_loc_id',
    '    FROM suplr_ship_loc',
    '   WHERE ssl_bu = :GLOBAL_bu',
    '     AND ssl_suplr_id = :P67_PRCHD_SUPLR',
    '     AND ssl_dflt_flg IN  (''B'',''D'');',
    '     ',
    '  CURSOR c_prod IS',
    '  SELECT prodplnt_sub_cls,prod_gst_exempt_flag,prod_gst_types_of_supply',
    '    FROM prod_plants,products',
    '   WHERE prodplnt_bu = prod_bu',
    '     AND prodplnt_prod_id = prod_id',
    '     AND prodplnt_prod_rev = prod_rev',
    '     AND prodplnt_bu = :GLOBAL_bu',
    '     AND prodplnt_plnt = :P67_PRCHD_PLNT',
    '     AND prodplnt_prod_id = :prcln_prod_id',
    '     AND prodplnt_prod_rev = :prcln_prod_rev;',
    '   ',
    '  r_prod				c_prod%ROWTYPE;',
    '  v_loc_id			c_sl%ROWTYPE;',
    '  ',
    'BEGIN',
    '  ',
    '  OPEN c_sl;',
    '  FETCH c_sl INTO v_loc_id;',
    '  CLOSE c_sl;',
    '  OPEN c_prod;',
    '  FETCH c_prod INTO r_prod;',
    '  CLOSE c_prod;',
    '  ',
    '  IF :prcln_tax_set_id IS NULL THEN',
    '  	:prcln_tax_set_id := func_find_dflt_tax_set(:GLOBAL_bu,',
    '  	                                             :P67_PRCHD_PLNT,',
    '  	                                             ''S'',',
    '  	                                             :P67_PRCHD_SUPLR,',
    '  	                                            v_loc_id.ssl_loc_id,',
    '  	                                           r_prod.prodplnt_sub_cls,',
    '  	                                           r_prod.prod_gst_exempt_flag,',
    '  	                                           r_prod.prod_gst_types_of_supply );',
    '  END IF;',
    '  ',
    'END;',
    '',
    'IF :prcln_prod_id IS NOT NULL THEN',
    'BEGIN ',
    'SELECT prod_hsn_code',
    '  INTO :prcln_hsn_code',
    '  FROM products',
    ' WHERE PROD_BU =:GLOBAL_BU',
    '   AND prod_id = :prcln_prod_id',
    '   AND prod_rev = :prcln_prod_rev;',
    '    EXCEPTION WHEN NO_DATA_FOUND',
    '   THEN',
    '      NULL;',
    '   END;',
    'END IF;',
    '',
    '',
    '-- IF :prcln_prod_id IS NOT NULL THEN',
    '-- BEGIN ',
    '-- SELECT suprprod_hsn_code',
    '--   INTO :prcln_hsn_code',
    '--   FROM suplr_products',
    '--  WHERE suprprod_bu = :GLOBAL_bu',
    '--    AND suprprod_plnt = :P67_PRCHD_PLNT',
    '--    AND suprprod_suplr_id = :P67_PRCHD_SUPLR',
    '--    AND suprprod_prod_id = :prcln_prod_id',
    '--    AND suprprod_prod_rev = :prcln_prod_rev',
    '--    AND suprprod_type = :P67_PRCHD_PROD_TYPE;',
    '-- EXCEPTION WHEN NO_DATA_FOUND THEN',
    '--    BEGIN ',
    '--    SELECT prod_hsn_code',
    '--      INTO :prcln_hsn_code',
    '--      FROM products',
    '--     WHERE prod_bu = :GLOBAL_bu',
    '--       AND prod_id = :prcln_prod_id',
    '--       AND prod_rev = :prcln_prod_rev;',
    '--     EXCEPTION WHEN NO_DATA_FOUND THEN',
    '--        :prcln_hsn_code := NULL;',
    '--    END;',
    '-- END;	',
    '-- END IF;',
    '',
    '',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700562091921485746)
,p_name=>'PRCTC_TC_PCT'
,p_static_id=>'prctc-tc-pct'
,p_event_sequence=>140
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(9005855732814036792)
,p_triggering_element=>'PRCTC_TC_PCT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700562600290485746)
,p_event_id=>wwv_flow_imp.id(7700562091921485746)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'PRCTC_TC_AMT',
  'items_to_submit', 'PRCTC_TC_ACCES_VAL,PRCTC_TC_PCT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :PRCTC_TC_ACCES_VAL > 0 THEN',
    '	:PRCTC_TC_AMT := (:PRCTC_TC_ACCES_VAL * :PRCTC_TC_PCT) / 100 ;',
    'END IF;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700553908576485731)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>80
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(8996102937594367693)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700554384000485732)
,p_event_id=>wwv_flow_imp.id(7700553908576485731)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8996102937594367693)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700554853760485732)
,p_event_id=>wwv_flow_imp.id(7700553908576485731)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10641226694882398681)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700565674769485749)
,p_name=>'Refresh_Attribute'
,p_static_id=>'refresh-attribute'
,p_event_sequence=>220
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9008047138365391098)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700566144508485751)
,p_event_id=>wwv_flow_imp.id(7700565674769485749)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9008047138365391098)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700572928493485757)
,p_name=>'Refresh_Charges'
,p_static_id=>'refresh-charges'
,p_event_sequence=>180
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9005855732814036792)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700573345184485757)
,p_event_id=>wwv_flow_imp.id(7700572928493485757)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9005855732814036792)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700557975103485737)
,p_name=>'Refresh_Note'
,p_static_id=>'refresh-note'
,p_event_sequence=>300
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9009432706157009273)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700558527174485737)
,p_event_id=>wwv_flow_imp.id(7700557975103485737)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9009432706157009273)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700569327087485754)
,p_name=>'Refresh_Value'
,p_static_id=>'refresh-value'
,p_event_sequence=>260
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(9009110908254837187)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'interactivegridsave'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700569759801485754)
,p_event_id=>wwv_flow_imp.id(7700569327087485754)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9009110908254837187)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700574724313485759)
,p_name=>'Save'
,p_static_id=>'save'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7700442803750485453)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700575166642485759)
,p_event_id=>wwv_flow_imp.id(7700574724313485759)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700563932558485748)
,p_name=>'Save_Attribute'
,p_static_id=>'save-attribute'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7700511966544485610)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700564382064485748)
,p_event_id=>wwv_flow_imp.id(7700563932558485748)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line2" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700571067124485756)
,p_name=>'Save_Charges'
,p_static_id=>'save-charges'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7700466115959485496)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700571629418485756)
,p_event_id=>wwv_flow_imp.id(7700571067124485756)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line1" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700556218274485735)
,p_name=>'Save_Note'
,p_static_id=>'save-note'
,p_event_sequence=>280
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7700497439641485573)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700556706812485735)
,p_event_id=>wwv_flow_imp.id(7700556218274485735)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line4" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700567446295485751)
,p_name=>'Save_Notes'
,p_static_id=>'save-notes'
,p_event_sequence=>240
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7700523796179485656)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700567939889485753)
,p_event_id=>wwv_flow_imp.id(7700567446295485751)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "ig_line3" ).widget().interactiveGrid( "getActions" ).invoke( "save" );')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700585901422485773)
,p_name=>'ShowLess'
,p_static_id=>'showless'
,p_event_sequence=>460
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700586400265485773)
,p_event_id=>wwv_flow_imp.id(7700585901422485773)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item(''P67_PRCHD_CC_CODE'').hide();',
    'apex.item(''P67_CC_CODE_DESC'').hide();',
    'apex.item(''P67_PRCHD_CURR_AMD_N'').hide();',
    'apex.item(''P67_PRCHD_PAY_TERM'').hide();',
    'apex.item(''P67_PAY_TERM_DESC'').hide();',
    '//apex.item(''P191513134001_SOH_REFERENCE'').show();',
    'apex.item(''P67_PRCHD_SHIP_VIA'').hide();',
    'apex.item(''P_PRCHD_SHIP_VIA_DESC'').hide();',
    'apex.item(''P67_PLNT_DESC'').hide();',
    'apex.item(''P_PRCHD_PRICE_TERM_DESC'').hide();',
    'apex.item( "ShowLess" ).hide();',
    'apex.item( "ShowMore" ).show();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700585021049485771)
,p_name=>'ShowMore'
,p_static_id=>'showmore'
,p_event_sequence=>440
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700585521259485773)
,p_event_id=>wwv_flow_imp.id(7700585021049485771)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item(''P67_PRCHD_CC_CODE'').show();',
    'apex.item(''P67_CC_CODE_DESC'').show();',
    'apex.item(''P67_PRCHD_CURR_AMD_N'').show();',
    'apex.item(''P67_PRCHD_PAY_TERM'').show();',
    'apex.item(''P67_PAY_TERM_DESC'').show();',
    '//apex.item(''P191513134001_SOH_REFERENCE'').show();',
    'apex.item(''P67_PRCHD_SHIP_VIA'').show();',
    'apex.item(''P_PRCHD_SHIP_VIA_DESC'').show();',
    'apex.item(''P67_PLNT_DESC'').show();',
    'apex.item(''P_PRCHD_PRICE_TERM_DESC'').show();',
    'apex.item( "ShowLess" ).show();',
    'apex.item( "ShowMore" ).hide();',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7700582319461485768)
,p_name=>'type'
,p_static_id=>'type'
,p_event_sequence=>420
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P67_PRCHD_PROD_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7700582807457485770)
,p_event_id=>wwv_flow_imp.id(7700582319461485768)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P67_PRCHD_SERV_TYPE',
  'items_to_submit', 'P67_PRCHD_PROD_TYPE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :P67_PRCHD_PROD_TYPE = ''PR'' then',
    '  :P67_PRCHD_SERV_TYPE := ''ST'';',
    'elsif :P67_PRCHD_PROD_TYPE = ''SC'' then',
    '  :P67_PRCHD_SERV_TYPE := ''SP'';',
    'end if;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700545578066485707)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cancel'
,p_static_id=>'cancel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P67_PRCHD_PO_NO IS NOT NULL THEN ',
'UPDATE PUR_RATE_CONTR_HD',
'   SET PRCHD_STATUS = ''C''',
' WHERE PRCHD_BU = :GLOBAL_BU',
'   AND PRCHD_PO_NO =:P67_PRCHD_PO_NO',
'	AND PRCHD_PO_PFX =:P67_PRCHD_PO_PFX',
'	AND PRCHD_PLNT =:P67_PRCHD_PLNT;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7700529214917485678)
,p_process_success_message=>'Document Cancelled.'
,p_internal_uid=>2218583742522874679
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700468489070485499)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9005855732814036792)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Charges - Save Interactive Grid Data'
,p_static_id=>'charges-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'IF :APEX$ROW_STATUS = ''C''  THEN',
'	 select nvl(max(prctc_print_seq_no),0)+1',
'		   into :prctc_print_seq_no',
'		   from PUR_RATE_CONTR_TAX_CHARGES',
'		  where prctc_bu = :global_bu',
'		    and prctc_po_pfx = :P67_PRCHD_PO_PFX',
'		    and prctc_po_no = :P67_PRCHD_PO_NO;',
'              INSERT INTO PUR_RATE_CONTR_TAX_CHARGES (PRCTC_BU,',
'													  PRCTC_PLNT,',
'													  PRCTC_PO_PFX,',
'													  PRCTC_PO_NO,',
'													  PRCTC_PRINT_SEQ_NO,',
'													  PRCTC_MODE,',
'													  PRCTC_TC_ID,',
'													  PRCTC_TC_AMT,',
'													  PRCTC_SOURCE_FLAG,',
'													  PRCTC_CHARGE_FLAG,',
'													  PRCTC_TC_PCT,',
'													  PRCTC_TC_ACCES_VAL,',
'													  PRCTC_UNIT_COST,',
'													  PRCTC_LEVEL,',
'													  PRCTC_SUPLR_CHRG_FLAG,',
'													  PRCTC_CHG_FLAG,',
'													  PRCTC_PVSNL_FLAG,',
'													  PRCTC_GST_INC_FLAG,',
'													  PRCTC_CRE_BY,',
'													  PRCTC_CRE_IP_ADDR,',
'													  PRCTC_CRE_OS_USER,',
'													  PRCTC_CRE_DATE,',
'													  PRCTC_CRE_EMP_ID)',
'                                               VALUES(:GLOBAL_BU,',
'													  :P67_PRCHD_PLNT,',
'													  :P67_PRCHD_PO_PFX,',
'													  :P67_PRCHD_PO_NO,',
'													  :PRCTC_PRINT_SEQ_NO,',
'													  :PRCTC_MODE,',
'													  :PRCTC_TC_ID,',
'													  :PRCTC_TC_AMT,',
'													  :PRCTC_SOURCE_FLAG,',
'													  :PRCTC_CHARGE_FLAG,',
'													  :PRCTC_TC_PCT,',
'													  :PRCTC_TC_ACCES_VAL,',
'													  :PRCTC_UNIT_COST,',
'													  :PRCTC_LEVEL,',
'													  :PRCTC_SUPLR_CHRG_FLAG,',
'													  :PRCTC_CHG_FLAG,',
'													  :PRCTC_PVSNL_FLAG,',
'													  :PRCTC_GST_INC_FLAG,',
'													  :GLOBAL_USER,',
'													  NULL,',
'													  NULL,',
'													  SYSDATE,',
'													  NULL); ',
'	  ELSIF :APEX$ROW_STATUS = ''U''  THEN',
'						         UPDATE PUR_RATE_CONTR_TAX_CHARGES	',
'									   SET PRCTC_MODE              =:PRCTC_MODE,',
'							            PRCTC_TC_ID             =:PRCTC_TC_ID,',
'							            PRCTC_TC_AMT            =:PRCTC_TC_AMT,',
'							            PRCTC_SOURCE_FLAG       =:PRCTC_SOURCE_FLAG,',
'							            PRCTC_CHARGE_FLAG       =:PRCTC_CHARGE_FLAG,',
'							            PRCTC_TC_PCT            =:PRCTC_TC_PCT,',
'							            PRCTC_TC_ACCES_VAL      =:PRCTC_TC_ACCES_VAL,',
'							            PRCTC_UNIT_COST         =:PRCTC_UNIT_COST,',
'							            PRCTC_LEVEL             =:PRCTC_LEVEL,',
'							            PRCTC_SUPLR_CHRG_FLAG   =:PRCTC_SUPLR_CHRG_FLAG,',
'							            PRCTC_CHG_FLAG          =:PRCTC_CHG_FLAG,',
'							            PRCTC_PVSNL_FLAG        =:PRCTC_PVSNL_FLAG,',
'							            PRCTC_GST_INC_FLAG      =:PRCTC_GST_INC_FLAG,',
'							            PRCTC_CRE_BY            =:GLOBAL_USER,',
'							            PRCTC_CRE_IP_ADDR       =NULL,',
'							            PRCTC_CRE_OS_USER       =NULL,',
'							            PRCTC_CRE_DATE          =SYSDATE,',
'							            PRCTC_CRE_EMP_ID        =NULL',
'                                  WHERE PRCTC_BU				=:GLOBAL_BU',
'								    AND PRCTC_PLNT              =:PRCTC_PLNT',
'								    AND PRCTC_PO_PFX            =:PRCTC_PO_PFX',
'			                        AND PRCTC_PO_NO             =:PRCTC_PO_NO',
'											AND PRCTC_PRINT_SEQ_NO     =:PRCTC_PRINT_SEQ_NO;',
'		ELSIF :APEX$ROW_STATUS = ''D''	THEN	 ',
'							     DELETE ',
'								   FROM PUR_RATE_CONTR_TAX_CHARGES',
'							      WHERE PRCTC_BU				=:GLOBAL_BU',
'								    AND PRCTC_PLNT              =:PRCTC_PLNT',
'								    AND PRCTC_PO_PFX            =:PRCTC_PO_PFX',
'			                        AND PRCTC_PO_NO             =:PRCTC_PO_NO',
'											AND PRCTC_PRINT_SEQ_NO  =:PRCTC_PRINT_SEQ_NO;',
'',
' END IF;',
' END ;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2218506653526874471
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700544339940485704)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Attachment'
,p_static_id=>'delete-attachment'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	delete from   DOC_MGMT',
'  where dm_bu = :global_bu',
'  AND dm_doc_no = :P67_DOC_NO',
'  and DM_ATT_SEQ_NO = :P67_ATT_SEQ_NO;',
'',
'COMMIT;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>2218582504396874676
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700547297274485723)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete for Attributes'
,p_static_id=>'delete-for-attributes'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  DELETE FROM OPO_HD_TNC_ATTR_VAL',
'								 where OHTAV_BU			=:GLOBAL_BU					',
'								   AND OHTAV_PLNT       =:P67_PRCHD_PLNT                ',
'								   AND OHTAV_PO_PFX     =:P67_PRCHD_PO_PFX',
'									AND OHTAV_SEQ_NO     = :P67_OHTA_PRINT_SEQ;',
'									commit;',
'Delete  from OPO_HD_TNC_ATTR',
'  WHERE OHTA_BU = :GLOBAL_BU',
'    AND OHTA_PLNT =:P67_PRCHD_PLNT',
'	 AND OHTA_PO_PFX  =:P67_PRCHD_PO_PFX',
'	 AND OHTA_PO_NO = :P67_PRCHD_PO_NO',
'	 AND OHTA_SEQ_NO = :P67_OHTA_PRINT_SEQ;',
'',
'	 commit;',
'	',
'',
'	',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'del_attr'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>2218585461730874695
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700547685851485723)
,p_process_sequence=>140
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete for Values'
,p_static_id=>'delete-for-values'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Delete from OPO_HD_TNC_ATTR_VAL',
'  where OHTAV_BU =:global_bu',
'    and OHTAV_PLNT = :P67_PRCHD_PLNT',
'	 and OHTAV_PO_PFX =:P67_PRCHD_PO_PFX',
'	 and OHTAV_PO_NO =:P67_PRCHD_PO_NO',
'	 and OHTAV_SEQ_NO = :P67_OHTA_PRINT_SEQ',
'	 AND OHTAV_SUB_SEQ_NO = :P67_OHTAV_SUB_SEQ_NO;',
'',
'	 commit;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'del_val'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>2218585850307874695
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700546916985485721)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Display'
,p_static_id=>'display'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P67_ROWID IS NULL THEN',
'   :P67_DISPLAY :=''Open/Blanket PO Entry'';',
'ELSIF :P67_ROWID IS NOT NULL THEN  ',
'    :P67_DISPLAY :=   :P67_PRCHD_PO_NO  ;',
'END IF;   ',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2218585081441874693
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700543588994485704)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Doc_No'
,p_static_id=>'doc-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P67_PRCHD_PO_NO := func_find_pfx_nextno',
'                                  (',
'                                   :global_bu,',
'                                   :P67_PRCHD_PO_DATE,',
'                                   :P67_PRCHD_PO_PFX,',
'                                   :global_user);'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7700529985792485678)
,p_internal_uid=>2218581753450874676
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700546373815485709)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Entry Complete'
,p_static_id=>'entry-complete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P67_PRCHD_SKS_MST_TY = ''T'' AND (:P12501_PRCHD_FROM_CITY__1 IS NULL OR :P67_PRCHD_TO_CITY_ID IS NULL) THEN',
'	RAISE_APPLICATION_ERROR(-20999,''From City To City must be entered'');',
'END IF;',
'',
'-----Inclue Tax Process----',
'IF :P67_PRCHD_TAX_FLAG = ''N'' THEN',
'  :P67_PRCHD_TAX_FLAG := ''Y'';',
'',
'BEGIN FOR r_ln IN ',
'      (select * from pur_rate_contr_ln',
'       where prcln_bu =:global_bu',
'         and prcln_plnt =:P67_PRCHD_PLNT',
'         and prcln_po_no =:P67_PRCHD_PO_NO',
'         and prcln_po_pfx =:P67_PRCHD_PO_PFX',
'			and prcln_hsn_code is null ',
'			 ORDER BY prcln_seq_no)',
'  LOOP',
' raise_application_error(-20999,''HSN Code must be entered for the line''||r_ln.prcln_seq_no);',
'end loop;',
'end;',
'',
'BEGIN FOR r_ln IN ',
'      (select * from pur_rate_contr_ln',
'       where prcln_bu =:global_bu',
'         and prcln_plnt =:P67_PRCHD_PLNT',
'         and prcln_po_no =:P67_PRCHD_PO_NO',
'         and prcln_po_pfx =:P67_PRCHD_PO_PFX',
'			and   TO_NUMBER(prcln_price) = 0',
'			AND PRCLN_PRICE_TYPE IN (''R'')',
'			 ORDER BY prcln_seq_no)',
'  LOOP',
' raise_application_error(-20999,''Price should be greater then zero.''||r_ln.prcln_seq_no);',
'end loop;',
'end;',
'',
'	DECLARE',
'	CURSOR c1 IS',
'	  SELECT *',
'      FROM pur_rate_contr_hd,',
'           pur_rate_contr_ln',
'     WHERE prchd_bu = prcln_bu',
'       AND prchd_plnt = prcln_plnt',
'       AND prchd_po_pfx = prcln_po_pfx',
'       AND prchd_po_no = prcln_po_no',
'       AND prchd_sks_mst_type = ''M''',
'       AND prcln_bu = :GLOBAL_BU',
'       AND prcln_plnt = :P67_PRCHD_PLNT',
'       AND prcln_po_pfx = :P67_PRCHD_PO_PFX',
'       AND prcln_po_no = :P67_PRCHD_PO_NO;',
'       ',
'  CURSOR c2(c_suplr 	VARCHAR2,',
'            c_prod 	VARCHAR2,',
'            c_prod_rev 	VARCHAR2,',
'            c_date_from 	DATE,',
'            c_date_to  DATE,',
'            c_curry	VARCHAR2,',
'            c_uom		VARCHAR2,',
'            c_mode	VARCHAR2)IS',
'     SELECT *',
'       FROM pur_contr_details_hd',
'      WHERE pcdhd_bu = :GLOBAL_BU',
'        AND pcdhd_plnt = :P67_PRCHD_PLNT',
'        AND pcdhd_suplr_id = c_suplr',
'        AND pcdhd_prod_id = c_prod',
'        AND pcdhd_prod_rev = c_prod_rev',
'        AND pcdhd_date_from = c_date_from ',
'        AND pcdhd_date_to = c_date_to',
'        AND pcdhd_curcy_id = c_curry',
'        AND pcdhd_uom = c_uom',
'        AND pcdhd_status = ''A''   ',
'        AND pcdhd_prod_type = c_mode;',
'        ',
'cr2			c2%ROWTYPE;',
'',
'BEGIN',
'	 ',
'	FOR cr1 IN c1',
'	  LOOP',
'	  	OPEN c2(cr1.prchd_suplr_id,cr1.prcln_prod_id,cr1.prcln_prod_rev,cr1.prchd_start_date,cr1.prchd_end_date,cr1.prchd_curry,cr1.prcln_uom,cr1.prchd_prod_type);',
'	      FETCH c2 INTO cr2;',
'	        IF c2%FOUND THEN',
'	        	:P67_PRCHD_TAX_FLAG := ''N'';',
'	    	    commit;',
'	        	raise_application_error(-20999,''Open purchase order is already created for the date period''||'':''||cr2.pcdhd_contr_pfx||''-''||cr2.pcdhd_contr_no);',
'	        END IF;',
'	    CLOSE c2;',
'	  END LOOP;',
'	 ',
'END;',
'',
'--  raise_application_error(-20999,:P67_PRCHD_TAX_FLAG);',
'IF :P67_PRCHD_TAX_FLAG = ''Y'' THEN',
'DECLARE',
' CURSOR C1 ',
' IS ',
' SELECT prcln_price,prcln_seq_no',
'	 FROM pur_rate_contr_ln',
'	WHERE PRCLN_BU = :global_bu',
'		AND	PRCLN_PLNT = :P67_PRCHD_PLNT',
'		AND	PRCLN_PO_PFX = :P67_PRCHD_PO_PFX',
'		AND	PRCLN_PO_NO = :P67_PRCHD_PO_NO',
'		AND	PRCLN_PRICE = 0;',
'',
'CURSOR c2 IS',
'SELECT *',
'  FROM pur_rate_contr_taxes',
' WHERE prct_bu = :global_bu',
'   AND prct_plnt = :P67_PRCHD_PLNT',
'   AND prct_po_pfx = :P67_PRCHD_PO_PFX',
'   AND prct_po_no = :P67_PRCHD_PO_NO;',
'   ',
'CURSOR c4',
'IS',
'SELECT *',
'FROM pur_rate_contr_ln',
'WHERE prcln_bu   = :GLOBAL_bu',
'AND prcln_plnt   = :P67_PRCHD_PLNT',
'AND prcln_po_pfx = :P67_PRCHD_PO_PFX',
'AND prcln_po_no  = :P67_PRCHD_PO_NO',
'AND PRCLN_TAX_SET_ID IS NOT NULL;',
'',
'v_tax_cnt    NUMBER;',
'v_cnt        NUMBER;',
'v_price_cnt  NUMBER;',
'cr1          c1%ROWTYPE;',
'cr2          c2%ROWTYPE;',
'',
'BEGIN',
'OPEN c1;',
'FETCH c1 INTO cr1;',
'CLOSE c1;',
'	IF :prcln_price_type = ''F'' THEN	',
'		SELECT COUNT(*)',
'		  INTO v_price_cnt',
'		  FROM pur_rate_contr_ln',
'		 WHERE prcln_bu = :global_bu',
'		   AND prcln_plnt = :P67_PRCHD_PLNT',
'		   AND prcln_po_pfx = :P67_PRCHD_PO_PFX',
'		   AND prcln_po_no = :P67_PRCHD_PO_NO;',
'			-- AND prcln_price = 0;',
'',
'	ELSIF :prcln_price_type = ''R'' THEN	',
'		SELECT COUNT(*)',
'		  INTO v_price_cnt',
'		  FROM pur_rate_contr_det',
'		 WHERE prcd_bu = :GLOBAL_bu',
'		   AND prcd_plnt = :P67_PRCHD_PLNT',
'		   AND prcd_po_pfx = :P67_PRCHD_PO_PFX',
'		   AND prcd_po_no = :P67_PRCHD_PO_NO',
'			AND prcd_price = 0;',
'	END IF;',
'	-- raise_application_error(-20999,prcln_price_type); ',
'		',
'	IF v_price_cnt > 0 THEN',
'		:P67_PRCHD_TAX_FLAG := ''N'';',
'		commit;',
'		raise_application_error(-20999,''Price should be greater then zero. ''||cr1.prcln_seq_no );',
'	END IF;',
'',
' SELECT COUNT(*) ',
'   INTO v_cnt',
'   FROM pur_rate_contr_ln',
'  WHERE prcln_bu = :global_bu',
'    AND prcln_plnt = :P67_PRCHD_PLNT',
'    AND prcln_po_pfx = :P67_PRCHD_PO_PFX',
'    AND prcln_po_no = :P67_PRCHD_PO_NO;',
'',
' SELECT COUNT(prcln_tax_set_id) ',
'   INTO v_tax_cnt',
'   FROM pur_rate_contr_ln',
'  WHERE prcln_bu = :global_bu',
'    AND prcln_plnt = :P67_PRCHD_PLNT',
'    AND prcln_po_pfx = :P67_PRCHD_PO_PFX',
'    AND prcln_po_no = :P67_PRCHD_PO_NO;',
'    ',
'    IF v_cnt = 0 and :P67_PRCHD_TAX_FLAG = ''Y'' THEN',
'    	  :P67_PRCHD_TAX_FLAG := ''N'';',
'    	 commit;',
'    	 raise_application_error(-20999,''Line details not found.'');',
'    END IF;',
'    ',
'    if v_tax_cnt = 0 and :P67_PRCHD_TAX_FLAG = ''Y'' then',
'    	 :P67_PRCHD_TAX_FLAG := ''N'';',
'    	 COMMIT;',
'    	raise_application_error(-20999,''Tax set must be entered.'');',
'    end if;',
'',
'    proc_ins_open_po_charges',
'    							(',
'    							:global_bu,',
'    							:P67_PRCHD_PLNT,',
'    							:P67_PRCHD_PO_PFX,',
'    							:P67_PRCHD_PO_NO',
'    							);',
'    													',
'    IF v_cnt > 0 THEN 	',
'      :P67_PRCHD_TAX_FLAG := ''N'';',
'      Commit;  ',
'      FOR CR4 IN C4',
'      LOOP',
'      	',
'      	IF CR4.prcln_tax_set_id IS NOT NULL THEN',
'      		',
'      		 proc_open_po_taxation',
'								      (',
'								      :global_bu,',
'								      :P67_PRCHD_PLNT,',
'								      :P67_PRCHD_PO_PFX,',
'								      :P67_PRCHD_PO_NO,',
'								      cr4.prcln_seq_no,',
'								      cr4.prcln_tax_set_id,',
'								      cr4.prcln_hsn_code,',
'								      :global_user,',
'								      :P67_PRCHD_PO_DATE,',
'								      ''R'',',
'								      1',
'								      );',
'								      								      ',
'		END IF;',
'     END LOOP;',
'      	END IF;',
'     update  pur_rate_contr_hd set PRCHD_TAX_FLAG = ''Y'' ',
'  WHERE prchd_bu = :global_bu',
'    AND prchd_plnt = :P67_PRCHD_PLNT',
'    AND prchd_po_pfx = :P67_PRCHD_PO_PFX',
'    AND prchd_po_no = :P67_PRCHD_PO_NO;',
'',
'    --apex_application.g_print_success_message := ''Tax Included.'';',
'end;	',
'ELSIF :P67_PRCHD_TAX_FLAG = ''N'' THEN',
'',
' DELETE  ',
'   FROM pur_rate_contr_taxes',
'  WHERE prct_bu  					= :global_bu              ',
'    AND prct_plnt  				= :P67_PRCHD_PLNT',
'    AND prct_po_pfx     = :P67_PRCHD_PO_PFX',
'    AND prct_po_no = :P67_PRCHD_PO_NO',
'    AND prct_source = ''Y'';',
'	  ',
'	  update  pur_rate_contr_hd set PRCHD_TAX_FLAG = ''N'' ',
'  WHERE prchd_bu = :global_bu',
'    AND prchd_plnt = :P67_PRCHD_PLNT',
'    AND prchd_po_pfx = :P67_PRCHD_PO_PFX',
'    AND prchd_po_no = :P67_PRCHD_PO_NO;',
'',
'	    --apex_application.g_print_success_message := ''Tax Excluded.'';',
'	 ',
'Commit;',
'end if;',
'END IF;',
'',
'-----End Of Include Tax Process-----',
'DECLARE',
'CURSOR c1 IS',
'SELECT csl_loc_id',
'  FROM cust_ship_loc',
' WHERE csl_bu = :GLOBAL_bu',
'   AND csl_cust_id = :P67_PRCHD_SUPLR;',
'   ',
'cr1 c1 %ROWTYPE;',
'',
'BEGIN',
'  ',
' OPEN c1;',
' ',
' FETCH c1 INTO cr1;',
'    IF c1%FOUND THEN',
'      proc_chk_benf_gstin(:GLOBAL_bu,''C'',:P67_PRCHD_SUPLR,cr1.csl_loc_id);',
'    END IF;',
'   CLOSE c1;',
'END;',
'',
'DECLARE',
'	v_vat_flag VARCHAR2(1);',
'BEGIN',
'  SELECT glmctrl_vat_usage',
'	  INTO v_vat_flag',
'	  FROM glm_control',
'	 WHERE glmctrl_bu = :GLOBAL_bu;',
'IF v_vat_flag = ''N'' THEN ',
'  proc_chk_open_order_gst_tax(:Global_bu,',
'                              :P67_PRCHD_PLNT,',
'                              :P67_PRCHD_PO_PFX,',
'                              :P67_PRCHD_PO_NO',
'                              );',
'END IF;',
'END;',
'IF :P67_PRCHD_PROD_TYPE <> ''SC'' THEN',
'DECLARE',
'  CURSOR c1 IS',
'    SELECT *',
'      FROM pur_rate_contr_ln,pur_rate_contr_hd',
'     WHERE prchd_bu = prcln_bu',
'       AND prchd_plnt = prcln_plnt',
'       AND prchd_po_pfx = prcln_po_pfx',
'       AND prchd_po_no = prcln_po_no',
'       AND prcln_bu = :global_bu',
'       AND prcln_plnt = :P67_PRCHD_PLNT',
'       AND prcln_po_pfx = :P67_PRCHD_PO_PFX',
'       AND prcln_po_no = :P67_PRCHD_PO_NO',
'       AND (prcln_price = 0 OR prcln_price IS NULL)',
'       AND prchd_prod_type = ''SC''',
'       AND prcln_price_type = ''F'';',
'  CURSOR c2(c_seq_no number) IS',
'    SELECT prcln_seq_no',
'      FROM pur_rate_contr_ln,pur_rate_contr_hd',
'     WHERE prchd_bu = prcln_bu',
'       AND prchd_plnt = prcln_plnt',
'       AND prchd_po_pfx = prcln_po_pfx',
'       AND prchd_po_no = prcln_po_no',
'       AND prcln_bu = :global_bu',
'       AND prcln_plnt = :P67_PRCHD_PLNT',
'       AND prcln_po_pfx = :P67_PRCHD_PO_PFX',
'       AND prcln_po_no = :P67_PRCHD_PO_NO',
'       AND (prcln_price = 0 OR prcln_price IS NULL)',
'       AND prchd_prod_type = ''SC''',
'       AND prcln_price_type = ''F'';',
'cr2 c2%rowtype;       ',
'BEGIN',
'  FOR cr1 IN c1',
'  LOOP',
'  	OPEN c2(cr1.prcln_seq_no);',
'  	FETCH c2 INTO cr2;	',
'  	  IF c2%FOUND THEN',
'        RAISE_APPLICATION_ERROR(-20999,''Price must be entered for the line no.''||cr1.prcln_seq_no );',
'  	  END IF;',
'  	CLOSE c2;',
'  END LOOP;',
'END; ',
'END IF;',
'',
'DECLARE',
'	CURSOR c1 IS',
'    SELECT *',
'      FROM pur_rate_contr_ln',
'     WHERE prcln_bu = :global_bu',
'       AND prcln_plnt = :P67_PRCHD_PLNT',
'       AND prcln_po_pfx = :P67_PRCHD_PO_PFX',
'       AND prcln_po_no = :P67_PRCHD_PO_NO',
'       AND :P67_PRCHD_SERV_TYPE NOT IN (''SS'')',
'       AND prcln_price_type = ''R''; ',
'	CURSOR c2(c_seq_no number) IS',
'    SELECT *',
'      FROM pur_rate_contr_det',
'     WHERE prcd_bu = :global_bu',
'       AND prcd_plnt = :P67_PRCHD_PLNT',
'       AND prcd_po_pfx = :P67_PRCHD_PO_PFX',
'       AND prcd_po_no = :P67_PRCHD_PO_NO',
'       AND prcd_seq_no = c_seq_no;',
'cr2 c2%rowtype;',
'BEGIN',
'  FOR cr1 IN c1',
'  LOOP',
'  	OPEN c2(cr1.prcln_seq_no);',
'  	FETCH c2 INTO cr2;',
'  	  IF c2%NOTFOUND THEN',
'        RAISE_APPLICATION_ERROR(-20999,''Range must be entered for the line no.''||cr1.prcln_seq_no);',
'  	  END IF;',
'  	CLOSE c2;',
'  END LOOP;',
'END;',
'',
'IF :P67_PRCHD_PROD_TYPE = ''SC'' THEN',
'DECLARE',
'    var_cnt 	NUMBER;',
'BEGIN',
'	  SELECT COUNT(*)',
'	    INTO var_cnt',
'	    FROM pur_rate_contr_process',
'	   WHERE prcp_bu = :GLOBAL_bu',
'       AND prcp_plnt = :P67_PRCHD_PLNT',
'       AND prcp_po_pfx = :P67_PRCHD_PO_PFX',
'       AND prcp_po_no = :P67_PRCHD_PO_NO',
'       AND :P67_PRCHD_PROD_TYPE = ''SC'';',
'       ',
'  IF var_cnt = 0 THEN',
'  	RAISE_APPLICATION_ERROR(-20999,''Process Details not found.'');',
'  END IF;',
'	  	',
'END; ',
'END IF;',
'',
'IF :P67_PRCHD_PROD_TYPE = ''SC'' THEN',
'DECLARE',
'	CURSOR c1 IS',
'    SELECT *',
'      FROM pur_rate_contr_ln,pur_rate_contr_process',
'     WHERE prcln_bu = prcp_bu',
'       AND prcln_plnt = prcp_plnt',
'       AND prcln_po_pfx = prcp_po_pfx',
'       AND prcln_po_no = prcp_po_no',
'       AND prcln_seq_no = prcp_seq_no',
'       AND prcln_bu = :global_bu',
'       AND prcln_plnt = :P67_PRCHD_PLNT',
'       AND prcln_po_pfx = :P67_PRCHD_PO_PFX',
'       AND prcln_po_no = :P67_PRCHD_PO_NO',
'       AND :P67_PRCHD_PROD_TYPE = ''SC'';',
'BEGIN',
'  FOR cr1 IN c1',
'  LOOP',
'  	IF CR1.prcp_proc_cost = 0 THEN',
'        RAISE_APPLICATION_ERROR(-20999,''Process Cost must be entered for the line no.''||cr1.prcln_seq_no);',
'  	END IF;',
'  	',
'  END LOOP;',
'END;',
'END IF;',
'',
'IF :P67_PRCHD_PROD_TYPE = ''SC'' THEN',
'	declare',
'		cursor c1',
'		is ',
'		select *',
'			FROM pur_rate_contr_ln,pur_rate_contr_process',
'			WHERE prcln_bu = prcp_bu',
'       AND prcln_plnt = prcp_plnt',
'       AND prcln_po_pfx = prcp_po_pfx',
'       AND prcln_po_no = prcp_po_no',
'       AND prcln_seq_no = prcp_seq_no',
'			and PRCLN_BU = :global_bu',
'			AND		PRCLN_PLNT = :P67_PRCHD_PLNT',
'			AND		PRCLN_PO_PFX = :P67_PRCHD_PO_PFX',
'			AND		PRCLN_PO_NO = :P67_PRCHD_PO_NO;',
'			',
'			cr1  c1%ROWTYPE;',
'	BEGIN',
'	 FOR cr1 IN c1',
'  LOOP',
'  	IF cr1.prcp_process_id IS NULL THEN',
'  		RAISE_APPLICATION_ERROR(-20999,''Process must be entered for the line.''||cr1.prcln_seq_no);',
'  	END IF;',
'  	',
'		IF cr1.prcp_batch_qty <= 0 THEN',
'  		  RAISE_APPLICATION_ERROR(-20999,''Batch Qty should be greater then zero.'');',
'  	END IF;',
'  	IF cr1.prcp_batch_cost <= 0 THEN',
'  		 	 RAISE_APPLICATION_ERROR(-20999,''Batch cost should be greater then zero.'');',
'  	END IF;	',
'  		IF cr1.prcp_batch_qty = 0  OR cr1.prcp_batch_qty IS NULL THEN',
'  		  RAISE_APPLICATION_ERROR(-20999,''Batch Qty should be greater then zero.'');',
'  	END IF;',
'  	IF cr1.prcp_batch_cost = 0 OR cr1.prcp_batch_cost IS NULL THEN',
'  		 RAISE_APPLICATION_ERROR(-20999,''Batch cost should be greater then zero.'');',
'  	END IF;',
'  	',
'	',
'		END LOOP;',
'	END;',
'END IF;',
'',
'',
'',
'DECLARE',
'  CURSOR c1 IS',
'    SELECT prcln_seq_no',
'      FROM pur_rate_contr_ln',
'     WHERE prcln_bu = :global_bu',
'       AND prcln_plnt = :P67_PRCHD_PLNT',
'       AND prcln_po_pfx = :P67_PRCHD_PO_PFX',
'       AND prcln_po_no = :P67_PRCHD_PO_NO',
'       AND prcln_validity_opt = ''Q'' ',
'       AND prcln_qty = 0 or prcln_qty is null;',
'  CURSOR c2(c_seq_no	number) IS',
'    SELECT prcln_seq_no',
'      FROM pur_rate_contr_ln',
'     WHERE prcln_bu = :global_bu',
'       AND prcln_plnt = :P67_PRCHD_PLNT',
'       AND prcln_po_pfx = :P67_PRCHD_PO_PFX',
'       AND prcln_po_no = :P67_PRCHD_PO_NO',
'       AND prcln_seq_no = c_seq_no',
'       AND prcln_validity_opt = ''Q''',
'       AND prcln_qty = 0 or prcln_qty is null;     ',
'cr2 c2%rowtype;',
'BEGIN',
'  FOR cr1 IN c1',
'  LOOP',
'  	OPEN c2(cr1.prcln_seq_no);',
'  	FETCH c2 INTO cr2;',
'  	  IF c2%FOUND THEN',
'        RAISE_APPLICATION_ERROR(-20999,''Quantity must be entered for the line no.''||cr1.prcln_seq_no);',
'  	  END IF;',
'  	CLOSE c2;',
'  END LOOP;',
'END;  	  ',
'',
'',
'',
'DECLARE',
' CURSOR c1',
' IS',
' SELECT SUM(prcce_cs_cost) cs_qty,prcln_price , prcln_seq_no',
'   FROM pur_rate_contr_ln,pur_rate_contr_cost_element',
'  WHERE prcln_bu = prcce_bu',
'    AND prcln_plnt = prcce_plnt',
'    AND prcln_po_pfx = prcce_po_pfx',
'    AND prcln_po_no = prcce_po_no',
'    AND prcln_seq_no = prcce_seq_no',
'    AND prcln_bu   =:global_bu',
'    AND prcln_plnt = :prcln_plnt',
'    AND prcln_po_pfx = :prcln_po_pfx',
'    AND prcln_po_no = :prcln_po_no',
'GROUP BY prcln_seq_no , prcln_price;',
'',
'cr1 c1%ROWTYPE;',
'BEGIN',
'	FOR cr1 IN c1',
'	LOOP',
'	IF cr1.cs_qty <> cr1.prcln_price then',
'		RAISE_APPLICATION_ERROR(-20999,''Unit cost does not match with line price.'' ||''-''|| CR1.prcln_seq_no);',
'	END IF;',
'	END LOOP;',
'END ;	',
'	',
'',
'',
'',
'DECLARE',
'	CURSOR c1 IS',
'	  SELECT *',
'      FROM pur_rate_contr_hd,',
'           pur_rate_contr_ln',
'     WHERE prchd_bu = prcln_bu',
'       AND prchd_plnt = prcln_plnt',
'       AND prchd_po_pfx = prcln_po_pfx',
'       AND prchd_po_no = prcln_po_no',
'       AND prcln_bu = :GLOBAL_BU',
'       AND prcln_plnt = :P67_PRCHD_PLNT',
'       AND prchd_plnt_loc_id = :P67_PRCHD_PLNT_LOC_I',
'       AND prcln_po_pfx = :P67_PRCHD_PO_PFX',
'       AND prcln_po_no = :P67_PRCHD_PO_NO;',
'       ',
'  CURSOR c2(c_suplr 	VARCHAR2,',
'            c_prod 	VARCHAR2,',
'            c_prod_rev 	VARCHAR2,',
'            c_proc_id	VARCHAR2,',
'            c_date_from 	DATE,',
'            c_date_to  DATE,',
'            c_curry	VARCHAR2,',
'            c_uom		VARCHAR2,',
'            c_mode	VARCHAR2)IS',
'     SELECT *',
'       FROM pur_contr_details_hd',
'      WHERE pcdhd_bu = :GLOBAL_BU',
'        AND pcdhd_plnt_loc_id = :P67_PRCHD_PLNT_LOC_I',
'        AND pcdhd_plnt = :P67_PRCHD_PLNT',
'        AND pcdhd_suplr_id = c_suplr',
'        AND pcdhd_prod_id = c_prod',
'        AND pcdhd_prod_rev = c_prod_rev',
'        AND pcdhd_date_from = c_date_from ',
'        AND pcdhd_date_to = c_date_to',
'        AND pcdhd_curcy_id = c_curry',
'        AND pcdhd_uom = c_uom',
'        AND pcdhd_status = ''A''',
'        AND pcdhd_sks_mst_type = ''M''',
'        AND pcdhd_prod_type = c_mode',
'        AND (pcdhd_proc_id = c_proc_id OR (pcdhd_proc_id IS NULL AND c_proc_id IS NULL));',
'        ',
'  CURSOR c3(c_suplr 	VARCHAR2,',
'            c_prod 	VARCHAR2,',
'            c_prod_rev 	VARCHAR2,',
'            c_proc_id	VARCHAR2,',
'            c_date_from 	DATE,',
'            c_date_to  DATE,',
'            c_curry	VARCHAR2,',
'            c_uom		VARCHAR2,',
'            c_mode	VARCHAR2,',
'            c_frm_city	VARCHAR2,',
'            c_to_city	VARCHAR2)IS',
'     SELECT *',
'       FROM pur_contr_details_hd',
'      WHERE pcdhd_bu = :GLOBAL_BU',
'        AND pcdhd_plnt_loc_id = :P67_PRCHD_PLNT_LOC_I',
'        AND pcdhd_plnt = :P67_PRCHD_PLNT',
'        AND pcdhd_suplr_id = c_suplr',
'        AND pcdhd_prod_id = c_prod',
'        AND pcdhd_prod_rev = c_prod_rev',
'        AND pcdhd_date_from = c_date_from ',
'        AND pcdhd_date_to = c_date_to',
'        AND pcdhd_curcy_id = c_curry',
'        AND pcdhd_uom = c_uom',
'        AND pcdhd_status = ''A''',
'        AND pcdhd_sks_mst_type <> ''M''',
'        AND pcdhd_prod_type = c_mode',
'        AND pcdhd_from_city_id = c_frm_city',
'        AND pcdhd_to_city_id = c_to_city',
'        AND (pcdhd_proc_id = c_proc_id OR (pcdhd_proc_id IS NULL AND c_proc_id IS NULL));        ',
'        ',
'cr2			c2%ROWTYPE;',
'cr3			c3%ROWTYPE;',
'',
'BEGIN',
'	',
'	FOR cr1 IN c1',
'	LOOP',
'	  ',
'	  IF cr1.prchd_sks_mst_type = ''M'' THEN	',
'	  	',
'	  	OPEN c2(cr1.prchd_suplr_id,cr1.prcln_prod_id,cr1.prcln_prod_rev,cr1.prcln_proc_id,cr1.prchd_start_date,cr1.prchd_end_date,cr1.prchd_curry,cr1.prcln_uom,cr1.prchd_prod_type);',
'	      FETCH c2 INTO cr2;',
'	        IF c2%FOUND THEN',
'	        	RAISE_APPLICATION_ERROR(-20999,''Open purchase order is already created for the date period -''||'':''||cr2.pcdhd_contr_pfx||''-''||cr2.pcdhd_contr_no);',
'	        END IF;',
'	    CLOSE c2;',
'    ELSE',
'	  	OPEN c3(cr1.prchd_suplr_id,cr1.prcln_prod_id,cr1.prcln_prod_rev,cr1.prcln_proc_id,cr1.prchd_start_date,cr1.prchd_end_date,cr1.prchd_curry,cr1.prcln_uom,cr1.prchd_prod_type,cr1.prchd_from_city_id,cr1.prchd_to_city_id);',
'	      FETCH c3 INTO cr3;',
'	        IF c3%FOUND THEN',
'	        	RAISE_APPLICATION_ERROR(-20999,''Open purchase order is already created for the date period -''||'':''||cr3.pcdhd_contr_pfx||''-''||cr3.pcdhd_contr_no);',
'	        END IF;',
'	    CLOSE c3;  ',
'	  END IF;   ',
'  END LOOP;',
'	 ',
'END;',
'',
'DECLARE',
'	CURSOR c1 IS',
'	  SELECT *',
'      FROM pur_rate_contr_hd,',
'           pur_rate_contr_ln',
'     WHERE prchd_bu = prcln_bu',
'       AND prchd_plnt = prcln_plnt',
'       AND prchd_po_pfx = prcln_po_pfx',
'       AND prchd_po_no = prcln_po_no',
'       AND prchd_sks_mst_type = ''M''',
'       AND prcln_bu = :GLOBAL_BU',
'       AND prcln_plnt = :P67_PRCHD_PLNT',
'       AND prcln_po_pfx = :P67_PRCHD_PO_PFX',
'       AND prcln_po_no = :P67_PRCHD_PO_NO;',
'       ',
'  CURSOR c2(c_suplr 	     VARCHAR2,',
'            c_prod 	       VARCHAR2,',
'            c_prod_rev 	   VARCHAR2,',
'            c_date_from    DATE,',
'            c_date_to			 DATE,',
'            c_curry	       VARCHAR2,',
'            c_uom		       VARCHAR2,',
'            c_mode	       VARCHAR2)IS',
'     SELECT *',
'       FROM pur_contr_details_hd',
'      WHERE pcdhd_bu = :GLOBAL_BU',
'        AND pcdhd_plnt = :P67_PRCHD_PLNT',
'        AND pcdhd_plnt_loc_id = :P67_PRCHD_PLNT_LOC_I',
'        AND pcdhd_suplr_id = c_suplr',
'        AND pcdhd_prod_id = c_prod',
'        AND pcdhd_prod_rev = c_prod_rev',
'        AND ((c_date_from BETWEEN pcdhd_date_from AND pcdhd_date_to) OR (c_date_to BETWEEN pcdhd_date_from AND pcdhd_date_to))',
'        AND pcdhd_curcy_id = c_curry',
'        AND pcdhd_uom = c_uom',
'        AND pcdhd_status = ''A''',
'        AND pcdhd_prod_type = c_mode;',
'        ',
'  CURSOR c3(c_suplr 	     VARCHAR2,',
'            c_prod 	       VARCHAR2,',
'            c_prod_rev 	   VARCHAR2,',
'            c_date_from    DATE,',
'            c_date_to			 DATE,',
'            c_curry	       VARCHAR2,',
'            c_uom		       VARCHAR2,',
'            c_mode	       VARCHAR2,',
'            c_proc_id 		 VARCHAR2)IS',
'     SELECT *',
'       FROM pur_contr_details_hd',
'      WHERE pcdhd_bu = :GLOBAL_BU',
'        AND pcdhd_plnt = :P67_PRCHD_PLNT',
'        AND pcdhd_plnt_loc_id = :P67_PRCHD_PLNT_LOC_I',
'        AND pcdhd_suplr_id = c_suplr',
'        AND pcdhd_prod_id = c_prod',
'        AND pcdhd_prod_rev = c_prod_rev',
'        AND ((c_date_from BETWEEN pcdhd_date_from AND pcdhd_date_to) OR (c_date_to BETWEEN pcdhd_date_from AND pcdhd_date_to))',
'        AND pcdhd_curcy_id = c_curry',
'        AND pcdhd_proc_id = c_proc_id  ',
'        AND pcdhd_uom = c_uom',
'        AND pcdhd_status = ''A''',
'        AND pcdhd_prod_type = c_mode;        ',
'        ',
'cr2			c2%ROWTYPE;',
'cr3			c3%ROWTYPE;',
'',
'BEGIN',
'	',
'FOR cr1 IN c1',
'LOOP',
'	IF cr1.prchd_prod_type = ''PR'' THEN',
'	 OPEN c2(cr1.prchd_suplr_id,',
'	  	     cr1.prcln_prod_id,',
'	  	     cr1.prcln_prod_rev,',
'	  	     cr1.prchd_start_date,',
'	  	     cr1.prchd_end_date,',
'	  	     cr1.prchd_curry,',
'	  	     cr1.prcln_uom,',
'	  	     cr1.prchd_prod_type);',
'	 FETCH c2 INTO cr2;',
'    IF c2%FOUND THEN',
'    	RAISE_APPLICATION_ERROR(-20999,''Open purchase order is already created for the date period..''||'':''||cr2.pcdhd_contr_pfx||''-''||cr2.pcdhd_contr_no);',
'    END IF;',
'	 CLOSE c2;',
'    ELSIF cr1.prchd_prod_type = ''SC'' THEN ',
'    OPEN c3(cr1.prchd_suplr_id,',
'	  	     cr1.prcln_prod_id,',
'	  	     cr1.prcln_prod_rev,',
'	  	     cr1.prchd_start_date,',
'	  	     cr1.prchd_end_date,',
'	  	     cr1.prchd_curry,',
'	  	     cr1.prcln_uom,',
'	  	     cr1.prchd_prod_type,',
'	  	     cr1.prcln_proc_id);',
'	 FETCH c3 INTO cr3;',
'    IF c3%FOUND THEN',
'    		RAISE_APPLICATION_ERROR(-20999,''Open purchase order is already created for the date period..''||'':''||cr3.pcdhd_contr_pfx||''-''||cr3.pcdhd_contr_no);',
'    END IF;',
'	 CLOSE c3;',
'	 END IF;',
'END LOOP;',
'END;',
'	  ',
'',
'        ',
'if :P67_PRCHD_TAX_FLAG  = ''N'' and :prcln_tax_set_id is not null then ',
'	RAISE_APPLICATION_ERROR(-20999,''Include Tax'');',
'end if;',
'',
'IF :P67_PRCHD_START_DATE > :P67_PRCHD_END_DATE THEN',
'	RAISE_APPLICATION_ERROR(-20999,''End date should be greater then start date.'');',
'END IF;',
'IF :P67_PRCHD_PROD_TYPE <> ''SC'' THEN',
'	declare',
'		cursor c1',
'		is ',
'		select prcln_price,prcln_seq_no',
'			FROM pur_rate_contr_ln',
'			WHERE PRCLN_BU = :global_bu',
'			AND		PRCLN_PLNT = :P67_PRCHD_PLNT',
'			AND		PRCLN_PO_PFX = :P67_PRCHD_PO_PFX',
'			AND		PRCLN_PO_NO = :P67_PRCHD_PO_NO',
'			AND 	PRCLN_PRICE_TYPE = ''F''',
'			AND		PRCLN_PRICE = 0;',
'			',
'			cr1  c1%ROWTYPE;',
'	BEGIN',
'		OPEN C1;',
'		FETCH C1 INTO CR1;',
'			IF C1%FOUND THEN',
'				RAISE_APPLICATION_ERROR(-20999,''Price should be greater then zero.'');',
'			END IF;',
'			CLOSE C1;',
'	END;',
'END IF;',
'',
'		',
'declare',
'		CURSOR c1',
'   IS',
'      SELECT SUM (prcp_proc_cost) AS proc_cost,',
'             PRCLN_PRICE as price',
'        FROM pur_rate_contr_process,pur_rate_contr_ln',
'       WHERE prcp_bu = prcln_bu',
'         AND prcp_plnt = prcln_plnt',
'         AND prcp_po_pfx = prcln_po_pfx',
'         AND prcp_po_no = prcln_po_no',
'         AND prcp_seq_no = prcln_seq_no      ',
'       AND prcp_bu = :GLOBAL_bu',
'         AND prcp_plnt = :prcln_plnt',
'         AND prcp_po_pfx = :prcln_po_pfx',
'         AND prcp_po_no = :prcln_po_no',
'         AND prcp_seq_no = :prcln_seq_no',
'    Group by PRCLN_PRICE;',
'',
'  cr1   c1%ROWTYPE;',
'	v_alert NUMBER;',
'	var_appr_cnt	NUMBER;',
'begin',
'',
'   OPEN c1;',
'   FETCH c1 INTO cr1;',
'',
'   IF cr1.proc_cost<>cr1.price and :P67_PRCHD_SERV_TYPE not in(''SS'')and :P67_PRCHD_PROD_TYPE = ''SC'' then',
'        RAISE_APPLICATION_ERROR(-20999,''Unit cost does not match with Process unit cost'');',
'   END IF;',
'   CLOSE c1;',
'',
'IF :P67_PRCHD_START_DATE IS NULL THEN',
'	RAISE_APPLICATION_ERROR(-20999,''Effective from date must be entered.'');',
'END IF;',
'',
'IF :P67_PRCHD_END_DATE IS NULL THEN',
'	RAISE_APPLICATION_ERROR(-20999,''Effective to date must be entered.'');',
'END IF;',
'',
'DECLARE',
'  v_appr_res   VARCHAR2(1);',
'BEGIN',
'	SELECT DECODE(:P67_PRCHD_PROD_TYPE,''SC'',''WF_LR'',''WF_SUPCPA'')',
'	  INTO :P67_WF_TYPE',
'	  FROM DUAL;',
'',
'    proc_self_wf_appr(:GLOBAL_bu,:P67_WF_TYPE,:GLOBAL_user,1,v_appr_res,',
'	                      p_plnt => :P67_PRCHD_PLNT,',
'	                      p_doc_date => :P67_PRCHD_PO_DATE,',
'	                      p_doc_pfx => :P67_PRCHD_PO_PFX,',
'	                      p_doc_no => :P67_PRCHD_PO_NO',
'	                     );',
'    --raise_application_error(-20999,v_appr_res);',
'   IF v_appr_res = ''Y''',
'   THEN',
'      :P67_WF_COUNT := ''DIRECT'';',
'		apex_application.g_print_success_message := ''Document is Approved'';',
'   ELSE',
'      :P67_WF_COUNT := ''FORWARD'';',
'   END IF;',
'   COMMIT;	  ',
'END;',
'',
'',
'SELECT COUNT(*)',
'  INTO var_appr_cnt',
'  FROM pur_rate_contr_hd',
' WHERE prchd_bu = :GLOBAL_bu',
'   AND prchd_plnt = :P67_PRCHD_PLNT',
'   AND prchd_po_pfx = :P67_PRCHD_PO_PFX',
'   AND prchd_po_no = :P67_PRCHD_PO_NO',
'   AND prchd_status IN (''N'',''A'');',
'END;',
'',
' '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7700527626310485674)
,p_internal_uid=>2218584538271874681
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700544794563485706)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch'
,p_static_id=>'fetch'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' proc_fetch_aprvd_suplr',
'	 								(',
'	 								:global_bu,',
'	 								:P67_PRCHD_PLNT,',
'	 								:P67_PRCHD_PO_PFX,',
'	 								:P67_PRCHD_PO_NO,',
'	 								:P67_PRCHD_SUPLR,',
'	 								:P67_PRCHD_PROD_TYPE,',
'	 								:P67_PRCHD_SERV_TYPE,',
'	 								:global_user,',
'	 								1',
'	 								);'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7700528767457485676)
,p_internal_uid=>2218582959019874678
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700545972907485707)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Include Tax'
,p_static_id=>'include-tax'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'	IF :P67_PRCHD_TAX_FLAG = ''N'' THEN',
'  :P67_PRCHD_TAX_FLAG := ''Y'';',
'ELSE',
'  :P67_PRCHD_TAX_FLAG := ''N'';',
'  END IF;',
'',
'BEGIN FOR r_ln IN ',
'      (select * from pur_rate_contr_ln',
'       where prcln_bu =:global_bu',
'         and prcln_plnt =:P67_PRCHD_PLNT',
'         and prcln_po_no =:P67_PRCHD_PO_NO',
'         and prcln_po_pfx =:P67_PRCHD_PO_PFX',
'			and prcln_hsn_code is null ',
'			 ORDER BY prcln_seq_no)',
'  LOOP',
' raise_application_error(-20999,''HSN Code must be entered for the line''||r_ln.prcln_seq_no);',
'end loop;',
'end;',
'',
'BEGIN FOR r_ln IN ',
'      (select * from pur_rate_contr_ln',
'       where prcln_bu =:global_bu',
'         and prcln_plnt =:P67_PRCHD_PLNT',
'         and prcln_po_no =:P67_PRCHD_PO_NO',
'         and prcln_po_pfx =:P67_PRCHD_PO_PFX',
'			and   TO_NUMBER(prcln_price) = 0',
'			AND PRCLN_PRICE_TYPE IN (''F'')',
'			 ORDER BY prcln_seq_no)',
'  LOOP',
' raise_application_error(-20999,''Price should be greater then zero.''||r_ln.prcln_seq_no);',
'end loop;',
'end;',
'',
'	DECLARE',
'	CURSOR c1 IS',
'	  SELECT *',
'      FROM pur_rate_contr_hd,pur_rate_contr_ln',
'     WHERE prchd_bu = prcln_bu',
'       AND prchd_plnt = prcln_plnt',
'       AND prchd_po_pfx = prcln_po_pfx',
'       AND prchd_po_no = prcln_po_no',
'       AND prchd_sks_mst_type = ''M''',
'       AND prcln_bu = :GLOBAL_BU',
'       AND prcln_plnt = :P67_PRCHD_PLNT',
'       AND prcln_po_pfx = :P67_PRCHD_PO_PFX',
'       AND prcln_po_no = :P67_PRCHD_PO_NO;',
'       ',
'  CURSOR c2(c_suplr 	VARCHAR2,',
'            c_prod 	VARCHAR2,',
'            c_prod_rev 	VARCHAR2,',
'            c_date_from 	DATE,',
'            c_date_to  DATE,',
'            c_curry	VARCHAR2,',
'            c_uom		VARCHAR2,',
'            c_mode	VARCHAR2)IS',
'     SELECT *',
'       FROM pur_contr_details_hd',
'      WHERE pcdhd_bu = :GLOBAL_BU',
'        AND pcdhd_plnt = :P67_PRCHD_PLNT',
'        AND pcdhd_suplr_id = c_suplr',
'        AND pcdhd_prod_id = c_prod',
'        AND pcdhd_prod_rev = c_prod_rev',
'        AND pcdhd_date_from = c_date_from ',
'        AND pcdhd_date_to = c_date_to',
'        AND pcdhd_curcy_id = c_curry',
'        AND pcdhd_uom = c_uom',
'        AND pcdhd_status = ''A''   ',
'        AND pcdhd_prod_type = c_mode;',
'        ',
'cr2			c2%ROWTYPE;',
'',
'BEGIN',
'	 ',
'	FOR cr1 IN c1',
'	  LOOP',
'	  	OPEN c2(cr1.prchd_suplr_id,cr1.prcln_prod_id,cr1.prcln_prod_rev,cr1.prchd_start_date,cr1.prchd_end_date,cr1.prchd_curry,cr1.prcln_uom,cr1.prchd_prod_type);',
'	      FETCH c2 INTO cr2;',
'	        IF c2%FOUND THEN',
'	        	:P67_PRCHD_TAX_FLAG := ''N'';',
'	    	    commit;',
'	        	raise_application_error(-20999,''Open purchase order is already created for the date period''||'':''||cr2.pcdhd_contr_pfx||''-''||cr2.pcdhd_contr_no);',
'	        END IF;',
'	    CLOSE c2;',
'	  END LOOP;',
'	 ',
'END;',
'',
'--  raise_application_error(-20999,:P67_PRCHD_TAX_FLAG);',
'IF :P67_PRCHD_TAX_FLAG = ''Y'' THEN',
'DECLARE',
' CURSOR C1 ',
' IS ',
' SELECT prcln_price,prcln_seq_no',
'	 FROM pur_rate_contr_ln',
'	WHERE PRCLN_BU = :global_bu',
'		AND	PRCLN_PLNT = :P67_PRCHD_PLNT',
'		AND	PRCLN_PO_PFX = :P67_PRCHD_PO_PFX',
'		AND	PRCLN_PO_NO = :P67_PRCHD_PO_NO',
'		AND	PRCLN_PRICE = 0;',
'',
'CURSOR c2 IS',
'SELECT *',
'  FROM pur_rate_contr_taxes',
' WHERE prct_bu = :global_bu',
'   AND prct_plnt = :P67_PRCHD_PLNT',
'   AND prct_po_pfx = :P67_PRCHD_PO_PFX',
'   AND prct_po_no = :P67_PRCHD_PO_NO;',
'   ',
'CURSOR c4',
'IS',
'SELECT *',
'FROM pur_rate_contr_ln',
'WHERE prcln_bu   = :GLOBAL_bu',
'AND prcln_plnt   = :P67_PRCHD_PLNT',
'AND prcln_po_pfx = :P67_PRCHD_PO_PFX',
'AND prcln_po_no  = :P67_PRCHD_PO_NO',
'AND PRCLN_TAX_SET_ID IS NOT NULL;',
'',
'v_tax_cnt    NUMBER;',
'v_cnt        NUMBER;',
'v_price_cnt  NUMBER;',
'cr1          c1%ROWTYPE;',
'cr2          c2%ROWTYPE;',
'',
'BEGIN',
'OPEN c1;',
'FETCH c1 INTO cr1;',
'CLOSE c1;',
'	IF :prcln_price_type = ''F'' THEN	',
'		SELECT COUNT(*)',
'		  INTO v_price_cnt',
'		  FROM pur_rate_contr_ln',
'		 WHERE prcln_bu = :global_bu',
'		   AND prcln_plnt = :P67_PRCHD_PLNT',
'		   AND prcln_po_pfx = :P67_PRCHD_PO_PFX',
'		   AND prcln_po_no = :P67_PRCHD_PO_NO;',
'			-- AND prcln_price = 0;',
'',
'	ELSIF :prcln_price_type = ''R'' THEN	',
'		SELECT COUNT(*)',
'		  INTO v_price_cnt',
'		  FROM pur_rate_contr_det',
'		 WHERE prcd_bu = :GLOBAL_bu',
'		   AND prcd_plnt = :P67_PRCHD_PLNT',
'		   AND prcd_po_pfx = :P67_PRCHD_PO_PFX',
'		   AND prcd_po_no = :P67_PRCHD_PO_NO',
'			AND prcd_price = 0;',
'	END IF;',
'	-- raise_application_error(-20999,prcln_price_type); ',
'		',
'	IF v_price_cnt > 0 THEN',
'		:P67_PRCHD_TAX_FLAG := ''N'';',
'		commit;',
'		raise_application_error(-20999,''Price should be greater then zero. ''||cr1.prcln_seq_no );',
'	END IF;',
'',
' SELECT COUNT(*) ',
'   INTO v_cnt',
'   FROM pur_rate_contr_ln',
'  WHERE prcln_bu = :global_bu',
'    AND prcln_plnt = :P67_PRCHD_PLNT',
'    AND prcln_po_pfx = :P67_PRCHD_PO_PFX',
'    AND prcln_po_no = :P67_PRCHD_PO_NO;',
'',
' SELECT COUNT(prcln_tax_set_id) ',
'   INTO v_tax_cnt',
'   FROM pur_rate_contr_ln',
'  WHERE prcln_bu = :global_bu',
'    AND prcln_plnt = :P67_PRCHD_PLNT',
'    AND prcln_po_pfx = :P67_PRCHD_PO_PFX',
'    AND prcln_po_no = :P67_PRCHD_PO_NO;',
'    ',
'    IF v_cnt = 0 and :P67_PRCHD_TAX_FLAG = ''Y'' THEN',
'    	  :P67_PRCHD_TAX_FLAG := ''N'';',
'    	 commit;',
'    	 raise_application_error(-20999,''Line details not found.'');',
'    END IF;',
'    ',
'    if v_tax_cnt = 0 and :P67_PRCHD_TAX_FLAG = ''Y'' then',
'    	 :P67_PRCHD_TAX_FLAG := ''N'';',
'    	 COMMIT;',
'    	raise_application_error(-20999,''Tax set must be entered.'');',
'    end if;',
'',
'    proc_ins_open_po_charges',
'    							(',
'    							:global_bu,',
'    							:P67_PRCHD_PLNT,',
'    							:P67_PRCHD_PO_PFX,',
'    							:P67_PRCHD_PO_NO',
'    							);',
'    													',
'    IF v_cnt > 0 THEN 	',
'      :P67_PRCHD_TAX_FLAG := ''N'';',
'      Commit;  ',
'      FOR CR4 IN C4',
'      LOOP',
'      	',
'      	IF CR4.prcln_tax_set_id IS NOT NULL THEN',
'      		',
'      		 proc_open_po_taxation',
'								      (',
'								      :global_bu,',
'								      :P67_PRCHD_PLNT,',
'								      :P67_PRCHD_PO_PFX,',
'								      :P67_PRCHD_PO_NO,',
'								      cr4.prcln_seq_no,',
'								      cr4.prcln_tax_set_id,',
'								      cr4.prcln_hsn_code,',
'								      :global_user,',
'								      :P67_PRCHD_PO_DATE,',
'								      ''R'',',
'								      1',
'								      );',
'								      								      ',
'		END IF;',
'     END LOOP;',
'      	END IF;',
'     update  pur_rate_contr_hd set PRCHD_TAX_FLAG = ''Y'' ',
'  WHERE prchd_bu = :global_bu',
'    AND prchd_plnt = :P67_PRCHD_PLNT',
'    AND prchd_po_pfx = :P67_PRCHD_PO_PFX',
'    AND prchd_po_no = :P67_PRCHD_PO_NO;',
'',
'    apex_application.g_print_success_message := ''Tax Included.'';',
'	 ',
'  EXCEPTION',
'   WHEN OTHERS THEN',
'     Raise_Application_Error(-20999,func_find_erp_err_msg(SQLERRM));',
'end;	',
'ELSIF :P67_PRCHD_TAX_FLAG = ''N'' THEN',
'',
' DELETE ',
'   FROM PUR_RATE_CONTR_TAXES',
'  WHERE prct_bu  					= :global_bu              ',
'    AND prct_plnt  				= :P67_PRCHD_PLNT',
'    AND prct_po_pfx     = :P67_PRCHD_PO_PFX',
'    AND prct_po_no = :P67_PRCHD_PO_NO',
'    AND prct_source = ''Y'';',
'	  ',
'	  update  pur_rate_contr_hd set PRCHD_TAX_FLAG = ''N'' ',
'  WHERE prchd_bu = :global_bu',
'    AND prchd_plnt = :P67_PRCHD_PLNT',
'    AND prchd_po_pfx = :P67_PRCHD_PO_PFX',
'    AND prchd_po_no = :P67_PRCHD_PO_NO;',
'',
'	    apex_application.g_print_success_message := ''Tax Excluded.'';',
'	 ',
'',
'',
'Commit;',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Include_Tax,Include_Tax1'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>2218584137363874679
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700412704870485232)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(8996153992665406123)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Open/Blanket PO Entry'
,p_static_id=>'initialize-form-open-blanket-po-entry'
,p_internal_uid=>2218450869326874204
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700451846937485467)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(8996102937594367693)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Line - Save Interactive Grid Data'
,p_static_id=>'line-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'      BEGIN',
'                IF :apex$row_status = ''C'' THEN',
'	SELECT NVL (MAX (PRCLN_SEQ_NO), 0) + 1',
'  INTO :PRCLN_SEQ_NO',
'  FROM pur_rate_contr_ln',
' WHERE prcln_bu = :GLOBAL_bu',
'   AND prcln_plnt = :P67_PRCHD_PLNT',
'   AND prcln_po_pfx = :P67_PRCHD_PO_PFX',
'   AND prcln_po_no = :P67_PRCHD_PO_NO;',
'   ',
'SELECT NVL (MAX (PRCLN_PRINT_SEQ_NO), 0) + 1',
'  INTO :PRCLN_PRINT_SEQ_NO',
'  FROM pur_rate_contr_ln',
' WHERE prcln_bu = :GLOBAL_bu',
'   AND prcln_plnt = :P67_PRCHD_PLNT',
'   AND prcln_po_pfx = :P67_PRCHD_PO_PFX',
'   AND prcln_po_no = :P67_PRCHD_PO_NO;',
'                  insert into  pur_rate_contr_ln(PRCLN_BU,',
'												 PRCLN_PLNT,',
'												 PRCLN_PO_PFX,',
'												 PRCLN_PO_NO,',
'												 PRCLN_SEQ_NO,',
'												 PRCLN_PROD_ID,',
'												 PRCLN_PROD_REV,',
'												 PRCLN_QTY_TYPE,',
'												 PRCLN_QTY,',
'												 PRCLN_UOM,',
'												 PRCLN_PRICE_TYPE,',
'												 PRCLN_PRICE,',
'												 PRCLN_DISC_PCT,',
'												 PRCLN_PG_FLAG,',
'												 PRCLN_PG_ID,',
'												 PRCLN_PG_DESC,',
'												 PRCLN_PRINT_SEQ_NO,',
'												 PRCLN_TAX_SET_ID,',
'												 PRCLN_SUPLR_PROD_ID,',
'												 PRCLN_SUPLR_PROD_DESC,',
'												 PRCLN_BUDGET_FLAG,',
'												 PRCLN_ALLOW_UPD_RATE_CONTR,',
'												 PRCLN_TCF_ID,',
'												 PRCLN_CONS_QTY,',
'												 PRCLN_VALIDITY_OPT,',
'												 PRCLN_HSN_CODE,',
'												 PRCLN_PROC_ID,',
'												 PRCLN_PROC_UOM,',
'												 PRCLN_BATCH_QTY,',
'												 PRCLN_BATCH_COST,',
'												 PRCLN_MIN_FLAG,',
'												 PRCLN_CONV_FACTOR,',
'												 PRCLN_CRE_BY,',
'												 PRCLN_CRE_IP_ADDR,',
'												 PRCLN_CRE_OS_USER,',
'												 PRCLN_CRE_DATE,',
'												 PRCLN_CRE_EMP_ID,',
'												 PRCLN_OPRN_LN_SEQ_NO,',
'												 PRCLN_GST_EXEMPT_FLAG,',
'												 PRCLN_GST_INPUT_TYPE,',
'												 PRCLN_DISC_AMT,',
'												 PRCLN_MILL_SUPLR_NAME,',
'												 PRCLN_CC_CODE,',
'												 PRCLN_REF,',
'												 PRCLN_SKS_CURRENCY,',
'												 PRCLN_SKS_EXCHANGE_RATE,',
'												 PRCLN_SKS_FC_UNIT_COST,',
'												 PRCLN_MIG_DOC_NO)',
'                                         values (:GLOBAL_BU,',
'												 :P67_PRCHD_PLNT,',
'												 :P67_PRCHD_PO_PFX,',
'												 :P67_PRCHD_PO_NO,',
'												 :PRCLN_SEQ_NO,',
'												 :PRCLN_PROD_ID,',
'												 :PRCLN_PROD_REV,',
'												 :PRCLN_QTY_TYPE,',
'												 :PRCLN_QTY,',
'												 :PRCLN_UOM,',
'												 :PRCLN_PRICE_TYPE,',
'												 :PRCLN_PRICE,',
'												 :PRCLN_DISC_PCT,',
'												 :PRCLN_PG_FLAG,',
'												 :PRCLN_PG_ID,',
'												 :PRCLN_PG_DESC,',
'												 :PRCLN_PRINT_SEQ_NO,',
'												 :PRCLN_TAX_SET_ID,',
'												 :PRCLN_SUPLR_PROD_ID,',
'												 :PRCLN_SUPLR_PROD_DESC,',
'												 :PRCLN_BUDGET_FLAG,',
'												 :PRCLN_ALLOW_UPD_RATE_CONTR,',
'												 :PRCLN_TCF_ID,',
'												 :PRCLN_CONS_QTY,',
'												 :PRCLN_VALIDITY_OPT,',
'												 :PRCLN_HSN_CODE,',
'												 :PRCLN_PROC_ID,',
'												 :PRCLN_PROC_UOM,',
'												 :PRCLN_BATCH_QTY,',
'												 :PRCLN_BATCH_COST,',
'												 :PRCLN_MIN_FLAG,',
'												 :PRCLN_CONV_FACTOR,',
'												 :GLOBAL_USER,',
'												 NULL,',
'												 NULL,',
'												 SYSDATE,',
'												 NULL,',
'												 :PRCLN_OPRN_LN_SEQ_NO,',
'												 :PRCLN_GST_EXEMPT_FLAG,',
'												 :PRCLN_GST_INPUT_TYPE,',
'												 :PRCLN_DISC_AMT,',
'												 :PRCLN_MILL_SUPLR_NAME,',
'												 :PRCLN_CC_CODE,',
'												 :PRCLN_REF,',
'												 :PRCLN_SKS_CURRENCY,',
'												 :PRCLN_SKS_EXCHANGE_RATE,',
'												 :PRCLN_SKS_FC_UNIT_COST,',
'												 :PRCLN_MIG_DOC_NO);',
'IF :PRCLN_PROD_ID is not null THEN',
'DECLARE',
'	CURSOR C2',
'	IS',
'	SELECT PRCLN_BU, PRCLN_PLNT, PRCLN_PO_PFX,PRCLN_PO_NO, PRCLN_PROD_ID, PRCLN_PROD_REV,COUNT(*)V_CNT',
'	FROM PUR_RATE_CONTR_LN',
'	WHERE PRCLN_BU     = :GLOBAL_BU',
'	AND PRCLN_PLNT     = :P67_PRCHD_PLNT',
'	AND PRCLN_PO_PFX   = :P67_PRCHD_PO_PFX',
'	AND PRCLN_PO_NO    = :P67_PRCHD_PO_NO',
'	AND PRCLN_PROD_ID  = :PRCLN_PROD_ID',
'	and prcln_prod_rev = :PRCLN_PROD_REV',
'	AND ((prcln_oprn_ln_seq_no = :prcln_oprn_ln_seq_no) OR (prcln_oprn_ln_seq_no is null and  :prcln_oprn_ln_seq_no is null))',
'	AND ((prcln_proc_id = :PRCLN_proc_id) OR (prcln_proc_id is null and  :PRCLN_proc_id is null))',
'	GROUP BY PRCLN_BU, PRCLN_PLNT, PRCLN_PO_PFX,PRCLN_PO_NO, PRCLN_PROD_ID, PRCLN_PROD_REV;',
'BEGIN	',
'	FOR CR2 IN C2',
'	LOOP',
'		IF CR2.V_CNT >1 THEN',
'			raise_application_error(-20999,''Item already exists.'');',
'		END IF;',
'	END LOOP;',
'END;',
'	END IF;',
'				ELSIF :apex$row_status = ''U'' THEN								 ',
'								update pur_rate_contr_ln	 ',
'                           set PRCLN_PROD_ID                =:PRCLN_PROD_ID             ,',
'									   PRCLN_PROD_REV               =:PRCLN_PROD_REV            ,',
'									   PRCLN_QTY_TYPE               =:PRCLN_QTY_TYPE            ,',
'									   PRCLN_QTY                    =:PRCLN_QTY                 ,',
'									   PRCLN_UOM                    =:PRCLN_UOM                 ,',
'									   PRCLN_PRICE_TYPE             =:PRCLN_PRICE_TYPE          ,',
'									   PRCLN_PRICE                  =:PRCLN_PRICE               ,',
'									   PRCLN_DISC_PCT               =:PRCLN_DISC_PCT            ,',
'									   PRCLN_PG_FLAG                =:PRCLN_PG_FLAG             ,',
'									   PRCLN_PG_ID                  =:PRCLN_PG_ID               ,',
'									   PRCLN_PG_DESC                =:PRCLN_PG_DESC             ,',
'									   PRCLN_PRINT_SEQ_NO           =:PRCLN_PRINT_SEQ_NO        ,',
'									   PRCLN_TAX_SET_ID             =:PRCLN_TAX_SET_ID          ,',
'									   PRCLN_SUPLR_PROD_ID          =:PRCLN_SUPLR_PROD_ID       ,',
'									   PRCLN_SUPLR_PROD_DESC        =:PRCLN_SUPLR_PROD_DESC     ,',
'									   PRCLN_BUDGET_FLAG            =:PRCLN_BUDGET_FLAG         ,',
'									   PRCLN_ALLOW_UPD_RATE_CONTR   =:PRCLN_ALLOW_UPD_RATE_CONTR,',
'									   PRCLN_TCF_ID                 =:PRCLN_TCF_ID              ,',
'									   PRCLN_CONS_QTY               =:PRCLN_CONS_QTY            ,',
'									   PRCLN_VALIDITY_OPT           =:PRCLN_VALIDITY_OPT        ,',
'									   PRCLN_HSN_CODE               =:PRCLN_HSN_CODE            ,',
'									   PRCLN_PROC_ID                =:PRCLN_PROC_ID             ,',
'									   PRCLN_PROC_UOM               =:PRCLN_PROC_UOM            ,',
'									   PRCLN_BATCH_QTY              =:PRCLN_BATCH_QTY           ,',
'									   PRCLN_BATCH_COST             =:PRCLN_BATCH_COST          ,',
'									   PRCLN_MIN_FLAG               =:PRCLN_MIN_FLAG            ,',
'									   PRCLN_CONV_FACTOR            =:PRCLN_CONV_FACTOR         ,',
'									   PRCLN_UPD_BY                 =:GLOBAL_USER               ,',
'									   PRCLN_UPD_IP_ADDR            =NULL                       ,',
'									   PRCLN_UPD_OS_USER            =NULL                       ,',
'									   PRCLN_UPD_DATE               =SYSDATE                    ,',
'									   PRCLN_UPD_EMP_ID             =NULL                       ,',
'									   PRCLN_OPRN_LN_SEQ_NO         =:PRCLN_OPRN_LN_SEQ_NO      ,',
'									   PRCLN_GST_EXEMPT_FLAG        =:PRCLN_GST_EXEMPT_FLAG     ,',
'									   PRCLN_GST_INPUT_TYPE         =:PRCLN_GST_INPUT_TYPE      ,',
'									   PRCLN_DISC_AMT               =:PRCLN_DISC_AMT            ,',
'									   PRCLN_MILL_SUPLR_NAME        =:PRCLN_MILL_SUPLR_NAME     ,',
'									   PRCLN_CC_CODE                =:PRCLN_CC_CODE             ,',
'									   PRCLN_REF                    =:PRCLN_REF                 ,',
'									   PRCLN_SKS_CURRENCY           =:PRCLN_SKS_CURRENCY        ,',
'									   PRCLN_SKS_EXCHANGE_RATE      =:PRCLN_SKS_EXCHANGE_RATE   ,',
'									   PRCLN_SKS_FC_UNIT_COST       =:PRCLN_SKS_FC_UNIT_COST    ,',
'									   PRCLN_MIG_DOC_NO             =:PRCLN_MIG_DOC_NO',
'								 where PRCLN_BU						  =:GLOBAL_BU					',
'								   AND PRCLN_PLNT                  =:PRCLN_PLNT                ',
'								   AND PRCLN_PO_PFX                =:PRCLN_PO_PFX',
'								   AND PRCLN_PO_NO 					  =:PRCLN_PO_NO',
'								   AND PRCLN_SEQ_NO				     =:PRCLN_SEQ_NO;',
'ELSIF :apex$row_status = ''D'' THEN								 ',
'								delete pur_rate_contr_ln	where PRCLN_BU						  =:PRCLN_BU					',
'								   AND PRCLN_PLNT                  =:PRCLN_PLNT                ',
'								   AND PRCLN_PO_PFX                =:PRCLN_PO_PFX',
'								   AND PRCLN_PO_NO 					  =:PRCLN_PO_NO',
'								   AND PRCLN_SEQ_NO				     =:PRCLN_SEQ_NO; 			',
'         ',
'END IF;',
'END;',
'                                   '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2218490011393874439
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700548898551485724)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Next/Prev Rowid'
,p_static_id=>'next-prev-rowid'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    SELECT',
'        nextrowid,',
'        prevrowid',
'    INTO',
'        :global_next_rowid,',
'        :global_prev_rowid',
'    FROM(',
'            SELECT',
'                ROWID ,',
'                LEAD(ROWID)',
'                OVER(',
'                    ORDER BY PRCHD_PO_NO DESC',
'                )            nextrowid,',
'                LAG(ROWID)',
'                OVER(',
'                   ORDER BY  PRCHD_PO_NO DESC',
'                )            prevrowid',
'            FROM',
'                PUR_RATE_CONTR_HD',
'            WHERE',
'                PRCHD_BU = :global_bu',
'				and ((:P67_NEXT_LAST_TYPE = ''O'' AND PRCHD_STATUS =''E'' ) OR :P67_NEXT_LAST_TYPE = ''A'')',
'            order by PRCHD_PO_NO DESC',
'        )',
'    WHERE',
'        ROWID = :P67_ROWID;',
'',
'		SELECT ROWID INTO :GLOBAL_FIRST_ROWID FROM( SELECT *  ',
'		  FROM PUR_RATE_CONTR_HD',
'            WHERE',
'                PRCHD_BU = :global_bu',
'				and ((:P67_NEXT_LAST_TYPE = ''O'' AND PRCHD_STATUS =''E'' ) OR :P67_NEXT_LAST_TYPE = ''A'')',
'			  order by PRCHD_PO_NO DESC)WHERE ROWNUM=1;',
'',
'		SELECT ROWID INTO :GLOBAL_LAST_ROWID FROM (SELECT *  ',
'		  FROM PUR_RATE_CONTR_HD',
'            WHERE',
'                PRCHD_BU = :global_bu			',
'				and ((:P67_NEXT_LAST_TYPE = ''O'' AND PRCHD_STATUS =''E'' ) OR :P67_NEXT_LAST_TYPE = ''A'')',
'           order by PRCHD_PO_NO ASC)',
'			 WHERE ROWNUM=1	  ;',
'		  ',
'EXCEPTION WHEN OTHERS THEN',
'        NULL;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2218587063007874696
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700498656504485574)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9009432706157009273)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Notes - Save Interactive Grid Data'
,p_static_id=>'notes-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'      BEGIN',
'                IF :apex$row_status = ''C'' THEN',
'select NVL(MAX((PRCN_SEQ_NO)),0)+1',
' into :PRCN_SEQ_NO',
'  from PUR_RATE_CONTR_NOTES',
' where PRCN_BU = :Global_bu',
'   and PRCN_PLNT = :P67_PRCHD_PLNT',
'   and PRCN_PO_PFX = :P67_PRCHD_PO_PFX',
'    and PRCN_PO_NO = :P67_PRCHD_PO_NO;',
'-- RAISE_APPLICATION_ERROR(-20999,:PRCN_SEQ_NO);',
'              insert into  PUR_RATE_CONTR_NOTES(PRCN_BU,',
'											               PRCN_PLNT,',
'											               PRCN_PO_PFX,',
'											               PRCN_PO_NO,',
'											               PRCN_SEQ_NO,',
'																PRCN_NOTE,',
'											               PRCN_CRE_BY,',
'											               PRCN_CRE_DATE,',
'																PRCN_CRE_EMP_ID,',
'																PRCN_CRE_IP_ADDR,',
'																PRCN_CRE_OS_USER)',
'                            values (:GLOBAL_BU,',
'											   :P67_PRCHD_PLNT,',
'											   :P67_PRCHD_PO_PFX,',
'											   :P67_PRCHD_PO_NO,',
'											   :PRCN_SEQ_NO,',
'												:PRCN_NOTE,',
'											   :GLOBAL_USER,',
'											   SYSDATE,',
'												:GLOBAL_EMP_ID,',
'												:GLOBAL_IP_ADDR,',
'												:GLOBAL_USER);',
'				ELSIF :apex$row_status = ''U'' THEN								 ',
'								update PUR_RATE_CONTR_NOTES	 ',
'                          set PRCN_NOTE      =:PRCN_NOTE,',
'									   PRCN_UPD_BY     =:GLOBAL_USER,',
'									   PRCN_UPD_DATE   =SYSDATE,',
'										prcn_upd_emp_id =:global_emp_id,',
'										prcn_upd_ip_addr =:global_ip_addr,',
'										prcn_upd_os_user =:GLOBAL_USER',
'								 where PRCN_BU			=:GLOBAL_BU',
'								   AND PRCN_PLNT		=:P67_PRCHD_PLNT',
'								   AND PRCN_PO_PFX		=:P67_PRCHD_PO_PFX',
'								   AND PRCN_PO_NO		=:P67_PRCHD_PO_NO',
'								   AND PRCN_SEQ_NO		=:PRCN_SEQ_NO;',
'',
'			ELSIF :apex$row_status = ''D'' THEN			   ',
'								   DELETE FROM PUR_RATE_CONTR_NOTES',
'								   where PRCN_BU			=:GLOBAL_BU',
'								   AND PRCN_PLNT		   =:P67_PRCHD_PLNT',
'								   AND PRCN_PO_PFX		=:P67_PRCHD_PO_PFX',
'								   AND PRCN_PO_NO		   =:P67_PRCHD_PO_NO',
'								   AND PRCN_SEQ_NO		=:PRCN_SEQ_NO;',
'								 ',
'			',
'         ',
'END IF;',
'END;',
'                                   '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2218536820960874546
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700544000615485704)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'POST_QUERY'
,p_static_id=>'post-query'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P67_PRCHD_PAY_TERM IS NOT NULL THEN ',
'SELECT term_desc1',
'  INTO :P67_PAY_TERM_DESC',
'  FROM terms_hd',
' WHERE term_bu = :global_bu ',
'   AND term_term_id = :P67_PRCHD_PAY_TERM;',
'END IF;	 ',
'',
'if :P67_PRCHD_SHIP_VIA is not null then',
' SELECT sv_desc1',
'  into :P_PRCHD_SHIP_VIA_DESC',
' FROM ship_vias',
'   WHERE sv_bu = :global_bu ',
'   AND sv_shipvia_id = :P67_PRCHD_SHIP_VIA;',
'end if;	',
'',
'',
'if :P67_PRCHD_PRICE_TERM is not null then',
'       SELECT fob_desc1',
'		 INTO :P_PRCHD_PRICE_TERM_DESC',
'        FROM fobs',
'       WHERE fob_bu = :GLOBAL_BU ',
'		   AND fob_fob_id = :P67_PRCHD_PRICE_TERM;',
'			END IF;',
'',
'	IF :P67_PRCHD_CC_CODE IS NOT NULL THEN',
'  ',
'	  SELECT pcc_desc',
'	    INTO :P67_CC_CODE_DESC',
'	    FROM profit_cost_centers',
'	   WHERE pcc_bu = :GLOBAL_bu',
'	     AND pcc_cc_code = :P67_PRCHD_CC_CODE;',
'  ',
'END IF;',
'',
'',
'IF :P67_PRCHD_SUPLR IS NOT NULL THEN',
' SELECT suplr_name1',
'   INTO :P67_SUPLR_DESC ',
'   FROM suppliers',
'  WHERE suplr_bu =:GLOBAL_BU',
'    AND suplr_suplr_id = :P67_PRCHD_SUPLR',
'    AND suplr_status = ''A'';',
'	 END IF;',
'',
'exception when no_data_found then null;	 '))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2218582165071874676
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700548478709485724)
,p_process_sequence=>150
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for the delete line'
,p_static_id=>'process-for-the-delete-line'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* delete from pur_rate_contr_ln	',
'      where PRCLN_BU						  =:global_bu					',
'		  AND PRCLN_PLNT                  =:P67_PLNT                ',
'		  AND PRCLN_PO_PFX                =:P67_PFX',
'		  AND PRCLN_PO_NO 					  =:P67_PO',
'		  AND PRCLN_SEQ_NO	=:P67_PRCLN_SEQ_NO',
'		  AND PRCLN_PRINT_SEQ_NO =:P67_PRCLN_PRINT_NO',
'		  AND ROWID =:P67_ROW_ID1; */',
'	DELETE FROM pur_rate_contr_det',
'			WHERE prcd_bu = :GLOBAL_bu',
'			  AND prcd_plnt = :P67_PLNT',
'			  AND prcd_po_pfx = :P67_PFX',
'			  AND prcd_po_no = :P67_PO',
'			  AND prcd_seq_no = :P67_PRCLN_SEQ_NO;',
'	',
'	DELETE FROM opo_ln_tnc_attr',
'			where olta_bu = :global_bu',
'			and OLTA_PLNT = :P67_PLNT',
'			and OLTA_PO_PFX = :P67_PRCHD_PO_PFX',
'			and OLTA_PO_NO  = :P67_PRCHD_PO_NO',
'			and OLTA_PO_SEQ_NO = :P67_PRCLN_SEQ_NO;',
'',
'	  DELETE FROM pur_rate_contr_ln',
'      where PRCLN_BU						  =:global_bu					',
'		  AND PRCLN_PLNT                  =:P67_PLNT                ',
'		  AND PRCLN_PO_PFX                =:P67_PFX',
'		  AND PRCLN_PO_NO 					  =:P67_PO',
'		  AND PRCLN_SEQ_NO	=:P67_PRCLN_SEQ_NO;',
' ',
'   commit;      '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Cancel_Line'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'Line Deleted.'
,p_internal_uid=>2218586643165874696
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700413064241485234)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(8996153992665406123)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Open/Blanket PO Entry'
,p_static_id=>'process-form-open-blanket-po-entry'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2218451228697874206
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700545158548485706)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Rowid'
,p_static_id=>'rowid'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P67_ROWID IS NULL THEN  ',
'BEGIN',
'   SELECT ROWID',
'	  INTO :P67_ROWID',
'     FROM PUR_RATE_CONTR_HD',
'	  WHERE PRCHD_BU = :GLOBAL_BU',
'	  and  PRCHD_PLNT =:P67_PRCHD_PLNT',
'	  AND  PRCHD_PO_NO  =:P67_PRCHD_PO_NO',
'	  AND PRCHD_PO_PFX   =:P67_PRCHD_PO_PFX;',
'EXCEPTION',
'   WHEN NO_DATA_FOUND',
'   THEN',
'      NULL;',
'END;',
'',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2218583323004874678
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700513590366485612)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9008047138365391098)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'T & C - Save Interactive Grid Data'
,p_static_id=>'t-c-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' BEGIN',
'         IF :apex$row_status = ''C'' THEN',
'						SELECT NVL(MAX(ohta_seq_no),0)+1 ',
'					INTO :ohta_seq_no ',
'					FROM opo_hd_tnc_attr',
'					WHERE ohta_bu = :GLOBAL_bu   ',
'						AND ohta_plnt = :P67_PRCHD_PLNT',
'						AND ohta_po_pfx = :P67_PRCHD_PO_PFX   ',
'						AND ohta_po_no = :P67_PRCHD_PO_NO;',
'   ',
'   ',
'				:OHTA_PRINT_SEQ := :ohta_seq_no;',
'           Insert into  OPO_HD_TNC_ATTR(OHTA_BU,',
'													ohta_plnt,',
'													OHTA_PO_PFX,',
'													ohta_po_no,',
'											     OHTA_SEQ_NO,',
'											     OHTA_ATTR_ID,',
'											     OHTA_PRINT_SEQ,',
'											     OHTA_CRE_BY,',
'											     OHTA_CRE_DATE)',
'                                         values (:GLOBAL_BU,',
'													  :ohta_plnt,',
'													  :OHTA_PO_PFX,',
'													  :ohta_po_no,',
'											     :OHTA_SEQ_NO,',
'											     :OHTA_ATTR_ID,',
'											     :OHTA_PRINT_SEQ,',
'											     :GLOBAL_USER,',
'											     SYSDATE);',
'												  commit;',
'				ELSIF :apex$row_status = ''U'' THEN								 ',
'								update OPO_HD_TNC_ATTR	 ',
'                           set   OHTA_ATTR_ID     =:OHTA_ATTR_ID,',
'											OHTA_CRE_BY      =:GLOBAL_USER,',
'											OHTA_CRE_DATE    =SYSDATE',
'								 where OHTA_BU						=:GLOBAL_BU					',
'								   AND OHTA_PLNT                   =:OHTA_PLNT                ',
'								   AND OHTA_PO_PFX                 =:OHTA_PO_PFX',
'								   AND OHTA_PO_NO 					=:OHTA_PO_NO',
'								   AND OHTA_SEQ_NO				    =:OHTA_SEQ_NO;',
'					commit;				',
'							ELSIF :apex$row_status = ''D'' THEN				',
'									DELETE FROM OPO_HD_TNC_ATTR',
'									   where OHTA_BU						=:GLOBAL_BU					',
'											AND OHTA_PLNT                   =:OHTA_PLNT                ',
'											AND OHTA_PO_PFX                 =:OHTA_PO_PFX',
'											AND OHTA_PO_NO 					=:OHTA_PO_NO',
'											AND OHTA_SEQ_NO				    =:OHTA_SEQ_NO;',
'							DELETE FROM OPO_HD_TNC_ATTR_VAL',
'								 where OHTAV_BU			= :GLOBAL_BU					',
'								   AND OHTAV_PLNT       = :OHTA_PLNT                ',
'								   AND OHTAV_PO_PFX     = :OHTA_PO_PFX',
'									AND OHTAV_SEQ_NO     = :OHTAV_SEQ_NO;',
'				commit;	',
'	 END IF;',
'END;',
'                                   '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2218551754822874584
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700543210218485701)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Unit_Desc'
,p_static_id=>'unit-desc'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P67_PRCHD_PLNT_LOC_N IS NOT NULL THEN',
'BEGIN',
' SELECT bupld_loc_id,bupld_plnt',
' into :P67_PRCHD_PLNT_LOC_I,:P67_PRCHD_PLNT',
'   FROM bus_unit_plants_loc_dtls, ',
'        bus_unit_plants',
'  WHERE bup_bu = bupld_bu',
'    AND bup_plant_id = bupld_plnt',
'    AND bupld_bu = :GLOBAL_bu',
'    AND bupld_loc_name = :P67_PRCHD_PLNT_LOC_N',
'    AND bupld_actv_loc_flag = ''Y'';',
'  --  raise_application_error(-20999,''test''||:P161513103001_PRH_PLNT_LOC_ID||''/''||:P161513103001_PRH_PLNT_LOC_NAM||''/''||:P161513103001_PRH_PLANT);',
'',
'END;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2218581374674874673
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700525654965485670)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(9009110908254837187)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Value - Save Interactive Grid Data'
,p_static_id=>'value-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'      BEGIN',
'                IF :apex$row_status = ''C'' THEN',
'			SELECT NVL(MAX(ohtav_sub_seq_no),0)+1 ',
'			INTO :ohtav_sub_seq_no ',
'			FROM opo_hd_tnc_attr_val',
'			WHERE ohtav_bu = :GLOBAL_bu   ',
'				AND ohtav_plnt = :P67_PRCHD_PLNT ',
'				AND ohtav_po_pfx = :P67_PRCHD_PO_PFX   ',
'				AND ohtav_po_no = :P67_PRCHD_PO_NO ',
'				AND ohtav_seq_no = :ohtav_seq_no;',
'   ',
'--:OHTA_PRINT_SEQ := :ohta_seq_no;',
'              insert into  OPO_HD_TNC_ATTR_VAL(OHTAV_BU,',
'											   OHTAV_PLNT,',
'											   OHTAV_PO_PFX,',
'											   OHTAV_PO_NO,',
'											   OHTAV_SEQ_NO,',
'											   OHTAV_SUB_SEQ_NO,',
'											   OHTAV_ATTR_VAL,',
'											   OHTAV_CRE_BY,',
'											   OHTAV_CRE_DATE)',
'                                       values (:GLOBAL_BU,',
'											   :OHTAV_PLNT,',
'											   :OHTAV_PO_PFX,',
'											   :OHTAV_PO_NO,',
'											   :OHTAV_SEQ_NO,',
'											   :OHTAV_SUB_SEQ_NO,',
'											   :OHTAV_ATTR_VAL,',
'											   :GLOBAL_USER,',
'											   SYSDATE);',
'												commit;',
'				ELSIF :apex$row_status = ''U'' THEN								 ',
'								update OPO_HD_TNC_ATTR_VAL	 ',
'                           set OHTAV_ATTR_VAL   =:OHTAV_ATTR_VAL,',
'									    OHTAV_CRE_BY     =:GLOBAL_USER,',
'									    OHTAV_CRE_DATE   =SYSDATE',
'								 where OHTAV_BU			=:GLOBAL_BU',
'								   AND OHTAV_PLNT		   =:OHTAV_PLNT',
'								   AND OHTAV_PO_PFX		=:OHTAV_PO_PFX',
'								   AND OHTAV_PO_NO		=:OHTAV_PO_NO',
'								   AND OHTAV_SEQ_NO		=:OHTAV_SEQ_NO',
'								   AND OHTAV_SUB_SEQ_NO	=:OHTAV_SUB_SEQ_NO;',
'									commit;',
'					ELSIF :apex$row_status = ''D'' THEN			   ',
'								   DELETE FROM OPO_HD_TNC_ATTR_VAL',
'								   where OHTAV_BU			=:GLOBAL_BU',
'								   AND OHTAV_PLNT		=:OHTAV_PLNT',
'								   AND OHTAV_PO_PFX		=:OHTAV_PO_PFX',
'								   AND OHTAV_PO_NO		=:OHTAV_PO_NO',
'								   AND OHTAV_SEQ_NO		=:OHTAV_SEQ_NO',
'								   AND OHTAV_SUB_SEQ_NO	=:OHTAV_SUB_SEQ_NO;',
'			commit;',
'         ',
'END IF;',
'END;',
'                                   '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2218563819421874642
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7700548039918485723)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Worflow'
,p_static_id=>'worflow'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P67_WF_NO IS NOT NULL THEN',
'        SELECT wfdc_doc_pfx,wfdc_doc_no INTO :P67_PRCHD_PO_PFX,:P67_PRCHD_PO_NO',
'            FROM work_flow_doc_control',
'        WHERE WFDC_WF_NO = :P67_WF_NO;',
'',
'	:P67_PAGE_NAVIGATE := ''f?p=&GLOBAL_WF_APP_NO.:236131010:&GLOBAL_SESSION.'';',
'',
'ELSE',
'	:P67_PAGE_NAVIGATE := ''f?p=&APP_ID.:1615131025:&SESSION.'';',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2218586204374874695
);
wwv_flow_imp.component_end;
end;
/
