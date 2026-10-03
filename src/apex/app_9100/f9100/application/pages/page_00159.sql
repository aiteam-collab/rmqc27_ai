prompt --application/pages/page_00159
begin
--   Manifest
--     PAGE: 00159
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
 p_id=>159
,p_name=>'Role Access'
,p_alias=>'ROLE-ACCESS1'
,p_step_title=>'Role Access'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'ref_fav();',
'slideclose();'))
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
 p_id=>wwv_flow_imp.id(11555304399987604906)
,p_plug_name=>'<b>Role Access Details</b>'
,p_static_id=>'b-role-access-details-b'
,p_title=>'Find Role Access'
,p_region_name=>'find'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--controlsPosEnd:is-expanded:t-Region--scrollBody:t-Form--noPadding'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12248041857330159741)
,p_plug_name=>'Create User '
,p_static_id=>'create-user'
,p_parent_plug_id=>wwv_flow_imp.id(11555304399987604906)
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'APPL_USERS'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P159_APPLUSER_STATUS in(''A'',''D'')'
,p_plug_read_only_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8927300546673036088)
,p_plug_name=>'Favorite button'
,p_static_id=>'favorite-button'
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
 p_id=>wwv_flow_imp.id(10054337455886778151)
,p_plug_name=>'User Role Access'
,p_static_id=>'user-role-access'
,p_title=>'Result(s)'
,p_region_name=>'detail'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid_hd,',
'                        wurah_bu,',
'                        wurah_doc_no,',
'                        wurah_doc_date,',
'                        wurah_user_id,',
'                        appluser_user_type,',
'                        appluser_user_type1,',
'                        doc_type,',
'                        wurah_type,',
'                        wurah_cre_by,',
'                        wupah_cre_date,',
'                        emp_emp_id,',
'                        emp_name,',
'                        designation,',
'                        department,',
'                        status,',
'                        wurah_status,',
'                        color',
'           from (',
'SELECT (select rowid ',
'          from wapl_user_role_access_hd',
'         where wurah_bu  = a.wurah_bu',
'           and wurah_doc_no = a.wurah_doc_no) rowid_hd,',
'       wurah_bu,',
'       wurah_doc_no,',
'       -----TO_DATE(wurah_doc_date,:GLOBAL_DATE_FORMAT)',
'       wurah_doc_date,',
'       wural_seq_no,',
'       wurah_user_id,',
'       appluser_user_type,',
'       DECODE(appluser_user_type,''R'',''Admin'',''E'',''Functional'',''U'',''ESS Portal'',''S'',''Supplier Portal'',''C'',''Customer Portal'',''P'',''POS User'',''O'',''Role Based User'',''M'',''Mobile App'',''L'',''Limited Access User'',''T'',''Subcontract Portal'',''D'',''Module Specific'','
||'''G'',''Management'')appluser_user_type1,',
'       DECODE(wurah_type,''R'',''Remove Unit Access'',''A'',''Add Role Access'',''E'',''Extend Duration'') as doc_type,',
'       wurah_type,',
'       TO_DATE(wural_date_from,:GLOBAL_DATE_FORMAT)wural_date_from,',
'       TO_DATE(wural_date_to,:GLOBAL_DATE_FORMAT)wural_date_to,',
'       wural_sel_flag,',
'       wurah_cre_by,',
'       TO_CHAR(wurah_cre_date,''DD-MM-RRRR HH12:MI pm'') wupah_cre_date,',
'       wurah_appr_by,',
'       wurah_appr_date,',
'       appluser_emp_id emp_emp_id,',
'       (SELECT emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1',
'          FROM employees',
'         WHERE emp_bu = appluser_bu',
'           AND emp_emp_id = appluser_emp_id) emp_name,',
'      (SELECT hrpos_pos_name1',
'         FROM hr_positions',
'        WHERE hrpos_bu     = appluser_bu',
'          AND hrpos_pos_id = (SELECT empai_pos_id',
'                               FROM emp_active_infos',
'                              WHERE empai_bu = appluser_bu',
'                                AND empai_emp_id = appluser_emp_id))Designation,',
'      (SELECT dept_name1',
'         FROM departments',
'        WHERE dept_bu = appluser_bu',
'          AND dept_id = (SELECT empai_dept_id',
'                           FROM emp_active_infos',
'                          WHERE empai_bu = appluser_bu',
'                            AND empai_emp_id = appluser_emp_id))Department,',
'       wurah_status status,',
'       DECODE(wurah_status,''N'',''Draft'',''E'',''Entry Completed'',''P'',''Posted'',''C'',''Cancelled'')wurah_status,',
'             CASE wurah_status WHEN ''N'' THEN ''Blue''',
'                               WHEN ''P'' then ''Green''',
'                               WHEN ''C'' then ''Red''',
'                               WHEN ''E'' then ''Brown''',
'       END color',
'     FROM wapl_user_role_access_hd a,',
'          wapl_user_role_access_ln,',
'          appl_users',
'    WHERE appluser_id = wurah_user_id',
'      AND wurah_bu    = :GLOBAL_bu',
'      AND wurah_bu       = wural_bu (+)',
'      AND wurah_doc_no   = wural_doc_no (+)',
'      and :P159_SHOW_DATA = ''Y''',
'      AND wurah_status NOT IN (''L'',''C'')',
'      AND ((wurah_status = ''P'' ----AND wural_sel_flag = ''Y''',
'      )',
'       OR wurah_status   = ''N'' OR wurah_status = ''E''))',
'          WHERE (INSTR(UPPER(wurah_user_id), UPPER(:P159_USER_ID)) > 0 OR :P159_USER_ID IS NULL) -- (wupah_user_id = :P159_USER_ID OR :P159_USER_ID IS NULL)',
'      AND (wurah_doc_no  = :P159_DOC_NO OR :P159_DOC_NO IS NULL)',
'      AND (appluser_user_type = :P159_USER_TYPE OR :P159_USER_TYPE IS NULL)',
'      AND (wurah_type      = :P159_DOC_TYPE OR :P159_DOC_TYPE IS NULL)',
'      AND (status       = :P159_STATUS OR :P159_STATUS IS NULL)',
'      AND ((INSTR(UPPER(emp_emp_id),UPPER(TRIM(:P159_APPLUSER_EMP_ID))) > 0 )',
'       OR (INSTR(UPPER((emp_name)),UPPER(TRIM(:P159_APPLUSER_EMP_ID))) > 0)',
'       OR :P159_APPLUSER_EMP_ID IS NULL)',
'       '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P159_USER_ID,P159_APPLUSER_EMP_ID,P159_USER_TYPE,P159_LOCATION,P159_UNIT,P159_DOC_NO,P159_DOC_TYPE,P159_STATUS,P159_SHOW_DATA'
,p_prn_page_header=>'User Unit'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(10054337554651778151)
,p_no_data_found_message=>'No Data Found'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>4574816570866857949
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6838267340713228112)
,p_db_column_name=>'APPLUSER_USER_TYPE'
,p_display_order=>30
,p_column_identifier=>'AP'
,p_column_label=>'User Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6850487105957734400)
,p_db_column_name=>'APPLUSER_USER_TYPE1'
,p_display_order=>200
,p_column_identifier=>'BA'
,p_column_label=>'User Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7894439989381822064)
,p_db_column_name=>'COLOR'
,p_display_order=>160
,p_column_identifier=>'AJ'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6838268298903228121)
,p_db_column_name=>'DEPARTMENT'
,p_display_order=>70
,p_column_identifier=>'AY'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6838268199945228120)
,p_db_column_name=>'DESIGNATION'
,p_display_order=>60
,p_column_identifier=>'AX'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9059305161571244831)
,p_db_column_name=>'DOC_TYPE'
,p_display_order=>150
,p_column_identifier=>'AD'
,p_column_label=>'Doc. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7152555060402910711)
,p_db_column_name=>'EMP_EMP_ID'
,p_display_order=>230
,p_column_identifier=>'BD'
,p_column_label=>'Emp./Party ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9059304864425244829)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>50
,p_column_identifier=>'AB'
,p_column_label=>'Emp./Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6829412207056494621)
,p_db_column_name=>'ROWID_HD'
,p_display_order=>170
,p_column_identifier=>'AL'
,p_column_label=>'Rowid Hd'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6850487263590734402)
,p_db_column_name=>'STATUS'
,p_display_order=>220
,p_column_identifier=>'BC'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5795969105240104532)
,p_db_column_name=>'WUPAH_CRE_DATE'
,p_display_order=>250
,p_column_identifier=>'BF'
,p_column_label=>'Created Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5660491047516517905)
,p_db_column_name=>'WURAH_BU'
,p_display_order=>260
,p_column_identifier=>'BG'
,p_column_label=>'Wurah Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5660491520722517910)
,p_db_column_name=>'WURAH_CRE_BY'
,p_display_order=>310
,p_column_identifier=>'BL'
,p_column_label=>'Wurah Cre By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5660491249829517907)
,p_db_column_name=>'WURAH_DOC_DATE'
,p_display_order=>280
,p_column_identifier=>'BI'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5660491175247517906)
,p_db_column_name=>'WURAH_DOC_NO'
,p_display_order=>270
,p_column_identifier=>'BH'
,p_column_label=>'Doc. No.'
,p_column_link=>'f?p=&APP_ID.:158:&SESSION.::&DEBUG.::P158_ROWID:#ROWID_HD#'
,p_column_linktext=>'#WURAH_DOC_NO#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5660491662263517911)
,p_db_column_name=>'WURAH_STATUS'
,p_display_order=>320
,p_column_identifier=>'BM'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5660491475429517909)
,p_db_column_name=>'WURAH_TYPE'
,p_display_order=>300
,p_column_identifier=>'BK'
,p_column_label=>'Wurah Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5660491312305517908)
,p_db_column_name=>'WURAH_USER_ID'
,p_display_order=>290
,p_column_identifier=>'BJ'
,p_column_label=>'User ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(10054349636099782119)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'10523865'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WURAH_DOC_NO:WURAH_USER_ID:EMP_EMP_ID:EMP_NAME:DOC_TYPE:APPLUSER_USER_TYPE1:DEPARTMENT:DESIGNATION:STATUS:APPLUSER_USER_TYPE:WURAH_DOC_DATE:WURAH_STATUS:WURAH_TYPE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5660459835582502881)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(12248041857330159741)
,p_button_name=>'ADD'
,p_static_id=>'add'
,p_button_static_id=>'addbtn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapLeft:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:170:&SESSION.::&DEBUG.:158::'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5660459082036502881)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(12248041857330159741)
,p_button_name=>'Clear1'
,p_static_id=>'clear'
,p_button_static_id=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5660459453139502881)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(12248041857330159741)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_static_id=>'cancelbtn'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5660460236047502881)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(12248041857330159741)
,p_button_name=>'Favorite_N'
,p_static_id=>'favorite-n'
,p_button_static_id=>'F'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favorite N'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'cancelbtn'
,p_icon_css_classes=>'fa-heart-o'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5660460614916502881)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(12248041857330159741)
,p_button_name=>'Favorite_Y'
,p_static_id=>'favorite-y'
,p_button_static_id=>'fav'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favorite'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-heart'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5660458647635502881)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(12248041857330159741)
,p_button_name=>'Go_report'
,p_static_id=>'go-report'
,p_button_static_id=>'SEARCH'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5660457411195502878)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(10054337455886778151)
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
 p_id=>wwv_flow_imp.id(10124886368705231496)
