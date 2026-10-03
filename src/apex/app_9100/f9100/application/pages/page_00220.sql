prompt --application/pages/page_00220
begin
--   Manifest
--     PAGE: 00220
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
 p_id=>220
,p_name=>'Grant Revoke Bus. Fun. Access'
,p_alias=>'GRANT-REVOKE-BUS-FUN-ACCESS1'
,p_step_title=>'Grant Revoke Bus. Fun. Access'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'ref_fav();',
'slideclose();',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#F {',
'color: #ff0000;',
'background-color: #ffffff;',
'}',
'',
'#fav',
'{',
'color: #ff0000;',
'background-color:  #ffffff',
'};',
'',
'/* #addbtn{',
'color: blue;',
'background-color:  #ffffff',
'};',
'',
'#savebtn{',
'         color: green;',
'         background-color:  #ffffff;',
'} */',
'/* #cancelbtn{',
'           color: rgb(214, 19, 29);',
'           background-color:  #ffffff;',
'} */',
'',
'/* #cancelbtn{',
'                color: rgb(214, 19, 29);',
'                background-color: #ffffff;',
'}',
'',
'#cancelbtn1{',
'            color: rgb(214, 19, 29);',
'            background-color:  #ffffff;',
'} */',
'',
'',
'',
'',
'#addbtn{',
'color: blue;',
'background-color: #ffffff;',
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
'}',
'',
'',
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
'#addbtn{',
'color: blue;',
'background-color: #ffffff;',
'}',
'',
'#savebtn{',
'                color: green;',
'                background-color: #ffffff;',
'}',
'',
' /* a {',
'    color: #337AC0;',
' } */',
'/* ',
'.a-Button--hot, .t-Button--hot:not(.t-Button--simple), body .ui-button.ui-button--hot, body .ui-state-default.ui-priority-primary {',
'    //background-color: #0b447c;',
'    color: #ffffff;',
'}',
'',
'.a-Button--hot, .t-Button--hot:not(.t-Button--simple), body .ui-button.ui-button--hot, body .ui-state-default.ui-priority-primary {',
'    //background-color: #0b447c;',
'    color: #ffffff;',
'} */'))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14639924343086578037)
,p_plug_name=>'Create Users'
,p_static_id=>'create-users'
,p_title=>'Find Bus. Fun. Access'
,p_region_name=>'find'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--controlsPosEnd:is-expanded:t-Region--scrollBody'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P220_APPLUSER_STATUS in(''A'',''D'')'
,p_plug_read_only_when2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11319183032429454384)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13588653755296118630)
,p_plug_name=>'Report'
,p_static_id=>'report'
,p_title=>'Result(s)'
,p_region_name=>'detail'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select WBFAV_BU,',
'       WBFAV_DOC_NO "Doc. No",',
'       (SELECT ROWID',
'          FROM WA_BU_FUN_ACCESS_HD',
'         WHERE WBFAHD_BU = :GLOBAL_BU',
'           AND WBFAHD_DOC_NO = WBFAV_DOC_NO) HD_ROWID,',
'       TO_DATE(WBFAV_DOC_DATE,:GLOBAL_DATE_FORMAT) "Doc. Date",',
'       WBFAV_USER_ID "User ID",',
'       DECODE(WBFAV_TYPE,''A'',''Add Bus. Fun.'',''R'',''Remove Bus. Fun.'',''E'',''Extend Duration'')"Doc. Type",',
'       WBFAV_REFERENCE,',
'       WBFAV_SEQ_NO "Line",',
'       WBFAV_BUS_FUN_ID "Bus. Fun. ID",',
'       WBFAV_BUS_FUN_NAME "Bus. Fun. Name",',
'       decode(WBFAV_BUS_FUN_TYPE ,''SET'',''Setup'',''FRM'',''Transaction'',''REP'',''Reports'',''RPT'',''Analytics'',''MOD'',''Module'')"Type2",',
'       TO_CHAR(WBFAV_DATE_FROM,:GLOBAL_DATE_FORMAT) WBFAV_DATE_FROM,',
'       TO_CHAR(WBFAV_DATE_TO,:GLOBAL_DATE_FORMAT) WBFAV_DATE_TO,',
'       WBFAV_SEL_FLAG,',
'       WBFAV_REMOV_TYPE,',
'       WBFAV_CRE_BY "Created By",',
'       TO_CHAR(WBFAV_CRE_DATE,''DD-MM-YYYY HH:MIPM'') "Created Date",',
'       WBFAHD_APPR_BY "Approved By",',
'       TO_CHAR(WBFAHD_APPR_DATE,''DD-MM-YYYY HH:MIPM'') "Approved Date",',
'       (SELECT CASE WHEN appluser_user_type = ''C'' THEN appluser_cust_id',
'                    WHEN appluser_user_type = ''S'' THEN appluser_suplr_id',
'                    WHEN appluser_user_type NOT IN (''S'',''C'') THEN appluser_emp_id ',
'                END Beneficiary_ID',
'          FROM appl_users',
'         WHERE APPLUSER_BU = :GLOBAL_BU',
'           AND APPLUSER_ID = WBFAV_USER_ID',
'           AND ROWNUM =1) Beneficiary_ID,',
'       (SELECT',
'            (Select trim(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1) emp_name',
'               from employees',
'              where emp_bu   = :GLOBAL_BU',
'                and emp_emp_id = (case when APPLUSER_USER_TYPE = ''C'' then APPLUSER_CUST_ID ',
'                                       when APPLUSER_USER_TYPE = ''S'' then APPLUSER_SUPLR_ID ',
'                                       WHEN appluser_user_type NOT IN (''S'',''C'') then APPLUSER_EMP_ID ',
'                                  end)',
'            UNION ALL',
'            SELECT suplr_name1',
'              FROM suppliers',
'             WHERE suplr_bu         = :Global_bu',
'               AND suplr_party_type = ''S''',
'               AND suplr_suplr_id   = (case when APPLUSER_USER_TYPE = ''C'' then APPLUSER_CUST_ID ',
'                                            when APPLUSER_USER_TYPE = ''S'' then APPLUSER_SUPLR_ID ',
'                                            WHEN appluser_user_type NOT IN (''S'',''C'') then APPLUSER_EMP_ID ',
'                                       end)   ',
'            UNION ALL',
'            SELECT suplr_name1',
'              FROM suppliers',
'             WHERE suplr_bu         = :Global_bu',
'               AND suplr_party_type = ''C''',
'               AND suplr_suplr_id   = (case when APPLUSER_USER_TYPE = ''C'' then APPLUSER_CUST_ID ',
'                                            when APPLUSER_USER_TYPE = ''S'' then APPLUSER_SUPLR_ID ',
'                                            WHEN appluser_user_type NOT IN (''S'',''C'') then APPLUSER_EMP_ID ',
'                                        end))',
'            emp_name',
'       FROM appl_users',
'      WHERE APPLUSER_BU = :GLOBAL_BU',
'        AND APPLUSER_ID = WBFAV_USER_ID',
'        AND ROWNUM = 1) Beneficiary_NAME,',
'       DECODE(wbfav_user_type,''R'',''Admin'',''E'',''Functional'',''O'',''Role Based User'',''U'',''ESS Portal'',''S'',''Supplier Portal'',''C'',''Customer Portal'',''P'',''POS User'',''M'',''Mobile App'',''L'',''Limited Access User'',''D'',''Module Specific'',''G'',''Management'')wbfav_user_'
||'type,',
'       DECODE(WBFAV_STATUS,''N'',''Draft'',''E'',''Entry Completed'',''P'',''Posted'') WBFAV_STATUS,',
'       CASE WBFAV_STATUS WHEN ''N'' THEN ''Blue''',
'                         WHEN ''P'' THEN ''Green''',
'                         WHEN ''E'' then ''Orange'' ',
'       END color',
'    --    wbfahd_appr_by,',
'    --    TO_CHAR(wbfahd_appr_date,''DD-MM-RRRR HH12:MI PM'') wbfahd_appr_date,',
'    --    wbfav_cre_by,',
'    --    TO_CHAR(wbfav_cre_date,''DD-MM-RRRR HH12:MI PM'') wbfav_cre_date',
'  from WAPL_BUS_FUN_ACCESS_VIEW',
'  where WBFAV_BU = :global_bu',
'    AND :P220_SHOW_DATA = ''Y''',
'    AND (INSTR(UPPER(WBFAV_USER_ID), UPPER(:P220_USER_ID)) > 0 OR :P220_USER_ID IS NULL)',
'    AND (INSTR(UPPER(WBFAV_BUS_FUN_TYPE), UPPER(:P220_TYPE)) > 0 OR :P220_TYPE IS NULL)',
'    AND (INSTR(UPPER(WBFAV_USER_TYPE), UPPER(:P220_USER_TYPE)) > 0 OR :P220_USER_TYPE IS NULL)',
'    AND (INSTR(UPPER(WBFAV_TYPE), UPPER(:P220_DOC_TYPE)) > 0 OR :P220_DOC_TYPE IS NULL)',
'    AND (INSTR(UPPER(WBFAV_DOC_NO), UPPER(:P220_DOC_NO)) > 0 OR :P220_DOC_NO IS NULL)',
'    AND ((WBFAV_STATUS = :P220_STATUS) or :P220_STATUS IS NULL)',
'    AND ((INSTR(UPPER(WBFAV_BUS_FUN_ID),UPPER(TRIM(:P220_BUS_FUN_ID))) > 0 ) OR (INSTR(UPPER((WBFAV_BUS_FUN_NAME)),UPPER(TRIM(:P220_BUS_FUN_ID))) > 0)  OR :P220_BUS_FUN_ID IS NULL)',
'    AND WBFAV_USER_ID IN (SELECT appluser_id',
'                          FROM appl_users,',
'                               employees',
'                         WHERE emp_bu = appluser_bu',
'                            AND emp_emp_id = appluser_emp_id',
'                            AND appluser_bu = :global_bu',
'                            AND appluser_status = ''A''',
'                            AND appluser_user_type NOT IN ( ''S'', ''C'' )',
'                            AND ((INSTR(UPPER(EMP_EMP_ID),UPPER(TRIM(:P220_EMP_ID))) > 0 ) ',
'                                OR (INSTR(UPPER((EMP_FIRST_NAME1)),UPPER(TRIM(:P220_EMP_ID))) > 0)  ',
'                                OR :P220_EMP_ID IS NULL)',
'                        UNION ALL',
'                        SELECT appluser_id',
'                          FROM suppliers,',
'                               appl_users',
'                         WHERE appluser_bu = suplr_bu',
'                            AND suplr_bu = :global_bu',
'                            AND suplr_party_type = ''S''',
'                            AND suplr_suplr_id = appluser_suplr_id',
'                            AND appluser_status = ''A''',
'                            AND appluser_user_type IN ( ''S'' )',
'                            AND ((INSTR(UPPER(SUPLR_SUPLR_ID),UPPER(TRIM(:P220_EMP_ID))) > 0 ) ',
'                                 OR (INSTR(UPPER((SUPLR_NAME1)),UPPER(TRIM(:P220_EMP_ID))) > 0)  ',
'                                 OR :P220_EMP_ID IS NULL)',
'                        UNION ALL',
'                        SELECT appluser_id',
'                          FROM suppliers,',
'                               appl_users',
'                         WHERE appluser_bu = suplr_bu',
'                           AND suplr_bu = :global_bu',
'                           AND suplr_party_type = ''C''',
'                           AND suplr_suplr_id = appluser_cust_id',
'                           AND appluser_status = ''A''',
'                           AND appluser_user_type IN ( ''C'' )',
'                           AND ((INSTR(UPPER(SUPLR_SUPLR_ID),UPPER(TRIM(:P220_EMP_ID))) > 0 ) ',
'                                OR (INSTR(UPPER((SUPLR_NAME1)),UPPER(TRIM(:P220_EMP_ID))) > 0) ',
'                                OR :P220_EMP_ID IS NULL)',
'                        )',
'        ORDER BY WBFAV_DOC_NO DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P220_USER_ID,P220_USER_TYPE,P220_EMP_ID,P220_BUS_FUN_ID,P220_TYPE,P220_DOC_NO,P220_DOC_TYPE,P220_STATUS,P220_SHOW_DATA'
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
 p_id=>wwv_flow_imp.id(13588653852455118631)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
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
,p_internal_uid=>13516550080126931301
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13590168538244118212)
,p_db_column_name=>'Approved By'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Approved By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13590168828544118215)
,p_db_column_name=>'Approved Date'
,p_display_order=>330
,p_column_identifier=>'AH'
,p_column_label=>'Approved Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11509847793718738045)
,p_db_column_name=>'BENEFICIARY_ID'
,p_display_order=>420
,p_column_identifier=>'AJ'
,p_column_label=>'Emp./Party ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11509847926238738046)
,p_db_column_name=>'BENEFICIARY_NAME'
,p_display_order=>430
,p_column_identifier=>'AK'
,p_column_label=>'Emp./Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13590167960017118106)
,p_db_column_name=>'Bus. Fun. ID'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Bus. Fun. Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13590168044909118107)
,p_db_column_name=>'Bus. Fun. Name'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Bus. Fun. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11559647597105665723)
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
 p_id=>wwv_flow_imp.id(13590168333775118210)
