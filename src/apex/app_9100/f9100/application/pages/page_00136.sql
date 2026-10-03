prompt --application/pages/page_00136
begin
--   Manifest
--     PAGE: 00136
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
 p_id=>136
,p_name=>'Doc. Mgmt - Audit Logs'
,p_alias=>'DOC-MANAGEMENT-AUDIT'
,p_step_title=>'Doc. Mgmt - Audit Logs'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* ---Interactive Report--- */',
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
'/* ---Interactive Report  end--- */',
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
'#savebtn{',
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
'',
'',
'#Clear123{',
'   background-image: url(#WORKSPACE_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: #ffffff;',
'   background-size: 26px;',
'   width: 28px;',
'   height: 25px;',
'   padding-top: var(--ut-region-buttons-padding-y, 8px);',
'   padding-bottom: var(--ut-region-buttons-padding-y, 8px);',
'   padding-left: var(--ut-region-buttons-padding-x, 12px);',
'   padding-right: var(--ut-region-buttons-padding-x, 12px);',
'}'))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6674073692065973528)
,p_plug_name=>'Doc_Management_Audit'
,p_static_id=>'doc-management-audit'
,p_title=>'Result(s)'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:margin-top-none'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DMA_BU,',
'       DMA_DOC_NO,',
'       nvl(DMA_DOC_REV,0) as DMA_DOC_REV,',
'       DMA_DOC_NO  as doc_no,',
'       DMA_REQ_DOC_NO,',
'       DECODE(DMA_ACTIVITY_TYPE,''A'',''Add'',''V'',''View'',''D'',''Download'',''U'',''Update'',''R'',''Retention'',''C'',''Cancelled'') AS DMA_ACTIVITY_TYPE,',
'    --    DECODE(DMA_ACTIVITY_TYPE,''A'',''Blue'',''V'',''Brown'',''D'',''Green'',''U'',''Orange'') AS COLOR,',
'       DECODE(DMA_ACTIVITY_TYPE,''A'',''Blue'',''V'',''purple'',''D'',''deepskyblue'',''U'',''DarkOrange'',''C'',''Red'',''R'',''#FF5792'') AS COLOR,',
'       DMA_ACTIVITY_TYPE AS DMA_ACTIVITY_TYPE1,',
'       DMA_USER_NAME,',
'       DMA_CRE_BY,',
'       TO_CHAR(DMA_CRE_DATE,''DD-MM-RRRR HH24:MI:SS'')DMA_CRE_DATE,',
'       DMA_UPD_BY,',
'       TO_CHAR(DMA_UPD_DATE,''DD-MM-RRRR HH24:MI:SS'')DMA_UPD_DATE,',
'       DMA_CRE_EMP_ID,',
'       (select (EMP_FIRST_NAME1||'' ''||EMP_MIDDLE_NAME1||'' ''||EMP_LAST_NAME1) AS EMP_NAME',
'          from EMPLOYEES',
'         where EMP_BU = DMA_BU',
'           and EMP_EMP_ID = DMA_CRE_EMP_ID) DMA_EMP_NAME,',
'       (select INITCAP(EAIDV_DEPT_DESC)',
'          from EMP_ACTIVE_INFO_DTL_VIEW',
'         where EAIDV_BU = DMA_BU',
'           and EAIDV_EMP_ID = DMA_CRE_EMP_ID) DMA_DEPARMENT,',
'       (select INITCAP(EAIDV_POS_DESC)',
'          from EMP_ACTIVE_INFO_DTL_VIEW',
'         where EAIDV_BU = DMA_BU',
'           and EAIDV_EMP_ID = DMA_CRE_EMP_ID) DMA_POS_DESC,           ',
'        DMA_VOU_PFX,',
'        DMA_VOU_NO,',
'        DMA_VOU_SEQ_NO,',
'        DMA_TYPE_DESC,',
'        (SELECT apst_sub_type_desc',
'             FROM appl_vou_sub_types',
'            WHERE apst_bu = DMA_BU AND apst_sub_type = DMA_SUB_VOU_TYPE) DMA_SUB_VOU_TYPE,',
'        DMA_VOU_PFX||''-''||DMA_VOU_NO||''-''||DMA_VOU_SEQ_NO as pfx_no,',
'        TO_CHAR(DMA_DOC_DATE,''DD-MM-RRRR'') DMA_DOC_DATE,',
'        (CASE WHEN UPPER(SUBSTR(NVL(DMA_DOC_NAME,DMA_FILE_NAME),INSTR (NVL(DMA_DOC_NAME,DMA_FILE_NAME) ,''.'')+1)) IN (''XLS'',''XLSX'',''XLSM'',''XLSB'',''CSV'',''XLT(X)'') THEN',
'                 ''<span class="fa fa-file-excel-o" style="color: green ;font-weight: bold"></span>''||'' ''||nvl(DMA_DOC_NAME,DMA_FILE_NAME)',
'       WHEN UPPER(SUBSTR(NVL(DMA_DOC_NAME,DMA_FILE_NAME),INSTR (NVL(DMA_DOC_NAME,DMA_FILE_NAME) ,''.'')+1)) = ''PDF''  THEN',
'                ''<span class="fa fa-file-pdf-o" style="color: red ;font-weight: bold"></span>''||'' ''||nvl(DMA_DOC_NAME,DMA_FILE_NAME)',
'       WHEN  UPPER(SUBSTR(NVL(DMA_DOC_NAME,DMA_FILE_NAME),INSTR (NVL(DMA_DOC_NAME,DMA_FILE_NAME) ,''.'')+1)) = ''MP4''  THEN',
'               ''<span class="fa fa-file-video-o" style="color: deepskyblue ;font-weight: bold"></span>''||'' ''||nvl(DMA_DOC_NAME,DMA_FILE_NAME)',
'       WHEN  UPPER(SUBSTR(NVL(DMA_DOC_NAME,DMA_FILE_NAME),INSTR (NVL(DMA_DOC_NAME,DMA_FILE_NAME) ,''.'')+1)) in (''DOC'',''DOCX'',''DOT'',''DOTX'',''DOTM'',''DOCM'',''RTF'',''TXT'')  THEN',
'               ''<span class="fa fa-file-word-o" style="color: blue ;font-weight: bold"></span>''||'' ''||nvl(DMA_DOC_NAME,DMA_FILE_NAME)',
'       WHEN  UPPER(SUBSTR(NVL(DMA_DOC_NAME,DMA_FILE_NAME),INSTR (NVL(DMA_DOC_NAME,DMA_FILE_NAME) ,''.'')+1)) IN (''JPEG'',''JPG'',''PNG'',''GIF'',''BMP'',''TIFF'',''WebP'')  THEN',
'               ''<span class="fa fa-file-image-o" style="color: orange ;font-weight: bold"></span>''||'' ''||nvl(DMA_DOC_NAME,DMA_FILE_NAME)',
'       ELSE',
'              ''<span class="fa fa-file-word-o" style="color: blue ;font-weight: bold"></span>''||'' ''||nvl(DMA_DOC_NAME,DMA_FILE_NAME)',
'       END) DMA_DOC_NAME,',
'        DMA_BLOB,',
'        DMA_MIME_TYPE,',
'        DMA_FILE_NAME,',
'        DMA_FILE_NARR,',
'        DMA_ATTACH_DIR,',
'        ''<span aria-hidden="true" class="fa fa-download" style="color: blue ;font-weight: bold"></span>'' download,',
'        TO_CHAR(DMA_RET_DATE,''DD-MM-RRRR'') DMA_RET_DATE,',
'        TO_CHAR(DMA_RET_END_DATE,''DD-MM-RRRR HH24:MI:SS'') DMA_RET_END_DATE,',
'        TO_CHAR(DMA_DUE_DATE,''DD-MM-RRRR HH24:MI:SS'') DMA_DUE_DATE,',
'        DMA_TAGS,',
'        DMA_EMP_ID,',
'         (SELECT TRIM (',
'                     emp_first_name1 || emp_middle_name1 || emp_last_name1)',
'             FROM employees',
'            WHERE emp_bu = dma_bu AND emp_emp_id = dma_emp_id)',
'             dma_doc_emp_name,',
'        DMA_LOC_ID,',
'         (SELECT bupld_loc_name',
'             FROM bus_unit_plants_loc_dtls',
'            WHERE     bupld_bu = dma_bu',
'                  AND bupld_loc_id = dma_loc_id)DMA_LOC_DEC,',
'        DMA_PARTY_ID,',
'        (SELECT',
'    suplr_name1',
'FROM',
'    suppliers',
'WHERE',
'    suplr_bu = dma_bu ',
'    and suplr_suplr_id = DMA_PARTY_ID) as DMA_PARTY_NAME,',
'        (SELECT (prod_desc11 || '' '' || prod_desc21)',
'             FROM products',
'            WHERE     prod_bu = dma_bu',
'                  AND prod_id = dma_prod_id',
'                  AND prod_rev = dma_prod_rev) dma_prod_desc,',
'        DMA_PROD_ID,',
'        DMA_PROD_REV,',
'     (SELECT pcc_cc_code||''-''||pcc_desc',
'          FROM PROFIT_COST_CENTERS',
'         WHERE pcc_bu = :global_bu ',
'              AND pcc_cc_code = DMA_CPC_ID) DMA_cpc_desc,',
'        DMA_ENTITY,',
'         (SELECT bup_name1',
'             FROM bus_unit_plants',
'            WHERE bup_bu = dma_bu AND bup_plant_id = dma_plnt_id) dma_plnt_desc,',
'        DMA_PLNT_ID,',
'        DMA_NOTES,',
'        CASE WHEN DMA_VOU_SEQ_NO > 0 THEN DMA_VOU_NO||''-''||DMA_VOU_SEQ_NO ELSE DMA_VOU_NO END  as VOU_NO,',
'        dma_file_size',
'  from DOC_MGMT_AUDIT',
' where DMA_BU = :GLOBAL_BU',
'   and (DMA_DOC_NO = :P136_DOC_NO OR :P136_DOC_NO IS NULL)',
'   and (DMA_REQ_DOC_NO = :P136_REQ_DOC_NO OR :P136_REQ_DOC_NO IS NULL)',
'   and (DMA_ACTIVITY_TYPE = :P136_ACTIVITY_TYPE OR :P136_ACTIVITY_TYPE IS NULL)',
'   and (DMA_USER_NAME = :P136_USER_NAME OR :P136_USER_NAME IS NULL)',
'   and (DMA_VOU_NO = :P136_DOC_PFX_NO or :P136_DOC_PFX_NO is null)',
'   and (DMA_TYPE_DESC = :P136_DOC_TYPE or :P136_DOC_TYPE is null)',
'   and (DMA_SUB_VOU_TYPE = :P136_DOC_SUB_VOC_TYPE or :P136_DOC_SUB_VOC_TYPE is null)',
'   and (DMA_CRE_EMP_ID = :P136_EMP_NAME or :P136_EMP_NAME is null)',
'   and (dma_party_id = :P136_REF_PARTY_NAME or :P136_REF_PARTY_NAME is null)',
'   and (dma_prod_id = :P136_REF_ITEM or :P136_REF_ITEM is null)',
'   and (dma_emp_id = :P136_REF_EMP_NAME or :P136_REF_EMP_NAME is null)',
'   and (dma_loc_id = :P136_LOC_ID or :P136_LOC_ID is null)',
'   and (dma_plnt_id = :P136_UNIT or :P136_UNIT is null)',
'   and (dma_tags = :P136_TAGS or :P136_TAGS is null) ',
'   and  ((INSTR(UPPER((dma_cpc_id)),UPPER(TRIM(:P136_REF_COST_CENTERS))) > 0)',
'        OR :P136_REF_COST_CENTERS IS NULL)  ',
'   and (:P136_SHOW_DATA = ''Y'')',
'   and ((dma_doc_date between TO_DATE(:P136_DOC_DATE_FROM,:GLOBAL_DATE_FORMAT) and TO_DATE(:P136_DOC_DATE_TO,:GLOBAL_DATE_FORMAT) and :P136_DOC_DATE_FROM is not null and :P136_DOC_DATE_TO is not null)',
'       or (dma_doc_date >= TO_DATE(:P136_DOC_DATE_FROM,:GLOBAL_DATE_FORMAT) and :P136_DOC_DATE_FROM IS NOT NULL and :P136_DOC_DATE_TO is null)',
'       or (dma_doc_date <= TO_DATE(:P136_DOC_DATE_FROM,:GLOBAL_DATE_FORMAT) and :P136_DOC_DATE_TO IS NOT NULL and :P136_DOC_DATE_FROM is null)  ',
'       or (:P136_DOC_DATE_FROM is null and :P136_DOC_DATE_TO is nulL)',
'       )',
'',
'   and ((dma_cre_date between TO_DATE(:P136_ACT_DATE_FROM,:GLOBAL_DATE_FORMAT) and TO_DATE(:P136_ACT_DATE_TO,:GLOBAL_DATE_FORMAT) and :P136_ACT_DATE_FROM is not null and :P136_ACT_DATE_TO is not null)',
'       or (dma_cre_date >= TO_DATE(:P136_ACT_DATE_FROM,:GLOBAL_DATE_FORMAT) and :P136_ACT_DATE_FROM IS NOT NULL and :P136_ACT_DATE_TO is null)',
'       or (dma_cre_date <= TO_DATE(:P136_ACT_DATE_FROM,:GLOBAL_DATE_FORMAT) and :P136_ACT_DATE_TO IS NOT NULL and :P136_ACT_DATE_FROM is null)  ',
'       or (:P136_ACT_DATE_FROM is null and :P136_ACT_DATE_TO is nulL)',
'       )',
'   ORDER BY DMA_CRE_DATE asc-- ,to_char(DMA_CRE_DATE,''HH24:MI:SS'') asc',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P136_DOC_NO,P136_REQ_DOC_NO,P136_ACTIVITY_TYPE,P136_USER_NAME,P136_SHOW_DATA,P136_DOC_TYPE,P136_DOC_PFX_NO,P136_DOC_SUB_VOC_TYPE,P136_DOC_DATE_FROM,P136_DOC_DATE_TO,P136_ACT_DATE_FROM,P136_ACT_DATE_TO,P136_EMP_NAME,P136_REF_PARTY_NAME,P136_REF_ITEM,P'
||'136_REF_EMP_NAME,P136_LOC_ID,P136_UNIT,P136_TAGS,P136_REF_COST_CENTERS'
,p_prn_page_header=>'Doc_Management_Audit'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6674073784602973528)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1194552800818053326
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6675356675834454704)
,p_db_column_name=>'COLOR'
,p_display_order=>67
,p_column_identifier=>'N'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6674076119223973558)
,p_db_column_name=>'DMA_ACTIVITY_TYPE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Activity'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#DMA_ACTIVITY_TYPE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6675356496912454703)
,p_db_column_name=>'DMA_ACTIVITY_TYPE1'
,p_display_order=>57
,p_column_identifier=>'M'
,p_column_label=>'Dma Activity Type1'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6710364550483558513)
,p_db_column_name=>'DMA_ATTACH_DIR'
,p_display_order=>247
,p_column_identifier=>'AF'
,p_column_label=>'Dma Attach Dir'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6710364171782558509)
,p_db_column_name=>'DMA_BLOB'
,p_display_order=>207
,p_column_identifier=>'AB'
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
 p_id=>wwv_flow_imp.id(6674074539935973553)
