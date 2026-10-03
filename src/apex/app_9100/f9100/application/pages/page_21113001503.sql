prompt --application/pages/page_21113001503
begin
--   Manifest
--     PAGE: 21113001503
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
 p_id=>21113001503
,p_name=>'Application Users'
,p_alias=>'USER-LIST'
,p_step_title=>'Application Users'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'slideclose();'
,p_css_file_urls=>'#WORKSPACE_FILES#FindMenuCSS#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
'#F{',
'                color: rgb(214, 19, 29);',
'                background-color: #ffffff;',
'}',
'',
'#q{',
'                color: rgb(8, 1, 1);',
'                background-color: #ffffff;',
'}',
'',
'',
'#fav',
'{',
'color: #ff0000;',
'background-color: rgba(255, 255, 255, 0.15)',
'};',
'',
'',
'#cancelbtn{',
'        color: rgb(214, 19, 29);',
'        background-color:  #ffffff;',
'}',
'',
'#cancelbtn1{',
'         color: rgb(214, 19, 29);',
'         background-color: #ffffff;',
'}',
'',
'',
'',
'',
'',
'',
'/*#fav',
'{',
'color: #ff0000;',
'background-color: #ffffff',
'};*/',
'',
'/* a {',
'    color: #4c9ff1;',
'} */',
'/* ',
'#Clear{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: rgba(0, 0, 0, 0.15);',
'   background-size: 25px;',
'   width: 27px;',
'   height: 24px;',
'   top: 0px;',
'}',
'',
'.t-Button--success {',
'    --a-button-background-color: #e0e0e0;',
'     --a-button-text-color: #047827; ',
'    --a-button-hover-background-color: #e0e0e0;',
'    --a-button-hover-text-color: var(--a-button-text-color);',
'     --a-button-active-background-color: #e0e0e0;',
'    --a-button-active-text-color: var(--a-button-hover-text-color);',
'    --a-button-focus-background-color: var(--a-button-hover-background-color);',
'    --a-button-focus-text-color: var(--a-button-hover-text-color);',
'}',
'  */',
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
' } ',
'',
'',
'/* Region background-color By Prasanth M */',
'/* ',
'.t-Region {',
'    display: block;',
'    border-width: var(--ut-region-border-width, var(--ut-component-border-width, 1px));',
'    border-style: solid;',
'    border-radius: var(--ut-region-border-radius, var(--ut-component-border-radius));',
'    box-shadow: var(--ut-region-box-shadow, var(--ut-component-box-shadow));',
'    margin-bottom: var(--ut-region-margin, 16px);',
'    background-color: aliceblue;',
'    color: var(--ut-region-text-color, var(--ut-component-text-default-color));',
'    font-size: var(--ut-region-font-size, 14px);',
'    line-height: var(--ut-region-line-height, 20px);',
'} */',
'',
'/* Item Spase */',
'.t-Form-fieldContainer--floatingLabel.t-Form-fieldContainer {',
'    display: flex;',
'    padding: 0.5rem;',
'    align-items: flex-start;',
'}'))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10778373810601451267)
,p_plug_name=>'<b>Find User</b>'
,p_static_id=>'b-find-user-b'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--leftLabels'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8150276001759179429)
,p_plug_name=>'Favorite Button'
,p_static_id=>'favorite-button'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>1
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11412992674855320363)
,p_plug_name=>'Result(s)'
,p_static_id=>'result-s'
,p_region_name=>'detail'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hiddenOverflow'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ROWID,',
'       APPLUSER_BU,',
'       APPLUSER_ID,',
'       APPLUSER_PASSWORD,',
'       TO_CHAR(APPLUSER_EFF_FROM,:GLOBAL_DATE_FORMAT)APPLUSER_EFF_FROM,',
'       TO_CHAR(APPLUSER_EFF_TO,:GLOBAL_DATE_FORMAT)APPLUSER_EFF_TO,',
'       APPLUSER_EMP_ID,',
'       EMP_NAME,',
'       APPLUSER_STATUS,',
'       STATUS_COLOR,',
'       PAGE_NO,',
'       DECODE(APPLUSER_LOCK_CHK,''Y'',''Locked'',''N'',''Unlocked'')APPLUSER_LOCK_CHK,',
'       APPLUSER_USER_TYPE,',
'       APPLUSER_EMAIL_ID,',
'       APPLUSER_MOBILE_NO,',
'       APPLUSER_PARTY_TYPE,',
'       APPLUSER_PARTY_ID,',
'       APPLUSER_POS_ID,',
'       POS_DESC,',
'       APPLUSER_DEPT_ID,',
'       DEPT_DESC,',
'       UNIT_NAME,',
'       UNIT_ID,',
'       APPLUSER_USER_TYPE1,',
'       appluser_cre_by,',
'       appluser_cre_date',
'FROM( ',
'select ROWID,',
'       APPLUSER_BU,',
'       APPLUSER_ID,',
'       APPLUSER_PASSWORD,',
'       APPLUSER_EFF_FROM,',
'       APPLUSER_EFF_TO,',
'       CASE WHEN appluser_user_type NOT IN (''S'',''C'') THEN appluser_emp_id',
'            WHEN appluser_user_type IN (''S'',''T'') THEN appluser_suplr_id ',
'            WHEN appluser_user_type IN (''C'') THEN appluser_cust_id END APPLUSER_EMP_ID,',
'       (Select distinct TRIM(emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1)',
'         from employees',
'        where appluser_bu        = emp_bu',
'          and appluser_emp_id    = emp_emp_id',
'          and appluser_user_type NOT IN (''S'',''C'')',
'       UNION ALL',
'       SELECT DISTINCT suplr_name1',
'         FROM suppliers',
'        WHERE appluser_bu      = suplr_bu',
'          AND suplr_party_type IN(''S'')',
'          AND suplr_suplr_id   = appluser_suplr_id',
'          AND appluser_user_type IN (''S'',''T'')',
'       UNION ALL',
'       SELECT DISTINCT suplr_name1',
'         FROM suppliers',
'        WHERE appluser_bu      = suplr_bu',
'          AND suplr_party_type = ''C''',
'          AND suplr_suplr_id   = appluser_cust_id',
'          AND appluser_user_type IN (''C'') )  EMP_NAME,',
'       DECODE(APPLUSER_STATUS,''N'',''Draft'',',
'                              ''E'',''Pending for Active'',',
'                              ''A'',''Active'',',
'                              ''I'',''Pending for Deactive'',',
'                              ''D'',''Deactive'') APPLUSER_STATUS,',
'       DECODE(APPLUSER_STATUS,''N'',''blue'',',
'                              ''E'',''Orange'',',
'                              ''A'',''green'',',
'                              ''I'',''Brown'',',
'                              ''D'',''Red'') STATUS_COLOR,',
'      CASE WHEN (APPLUSER_STATUS = ''N'' AND (SELECT 1',
'                                            FROM appl_users',
'                                           WHERE appluser_bu = :Global_bu',
'                                             AND appluser_id = :Global_user',
'                                             AND (appluser_user_type <> ''R'' ',
'                                                 OR (appluser_user_type = ''R'' ',
'                                                   AND appluser_emp_id IS NOT NULL)',
'                                                 )) = 1 )',
'            THEN ''21113001502''',
'            WHEN (APPLUSER_STATUS = ''N'' AND (SELECT 1',
'                                               FROM appl_users',
'                                              WHERE appluser_bu = :Global_bu',
'                                                AND (appluser_user_type = ''R'' AND appluser_emp_id IS NULL)',
'                                                AND appluser_id = :Global_user) = 1)',
'            THEN ''93''',
'            WHEN APPLUSER_STATUS <> ''N'' THEN ''2111300151''',
'       END PAGE_NO,',
'       APPLUSER_ACTIVE_DATE,',
'       APPLUSER_DELETE_DATE,',
'       APPLUSER_LOCK_CHK,',
'       DECODE(APPLUSER_USER_TYPE,''R'',''Admin'',',
'                                 ''E'',''Functional'',',
'                                 ''U'',''ESS Portal'',',
'                                 ''P'',''POS User'',',
'                                 ''C'',''Customer Portal'',',
'                                 ''S'',''Supplier Portal'',',
'                                 ''O'',''Role Based User'',',
'                                 ''M'',''Mobile App'',',
'                                 ''L'',''Limited Access User'',',
'                                 ''T'',''Subcontract Portal'',',
'                                 ''D'',''Module Specific'',',
'                                 ''G'',''Management'') APPLUSER_USER_TYPE,',
'       APPLUSER_USER_TYPE APPLUSER_USER_TYPE1,',
'       APPLUSER_EMAIL_ID,',
'       APPLUSER_MOBILE_NO,',
'       APPLUSER_PARTY_TYPE,',
'       APPLUSER_PARTY_ID,',
'       APPLUSER_POS_ID,',
'       (SELECT hrpos_pos_name1',
'	 	  FROM hr_positions',
'	 	 WHERE hrpos_bu = APPLUSER_BU',
'	 	     AND hrpos_pos_id = (SELECT empai_pos_id ',
'                                 FROM emp_active_infos',
'                                WHERE empai_bu = :Global_bu',
'                                  AND empai_emp_id = appluser_emp_id)) POS_DESC,',
'       APPLUSER_DEPT_ID,',
'       (SELECT dept_name1',
'	 	  FROM departments',
'	 	 WHERE dept_bu = APPLUSER_BU',
'	 	   AND dept_id = (SELECT empai_dept_id ',
'                           FROM emp_active_infos',
'                          WHERE empai_bu = :Global_bu',
'                            AND empai_emp_id = appluser_emp_id)) DEPT_DESC,',
'       (SELECT DISTINCT UPPER(eaidv_plnt_desc)',
'           FROM emp_active_info_dtl_view',
'          WHERE eaidv_bu = APPLUSER_BU',
'            AND eaidv_emp_id = APPLUSER_EMP_ID)UNIT_NAME,',
'       (SELECT DISTINCT UPPER(eaidv_plnt)',
'           FROM emp_active_info_dtl_view',
'          WHERE eaidv_bu = APPLUSER_BU',
'            AND eaidv_emp_id = APPLUSER_EMP_ID)UNIT_ID,',
'       APPLUSER_OTP_FLAG,',
'      APPLUSER_OTP_SOURCE,',
'      APPLUSER_ALLOW_CC_USER,',
'      appluser_cre_by,',
'      TO_CHAR(appluser_cre_date,''DD-MM-RRRR HH12:MI PM'') appluser_cre_date',
'  from APPL_USERS ',
'  where APPLUSER_BU = :GLOBAL_BU',
'    and APPLUSER_USER_TYPE <> ''P''',
'    AND (APPLUSER_STATUS = :P21113001503_STATUS OR : P21113001503_STATUS IS NULL)',
'    AND :P21113001503_SHOW_DATA = ''Y''',
')    -- AND APPLUSER_STATUS <> ''D''',
'    WHERE (INSTR(UPPER(APPLUSER_ID),UPPER(:P21113001503_APPLUSER_ID)) > 0 OR :P21113001503_APPLUSER_ID IS NULL) ',
'      AND (APPLUSER_LOCK_CHK = :P21113001503_APPLUSER_LOCK_CHK OR :P21113001503_APPLUSER_LOCK_CHK IS NULL)',
'      AND (APPLUSER_USER_TYPE1 = :P21113001503_APPLUSER_USER_TYPE OR :P21113001503_APPLUSER_USER_TYPE IS NULL)',
'      AND ((((TO_DATE(:P21113001503_APPLUSER_EFF_FROM,:GLOBAL_DATE_FORMAT) BETWEEN TRUNC(APPLUSER_EFF_FROM)  AND TRUNC(APPLUSER_EFF_TO)) ',
'               OR (TO_DATE(:P21113001503_APPLUSER_EFF_TO,:GLOBAL_DATE_FORMAT) BETWEEN TRUNC(APPLUSER_EFF_FROM)  AND TRUNC(APPLUSER_EFF_TO)))',
'               AND :P21113001503_APPLUSER_EFF_TO IS NOT NULL AND :P21113001503_APPLUSER_EFF_FROM IS NOT NULL)',
'            OR (TRUNC(APPLUSER_EFF_FROM)    >= TO_DATE(:P21113001503_APPLUSER_EFF_FROM,:GLOBAL_DATE_FORMAT) AND :P21113001503_APPLUSER_EFF_FROM IS NOT NULL AND :P21113001503_APPLUSER_EFF_TO IS NULL)',
'            OR (TRUNC(APPLUSER_EFF_TO)      <= TO_DATE(:P21113001503_APPLUSER_EFF_TO,:GLOBAL_DATE_FORMAT) AND :P21113001503_APPLUSER_EFF_FROM IS NULL AND :P21113001503_APPLUSER_EFF_TO IS NOT NULL)',
'            OR (:P21113001503_APPLUSER_EFF_FROM IS NULL AND :P21113001503_APPLUSER_EFF_TO IS NULL))',
'      AND ((INSTR(UPPER(APPLUSER_EMP_ID),UPPER(TRIM(:P21113001503_APPLUSER_EMP_ID))) > 0 )',
'            OR (INSTR(UPPER((EMP_NAME)),UPPER(TRIM(:P21113001503_APPLUSER_EMP_ID))) > 0)',
'            OR :P21113001503_APPLUSER_EMP_ID IS NULL) ',
'      AND (INSTR(UPPER(POS_DESC),UPPER(:P21113001503_DESIGNATION)) > 0 OR :P21113001503_DESIGNATION IS NULL)',
'      AND (INSTR(UPPER(DEPT_DESC),UPPER(:P21113001503_DEPARTMENT_NAME)) > 0 OR :P21113001503_DEPARTMENT_NAME IS NULL) ',
'      AND ((INSTR(UPPER(UNIT_ID),UPPER(:P21113001503_UNIT)) > 0  OR :P21113001503_UNIT IS NULL)',
'            OR (INSTR(UPPER((Unit_Name)),UPPER(TRIM(:P21113001503_UNIT))) > 0))',
'  ORDER BY APPLUSER_ID ASC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P21113001503_APPLUSER_ID,P21113001503_APPLUSER_EMP_ID,P21113001503_APPLUSER_USER_TYPE,P21113001503_STATUS,P21113001503_DESIGNATION,P21113001503_DEPARTMENT_NAME,P21113001503_UNIT,P21113001503_APPLUSER_EFF_FROM,P21113001503_APPLUSER_EFF_TO,P21113001503'
||'_CONCURRENT_USER,P21113001503_OTP,P21113001503_OTP_SOURCE,P21113001503_SHOW_DATA,P21113001503_APPLUSER_LOCK_CHK'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Create Appl. Users(Admin)'
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
 p_id=>wwv_flow_imp.id(11412992756153320363)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>5931030920609709335
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8413716850352017124)
,p_db_column_name=>'APPLUSER_BU'
,p_display_order=>199
,p_column_identifier=>'CD'
,p_column_label=>'Appluser Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5615040923384521868)
,p_db_column_name=>'APPLUSER_CRE_BY'
,p_display_order=>219
,p_column_identifier=>'CF'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5615040987064521869)
,p_db_column_name=>'APPLUSER_CRE_DATE'
,p_display_order=>229
,p_column_identifier=>'CG'
,p_column_label=>'Created Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9972748785634747602)
,p_db_column_name=>'APPLUSER_DEPT_ID'
,p_display_order=>65
,p_column_identifier=>'BM'
,p_column_label=>'Appluser Dept Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9062510681645226853)
,p_db_column_name=>'APPLUSER_EFF_FROM'
,p_display_order=>139
,p_column_identifier=>'BX'
,p_column_label=>'Eff. From'
,p_column_html_expression=>'<span style="display:block;width:75px">#APPLUSER_EFF_FROM#</span>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9062510809619226854)
,p_db_column_name=>'APPLUSER_EFF_TO'
,p_display_order=>149
,p_column_identifier=>'BY'
,p_column_label=>'Eff. To'
,p_column_html_expression=>'<span style="display:block;width:75px">#APPLUSER_EFF_TO#</span>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9972746711414747578)
,p_db_column_name=>'APPLUSER_EMAIL_ID'
,p_display_order=>60
,p_column_identifier=>'BH'
,p_column_label=>'Email'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9972725370167747380)
,p_db_column_name=>'APPLUSER_EMP_ID'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Emp./Party Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9972723855440747370)
,p_db_column_name=>'APPLUSER_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'User ID'
,p_column_link=>'f?p=&APP_ID.:#PAGE_NO#:&SESSION.::&DEBUG.::P21113001502_ROWID,P2111300151_ROWID,P93_ROWID:#ROWID#,#ROWID#,#ROWID#'
,p_column_linktext=>'#APPLUSER_ID#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9972726938538747386)
,p_db_column_name=>'APPLUSER_LOCK_CHK'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Account Status '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9972747182664747586)
,p_db_column_name=>'APPLUSER_MOBILE_NO'
,p_display_order=>61
,p_column_identifier=>'BI'
,p_column_label=>'Mobile No.'
,p_column_type=>'STRING'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9972747959721747595)
,p_db_column_name=>'APPLUSER_PARTY_ID'
,p_display_order=>63
,p_column_identifier=>'BK'
,p_column_label=>'Appluser Party Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9972747588407747592)
,p_db_column_name=>'APPLUSER_PARTY_TYPE'
,p_display_order=>62
,p_column_identifier=>'BJ'
,p_column_label=>'Appluser Party Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8413716900329017125)
,p_db_column_name=>'APPLUSER_PASSWORD'
,p_display_order=>209
,p_column_identifier=>'CE'
,p_column_label=>'Appluser Password'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9972748307553747597)
,p_db_column_name=>'APPLUSER_POS_ID'
,p_display_order=>64
,p_column_identifier=>'BL'
,p_column_label=>'Position ID'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9972725739390747380)
,p_db_column_name=>'APPLUSER_STATUS'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Status'
,p_column_html_expression=>'<span style="color:#STATUS_COLOR#; font-weight:bold;">#APPLUSER_STATUS#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9972727370786747388)
,p_db_column_name=>'APPLUSER_USER_TYPE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'User Type'
,p_column_html_expression=>'<span style="display:block;width:150px">#APPLUSER_USER_TYPE#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5615041049607521870)
,p_db_column_name=>'APPLUSER_USER_TYPE1'
,p_display_order=>239
,p_column_identifier=>'CH'
,p_column_label=>'Appluser User Type1'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9972722256181747356)
,p_db_column_name=>'DEPT_DESC'
,p_display_order=>99
,p_column_identifier=>'BT'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9354036963321491326)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>159
,p_column_identifier=>'BZ'
,p_column_label=>'Emp,/Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9065871440121763824)
,p_db_column_name=>'PAGE_NO'
,p_display_order=>129
,p_column_identifier=>'BW'
,p_column_label=>'Page No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9972721886847747355)
,p_db_column_name=>'POS_DESC'
,p_display_order=>89
,p_column_identifier=>'BS'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9972722673055747358)
,p_db_column_name=>'ROWID'
,p_display_order=>109
,p_column_identifier=>'BU'
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
 p_id=>wwv_flow_imp.id(9972723091077747366)