,p_db_column_name=>'Created By'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13590168726289118214)
,p_db_column_name=>'Created Date'
,p_display_order=>320
,p_column_identifier=>'AG'
,p_column_label=>'Created Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11509847705272738044)
,p_db_column_name=>'Doc. Date'
,p_display_order=>410
,p_column_identifier=>'AI'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13590167522167118102)
,p_db_column_name=>'Doc. No'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11516493929767634250)
,p_db_column_name=>'Doc. Type'
,p_display_order=>440
,p_column_identifier=>'AL'
,p_column_label=>'Doc. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10397696669703550214)
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
 p_id=>wwv_flow_imp.id(13590167749155118104)
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
 p_id=>wwv_flow_imp.id(13590168247602118209)
,p_db_column_name=>'Type2'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13590167646005118103)
,p_db_column_name=>'User ID'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13588653941686118632)
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
 p_id=>wwv_flow_imp.id(13590167332296118100)
,p_db_column_name=>'WBFAV_DATE_FROM'
,p_display_order=>380
,p_column_identifier=>'S'
,p_column_label=>'Date From'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13590167399084118101)
,p_db_column_name=>'WBFAV_DATE_TO'
,p_display_order=>390
,p_column_identifier=>'T'
,p_column_label=>'Date To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(13588654343103118636)
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
 p_id=>wwv_flow_imp.id(13590166755450118094)
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
 p_id=>wwv_flow_imp.id(13590166666687118093)
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
 p_id=>wwv_flow_imp.id(11559647540837665722)
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
 p_id=>wwv_flow_imp.id(11516494011715634251)