,p_db_column_name=>'DMA_BU'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Entity'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6829828040948301905)
,p_db_column_name=>'DMA_CPC_DESC'
,p_display_order=>457
,p_column_identifier=>'BA'
,p_column_label=>'CPC Dec.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6674076978263973558)
,p_db_column_name=>'DMA_CRE_BY'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Username'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6674136314447001003)
,p_db_column_name=>'DMA_CRE_DATE'
,p_display_order=>17
,p_column_identifier=>'K'
,p_column_label=>'Activity Log Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6681604350241603805)
,p_db_column_name=>'DMA_CRE_EMP_ID'
,p_display_order=>77
,p_column_identifier=>'O'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_format_mask=>'PCT_GRAPH:::'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6681604490307603807)
,p_db_column_name=>'DMA_DEPARMENT'
,p_display_order=>97
,p_column_identifier=>'Q'
,p_column_label=>'Deparment'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6710444271891928503)
,p_db_column_name=>'DMA_DOC_DATE'
,p_display_order=>257
,p_column_identifier=>'AG'
,p_column_label=>'Doc. Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6728679889590387019)
,p_db_column_name=>'DMA_DOC_EMP_NAME'
,p_display_order=>437
,p_column_identifier=>'AY'
,p_column_label=>'Ref. Emp. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6710364002423558508)
,p_db_column_name=>'DMA_DOC_NAME'
,p_display_order=>197
,p_column_identifier=>'AA'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6674074974780973556)
,p_db_column_name=>'DMA_DOC_NO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Audit Doc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6674075283906973558)
,p_db_column_name=>'DMA_DOC_REV'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Audit Doc. Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6728678510092387005)
,p_db_column_name=>'DMA_DUE_DATE'
,p_display_order=>297
,p_column_identifier=>'AK'
,p_column_label=>'Due Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6728678687334387007)
,p_db_column_name=>'DMA_EMP_ID'
,p_display_order=>317
,p_column_identifier=>'AM'
,p_column_label=>'Ref. Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6681604462745603806)
,p_db_column_name=>'DMA_EMP_NAME'
,p_display_order=>87
,p_column_identifier=>'P'
,p_column_label=>'Emp. Name'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_format_mask=>'PCT_GRAPH:::'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6728679658065387016)
,p_db_column_name=>'DMA_ENTITY'
,p_display_order=>407
,p_column_identifier=>'AV'
,p_column_label=>'Entity'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6710364357193558511)
,p_db_column_name=>'DMA_FILE_NAME'
,p_display_order=>227
,p_column_identifier=>'AD'
,p_column_label=>'Dma File Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6710364433913558512)
,p_db_column_name=>'DMA_FILE_NARR'
,p_display_order=>237
,p_column_identifier=>'AE'
,p_column_label=>'Dma File Narr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7178135808184184306)
,p_db_column_name=>'DMA_FILE_SIZE'
,p_display_order=>477
,p_column_identifier=>'BC'
,p_column_label=>'File Size'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6728679071751387010)
,p_db_column_name=>'DMA_LOC_DEC'
,p_display_order=>347
,p_column_identifier=>'AP'
,p_column_label=>'Loc. Desc'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6728678898250387009)
,p_db_column_name=>'DMA_LOC_ID'
,p_display_order=>337
,p_column_identifier=>'AO'
,p_column_label=>'Loc. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6710364262839558510)
,p_db_column_name=>'DMA_MIME_TYPE'
,p_display_order=>217
,p_column_identifier=>'AC'
,p_column_label=>'File Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6729130420875886403)
,p_db_column_name=>'DMA_NOTES'
,p_display_order=>447
,p_column_identifier=>'AZ'
,p_column_label=>'Notes'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6728679136519387011)
,p_db_column_name=>'DMA_PARTY_ID'
,p_display_order=>357
,p_column_identifier=>'AQ'
,p_column_label=>'Ref. Party ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6728679283630387012)
,p_db_column_name=>'DMA_PARTY_NAME'
,p_display_order=>367
,p_column_identifier=>'AR'
,p_column_label=>'Ref. Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6728679773031387017)
,p_db_column_name=>'DMA_PLNT_DESC'
,p_display_order=>417
,p_column_identifier=>'AW'
,p_column_label=>'Unit Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6728679808093387018)
,p_db_column_name=>'DMA_PLNT_ID'
,p_display_order=>427
,p_column_identifier=>'AX'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6681604658450603808)
,p_db_column_name=>'DMA_POS_DESC'
,p_display_order=>107
,p_column_identifier=>'R'
,p_column_label=>'Designaion'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6728679315262387013)
,p_db_column_name=>'DMA_PROD_DESC'
,p_display_order=>377
,p_column_identifier=>'AS'
,p_column_label=>'Ref. Item Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6728679441158387014)
,p_db_column_name=>'DMA_PROD_ID'
,p_display_order=>387
,p_column_identifier=>'AT'
,p_column_label=>'Ref. Item ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6728679559715387015)
,p_db_column_name=>'DMA_PROD_REV'
,p_display_order=>397
,p_column_identifier=>'AU'
,p_column_label=>'Ref. Item Rev.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6674075774093973558)
,p_db_column_name=>'DMA_REQ_DOC_NO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Req. Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6728678325839387003)
,p_db_column_name=>'DMA_RET_DATE'
,p_display_order=>277
,p_column_identifier=>'AI'
,p_column_label=>'Retention End Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6728678440722387004)
,p_db_column_name=>'DMA_RET_END_DATE'
,p_display_order=>287
,p_column_identifier=>'AJ'
,p_column_label=>'Retention End Date'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6709614503366736307)
,p_db_column_name=>'DMA_SUB_VOU_TYPE'
,p_display_order=>157
,p_column_identifier=>'W'
,p_column_label=>'Ref. Vou Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6728678652982387006)
,p_db_column_name=>'DMA_TAGS'
,p_display_order=>307
,p_column_identifier=>'AL'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6709614430643736306)
,p_db_column_name=>'DMA_TYPE_DESC'
,p_display_order=>147
,p_column_identifier=>'V'
,p_column_label=>'Doc.Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6674077721088973558)
,p_db_column_name=>'DMA_UPD_BY'
,p_display_order=>27
,p_column_identifier=>'I'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6674136389104001004)
,p_db_column_name=>'DMA_UPD_DATE'
,p_display_order=>47
,p_column_identifier=>'L'
,p_column_label=>'Updated Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6674076486346973558)
,p_db_column_name=>'DMA_USER_NAME'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Username'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6709614254120736304)
,p_db_column_name=>'DMA_VOU_NO'
,p_display_order=>127
,p_column_identifier=>'T'
,p_column_label=>'Ref. Vou. No old'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6709614136680736303)
,p_db_column_name=>'DMA_VOU_PFX'
,p_display_order=>117
,p_column_identifier=>'S'
,p_column_label=>'Dma Vou Pfx'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6709614362859736305)
,p_db_column_name=>'DMA_VOU_SEQ_NO'
,p_display_order=>137
,p_column_identifier=>'U'
,p_column_label=>'Dma Vou Seq No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6710363827390558506)
,p_db_column_name=>'DOC_NO'
,p_display_order=>177
,p_column_identifier=>'Y'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6710444286774928504)
,p_db_column_name=>'DOWNLOAD'
,p_display_order=>267
,p_column_identifier=>'AH'
,p_column_label=>'&nbsp;'
,p_column_link=>'javascript:window.open(''&GLOBAL_API_URL.attachment/download/#DMA_BU#/#DMA_DOC_NO#'', ''_self'');'
,p_column_linktext=>'#DOWNLOAD#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6709614680802736308)
,p_db_column_name=>'PFX_NO'
,p_display_order=>167
,p_column_identifier=>'X'
,p_column_label=>'Vou. Pfx/No./Line'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7079312115087369303)
,p_db_column_name=>'VOU_NO'
,p_display_order=>467
,p_column_identifier=>'BB'
,p_column_label=>'Ref. Vou. No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6674079131425975155)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'11945582'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'DOC_NO:DMA_DOC_DATE:DMA_TYPE_DESC:DMA_CRE_BY:DMA_DOC_NAME:DMA_MIME_TYPE:DMA_FILE_SIZE:DMA_ACTIVITY_TYPE:DMA_CRE_DATE:DMA_SUB_VOU_TYPE:VOU_NO:DMA_DUE_DATE:DMA_RET_DATE:DMA_TAGS:DMA_PARTY_ID:DMA_PARTY_NAME:DMA_PROD_ID:DMA_PROD_REV:DMA_PROD_DESC:DMA_EMP'
||'_ID:DMA_DOC_EMP_NAME:DMA_CPC_DESC:DMA_NOTES:DMA_BU:DMA_LOC_ID:DMA_LOC_DEC:DMA_PLNT_ID:DMA_PLNT_DESC:DMA_CRE_EMP_ID:DMA_EMP_NAME'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6674136505631001005)
,p_plug_name=>'Find Doc. Mgmt - Audit Logs'
,p_static_id=>'find-doc-mgmt-audit-logs'
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
 p_id=>wwv_flow_imp.id(6817823945043150610)
