prompt --application/pages/page_00069
begin
--   Manifest
--     PAGE: 00069
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
 p_id=>69
,p_name=>'Current Bus. Fun. Access'
,p_alias=>'FIND-USERS'
,p_step_title=>'Current Bus. Fun. Access'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#WORKSPACE_FILES#FindMenuCSS#MIN#.css'
,p_javascript_code_onload=>'slideclose();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#addbtn{',
'    color: blue;',
'    background-color: #ffffff;',
'',
'}',
'',
'#SEARCH{',
'    color: green;',
'    background-color: #ffffff;',
'}',
'#cancelbtn{',
'    color: rgb(214, 19, 29);',
'    background-color: #ffffff;',
'}',
'',
'#cancelbtn1{',
'    color: rgb(214, 19, 29);',
'    background-color: #ffffff;',
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
' }',
'',
'.t-Button--primary:not(.t-Button--simple):not(.t-Button--hot), .t-Button--primary:not(.t-Button--simple):not(.t-Button--hot):active, .t-Button--primary:not(.t-Button--simple):not(.t-Button--hot).is-active {',
'    background-color: #ffffff;',
'    border-radius: 6.5px;',
'}'))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9083409546638803221)
,p_plug_name=>'<b>Create Users</b>'
,p_static_id=>'b-create-users-b'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>70
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9776147003981358056)
,p_plug_name=>'Find User '
,p_static_id=>'find-user'
,p_title=>'Report  : Current Bus. Fun. Access'
,p_region_name=>'find'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--controlsPosEnd:is-expanded:t-Region--scrollBody'
,p_region_attributes=>'style ="box-shadow: 0px 1px 16px 0px rgba(0,0,0,0.36) !important;"'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P69_APPLUSER_STATUS in(''A'',''D'')'
,p_plug_read_only_when2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6458000257431957088)
,p_plug_name=>'Header'
,p_static_id=>'header'
,p_parent_plug_id=>wwv_flow_imp.id(9083409546638803221)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>90
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6455405693324234403)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5972492956994099538)
,p_plug_name=>'New'
,p_static_id=>'new-2'
,p_parent_plug_id=>wwv_flow_imp.id(6458000257431957088)
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650491255404505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(10650463632707505295)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(10650581164484505434)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9222850460380130134)
,p_plug_name=>'User_Access'
,p_static_id=>'user-access'
,p_title=>'Result(s)'
,p_region_name=>'detail'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:margin-top-none'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'       row_id_no,',
'       wubfa_user_id,',
'       wubfa_bus_fun_id,',
'       wapl_bus_fun_desc, ',
'       wbf_vert_bus_fun_name,',
'       wbf_par_fun_id,',
'       DECODE(wbf_node_type,''FRM'',''Transaction'',''REP'',''Report'',''RPT'',''Analytics'',''MOD'',''Module'',''SET'',''Setup'') wbf_node_type,',
'       wbf_std_vert_type,            ',
'       wbf_vertical_id,',
'       Par_desc,  ',
'       TO_CHAR(wubfa_date_from,''DD-MON-YYYY'')wubfa_date_from,',
'       TO_CHAR(wubfa_date_to,''DD-MON-YYYY'')wubfa_date_to,',
'       wubfa_cre_by,',
'       wubfa_cre_ip_addr,',
'       wubfa_cre_os_user,',
'       wubfa_cre_emp_id,',
'       wubfa_cre_date,',
'       wubfa_upd_by,',
'       wubfa_upd_ip_addr,',
'       wubfa_upd_os_user,',
'       wubfa_upd_emp_id,',
'       wubfa_upd_date,',
'       wubfa_appr_by,',
'       wubfa_seq_no,',
'       Emp_name,',
'       Emp_id,',
'	   Designation,',
'       Department',
'	   Department,',
'       Unit_Name,',
'       Unit,',
'       User_type,',
'       wubfa_accs_doc_no,',
'       TO_CHAR(wubfa_accs_doc_date,''DD-MON-YYYY'')wubfa_accs_doc_date',
'FROM (',
'SELECT A.ROWID row_id_no,',
'       wubfa_user_id,',
'       wubfa_bus_fun_id,',
'       wbf_bus_fun_name wapl_bus_fun_desc, ',
'       wbf_vert_bus_fun_name wbf_vert_bus_fun_name,',
'       wbf_node_type wbf_node_type, ',
'       wbf_bus_fun_id wbf_par_fun_id,',
'       wbf_std_vert_type wbf_std_vert_type,            ',
'       wbf_vertical_id wbf_vertical_id,',
'       wbf_bus_fun_name Par_desc,  ',
'       wubfa_date_from,',
'       wubfa_date_to,',
'       wubfa_cre_by,',
'       wubfa_cre_ip_addr,',
'       wubfa_cre_os_user,',
'       wubfa_cre_emp_id,',
'       wubfa_cre_date,',
'       wubfa_upd_by,',
'       wubfa_upd_ip_addr,',
'       wubfa_upd_os_user,',
'       wubfa_upd_emp_id,',
'       wubfa_upd_date,',
'       wubfa_appr_by,',
'       wubfa_seq_no,',
'       (Select  trim(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1) emp_name',
'          from employees',
'        where  emp_bu   = :global_bu',
'            and emp_emp_id = (case when APPLUSER_USER_TYPE = ''C'' then APPLUSER_CUST_ID when APPLUSER_USER_TYPE = ''S'' then APPLUSER_SUPLR_ID else APPLUSER_EMP_ID end)',
'        UNION ALL',
'        SELECT  suplr_name1',
'          FROM suppliers',
'         WHERE  suplr_bu         = :global_bu',
'           AND suplr_party_type = ''S''',
'           AND suplr_suplr_id   = (case when APPLUSER_USER_TYPE = ''C'' then APPLUSER_CUST_ID when APPLUSER_USER_TYPE = ''S'' then APPLUSER_SUPLR_ID else APPLUSER_EMP_ID end)   ',
'        UNION ALL',
'        SELECT  suplr_name1',
'          FROM suppliers',
'         WHERE  suplr_bu         = :global_bu',
'           AND suplr_party_type = ''C''',
'           AND suplr_suplr_id   = (case when APPLUSER_USER_TYPE = ''C'' then APPLUSER_CUST_ID when APPLUSER_USER_TYPE = ''S'' then APPLUSER_SUPLR_ID else APPLUSER_EMP_ID end))',
'         emp_name,',
'       case when APPLUSER_USER_TYPE = ''C'' then APPLUSER_CUST_ID when APPLUSER_USER_TYPE = ''S'' then APPLUSER_SUPLR_ID else APPLUSER_EMP_ID end Emp_id,',
'       (SELECT hrpos_pos_name1',
'          FROM hr_positions',
'         WHERE hrpos_bu     = empai_bu',
'           AND hrpos_pos_id = empai_pos_id',
'           and APPLUSER_USER_TYPE not in (''C'',''S''))Designation,',
'        (SELECT dept_name1',
'           FROM departments',
'          WHERE dept_bu = empai_bu',
'            AND dept_id = empai_dept_id',
'            and APPLUSER_USER_TYPE not in (''C'',''S'')) Department,',
'        (SELECT bup_name1',
'           FROM bus_unit_plants',
'          WHERE bup_bu       = :global_bu',
'            AND bup_plant_id = empai_plnt)Unit_Name,',
'        empai_plnt Unit,',
'        DECODE(appluser_user_type,''R'',''Admin User'',''E'',''Functional User'',''U'',''ESS User'',''P'',''POS User'',''C'',''Customer'',''S'',''Supplier'',''O'',''Role Based User'',''M'',''Mobile User'',''L'',''Limited Access User'')User_type ,',
'        wubfa_accs_doc_no,',
'        wubfa_accs_doc_date',
'  FROM wapl_user_bus_fun_accs A,',
'       wapl_bus_fun,',
'       appl_users,',
'       employees,',
'       emp_active_infos',
' WHERE wbf_bus_fun_id   =  wubfa_bus_fun_id',
'   AND wubfa_user_id    =  appluser_id',
'   AND appluser_bu      =  emp_bu',
'   AND appluser_emp_id  =  emp_emp_id',
'   AND emp_bu           =  empai_bu',
'   AND emp_emp_id       =  empai_emp_id',
'   AND wbf_visible      = ''Y''',
' --  AND :P69_SHOW_DATA = ''Y''',
'   AND appluser_bu      = :global_bu',
'   AND wubfa_user_id IN (SELECT appluser_id',
'                           FROM appl_users ',
'                          WHERE appluser_bu = :global_bu',
'                            AND appluser_status = ''A''))',
'  WHERE (INSTR(UPPER(wubfa_user_id), UPPER(:P69_USER_ID)) > 0 OR :P69_USER_ID IS NULL)',
'   AND ((INSTR(UPPER(Emp_id),UPPER(TRIM(:P69_EMP_ID))) > 0 )',
'        OR (INSTR(UPPER((Emp_name)),UPPER(TRIM(:P69_EMP_ID))) > 0)',
'        OR :P69_EMP_ID IS NULL)',
'   AND (:P69_USER_TYPE IN (SELECT appluser_user_type',
'                             FROM appl_users',
'                            WHERE appluser_id = wubfa_user_id) OR :P69_USER_TYPE IS NULL)',
'   AND (INSTR(UPPER(Designation),UPPER(:P69_DESIGNATION)) > 0 OR :P69_DESIGNATION IS NULL)',
'   AND (INSTR(UPPER(Department),UPPER(:P69_DEPARTMENT)) > 0 OR :P69_DEPARTMENT IS NULL)',
'   AND ((INSTR(UPPER(unit),UPPER(:P69_UNIT)) > 0  OR :P69_UNIT IS NULL)',
'       OR (INSTR(UPPER((Unit_Name)),UPPER(TRIM(:P69_UNIT))) > 0))',
'   AND ((SELECT DISTINCT wbf_node_type',
'	      FROM wapl_bus_fun',
'	     WHERE wbf_bus_fun_id = wubfa_bus_fun_id) = :P69_TYPE OR :P69_TYPE IS NULL)',
'   AND ( (INSTR(UPPER(wubfa_bus_fun_id), UPPER(:P69_BUS_FUN_ID)) > 0)',
'         OR (INSTR(UPPER(wapl_bus_fun_desc), UPPER(:P69_BUS_FUN_ID)) > 0 )',
'          OR :P69_BUS_FUN_ID IS NULL)  ',
'   AND ((wubfa_date_from BETWEEN TO_DATE(:P69_EFF_FROM,''DD-MON-YYYY'') AND TO_DATE(:P69_EFF_TO,''DD-MON-YYYY'')',
'           AND :P69_EFF_FROM IS NOT NULL AND :P69_EFF_TO IS NOT NULL)',
'        OR (wubfa_date_from >= TO_DATE(:P69_EFF_FROM,''DD-MON-YYYY'') AND :P69_EFF_FROM IS NOT NULL AND :P69_EFF_TO IS NULL)',
'        OR (wubfa_date_from <= TO_DATE(:P69_EFF_TO,''DD-MON-YYYY'') AND :P69_EFF_FROM IS NULL AND :P69_EFF_TO IS NOT NULL)',
'        OR (:P69_EFF_FROM IS NULL AND :P69_EFF_TO IS NULL)',
'       )         ',
'   /*AND ((((TO_DATE(:P69_EFF_FROM,''DD-MON-YYYY'') BETWEEN TO_DATE(TRUNC(wubfa_date_from),''DD-MON-YYYY'') AND TO_DATE(TRUNC(wubfa_date_to),''DD-MON-YYYY'')) ',
'        OR (TO_DATE(:P69_EFF_TO,''DD-MON-YYYY'') BETWEEN TO_DATE(TRUNC(wubfa_date_from),''DD-MON-YYYY'') AND TO_DATE(TRUNC(wubfa_date_to),''DD-MON-YYYY''))))',
'         OR (TO_DATE(TRUNC(wubfa_date_from),''DD-MON-YYYY'') >= TO_DATE(:P69_EFF_FROM,''DD-MON-YYYY'') AND :P69_EFF_TO IS NULL AND :P69_EFF_FROM IS NOT NULL)',
'         OR (TO_DATE(TRUNC(wubfa_date_to),''DD-MON-YYYY'') <= TO_DATE(:P69_EFF_TO,''DD-MON-YYYY'') AND :P69_EFF_FROM IS NULL AND :P69_EFF_TO IS NOT NULL)',
'         OR (:P69_EFF_FROM IS NULL AND :P69_EFF_TO IS NULL))*/ ',
'   /*AND ((((TO_DATE(:P69_EFF_FROM,''DD-MON-YYYY'') BETWEEN TO_DATE(TRUNC(wubfa_date_from),''DD-MON-YYYY'') AND TO_DATE(TRUNC(wubfa_date_to),''DD-MON-YYYY'')) ',
'             OR (TO_DATE(:P69_EFF_TO,''DD-MON-YYYY'') BETWEEN TO_DATE(TRUNC(wubfa_date_from),''DD-MON-YYYY'') AND TO_DATE(TRUNC(wubfa_date_to),''DD-MON-YYYY'')))',
'             AND :P69_EFF_TO IS NOT NULL AND :P69_EFF_FROM IS NOT NULL)',
'         OR (TO_DATE(TRUNC(wubfa_date_from),''DD-MON-YYYY'') >= TO_DATE(:P69_EFF_FROM,''DD-MON-YYYY'') AND :P69_EFF_TO IS NULL AND :P69_EFF_FROM IS NOT NULL)',
'         OR (TO_DATE(TRUNC(wubfa_date_to),''DD-MON-YYYY'') <= TO_DATE(:P69_EFF_TO,''DD-MON-YYYY'') AND :P69_EFF_FROM IS NULL AND :P69_EFF_TO IS NOT NULL)',
'         OR (:P69_EFF_FROM IS NULL AND :P69_EFF_TO IS NULL)) */        ',
'    AND wubfa_accs_doc_no IS NOT NULL',
'    ORDER BY  wubfa_cre_date desc,',
'              WUBFA_ACCS_DOC_NO desc',
'             '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P69_USER_ID,P69_EMP_ID,P69_BUS_FUN_ID,P69_TYPE,P69_DESIGNATION,P69_DEPARTMENT,P69_EFF_TO,P69_EFF_FROM,P69_SHOW_DATA,P69_USER_TYPE,P69_ERROR_FLAG'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'User Access'
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
 p_id=>wwv_flow_imp.id(6646640966374296840)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1164679130830685812
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646643754345296868)
,p_db_column_name=>'DEPARTMENT'
,p_display_order=>130
,p_column_identifier=>'AB'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646643636442296867)
,p_db_column_name=>'DESIGNATION'
,p_display_order=>120
,p_column_identifier=>'AA'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646643574413296866)
,p_db_column_name=>'EMP_ID'
,p_display_order=>40
,p_column_identifier=>'Z'
,p_column_label=>'Emp./Party ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646643495817296865)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>50
,p_column_identifier=>'Y'
,p_column_label=>'Emp./Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646641978015296850)
,p_db_column_name=>'PAR_DESC'
,p_display_order=>220
,p_column_identifier=>'J'
,p_column_label=>'Par Desc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646641052154296841)
,p_db_column_name=>'ROW_ID_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Row Id No'
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
 p_id=>wwv_flow_imp.id(6646643975650296870)