,p_db_column_name=>'WBFAV_USER_TYPE'
,p_display_order=>450
,p_column_identifier=>'AM'
,p_column_label=>'User Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(13590179634457125496)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'10533053'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'Doc. No:Doc. Date:Doc. Type:User ID:WBFAV_USER_TYPE:BENEFICIARY_ID:BENEFICIARY_NAME:Bus. Fun. ID:Bus. Fun. Name:WBFAV_DATE_FROM:WBFAV_DATE_TO:Type2:WBFAV_STATUS:Created By:Created Date:Approved By:Approved Date'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3823169944371440806)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(14639924343086578037)
,p_button_name=>'ADD'
,p_static_id=>'add'
,p_button_static_id=>'addbtn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapLeft:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:173:&SESSION.::&DEBUG.::P111326009501_RETURN_PAGE_NO,P111326009501_WF_NO:87,'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3823171120956440808)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(14639924343086578037)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_static_id=>'cancelbtn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:165:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3823171509072440808)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(14639924343086578037)
,p_button_name=>'FAV'
,p_static_id=>'fav'
,p_button_static_id=>'F'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favourite'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:global_fav();'
,p_button_condition_type=>'NEVER'
,p_button_css_classes=>'cancelbtn'
,p_icon_css_classes=>'.t-Icon'
,p_button_cattributes=>'onclick="global_fav();"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3823171936690440809)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(14639924343086578037)
,p_button_name=>'Favorite_button_N'
,p_static_id=>'favorite-button-n'
,p_button_static_id=>'fav'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favorite'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-heart-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3823172279694440809)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(14639924343086578037)
,p_button_name=>'Favorite_button_Y'
,p_static_id=>'favorite-button-y'
,p_button_static_id=>'cancelbtn1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favorite'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-heart'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3823170715157440808)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(14639924343086578037)
,p_button_name=>'Filter'
,p_static_id=>'filter'
,p_button_static_id=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3823170343901440808)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(14639924343086578037)
,p_button_name=>'Find'
,p_static_id=>'find'
,p_button_static_id=>'SEARCH'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generate'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3823169121609440803)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(13588653755296118630)
,p_button_name=>'Search'
,p_static_id=>'search'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10836286274630319761)
,p_name=>'P220_BUS_FUN_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(14639924343086578037)
,p_prompt=>'Bus. Fun. ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_BUS_UNF_ID(AAM0095)'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P220_USER_ID'
,p_ajax_items_to_submit=>'P220_USER_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Bus. Fun.',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344387312455372916)
,p_name=>'P220_DOC_NO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(14639924343086578037)
,p_prompt=>'Doc. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_BUS_FUN_ASSC_DOC'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Doc. No.',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344387220034372915)
,p_name=>'P220_DOC_TYPE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(14639924343086578037)
,p_prompt=>'Doc. Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Add Bus. Fun.;A,Remove Bus. Fun.;R,Extend Duration;E'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11397532216448015467)
,p_name=>'P220_EMP_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(14639924343086578037)
,p_prompt=>'Emp./Party'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_UAM1011_EMP'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Emp./Party',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11409236665891566564)
,p_name=>'P220_FAVOURITE_FLAG'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11319183032429454384)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(wubfa_user_fav,''Y'')',
'  FROM wapl_bus_fun,',
'       wapl_user_bus_fun_accs',
' WHERE wubfa_user_id    = :GLOBAL_USER',
'   AND wubfa_bus_fun_id = wbf_bus_fun_id',
'   AND wbf_page_no      = :app_page_id',
'   AND wbf_appl_no      = :app_id',
'   AND wbf_visible      = ''Y'''))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11319261680536454785)
,p_name=>'P220_NEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11319183032429454384)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10139089239890634826)
,p_name=>'P220_REFIND'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(14639924343086578037)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10397696660263550244)
,p_name=>'P220_REPORT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11319183032429454384)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10139089125141634825)
,p_name=>'P220_SEARCH_TYPE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(14639924343086578037)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10408406587232898912)
,p_name=>'P220_SHOW_DATA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(14639924343086578037)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10344387362758372917)
,p_name=>'P220_STATUS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(14639924343086578037)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;N,Entry Completed;E,Posted;P'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11397533500730015480)
,p_name=>'P220_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(14639924343086578037)
,p_prompt=>'Bus.Fun.Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Module;MOD,Setup;SET,Transaction;FRM,Reports;REP,Analytics;RPT'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10828852630233976310)
,p_name=>'P220_USER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(14639924343086578037)
,p_prompt=>'User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT WBFAV_USER_ID User_id',
'  FROM appl_users,',
'       wapl_bus_fun_access_view,',
'       wapl_bus_fun',
' WHERE appluser_bu = :GLOBAL_bu',
'   AND appluser_id = WBFAV_USER_ID',
'   AND appluser_status = ''A''',
'   AND wbf_bus_fun_id  = wbfav_bus_fun_id ',
'   AND wbf_visible     = ''Y''',
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the User',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11397533662712015481)
,p_name=>'P220_USER_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(14639924343086578037)
,p_prompt=>'User Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Admin;R,Functional;E,Module Specific;D,Management;G,Mobile App;M,ESS Portal;U,Supplier Portal;S,Customer Portal;C,Subcontract Portal;T'
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3823196546381440903)
,p_name=>'Assign_user'
,p_static_id=>'assign-user'
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P220_USER_NAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823196996748440903)
,p_event_id=>wwv_flow_imp.id(3823196546381440903)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P220_USER_NAME,P220_APPLUSER_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P220_USER_NAME IS NOT NULL THEN',
    '',
    '   IF :P220_USER_NAME = :P220_APPLUSER_ID THEN',
    '	    raise_application_error(-20999,''From and To Username should not be same.'');',
    '   END IF;',
    '	 ',
    '	 DECLARE',
    '	 	  ',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT *',
    '	 	    FROM appl_users',
    '	 	   WHERE appluser_bu = :GLOBAL_bu',
    '	 	     AND appluser_id = :P220_USER_NAME;',
    '	 	     ',
    '	 	     cr1       c1%ROWTYPE;',
    '	 	     	 	  ',
    '	 BEGIN',
    '	 	  ',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	     ',
    '	 	     IF c1%NOTFOUND THEN',
    '                  raise_application_error(-20999,''User not found.'');',
    '	 	     ELSE',
    '	 	     	  ',
    '	 	     	  IF cr1.appluser_status IN (''N'', ''D'') THEN',
    '	 	     	  	 raise_application_error(-20999,''User not in active status.'');',
    '	 	     	  END IF;',
    '	 	     	  ',
    '	 	     	  IF TRUNC(SYSDATE) NOT BETWEEN TRUNC(cr1.appluser_eff_from) AND TRUNC(cr1.appluser_eff_to) THEN',
    '	 	     	  	 raise_application_error(-20999,''Check To User Eff. From and Eff. To.'');',
    '	 	     	  END IF;',
    '	 	     	  ',
    '	 	     END IF;',
    '	 	     ',
    '	 	  CLOSE c1;',
    '	 	  ',
    '	 END;',
    '	 ',
    'END IF;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3823183474070440892)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>230
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(3823170715157440808)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823184572038440892)
,p_event_id=>wwv_flow_imp.id(3823183474070440892)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P220_USER_ID,P220_USER_TYPE,P220_EMP_ID,P220_BUS_FUN_ID,P220_TYPE,P220_DOC_NO,P220_DOC_TYPE,P220_STATUS,P220_SHOW_DATA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823184039784440892)
,p_event_id=>wwv_flow_imp.id(3823183474070440892)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.message.clearErrors();')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823185069167440894)
,p_event_id=>wwv_flow_imp.id(3823183474070440892)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(13588653755296118630)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_build_option_id=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3823190665160440898)
,p_name=>'Clear1'
,p_static_id=>'clear-2'
,p_event_sequence=>270
,p_condition_element=>'P220_SHOW_DATA'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823191163260440898)
,p_event_id=>wwv_flow_imp.id(3823190665160440898)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P220_USER_ID,P220_USER_TYPE,P220_EMP_ID,P220_BUS_FUN_ID,P220_TYPE,P220_DOC_NO,P220_DOC_TYPE,P220_STATUS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823191595692440898)
,p_event_id=>wwv_flow_imp.id(3823190665160440898)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("detail").hide();',
    'apex.item("find").show();')))).to_clob
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_server_condition_expr1=>'P220_SHOW_DATA'
,p_server_condition_expr2=>'Y'
,p_build_option_id=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3823195632922440903)
,p_name=>'EMP_NAME'
,p_static_id=>'emp-name'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823196105525440903)
,p_event_id=>wwv_flow_imp.id(3823195632922440903)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT EMP_FIRST_NAME1 INTO :P220_EMP_NAME FROM EMPLOYEES',
    'WHERE EMP_BU = :GLOBAL_BU',
    'AND EMP_EMP_ID = :P220_APPLUSER_PARTY_ID;',
    '',
    'EXCEPTION WHEN no_data_found then',
    'NULL;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3823187837034440895)
