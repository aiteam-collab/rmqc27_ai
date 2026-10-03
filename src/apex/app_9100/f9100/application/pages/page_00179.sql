prompt --application/pages/page_00179
begin
--   Manifest
--     PAGE: 00179
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
 p_id=>179
,p_name=>'Grant/Revoke Notification Access'
,p_alias=>'GRANT-REVOKE-NOTIFICATION-ACCESS'
,p_step_title=>'Grant/Revoke Notification Access'
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
'#SEARCH{',
'                color: green;',
'                background-color: #ffffff;',
'',
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
 p_id=>wwv_flow_imp.id(11969699317477743894)
,p_plug_name=>'Create Users'
,p_static_id=>'create-users'
,p_title=>'Find Notification Access'
,p_region_name=>'find'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--controlsPosEnd:is-expanded:t-Region--scrollBody:t-Form--slimPadding'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P179_APPLUSER_STATUS in(''A'',''D'')'
,p_plug_read_only_when2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8648958006820620241)
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
 p_id=>wwv_flow_imp.id(10918428729687284487)
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
'SELECT ROWID,',
'       wunahd_bu,',
'	   wunahd_doc_no,',
'	   TO_CHAR(wunahd_doc_date,''DD-MM-RRRR'')wunahd_doc_date,',
'	   wunahd_user_id,',
'	   wunahd_eff_from,',
'	   wunahd_eff_to,',
'	   wunahd_status,',
'       DECODE(wunahd_status,''N'',''Draft'',''E'',''Entry Completed'',''P'',''Posted'',''L'',''Cancel'')status,',
'       DECODE(wunahd_status,''N'',''Blue'',''E'',''Orange'',''P'',''Green'',''L'',''Red'')color,',
'	   wunahd_reference,',
'	   wunahd_appr_by,',
'       TO_CHAR(wunahd_appr_date,''DD-MM-RRRR'')wunahd_appr_date,',
'	   wunahd_type,',
'       DECODE(wunahd_type,''A'',''Add Bus. Fun.'',''R'',''Remove Bus. Fun.'',''E'',''Extend Duration'')doc_type,',
'       appluser_user_type,',
'       DECODE(appluser_user_type,''R'',''Admin'',''E'',''Functional'',''O'',''Role Based User'',''U'',''ESS Portal'',''S'',''Supplier Portal'',''C'',''Customer Portal'',''P'',''POS User'',''M'',''Mobile App'',''Module Specific'',''D'',''G'',''Management'',''T'',''Subcontract Portal'') AS user_'
||'type,',
'       wbf_node_type,',
'       DECODE(wbf_node_type,''FRM'',''Transaction'',''REP'',''Report'',''RPT'',''Analytics'',''MOD'',''Module'',''SET'',''Setup'')node_type,',
'       beneficiary_id,',
'       beneficiary_name',
'FROM (',
'SELECT ROWID,',
'       wunahd_bu,',
'	   wunahd_doc_no,',
'	   wunahd_doc_date,',
'	   wunahd_user_id,',
'	   wunahd_eff_from,',
'	   wunahd_eff_to,',
'	   wunahd_status,',
'	   wunahd_reference,',
'	   wunahd_appr_by,',
'	   wunahd_appr_date,',
'	   wunahd_type,',
'       (SELECT DISTINCT appluser_user_type',
'		  FROM appl_users',
'		 WHERE appluser_bu = wunahd_bu',
'		   AND appluser_id = wunahd_user_id',
'		   AND appluser_status = ''A'') AS appluser_user_type,',
'       (SELECT wbf_node_type ',
'          FROM wapl_bus_fun',
'         WHERE wbf_bus_fun_id = wunahd_user_id',
'           AND wbf_visible = ''Y'' ) wbf_node_type,',
'       (SELECT CASE WHEN appluser_user_type = ''C'' THEN appluser_cust_id',
'                    WHEN appluser_user_type = ''S'' THEN appluser_suplr_id',
'                    WHEN appluser_user_type NOT IN (''S'',''C'') THEN appluser_emp_id ',
'                END beneficiary_id',
'          FROM appl_users',
'         WHERE appluser_bu = :GLOBAL_bu',
'           AND appluser_id = wunahd_user_id',
'           AND ROWNUM = 1 ) beneficiary_id,',
'       (SELECT',
'            (SELECT TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1) emp_name',
'               FROM employees',
'              WHERE emp_bu   = :GLOBAL_bu',
'                AND emp_emp_id = (CASE WHEN appluser_user_type = ''C'' THEN appluser_cust_id ',
'                                       WHEN appluser_user_type = ''S'' THEN appluser_suplr_id ',
'                                       WHEN appluser_user_type NOT IN (''S'',''C'') THEN appluser_emp_id ',
'                                  END)',
'            UNION ALL',
'            SELECT suplr_name1',
'              FROM suppliers',
'             WHERE suplr_bu         = :GLOBAL_bu',
'               AND suplr_party_type = ''S''',
'               AND suplr_suplr_id   = (CASE WHEN appluser_user_type = ''C'' THEN appluser_cust_id ',
'                                            WHEN appluser_user_type = ''S'' THEN appluser_suplr_id ',
'                                            WHEN appluser_user_type NOT IN (''S'',''C'') THEN appluser_emp_id ',
'                                       END)   ',
'            UNION ALL',
'            SELECT suplr_name1',
'              FROM suppliers',
'             WHERE suplr_bu         = :GLOBAL_bu',
'               AND suplr_party_type = ''C''',
'               AND suplr_suplr_id   = (CASE WHEN appluser_user_type = ''C'' THEN appluser_cust_id ',
'                                            WHEN appluser_user_type = ''S'' THEN appluser_suplr_id ',
'                                            WHEN appluser_user_type NOT IN (''S'',''C'') THEN appluser_emp_id ',
'                                        END))',
'            emp_name',
'       FROM appl_users',
'      WHERE appluser_bu = :GLOBAL_bu',
'        AND appluser_id = wunahd_user_id',
'        AND ROWNUM = 1) beneficiary_name',
'      FROM wa_user_notif_access_hd',
' WHERE wunahd_bu = :GLOBAL_bu',
' )',
' WHERE :P179_SHOW_DATA = ''Y''',
'   AND (INSTR(UPPER(wunahd_user_id), UPPER(:P179_USER_ID)) > 0 OR :P179_USER_ID IS NULL)',
'   AND (INSTR(UPPER(wunahd_type), UPPER(:P179_DOC_TYPE)) > 0 OR :P179_DOC_TYPE IS NULL)	',
'   AND ((INSTR(UPPER(beneficiary_id),UPPER(TRIM(:P179_EMP_ID))) > 0 ) ',
'       OR (INSTR(UPPER((beneficiary_name)),UPPER(TRIM(:P179_EMP_ID))) > 0) OR :P179_EMP_ID IS NULL)',
'   AND (appluser_user_type = :P179_USER_TYPE OR :P179_USER_TYPE IS NULL)',
'   AND (INSTR(UPPER(wunahd_doc_no), UPPER(:P179_DOC_NO)) > 0 OR :P179_DOC_NO IS NULL)',
'   AND ((wunahd_status = :P179_STATUS) or :P179_STATUS IS NULL)',
' ORDER BY wunahd_doc_no DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P179_USER_ID,P179_USER_TYPE,P179_EMP_ID,P179_DOC_NO,P179_DOC_TYPE,P179_STATUS,P179_SHOW_DATA'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(10918428826846284488)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>5438907843061364286
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6579600253761185815)
,p_db_column_name=>'APPLUSER_USER_TYPE'
,p_display_order=>560
,p_column_identifier=>'BC'
,p_column_label=>'User Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8839622768109903902)
,p_db_column_name=>'BENEFICIARY_ID'
,p_display_order=>420
,p_column_identifier=>'AJ'
,p_column_label=>'Emp./Party ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8839622900629903903)
,p_db_column_name=>'BENEFICIARY_NAME'
,p_display_order=>430
,p_column_identifier=>'AK'
,p_column_label=>'Emp./Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6579600590701185819)
,p_db_column_name=>'COLOR'
,p_display_order=>600
,p_column_identifier=>'BG'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6579600876490185821)
,p_db_column_name=>'DOC_TYPE'
,p_display_order=>620
,p_column_identifier=>'BI'
,p_column_label=>'Doc. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6579601016194185823)
,p_db_column_name=>'NODE_TYPE'
,p_display_order=>640
,p_column_identifier=>'BK'
,p_column_label=>'Node Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6579599040539185803)
,p_db_column_name=>'ROWID'
,p_display_order=>440
,p_column_identifier=>'AQ'
,p_column_label=>'Rowid'
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
 p_id=>wwv_flow_imp.id(6579600530294185818)
