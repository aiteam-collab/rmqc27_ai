prompt --application/pages/page_00081
begin
--   Manifest
--     PAGE: 00081
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
 p_id=>81
,p_name=>'Unit Access'
,p_alias=>'PLANT-ACCESS-HD1'
,p_step_title=>'Unit Access'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#addbtn{',
'        color: blue;',
'        background-color: rgba(0, 0, 0, 0.15);',
'}',
'',
'#savebtn{',
'                color: green;',
'                background-color: rgba(0, 0, 0, 0.15);',
'}',
'#cancelbtn{',
'                color: rgb(214, 19, 29);',
'                background-color: rgba(0, 0, 0, 0.15);',
'}',
'/*',
'#Clear{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 0px;',
'   background-repeat: no-repeat;',
'   background-color: rgba(0, 0, 0, 0.15);',
'   background-size: 32px;',
'   width: 32px;',
'   height: 25px;',
'   top: -4px;',
'}',
'*/',
'#Clear {',
'    background-image: url(r/erp/800/files/static/v162/clearclear-removebg-preview.png);',
'    background-position: 0px 3px;',
'    background-repeat: no-repeat;',
'    background-color: rgba(0, 0, 0, 0.15);',
'    background-size: 36px;',
'    width: 40px;',
'    height: 31px;',
'    /* padding-top: 23px; */',
'    top: -1px;',
'}',
'/* #Clear{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: rgba(0, 0, 0, 0.15);',
'   background-size: 35px;',
'   width: 40px;',
'   height: 30px;',
'   top: -3px;',
'} */',
'.t-Button--success {',
'    --a-button-background-color: #e0e0e0;',
'     --a-button-text-color: #047827; ',
'    --a-button-hover-background-color: #e0e0e0;',
'    --a-button-hover-text-color: var(--a-button-text-color);',
'    /* --a-button-active-background-color: #307323; */',
'     --a-button-active-background-color: #e0e0e0;',
'    --a-button-active-text-color: var(--a-button-hover-text-color);',
'    --a-button-focus-background-color: var(--a-button-hover-background-color);',
'    --a-button-focus-text-color: var(--a-button-hover-text-color);',
'}',
'',
'',
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
' ',
' a {',
'    color: #337AC0;',
' }',
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6073907645790106234)
,p_plug_name=>'Unit Access'
,p_static_id=>'unit-access'
,p_region_name=>'unit'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select AUBA_BU,',
'       AUBA_USER_ID,',
'       AUBA_PLANT,',
'       Unit_Name,',
'       TO_CHAR(AUBA_FROM,func_find_date_format(:GLOBAL_BU))"Eff. From",',
'       TO_CHAR(AUBA_TO,func_find_date_format(:GLOBAL_BU))"Eff. To",',
'       AUBA_DEFLT_FLAG,',
'       AUBA_CRE_BY,',
'       AUBA_CRE_IP_ADDR,',
'       AUBA_CRE_OS_USER,',
'       AUBA_CRE_DATE,',
'       AUBA_UPD_BY,',
'       AUBA_UPD_IP_ADDR,',
'       AUBA_UPD_OS_USER,',
'       AUBA_UPD_DATE,',
'       AUBA_CRE_EMP_ID,',
'       AUBA_UPD_EMP_ID,',
'       AUBA_PLNT_LOC_ID,',
'       Loc_name,',
'       Emp_id,',
'       Emp_name,',
'       Designation,',
'       Department,',
'       AUBA_ACCS_DOC_NO,',
'       AUBA_ACCS_DOC_DATE,',
'       AUBA_APPR_BY,',
'       AUBA_APPR_DATE,',
'       appluser_user_type,',
'       DECODE(appluser_user_type,''R'',''ERP Admin'',',
'                                 ''E'',''ERP User'',',
'                                 ''U'',''ESS User'',',
'                                 ''P'',''POS User'',',
'                                 ''C'',''Customer'',',
'                                 ''S'',''Supplier'',',
'                                 ''O'',''Concurrent User'')User_type ',
'from(',
'select AUBA_BU,',
'       AUBA_USER_ID,',
'       AUBA_PLANT,',
'       (SELECT bup_name1',
'        FROM bus_unit_plants',
'       WHERE bup_bu = AUBA_BU AND bup_plant_id = AUBA_PLANT) Unit_Name,',
'       AUBA_FROM,',
'       AUBA_TO,',
'       AUBA_DEFLT_FLAG,',
'       AUBA_CRE_BY,',
'       AUBA_CRE_IP_ADDR,',
'       AUBA_CRE_OS_USER,',
'       AUBA_CRE_DATE,',
'       AUBA_UPD_BY,',
'       AUBA_UPD_IP_ADDR,',
'       AUBA_UPD_OS_USER,',
'       AUBA_UPD_DATE,',
'       AUBA_CRE_EMP_ID,',
'       AUBA_UPD_EMP_ID,',
'       AUBA_PLNT_LOC_ID,',
'       (select bupld_loc_name',
'        FROM bus_unit_plants_loc_dtls',
'       WHERE bupld_bu = AUBA_BU',
'       and bupld_loc_id = AUBA_PLNT_LOC_ID)Loc_name,',
'       (SELECT emp_emp_id',
'		   FROM employees,',
'	 	         emp_active_infos,',
'	 	         appl_users',
'	 	   WHERE emp_bu     = empai_bu',
'	 	     AND emp_emp_id = empai_emp_id',
'	 	     AND emp_bu     = appluser_bu',
'	 	     AND emp_emp_id = appluser_emp_id',
'	 	     AND emp_bu     = :GLOBAL_bu',
'	 	     AND appluser_id = AUBA_USER_ID)Emp_id,',
'       (SELECT LTRIM(RTRIM(emp_first_name1)) || '' '' || LTRIM(RTRIM(emp_middle_name1)) || '' '' || LTRIM(RTRIM(emp_last_name1)) emp_name',
'	 	    FROM employees,',
'	 	         emp_active_infos,',
'	 	         appl_users',
'	 	   WHERE emp_bu      = empai_bu',
'	 	     AND emp_emp_id  = empai_emp_id',
'	 	     AND emp_bu      = appluser_bu',
'	 	     AND emp_emp_id  = appluser_emp_id',
'	 	     AND emp_bu      = :GLOBAL_bu',
'	 	     AND appluser_id = AUBA_USER_ID)Emp_name,',
'       (SELECT Position_name ',
'           FROM',
'          (SELECT empai_pos_id,',
'                (SELECT hrpos_pos_name1',
'                    FROM hr_positions',
'                   WHERE hrpos_bu     = empai_bu',
'                     AND hrpos_pos_id = empai_pos_id)Position_name',
'	 	    FROM employees,',
'	 	         emp_active_infos,',
'	 	         appl_users',
'	 	   WHERE emp_bu     = empai_bu',
'	 	     AND emp_emp_id = empai_emp_id',
'	 	     AND emp_bu     = appluser_bu',
'	 	     AND emp_emp_id = appluser_emp_id',
'	 	     AND emp_bu     = :GLOBAL_bu',
'	 	     AND appluser_id = AUBA_USER_ID))Designation,',
'                  (SELECT Department_name ',
'           FROM ',
'           (SELECT empai_dept_id,',
'              (SELECT dept_name1',
'                  FROM departments',
'                 WHERE dept_bu = empai_bu',
'                   AND dept_id = empai_dept_id)Department_name',
'	 	    FROM employees,',
'	 	         emp_active_infos,',
'	 	         appl_users',
'	 	   WHERE emp_bu      = empai_bu',
'	 	     AND emp_emp_id  = empai_emp_id',
'	 	     AND emp_bu      = appluser_bu',
'	 	     AND emp_emp_id  = appluser_emp_id',
'	 	     AND emp_bu      = :GLOBAL_bu',
'	 	     AND appluser_id = AUBA_USER_ID))Department,',
'          AUBA_ACCS_DOC_NO,',
'          AUBA_ACCS_DOC_DATE,',
'          AUBA_APPR_BY,',
'          AUBA_APPR_DATE,',
'          (SELECT  appluser_user_type',
'	 	    FROM employees,',
'	 	         emp_active_infos,',
'	 	         appl_users',
'	 	   WHERE emp_bu      = empai_bu',
'	 	     AND emp_emp_id  = empai_emp_id',
'	 	     AND emp_bu      = appluser_bu',
'	 	     AND emp_emp_id  = appluser_emp_id',
'	 	     AND emp_bu      = :GLOBAL_bu',
'	 	     AND appluser_id = AUBA_USER_ID)appluser_user_type',
'  from APPL_USER_PLANT_ACCESS',
' WHERE AUBA_USER_ID IN (SELECT appluser_id',
'                            FROM appl_users ',
'                           WHERE appluser_bu = :GLOBAL_BU)',
'  AND ( :P81_USER_TYPE IN (SELECT appluser_user_type',
'                            FROM appl_users',
'                           WHERE appluser_id = AUBA_USER_ID) OR :P81_USER_TYPE IS NULL)',
'  AND ((TO_DATE(AUBA_FROM,func_find_date_format(:GLOBAL_BU))   BETWEEN TO_DATE(:P81_EFF_FROM,func_find_date_format(:GLOBAL_BU)) AND TO_DATE(:P81_EFF_TO,func_find_date_format(:GLOBAL_BU))) ',
'     OR (TO_DATE(AUBA_TO,func_find_date_format(:GLOBAL_BU))    BETWEEN TO_DATE(:P81_EFF_FROM,func_find_date_format(:GLOBAL_BU)) AND TO_DATE(:P81_EFF_TO,func_find_date_format(:GLOBAL_BU)))',
'     OR (TO_DATE(AUBA_FROM,func_find_date_format(:GLOBAL_BU))    >= TO_DATE(:P81_EFF_FROM,func_find_date_format(:GLOBAL_BU)) AND TO_DATE(:P81_EFF_FROM,func_find_date_format(:GLOBAL_BU)) IS NOT NULL AND TO_DATE(:P81_EFF_FROM,func_find_date_format(:GLO'
||'BAL_BU)) IS NULL)',
'      OR (TO_DATE(AUBA_TO,func_find_date_format(:GLOBAL_BU))      <= TO_DATE(:P81_EFF_TO,func_find_date_format(:GLOBAL_BU)) AND TO_DATE(:P81_EFF_TO,func_find_date_format(:GLOBAL_BU)) IS NULL AND TO_DATE(:P81_EFF_TO,func_find_date_format(:GLOBAL_BU)) '
||'IS NOT NULL)',
'      OR (:P81_EFF_FROM IS NULL AND :P81_EFF_TO IS NULL)))',
'  where (INSTR(UPPER(auba_user_id),UPPER(:P81_SEARCH)) > 0 OR :P81_SEARCH IS NULL) ',
'    AND ((INSTR(UPPER(auba_plant),UPPER(:P81_UNIT)) > 0  OR :P81_UNIT IS NULL)',
'       OR (INSTR(UPPER((Unit_Name)),UPPER(TRIM(:P81_UNIT))) > 0))',
'    AND ((INSTR(UPPER(AUBA_PLNT_LOC_ID),UPPER(:P81_UNIT_LOC)) > 0  OR :P81_UNIT_LOC IS NULL)',
'       OR (INSTR(UPPER((Loc_name)),UPPER(TRIM(:P81_UNIT_LOC))) > 0))',
'    AND (INSTR(UPPER(Designation),UPPER(:P81_DESIGNATION)) > 0 OR :P81_DESIGNATION IS NULL)',
'    AND (INSTR(UPPER(Department),UPPER(:P81_DEPARTMENT)) > 0 OR :P81_DEPARTMENT IS NULL)',
'    AND ((INSTR(UPPER(Emp_id),UPPER(:P81_EMP_ID)) > 0  OR :P81_EMP_ID IS NULL)',
'       OR (INSTR(UPPER((Emp_name)),UPPER(TRIM(:P81_EMP_ID))) > 0))',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P81_SEARCH,P81_EFF_FROM,P81_EFF_TO,P81_UNIT_LOC,P81_UNIT,P81_DESIGNATION,P81_DEPARTMENT,P81_USER_TYPE,P81_EMP_ID'
,p_plug_display_condition_type=>'NEVER'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Unit Access'
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
 p_id=>wwv_flow_imp.id(6535258166291794870)