,p_name=>'Favorite_N'
,p_static_id=>'favorite-n'
,p_event_sequence=>250
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(3823171936690440809)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823188291970440897)
,p_event_id=>wwv_flow_imp.id(3823187837034440895)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P220_FAVOURITE_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    proc_upd_favour_web(:global_bu, ''N'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '    SELECT wubfa_user_fav',
    '      INTO :P220_FAVOURITE_FLAG',
    '      FROM wapl_user_bus_fun_accs',
    '     WHERE wubfa_bus_fun_id = (SELECT wbf_bus_fun_id',
    '                                 FROM wapl_bus_fun',
    '                                WHERE wbf_appl_no = :app_id',
    '                                  AND wbf_page_no = :app_page_id',
    '                                  AND wbf_visible = ''Y'')',
    '       AND wubfa_user_id = :Global_user ;',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823188855937440897)
,p_event_id=>wwv_flow_imp.id(3823187837034440895)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P220_FAVOURITE_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3823189238107440897)
,p_name=>'Favorite_Y'
,p_static_id=>'favorite-y'
,p_event_sequence=>260
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(3823172279694440809)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823189685243440898)
,p_event_id=>wwv_flow_imp.id(3823189238107440897)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P220_FAVOURITE_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    proc_upd_favour_web(:global_bu, ''Y'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '',
    '    SELECT wubfa_user_fav',
    '      INTO :P220_FAVOURITE_FLAG',
    '      FROM wapl_user_bus_fun_accs',
    '     WHERE wubfa_bus_fun_id = (SELECT wbf_bus_fun_id',
    '                                 FROM wapl_bus_fun',
    '                                WHERE wbf_appl_no = :app_id',
    '                                  AND wbf_page_no = :app_page_id',
    '                                  AND wbf_visible = ''Y'')',
    '       AND wubfa_user_id = :Global_user ;',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823190253649440898)