,p_db_column_name=>'STATUS'
,p_display_order=>590
,p_column_identifier=>'BF'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6579600951790185822)
,p_db_column_name=>'USER_TYPE'
,p_display_order=>630
,p_column_identifier=>'BJ'
,p_column_label=>'User Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6579600335675185816)
,p_db_column_name=>'WBF_NODE_TYPE'
,p_display_order=>570
,p_column_identifier=>'BD'
,p_column_label=>'Node Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6579599968674185812)
,p_db_column_name=>'WUNAHD_APPR_BY'
,p_display_order=>530
,p_column_identifier=>'AZ'
,p_column_label=>'Approved By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6579600774103185820)
,p_db_column_name=>'WUNAHD_APPR_DATE'
,p_display_order=>610
,p_column_identifier=>'BH'
,p_column_label=>'Approved Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6579599097922185804)
,p_db_column_name=>'WUNAHD_BU'
,p_display_order=>450
,p_column_identifier=>'AR'
,p_column_label=>'Wunahd Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6579600440879185817)
,p_db_column_name=>'WUNAHD_DOC_DATE'
,p_display_order=>580
,p_column_identifier=>'BE'
,p_column_label=>'Not. Doc. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6579599195109185805)
,p_db_column_name=>'WUNAHD_DOC_NO'
,p_display_order=>460
,p_column_identifier=>'AS'
,p_column_label=>'Not. Doc. No.'
,p_column_link=>'f?p=&APP_ID.:181:&SESSION.::&DEBUG.::P181_ROWID:#ROWID#'
,p_column_linktext=>'#WUNAHD_DOC_NO#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6579599535059185808)
,p_db_column_name=>'WUNAHD_EFF_FROM'
,p_display_order=>490
,p_column_identifier=>'AV'
,p_column_label=>'Eff. From'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6579599646507185809)
,p_db_column_name=>'WUNAHD_EFF_TO'
,p_display_order=>500
,p_column_identifier=>'AW'
,p_column_label=>'Eff. To'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6579599841987185811)
,p_db_column_name=>'WUNAHD_REFERENCE'
,p_display_order=>520
,p_column_identifier=>'AY'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6579599746153185810)
,p_db_column_name=>'WUNAHD_STATUS'
,p_display_order=>510
,p_column_identifier=>'AX'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6579600154323185814)
,p_db_column_name=>'WUNAHD_TYPE'
,p_display_order=>550
,p_column_identifier=>'BB'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6579599409488185807)
,p_db_column_name=>'WUNAHD_USER_ID'
,p_display_order=>480
,p_column_identifier=>'AU'
,p_column_label=>'User ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(10919954608848291353)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'10533053'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WUNAHD_DOC_NO:WUNAHD_DOC_DATE:WUNAHD_USER_ID:USER_TYPE:BENEFICIARY_ID:BENEFICIARY_NAME:DOC_TYPE:WUNAHD_EFF_FROM:WUNAHD_EFF_TO:STATUS:WUNAHD_REFERENCE:WUNAHD_APPR_BY:WUNAHD_APPR_DATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6560362163990339478)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11969699317477743894)
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
,p_button_redirect_url=>'f?p=&APP_ID.:184:&SESSION.::&DEBUG.::P184_RETURN_PAGE_NO,P184_WF_NO:181,'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6560363337362339480)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(11969699317477743894)
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
 p_id=>wwv_flow_imp.id(6560362944295339480)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11969699317477743894)
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
 p_id=>wwv_flow_imp.id(6560362535427339480)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11969699317477743894)
