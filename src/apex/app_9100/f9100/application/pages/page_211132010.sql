prompt --application/pages/page_211132010
begin
--   Manifest
--     PAGE: 211132010
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
 p_id=>211132010
,p_name=>'Bus. Fun. Access Details'
,p_alias=>'USER-BUS-FUN-REGISTER'
,p_step_title=>'Bus. Fun. Access Details'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-headerLink, .a-IRR-headerLink:hover {',
'',
'    background: #00b1e7 !important;',
'}',
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
' a {',
'    color: #337AC0;',
'}'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8672125825712500037)
,p_plug_name=>'Report'
,p_static_id=>'report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select WBFAV_BU,',
'       WBFAV_DOC_NO "Doc. No",',
'       (SELECT ROWID',
'          FROM WA_BU_FUN_ACCESS_HD',
'         WHERE WBFAHD_BU = WBFAV_BU',
'           AND WBFAHD_DOC_NO = WBFAV_DOC_NO) HD_ROWID,',
'       WBFAV_DOC_DATE "Doc. Date",',
'       WBFAV_USER_ID "User ID",',
'       DECODE(WBFAV_TYPE,''A'',''Add Bus. Fun.'',''R'',''Remove Bus. Fun.'')"Doc. Type",',
'       WBFAV_REFERENCE,',
'       WBFAV_SEQ_NO "Line",',
'       WBFAV_BUS_FUN_ID "Bus. Fun. ID",',
'       WBFAV_BUS_FUN_NAME "Bus. Fun. Name",',
'       decode(WBFAV_BUS_FUN_TYPE ,''SET'',''Setup'',''FRM'',''Transaction'',''REP'',''Reports'',''RPT'',''Analytics'',''MOD'',''Module'')"Type2",',
'       TO_CHAR(WBFAV_DATE_FROM,''DD-MM-YYYY'')WBFAV_DATE_FROM,',
'       TO_CHAR(WBFAV_DATE_TO,''DD-MM-YYYY'')WBFAV_DATE_TO,',
'       WBFAV_SEL_FLAG,',
'       WBFAV_REMOV_TYPE,',
'       WBFAV_CRE_BY "Created By",',
'       TO_CHAR(WBFAV_CRE_DATE,''DD-MM-YYYY HH:MIPM'') "Created Date",',
'       WBFAHD_APPR_BY "Approved By",',
'       TO_CHAR(WBFAHD_APPR_DATE,''DD-MM-YYYY HH:MIPM'') "Approved Date",',
'       (SELECT',
'        CASE',
'            WHEN appluser_user_type = ''C'' THEN',
'                appluser_cust_id',
'            WHEN appluser_user_type = ''S'' THEN',
'                appluser_suplr_id',
'            WHEN appluser_user_type NOT IN (''S'',''C'',''O'') THEN',
'                appluser_emp_id ',
'        END Beneficiary_ID',
'        FROM',
'            appl_users',
'        WHERE APPLUSER_BU = :GLOBAL_BU',
'        AND APPLUSER_ID = WBFAV_USER_ID',
'        AND APPLUSER_USER_TYPE <> ''O'') Beneficiary_ID,',
'        (SELECT',
'        (Select  trim(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1) emp_name',
'          from employees',
'        where  emp_bu   = :GLOBAL_BU',
'            and emp_emp_id = (case when APPLUSER_USER_TYPE = ''C'' then APPLUSER_CUST_ID when APPLUSER_USER_TYPE = ''S'' then APPLUSER_SUPLR_ID WHEN appluser_user_type NOT IN (''S'',''C'',''O'') then APPLUSER_EMP_ID end)',
'        UNION ALL',
'        SELECT  suplr_name1',
'          FROM suppliers',
'         WHERE  suplr_bu         = :Global_bu',
'           AND suplr_party_type = ''S''',
'           AND suplr_suplr_id   = (case when APPLUSER_USER_TYPE = ''C'' then APPLUSER_CUST_ID when APPLUSER_USER_TYPE = ''S'' then APPLUSER_SUPLR_ID WHEN appluser_user_type NOT IN (''S'',''C'',''O'') then APPLUSER_EMP_ID end)   ',
'        UNION ALL',
'        SELECT  suplr_name1',
'          FROM suppliers',
'         WHERE  suplr_bu         = :Global_bu',
'           AND suplr_party_type = ''C''',
'           AND suplr_suplr_id   = (case when APPLUSER_USER_TYPE = ''C'' then APPLUSER_CUST_ID when APPLUSER_USER_TYPE = ''S'' then APPLUSER_SUPLR_ID WHEN appluser_user_type NOT IN (''S'',''C'',''O'') then APPLUSER_EMP_ID end))',
'         emp_name',
'         FROM',
'            appl_users',
'        WHERE APPLUSER_BU = :GLOBAL_BU',
'        AND APPLUSER_ID = WBFAV_USER_ID',
'        AND APPLUSER_USER_TYPE <> ''O'') Beneficiary_NAME,',
'       DECODE(wbfav_user_type,''R'',''ERP Admin'',''E'',''ERP User'',''U'',''ESS User'',''S'',''Supplier'',''C'',''Customer'',''P'',''POS User'',''O'',''Concurrent User'')wbfav_user_type,',
'       DECODE(WBFAV_STATUS,''N'',''New'',''E'',''Entry Completed'',''P'',''Posted'') WBFAV_STATUS,',
'       CASE WBFAV_STATUS WHEN ''N'' THEN ''Blue''',
'                         WHEN ''P'' THEN ''Green''',
'                         WHEN ''E'' then ''Orange'' ',
'       END color',
'  from WAPL_BUS_FUN_ACCESS_VIEW',
'  where WBFAV_BU = :global_bu',
'  AND (INSTR(UPPER(WBFAV_USER_ID), UPPER(:P211132010_FIND_USER)) > 0 OR :P211132010_FIND_USER IS NULL)',
'  AND (INSTR(UPPER(WBFAV_BUS_FUN_TYPE), UPPER(:P211132010_FIND_TYPE)) > 0 OR :P211132010_FIND_TYPE IS NULL)',
'  AND (INSTR(UPPER(WBFAV_USER_TYPE), UPPER(:P211132010_FIND_USER_TYPE)) > 0 OR :P211132010_FIND_USER_TYPE IS NULL)',
'  AND (INSTR(UPPER(WBFAV_TYPE), UPPER(:P211132010_FIND_DOC_TYPE)) > 0 OR :P211132010_FIND_DOC_TYPE IS NULL)',
'  AND (INSTR(UPPER(WBFAV_DOC_NO), UPPER(:P211132010_FIND_DOC)) > 0 OR :P211132010_FIND_DOC IS NULL)',
'  AND ((WBFAV_STATUS = :P211132010_FIND_STATUS) or :P211132010_FIND_STATUS IS NULL)',
'',
'/*',
'  AND ((wbfav_user_id IN (SELECT appluser_id',
' 			                FROM appl_users,',
' 			                     employees     ',
'                         WHERE appluser_bu     = emp_bu',
'                           AND appluser_emp_id = emp_emp_id',
'                           AND appluser_bu     = :Global_bu',
'                           AND appluser_status = ''A''',
'                           AND appluser_user_type NOT IN (''S'',''C'')',
'                           AND appluser_user_type <> ''O''',
'                           AND appluser_id     = WBFAV_user_id',
'                           AND (INSTR(UPPER(emp_emp_id),UPPER(:P211132010_FIND_BENEFICIARY)) > 0)))',
'   OR (wbfav_user_id IN (SELECT appluser_id',
'   			              FROM appl_users,',
'   			                   employees',
'                         WHERE appluser_bu     = emp_bu',
'                           AND appluser_emp_id = emp_emp_id',
'                           AND appluser_bu     = :Global_bu',
'                           AND appluser_status = ''A''',
'                           AND appluser_user_type NOT IN (''S'',''C'')',
'                           AND appluser_user_type <> ''O''',
'                           AND appluser_id     = wbfav_user_id',
'                           AND (INSTR(UPPER(TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1)),UPPER(:P211132010_FIND_BENEFICIARY)) > 0)))			                              ',
'   OR (wbfav_user_id IN (SELECT appluser_id',
'	 		               FROM appl_users,',
'	 		                    suppliers',
'	                      WHERE appluser_bu       = suplr_bu',
'	                        AND ( appluser_suplr_id = suplr_suplr_id OR appluser_cust_id = suplr_suplr_id)',
'	                        AND suplr_party_type IN (''S'',''C'')',
'                            AND appluser_user_type IN (''S'',''C'')',
'                            AND appluser_bu       = :Global_bu',
'                            AND appluser_status   = ''A''',
'                            AND appluser_user_type <> ''O''',
'	                        AND appluser_id       = WBFAV_user_id',
'	                        AND (INSTR(UPPER(suplr_suplr_id),UPPER(:P211132010_FIND_BENEFICIARY)) > 0))))',
'*/',
'',
'  AND ((INSTR(UPPER(WBFAV_BUS_FUN_ID),UPPER(TRIM(:P211132010_FIND_BUS_FUNID))) > 0 ) OR (INSTR(UPPER((WBFAV_BUS_FUN_NAME)),UPPER(TRIM(:P211132010_FIND_BUS_FUNID))) > 0)  OR :P211132010_FIND_BUS_FUNID IS NULL)',
'  AND WBFAV_USER_ID IN (SELECT',
'       appluser_id',
'FROM',
'    appl_users,',
'    employees',
'WHERE',
'        emp_bu = appluser_bu',
'    AND emp_emp_id = appluser_emp_id',
'    AND appluser_bu = :global_bu',
'    AND appluser_status = ''A''',
'    AND appluser_user_type NOT IN ( ''O'', ''S'', ''C'' )',
'    AND ((INSTR(UPPER(EMP_EMP_ID),UPPER(TRIM(:P211132010_FIND_BENEFICIARY))) > 0 ) OR (INSTR(UPPER((EMP_FIRST_NAME1)),UPPER(TRIM(:P211132010_FIND_BENEFICIARY))) > 0)  OR :P211132010_FIND_BENEFICIARY IS NULL)',
'UNION ALL',
'SELECT',
'    appluser_id',
'FROM',
'    suppliers,',
'    appl_users',
'WHERE',
'        appluser_bu = suplr_bu',
'    AND suplr_bu = :global_bu',
'    AND suplr_party_type = ''S''',
'    AND suplr_suplr_id = appluser_suplr_id',
'    AND appluser_status = ''A''',
'    AND appluser_user_type IN ( ''S'' )',
'    AND ((INSTR(UPPER(SUPLR_SUPLR_ID),UPPER(TRIM(:P211132010_FIND_BENEFICIARY))) > 0 ) OR (INSTR(UPPER((SUPLR_NAME1)),UPPER(TRIM(:P211132010_FIND_BENEFICIARY))) > 0)  OR :P211132010_FIND_BENEFICIARY IS NULL)',
'UNION ALL',
'SELECT',
'    appluser_id',
'FROM',
'    suppliers,',
'    appl_users',
'WHERE',
'        appluser_bu = suplr_bu',
'    AND suplr_bu = :global_bu',
'    AND suplr_party_type = ''C''',
'    AND suplr_suplr_id = appluser_cust_id',
'    AND appluser_status = ''A''',
'    AND appluser_user_type IN ( ''C'' )',
'    AND ((INSTR(UPPER(SUPLR_SUPLR_ID),UPPER(TRIM(:P211132010_FIND_BENEFICIARY))) > 0 ) OR (INSTR(UPPER((SUPLR_NAME1)),UPPER(TRIM(:P211132010_FIND_BENEFICIARY))) > 0)  OR :P211132010_FIND_BENEFICIARY IS NULL))',
'ORDER BY WBFAV_DOC_NO DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Report'
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
 p_id=>wwv_flow_imp.id(8672125922871500038)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_pivot=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>3190164087327889010
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8673640608660499619)
,p_db_column_name=>'Approved By'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Approved By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8673640898960499622)
,p_db_column_name=>'Approved Date'
,p_display_order=>330
,p_column_identifier=>'AH'
,p_column_label=>'Approved Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6593319864135119452)
,p_db_column_name=>'BENEFICIARY_ID'
,p_display_order=>420
,p_column_identifier=>'AJ'
,p_column_label=>'Emp./Party ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6593319996655119453)
,p_db_column_name=>'BENEFICIARY_NAME'
,p_display_order=>430
,p_column_identifier=>'AK'
,p_column_label=>'Emp./Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8673640030433499513)
,p_db_column_name=>'Bus. Fun. ID'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Bus. Fun. Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8673640115325499514)
,p_db_column_name=>'Bus. Fun. Name'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Bus. Fun. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6643119667522047130)
,p_db_column_name=>'COLOR'
,p_display_order=>470
,p_column_identifier=>'AO'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8673640404191499617)
,p_db_column_name=>'Created By'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8673640796705499621)
,p_db_column_name=>'Created Date'
,p_display_order=>320
,p_column_identifier=>'AG'
,p_column_label=>'Created Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6593319775689119451)
,p_db_column_name=>'Doc. Date'
,p_display_order=>410
,p_column_identifier=>'AI'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8673639592583499509)
,p_db_column_name=>'Doc. No'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Source Doc. No.'
,p_column_link=>'f?p=&APP_ID.:111326009501:&SESSION.::&DEBUG.::P111326009501_ROWID:#HD_ROWID#'
,p_column_linktext=>'#Doc. No#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6599966000184015657)
,p_db_column_name=>'Doc. Type'
,p_display_order=>440
,p_column_identifier=>'AL'
,p_column_label=>'Doc. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6650201021987888429)
,p_db_column_name=>'HD_ROWID'
,p_display_order=>480
,p_column_identifier=>'AP'
,p_column_label=>'Hd Rowid'
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
 p_id=>wwv_flow_imp.id(8673639819571499511)