,p_name=>'APPLUSER_USER_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPLUSER_USER_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'User Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>300
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6535257892353794867)
,p_name=>'AUBA_ACCS_DOC_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUBA_ACCS_DOC_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Doc.  Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_imp.id(6535257779400794866)
,p_name=>'AUBA_ACCS_DOC_NO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUBA_ACCS_DOC_NO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Souce Doc. No.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>40
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
 p_id=>wwv_flow_imp.id(6535257980570794868)
,p_name=>'AUBA_APPR_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUBA_APPR_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Approved by'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>60
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
 p_id=>wwv_flow_imp.id(6535258073771794869)
,p_name=>'AUBA_APPR_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUBA_APPR_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Approved Date'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>290
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_imp.id(6077299647179250329)
,p_name=>'AUBA_BU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUBA_BU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6077300328663250335)
,p_name=>'AUBA_CRE_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUBA_CRE_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Created By'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6077300566648250338)
,p_name=>'AUBA_CRE_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUBA_CRE_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Created Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6077301128592250343)
,p_name=>'AUBA_CRE_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUBA_CRE_EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>270
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6077300403083250336)
,p_name=>'AUBA_CRE_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUBA_CRE_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(6077300534865250337)
,p_name=>'AUBA_CRE_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUBA_CRE_OS_USER'
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
 p_id=>wwv_flow_imp.id(6077300137089250334)