,p_event_id=>wwv_flow_imp.id(3823189238107440897)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P220_FAVOURITE_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3823178348862440889)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P220_APPLUSER_PW_EXP_RQRD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823178851477440889)
,p_event_id=>wwv_flow_imp.id(3823178348862440889)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P220_APPLUSER_PW_EXP_DAYS,P220_APPLUSER_PW_EXP_DAYS_1',
  'items_to_submit', 'P220_APPLUSER_PW_EXP_RQRD',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :P220_APPLUSER_PW_EXP_RQRD =''N'' then',
    '    :P220_APPLUSER_PW_EXP_DAYS :=0;',
    '    :P220_APPLUSER_PW_EXP_DAYS_1 :=0;',
    'end if;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3823176885575440878)
,p_name=>'P220_APPLUSER_PW_EXP_RQRD'
,p_static_id=>'p220-appluser-pw-exp-rqrd'
,p_event_sequence=>190
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P220_APPLUSER_PW_EXP_RQRD'
,p_condition_element=>'P220_APPLUSER_PW_EXP_RQRD'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823177395173440887)
,p_event_id=>wwv_flow_imp.id(3823176885575440878)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P220_APPLUSER_PW_EXP_DAYS_1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823177952672440889)
,p_event_id=>wwv_flow_imp.id(3823176885575440878)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P220_APPLUSER_PW_EXP_DAYS_1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3823185440247440894)
,p_name=>'P69_FAVOURITE_FLAG'
,p_static_id=>'p69-favourite-flag'
,p_event_sequence=>240
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P220_FAVOURITE_FLAG'
,p_condition_element=>'P220_FAVOURITE_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823186380807440895)
,p_event_id=>wwv_flow_imp.id(3823185440247440894)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(3823172279694440809)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823186924037440895)
,p_event_id=>wwv_flow_imp.id(3823185440247440894)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide-2'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(3823171936690440809)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823185957825440894)
,p_event_id=>wwv_flow_imp.id(3823185440247440894)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(3823172279694440809)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823187412707440895)
,p_event_id=>wwv_flow_imp.id(3823185440247440894)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show-2'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(3823171936690440809)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3823194754756440901)
,p_name=>'PASSWORD'
,p_static_id=>'password'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P220_PASSWORD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823195183705440901)
,p_event_id=>wwv_flow_imp.id(3823194754756440901)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P220_APPLUSER_PASSWORD',
  'items_to_submit', 'P220_APPLUSER_ID,P220_PASSWORD',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    ':P220_APPLUSER_PASSWORD := func_get_hash(:P220_APPLUSER_ID,:P220_PASSWORD);',
    'END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3823193791254440901)