,p_plug_name=>'Show More'
,p_static_id=>'show-more'
,p_region_name=>'D'
,p_parent_plug_id=>wwv_flow_imp.id(6674136505631001005)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display:none";'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>170
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6674137233131001012)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6674136505631001005)
,p_button_name=>'CLEAR'
,p_static_id=>'clear'
,p_button_static_id=>'Clear123'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6674137010447001010)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6674136505631001005)
,p_button_name=>'Generate'
,p_static_id=>'generate'
,p_button_static_id=>'SEARCH'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generate'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6674137115842001011)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6674136505631001005)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_static_id=>'cancelbtn'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--danger:t-Button--gapRight:t-Button--gapBottom'
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
 p_id=>wwv_flow_imp.id(6817824624282150617)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6674136505631001005)
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
,p_button_cattributes=>'style=display:none; data-testid="Less"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6817824569381150616)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6674136505631001005)
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6674136803007001008)
,p_name=>'P136_ACTIVITY_TYPE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6674136505631001005)
,p_prompt=>'Activity Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT D,R',
'  FROM (',
'SELECT DECODE (dma_activity_type,''A'',''Add'',''V'',''View'',''D'',''Download'',''R'',''Retention'',''C'',''Cancelled'') D,',
'       dma_activity_type R,',
'       DECODE (dma_activity_type,''A'',''1'',''V'',''2'',''D'',''3'',''R'',''4'',''C'',''5'') seq_no',
'  FROM (',
'SELECT DISTINCT dma_activity_type ',
'  FROM doc_mgmt_audit',
' WHERE dma_bu = :GLOBAL_bu',
' ) )',
'ORDER BY seq_no',
'',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-none'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6817738231860997903)
,p_name=>'P136_ACT_DATE_FROM'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6674136505631001005)
,p_prompt=>'Activity Date From'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
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
 p_id=>wwv_flow_imp.id(6817738362840997904)