,p_db_column_name=>'UNIT'
,p_display_order=>350
,p_column_identifier=>'AD'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646643900732296869)
,p_db_column_name=>'UNIT_NAME'
,p_display_order=>340
,p_column_identifier=>'AC'
,p_column_label=>'Unit Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646644092098296871)
,p_db_column_name=>'USER_TYPE'
,p_display_order=>30
,p_column_identifier=>'AE'
,p_column_label=>'User Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646641347324296844)
,p_db_column_name=>'WAPL_BUS_FUN_DESC'
,p_display_order=>80
,p_column_identifier=>'D'
,p_column_label=>'Bus.Fun.Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646641730172296847)
,p_db_column_name=>'WBF_NODE_TYPE'
,p_display_order=>90
,p_column_identifier=>'G'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646641555523296846)
,p_db_column_name=>'WBF_PAR_FUN_ID'
,p_display_order=>190
,p_column_identifier=>'F'
,p_column_label=>'Wbf Par Fun Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646641795806296848)
,p_db_column_name=>'WBF_STD_VERT_TYPE'
,p_display_order=>200
,p_column_identifier=>'H'
,p_column_label=>'Wbf Std Vert Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646641908696296849)
,p_db_column_name=>'WBF_VERTICAL_ID'
,p_display_order=>210
,p_column_identifier=>'I'
,p_column_label=>'Wbf Vertical Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646641493660296845)
,p_db_column_name=>'WBF_VERT_BUS_FUN_NAME'
,p_display_order=>180
,p_column_identifier=>'E'
,p_column_label=>'Wbf Vert Bus Fun Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646644318117296873)
,p_db_column_name=>'WUBFA_ACCS_DOC_DATE'
,p_display_order=>110
,p_column_identifier=>'AG'
,p_column_label=>'Doc. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646644168709296872)
,p_db_column_name=>'WUBFA_ACCS_DOC_NO'
,p_display_order=>100
,p_column_identifier=>'AF'
,p_column_label=>'Doc.No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646643273013296863)
,p_db_column_name=>'WUBFA_APPR_BY'
,p_display_order=>150
,p_column_identifier=>'W'
,p_column_label=>'Approved By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646641326230296843)
,p_db_column_name=>'WUBFA_BUS_FUN_ID'
,p_display_order=>60
,p_column_identifier=>'C'
,p_column_label=>'Bus.Fun.ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646642306701296853)
,p_db_column_name=>'WUBFA_CRE_BY'
,p_display_order=>140
,p_column_identifier=>'M'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646642691283296857)
,p_db_column_name=>'WUBFA_CRE_DATE'
,p_display_order=>270
,p_column_identifier=>'Q'
,p_column_label=>'Wubfa Cre Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646642561048296856)
,p_db_column_name=>'WUBFA_CRE_EMP_ID'
,p_display_order=>260
,p_column_identifier=>'P'
,p_column_label=>'Wubfa Cre Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646642426656296854)
,p_db_column_name=>'WUBFA_CRE_IP_ADDR'
,p_display_order=>240
,p_column_identifier=>'N'
,p_column_label=>'Wubfa Cre Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646642489386296855)
,p_db_column_name=>'WUBFA_CRE_OS_USER'
,p_display_order=>250
,p_column_identifier=>'O'
,p_column_label=>'Wubfa Cre Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646642046269296851)
,p_db_column_name=>'WUBFA_DATE_FROM'
,p_display_order=>160
,p_column_identifier=>'K'
,p_column_label=>'Eff.From'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646642178925296852)
,p_db_column_name=>'WUBFA_DATE_TO'
,p_display_order=>170
,p_column_identifier=>'L'
,p_column_label=>'Eff.To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646643368923296864)
,p_db_column_name=>'WUBFA_SEQ_NO'
,p_display_order=>330
,p_column_identifier=>'X'
,p_column_label=>'Wubfa Seq No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646642834224296858)
,p_db_column_name=>'WUBFA_UPD_BY'
,p_display_order=>280
,p_column_identifier=>'R'
,p_column_label=>'Wubfa Upd By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646643207139296862)
,p_db_column_name=>'WUBFA_UPD_DATE'
,p_display_order=>320
,p_column_identifier=>'V'
,p_column_label=>'Wubfa Upd Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646643081908296861)
,p_db_column_name=>'WUBFA_UPD_EMP_ID'
,p_display_order=>310
,p_column_identifier=>'U'
,p_column_label=>'Wubfa Upd Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646642887123296859)
,p_db_column_name=>'WUBFA_UPD_IP_ADDR'
,p_display_order=>290
,p_column_identifier=>'S'
,p_column_label=>'Wubfa Upd Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646642990564296860)
,p_db_column_name=>'WUBFA_UPD_OS_USER'
,p_display_order=>300
,p_column_identifier=>'T'
,p_column_label=>'Wubfa Upd Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6646641216942296842)
,p_db_column_name=>'WUBFA_USER_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6647714361784193990)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'11657526'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WUBFA_USER_ID:USER_TYPE:EMP_ID:EMP_NAME:DESIGNATION:DEPARTMENT:WUBFA_BUS_FUN_ID:WAPL_BUS_FUN_DESC:WBF_NODE_TYPE:WUBFA_DATE_FROM:WUBFA_DATE_TO:WUBFA_CRE_BY:WUBFA_APPR_BY:WUBFA_ACCS_DOC_NO:WUBFA_ACCS_DOC_DATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5972492832551099536)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(9776147003981358056)
,p_button_name=>'Close1'
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
 p_id=>wwv_flow_imp.id(5998691940540087963)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(9222850460380130134)