,p_db_column_name=>'STATUS_COLOR'
,p_display_order=>119
,p_column_identifier=>'BV'
,p_column_label=>'Status Color'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9354037530877491331)
,p_db_column_name=>'UNIT_ID'
,p_display_order=>179
,p_column_identifier=>'CB'
,p_column_label=>'Unit Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(9354037429779491330)
,p_db_column_name=>'UNIT_NAME'
,p_display_order=>169
,p_column_identifier=>'CA'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11413021175365332607)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'6972620'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'APPLUSER_ID:APPLUSER_USER_TYPE:APPLUSER_EMP_ID:EMP_NAME:APPLUSER_EMAIL_ID:APPLUSER_MOBILE_NO:POS_DESC:DEPT_DESC:UNIT_NAME:APPLUSER_STATUS:APPLUSER_EFF_FROM:APPLUSER_EFF_TO:APPLUSER_LOCK_CHK:APPLUSER_CRE_BY:APPLUSER_CRE_DATE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11471111267944006102)
,p_plug_name=>'Search'
,p_static_id=>'search'
,p_title=>'Find Application Users'
,p_region_name=>'find'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--controlsPosEnd:is-expanded:t-Region--scrollBody:t-Form--slimPadding'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'APPL_USERS'
,p_include_rowid_column=>true
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P21113001503_APPLUSER_STATUS in(''A'',''D'')'
,p_plug_read_only_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116589522354521310)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_button_name=>'Add_User'
,p_static_id=>'add-user'
,p_button_static_id=>'addbtn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapLeft:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add User'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:21113001502:&SESSION.::&DEBUG.:CR,21113001502::'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM appl_users',
' WHERE appluser_bu = :Global_bu',
'   AND appluser_id = :Global_user',
'   AND (appluser_user_type <> ''R'' OR (appluser_user_type = ''R'' AND appluser_emp_id IS NOT NULL))'))
,p_button_condition_type=>'EXISTS'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7573366987145474730)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_button_name=>'Add_User_Erp_Creation'
,p_static_id=>'add-user-erp-creation'
,p_button_static_id=>'addbtn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--gapLeft:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add User'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:93:&SESSION.::&DEBUG.:CR,93::'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM appl_users',
' WHERE appluser_bu = :Global_bu',
'   AND (appluser_user_type = ''R'' AND appluser_emp_id IS NULL)',
'   AND appluser_id = :Global_user',
'   AND NOT EXISTS (SELECT 1',
'                     FROM appl_users',
'                    WHERE appluser_bu = :Global_bu',
'                      AND appluser_user_type = ''E''',
'                      AND appluser_status <> ''D'')'))
,p_button_condition_type=>'EXISTS'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116588684878521309)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_button_name=>'Clear'
,p_static_id=>'clear'
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
 p_id=>wwv_flow_imp.id(7116589075935521310)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_static_id=>'cancelbtn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:165:&SESSION.::&DEBUG.:::'
