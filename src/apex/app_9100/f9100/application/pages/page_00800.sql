prompt --application/pages/page_00800
begin
--   Manifest
--     PAGE: 00800
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
 p_id=>800
,p_name=>'Document Management View'
,p_alias=>'DOCUMENT-MANAGEMENT-VIEW'
,p_page_mode=>'MODAL'
,p_step_title=>'Document Management View'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function downfile(bu, docNo) {',
'    var apiUrl = apex.item("P800_API_URL").getValue();',
'',
'    apex.server.process(',
'        "DOWNFILE",',
'        {',
'            x01: docNo,',
'            x02: bu',
'        },',
'        {',
'            dataType: "text",',
'            success: function(pData) {',
'                apex.item("DMA").refresh();',
'',
'                window.open(',
'                    apiUrl + "attachment/download/" + encodeURIComponent(bu) + "/" + encodeURIComponent(docNo),',
'                    "_self"',
'                );',
'            }',
'        }',
'    );',
'}',
'function viewDoc(url, docNo) {',
'',
'    apex.server.process(',
'        "VIEWFILE",',
'        {',
'            x01: encodeURIComponent(docNo)',
'        },',
'        {',
'            success: function () {',
'                console.log("Audit logged for docNo: " + docNo);',
'            },',
'            error: function () {',
'                console.error("Failed to log audit for docNo: " + docNo);',
'            }',
'        }',
'    );',
'',
'    if (url && url.trim() !== "") {',
'        window.open(encodeURI(url), "_blank", "noopener,noreferrer");',
'    } else {',
'        apex.message.alert("No viewer available!");',
'    }',
'}',
''))
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
'.addbtn .fa-plus::before {',
'  color: blue !important;',
'}'))
,p_step_template=>wwv_flow_imp.id(6470303034115005558)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_dialog_width=>'1200'
,p_dialog_chained=>'N'
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9576646979333421929)
,p_plug_name=>'Doc. Management Audit'
,p_static_id=>'doc-management-audit'
,p_title=>'Doc. Mgmt - Audit Logs'
,p_region_name=>'DMA'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>100
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT dm_bu,',
'       dm_doc_no,',
'       nvl(dm_doc_rev,0) AS dm_doc_rev,',
'       dm_doc_no||''-''||nvl(dm_doc_rev,0) AS doc_no,',
'       dm_req_doc_no,',
'       dm_cre_by,',
'       to_char(dm_cre_date,:GLOBAL_RPT_DATE_MASK||'' HH24:MI:SS'')dm_cre_date,',
'       dm_upd_by,',
'       to_char(dm_upd_date,:GLOBAL_RPT_DATE_MASK||'' HH24:MI:SS'')dm_upd_date,',
'       dm_cre_emp_id,',
'       (SELECT (emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1) AS emp_name',
'          FROM employees',
'         WHERE emp_bu = dm_bu',
'           AND emp_emp_id = dm_cre_emp_id) dm_cre_emp_name,',
'       (SELECT initcap(eaidv_dept_desc)',
'          FROM emp_active_info_dtl_view',
'         WHERE eaidv_bu = dm_bu',
'           AND eaidv_emp_id = dm_cre_emp_id) dm_deparment,',
'       (SELECT initcap(eaidv_pos_desc)',
'          FROM emp_active_info_dtl_view',
'         WHERE eaidv_bu = dm_bu',
'           AND eaidv_emp_id = dm_cre_emp_id) dm_pos_desc,           ',
'        (CASE WHEN UPPER(substr(nvl(dm_doc_name,dm_file_name),instr (nvl(dm_doc_name,dm_file_name) ,''.'')+1)) IN (''XLS'',''XLSX'',''XLSM'',''XLSB'',''CSV'',''XLT(X)'') THEN',
'                 ''<span class="fa fa-file-excel-o" style="color: green ;font-weight: bold"></span>''||'' ''||nvl(dm_doc_name,dm_file_name)',
'         WHEN UPPER(substr(nvl(dm_doc_name,dm_file_name),instr (nvl(dm_doc_name,dm_file_name) ,''.'')+1)) = ''PDF''  THEN',
'                ''<span class="fa fa-file-pdf-o" style="color: red ;font-weight: bold"></span>''||'' ''||nvl(dm_doc_name,dm_file_name)',
'         WHEN  UPPER(substr(nvl(dm_doc_name,dm_file_name),instr (nvl(dm_doc_name,dm_file_name) ,''.'')+1)) = ''MP4''  THEN',
'               ''<span class="fa fa-file-video-o" style="color: deepskyblue ;font-weight: bold"></span>''||'' ''||nvl(dm_doc_name,dm_file_name)',
'         WHEN  UPPER(substr(nvl(dm_doc_name,dm_file_name),instr (nvl(dm_doc_name,dm_file_name) ,''.'')+1)) IN (''DOC'',''DOCX'',''DOT'',''DOTX'',''DOTM'',''DOCM'',''RTF'',''TXT'')  THEN',
'               ''<span class="fa fa-file-word-o" style="color: blue ;font-weight: bold"></span>''||'' ''||nvl(dm_doc_name,dm_file_name)',
'         WHEN  UPPER(substr(nvl(dm_doc_name,dm_file_name),instr (nvl(dm_doc_name,dm_file_name) ,''.'')+1)) IN (''JPEG'',''JPG'',''PNG'',''GIF'',''BMP'',''TIFF'',''WebP'')  THEN',
'               ''<span class="fa fa-file-image-o" style="color: orange ;font-weight: bold"></span>''||'' ''||nvl(dm_doc_name,dm_file_name)',
'         ELSE',
'              ''<span class="fa fa-file-word-o" style="color: blue ;font-weight: bold"></span>''||'' ''||nvl(dm_doc_name,dm_file_name)',
'         END) dm_doc_name,',
'        CASE WHEN dmua_vw_access = ''Y'' THEN ''<span aria-hidden="true" class="fa fa-download" style="color: deepskyblue ;font-weight: bold"></span>''',
'        ELSE NULL END download,',
'        CASE WHEN dmua_del_access = ''Y'' THEN ''<span aria-hidden="true" class="fa fa-remove" style="color: red ;font-weight: bold"></span>'' ',
'        ELSE NULL END can_cel,',
'        to_char(dm_ret_date,''DD-MM-RRRR'') dm_ret_date,',
'        to_char(dm_due_date,''DD-MM-RRRR HH24:MI:SS'') dm_due_date,',
'        dm_tags,',
'        dm_notes,',
'        dm_type_desc,',
'        ''<span aria-hidden="true" class="fa fa-eye" style="color: purple ;font-weight: bold"></span>'' view_attch,       ',
'        CASE WHEN dmua_vw_access = ''Y'' AND DM_MIME_TYPE IN (''application/pdf'', ''image/png'', ''image/jpeg'', ''text/plain'', ''exe'', ''text/javascript'') AND dm_status = ''A''',
'            THEN',
'                ''<a href="javascript:void(0);" class="fa fa-eye" style="color: purple; font-weight: bold" ''',
'                || ''onclick="viewDoc('''''' ',
'                || ''f?p=&APP_ID.:0:&SESSION.:APPLICATION_PROCESS=VIEW_ATTACHMENT:::P800_DOC_NO:'' || dm_doc_no',
'                || '''''','' || dm_doc_no || '')"></a>''',
'',
'            WHEN dmua_vw_access = ''Y'' AND dm_mime_type IN (''application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'',''application/vnd.ms-excel'') AND dm_status = ''A''',
'            THEN',
'                ''<a href="javascript:void(0);" class="fa fa-eye"',
'                    style="color: purple; font-weight: bold"',
'                    onclick="viewDoc('''''' ||',
'                    ''https://view.officeapps.live.com/op/view.aspx?src='' ||',
'                    apex_util.url_encode(',
'                        ''https://webappqc.roadmaperp.com:8765/ords/rmqc27/documents/excel/'' || dm_doc_no',
'                    ) ||',
'                    '''''','' || dm_doc_no || '')"></a>''',
'            WHEN dmua_vw_access = ''Y'' AND dm_mime_type IN (''application/msword'',',
'                                  ''application/vnd.openxmlformats-officedocument.wordprocessingml.document'') AND dm_status = ''A''',
'                                  THEN',
'                ''<a href="javascript:void(0);" class="fa fa-eye" style="color: purple; font-weight: bold" ''',
'                || ''onclick="viewDoc('''''' ',
'                || ''f?p=&APP_ID.:2:&SESSION.:APPLICATION_PROCESS=VIEW_ATTACHMENT:::P800_DOC_NO:'' || dm_doc_no',
'                || '''''','' || dm_doc_no || '')"></a>''',
'',
'            WHEN dmua_vw_access = ''Y'' THEN',
'                ''<span aria-hidden="true" class="fa fa-eye" style="color: purple ;font-weight: bold"></span>''',
'                --''No viewer available''',
'            ELSE NULL',
'        END AS VIEW_DOC,',
'        decode(dm_status,''A'',''Active'',''D'',''Cancelled'',''R'',''Retention'')dm_status,',
'        decode(dm_status,''A'',''green'',''D'',''red'',''R'',''Brown'')color,',
'        decode(dm_status,''A'',''link'',''D'',''nolink'',''R'',''nolink'')link1,',
'        dm_file_size,',
'        dm_mime_type,',
'        d.dm_rowid,',
'        '''' edit',
'   FROM doc_mgmt_attach_vw d,doc_mgmt_user_access',
'  WHERE dm_bu = dmua_bu(+)',
'    AND dm_type_desc = dmua_doc_type(+)',
'    AND dmua_user(+) = :GLOBAL_user',
'    AND dm_bu = :GLOBAL_BU    ',
'    AND (dm_vou_pfx = :P800_REF_VOU_PFX OR :P800_REF_VOU_PFX IS NULL)',
'    AND (dm_vou_no = :P800_REF_VOU_NO OR :P800_REF_VOU_NO IS NULL)',
'    -- AND (dm_vou_seq_no = :P800_REF_VOU_SEQ OR :P800_REF_VOU_SEQ IS NULL AND dm_vou_seq_no IS NULL)',
'    AND ((dm_vou_seq_no =:P800_REF_VOU_SEQ AND :P800_REF_VOU_SEQ IS NOT NULL) OR (:P800_REF_VOU_SEQ IS NULL AND dm_vou_seq_no IS NULL))',
'    AND (dm_prod_id = :P800_REF_ITEM_ID OR :P800_REF_ITEM_ID IS NULL)',
'    AND (dm_prod_rev = :P800_REF_ITEM_REV OR :P800_REF_ITEM_REV IS NULL)',
'    AND (dm_emp_id = :P800_REF_EMP_ID OR :P800_REF_EMP_ID IS NULL)',
'    AND (dm_vou_plnt = :P800_REF_PLNT OR :P800_REF_PLNT IS NULL)',
'    AND (dm_loc_id = :P800_REF_PLNT_LOC OR :P800_REF_PLNT_LOC IS NULL)',
'    AND (dm_party_id = :P800_REF_PARTY_ID OR :P800_REF_PARTY_ID IS NULL)    ',
'    AND (dm_sub_vou_type = :P800_REF_VOU_TYPE OR :P800_REF_VOU_TYPE IS NULL)',
'    AND (dm_vou_level = :P800_REF_VOU_LVL OR :P800_REF_VOU_LVL IS NULL)',
' ORDER BY TO_DATE(dm_cre_date,:GLOBAL_RPT_DATE_MASK||'' HH24:MI:SS'') DESC',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P800_DOC_NO,P800_REF_VOU_PFX,P800_REF_VOU_SEQ,P800_REF_ITEM_ID,P800_REF_ITEM_REV,P800_REF_EMP_ID,P800_REF_PARTY_ID,P800_REF_PARTY_TYPE,P800_REF_PLNT,P800_REF_PLNT_LOC,P800_REF_STATUS'
,p_prn_page_header=>'Doc. Management Audit'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(9576647097945421929)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>4097126114160501727
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6922337142404082024)
,p_db_column_name=>'CAN_CEL'
,p_display_order=>60
,p_column_identifier=>'AZ'
,p_column_label=>'Action'
,p_column_link=>'javascript:$s(''P800_DOC_NO'',''#DM_DOC_NO#'');apex.submit(''CAN'');'
,p_column_linktext=>'#CAN_CEL#'
,p_column_link_attr=>'class="#LINK1#"'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_display_condition=>'P800_REF_STATUS'
,p_display_condition2=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6926061386971182006)
,p_db_column_name=>'COLOR'
,p_display_order=>270
,p_column_identifier=>'BV'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6922337289428082026)
,p_db_column_name=>'DM_BU'
,p_display_order=>90
,p_column_identifier=>'BA'
,p_column_label=>'Dm Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6922337701444082030)
,p_db_column_name=>'DM_CRE_BY'
,p_display_order=>70
,p_column_identifier=>'BE'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6922337808216082031)
,p_db_column_name=>'DM_CRE_DATE'
,p_display_order=>80
,p_column_identifier=>'BF'
,p_column_label=>'Created Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6922338163677082034)
,p_db_column_name=>'DM_CRE_EMP_ID'
,p_display_order=>170
,p_column_identifier=>'BI'
,p_column_label=>'Dm Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6922338228635082035)
,p_db_column_name=>'DM_CRE_EMP_NAME'
,p_display_order=>180
,p_column_identifier=>'BJ'
,p_column_label=>'Dm Cre Emp Name'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6922338287963082036)
,p_db_column_name=>'DM_DEPARMENT'
,p_display_order=>190
,p_column_identifier=>'BK'
,p_column_label=>'Dm Deparment'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6922338570363082038)
,p_db_column_name=>'DM_DOC_NAME'
,p_display_order=>30
,p_column_identifier=>'BM'
,p_column_label=>'File Name'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6922337428398082027)
,p_db_column_name=>'DM_DOC_NO'
,p_display_order=>110
,p_column_identifier=>'BB'
,p_column_label=>'Dm Doc No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6922337575373082028)
,p_db_column_name=>'DM_DOC_REV'
,p_display_order=>120
,p_column_identifier=>'BC'
,p_column_label=>'Dm Doc Rev'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6922338756386082040)
,p_db_column_name=>'DM_DUE_DATE'
,p_display_order=>220
,p_column_identifier=>'BO'
,p_column_label=>'Dm Due Date'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7178135565362184303)
,p_db_column_name=>'DM_FILE_SIZE'
,p_display_order=>290
,p_column_identifier=>'BX'
,p_column_label=>'File Size'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7178135633166184304)
,p_db_column_name=>'DM_MIME_TYPE'
,p_display_order=>300
,p_column_identifier=>'BY'
,p_column_label=>'File Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6922338960016082042)
,p_db_column_name=>'DM_NOTES'
,p_display_order=>240
,p_column_identifier=>'BQ'
,p_column_label=>'Dm Notes'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6922338453192082037)
,p_db_column_name=>'DM_POS_DESC'
,p_display_order=>200
,p_column_identifier=>'BL'
,p_column_label=>'Dm Pos Desc'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6922337630733082029)
,p_db_column_name=>'DM_REQ_DOC_NO'
,p_display_order=>130
,p_column_identifier=>'BD'
,p_column_label=>'Dm Req Doc No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6922338652489082039)
,p_db_column_name=>'DM_RET_DATE'
,p_display_order=>210
,p_column_identifier=>'BN'
,p_column_label=>'Dm Ret Date'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3790613725081592231)
,p_db_column_name=>'DM_ROWID'
,p_display_order=>310
,p_column_identifier=>'BZ'
,p_column_label=>'Dm Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6926061331221182005)
,p_db_column_name=>'DM_STATUS'
,p_display_order=>260
,p_column_identifier=>'BU'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#DM_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6922338803558082041)
,p_db_column_name=>'DM_TAGS'
,p_display_order=>230
,p_column_identifier=>'BP'
,p_column_label=>'Dm Tags'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6922339170651082044)
,p_db_column_name=>'DM_TYPE_DESC'
,p_display_order=>10
,p_column_identifier=>'BS'
,p_column_label=>'Doc. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6922337907335082032)
,p_db_column_name=>'DM_UPD_BY'
,p_display_order=>150
,p_column_identifier=>'BG'
,p_column_label=>'Dm Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6922338020077082033)
,p_db_column_name=>'DM_UPD_DATE'
,p_display_order=>160
,p_column_identifier=>'BH'
,p_column_label=>'Dm Upd Date'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9576648888342421942)
,p_db_column_name=>'DOC_NO'
,p_display_order=>100
,p_column_identifier=>'D'
,p_column_label=>'Doc. ID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9576659662292421953)
,p_db_column_name=>'DOWNLOAD'
,p_display_order=>40
,p_column_identifier=>'AE'
,p_column_label=>'Download'
,p_column_link=>'javascript:downfile(''#DM_BU#'',''#DM_DOC_NO#'');'
,p_column_linktext=>'#DOWNLOAD#'
,p_column_link_attr=>'class="#LINK1#"'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(3790613847361592232)
,p_db_column_name=>'EDIT'
,p_display_order=>320
,p_column_identifier=>'CA'
,p_column_label=>'Edit'
,p_column_link=>'f?p=&APP_ID.:802:&SESSION.::&DEBUG.:RP,802:P802_ROWID:#DM_ROWID#'
,p_column_linktext=>'<span class="fa fa-edit" style="color: blue ;font-weight: bold"></span>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6926061582573182007)
,p_db_column_name=>'LINK1'
,p_display_order=>280
,p_column_identifier=>'BW'
,p_column_label=>'Link1'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6922335371519082006)
,p_db_column_name=>'VIEW_ATTCH'
,p_display_order=>50
,p_column_identifier=>'AX'
,p_column_label=>'View'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6922339302911082046)
,p_db_column_name=>'VIEW_DOC'
,p_display_order=>250
,p_column_identifier=>'BT'
,p_column_label=>'View'
,p_column_link=>'Javascript:viewDoc(''#DM_BU#'',''#DM_DOC_NO#'');apex.submit(''VIEW'');'
,p_column_linktext=>'#VIEW_DOC#'
,p_column_link_attr=>'class="#LINK1#"'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9576697257698439601)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'13154059'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'EDIT:DM_TYPE_DESC:DM_DOC_NAME:DM_MIME_TYPE:DM_FILE_SIZE:DM_CRE_BY:DM_CRE_DATE:DOWNLOAD:VIEW_DOC:DM_STATUS:CAN_CEL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6935724744628869903)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_name=>'doc_modal'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size720x480'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>120
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<iframe',
'    id="docFrame"',
'    style="width:100%; height:90vh; border:none;">',
'</iframe>',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6922336231076082015)
,p_plug_name=>'Parameter'
,p_static_id=>'parameter'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6922336756316082020)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9576646979333421929)
,p_button_name=>'UPLOAD'
,p_static_id=>'upload'
,p_button_static_id=>'UPLOAD'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'ADD'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:802:&SESSION.::&DEBUG.:RP,802:P802_DM_VOU_TYPE,P802_DM_VOU_PFX,P802_DM_VOU_LEVEL:&P800_REF_VOU_TYPE.,&P800_REF_VOU_PFX.,&P800_REF_VOU_LVL.'
,p_button_condition=>':P800_REF_STATUS NOT IN(''L'',''X'',''C'',''D'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6922335662469082009)
,p_branch_name=>'Go To View File'
,p_branch_action=>'f?p=&APP_ID.:801:&SESSION.::&DEBUG.:RP,801:P801_DM_DOC_NO:&P800_DOC_NO_VIEW.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'VIEW'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6922337257418082025)
,p_name=>'P800_API_URL'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6922336231076082015)
,p_item_default=>'GLOBAL_API_URL'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9576155322393699046)
,p_name=>'P800_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9576646979333421929)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6922335482126082007)
,p_name=>'P800_DOC_NO_VIEW'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9576646979333421929)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8162276656419282113)
,p_name=>'P800_REF_EMP_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6922336231076082015)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8162276500198282111)
,p_name=>'P800_REF_ITEM_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6922336231076082015)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6922336157768082014)
,p_name=>'P800_REF_ITEM_REV'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6922336231076082015)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6922336325899082016)
,p_name=>'P800_REF_PARTY_ID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6922336231076082015)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6922336434943082017)
,p_name=>'P800_REF_PARTY_TYPE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6922336231076082015)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6922336492029082018)
,p_name=>'P800_REF_PLNT'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6922336231076082015)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6922336589829082019)
,p_name=>'P800_REF_PLNT_LOC'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6922336231076082015)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8261565226157954805)
,p_name=>'P800_REF_STATUS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6922336231076082015)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7170622088137841086)
,p_name=>'P800_REF_VOU_LVL'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(6922336231076082015)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8162276297875282109)
,p_name=>'P800_REF_VOU_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6922336231076082015)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6922335949733082012)
,p_name=>'P800_REF_VOU_PFX'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6922336231076082015)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6922336018422082013)
,p_name=>'P800_REF_VOU_SEQ'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6922336231076082015)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8162276141753282108)
,p_name=>'P800_REF_VOU_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6922336231076082015)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6922336939194082022)
,p_name=>'Close'
,p_static_id=>'close'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6922337047947082023)
,p_event_id=>wwv_flow_imp.id(6922336939194082022)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9576646979333421929)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6922335848262082011)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DOWNFILE'
,p_static_id=>'downfile'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CURSOR c1',
'   IS',
'      SELECT *',
'        FROM doc_mgmt_attach_vw',
'       WHERE dm_bu = :global_bu AND dm_doc_no = apex_application.g_x01;',
'',
'   cr1   c1%ROWTYPE;',
'   v_rev NUMBER;',
'BEGIN',
'   OPEN c1;',
'',
'   FETCH c1 INTO cr1;',
'',
'   IF c1%FOUND',
'   THEN',
'      SELECT NVL(MAX(dma_doc_rev),0) + 1',
'        INTO v_rev',
'        FROM doc_mgmt_audit',
'       WHERE dma_bu = :global_bu',
'         AND dma_doc_no = apex_application.g_x01;',
'',
'      INSERT INTO doc_mgmt_audit (dma_bu,',
'                                  dma_doc_no,',
'                                  dma_doc_rev,',
'                                  dma_req_doc_no,',
'                                  dma_activity_type,',
'                                  dma_user_name,',
'                                  dma_cre_by,',
'                                  dma_cre_date,',
'                                  dma_cre_emp_id,',
'                                  dma_vou_pfx,',
'                                  dma_vou_no,',
'                                  dma_vou_seq_no,',
'                                  dma_type_desc,',
'                                  dma_sub_vou_type,',
'                                  dma_doc_date,',
'                                  dma_doc_name,',
'                                  dma_blob,',
'                                  dma_mime_type,',
'                                  dma_file_name,',
'                                  dma_file_narr,',
'                                  dma_attach_dir,',
'                                  dma_ret_date,',
'                                  dma_ret_end_date,',
'                                  dma_due_date,',
'                                  dma_tags,',
'                                  dma_emp_id,',
'                                  dma_loc_id,',
'                                  dma_party_id,',
'                                  dma_prod_id,',
'                                  dma_prod_rev,',
'                                  dma_entity,',
'                                  dma_plnt_id,',
'                                  dma_notes,',
'                                  dma_cpc_id,',
'                                  dma_file_size)',
'           VALUES (:global_bu,',
'                   apex_application.g_x01,',
'                   v_rev,',
'                   cr1.dm_req_doc_no,',
'                   ''D'',',
'                   :global_user,',
'                   :global_user,',
'                   SYSDATE,',
'                   :global_emp_id,',
'                   cr1.dm_vou_pfx,',
'                   cr1.dm_vou_no,',
'                   cr1.dm_vou_seq_no,',
'                   cr1.dm_type_desc,',
'                   cr1.dm_sub_vou_type,',
'                   cr1.dm_cre_date,',
'                   cr1.dm_doc_name,',
'                   cr1.dm_blob,',
'                   cr1.dm_mime_type,',
'                   cr1.dm_file_name,',
'                   cr1.dm_file_narr,',
'                   cr1.dm_attach_dir,',
'                   cr1.dm_ret_date,',
'                   cr1.dm_ret_end_date,',
'                   cr1.dm_due_date,',
'                   cr1.dm_tags,',
'                   cr1.dm_emp_id,',
'                   cr1.dm_loc_id,',
'                   cr1.dm_party_id,',
'                   cr1.dm_prod_id,',
'                   cr1.dm_prod_rev,',
'                   cr1.dm_entity,',
'                   cr1.dm_vou_plnt,',
'                   cr1.dm_notes,',
'                   cr1.dm_cpc_id,',
'                   cr1.dm_file_size);',
'      COMMIT;',
'   END IF;',
'',
'   CLOSE c1;',
'   HTP.P(''success'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1442814864477161809
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6937167538256807403)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_FILE'
,p_static_id=>'get-file'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_blob      BLOB;',
'  v_mime_type VARCHAR2(100);',
'  v_file_name VARCHAR2(255) := ''document'';',
'  v_seq_no    NUMBER;',
'BEGIN',
'   ',
'   PROC_WEB_FILE_TRANSF_VIEW(:GLOBAL_BU,:P800_DOC_NO,v_seq_no);',
'   COMMIT;',
'',
'  SELECT DOC_BLOB, MIME_TYPE',
'    INTO v_blob, v_mime_type',
'    FROM temp_web_doc_attach_view',
'   WHERE seq_no = (v_seq_no);',
'',
'  owa_util.mime_header(v_mime_type, FALSE);',
'  ',
'  IF v_mime_type IN (''application/pdf'', ''image/png'', ''image/jpeg'', ''image/gif'', ''text/plain'') THEN',
'    htp.p(''Content-Disposition: inline; filename="'' || v_file_name || ''"'');',
'  ELSE',
'    htp.p(''Content-Disposition: attachment; filename="'' || v_file_name || ''"'');',
'  END IF;',
'',
'  owa_util.http_header_close;',
'  wpg_docload.download_file(v_blob);',
'EXCEPTION',
'  WHEN NO_DATA_FOUND THEN',
'    htp.p(''File not found.'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1457646554471887201
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6926061274428182004)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Processes To Cancel File'
,p_static_id=>'processes-to-cancel-file'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    UPDATE doc_mgmt ',
'       SET dm_status = ''D'',dm_upd_by = :GLOBAL_user,dm_upd_emp_id = :GLOBAL_emp_id',
'     WHERE dm_bu = :global_bu',
'       AND dm_doc_no = :P800_DOC_NO; ',
'   COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CAN'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Document Cancelled.'
,p_internal_uid=>1446540290643261802
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6923268632010724406)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Processes To View File'
,p_static_id=>'processes-to-view-file'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'   PROC_WEB_FILE_TRANSF_VIEW(:GLOBAL_BU,:P800_DOC_NO,:P800_DOC_NO_VIEW);',
'   COMMIT;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'VIEW'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>1443747648225804204
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6926061588603182008)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'VIEWFILE'
,p_static_id=>'viewfile'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   CURSOR c1',
'   IS',
'      SELECT *',
'        FROM doc_mgmt_attach_vw',
'       WHERE dm_bu = :global_bu AND dm_doc_no = apex_application.g_x01;',
'',
'   cr1   c1%ROWTYPE;',
'   v_rev NUMBER; ',
'BEGIN',
'   OPEN c1;',
'',
'   FETCH c1 INTO cr1;',
'',
'   IF c1%FOUND',
'   THEN',
'      SELECT NVL(MAX(dma_doc_rev),0) + 1',
'        INTO v_rev',
'        FROM doc_mgmt_audit',
'       WHERE dma_bu = :global_bu',
'         AND dma_doc_no = apex_application.g_x01;',
'',
'      INSERT INTO doc_mgmt_audit (dma_bu,',
'                                  dma_doc_no,',
'                                  dma_doc_rev,',
'                                  dma_req_doc_no,',
'                                  dma_activity_type,',
'                                  dma_user_name,',
'                                  dma_cre_by,',
'                                  dma_cre_date,',
'                                  dma_cre_emp_id,',
'                                  dma_vou_pfx,',
'                                  dma_vou_no,',
'                                  dma_vou_seq_no,',
'                                  dma_type_desc,',
'                                  dma_sub_vou_type,',
'                                  dma_doc_date,',
'                                  dma_doc_name,',
'                                  dma_blob,',
'                                  dma_mime_type,',
'                                  dma_file_name,',
'                                  dma_file_narr,',
'                                  dma_attach_dir,',
'                                  dma_ret_date,',
'                                  dma_ret_end_date,',
'                                  dma_due_date,',
'                                  dma_tags,',
'                                  dma_emp_id,',
'                                  dma_loc_id,',
'                                  dma_party_id,',
'                                  dma_prod_id,',
'                                  dma_prod_rev,',
'                                  dma_entity,',
'                                  dma_plnt_id,',
'                                  dma_notes,',
'                                  dma_cpc_id,',
'                                  dma_file_size)',
'           VALUES (:global_bu,',
'                   apex_application.g_x01,',
'                   v_rev,',
'                   cr1.dm_req_doc_no,',
'                   ''V'',',
'                   :global_user,',
'                   :global_user,',
'                   SYSDATE,',
'                   :global_emp_id,',
'                   cr1.dm_vou_pfx,',
'                   cr1.dm_vou_no,',
'                   cr1.dm_vou_seq_no,',
'                   cr1.dm_type_desc,',
'                   cr1.dm_sub_vou_type,',
'                   cr1.dm_cre_date,',
'                   cr1.dm_doc_name,',
'                   cr1.dm_blob,',
'                   cr1.dm_mime_type,',
'                   cr1.dm_file_name,',
'                   cr1.dm_file_narr,',
'                   cr1.dm_attach_dir,',
'                   cr1.dm_ret_date,',
'                   cr1.dm_ret_end_date,',
'                   cr1.dm_due_date,',
'                   cr1.dm_tags,',
'                   cr1.dm_emp_id,',
'                   cr1.dm_loc_id,',
'                   cr1.dm_party_id,',
'                   cr1.dm_prod_id,',
'                   cr1.dm_prod_rev,',
'                   cr1.dm_entity,',
'                   cr1.dm_vou_plnt,',
'                   cr1.dm_notes,',
'                   cr1.dm_cpc_id,',
'                   cr1.dm_file_size);',
'      COMMIT;',
'   END IF;',
'',
'   CLOSE c1;',
'   HTP.P(''success'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1446540604818261806
);
wwv_flow_imp.component_end;
end;
/