,p_button_name=>'Download'
,p_static_id=>'download'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--padRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Download'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6545451116009346373)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(9776147003981358056)
,p_button_name=>'Favorite_N'
,p_static_id=>'favorite-n'
,p_button_static_id=>'fav'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favorite Button'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-heart-o'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6774355334949938038)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(9776147003981358056)
,p_button_name=>'Favorite_Y'
,p_static_id=>'favorite-y'
,p_button_static_id=>'cancelbtn1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favorite Button'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-heart'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5972492684970099535)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(9776147003981358056)
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
 p_id=>wwv_flow_imp.id(5972492483473099533)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(9776147003981358056)
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
 p_id=>wwv_flow_imp.id(7411122549780613533)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(9222850460380130134)
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
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(5998692223835087965)
,p_branch_name=>'Download'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.:APPLICATION_PROCESS=GET_EXPORT_FILE:&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(5998691940540087963)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6671767617511366039)
,p_branch_name=>'Go To Page 69'
,p_branch_action=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.::P69_SHOW_DATA:&P69_SHOW_DATA.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5972492121204099529)
,p_name=>'P69_BUS_FUN_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(9776147003981358056)
,p_prompt=>'Bus. Fun. ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_UAM010_EMP'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P69_USER_ID'
,p_ajax_items_to_submit=>'P69_USER_ID'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
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
  'title', 'Select the Bus. Fun.',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6533739661438795251)