,p_name=>'P136_ACT_DATE_TO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6674136505631001005)
,p_prompt=>'Activity Date To'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
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
 p_id=>wwv_flow_imp.id(6795721603714454103)
,p_name=>'P136_DOC_DATE_FROM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6674136505631001005)
,p_prompt=>'Doc. Date From'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
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
 p_id=>wwv_flow_imp.id(6795721710517454104)
,p_name=>'P136_DOC_DATE_TO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6674136505631001005)
,p_prompt=>'Doc. Date To'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
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
 p_id=>wwv_flow_imp.id(6674136653610001006)
,p_name=>'P136_DOC_NO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6674136505631001005)
,p_prompt=>'Doc. No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT dma_doc_no D,',
'       dma_doc_no R',
'  FROM doc_mgmt_audit',
' WHERE dma_bu = :GLOBAL_bu'))
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
  'title', 'Select the Audit Doc. No.',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6710363608360558504)
,p_name=>'P136_DOC_PFX_NO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6674136505631001005)
,p_prompt=>'Ref. Vou. No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT DMA_VOU_NO D,',
'       DMA_VOU_NO R',
'  FROM doc_mgmt_audit',
' WHERE dma_bu = :GLOBAL_bu'))
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
 p_id=>wwv_flow_imp.id(6710363766575558505)