,p_button_name=>'Find'
,p_static_id=>'find'
,p_button_static_id=>'SEARCH'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7674162365110538715)
,p_name=>'P179_DOC_NO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11969699317477743894)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Not. Doc. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_NOTI_DOCNO'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
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
  'title', 'Select the Not. Doc. No.',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7674162272689538714)
,p_name=>'P179_DOC_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11969699317477743894)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Doc. Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Add Bus. Fun.;A,Remove Bus. Fun.;R'
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
 p_id=>wwv_flow_imp.id(8727307269103181266)
,p_name=>'P179_EMP_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11969699317477743894)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Emp./Party'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_NOTI_EMP'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
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
  'title', 'Select the Emp./Party',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8739011578181732405)
,p_name=>'P179_FAVOURITE_FLAG'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8648958006820620241)
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
 p_id=>wwv_flow_imp.id(8649036592826620626)
,p_name=>'P179_NEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8648958006820620241)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7468864292545800625)
,p_name=>'P179_REFIND'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(11969699317477743894)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7727471572553716085)
,p_name=>'P179_REPORT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8648958006820620241)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7468864177796800624)
,p_name=>'P179_SEARCH_TYPE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(11969699317477743894)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7738181639888064711)
,p_name=>'P179_SHOW_DATA'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(11969699317477743894)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7674162415413538716)
,p_name=>'P179_STATUS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(11969699317477743894)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;N,Posted;P'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8158627682889142109)
,p_name=>'P179_USER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11969699317477743894)
,p_use_cache_before_default=>'NO'
,p_prompt=>'User ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT wunahd_user_id AS USER_ID,',
'       wunahd_user_id',
'  FROM appl_users,',
'       wa_user_notif_access_hd',
' WHERE appluser_bu = wunahd_bu',
'   AND appluser_id = wunahd_user_id',
'   AND wunahd_bu   = :GLOBAL_bu',
'   AND appluser_status = ''A''',
' ORDER BY 1'))
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
 p_id=>wwv_flow_imp.id(8727308715367181280)