,p_name=>'P69_DEPARTMENT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(9776147003981358056)
,p_prompt=>'Department'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT dept_name1',
'  FROM departments,',
'       emp_active_infos,',
'       appl_users ,',
'       wapl_user_bus_fun_accs,',
'       wapl_bus_fun',
' WHERE dept_bu          = empai_bu',
'   AND dept_id          = empai_dept_id',
'   AND appluser_bu      = empai_bu',
'   AND appluser_emp_id  = empai_emp_id',
'   AND wubfa_user_id    = appluser_id',
'   AND wubfa_bus_fun_id = wbf_bus_fun_id',
'   AND wbf_visible      = ''Y''',
'   AND dept_bu          = :GLOBAL_bu',
'   AND appluser_status  = ''A''',
'ORDER BY 1 '))
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
  'title', 'Select the Department',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6533739578100795250)
,p_name=>'P69_DESIGNATION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(9776147003981358056)
,p_prompt=>'Designation'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT hrpos_pos_name1 Designation',
'  FROM hr_positions,',
'       emp_active_infos,',
'       appl_users,',
'       wapl_user_bus_fun_accs',
' WHERE hrpos_bu            = empai_bu',
'   AND hrpos_pos_id        = empai_pos_id',
'   AND appluser_bu         = empai_bu',
'   AND appluser_emp_id     = empai_emp_id',
'   AND appluser_id           = wubfa_user_id',
'   AND hrpos_bu = :GLOBAl_bu',
'   AND appluser_status = ''A''',
'ORDER BY 1'))
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
  'title', 'Select the Designation',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5972492300995099531)
,p_name=>'P69_EFF_FROM'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(9776147003981358056)
,p_prompt=>'Eff. From'
,p_format_mask=>'DD-MON-YYYY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>40
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(5972492362101099532)
,p_name=>'P69_EFF_TO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(9776147003981358056)
,p_prompt=>'Eff. To'
,p_format_mask=>'DD-MON-YYYY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>40
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
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
 p_id=>wwv_flow_imp.id(6533738063021795235)
,p_name=>'P69_EMP_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(9776147003981358056)
,p_prompt=>'Emp./Party'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_BENEFICIARY'
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
  'title', 'Select the Emp./Party',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6771686531939857774)