,p_name=>'P136_DOC_SUB_VOC_TYPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6674136505631001005)
,p_prompt=>'Ref. Vou Type '
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT    (SELECT apst_sub_type_desc',
'             FROM appl_vou_sub_types',
'            WHERE apst_bu = dma_bu AND apst_sub_type = DMA_SUB_VOU_TYPE) D,',
'       DMA_SUB_VOU_TYPE R',
'  FROM doc_mgmt_audit',
' WHERE dma_bu = :GLOBAL_bu'))
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
  'title', 'Select the Audit Doc. No.',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6710363531587558503)
,p_name=>'P136_DOC_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6674136505631001005)
,p_prompt=>'Doc. Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT DMA_TYPE_DESC D,',
'       DMA_TYPE_DESC R',
'  FROM doc_mgmt_audit',
' WHERE dma_bu = :GLOBAL_bu'))
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
 p_id=>wwv_flow_imp.id(6817823769970150608)
,p_name=>'P136_EMP_NAME'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6674136505631001005)
,p_prompt=>'Emp. Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT dma_emp_name,',
'       dma_cre_emp_id',
'  FROM (',
'SELECT DISTINCT dma_cre_emp_id,',
'       (SELECT (emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1) as emp_name',
'          FROM employees',
'         WHERE emp_bu = dma_bu',
'           AND emp_emp_id = dma_cre_emp_id) dma_emp_name',
'  FROM doc_mgmt_audit',
' WHERE dma_bu = :GLOBAL_bu',
')'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
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
  'title', 'Select the Employee',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6817824300187150614)