,p_name=>'P159_APPLUSER_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12248041857330159741)
,p_item_source_plug_id=>wwv_flow_imp.id(12248041857330159741)
,p_prompt=>'Emp. / Party'
,p_source=>'APPLUSER_EMP_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_UAM1016_EMP'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>10
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
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
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7892327918897146592)
,p_name=>'P159_DOC_DATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(12248041857330159741)
,p_prompt=>'Doc.  Date'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7892327755217146591)
,p_name=>'P159_DOC_NO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(12248041857330159741)
,p_prompt=>'Doc. No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_DOC_NO(UAM2015)'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
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
  'title', 'Select the Document',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7892327596854146589)
,p_name=>'P159_DOC_TYPE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(12248041857330159741)
,p_prompt=>'Doc.  Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Add Unit Access;A,Remove Unit Access;R,Extend Duration;E'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6958501668923333717)
,p_name=>'P159_ERROR_FLAG'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12248041857330159741)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8927390013401036822)
,p_name=>'P159_FAVORITE_FLAG'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8927300546673036088)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT wubfa_user_fav',
'  FROM wapl_bus_fun,',
'       wapl_user_bus_fun_accs',
' WHERE wubfa_user_id    = :GLOBAL_user',
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
 p_id=>wwv_flow_imp.id(10124917760302231600)