,p_name=>'AUBA_DEFLT_FLAG'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUBA_DEFLT_FLAG'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Default'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6077299873986250331)
,p_name=>'AUBA_PLANT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUBA_PLANT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6077301289425250345)
,p_name=>'AUBA_PLNT_LOC_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUBA_PLNT_LOC_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Location'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>10
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6077300708668250339)
,p_name=>'AUBA_UPD_BY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUBA_UPD_BY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6077300994531250342)
,p_name=>'AUBA_UPD_DATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUBA_UPD_DATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>260
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6077301207270250344)
,p_name=>'AUBA_UPD_EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUBA_UPD_EMP_ID'
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
 p_id=>wwv_flow_imp.id(6077300777545250340)
,p_name=>'AUBA_UPD_IP_ADDR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUBA_UPD_IP_ADDR'
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
 p_id=>wwv_flow_imp.id(6077300849987250341)
,p_name=>'AUBA_UPD_OS_USER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUBA_UPD_OS_USER'
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
 p_id=>wwv_flow_imp.id(6077299775076250330)
,p_name=>'AUBA_USER_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AUBA_USER_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'User'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>20
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6535257638583794865)
,p_name=>'DEPARTMENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEPARTMENT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Department'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
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
 p_id=>wwv_flow_imp.id(6535257579207794864)