,p_button_css_classes=>'cancelbtn'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116588331428521303)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_button_name=>'Create_Quick_Emp'
,p_static_id=>'create-quick-emp'
,p_button_static_id=>'q'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--iconRight:t-Button--gapLeft:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Quick Emp.'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:CR,::'
,p_icon_css_classes=>'fa-user-heart'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7625534763955067055)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_button_name=>'Favorite'
,p_static_id=>'favorite'
,p_button_static_id=>'F'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favorite'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:global_fav();'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'.t-Icon'
,p_button_cattributes=>'onclick="global_fav();"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116587455857521298)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_button_name=>'Favorite_button_N'
,p_static_id=>'favorite-button-n'
,p_button_static_id=>'cancelbtn1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favorite Button N'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'cancelbtn'
,p_icon_css_classes=>'fa-heart-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116587847780521303)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_button_name=>'Favorite_button_Y'
,p_static_id=>'favorite-button-y'
,p_button_static_id=>'fav'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favorite'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'cancelbtn1'
,p_icon_css_classes=>'fa-heart'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116589842108521310)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(11471111267944006102)
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
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7021043896554182903)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_button_name=>'MOBILE'
,p_static_id=>'mobile'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--iconRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'App Access'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:196:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7393561182443755741)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(11412992674855320363)
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
 p_id=>wwv_flow_imp.id(5528503338635748328)