,p_name=>'P159_LOCATION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12248041857330159741)
,p_item_source_plug_id=>wwv_flow_imp.id(12248041857330159741)
,p_prompt=>'Location'
,p_source=>'APPLUSER_USER_TYPE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_UAM1016_PLNT_LOC'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Location',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6829412432540494619)
,p_name=>'P159_REPORT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8927300546673036088)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6829425221354494648)
,p_name=>'P159_SHOW_DATA'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(12248041857330159741)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6824060254749629814)
,p_name=>'P159_STATUS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(12248041857330159741)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;N,Entry Completed;E,Posted;P'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8957027761701410737)
,p_name=>'P159_UNIT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12248041857330159741)
,p_prompt=>'Unit'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_UAM1016_PLNT'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_is_persistent=>'N'
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
  'title', 'Select the Unit',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(10124914906141231594)
,p_name=>'P159_USER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12248041857330159741)
,p_item_source_plug_id=>wwv_flow_imp.id(12248041857330159741)
,p_prompt=>'User'
,p_source=>'APPLUSER_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT appluser_id   ',
'  FROM appl_users,',
'       wapl_user_plnt_access_view',
' WHERE appluser_bu = wupav_bu',
'   AND appluser_id = wupav_user_id',
'   AND appluser_bu = :Global_bu     ',
'   AND  appluser_status = ''A'''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
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
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7892327696929146590)
,p_name=>'P159_USER_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12248041857330159741)
,p_prompt=>'User Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Admin;R,Functional;E,Module Specific;D,Management;G,Mobile App;M,ESS Portal;U,Supplier Portal;S,Customer Portal;C,Subcontract Portal;T'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5660465355820502886)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5660459082036502881)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660466340552502887)
,p_event_id=>wwv_flow_imp.id(5660465355820502886)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P159_USER_ID,P159_APPLUSER_EMP_ID,P159_USER_TYPE,P159_LOCATION,P159_UNIT,P159_DOC_NO,P159_DOC_TYPE,P159_DOC_DATE,P159_STATUS,P159_SHOW_DATA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660465808329502886)
,p_event_id=>wwv_flow_imp.id(5660465355820502886)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.message.clearErrors();')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660466872759502887)
,p_event_id=>wwv_flow_imp.id(5660465355820502886)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10054337455886778151)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_build_option_id=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5660473823414502891)
,p_name=>'Clear1'
,p_static_id=>'clear-2'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660474310963502892)
,p_event_id=>wwv_flow_imp.id(5660473823414502891)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P159_USER_ID,P159_APPLUSER_EMP_ID,P159_USER_TYPE,P159_LOCATION,P159_UNIT,P159_DOC_NO,P159_DOC_TYPE,P159_DOC_DATE,P159_STATUS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660474878450502892)
,p_event_id=>wwv_flow_imp.id(5660473823414502891)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("find").show();',
    'apex.item("detail").hide();')))).to_clob
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_server_condition_expr1=>'P159_SHOW_DATA'
,p_server_condition_expr2=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5660475273311502892)
,p_name=>'fav N'
,p_static_id=>'fav-n'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5660460236047502881)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660475688359502892)
,p_event_id=>wwv_flow_imp.id(5660475273311502892)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P159_FAVORITE_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN  ',
    '    proc_upd_favour_web(:global_bu, ''N'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '    SELECT wubfa_user_fav',
    '      INTO :P159_FAVORITE_FLAG',
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
 p_id=>wwv_flow_imp.id(5660476247785502892)