,p_name=>'P69_ERROR_FLAG'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(9776147003981358056)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6545451326433346375)
,p_name=>'P69_FAVOURITE_FLAG'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6455405693324234403)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  WUBFA_USER_FAV ',
'   FROM wapl_bus_fun,',
'        wapl_user_bus_fun_accs',
'   WHERE WUBFA_USER_ID = :GLOBAL_USER',
'   AND WUBFA_BUS_FUN_ID = WBF_BUS_FUN_ID',
'   AND WBF_PAGE_NO = :app_page_id',
'   AND wbf_appl_no = :app_id',
'   AND wbf_visible = ''Y'''))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6671758421825356767)
,p_name=>'P69_SHOW_DATA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6455405693324234403)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6533739347303795248)
,p_name=>'P69_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(9776147003981358056)
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Module;MOD,Setup;SET,Transaction;FRM,Reports;REP,Analytics;RPT'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6533739987265795254)
,p_name=>'P69_UNIT'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(9776147003981358056)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5965058476807756078)
,p_name=>'P69_USER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(9776147003981358056)
,p_prompt=>'User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  DISTINCT wubfa_user_id User_id,',
'        wubfa_user_id',
'  FROM  appl_users,',
'        wapl_user_bus_fun_accs,',
'        wapl_bus_fun',
' WHERE appluser_bu = :Global_bu',
'   AND appluser_id = wubfa_user_id',
'   AND appluser_status = ''A''',
'   AND wubfa_bus_fun_id = wbf_bus_fun_id',
'   AND wbf_visible            = ''Y''',
'ORDER BY 1'))
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
  'title', 'Select the User',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6533739509285795249)
,p_name=>'P69_USER_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(9776147003981358056)
,p_prompt=>'User Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Admin User;R,Functional User;E,Role Based User;O,ESS User;U,Supplier;S,Customer;C,POS User;P,Mobile User;M'
,p_lov_display_null=>'YES'
,p_cHeight=>1
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
 p_id=>wwv_flow_imp.id(5972397146573089612)
,p_name=>'Assign_user'
,p_static_id=>'assign-user'
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_USER_NAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5972397673921089612)
,p_event_id=>wwv_flow_imp.id(5972397146573089612)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P69_USER_NAME,P69_APPLUSER_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P69_USER_NAME IS NOT NULL THEN',
    '',
    '   IF :P69_USER_NAME = :P69_APPLUSER_ID THEN',
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
    '	 	     AND appluser_id = :P69_USER_NAME;',
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
 p_id=>wwv_flow_imp.id(7411122277414613530)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>270
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7411122412523613531)
,p_event_id=>wwv_flow_imp.id(7411122277414613530)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_USER_ID,P69_USER_TYPE,P69_EMP_ID,P69_BUS_FUN_ID,P69_TYPE,P69_DESIGNATION,P69_DEPARTMENT,P69_EFF_FROM,P69_EFF_TO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7411122487329613532)
,p_event_id=>wwv_flow_imp.id(7411122277414613530)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("find").show();',
    'apex.item("detail").hide();')))).to_clob
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_server_condition_expr1=>'P69_SHOW_DATA'
,p_server_condition_expr2=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5972396279750089610)
,p_name=>'EMP_NAME'
,p_static_id=>'emp-name'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5972396831745089612)
,p_event_id=>wwv_flow_imp.id(5972396279750089610)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT EMP_FIRST_NAME1 INTO :P69_EMP_NAME FROM EMPLOYEES',
    'WHERE EMP_BU = :GLOBAL_BU',
    'AND EMP_EMP_ID = :P69_APPLUSER_PARTY_ID;',
    '',
    'EXCEPTION WHEN no_data_found then',
    'NULL;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6774354977491938035)
,p_name=>'Favorite_N'
,p_static_id=>'favorite-n'
,p_event_sequence=>240
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6545451116009346373)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6774355055299938036)
,p_event_id=>wwv_flow_imp.id(6774354977491938035)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P69_FAVOURITE_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    proc_upd_favour_web(:global_bu, ''N'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '    SELECT wubfa_user_fav',
    '      INTO :P69_FAVOURITE_FLAG',
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
 p_id=>wwv_flow_imp.id(6774355147408938037)
,p_event_id=>wwv_flow_imp.id(6774354977491938035)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_FAVOURITE_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6774355847846938044)
,p_name=>'Favorite_Y'
,p_static_id=>'favorite-y'
,p_event_sequence=>250
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6774355334949938038)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6774356034266938045)
,p_event_id=>wwv_flow_imp.id(6774355847846938044)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P69_FAVOURITE_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    proc_upd_favour_web(:global_bu, ''Y'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '',
    '    SELECT wubfa_user_fav',
    '      INTO :P69_FAVOURITE_FLAG',
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
 p_id=>wwv_flow_imp.id(6774356115979938046)
,p_event_id=>wwv_flow_imp.id(6774355847846938044)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_FAVOURITE_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6671767309300366036)
,p_name=>'Filter'
,p_static_id=>'filter'
,p_event_sequence=>220
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5972492684970099535)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6671767373455366037)
,p_event_id=>wwv_flow_imp.id(6671767309300366036)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_USER_ID,P69_EMP_ID,P69_BUS_FUN_ID,P69_TYPE,P69_DESIGNATION,P69_DEPARTMENT,P69_EFF_TO,P69_EFF_FROM,P69_USER_TYPE,P69_SHOW_DATA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6774356188326938047)
,p_event_id=>wwv_flow_imp.id(6671767309300366036)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.message.clearErrors();')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7974719714377067350)
,p_event_id=>wwv_flow_imp.id(6671767309300366036)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9222850460380130134)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6671767132635366034)
,p_name=>'Find'
,p_static_id=>'find'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5972492483473099533)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5998692244998087966)
,p_event_id=>wwv_flow_imp.id(6671767132635366034)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P69_USER_ID,P69_USER_TYPE,P69_EMP_ID,P69_BUS_FUN_ID,P69_TYPE,P69_DESIGNATION,P69_DEPARTMENT,P69_EFF_FROM,P69_UNIT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''User_Access'',1,''P69_USER_ID'',''User Id'',:P69_USER_ID,:P69_USER_ID);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''User_Access'',2,''P69_USER_TYPE'',''User Type'',:P69_USER_TYPE,',
    '      CASE WHEN :P69_USER_TYPE = ''R'' THEN ''Admin User''',
    '              WHEN :P69_USER_TYPE = ''E'' THEN ''Functional User''',
    '              WHEN :P69_USER_TYPE = ''O'' THEN ''Role Based User''',
    '              WHEN :P69_USER_TYPE = ''U'' THEN ''ESS User''',
    '              WHEN :P69_USER_TYPE = ''S'' THEN ''Supplier''',
    '              WHEN :P69_USER_TYPE = ''C'' THEN ''Customer''',
    '              WHEN :P69_USER_TYPE = ''P'' THEN ''POS User''',
    '              WHEN :P69_USER_TYPE = ''M'' THEN ''Mobile User'' END);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''User_Access'',3,''P69_EMP_ID'',''Emp. ID'',:P69_EMP_ID,:P69_EMP_ID);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''User_Access'',4,''P69_BUS_FUN_ID'',''Bus. Fun. ID'',:P69_BUS_FUN_ID,:P69_BUS_FUN_ID);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''User_Access'',5,''P69_TYPE'',''Type'',:P69_TYPE,',
    '          CASE WHEN :P69_TYPE = ''MOD'' THEN ''Module''',
    '              WHEN :P69_TYPE = ''SET'' THEN ''Setup''',
    '              WHEN :P69_TYPE = ''FRM'' THEN ''Transaction''',
    '              WHEN :P69_TYPE = ''REP'' THEN ''Reports''',
    '              WHEN :P69_TYPE = ''RPT'' THEN '' Analytics'' END);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''User_Access'',6,''P69_DESIGNATION'',''Designation'',:P69_DESIGNATION,:P69_DESIGNATION);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''User_Access'',7,''P69_DEPARTMENT'',''Department'',:P69_DEPARTMENT,:P69_DEPARTMENT);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''User_Access'',8,''P69_EFF_FROM'',''Eff. From'',:P69_EFF_FROM,:P69_EFF_FROM);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''User_Access'',9,''P69_EFF_TO'',''Eff. To'',:P69_EFF_TO,:P69_EFF_TO);',
    '   proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''User_Access'',10,''P69_UNIT'',''Unit'',:P69_UNIT,:P69_UNIT);',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6771686418728857773)