,p_name=>'P21113001503_'
,p_source_data_type=>'DATE'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_item_source_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Eff. From'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'APPLUSER_EFF_FROM'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>2
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9348008075050077636)
,p_name=>'P21113001503_APPLUSER_EFF_FROM'
,p_source_data_type=>'DATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_item_source_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Eff. From'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'APPLUSER_EFF_FROM'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9348008429507077636)
,p_name=>'P21113001503_APPLUSER_EFF_TO'
,p_source_data_type=>'DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_item_source_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_item_default=>'31-DEC-2099'
,p_prompt=>'Eff. To'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'APPLUSER_EFF_TO'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9347935743111077405)
,p_name=>'P21113001503_APPLUSER_EMAIL_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_item_source_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_source=>'APPLUSER_EMAIL_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9347937376512077408)
,p_name=>'P21113001503_APPLUSER_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_item_source_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_prompt=>'Emp./Party'
,p_source=>'APPLUSER_EMP_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_EMP_UAM0015'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>10
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
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
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9347965913948077506)
,p_name=>'P21113001503_APPLUSER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_item_source_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_prompt=>'User ID'
,p_source=>'APPLUSER_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'USER_LOV1'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm:margin-left-sm'
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
 p_id=>wwv_flow_imp.id(7326863946349934945)