,p_event_id=>wwv_flow_imp.id(5660475273311502892)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P159_FAVORITE_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5660476682677502892)
,p_name=>'fav Y'
,p_static_id=>'fav-y'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5660460614916502881)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660477104233502892)
,p_event_id=>wwv_flow_imp.id(5660476682677502892)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P159_FAVORITE_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    proc_upd_favour_web(:global_bu,''Y'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '',
    '    SELECT wubfa_user_fav',
    '      INTO :P159_FAVORITE_FLAG',
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
 p_id=>wwv_flow_imp.id(5660477634335502892)
,p_event_id=>wwv_flow_imp.id(5660476682677502892)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P159_FAVORITE_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5660469680301502889)
,p_name=>'P159_FAVORITE_FLAG'
,p_static_id=>'p159-favorite-flag'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P159_FAVORITE_FLAG'
,p_condition_element=>'P159_FAVORITE_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660470130516502889)
,p_event_id=>wwv_flow_imp.id(5660469680301502889)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5660460614916502881)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660470682470502889)
,p_event_id=>wwv_flow_imp.id(5660469680301502889)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide-2'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5660460236047502881)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660471120184502889)
,p_event_id=>wwv_flow_imp.id(5660469680301502889)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5660460236047502881)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660471633772502891)
,p_event_id=>wwv_flow_imp.id(5660469680301502889)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show-2'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(5660460614916502881)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5660471993696502891)
,p_name=>'P69_ERROR_FLAG'
,p_static_id=>'p69-error-flag'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P159_ERROR_FLAG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660472536032502891)
,p_event_id=>wwv_flow_imp.id(5660471993696502891)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// First clear the errors',
    'apex.message.clearErrors();',
    '',
    'var errorFlag= $v(''P159_ERROR_FLAG'');',
    '',
    'if(errorFlag == ''P159_DOC_DATE'') {',
    '// Now show new errors',
    'apex.message.showErrors([',
    '    {',
    '        type:       "error",',
    '        location:   [ "page", "inline" ],',
    '        pageItem:   "P159_DOC_DATE",',
    '        message:    "Doc. Date must be a valid date format DD-MM-RRRR.",',
    '        unsafe:     false',
    '    }',
    ']); ',
    '//To stop the further actions from firing',
    'apex.da.cancelEvent.call(this);',
    '}  ',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5660467201066502887)