,p_name=>'Password_Expiry_Dtls'
,p_static_id=>'password-expiry-dtls'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823194326024440901)
,p_event_id=>wwv_flow_imp.id(3823193791254440901)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item( "P220_APPLUSER_PW_EXP_RQRD").hide();',
    'apex.item( "P220_APPLUSER_PW_EXP_DAYS" ).hide();',
    'apex.item( "P220_APPLUSER_PWD_EXP_DUE" ).hide();',
    'apex.item( "P220_APPLUSER_PW_LUD" ).hide();',
    '$x_Hide("hide");')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3823192952618440900)
,p_name=>'POS/DEPT/CUS/SUP'
,p_static_id=>'pos-dept-cus-sup'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P220_APPLUSER_PARTY_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823193434712440901)
,p_event_id=>wwv_flow_imp.id(3823192952618440900)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P220_APPLUSER_POS_ID,P220_APPLUSER_DEPT_ID,P220_APPLUSER_EMP_ID,P220_APPLUSER_SUPLR_ID,P220_APPLUSER_CUST_ID,P220_EMP_NAME,P220_DEPARTMENT_NAME,P220_POSITION,P220_APPLUSER_EMAIL_ID,P220_APPLUSER_MOBILE_NO',
  'items_to_submit', 'P220_APPLUSER_ID,P220_APPLUSER_USER_TYPE,P220_APPLUSER_PARTY_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P220_APPLUSER_PARTY_ID IS NOT NULL AND :P220_APPLUSER_USER_TYPE IN (''E'',''R'',''U'',''P'') THEN',
    '	 DECLARE  ',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT emp_emp_id, emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 emp_name,empai_dept_id,(SELECT dept_name1 FROM departments WHERE dept_bu = emp_bu AND dept_id = empai_dept_id)dept_name,empai_pos_id,(SELECT hrpos_pos_name1 FROM hr_p'
||'ositions WHERE hrpos_bu = emp_bu AND hrpos_pos_id = empai_pos_id)pos_name,emp_start_date, emp_email_id,emp_mobile_no',
    '	 	    FROM employees,emp_active_infos WHERE emp_bu  = empai_bu AND emp_emp_id = empai_emp_id AND emp_bu     = :GLOBAL_bu AND emp_emp_id = :P220_APPLUSER_PARTY_ID AND emp_status = ''A'';',
    '	 	     cr1													c1%ROWTYPE;',
    '	 	  CURSOR c4',
    '	 	      IS',
    '	 	  SELECT *',
    '	 	    FROM appl_users WHERE appluser_bu = :GLOBAL_bu AND appluser_id <> :P220_APPLUSER_USER_TYPE AND appluser_emp_id = :P220_APPLUSER_PARTY_ID AND appluser_status NOT IN (''D'');	     ',
    '	 	     cr4 c4%ROWTYPE; 	  ',
    '	 BEGIN',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	    IF c1%NOTFOUND THEN',
    '	 	     RAISE_APPLICATION_ERROR(-20999,''Employee not found.'');',
    '	 	     ELSE',
    '              ',
    ':P220_APPLUSER_EMP_ID := cr1.emp_emp_id;:P220_APPLUSER_POS_ID :=cr1.empai_pos_id;:P220_EMP_NAME:=cr1.emp_name;:P220_APPLUSER_DEPT_ID :=cr1.empai_dept_id; :P220_POSITION:=cr1.pos_name;:P220_APPLUSER_MOBILE_NO :=cr1.emp_mobile_no;:P220_DEPARTMENT_NAME '
||':=cr1.dept_name;:P220_APPLUSER_EMAIL_ID :=cr1.emp_email_id;',
    '	 	     END IF; CLOSE c1; END;',
    'END IF;',
    'IF :P220_APPLUSER_PARTY_ID IS NOT NULL AND :P220_APPLUSER_USER_TYPE IN (''C'') THEN',
    '	 DECLARE',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT suplr_suplr_id,suplr_name1',
    '	 	    FROM suppliers',
    '	 	   WHERE suplr_bu      = :GLOBAL_bu',
    '	 	     AND suplr_suplr_id = :P220_APPLUSER_PARTY_ID',
    '             AND SUPLR_CUST_FLAG = ''Y''',
    '	 	     AND suplr_status  = ''A'';',
    '	 	     cr1	c1%ROWTYPE;',
    '	 	  CURSOR c2',
    '	 	      IS',
    '	 	  SELECT * FROM appl_users WHERE appluser_bu = :GLOBAL_bu AND appluser_id <> :P220_APPLUSER_ID AND appluser_cust_id = :P220_APPLUSER_PARTY_ID; ',
    '	 	     cr2	c2%ROWTYPE;',
    '	 BEGIN',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	     IF c1%NOTFOUND THEN',
    '	 	     	  RAISE_APPLICATION_ERROR(-20999,''Customer not found.'');',
    '	 	     ELSE',
    '	 	     	  OPEN c2;',
    '	 	     	  FETCH c2 INTO cr2;',
    '	 	     	     IF c2%FOUND THEN',
    '	 	     	     	  RAISE_APPLICATION_ERROR(-20999,''Customer already linked with another user. Username : ''||cr2.appluser_id);',
    'END IF; CLOSE c2;',
    ':P220_EMP_NAME             := cr1.suplr_name1;',
    ':P220_APPLUSER_CUST_ID		:= cr1.suplr_suplr_id;',
    '	 	     END IF; CLOSE c1; END;',
    'END IF;',
    'IF :P220_APPLUSER_PARTY_ID IS NOT NULL AND :P220_APPLUSER_USER_TYPE IN (''S'') THEN ',
    '	 DECLARE',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT suplr_suplr_id,suplr_name1',
    '	 	    FROM suppliers',
    '	 	   WHERE suplr_bu      = :GLOBAL_bu',
    '	 	     AND suplr_suplr_id = :P220_APPLUSER_PARTY_ID',
    '             AND SUPLR_SUPLR_FLAG = ''Y''',
    '	 	     AND suplr_status  = ''A'';',
    '	 	     cr1													c1%ROWTYPE;',
    '	 	  CURSOR c2',
    '	 	      IS',
    '	 	  SELECT *',
    '	 	    FROM appl_users',
    '	 	   WHERE appluser_bu = :GLOBAL_bu',
    '	 	     AND appluser_id <> :P220_APPLUSER_ID',
    '	 	     AND appluser_suplr_id = :P220_APPLUSER_PARTY_ID;     ',
    '	 	     cr2													c2%ROWTYPE;',
    '	 BEGIN',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	     IF c1%NOTFOUND THEN',
    '	 	     	  RAISE_APPLICATION_ERROR(-20999,''Supplier not found.'');',
    'ELSE',
    '	OPEN c2;',
    '	FETCH c2 INTO cr2;     	     ',
    '	IF c2%FOUND THEN',
    '		RAISE_APPLICATION_ERROR(-20999,''Supplier already linked with another user. Username : ''||cr2.appluser_id);',
    'END IF; CLOSE c2;',
    ':P220_EMP_NAME :=cr1.suplr_name1;',
    ':P220_APPLUSER_SUPLR_ID		:= cr1.suplr_suplr_id;  ',
    '	 	     END IF;  CLOSE c1;	    END;  END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3823197440630440903)
,p_name=>'pw_exp_days'
,p_static_id=>'pw-exp-days'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P220_APPLUSER_PW_EXP_DAYS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823197880561440903)
,p_event_id=>wwv_flow_imp.id(3823197440630440903)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P220_APPLUSER_PWD_EXP_DUE',
  'items_to_submit', 'P220_APPLUSER_PW_EXP_DAYS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P220_APPLUSER_PW_EXP_DAYS > 0 THEN',
    '   :P220_APPLUSER_PWD_EXP_DUE := (TRUNC(SYSDATE) + :P220_APPLUSER_PWD_EXP_DUE) - 1;',
    'ELSE',
    '	 :P220_APPLUSER_PWD_EXP_DUE:= NULL;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3823181097080440890)