,p_name=>'P21113001503_APPLUSER_LOCK_CHK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_item_source_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_prompt=>'Account Status'
,p_source=>'APPLUSER_LOCK_CHK'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Locked;Y,Unlocked;N'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm:margin-right-sm'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9347936565051077405)
,p_name=>'P21113001503_APPLUSER_MOBILE_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_item_source_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_source=>'APPLUSER_MOBILE_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9347968768109077512)
,p_name=>'P21113001503_APPLUSER_USER_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_item_source_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_prompt=>'User Type'
,p_source=>'APPLUSER_USER_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Admin;R,Functional;E,Module Specific;D,Management;G,Mobile App;M,ESS Portal;U,Supplier Portal;S,Customer Portal;C,Subcontract Portal;T'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8282369881254127149)
,p_name=>'P21113001503_CONCURRENT_USER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8711504514072538144)
,p_name=>'P21113001503_DEPARTMENT_NAME'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_prompt=>'Department'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DEPT_DESC d,DEPT_DESC r',
'from ',
'(select distinct(APPLUSER_DEPT_ID)APPLUSER_DEPT_ID,',
'       (SELECT dept_name1',
'	 	  FROM departments',
'	 	 WHERE dept_bu = APPLUSER_BU',
'	 	   AND dept_id = APPLUSER_DEPT_ID) DEPT_DESC ',
'from APPL_USERS ',
'  where APPLUSER_BU = :GLOBAL_BU',
')'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8711504610279538145)
,p_name=>'P21113001503_DESIGNATION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_prompt=>'Designation'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select POS_DESC d, POS_DESC r from (',
'select POS_DESC,APPLUSER_POS_ID from ',
'(select distinct (APPLUSER_POS_ID)APPLUSER_POS_ID,',
'       (SELECT hrpos_pos_name1',
'	 	  FROM hr_positions',
'	 	 WHERE hrpos_bu = APPLUSER_BU',
'	 	     AND hrpos_pos_id = APPLUSER_POS_ID',
'             AND hrpos_active_flag = ''Y'') POS_DESC',
'from APPL_USERS',
'  where APPLUSER_BU = :GLOBAL_BU))',
'order by POS_DESC asc'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_colspan=>3
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
  'title', 'Select the Designation',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5640210824357060642)