,p_name=>'Report Refresh'
,p_static_id=>'report-refresh'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5660458647635502881)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660467759925502887)
,p_event_id=>wwv_flow_imp.id(5660467201066502887)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P159_ERROR_FLAG',
  'items_to_submit', 'P159_DOC_DATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ':P159_ERROR_FLAG := 0;',
    '',
    'IF :P159_DOC_DATE IS NOT NULL THEN',
    '  DECLARE',
    '    v_date  DATE;',
    '  BEGIN',
    '    v_date := TO_DATE(:P159_DOC_DATE,:GLOBAL_DATE_FORMAT);',
    '  EXCEPTION WHEN OTHERS THEN',
    '     :P159_ERROR_FLAG := ''P159_DOC_DATE'';',
    '  END;',
    '',
    'END IF;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660469208487502889)
,p_event_id=>wwv_flow_imp.id(5660467201066502887)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("detail").show();',
    '// apex.item("find").hide();')))).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P159_SHOW_DATA'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660468749752502887)
,p_event_id=>wwv_flow_imp.id(5660467201066502887)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(10054337455886778151)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P159_ERROR_FLAG'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660468235250502887)
,p_event_id=>wwv_flow_imp.id(5660467201066502887)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P159_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5660472959669502891)
,p_name=>'Search'
,p_static_id=>'search'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5660457411195502878)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5660473409076502891)
,p_event_id=>wwv_flow_imp.id(5660472959669502891)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("find").show();',
    'apex.item("detail").hide();')))).to_clob
);
wwv_flow_imp.component_end;
end;
/