,p_name=>'DESIGNATION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESIGNATION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Designation'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6536559969286566734)
,p_name=>'EMP_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMP_ID'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Emp./Party ID'
,p_heading_alignment=>'CENTER'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6536560072298566735)
,p_name=>'EMP_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMP_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Emp./Party Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>122
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
 p_id=>wwv_flow_imp.id(6535258394617794872)
,p_name=>'Eff. From'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Eff. From'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eff. From'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>75
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
 p_id=>wwv_flow_imp.id(6535258467041794873)
,p_name=>'Eff. To'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Eff. To'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Eff. To'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>75
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
 p_id=>wwv_flow_imp.id(6077301567116250348)
,p_name=>'LOC_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOC_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Location Name'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6083148226925499530)
,p_name=>'UNIT_NAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT_NAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit Desc.'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(6535258237075794871)
,p_name=>'USER_TYPE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'USER_TYPE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'User Type'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(6073907785007106235)
,p_internal_uid=>591945949463495207
,p_is_editable=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
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
 p_id=>wwv_flow_imp.id(6074687832737743093)
,p_interactive_grid_id=>wwv_flow_imp.id(6073907785007106235)
,p_static_id=>'5927260'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_rows_per_page=>10
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(6074687975624743095)
,p_report_id=>wwv_flow_imp.id(6074687832737743093)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5482051355989869784)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(6535258166291794870)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5482052356501869797)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(6535258237075794871)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>153
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(5488508498563847047)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(6083148226925499530)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>166
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6077305859169250907)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(6077299647179250329)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6077306832872250923)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(6077299775076250330)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>197
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6077307697430250932)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(6077299873986250331)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6077310415126250954)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(6077300137089250334)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>66
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6077311317921250962)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(6077300328663250335)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>191
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6077312102830250968)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(6077300403083250336)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>133.4375
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6077313004641250979)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(6077300534865250337)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6077313885671250988)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(6077300566648250338)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6077314774210250996)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(6077300708668250339)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6077315733731251006)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(6077300777545250340)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6077316552791251013)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(6077300849987250341)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6077317522961251020)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(6077300994531250342)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6077318395746251028)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(6077301128592250343)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6077319313125251038)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(6077301207270250344)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6077320218044251045)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(6077301289425250345)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6077408590096324320)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(6077301567116250348)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>243
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6536631886551652848)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(6536559969286566734)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6536632746054652865)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(6536560072298566735)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>209
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6536642451342705821)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(6535257579207794864)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>193
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6536643336204705837)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(6535257638583794865)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>178
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6536647649586721104)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(6535257779400794866)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>159
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6536648630649721115)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(6535257892353794867)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>121
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6536650295084725968)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(6535257980570794868)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6536651226795725984)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(6535258073771794869)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6536788705304062274)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(6535258394617794872)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(6536789598696062287)
,p_view_id=>wwv_flow_imp.id(6074687975624743095)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(6535258467041794873)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>108
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11053662791247994118)
,p_plug_name=>'User Unit'
,p_static_id=>'user-unit'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rowid_hd,',
'       wupah_doc_no,',
'       wupah_doc_date,',
'       wupah_user_id,',
'       appluser_user_type,',
'       doc_type,',
'       wupal_plnt_loc_id,',
'       wupal_plnt_loc_name,',
'       wupal_plnt_id,',
'       wupal_plnt_name,',
'       wupal_date_from,',
'       wupal_date_to,',
'       emp_emp_id,',
'       emp_name,',
'       Designation,',
'       Department,',
'       wupah_status,',
'       color',
'  FROM (',
'SELECT (select rowid ',
'          from WAPL_USER_PLNT_ACCESS_HD',
'         where WUPAH_BU  = wupal_bu',
'           and WUPAH_DOC_NO = wupal_doc_no) rowid_hd,',
'       wupah_bu,',
'       wupah_doc_no,',
'       wupah_doc_date,',
'       wupal_seq_no,',
'       wupah_user_id,',
'       DECODE(appluser_user_type,''R'',''ERP Admin'',''E'',''ERP User'',''U'',''ESS User'',''S'',''Supplier'',''C'',''Customer'',''P'',''POS User'',''O'',''Concurrent User'')appluser_user_type,',
'       DECODE(wupah_type,''R'',''Remove Unit Access'',''A'',''Add Unit Access'',''E'',''Extend Duration'',''C'',''Copy Unit Access'') as doc_type,',
'       wupal_plnt_loc_id,',
'       (SELECT bupld_loc_name',
'          FROM bus_unit_plants_loc_dtls',
'         WHERE bupld_bu = wupal_bu',
'           AND bupld_loc_id = wupal_plnt_loc_id',
'           AND bupld_plnt = wupal_plnt_id) wupal_plnt_loc_name,',
'       wupal_plnt_id,',
'       (SELECT bup_name1',
'          FROM bus_unit_plants',
'         WHERE bup_bu = wupah_bu ',
'           AND bup_plant_id = wupal_plnt_id ) wupal_plnt_name,',
'       wupal_date_from,',
'       wupal_date_to,',
'       wupal_sel_flag,',
'       wupah_cre_by,',
'       wupah_cre_date,',
'       wupah_appr_by,',
'       wupah_appr_date',
'       emp_emp_id,',
'       emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 emp_name,',
'       empai_bu,',
'       empai_pos_id,',
'      (SELECT hrpos_pos_name1',
'         FROM hr_positions',
'        WHERE hrpos_bu     = empai_bu',
'          AND hrpos_pos_id = empai_pos_id)Designation,',
'       empai_dept_id,',
'      (SELECT dept_name1',
'         FROM departments',
'        WHERE dept_bu = empai_bu',
'          AND dept_id = empai_dept_id)Department,',
'       DECODE(wupah_status,''N'',''New'',''E'',''Entry Completed'',''P'',''Posted'',''C'',''Cancelled'')wupah_status,',
'             CASE wupah_status WHEN ''N'' THEN ''Blue''',
'                               WHEN ''P'' then ''Green''',
'                               WHEN ''C'' then ''Red''',
'                               WHEN ''E'' then ''Orange''',
'       END color',
'     FROM wapl_user_plnt_access_hd,',
'          wapl_user_plnt_access_ln,',
'          emp_active_infos,',
'          employees,',
'          appl_users',
'    WHERE emp_bu      = empai_bu',
'      AND emp_emp_id  = empai_emp_id',
'      AND emp_bu      = appluser_bu',
'      AND emp_emp_id  = appluser_emp_id',
'      AND appluser_id = WUPAH_USER_ID',
'      AND appluser_user_type <> ''O''',
'      AND WUPAH_BU    = :GLOBAL_bu',
'      AND wupah_bu       = wupal_bu',
'      AND wupah_doc_no   = wupal_doc_no',
'      AND wupah_status NOT IN (''L'',''C'')',
'      AND ((wupah_status = ''P'' AND wupal_sel_flag = ''Y'')',
'       OR wupah_status   = ''N''))',
'    WHERE (wupah_user_id = :P81_USER_ID OR :P81_USER_ID IS NULL)',
'      AND (wupah_doc_no  = :P81_DOC_NO OR :P81_DOC_NO IS NULL)',
'      AND (appluser_user_type = :P81_USER_TYPE OR :P81_USER_TYPE IS NULL)',
'      AND (doc_type   = :P81_DOC_TYPE OR :P81_DOC_TYPE IS NULL)',
'      AND (wupah_status = :P81_STATUS OR :P81_STATUS IS NULL)',
'      AND ((INSTR(UPPER(wupal_plnt_loc_id),UPPER(:P81_LOCATION)) > 0  OR :P81_LOCATION IS NULL)',
'       OR (INSTR(UPPER((wupal_plnt_loc_name)),UPPER(TRIM(:P81_LOCATION))) > 0))',
'      AND ((INSTR(UPPER(wupal_plnt_id),UPPER(:P81_UNIT)) > 0  OR :P81_UNIT IS NULL)',
'       OR (INSTR(UPPER((wupal_plnt_name)),UPPER(TRIM(:P81_UNIT))) > 0))',
'      AND ((INSTR(UPPER(emp_emp_id),UPPER(TRIM(:P81_APPLUSER_EMP_ID))) > 0 )',
'       OR (INSTR(UPPER((emp_name)),UPPER(TRIM(:P81_APPLUSER_EMP_ID))) > 0)',
'       OR :P81_APPLUSER_EMP_ID IS NULL)',
'    ORDER BY wupah_doc_no desc;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P81_USER,P81_BENIFICIARY,P81_DOC_NO,P81_DOC_DATE,P81_LOCATION,P81_UNIT,P81_DOC_TYPE,P81_USER_TYPE'
,p_prn_page_header=>'User Unit'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(11053662890012994118)
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
,p_internal_uid=>5571701054469383090
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7837592676074444079)
,p_db_column_name=>'APPLUSER_USER_TYPE'
,p_display_order=>30
,p_column_identifier=>'AP'
,p_column_label=>'User Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8893765324743038031)
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
 p_id=>wwv_flow_imp.id(7837593634264444088)