,p_name=>'P179_USER_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11969699317477743894)
,p_use_cache_before_default=>'NO'
,p_prompt=>'User Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT DECODE(appluser_user_type,''R'',''Admin'',''E'',''Functional'',''D'',''Module Specific'',''G'',''Management'',''M'',''Mobile App'',''U'',''ESS Portal'',''S'',''Supplier Portal'',''C'',''Customer Portal'',''P'',''POS User'',''T'',''Subcontract Portal'') AS user_type,',
'       appluser_user_type',
'  FROM appl_users,',
'       wa_user_notif_access_hd',
' WHERE appluser_bu = wunahd_bu',
'   AND appluser_id = wunahd_user_id',
'   AND wunahd_bu   = :GLOBAL_bu',
'   AND appluser_status = ''A''',
' ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6560378824279339505)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>230
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6560362944295339480)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6560379325732339506)
,p_event_id=>wwv_flow_imp.id(6560378824279339505)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P179_USER_ID,P179_USER_TYPE,P179_EMP_ID,P179_DOC_NO,P179_DOC_TYPE,P179_STATUS,P179_SHOW_DATA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6560380330223339506)
,p_event_id=>wwv_flow_imp.id(6560378824279339505)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.message.clearErrors();')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6560379842699339506)
,p_event_id=>wwv_flow_imp.id(6560378824279339505)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10918428729687284487)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_build_option_id=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6560380774219339506)
,p_name=>'P69_FAVOURITE_FLAG'
,p_static_id=>'p69-favourite-flag'
,p_event_sequence=>240
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P179_FAVOURITE_FLAG'
,p_condition_element=>'P179_FAVOURITE_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6560388201894339511)
,p_name=>'Refind'
,p_static_id=>'refind'
,p_event_sequence=>220
,p_condition_element=>'P179_REFIND'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6560390232567339511)
,p_event_id=>wwv_flow_imp.id(6560388201894339511)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P179_USER_ID,P179_USER_TYPE,P179_EMP_ID,P179_DOC_NO,P179_DOC_TYPE,P179_STATUS,P179_SHOW_DATA'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6560389698124339511)
,p_event_id=>wwv_flow_imp.id(6560388201894339511)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// apex.item("find").hide();',
    'apex.item("detail").show();')))).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P179_SHOW_DATA'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6560389207388339511)
,p_event_id=>wwv_flow_imp.id(6560388201894339511)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10918428729687284487)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_server_condition_type=>'NEVER'
,p_build_option_id=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6560388740937339511)
,p_event_id=>wwv_flow_imp.id(6560388201894339511)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P179_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6560376923404339505)
,p_name=>'Report Refresh'
,p_static_id=>'report-refresh'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6560362535427339480)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6560378481870339505)
,p_event_id=>wwv_flow_imp.id(6560376923404339505)
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
,p_client_condition_element=>'P179_SHOW_DATA'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6560377902277339505)
,p_event_id=>wwv_flow_imp.id(6560376923404339505)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10918428729687284487)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6560377463827339505)
,p_event_id=>wwv_flow_imp.id(6560376923404339505)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P179_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6560368870613339497)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT case APPLUSER_STATUS when ''A'' then ''<span style="color:green">Active</span>''',
'                            when ''D'' then ''<span style="color:red">Inactive</span>'' ',
'                            when ''N'' then ''<span style="color:Blue">New</span>'' end as "APPLUSER_STATUS "',
'        into :P179_APPLUSER_STATUS_1',
'        FROM APPL_USERS',
'            WHERE APPLUSER_BU=:GLOBAL_BU',
'            AND ROWID=:P179_ROWID;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>1080847886828419295
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6560368389970339497)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pre_insert'
,p_static_id=>'pre-insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P179_APPLUSER_PARTY_ID is not null then',
'',
'        SELECT (SELECT hrpos_pos_name1 FROM hr_positions WHERE hrpos_bu = APPLUSER_BU AND hrpos_pos_id = APPLUSER_POS_ID)pos_name,',
'               (SELECT dept_name1 FROM departments WHERE dept_bu = APPLUSER_BU AND dept_id = APPLUSER_DEPT_ID)dept_name,',
'               APPLUSER_PASSWORD, APPLUSER_PW_EXP_DAYS,',
'               (select  emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 from employees',
'                    where emp_emp_id=APPLUSER_PARTY_ID',
'                        and emp_bu=:global_bu)Emp_Name',
'            into :P179_DEPARTMENT_NAME , :P179_POSITION, :P179_PASSWORD ,:P179_APPLUSER_PW_EXP_DAYS_1,:P179_EMP_NAME',
'        FROM APPL_USERS',
'            WHERE APPLUSER_BU=:GLOBAL_BU',
'            AND APPLUSER_EMP_ID = :P179_APPLUSER_PARTY_ID;',
'end if;',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1080847406185419295
);
wwv_flow_imp.component_end;
end;
/