,p_name=>'P136_LOC_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6817823945043150610)
,p_prompt=>'Loc. ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'DOC_AUDIT_LOC_ID'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
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
  'title', 'Select the Location',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6829827917173301904)
,p_name=>'P136_REF_COST_CENTERS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6817823945043150610)
,p_prompt=>'CPC Dec.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'DOC_COST_CENTERS'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
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
  'title', 'Select the Employee',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6817824183958150613)
,p_name=>'P136_REF_EMP_NAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6817823945043150610)
,p_prompt=>'Ref. Emp. Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'DOC_AUDIT_EMP'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
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
  'title', 'Select the Employee',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6817824159507150612)
,p_name=>'P136_REF_ITEM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6817823945043150610)
,p_prompt=>'Ref. Item'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'DOC_AUDIT_ITEM'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(6817824014455150611)
,p_name=>'P136_REF_PARTY_NAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6817823945043150610)
,p_prompt=>'Ref. Party Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'DOC_AUDIT_PARTY'
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
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Ref. Party Name')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6674136757311001007)
,p_name=>'P136_REQ_DOC_NO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(6674136505631001005)
,p_prompt=>'Req. Doc. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT dma_req_doc_no D,',
'       dma_req_doc_no R',
'  FROM doc_mgmt_audit',
' WHERE dma_bu = :GLOBAL_bu'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Req. Doc. No.',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6674137496812001015)
,p_name=>'P136_SHOW_DATA'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6674136505631001005)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6817823823294150609)
,p_name=>'P136_TAGS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6674136505631001005)
,p_prompt=>'Tags'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT dma_tags D,',
'       dma_tags R',
'  FROM doc_mgmt_audit',
' WHERE dma_bu = :GLOBAL_bu',
''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
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
  'title', 'Select the Tags',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6817824391077150615)