,p_event_id=>wwv_flow_imp.id(6671767132635366034)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P69_ERROR_FLAG',
  'items_to_submit', 'P69_EFF_FROM,P69_EFF_TO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ':P69_ERROR_FLAG := 0;',
    '',
    'IF :P69_EFF_FROM IS NOT NULL  OR :P69_EFF_TO IS NOT NULL THEN',
    '  DECLARE',
    '    v_date  DATE;',
    '  BEGIN',
    '    v_date := TO_DATE(:P69_EFF_TO,:GLOBAL_DATE_FORMAT);',
    '  EXCEPTION WHEN OTHERS THEN',
    '     :P69_ERROR_FLAG := ''P69_EFF_TO'';',
    '  END;',
    '',
    '  DECLARE',
    '    v_date  DATE;',
    '  BEGIN',
    '    v_date := TO_DATE(:P69_EFF_FROM,:GLOBAL_DATE_FORMAT); ',
    '  EXCEPTION WHEN OTHERS THEN',
    '     :P69_ERROR_FLAG := ''P69_EFF_FROM'';',
    '  END;',
    '',
    'END IF;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7411122163869613529)
,p_event_id=>wwv_flow_imp.id(6671767132635366034)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("detail").show();',
    '// apex.item("find").hide();')))).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P69_SHOW_DATA'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6671767185201366035)
,p_event_id=>wwv_flow_imp.id(6671767132635366034)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(9222850460380130134)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P69_ERROR_FLAG'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6671767700587366040)
,p_event_id=>wwv_flow_imp.id(6671767132635366034)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5972408444621089628)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_APPLUSER_PW_EXP_RQRD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5972409012372089628)
,p_event_id=>wwv_flow_imp.id(5972408444621089628)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P69_APPLUSER_PW_EXP_DAYS,P69_APPLUSER_PW_EXP_DAYS_1',
  'items_to_submit', 'P69_APPLUSER_PW_EXP_RQRD',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :P69_APPLUSER_PW_EXP_RQRD =''N'' then',
    '    :P69_APPLUSER_PW_EXP_DAYS :=0;',
    '    :P69_APPLUSER_PW_EXP_DAYS_1 :=0;',
    'end if;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5972409375262089629)
,p_name=>'P69_APPLUSER_PW_EXP_RQRD'
,p_static_id=>'p69-appluser-pw-exp-rqrd'
,p_event_sequence=>190
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_APPLUSER_PW_EXP_RQRD'
,p_condition_element=>'P69_APPLUSER_PW_EXP_RQRD'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5972409850464089629)
,p_event_id=>wwv_flow_imp.id(5972409375262089629)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_APPLUSER_PW_EXP_DAYS_1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5972410426765089629)
,p_event_id=>wwv_flow_imp.id(5972409375262089629)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P69_APPLUSER_PW_EXP_DAYS_1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6771686546804857775)
,p_name=>'P69_ERROR_FLAG'
,p_static_id=>'p69-error-flag'
,p_event_sequence=>230
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_ERROR_FLAG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6771686682804857776)
,p_event_id=>wwv_flow_imp.id(6771686546804857775)
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
    'var errorFlag= $v(''P69_ERROR_FLAG'');',
    '',
    'if(errorFlag == ''P69_EFF_FROM'') {',
    '// Now show new errors',
    'apex.message.showErrors([',
    '    {',
    '        type:       "error",',
    '        location:   [ "page", "inline" ],',
    '        pageItem:   "P69_EFF_FROM",',
    '        message:    "Eff. From must be a valid date format DD-MM-RRRR.",',
    '        unsafe:     false',
    '    }',
    ']); ',
    '//To stop the further actions from firing',
    'apex.da.cancelEvent.call(this);',
    '}  ',
    '',
    'if(errorFlag == ''P69_EFF_TO'') {',
    '// Now show new errors',
    'apex.message.showErrors([',
    '    {',
    '        type:       "error",',
    '        location:   [ "page", "inline" ],',
    '        pageItem:   "P69_EFF_TO",',
    '        message:    "Eff. To must be a valid date format DD-MM-RRRR.",',
    '        unsafe:     false',
    '    }',
    ']); ',
    '//To stop the further actions from firing',
    'apex.da.cancelEvent.call(this);',
    '}  ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6774354381258938029)