,p_db_column_name=>'Line'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8673640318018499616)
,p_db_column_name=>'Type2'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8673639716421499510)
,p_db_column_name=>'User ID'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8672126012102500039)
,p_db_column_name=>'WBFAV_BU'
,p_display_order=>340
,p_column_identifier=>'A'
,p_column_label=>'Wbfav Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8673639402712499507)
,p_db_column_name=>'WBFAV_DATE_FROM'
,p_display_order=>380
,p_column_identifier=>'S'
,p_column_label=>'Date From'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8673639469500499508)
,p_db_column_name=>'WBFAV_DATE_TO'
,p_display_order=>390
,p_column_identifier=>'T'
,p_column_label=>'Date To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8672126413519500043)
,p_db_column_name=>'WBFAV_REFERENCE'
,p_display_order=>350
,p_column_identifier=>'E'
,p_column_label=>'Wbfav Reference'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8673638825866499501)
,p_db_column_name=>'WBFAV_REMOV_TYPE'
,p_display_order=>370
,p_column_identifier=>'M'
,p_column_label=>'Wbfav Remov Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8673638737103499500)
,p_db_column_name=>'WBFAV_SEL_FLAG'
,p_display_order=>360
,p_column_identifier=>'L'
,p_column_label=>'Wbfav Sel Flag'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6643119611254047129)
,p_db_column_name=>'WBFAV_STATUS'
,p_display_order=>460
,p_column_identifier=>'AN'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#WBFAV_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6599966082132015658)
,p_db_column_name=>'WBFAV_USER_TYPE'
,p_display_order=>450
,p_column_identifier=>'AM'
,p_column_label=>'User Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8673651704873506903)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'10533053'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'Doc. No:User ID:WBFAV_USER_TYPE:BENEFICIARY_ID:BENEFICIARY_NAME:Bus. Fun. ID:Bus. Fun. Name:Type2:Doc. Type:Doc. Date:WBFAV_STATUS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6643120046892047134)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(8672125825712500037)
,p_button_name=>'ADD'
,p_static_id=>'add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:111326009501:&SESSION.::&DEBUG.::P111326009501_RETURN_PAGE_NO:211132010'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6593319706252119450)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(8672125825712500037)
,p_button_name=>'CLEAR'
,p_static_id=>'clear'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Clear'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:211132010:&SESSION.::&DEBUG.:RR,211132010::'
,p_icon_css_classes=>'fa-redo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6593319358146119447)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8672125825712500037)
,p_button_name=>'SEARCH'
,p_static_id=>'search'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Search'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:87:&SESSION.::&DEBUG.:CR,87::'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6593318615801119439)
,p_name=>'P211132010_FIND_BENEFICIARY'
,p_item_sequence=>30
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6593318676966119440)
,p_name=>'P211132010_FIND_BUS_FUNID'
,p_item_sequence=>40
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6593318986485119443)
,p_name=>'P211132010_FIND_DOC'
,p_item_sequence=>70
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6593319150391119445)
,p_name=>'P211132010_FIND_DOC_TYPE'
,p_item_sequence=>90
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6593319108273119444)
,p_name=>'P211132010_FIND_STATUS'
,p_item_sequence=>80
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6593318834386119441)
,p_name=>'P211132010_FIND_TYPE'
,p_item_sequence=>50
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6593319328132119446)
,p_name=>'P211132010_FIND_USER'
,p_item_sequence=>100
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6593318885066119442)
,p_name=>'P211132010_FIND_USER_TYPE'
,p_item_sequence=>60
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