,p_name=>'P136_UNIT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6817823945043150610)
,p_prompt=>'Unit'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'DOC_AUDIT_UNIT'
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
  'title', 'Select the Unit',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6674136929863001009)
,p_name=>'P136_USER_NAME'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6674136505631001005)
,p_prompt=>'Username'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT dma_user_name D,',
'       dma_user_name R',
'  FROM doc_mgmt_audit',
' WHERE dma_bu = :GLOBAL_bu'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-none'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Username',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6674137355817001013)
,p_name=>'CLEAR'
,p_static_id=>'clear'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6674137233131001012)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6674137428911001014)
,p_event_id=>wwv_flow_imp.id(6674137355817001013)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P136_DOC_NO,P136_REQ_DOC_NO,P136_ACTIVITY_TYPE,P136_USER_NAME,P136_SHOW_DATA,P136_DOC_TYPE,P136_DOC_PFX_NO,P136_DOC_SUB_VOC_TYPE,P136_DOC_DATE_FROM,P136_DOC_DATE_TO,P136_ACT_DATE_FROM,P136_ACT_DATE_TO,P136_EMP_NAME,P136_REF_PARTY_NAME,P136_REF_ITEM,P'
||'136_REF_EMP_NAME,P136_LOC_ID,P136_UNIT,P136_REF_COST_CENTERS,P136_TAGS'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6674137617351001016)
,p_name=>'Generate'
,p_static_id=>'generate'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6674137010447001010)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6674137879231001018)
,p_event_id=>wwv_flow_imp.id(6674137617351001016)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6674073692065973528)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6674137732064001017)
,p_event_id=>wwv_flow_imp.id(6674137617351001016)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P136_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6817824911477150620)
,p_name=>'Less'
,p_static_id=>'less'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6817824624282150617)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6817825014644150621)
,p_event_id=>wwv_flow_imp.id(6817824911477150620)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("L").hide();',
    'apex.item("M").show();',
    'apex.item("D").hide();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6817824714720150618)
,p_name=>'More'
,p_static_id=>'more'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6817824569381150616)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6817824795240150619)
,p_event_id=>wwv_flow_imp.id(6817824714720150618)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("L").show();',
    'apex.item("M").hide();',
    'apex.item("D").show();')))).to_clob
);
wwv_flow_imp.component_end;
end;
/