,p_name=>'Refind'
,p_static_id=>'refind'
,p_event_sequence=>220
,p_condition_element=>'P220_REFIND'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823182080350440892)
,p_event_id=>wwv_flow_imp.id(3823181097080440890)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P220_USER_ID,P220_USER_TYPE,P220_EMP_ID,P220_BUS_FUN_ID,P220_TYPE,P220_DOC_NO,P220_DOC_TYPE,P220_STATUS,P220_SHOW_DATA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823183087624440892)
,p_event_id=>wwv_flow_imp.id(3823181097080440890)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// apex.item("find").hide();',
    'apex.item("detail").show();')))).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P220_SHOW_DATA'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823182649737440892)
,p_event_id=>wwv_flow_imp.id(3823181097080440890)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(13588653755296118630)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_server_condition_type=>'NEVER'
,p_build_option_id=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823181580953440890)
,p_event_id=>wwv_flow_imp.id(3823181097080440890)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P220_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3823179258611440889)
,p_name=>'Report Refresh'
,p_static_id=>'report-refresh'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(3823170343901440808)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823180759100440890)
,p_event_id=>wwv_flow_imp.id(3823179258611440889)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// apex.item("find").hide();',
    'apex.item("detail").show();')))).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P220_SHOW_DATA'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823180202624440890)