,p_name=>'P21113001503_DUMMY'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_use_cache_before_default=>'NO'
,p_item_default=>'0'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9347937774235077410)
,p_name=>'P21113001503_EMP_NAME'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8408985342066848338)
,p_name=>'P21113001503_ERROR_FLAG'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8150444169472882683)
,p_name=>'P21113001503_FAVORITE_FLAG'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8150276001759179429)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT WUBFA_USER_FAV',
'  FROM wapl_bus_fun,',
'       wapl_user_bus_fun_accs',
' WHERE WUBFA_USER_ID    = :GLOBAL_USER',
'   AND WUBFA_BUS_FUN_ID = WBF_BUS_FUN_ID',
'   AND WBF_PAGE_NO      = :app_page_id',
'   AND wbf_appl_no      = :app_id',
'   AND wbf_visible      = ''Y'''))
,p_source_type=>'QUERY_COLON'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7939550506166473040)
,p_name=>'P21113001503_FIND_DEPARTMENT'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7939550834889473043)
,p_name=>'P21113001503_FIND_DESIGNATION'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7939549839122473033)
,p_name=>'P21113001503_FIND_EMPLOYEE'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7939549314772473028)
,p_name=>'P21113001503_FIND_USER'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8282370569589127155)
,p_name=>'P21113001503_GOTO_WHN_CLOSE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8282369861788127148)
,p_name=>'P21113001503_OTP'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8282370024592127150)
,p_name=>'P21113001503_OTP_SOURCE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6388019440238381338)
,p_name=>'P21113001503_REFIND'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6388019306942381337)
,p_name=>'P21113001503_SEARCH_TYPE'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8282370308616127153)
,p_name=>'P21113001503_SHOW_DATA'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8180078665323256648)
,p_name=>'P21113001503_STATUS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;N,Pending for Active;E,Active;A,Pending for Deactive;I,Deactive;D'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-top-sm'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8180078769508256649)
,p_name=>'P21113001503_UNIT'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(11471111267944006102)
,p_prompt=>'Unit'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT bup_name1 D, bup_name1 R',
'  FROM (SELECT DISTINCT bup_name1---,bup_plant_id',
'  FROM bus_unit_plants,',
'       employees,',
'       appl_users ',
' WHERE bup_bu          = emp_bu',
'   AND bup_plant_id    = emp_asgnd_plnt',
'   AND appluser_bu     = emp_bu',
'   AND appluser_emp_id = emp_emp_id',
'   AND bup_bu          = :GLOBAL_bu',
'   AND EXISTS (SELECT auba_plant',
'                FROM appl_user_plant_access',
'               WHERE auba_bu        = :GLOBAL_bu',
'                 and auba_plant     = bup_plant_id',
'                 AND auba_user_id   = :GLOBAL_user',
'                 AND TRUNC(SYSDATE) BETWEEN TRUNC(auba_from) AND TRUNC(auba_to))',
'ORDER BY 1  )'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
  'title', 'Select the Unit',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7116607995152521418)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>310
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7116588684878521309)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116609000944521421)
,p_event_id=>wwv_flow_imp.id(7116607995152521418)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P21113001503_APPLUSER_ID,P21113001503_APPLUSER_EMP_ID,P21113001503_APPLUSER_USER_TYPE,P21113001503_STATUS,P21113001503_DESIGNATION,P21113001503_DEPARTMENT_NAME,P21113001503_UNIT,P21113001503_APPLUSER_EFF_FROM,P21113001503_APPLUSER_EFF_TO,P21113001503'
||'_CONCURRENT_USER,P21113001503_OTP,P21113001503_OTP_SOURCE,P21113001503_APPLUSER_LOCK_CHK,P21113001503_SHOW_DATA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116608514920521420)
,p_event_id=>wwv_flow_imp.id(7116607995152521418)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.message.clearErrors();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7393560689265755736)
,p_name=>'Clear1'
,p_static_id=>'clear-2'
,p_event_sequence=>360
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7393560893096755738)
,p_event_id=>wwv_flow_imp.id(7393560689265755736)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P21113001503_ERROR_FLAG,P21113001503_APPLUSER_ID,P21113001503_APPLUSER_USER_TYPE,P21113001503_APPLUSER_EMP_ID,P21113001503_STATUS,P21113001503_DESIGNATION,P21113001503_DEPARTMENT_NAME,P21113001503_APPLUSER_LOCK_CHK,P21113001503_UNIT,P21113001503_APPL'
||'USER_EFF_FROM,P21113001503_APPLUSER_EFF_TO,P21113001503_CONCURRENT_USER,P21113001503_OTP,P21113001503_OTP_SOURCE,P21113001503_SHOW_DATA,P21113001503_GOTO_WHN_CLOSE,P21113001503_EMP_NAME,P21113001503_APPLUSER_MOBILE_NO,P21113001503_APPLUSER_EMAIL_ID,P'
||'21113001503_FIND_USER,P21113001503_FIND_EMPLOYEE,P21113001503_FIND_DEPARTMENT,P21113001503_FIND_DESIGNATION'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7393560756019755737)
,p_event_id=>wwv_flow_imp.id(7393560689265755736)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '//apex.item("find").show();',
    '//apex.item("detail").hide();',
    '',
    '',
    'if (document.getElementById("P21113001503_DUMMY").value ==0){',
    '   apex.item("find").show();',
    '   apex.item("detail").hide();',
    '}',
    'else{',
    '   apex.item("find").show();',
    '   apex.item("detail").show();',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7116610276657521423)