,p_name=>'P69_ERROR_FLAG1'
,p_static_id=>'p69-error-flag-2'
,p_event_sequence=>240
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_ERROR_FLAG1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6774354459732938030)
,p_event_id=>wwv_flow_imp.id(6774354381258938029)
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
    'var errorFlag= $v(''P69_ERROR_FLAG1'');',
    '',
    'if(errorFlag == ''1'') {',
    '// Now show new errors',
    'apex.message.showErrors([',
    '    {',
    '        type:       "error",',
    '        location:   [ "page", "inline" ],',
    '        pageItem:   "P69_EFF_TO",',
    '        message:    "Invalid Date Fromat",',
    '        unsafe:     false',
    '    }',
    ']); ',
    '//To stop the further actions from firing',
    'apex.da.cancelEvent.call(this);',
    '}  ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6774355358675938039)
,p_name=>'P69_FAVOURITE_FLAG'
,p_static_id=>'p69-favourite-flag'
,p_event_sequence=>260
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_FAVOURITE_FLAG'
,p_condition_element=>'P69_FAVOURITE_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6774355743228938043)
,p_event_id=>wwv_flow_imp.id(6774355358675938039)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6774355334949938038)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6774355556764938041)
,p_event_id=>wwv_flow_imp.id(6774355358675938039)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide-2'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6545451116009346373)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6774355458793938040)
,p_event_id=>wwv_flow_imp.id(6774355358675938039)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6774355334949938038)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6774355725886938042)
,p_event_id=>wwv_flow_imp.id(6774355358675938039)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show-2'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6545451116009346373)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5972395339673089610)
,p_name=>'PASSWORD'
,p_static_id=>'password'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_PASSWORD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5972395890315089610)
,p_event_id=>wwv_flow_imp.id(5972395339673089610)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P69_APPLUSER_PASSWORD',
  'items_to_submit', 'P69_APPLUSER_ID,P69_PASSWORD',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    ':P69_APPLUSER_PASSWORD := func_get_hash(:P69_APPLUSER_ID,:P69_PASSWORD);',
    'END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5972392696072089607)
,p_name=>'Password_Expiry_Dtls'
,p_static_id=>'password-expiry-dtls'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5972393206773089607)
,p_event_id=>wwv_flow_imp.id(5972392696072089607)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item( "P69_APPLUSER_PW_EXP_RQRD").hide();',
    'apex.item( "P69_APPLUSER_PW_EXP_DAYS" ).hide();',
    'apex.item( "P69_APPLUSER_PWD_EXP_DUE" ).hide();',
    'apex.item( "P69_APPLUSER_PW_LUD" ).hide();',
    '$x_Hide("hide");')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5972391796443089599)
,p_name=>'POS/DEPT/CUS/SUP'
,p_static_id=>'pos-dept-cus-sup'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_APPLUSER_PARTY_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5972392288127089604)
,p_event_id=>wwv_flow_imp.id(5972391796443089599)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P69_APPLUSER_POS_ID,P69_APPLUSER_DEPT_ID,P69_APPLUSER_EMP_ID,P69_APPLUSER_SUPLR_ID,P69_APPLUSER_CUST_ID,P69_EMP_NAME,P69_DEPARTMENT_NAME,P69_POSITION,P69_APPLUSER_EMAIL_ID,P69_APPLUSER_MOBILE_NO',
  'items_to_submit', 'P69_APPLUSER_ID,P69_APPLUSER_USER_TYPE,P69_APPLUSER_PARTY_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P69_APPLUSER_PARTY_ID IS NOT NULL AND :P69_APPLUSER_USER_TYPE IN (''E'',''R'',''U'',''P'') THEN',
    '	 DECLARE  ',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT emp_emp_id, emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 emp_name,empai_dept_id,(SELECT dept_name1 FROM departments WHERE dept_bu = emp_bu AND dept_id = empai_dept_id)dept_name,empai_pos_id,(SELECT hrpos_pos_name1 FROM hr_p'
||'ositions WHERE hrpos_bu = emp_bu AND hrpos_pos_id = empai_pos_id)pos_name,emp_start_date, emp_email_id,emp_mobile_no',
    '	 	    FROM employees,emp_active_infos WHERE emp_bu  = empai_bu AND emp_emp_id = empai_emp_id AND emp_bu     = :GLOBAL_bu AND emp_emp_id = :P69_APPLUSER_PARTY_ID AND emp_status = ''A'';',
    '	 	     cr1													c1%ROWTYPE;',
    '	 	  CURSOR c4',
    '	 	      IS',
    '	 	  SELECT *',
    '	 	    FROM appl_users WHERE appluser_bu = :GLOBAL_bu AND appluser_id <> :P69_APPLUSER_USER_TYPE AND appluser_emp_id = :P69_APPLUSER_PARTY_ID AND appluser_status NOT IN (''D'');	     ',
    '	 	     cr4 c4%ROWTYPE; 	  ',
    '	 BEGIN',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	    IF c1%NOTFOUND THEN',
    '	 	     RAISE_APPLICATION_ERROR(-20999,''Employee not found.'');',
    '	 	     ELSE',
    '              ',
    ':P69_APPLUSER_EMP_ID := cr1.emp_emp_id;:P69_APPLUSER_POS_ID :=cr1.empai_pos_id;:P69_EMP_NAME:=cr1.emp_name;:P69_APPLUSER_DEPT_ID :=cr1.empai_dept_id; :P69_POSITION:=cr1.pos_name;:P69_APPLUSER_MOBILE_NO :=cr1.emp_mobile_no;:P69_DEPARTMENT_NAME :=cr1.d'
||'ept_name;:P69_APPLUSER_EMAIL_ID :=cr1.emp_email_id;',
    '	 	     END IF; CLOSE c1; END;',
    'END IF;',
    'IF :P69_APPLUSER_PARTY_ID IS NOT NULL AND :P69_APPLUSER_USER_TYPE IN (''C'') THEN',
    '	 DECLARE',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT suplr_suplr_id,suplr_name1',
    '	 	    FROM suppliers',
    '	 	   WHERE suplr_bu      = :GLOBAL_bu',
    '	 	     AND suplr_suplr_id = :P69_APPLUSER_PARTY_ID',
    '             AND SUPLR_CUST_FLAG = ''Y''',
    '	 	     AND suplr_status  = ''A'';',
    '	 	     cr1	c1%ROWTYPE;',
    '	 	  CURSOR c2',
    '	 	      IS',
    '	 	  SELECT * FROM appl_users WHERE appluser_bu = :GLOBAL_bu AND appluser_id <> :P69_APPLUSER_ID AND appluser_cust_id = :P69_APPLUSER_PARTY_ID; ',
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
    ':P69_EMP_NAME             := cr1.suplr_name1;',
    ':P69_APPLUSER_CUST_ID		:= cr1.suplr_suplr_id;',
    '	 	     END IF; CLOSE c1; END;',
    'END IF;',
    'IF :P69_APPLUSER_PARTY_ID IS NOT NULL AND :P69_APPLUSER_USER_TYPE IN (''S'') THEN ',
    '	 DECLARE',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT suplr_suplr_id,suplr_name1',
    '	 	    FROM suppliers',
    '	 	   WHERE suplr_bu      = :GLOBAL_bu',
    '	 	     AND suplr_suplr_id = :P69_APPLUSER_PARTY_ID',
    '             AND SUPLR_SUPLR_FLAG = ''Y''',
    '	 	     AND suplr_status  = ''A'';',
    '	 	     cr1													c1%ROWTYPE;',
    '	 	  CURSOR c2',
    '	 	      IS',
    '	 	  SELECT *',
    '	 	    FROM appl_users',
    '	 	   WHERE appluser_bu = :GLOBAL_bu',
    '	 	     AND appluser_id <> :P69_APPLUSER_ID',
    '	 	     AND appluser_suplr_id = :P69_APPLUSER_PARTY_ID;     ',
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
    ':P69_EMP_NAME :=cr1.suplr_name1;',
    ':P69_APPLUSER_SUPLR_ID		:= cr1.suplr_suplr_id;  ',
    '	 	     END IF;  CLOSE c1;	    END;  END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5972399840952089617)
,p_name=>'pw_exp_days'
,p_static_id=>'pw-exp-days'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P69_APPLUSER_PW_EXP_DAYS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5972400401819089618)
,p_event_id=>wwv_flow_imp.id(5972399840952089617)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P69_APPLUSER_PWD_EXP_DUE',
  'items_to_submit', 'P69_APPLUSER_PW_EXP_DAYS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P69_APPLUSER_PW_EXP_DAYS > 0 THEN',
    '   :P69_APPLUSER_PWD_EXP_DUE := (TRUNC(SYSDATE) + :P69_APPLUSER_PWD_EXP_DUE) - 1;',
    'ELSE',
    '	 :P69_APPLUSER_PWD_EXP_DUE:= NULL;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7411122669709613534)