,p_event_id=>wwv_flow_imp.id(3823179258611440889)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(13588653755296118630)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823179728027440890)
,p_event_id=>wwv_flow_imp.id(3823179258611440889)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P220_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3823191972525440898)
,p_name=>'Search'
,p_static_id=>'search'
,p_event_sequence=>280
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(3823169121609440803)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3823192489140440898)
,p_event_id=>wwv_flow_imp.id(3823191972525440898)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("detail").hide();',
    'apex.item("find").show();')))).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3823176560684440876)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT case APPLUSER_STATUS when ''A'' then ''<span style="color:green">Active</span>''',
'                            when ''D'' then ''<span style="color:red">Inactive</span>'' ',
'                            when ''N'' then ''<span style="color:Blue">New</span>'' end as "APPLUSER_STATUS "',
'        into :P220_APPLUSER_STATUS_1',
'        FROM APPL_USERS',
'            WHERE APPLUSER_BU=:GLOBAL_BU',
'            AND ROWID=:P220_ROWID;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>3751072788356253546
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(3823176221434440873)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pre_insert'
,p_static_id=>'pre-insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P220_APPLUSER_PARTY_ID is not null then',
'',
'        SELECT (SELECT hrpos_pos_name1 FROM hr_positions WHERE hrpos_bu = APPLUSER_BU AND hrpos_pos_id = APPLUSER_POS_ID)pos_name,',
'               (SELECT dept_name1 FROM departments WHERE dept_bu = APPLUSER_BU AND dept_id = APPLUSER_DEPT_ID)dept_name,',
'               APPLUSER_PASSWORD, APPLUSER_PW_EXP_DAYS,',
'               (select  emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 from employees',
'                    where emp_emp_id=APPLUSER_PARTY_ID',
'                        and emp_bu=:global_bu)Emp_Name',
'            into :P220_DEPARTMENT_NAME , :P220_POSITION, :P220_PASSWORD ,:P220_APPLUSER_PW_EXP_DAYS_1,:P220_EMP_NAME',
'        FROM APPL_USERS',
'            WHERE APPLUSER_BU=:GLOBAL_BU',
'            AND APPLUSER_EMP_ID = :P220_APPLUSER_PARTY_ID;',
'end if;',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>3751072449106253543
);
wwv_flow_imp.component_end;
end;
/
