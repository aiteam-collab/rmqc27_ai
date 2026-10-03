prompt --application/pages/page_211132015
begin
--   Manifest
--     PAGE: 211132015
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
 p_id=>211132015
,p_name=>'Unit Access Details'
,p_alias=>'UNIT-ACCESS-DETAILS1'
,p_step_title=>'Unit Access Details'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-headerLink, .a-IRR-headerLink:hover {',
'',
'    background: #00b1e7 !important;',
'}',
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
' }'))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7711400735265570512)
,p_plug_name=>'Find Parameteres'
,p_static_id=>'find-parameteres'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8706434322167103844)
,p_plug_name=>'User Unit'
,p_static_id=>'user-unit'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wupav_bu,',
'       wupav_doc_no,',
'       TO_CHAR(wupav_doc_date,func_find_date_format(:GLOBAL_BU))wupav_doc_date,',
'       wupav_seq_no,',
'       wupav_user_id,',
'       doc_type,',
'       wupav_user_type,',
'       wupav_reference,',
'       wupav_plnt_loc_id,',
'       wupav_plnt_loc_name,',
'       wupav_plnt_id,',
'       wupav_plnt_name,',
'       TO_CHAR(wupav_date_from,func_find_date_format(:GLOBAL_BU))date_from,',
'       TO_CHAR(wupav_date_to,func_find_date_format(:GLOBAL_BU))date_to,',
'       Active_flag,',
'       wupav_cre_by,',
'       cre_date,',
'       wupav_appr_by,',
'       appr_date,',
'       emp_name,',
'       emp_id,',
'       position_name,',
'       Department_name,',
'       wupav_status,',
'       color',
'   FROM(',
'SELECT rowid,',
'       wupav_bu,',
'       wupav_doc_no,',
'       wupav_doc_date,',
'       wupav_seq_no,',
'       wupav_user_id,',
'       DECODE(wupav_type,''R'',''Remove unit Access'',''A'',''Add unit Access'') as doc_type,',
'       wupav_reference,',
'       wupav_plnt_loc_id,',
'       wupav_plnt_loc_name,',
'       wupav_plnt_id,',
'       wupav_plnt_name,',
'       wupav_date_from,',
'       wupav_date_to,',
'       DECODE(wupav_user_type,''R'',''ERP Admin'',''E'',''ERP User'',''U'',''ESS User'',''S'',''Supplier'',''C'',''Customer'',''P'',''POS User'',''O'',''Concurrent User'')wupav_user_type,',
'       CASE WHEN  wupav_sel_flag = ''Y'' THEN ''<span aria-hidden="true" class="fa fa-check-square-o" style = "color:green;"></span>'' ',
'            WHEN  wupav_sel_flag <>''Y'' THEN ''<span aria-hidden="true" class="fa fa-stop" style = "color:red"></span>''',
'            END Active_flag,',
'       wupav_cre_by,',
'       TO_CHAR(wupav_cre_date,''DD-MM-YYYY HH:MIPM'')as cre_date,',
'       wupav_appr_by,',
'       TO_CHAR(wupav_appr_date,''DD-MM-YYYY HH:MIPM'')as appr_date,',
'      (SELECT emp_id ',
'           FROM (SELECT ',
'                    CASE WHEN appluser_user_type NOT IN(''S'',''C'') THEN (SELECT DISTINCT  appluser_emp_id as emp_id',
'                                                                          FROM employees',
'                                                                         WHERE emp_emp_id = appluser_emp_id',
'                                                                           AND emp_bu = appluser_bu)',
'                         WHEN appluser_user_type = ''S'' THEN  (SELECT DISTINCT suplr_suplr_id ',
'                                                                 FROM suppliers',
'                                                                WHERE suplr_bu = appluser_bu     ',
'                                                                  AND appluser_user_type = suplr_party_type  ',
'                                                                  AND (appluser_suplr_id = suplr_suplr_id OR appluser_cust_id = suplr_suplr_id))',
'                         WHEN appluser_user_type = ''C'' THEN  (SELECT DISTINCT suplr_suplr_id ',
'                                                                 FROM suppliers',
'                                                                WHERE suplr_bu = appluser_bu      ',
'                                                                  AND appluser_user_type = suplr_party_type  ',
'                                                                  AND (appluser_suplr_id = suplr_suplr_id OR appluser_cust_id = suplr_suplr_id))  ',
'                    END emp_id',
'                     FROM appl_users',
'                    WHERE appluser_bu = wupav_bu',
'                      AND appluser_id = wupav_user_id',
'                      AND appluser_user_type=wupav_user_type',
'                      AND appluser_status = ''A''',
'                    AND appluser_user_type <> ''O''))Emp_id,',
'        (SELECT emp_name ',
'            FROM (SELECT ',
'                     CASE WHEN appluser_user_type NOT IN(''S'',''C'') THEN (SELECT DISTINCT  TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1)emp_name',
'                                                                           FROM employees',
'                                                                          WHERE emp_emp_id = appluser_emp_id',
'                                                                            AND emp_bu = appluser_bu)',
'                          WHEN appluser_user_type = ''S'' THEN  (SELECT DISTINCT suplr_name1 ',
'                                                                  FROM suppliers',
'                                                                 WHERE suplr_bu = appluser_bu     ',
'                                                                   AND appluser_user_type = suplr_party_type  ',
'                                                                   AND (appluser_suplr_id = suplr_suplr_id OR appluser_cust_id = suplr_suplr_id))',
'                         WHEN appluser_user_type = ''C'' THEN   (SELECT DISTINCT suplr_name1 ',
'                                                                  FROM suppliers',
'                                                                 WHERE suplr_bu = appluser_bu      ',
'                                                                   AND appluser_user_type = suplr_party_type  ',
'                                                                   AND (appluser_suplr_id = suplr_suplr_id OR appluser_cust_id = suplr_suplr_id))',
'                      END emp_name',
'                   FROM appl_users',
'                  WHERE appluser_bu = wupav_bu',
'                    AND appluser_id = wupav_user_id',
'                    AND appluser_user_type=wupav_user_type',
'                    AND appluser_status = ''A''',
'                    AND appluser_user_type <> ''O''))emp_name,',
'                    (SELECT position_name FROM(',
'            (SELECT empai_pos_id,',
'                 (SELECT hrpos_pos_name1',
'                    FROM hr_positions',
'                   WHERE hrpos_bu     = empai_bu',
'                     AND hrpos_pos_id = empai_pos_id)position_name',
'                        FROM ',
'                             emp_active_infos,',
'                             appl_users',
'                       WHERE empai_bu     = appluser_bu',
'                         AND empai_emp_id = appluser_emp_id',
'                         AND appluser_bu  = wupav_bu',
'                         AND appluser_id  = wupav_user_id)))position_name,',
'                (SELECT Department_name FROM(',
'                (SELECT empai_dept_id,',
'                     (     SELECT dept_name1',
'                        FROM departments',
'                       WHERE dept_bu = empai_bu',
'                         AND dept_id = empai_dept_id)Department_name',
'                            FROM ',
'                                 emp_active_infos,',
'                                 appl_users',
'                           WHERE empai_bu     = appluser_bu',
'                             AND empai_emp_id = appluser_emp_id',
'                             AND appluser_bu  = wupav_bu',
'                             AND appluser_id  = wupav_user_id)))Department_name,',
'       DECODE(wupav_status,''N'',''New'',''E'',''Entry Completed'',''P'',''Posted'',''C'',''Cancelled'')wupav_status,',
'       CASE wupav_status WHEN ''N'' THEN ''Blue''',
'                         WHEN ''P'' then ''Green''',
'                         WHEN ''C'' then ''Red''',
'                         WHEN ''E'' then ''Orange''',
'       END color',
'   FROM wapl_user_plnt_access_view',
'  WHERE wupav_bu = :GLOBAL_bu',
'    AND (wupav_user_id = :P211132015_USER OR :P211132015_USER IS NULL)',
'    AND (wupav_doc_no = :P211132015_DOC_NO OR :P211132015_DOC_NO IS NULL)',
'    AND (wupav_user_type = :P211132015_USER_TYPE OR :P211132015_USER_TYPE IS NULL)',
'    AND (wupav_type = :P211132015_DOC_TYPE OR :P211132015_DOC_TYPE IS NULL)',
'    AND (wupav_status = :P211132015_STATUS OR :P211132015_STATUS IS NULL)',
'    AND ((INSTR(UPPER(wupav_plnt_loc_id),UPPER(:P211132015_LOCATION)) > 0  OR :P211132015_LOCATION IS NULL)',
'     OR (INSTR(UPPER((wupav_plnt_loc_name)),UPPER(TRIM(:P211132015_LOCATION))) > 0))',
'    AND ((INSTR(UPPER(wupav_plnt_id),UPPER(:P211132015_UNIT)) > 0  OR :P211132015_UNIT IS NULL)',
'     OR (INSTR(UPPER((wupav_plnt_name)),UPPER(TRIM(:P211132015_UNIT))) > 0)))',
'  WHERE   ((INSTR(UPPER(emp_id),UPPER(TRIM(:P211132015_BENIFICIARY))) > 0 )',
'     OR (INSTR(UPPER((emp_name)),UPPER(TRIM(:P211132015_BENIFICIARY))) > 0)',
'     OR :P211132015_BENIFICIARY IS NULL)',
'  ORDER BY wupav_doc_no DESC',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P211132015_USER,P211132015_BENIFICIARY,P211132015_DOC_NO,P211132015_DOC_DATE,P211132015_LOCATION,P211132015_UNIT,P211132015_DOC_TYPE,P211132015_USER_TYPE'
,p_prn_page_header=>'User Unit'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(8706434420932103844)
,p_no_data_found_message=>'No Data Found'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>3224472585388492816
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8513654065129092017)
,p_db_column_name=>'ACTIVE_FLAG'
,p_display_order=>190
,p_column_identifier=>'Z'
,p_column_label=>'Active '
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8513653887784092015)
,p_db_column_name=>'APPR_DATE'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Appr. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6546536855662147757)
,p_db_column_name=>'COLOR'
,p_display_order=>260
,p_column_identifier=>'AJ'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8513653723091092014)
,p_db_column_name=>'CRE_DATE'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Cre. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8513653412008092011)
,p_db_column_name=>'DATE_FROM'
,p_display_order=>210
,p_column_identifier=>'T'
,p_column_label=>'Date From'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8513653528308092012)
,p_db_column_name=>'DATE_TO'
,p_display_order=>220
,p_column_identifier=>'U'
,p_column_label=>'Date To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7711402270443570527)
,p_db_column_name=>'DEPARTMENT_NAME'
,p_display_order=>70
,p_column_identifier=>'AG'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7711402027851570524)
,p_db_column_name=>'DOC_TYPE'
,p_display_order=>140
,p_column_identifier=>'AD'
,p_column_label=>'Doc. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7711401831738570523)
,p_db_column_name=>'EMP_ID'
,p_display_order=>40
,p_column_identifier=>'AC'
,p_column_label=>'Emp./Party ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7711401730705570522)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>50
,p_column_identifier=>'AB'
,p_column_label=>'Emp./Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7711402210387570526)
,p_db_column_name=>'POSITION_NAME'
,p_display_order=>60
,p_column_identifier=>'AF'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8706440777529104200)
,p_db_column_name=>'WUPAV_APPR_BY'
,p_display_order=>170
,p_column_identifier=>'P'
,p_column_label=>' Appr. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8706434714898104186)
,p_db_column_name=>'WUPAV_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Wupav Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8706439929808104198)
,p_db_column_name=>'WUPAV_CRE_BY'
,p_display_order=>160
,p_column_identifier=>'N'
,p_column_label=>'Cre. By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7711402363389570528)
,p_db_column_name=>'WUPAV_DOC_DATE'
,p_display_order=>130
,p_column_identifier=>'AH'
,p_column_label=>'Doc. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8706435136458104191)
,p_db_column_name=>'WUPAV_DOC_NO'
,p_display_order=>120
,p_column_identifier=>'B'
,p_column_label=>'Source Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8706437907545104195)
,p_db_column_name=>'WUPAV_PLNT_ID'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8706437186625104195)
,p_db_column_name=>'WUPAV_PLNT_LOC_ID'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8706437585437104195)
,p_db_column_name=>'WUPAV_PLNT_LOC_NAME'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Location Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8706438321978104197)
,p_db_column_name=>'WUPAV_PLNT_NAME'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>'Unit Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8706436723611104194)
,p_db_column_name=>'WUPAV_REFERENCE'
,p_display_order=>180
,p_column_identifier=>'F'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8706435558713104192)
,p_db_column_name=>'WUPAV_SEQ_NO'
,p_display_order=>150
,p_column_identifier=>'C'
,p_column_label=>' Seq. No.'
,p_column_type=>'NUMBER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6546536768162147756)
,p_db_column_name=>'WUPAV_STATUS'
,p_display_order=>250
,p_column_identifier=>'AI'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#WUPAV_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8706435973504104192)
,p_db_column_name=>'WUPAV_USER_ID'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7711402081433570525)
,p_db_column_name=>'WUPAV_USER_TYPE'
,p_display_order=>30
,p_column_identifier=>'AE'
,p_column_label=>'User Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(8706446502380107812)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'10523865'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WUPAV_USER_ID:WUPAV_USER_TYPE:EMP_ID:EMP_NAME:POSITION_NAME:DEPARTMENT_NAME:WUPAV_PLNT_LOC_ID:WUPAV_PLNT_LOC_NAME:WUPAV_PLNT_ID:WUPAV_PLNT_NAME:WUPAV_DOC_NO:WUPAV_DOC_DATE:WUPAV_STATUS:DOC_TYPE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6599762673481761135)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8706434322167103844)
,p_button_name=>'Reset'
,p_static_id=>'reset'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:211132015:&SESSION.::&DEBUG.:RP,::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6599762284702761132)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8706434322167103844)
,p_button_name=>'Search'
,p_static_id=>'search'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:211132016:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7711410139130570653)
,p_name=>'P211132015_BENIFICIARY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7711400735265570512)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7711410399630570655)
,p_name=>'P211132015_DOC_DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7711400735265570512)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7711410262867570654)
,p_name=>'P211132015_DOC_NO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7711400735265570512)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7711410695768570658)
,p_name=>'P211132015_DOC_TYPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7711400735265570512)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7711410505701570656)
,p_name=>'P211132015_LOCATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7711400735265570512)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6643120267747047136)
,p_name=>'P211132015_STATUS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7711400735265570512)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7711410620971570657)
,p_name=>'P211132015_UNIT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7711400735265570512)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7711410036476570652)
,p_name=>'P211132015_USER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7711400735265570512)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7711410784111570659)
,p_name=>'P211132015_USER_TYPE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7711400735265570512)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