,p_name=>'Favorite_button_N'
,p_static_id=>'favorite-button-n'
,p_event_sequence=>330
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7116587455857521298)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116610789662521424)
,p_event_id=>wwv_flow_imp.id(7116610276657521423)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P21113001503_FAVORITE_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN  ',
    '    proc_upd_favour_web(:global_bu, ''N'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '    SELECT wubfa_user_fav',
    '      INTO :P21113001503_FAVORITE_FLAG',
    '      FROM wapl_user_bus_fun_accs',
    '     WHERE wubfa_bus_fun_id = (SELECT wbf_bus_fun_id',
    '                                 FROM wapl_bus_fun',
    '                                WHERE wbf_appl_no = :app_id',
    '                                  AND wbf_page_no = :app_page_id',
    '                                  AND wbf_visible = ''Y'')',
    '       AND wubfa_user_id = :Global_user ;',
    'END;',
    '',
    '',
    '',
    '',
    '',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116611292179521424)
,p_event_id=>wwv_flow_imp.id(7116610276657521423)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P21113001503_FAVORITE_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7116611636592521426)
,p_name=>'Favorite_button_Y'
,p_static_id=>'favorite-button-y'
,p_event_sequence=>340
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7116587847780521303)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116612179764521428)
,p_event_id=>wwv_flow_imp.id(7116611636592521426)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P21113001503_FAVORITE_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    proc_upd_favour_web(:global_bu,''Y'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '',
    '    SELECT wubfa_user_fav',
    '      INTO :P21113001503_FAVORITE_FLAG',
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
 p_id=>wwv_flow_imp.id(7116612678817521428)
,p_event_id=>wwv_flow_imp.id(7116611636592521426)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P21113001503_FAVORITE_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7393561292851755742)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>370
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7393561182443755741)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7393561347010755743)
,p_event_id=>wwv_flow_imp.id(7393561292851755742)
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7116609420120521423)
,p_name=>'P21113001503_ERROR_FLAG'
,p_static_id=>'p21113001503-error-flag'
,p_event_sequence=>320
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21113001503_ERROR_FLAG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116609928368521423)
,p_event_id=>wwv_flow_imp.id(7116609420120521423)
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
    'var errorFlag= $v(''P21113001503_ERROR_FLAG'');',
    '',
    'if(errorFlag == ''P21113001503_APPLUSER_EFF_FROM'') {',
    '// Now show new errors',
    'apex.message.showErrors([',
    '    {',
    '        type:       "error",',
    '        location:   [ "page", "inline" ],',
    '        pageItem:   "P21113001503_APPLUSER_EFF_FROM",',
    '        message:    "Eff. From must be a valid date format DD-MM-RRRR.",',
    '        unsafe:     false',
    '    }',
    ']); ',
    '//To stop the further actions from firing',
    'apex.da.cancelEvent.call(this);',
    '}  ',
    '',
    'if(errorFlag == ''P21113001503_APPLUSER_EFF_TO'') {',
    '// Now show new errors',
    'apex.message.showErrors([',
    '    {',
    '        type:       "error",',
    '        location:   [ "page", "inline" ],',
    '        pageItem:   "P21113001503_APPLUSER_EFF_TO",',
    '        message:    "Eff. To must be a valid date format DD-MM-RRRR.",',
    '        unsafe:     false',
    '    }',
    ']); ',
    '//To stop the further actions from firing',
    'apex.da.cancelEvent.call(this);',
    '}  ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7116614974144521431)
