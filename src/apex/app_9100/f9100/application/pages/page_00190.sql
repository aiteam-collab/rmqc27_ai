prompt --application/pages/page_00190
begin
--   Manifest
--     PAGE: 00190
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
 p_id=>190
,p_name=>'Doc. Mgmt. Bulk Upload'
,p_alias=>'DOC-MGMT-BULK-UPLOAD1'
,p_step_title=>'Doc. Mgmt. Bulk Upload'
,p_warn_on_unsaved_changes=>'N'
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
' }',
'',
'.t-Form-fieldContainer--floatingLabel.t-Form-fieldContainer {',
'    display: flex;',
'    padding: 4px;',
'    align-items: flex-start;',
'}',
'',
'#addbtn{',
'        color: blue;',
'        background-color: #ffffff;',
'}',
'',
'#SEARCH{',
'                color: green;',
'                background-color: #ffffff;',
'}',
'#cancelbtn{',
'                color: rgb(214, 19, 29);',
'                background-color: #ffffff;',
'}',
'',
'#cancelbtn1{',
'                color: rgb(214, 19, 29);',
'                background-color: #ffffff;',
'} ',
'',
'',
'.a-Button--hot, .t-Button--hot:not(.t-Button--simple), body .ui-button.ui-button--hot, body .ui-state-default.ui-priority-primary {',
'    background-color: #ffffff;',
'    color: #000000;',
'}',
'',
'.a-Button--hot:hover, .t-Button--hot:not(.t-Button--simple):hover, body .ui-button.ui-button--hot:hover, body .ui-state-default.ui-priority-primary:hover, .a-Button--hot:not(:active):focus, .t-Button--hot:not(.t-Button--simple):not(:active):focus, bo'
||'dy .ui-button.ui-button--hot:not(:active):focus, body .ui-state-default.ui-priority-primary:not(:active):focus {',
'    background-color: #ffffff;',
'}',
''))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6842953037618429795)
,p_plug_name=>'Doc. Mgmt. Bulk Upload'
,p_static_id=>'doc-mgmt-bulk-upload'
,p_title=>'Result(s)'
,p_region_name=>'detail'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT doc_mgmt_bulk_upload_hd.ROWID as rowid_hd,',
'       dmbuh_bu,',
'       dmbuh_doc_no,',
'       TO_CHAR(dmbuh_doc_date,:GLOBAL_DATE_FORMAT) AS dmbuh_doc_date,',
'       dmbuh_ref,',
'       dmbuh_status,',
'       DECODE(dmbuh_status,''N'',''Draft'',''P'',''Posted'',''C'',''Cancelled'') AS status,',
'       CASE dmbuh_status WHEN ''N'' THEN ''Blue''WHEN ''P'' then ''Green''WHEN ''C'' then ''Red''END color,',
'       dmbul_doc_type,',
'	   dmbul_due_date,',
'	   dmbul_rtn_end_date,',
'	   dmbul_tags,',
'	   dmbul_vou_type,',
'	   dmbul_vou_no,',
'	   dmbul_vou_date,',
'	   dmbul_party_id,',
'	   dmbul_item_id,',
'	   dmbul_emp_id,',
'	   dmbul_notes,',
'	   dmbul_loc_id,',
'	   dmbul_plnt_id,',
'	   dmbul_clob_data,',
'	   dmbul_file_name,',
'	   dmbul_mime_type,',
'	   dmbul_doc_name,',
'       (SELECT suplr_name1',
'          FROM suppliers',
'         WHERE suplr_bu = dmbuh_bu ',
'           AND suplr_suplr_id = dmbul_party_id) AS dmbul_party_name,',
'       (SELECT (prod_desc11 || '' '' || prod_desc21)',
'          FROM products',
'         WHERE prod_bu  = dmbuh_bu',
'           AND prod_id  = dmbul_item_id',
'           AND prod_rev = dmbul_prod_rev) AS dmbul_prod_desc,',
'       (SELECT (emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1) AS emp_name',
'          FROM employees',
'         WHERE emp_bu = dmbuh_bu',
'           AND emp_emp_id = dmbul_emp_id) emp_name,',
'       (SELECT bupld_loc_name',
'          FROM bus_unit_plants_loc_dtls',
'         WHERE bupld_bu = dmbuh_bu',
'           AND bupld_loc_id = dmbul_loc_id)dma_loc_dec,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = dmbuh_bu ',
'           AND bup_plant_id = dmbul_plnt_id) dma_plnt_desc',
'  FROM doc_mgmt_bulk_upload_hd,',
'       doc_mgmt_bulk_upload_ln',
' WHERE dmbuh_bu = dmbul_bu',
'   AND dmbuh_doc_no = dmbul_doc_no',
'   AND dmbuh_bu = :GLOBAL_BU',
'   AND (dmbul_doc_type = :P190_DOC_TYPE OR :P190_DOC_TYPE IS NULL)',
'   AND (dmbul_vou_type = :P190_VOU_TYPE OR :P190_VOU_TYPE IS NULL)',
'   AND (dmbul_vou_no = :P190_VOU_NO OR :P190_VOU_NO IS NULL)',
'   AND (dmbul_party_id = :P190_PARTY_NAME OR :P190_PARTY_NAME IS NULL)',
'   AND (dmbul_item_id = :P190_ITEM OR :P190_ITEM IS NULL)',
'   AND (dmbul_emp_id = :P190_EMP_NAME OR :P190_EMP_NAME IS NULL)',
'   AND (dmbul_tags = :P190_TAGS OR :P190_TAGS IS NULL)',
'   AND (dmbul_loc_id = :P190_LOC_ID OR :P190_LOC_ID IS NULL)',
'   AND (dmbul_plnt_id = :P190_UNIT OR :P190_UNIT IS NULL)',
'   AND (dmbuh_status = :P190_STATUS OR :P190_STATUS IS NULL)',
'   AND ((dmbuh_doc_date BETWEEN TO_DATE(:P190_DOC_DATE_FRM,:GLOBAL_DATE_FORMAT) AND TO_DATE(:P190_DOC_DATE_TO,:GLOBAL_DATE_FORMAT)) ',
'       OR (dmbuh_doc_date >= TO_DATE(:P190_DOC_DATE_FRM,:GLOBAL_DATE_FORMAT))',
'       OR (dmbuh_doc_date <= TO_DATE(:P190_DOC_DATE_TO,:GLOBAL_DATE_FORMAT))',
'       OR (:P190_DOC_DATE_FRM IS NULL AND :P190_DOC_DATE_TO IS NULL))',
'   AND ((dmbul_vou_date BETWEEN TO_DATE(:P190_VOU_DATE_FRM,:GLOBAL_DATE_FORMAT) AND TO_DATE(:P190_VOU_DATE_TO,:GLOBAL_DATE_FORMAT)) ',
'       OR (dmbul_vou_date >= TO_DATE(:P190_VOU_DATE_FRM,:GLOBAL_DATE_FORMAT))',
'       OR (dmbul_vou_date <= TO_DATE(:P190_VOU_DATE_TO,:GLOBAL_DATE_FORMAT))',
'       OR (:P190_VOU_DATE_FRM IS NULL AND :P190_VOU_DATE_TO IS NULL))',
'  -- AND :P190_SHOW_DATA = ''Y''',
' ORDER BY dmbuh_doc_no DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P190_DOC_DATE_FRM,P190_DOC_DATE_TO,P190_DOC_TYPE,P190_VOU_TYPE,P190_VOU_NO,P190_PARTY_NAME,P190_ITEM,P190_EMP_NAME,P190_VOU_DATE_FRM,P190_VOU_DATE_TO,P190_TAGS,P190_LOC_ID,P190_UNIT,P190_STATUS,P190_SHOW_DATA'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6842953103770429795)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1363432119985509593
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6843566445751834612)
,p_db_column_name=>'COLOR'
,p_display_order=>55
,p_column_identifier=>'S'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852337333586882925)
,p_db_column_name=>'DMA_LOC_DEC'
,p_display_order=>275
,p_column_identifier=>'AO'
,p_column_label=>'Loc. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852337455275882926)
,p_db_column_name=>'DMA_PLNT_DESC'
,p_display_order=>285
,p_column_identifier=>'AP'
,p_column_label=>'Unit Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6842953792179429800)
,p_db_column_name=>'DMBUH_BU'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'Dmbuh Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6843566230804834610)
,p_db_column_name=>'DMBUH_DOC_DATE'
,p_display_order=>35
,p_column_identifier=>'Q'
,p_column_label=>'Doc. Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6842954247473429803)
,p_db_column_name=>'DMBUH_DOC_NO'
,p_display_order=>0
,p_column_identifier=>'B'
,p_column_label=>'Doc. No.'
,p_column_link=>'f?p=&APP_ID.:193:&SESSION.::&DEBUG.::P193_ROWID:#ROWID_HD##ROWID#'
,p_column_linktext=>'#DMBUH_DOC_NO#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6842954993267429805)
,p_db_column_name=>'DMBUH_REF'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6842955391674429805)
,p_db_column_name=>'DMBUH_STATUS'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Dmbuh Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852336608525882918)
,p_db_column_name=>'DMBUL_CLOB_DATA'
,p_display_order=>205
,p_column_identifier=>'AH'
,p_column_label=>'Dmbul Clob Data'
,p_column_type=>'CLOB'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852336923882882921)
,p_db_column_name=>'DMBUL_DOC_NAME'
,p_display_order=>235
,p_column_identifier=>'AK'
,p_column_label=>'Dmbul Doc Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852335339959882905)
,p_db_column_name=>'DMBUL_DOC_TYPE'
,p_display_order=>75
,p_column_identifier=>'U'
,p_column_label=>'Doc. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852335406745882906)
,p_db_column_name=>'DMBUL_DUE_DATE'
,p_display_order=>85
,p_column_identifier=>'V'
,p_column_label=>'Due Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852336205762882914)
,p_db_column_name=>'DMBUL_EMP_ID'
,p_display_order=>165
,p_column_identifier=>'AD'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852336739110882919)
,p_db_column_name=>'DMBUL_FILE_NAME'
,p_display_order=>215
,p_column_identifier=>'AI'
,p_column_label=>'File Path'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852336101720882913)
,p_db_column_name=>'DMBUL_ITEM_ID'
,p_display_order=>155
,p_column_identifier=>'AC'
,p_column_label=>'Item ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852336479114882916)
,p_db_column_name=>'DMBUL_LOC_ID'
,p_display_order=>185
,p_column_identifier=>'AF'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852336836185882920)
,p_db_column_name=>'DMBUL_MIME_TYPE'
,p_display_order=>225
,p_column_identifier=>'AJ'
,p_column_label=>'Dmbul Mime Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852336293723882915)
,p_db_column_name=>'DMBUL_NOTES'
,p_display_order=>175
,p_column_identifier=>'AE'
,p_column_label=>'Notes'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852336069800882912)
,p_db_column_name=>'DMBUL_PARTY_ID'
,p_display_order=>145
,p_column_identifier=>'AB'
,p_column_label=>'Party ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852337056563882922)
,p_db_column_name=>'DMBUL_PARTY_NAME'
,p_display_order=>245
,p_column_identifier=>'AL'
,p_column_label=>'Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852336541406882917)
,p_db_column_name=>'DMBUL_PLNT_ID'
,p_display_order=>195
,p_column_identifier=>'AG'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852337132555882923)
,p_db_column_name=>'DMBUL_PROD_DESC'
,p_display_order=>255
,p_column_identifier=>'AM'
,p_column_label=>'Item Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852335518240882907)
,p_db_column_name=>'DMBUL_RTN_END_DATE'
,p_display_order=>95
,p_column_identifier=>'W'
,p_column_label=>'Retention End Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852335652969882908)
,p_db_column_name=>'DMBUL_TAGS'
,p_display_order=>105
,p_column_identifier=>'X'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852335916263882911)
,p_db_column_name=>'DMBUL_VOU_DATE'
,p_display_order=>135
,p_column_identifier=>'AA'
,p_column_label=>'Vou. Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852335816447882910)
,p_db_column_name=>'DMBUL_VOU_NO'
,p_display_order=>125
,p_column_identifier=>'Z'
,p_column_label=>'Vou. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852335782546882909)
,p_db_column_name=>'DMBUL_VOU_TYPE'
,p_display_order=>115
,p_column_identifier=>'Y'
,p_column_label=>'Vou. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852337220064882924)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>265
,p_column_identifier=>'AN'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6852335193122882904)
,p_db_column_name=>'ROWID_HD'
,p_display_order=>65
,p_is_primary_key=>'Y'
,p_column_identifier=>'T'
,p_column_label=>'Rowid Hd'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6843566337030834611)
,p_db_column_name=>'STATUS'
,p_display_order=>45
,p_column_identifier=>'R'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6842961356774431728)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'13634404'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'DMBUH_DOC_NO:DMBUH_DOC_DATE:DMBUL_DOC_TYPE:DMBUL_DUE_DATE:DMBUL_RTN_END_DATE:DMBUL_TAGS:DMBUL_VOU_TYPE:DMBUL_VOU_NO:DMBUL_VOU_DATE:DMBUL_PARTY_ID:DMBUL_PARTY_NAME:DMBUL_ITEM_ID:DMBUL_PROD_DESC:DMBUL_EMP_ID:EMP_NAME:DMBUL_NOTES:DMBUL_LOC_ID:DMA_LOC_DE'
||'C:DMBUL_PLNT_ID:DMA_PLNT_DESC:DMBUL_FILE_NAME:DMBUH_REF:STATUS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6844304460931531711)
,p_plug_name=>'Search'
,p_static_id=>'search'
,p_title=>'Find Doc. Mgmt. Bulk Upload'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--controlsPosEnd:is-expanded:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(279871683119629685)
,p_plug_name=>'Show More  Less'
,p_static_id=>'show-more-less'
,p_region_name=>'A'
,p_parent_plug_id=>wwv_flow_imp.id(6844304460931531711)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>170
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6844305988669531727)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6844304460931531711)
,p_button_name=>'CLEAR'
,p_static_id=>'clear'
,p_button_static_id=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6842959912380429808)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6844304460931531711)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_static_id=>'SEARCH'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapLeft:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:193:&APP_SESSION.::&DEBUG.:193::'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6844306136782531728)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6844304460931531711)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_static_id=>'cancelbtn'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapRight:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Home'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_button_css_classes=>'cancelbtn'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(279872243161629691)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6844304460931531711)
,p_button_name=>'Less'
,p_static_id=>'less'
,p_button_static_id=>'L'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Show Less'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(279871740619629686)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6844304460931531711)
,p_button_name=>'More'
,p_static_id=>'more'
,p_button_static_id=>'M'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Show More'
,p_button_position=>'EDIT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6844305902592531726)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6844304460931531711)
,p_button_name=>'REPORT'
,p_static_id=>'report'
,p_button_static_id=>'savebtn'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconRight:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6870325047419218809)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6844304460931531711)
,p_button_name=>'Search'
,p_static_id=>'search'
,p_button_static_id=>'SEARCH'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconRight:t-Button--padBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6844304550963531712)
,p_name=>'P190_DOC_DATE_FRM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6844304460931531711)
,p_prompt=>'Doc. Date From'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-none'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6844304642068531713)
,p_name=>'P190_DOC_DATE_TO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6844304460931531711)
,p_prompt=>'Doc. Date To'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6844304744575531714)
,p_name=>'P190_DOC_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6844304460931531711)
,p_prompt=>'Doc. Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT dmbul_doc_type D,',
'       dmbul_doc_type R',
'  FROM doc_mgmt_bulk_upload_hd,',
'       doc_mgmt_bulk_upload_ln',
' WHERE dmbuh_bu = dmbul_bu',
'   AND dmbuh_doc_no = dmbul_doc_no',
'   AND dmbuh_bu = :GLOBAL_BU',
'   AND dmbul_doc_type IS NOT NULL'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Doc. Type',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6844305269942531719)
,p_name=>'P190_EMP_NAME'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6844304460931531711)
,p_prompt=>'Emp. Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_name ,',
'       dmbul_emp_id',
'  FROM (',
'SELECT DISTINCT dmbul_emp_id ,',
'       (SELECT (emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1) AS emp_name',
'          FROM employees',
'         WHERE emp_bu = dmbuh_bu',
'           AND emp_emp_id = dmbul_emp_id) emp_name',
'  FROM doc_mgmt_bulk_upload_hd,',
'       doc_mgmt_bulk_upload_ln',
' WHERE dmbuh_bu = dmbul_bu',
'   AND dmbuh_doc_no = dmbul_doc_no',
'   AND dmbuh_bu = :global_bu',
'   AND dmbul_emp_id IS NOT NULL',
'  )'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Employee',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6844305154547531718)
,p_name=>'P190_ITEM'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6844304460931531711)
,p_prompt=>'Item'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT dmbul_prod_desc,',
'       D',
'  FROM (',
'SELECT DISTINCT dmbul_item_id AS D,',
'        (SELECT (prod_desc11 || '' '' || prod_desc21)',
'           FROM products',
'          WHERE prod_bu = dmbuh_bu',
'            AND prod_id = dmbul_item_id',
'            AND prod_rev = dmbul_prod_rev) AS dmbul_prod_desc',
'  FROM doc_mgmt_bulk_upload_hd,',
'       doc_mgmt_bulk_upload_ln',
' WHERE dmbuh_bu = dmbul_bu',
'   AND dmbuh_doc_no = dmbul_doc_no',
'   AND dmbuh_bu = :global_bu',
'   AND dmbul_item_id IS NOT NULL',
'  )',
''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-none'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Item',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6844305593313531723)
,p_name=>'P190_LOC_ID'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6844304460931531711)
,p_prompt=>'Loc. ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT dma_loc_dec,',
'       dmbul_loc_id',
'  FROM (',
'SELECT DISTINCT dmbul_loc_id,',
'      (SELECT bupld_loc_name',
'        FROM bus_unit_plants_loc_dtls',
'       WHERE bupld_bu = dmbuh_bu',
'         AND bupld_loc_id = dmbul_loc_id)dma_loc_dec',
'  FROM doc_mgmt_bulk_upload_hd,',
'       doc_mgmt_bulk_upload_ln',
' WHERE dmbuh_bu = dmbul_bu',
'   AND dmbuh_doc_no = dmbul_doc_no',
'   AND dmbuh_bu = :global_bu',
'   AND dmbul_loc_id IS NOT NULL',
'  )'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-none'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Loc. ID',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6844305053279531717)
,p_name=>'P190_PARTY_NAME'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6844304460931531711)
,p_prompt=>'Party Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT dmbul_party_name,',
'       dmbul_party_id',
'  FROM (',
'SELECT DISTINCT dmbul_party_id ,',
'       (SELECT suplr_name1',
'          FROM suppliers',
'         WHERE suplr_bu = dmbuh_bu ',
'           AND suplr_suplr_id = dmbul_party_id) as dmbul_party_name',
'  FROM doc_mgmt_bulk_upload_hd,',
'       doc_mgmt_bulk_upload_ln',
' WHERE dmbuh_bu = dmbul_bu',
'   AND dmbuh_doc_no = dmbul_doc_no',
'   AND dmbuh_bu = :global_bu',
'   AND dmbul_party_id IS NOT NULL',
'  )'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-none'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Party Name',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6846315344364406306)
,p_name=>'P190_SHOW_DATA'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6844304460931531711)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6844305784602531725)
,p_name=>'P190_STATUS'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(279871683119629685)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;N,Posted;P'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6844305554219531722)
,p_name=>'P190_TAGS'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6844304460931531711)
,p_prompt=>'Tags'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT dmbul_tags AS D,',
'       dmbul_tags AS R',
'  FROM doc_mgmt_bulk_upload_hd,',
'       doc_mgmt_bulk_upload_ln',
' WHERE dmbuh_bu = dmbul_bu',
'   AND dmbuh_doc_no = dmbul_doc_no',
'   AND dmbuh_bu = :GLOBAL_bu',
'   AND dmbul_tags IS NOT NULL'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Tags',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6844305764172531724)
,p_name=>'P190_UNIT'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(279871683119629685)
,p_prompt=>'Unit'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT dma_plnt_desc,',
'       dmbul_plnt_id',
'  FROM (',
'SELECT DISTINCT dmbul_plnt_id,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = dmbuh_bu ',
'           AND bup_plant_id = dmbul_plnt_id) dma_plnt_desc',
'  FROM doc_mgmt_bulk_upload_hd,',
'       doc_mgmt_bulk_upload_ln',
' WHERE dmbuh_bu = dmbul_bu',
'   AND dmbuh_doc_no = dmbul_doc_no',
'   AND dmbuh_bu = :global_bu',
'   AND dmbul_plnt_id IS NOT NULL',
'  )',
''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-none'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Unit',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6844305346395531720)
,p_name=>'P190_VOU_DATE_FRM'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6844304460931531711)
,p_prompt=>'Vou. Date From'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6844305440032531721)
,p_name=>'P190_VOU_DATE_TO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6844304460931531711)
,p_prompt=>'Vou. Date To'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6844304931850531716)
,p_name=>'P190_VOU_NO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6844304460931531711)
,p_prompt=>'Vou. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT dmbul_vou_no AS D,',
'       dmbul_vou_no AS R',
'  FROM doc_mgmt_bulk_upload_hd,',
'       doc_mgmt_bulk_upload_ln',
' WHERE dmbuh_bu = dmbul_bu',
'   AND dmbuh_doc_no = dmbul_doc_no',
'   AND dmbuh_bu = :global_bu',
'   AND dmbul_vou_no IS NOT NULL'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Vou. No.',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6844304862052531715)
,p_name=>'P190_VOU_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6844304460931531711)
,p_prompt=>'Vou. Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT dmbul_vou_type AS D,',
'       dmbul_vou_type AS R',
'  FROM doc_mgmt_bulk_upload_hd,',
'       doc_mgmt_bulk_upload_ln',
' WHERE dmbuh_bu = dmbul_bu',
'   AND dmbuh_doc_no = dmbul_doc_no',
'   AND dmbuh_bu = :global_bu',
'   AND dmbul_vou_type IS NOT NULL',
''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Vou. Type',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6852337526230882927)
,p_name=>'clear'
,p_static_id=>'clear'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6844305988669531727)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6852337636764882928)
,p_event_id=>wwv_flow_imp.id(6852337526230882927)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P190_DOC_DATE_FRM,P190_DOC_DATE_TO,P190_DOC_TYPE,P190_VOU_TYPE,P190_VOU_NO,P190_PARTY_NAME,P190_ITEM,P190_EMP_NAME,P190_VOU_DATE_FRM,P190_VOU_DATE_TO,P190_TAGS,P190_LOC_ID,P190_UNIT,P190_STATUS,P190_SHOW_DATA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6870325390960218813)
,p_event_id=>wwv_flow_imp.id(6852337526230882927)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6842953037618429795)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6870325159128218810)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6870325047419218809)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6870325301248218812)
,p_event_id=>wwv_flow_imp.id(6870325159128218810)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6842953037618429795)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6870325238837218811)
,p_event_id=>wwv_flow_imp.id(6870325159128218810)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P190_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6852337693657882929)
,p_name=>'REPORT'
,p_static_id=>'report'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6844305902592531726)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6854734501323809403)
,p_event_id=>wwv_flow_imp.id(6852337693657882929)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("detail").refresh();')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6852337941686882931)
,p_event_id=>wwv_flow_imp.id(6852337693657882929)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6842953037618429795)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6852337790082882930)
,p_event_id=>wwv_flow_imp.id(6852337693657882929)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P190_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(279872359032629692)
,p_name=>'Show Less'
,p_static_id=>'show-less'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(279872243161629691)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(279872403338629693)
,p_event_id=>wwv_flow_imp.id(279872359032629692)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item( "A" ).hide();',
    'apex.item( "L" ).hide();',
    'apex.item( "M" ).show();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(279871842356629687)
,p_name=>'Show More'
,p_static_id=>'show-more'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(279871740619629686)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(279871929328629688)
,p_event_id=>wwv_flow_imp.id(279871842356629687)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item( "A" ).show();',
    'apex.item( "L" ).show();',
    'apex.item( "M" ).hide();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(279872540578629694)
,p_name=>'Show More Less'
,p_static_id=>'show-more-less'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(279872646831629695)
,p_event_id=>wwv_flow_imp.id(279872540578629694)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item( "A" ).hide();',
    'apex.item( "L" ).hide();',
    'apex.item( "M" ).show();')))).to_clob
);
wwv_flow_imp.component_end;
end;
/