,p_name=>'Search'
,p_static_id=>'search'
,p_event_sequence=>280
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7411122549780613533)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7411122835271613535)
,p_event_id=>wwv_flow_imp.id(7411122669709613534)
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5972389351887089587)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT case APPLUSER_STATUS when ''A'' then ''<span style="color:green">Active</span>''',
'                            when ''D'' then ''<span style="color:red">Inactive</span>'' ',
'                            when ''N'' then ''<span style="color:Blue">New</span>'' end as "APPLUSER_STATUS "',
'        into :P69_APPLUSER_STATUS_1',
'        FROM APPL_USERS',
'            WHERE APPLUSER_BU=:GLOBAL_BU',
'            AND ROWID=:P69_ROWID;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>490427516343478559
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5972389025325089585)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pre_insert'
,p_static_id=>'pre-insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P69_APPLUSER_PARTY_ID is not null then',
'',
'        SELECT (SELECT hrpos_pos_name1 FROM hr_positions WHERE hrpos_bu = APPLUSER_BU AND hrpos_pos_id = APPLUSER_POS_ID)pos_name,',
'               (SELECT dept_name1 FROM departments WHERE dept_bu = APPLUSER_BU AND dept_id = APPLUSER_DEPT_ID)dept_name,',
'               APPLUSER_PASSWORD, APPLUSER_PW_EXP_DAYS,',
'               (select  emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 from employees',
'                    where emp_emp_id=APPLUSER_PARTY_ID',
'                        and emp_bu=:global_bu)Emp_Name',
'            into :P69_DEPARTMENT_NAME , :P69_POSITION, :P69_PASSWORD ,:P69_APPLUSER_PW_EXP_DAYS_1,:P69_EMP_NAME',
'        FROM APPL_USERS',
'            WHERE APPLUSER_BU=:GLOBAL_BU',
'            AND APPLUSER_EMP_ID = :P69_APPLUSER_PARTY_ID;',
'end if;',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>490427189781478557
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5998692107576087964)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Download'
,p_static_id=>'process-for-download'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_qry         CLOB;',
'  v_qry_seq      NUMBER;',
'  v_fname       VARCHAR2(100);',
'BEGIN',
'',
'proc_apex_ir_report_export(:GLOBAL_bu,:app_id,:app_page_id,''User_Access'',:app_session,:GLOBAL_user,v_qry);',
'',
'SELECT jva_exl_seq.NEXTVAL INTO v_qry_seq FROM dual;',
'',
'    INSERT INTO excel_generate_query (',
'        egq_no,',
'        egq_query,',
'        egq_bus_fun,',
'        egq_cre_by,',
'        egq_cre_date,',
'        egq_sheet_name',
'    ) VALUES (',
'        v_qry_seq,',
'        v_qry,',
'        :app_page_id,',
'        :GLOBAL_USER,',
'        SYSDATE,',
'        ''Current Bus. Fun. Access''',
'    );',
'    ',
'    COMMIT; ',
'    proc_apex_java_excel(v_qry_seq,',
'                               ''C_DIR'',',
'							   :GLOBAL_FILE_NAME,',
'							   :GLOBAL_user,',
'                               :global_bu,',
'                               :app_id,',
'                               :app_page_id,',
'                               :app_session,',
'                               ''"Current Bus. Fun. Access"'',',
'							   ''RMQC27'',',
'							   ''RMQC27'',',
'							   :global_db);',
'--Raise_Application_Error(-20999,v_qry_seq||''/''||:GLOBAL_FILE_NAME||''/''||:GLOBAL_user||''/''||:global_bu||''/''||:app_id||''/''||:app_page_id||''/''||:app_session||''/''||:global_schema||''/''||:global_schema_pass||''/''||:global_db);',
'EXCEPTION',
'  WHEN OTHERS THEN',
'    proc_apex_err_msg_log(:APP_PAGE_ID,''TEXT'');',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5998691940540087963)
,p_internal_uid=>516730272032476936
);
wwv_flow_imp.component_end;
end;
/