,p_name=>'P21113001503_FAVORITE_FLAG'
,p_static_id=>'p21113001503-favorite-flag'
,p_event_sequence=>350
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21113001503_FAVORITE_FLAG'
,p_condition_element=>'P21113001503_FAVORITE_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116617012880521437)
,p_event_id=>wwv_flow_imp.id(7116614974144521431)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(7116587847780521303)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116616034704521434)
,p_event_id=>wwv_flow_imp.id(7116614974144521431)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide-2'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(7116587455857521298)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116615452772521432)
,p_event_id=>wwv_flow_imp.id(7116614974144521431)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(7116587847780521303)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116616523458521435)
,p_event_id=>wwv_flow_imp.id(7116614974144521431)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show-2'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(7116587455857521298)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6388019581981381339)
,p_name=>'Refind'
,p_static_id=>'refind'
,p_event_sequence=>300
,p_condition_element=>'P21113001503_REFIND'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6388020022219381344)
,p_event_id=>wwv_flow_imp.id(6388019581981381339)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P21113001503_ERROR_FLAG,P21113001503_APPLUSER_ID,P21113001503_APPLUSER_USER_TYPE,P21113001503_APPLUSER_EMP_ID,P21113001503_STATUS,P21113001503_DESIGNATION,P21113001503_DEPARTMENT_NAME,P21113001503_APPLUSER_LOCK_CHK,P21113001503_UNIT,P21113001503_APPL'
||'USER_EFF_FROM,P21113001503_APPLUSER_EFF_TO,P21113001503_CONCURRENT_USER,P21113001503_OTP,P21113001503_OTP_SOURCE,P21113001503_SHOW_DATA,P21113001503_GOTO_WHN_CLOSE,P21113001503_EMP_NAME,P21113001503_APPLUSER_MOBILE_NO,P21113001503_APPLUSER_EMAIL_ID,P'
||'21113001503_FIND_USER,P21113001503_FIND_EMPLOYEE,P21113001503_FIND_DEPARTMENT,P21113001503_FIND_DESIGNATION'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6388019643200381340)
,p_event_id=>wwv_flow_imp.id(6388019581981381339)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P21113001503_ERROR_FLAG',
  'items_to_submit', 'P21113001503_APPLUSER_EFF_TO,P21113001503_APPLUSER_EFF_FROM',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ':P21113001503_ERROR_FLAG := 0;',
    '',
    'IF :P21113001503_APPLUSER_EFF_FROM IS NOT NULL  OR :P21113001503_APPLUSER_EFF_TO IS NOT NULL THEN',
    '  DECLARE',
    '    v_date  DATE;',
    '  BEGIN',
    '    v_date := TO_DATE(:P21113001503_APPLUSER_EFF_TO,:GLOBAL_DATE_FORMAT);',
    '  EXCEPTION WHEN OTHERS THEN',
    '     :P21113001503_ERROR_FLAG := ''P21113001503_APPLUSER_EFF_TO'';',
    '  END;',
    '',
    '  DECLARE',
    '    v_date  DATE;',
    '  BEGIN',
    '    v_date := TO_DATE(:P21113001503_APPLUSER_EFF_FROM,:GLOBAL_DATE_FORMAT);',
    '  EXCEPTION WHEN OTHERS THEN',
    '     :P21113001503_ERROR_FLAG := ''P21113001503_APPLUSER_EFF_FROM'';',
    '  END;',
    '',
    'END IF;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6388019885166381343)
,p_event_id=>wwv_flow_imp.id(6388019581981381339)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("find").show();',
    'apex.item("detail").show();',
    'apex.jQuery(''#detail_ir'').interactiveReport("reset");',
    'apex.region("detail").refresh();',
    'slideclose();')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6388019794539381342)
,p_event_id=>wwv_flow_imp.id(6388019581981381339)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11412992674855320363)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P21113001503_ERROR_FLAG'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6388019774583381341)
,p_event_id=>wwv_flow_imp.id(6388019581981381339)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P21113001503_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7116613063119521428)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>290
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7116589842108521310)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116613608067521429)
,p_event_id=>wwv_flow_imp.id(7116613063119521428)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P21113001503_ERROR_FLAG',
  'items_to_submit', 'P21113001503_APPLUSER_EFF_TO,P21113001503_APPLUSER_EFF_FROM',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ':P21113001503_ERROR_FLAG := 0;',
    '',
    'IF :P21113001503_APPLUSER_EFF_FROM IS NOT NULL  OR :P21113001503_APPLUSER_EFF_TO IS NOT NULL THEN',
    '  DECLARE',
    '    v_date  DATE;',
    '  BEGIN',
    '    v_date := TO_DATE(:P21113001503_APPLUSER_EFF_TO,:GLOBAL_DATE_FORMAT);',
    '  EXCEPTION WHEN OTHERS THEN',
    '     :P21113001503_ERROR_FLAG := ''P21113001503_APPLUSER_EFF_TO'';',
    '  END;',
    '',
    '  DECLARE',
    '    v_date  DATE;',
    '  BEGIN',
    '    v_date := TO_DATE(:P21113001503_APPLUSER_EFF_FROM,:GLOBAL_DATE_FORMAT);',
    '  EXCEPTION WHEN OTHERS THEN',
    '     :P21113001503_ERROR_FLAG := ''P21113001503_APPLUSER_EFF_FROM'';',
    '  END;',
    '',
    'END IF;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5639938667053869568)
,p_event_id=>wwv_flow_imp.id(7116613063119521428)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("find").show();',
    'apex.item("detail").show();',
    'apex.jQuery(''#detail_ir'').interactiveReport("reset");',
    'apex.region("detail").refresh();',
    'slideclose();')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116614056784521429)
,p_event_id=>wwv_flow_imp.id(7116613063119521428)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11412992674855320363)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P21113001503_ERROR_FLAG'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116614561964521431)
,p_event_id=>wwv_flow_imp.id(7116613063119521428)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P21113001503_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8111372763388934878)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process for Favorite'
,p_static_id=>'process-for-favorite'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    proc_upd_favour_web(:GLOBAL_BU, :P21113001503_FAVORITE_FLAG,:APP_ID,:APP_PAGE_ID,:GLOBAL_USER);',
'    COMMIT;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Favorite_button_N,Favorite_button_Y'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
,p_internal_uid=>2629410927845323850
);
wwv_flow_imp.component_end;
end;
/