,p_db_column_name=>'DEPARTMENT'
,p_display_order=>70
,p_column_identifier=>'AY'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7837593535306444087)
,p_db_column_name=>'DESIGNATION'
,p_display_order=>60
,p_column_identifier=>'AX'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10058630496932460798)
,p_db_column_name=>'DOC_TYPE'
,p_display_order=>150
,p_column_identifier=>'AD'
,p_column_label=>'Doc. Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7837593421436444086)
,p_db_column_name=>'EMP_EMP_ID'
,p_display_order=>40
,p_column_identifier=>'AW'
,p_column_label=>'Emp./Party ID'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(10058630199786460796)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>50
,p_column_identifier=>'AB'
,p_column_label=>'Emp./Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7828737542417710588)
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
 p_id=>wwv_flow_imp.id(7837592539604444077)
,p_db_column_name=>'WUPAH_DOC_DATE'
,p_display_order=>130
,p_column_identifier=>'AN'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7837592436449444076)
,p_db_column_name=>'WUPAH_DOC_NO'
,p_display_order=>10
,p_column_identifier=>'AM'
,p_column_label=>'Source Doc. No.'
,p_column_link=>'f?p=&APP_ID.:83:&SESSION.::&DEBUG.::P83_ROWID:#ROWID_HD#'
,p_column_linktext=>'#WUPAH_DOC_NO#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7837593759886444089)
,p_db_column_name=>'WUPAH_STATUS'
,p_display_order=>140
,p_column_identifier=>'AZ'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#COLOR#; font-weight:bold;">#WUPAH_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7837592577925444078)
,p_db_column_name=>'WUPAH_USER_ID'
,p_display_order=>20
,p_column_identifier=>'AO'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7837593249055444084)
,p_db_column_name=>'WUPAL_DATE_FROM'
,p_display_order=>180
,p_column_identifier=>'AU'
,p_column_label=>'Wupal Date From'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7837593355053444085)
,p_db_column_name=>'WUPAL_DATE_TO'
,p_display_order=>190
,p_column_identifier=>'AV'
,p_column_label=>'Wupal Date To'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7837592969580444082)
,p_db_column_name=>'WUPAL_PLNT_ID'
,p_display_order=>100
,p_column_identifier=>'AS'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7837592825869444080)
,p_db_column_name=>'WUPAL_PLNT_LOC_ID'
,p_display_order=>80
,p_column_identifier=>'AQ'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7837592907137444081)
,p_db_column_name=>'WUPAL_PLNT_LOC_NAME'
,p_display_order=>90
,p_column_identifier=>'AR'
,p_column_label=>'Location Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7837593119372444083)
,p_db_column_name=>'WUPAL_PLNT_NAME'
,p_display_order=>110
,p_column_identifier=>'AT'
,p_column_label=>'Unit Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11053674971460998086)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'10523865'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WUPAH_DOC_NO:WUPAH_USER_ID:APPLUSER_USER_TYPE:EMP_EMP_ID:EMP_NAME:DESIGNATION:DEPARTMENT:WUPAL_PLNT_LOC_ID:WUPAL_PLNT_LOC_NAME:WUPAL_PLNT_ID:WUPAL_PLNT_NAME:WUPAH_DOC_DATE:WUPAH_STATUS:DOC_TYPE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6657341220107645468)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11053662791247994118)
,p_button_name=>'ADD'
,p_static_id=>'add'
,p_button_static_id=>'addbtn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:83:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6073909372548106251)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6073907645790106234)
,p_button_name=>'Add'
,p_static_id=>'add-2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:83:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6548961251318079229)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6073907645790106234)
,p_button_name=>'Download'
,p_static_id=>'download'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Download'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6657341048091645467)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11053662791247994118)
,p_button_name=>'New'
,p_static_id=>'new'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'New'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:211132016:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6545450765152346370)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6073907645790106234)
,p_button_name=>'Reset'
,p_static_id=>'reset'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Reset'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6081567376395479193)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6073907645790106234)
,p_button_name=>'Search'
,p_static_id=>'search'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:80:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6536559761629566732)
,p_name=>'P81_DEPARTMENT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6073907645790106234)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6536559708539566731)
,p_name=>'P81_DESIGNATION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6073907645790106234)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6077303693259250369)
,p_name=>'P81_EFF_FROM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6073907645790106234)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6077303787008250370)
,p_name=>'P81_EFF_TO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6073907645790106234)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6536559584880566730)
,p_name=>'P81_EMP_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6073907645790106234)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6077301394487250346)
,p_name=>'P81_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6073907645790106234)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6536559442079566729)
,p_name=>'P81_UNIT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6073907645790106234)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6077303929871250371)
,p_name=>'P81_UNIT_LOC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6073907645790106234)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6536559874177566733)
,p_name=>'P81_USER_TYPE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6073907645790106234)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6488224351323919958)
,p_name=>'Download'
,p_static_id=>'download'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6548961251318079229)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6488224494320919959)
,p_event_id=>wwv_flow_imp.id(6488224351323919958)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region( "unit" ).call( "getActions" ).lookup("show-download-dialog").action(); ')).to_clob
);
wwv_flow_imp.component_end;
end;
/
