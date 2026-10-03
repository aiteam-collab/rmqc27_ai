prompt --application/pages/page_00080
begin
--   Manifest
--     PAGE: 00080
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
 p_id=>80
,p_name=>'Current Unit /Location Access'
,p_alias=>'FIND-USER-PLANTS'
,p_step_title=>'Current Unit /Location Access'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>'slideclose();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#fav',
'{',
'color: #ff0000;',
'background-color: rgba(0, 0, 0, 0.15)',
'};',
'',
'.t-Region--accent6 > .t-Region-header {',
'    background-color: #dec553de;',
'    color: #2a2a08;',
'}',
'',
'.t-Form--labelsAbove .t-Form-fieldContainer .apex-item-select, .t-Form-fieldContainer--stacked .apex-item-select {',
'    max-width: 123%;',
'}',
'/* .t-Region-body {',
'    color: #6a3ebd;',
'    line-height: 0rem;',
'    font-size: 1rem;',
'} */',
'.t-Cards--cols .t-Cards-item {',
'    width: 109%;',
'}',
'.t-Cards--basic .t-Card-desc {',
'    font-size: 1.4rem;',
'    line-height: 20px;',
'    text-align: -webkit-center;',
'    color: darkcyan;',
'    font-weight: bold;',
'}',
'.t-Region-title {',
'    font-size: larger;',
'}',
'.t-Region-title {',
'    font-size: small;',
'    line-height: inherit;',
'    font-weight: 400;',
'    color: #fff;',
'}',
'',
'#addbtn{',
'        color: blue;',
'        background-color: #ffffff;',
'     //   background-color: rgba(0, 0, 0, 0.15);',
'}',
'',
'#SEARCH{',
'                color: green;',
'                background-color: #ffffff;',
'              //  background-color: rgba(0, 0, 0, 0.15);',
'}',
'#cancelbtn{',
'                color: rgb(214, 19, 29);',
'                background-color: #ffffff;',
'               // background-color: rgba(0, 0, 0, 0.15);',
'}',
'',
'#cancelbtn1{',
'                color: rgb(214, 19, 29);',
'                background-color: #ffffff;',
'               // background-color: rgba(0, 0, 0, 0.15);',
'}',
'',
'#Clear{',
'   background-image: url(#APP_FILES#clearclear-removebg-preview.png);',
'   background-position: 0px 3px;',
'   background-repeat: no-repeat;',
'   background-color: #ffffff;',
'  // background-color: rgba(0, 0, 0, 0.15);',
'   background-size: 25px;',
'   width: 27px;',
'   height: 23px;',
'}',
'',
'',
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
'/* ',
'.a-IRR-headerLink, .a-IRR-headerLink:hover {',
'',
'    background: #00b1e7 !important;',
'} */',
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
'/* Region background-color By Prasanth M */',
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
'}'))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10373190668799904543)
,p_plug_name=>'Find User '
,p_static_id=>'find-user'
,p_title=>'Report : Current Unit /Location Access'
,p_region_name=>'find'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--controlsPosEnd:is-expanded:t-Region--scrollBody'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P80_APPLUSER_STATUS in(''A'',''D'')'
,p_plug_read_only_when2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7052449358142780890)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7240397092744379491)
,p_plug_name=>'Unit_Access'
,p_static_id=>'unit-access'
,p_title=>'Result(s)'
,p_region_name=>'detail'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT * ',
'  FROM (',
'SELECT auba_bu,',
'      auba_user_id,',
'      auba_plant,',
'      (SELECT bup_name1',
'         FROM bus_unit_plants',
'        WHERE bup_bu       = auba_bu ',
'          AND bup_plant_id = auba_plant) Unit_Name,',
'      TO_CHAR(auba_from,''DD-MON-YYYY'') auba_from,',
'      TO_CHAR(auba_to,''DD-MON-YYYY'') auba_to,',
'      auba_deflt_flag,',
'      auba_from auba_from1,',
'      auba_to auba_to1,',
'      auba_plnt_loc_id,',
'     (SELECT bupld_loc_name',
'        FROM bus_unit_plants_loc_dtls',
'       WHERE bupld_bu     = auba_bu',
'         AND bupld_loc_id = auba_plnt_loc_id)Loc_name,',
'      emp_emp_id,',
'      emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 emp_name,',
'      empai_bu,',
'      empai_pos_id,',
'      (SELECT hrpos_pos_name1',
'         FROM hr_positions',
'        WHERE hrpos_bu     = empai_bu',
'          AND hrpos_pos_id = empai_pos_id)Designation,',
'      empai_dept_id,',
'      (SELECT dept_name1',
'         FROM departments',
'        WHERE dept_bu = empai_bu',
'          AND dept_id = empai_dept_id)Department,',
'      auba_accs_doc_no,',
'      TO_CHAR(auba_accs_doc_date,''DD-MON-YYYY'') auba_accs_doc_date,',
'      auba_appr_by,',
'      auba_appr_date,',
'      appluser_user_type,',
'      auba_cre_by,',
'      AUBA_CRE_DATE,',
'      DECODE(appluser_user_type,''R'',''Admin User'',',
'                                ''E'',''Functional User'',',
'                                ''U'',''ESS User'',',
'                                ''P'',''POS User'',',
'                                ''C'',''Customer'',',
'                                ''S'',''Supplier'',',
'                                ''O'',''Role Based User'',',
'                                ''M'',''Mobile User'',',
'                                ''L'',''Limited Access User'')User_type  ',
'  FROM appl_user_plant_access,',
'       emp_active_infos,',
'       employees,',
'       appl_users',
' WHERE emp_bu      = empai_bu',
'   AND emp_emp_id  = empai_emp_id',
'   AND emp_bu      = appluser_bu',
'   AND emp_emp_id  = appluser_emp_id',
'   AND appluser_id = auba_user_id',
'   AND auba_bu     = :global_bu',
')',
' WHERE (appluser_user_type = :P80_USER_TYPE OR :P80_USER_TYPE IS NULL)',
'  -- AND :P80_SHOW_DATA = ''Y''',
'   AND ((((TO_DATE(:P80_EFF_FROM,''DD-MON-YYYY'') BETWEEN TRUNC(auba_from1) AND TRUNC(auba_to1)) ',
'             OR (TO_DATE(:P80_EFF_TO,''DD-MON-YYYY'') BETWEEN TRUNC(auba_from1) AND TRUNC(auba_to1)))',
'             AND :P80_EFF_TO IS NOT NULL AND :P80_EFF_FROM IS NOT NULL)',
'         OR (TRUNC(auba_from1) >= TO_DATE(:P80_EFF_FROM,''DD-MON-YYYY'') AND :P80_EFF_TO IS NULL AND :P80_EFF_FROM IS NOT NULL)',
'         OR (TRUNC(auba_to1) <= TO_DATE(:P80_EFF_TO,''DD-MON-YYYY'') AND :P80_EFF_FROM IS NULL AND :P80_EFF_TO IS NOT NULL)',
'         OR (:P80_EFF_FROM IS NULL AND :P80_EFF_TO IS NULL))            ',
'   AND (INSTR(UPPER(auba_user_id),UPPER(:P80_USER_ID)) > 0 OR :P80_USER_ID IS NULL)',
'   AND ((INSTR(UPPER(auba_plant),UPPER(:P80_USER_PLNT)) > 0  OR :P80_USER_PLNT IS NULL)',
'    OR (INSTR(UPPER((unit_name)),UPPER(TRIM(:P80_USER_PLNT))) > 0))',
'   AND ((INSTR(UPPER(auba_plnt_loc_id),UPPER(:P80_PLNT_LOC)) > 0  OR :P80_PLNT_LOC IS NULL)',
'    OR (INSTR(UPPER((Loc_name)),UPPER(TRIM(:P80_PLNT_LOC))) > 0))',
'   AND (INSTR(UPPER(Designation),UPPER(:P80_DESIGNATION)) > 0 OR :P80_DESIGNATION IS NULL)',
'   AND (INSTR(UPPER(Department),UPPER(:P80_DEPARTMENT)) > 0 OR :P80_DEPARTMENT IS NULL)',
'   AND ((INSTR(UPPER(emp_emp_id),UPPER(:P80_EMP_ID)) > 0  OR :P80_EMP_ID IS NULL)',
'    OR (INSTR(UPPER((emp_name)),UPPER(TRIM(:P80_EMP_ID))) > 0))',
'    order by AUBA_CRE_DATE desc,',
'    auba_accs_doc_no desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P80_USER_ID,P80_USER_TYPE,P80_EMP_ID,P80_PLNT_LOC,P80_USER_PLNT,P80_DESIGNATION,P80_DEPARTMENT,P80_EFF_FROM,P80_EFF_TO,P80_SHOW_DATA'
,p_prn_content_disposition=>'ATTACHMENT'
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
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6648481259655911930)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1166519424112300902
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6648484073598911958)
,p_db_column_name=>'APPLUSER_USER_TYPE'
,p_display_order=>450
,p_column_identifier=>'AB'
,p_column_label=>'Appluser User Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6971627789540328056)
,p_db_column_name=>'AUBA_ACCS_DOC_DATE'
,p_display_order=>490
,p_column_identifier=>'AR'
,p_column_label=>'Doc. Date'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6648483700459911954)
,p_db_column_name=>'AUBA_ACCS_DOC_NO'
,p_display_order=>120
,p_column_identifier=>'X'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6648483864083911956)
,p_db_column_name=>'AUBA_APPR_BY'
,p_display_order=>150
,p_column_identifier=>'Z'
,p_column_label=>'Approved By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6648483980409911957)
,p_db_column_name=>'AUBA_APPR_DATE'
,p_display_order=>440
,p_column_identifier=>'AA'
,p_column_label=>'Auba Appr Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6648481412744911931)
,p_db_column_name=>'AUBA_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Auba Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6657339569136645452)
,p_db_column_name=>'AUBA_CRE_BY'
,p_display_order=>460
,p_column_identifier=>'AO'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(5962960094351630129)
,p_db_column_name=>'AUBA_CRE_DATE'
,p_display_order=>500
,p_column_identifier=>'AS'
,p_column_label=>'Auba Cre Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6648481942578911937)
,p_db_column_name=>'AUBA_DEFLT_FLAG'
,p_display_order=>430
,p_column_identifier=>'G'
,p_column_label=>'Auba Deflt Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6657338710027645443)
,p_db_column_name=>'AUBA_FROM'
,p_display_order=>330
,p_column_identifier=>'AF'
,p_column_label=>'Eff. From'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6671767990515366043)
,p_db_column_name=>'AUBA_FROM1'
,p_display_order=>470
,p_column_identifier=>'AP'
,p_column_label=>'Auba From1'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6648481550856911933)
,p_db_column_name=>'AUBA_PLANT'
,p_display_order=>100
,p_column_identifier=>'C'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6648483080724911948)
,p_db_column_name=>'AUBA_PLNT_LOC_ID'
,p_display_order=>80
,p_column_identifier=>'R'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6657338769650645444)
,p_db_column_name=>'AUBA_TO'
,p_display_order=>340
,p_column_identifier=>'AG'
,p_column_label=>'Eff. To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6671768041261366044)
,p_db_column_name=>'AUBA_TO1'
,p_display_order=>480
,p_column_identifier=>'AQ'
,p_column_label=>'Auba To1'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6648481532086911932)
,p_db_column_name=>'AUBA_USER_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'User'
,p_column_link=>'f?p=&APP_ID.:94:&SESSION.::&DEBUG.::P94_USER_ID,P94_TITLE:#AUBA_USER_ID#,#AUBA_USER_ID#'
,p_column_linktext=>'#AUBA_USER_ID#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6657339452391645451)
,p_db_column_name=>'DEPARTMENT'
,p_display_order=>380
,p_column_identifier=>'AN'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6657339243617645449)
,p_db_column_name=>'DESIGNATION'
,p_display_order=>370
,p_column_identifier=>'AL'
,p_column_label=>'Designation'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6657339067320645447)
,p_db_column_name=>'EMPAI_BU'
,p_display_order=>390
,p_column_identifier=>'AJ'
,p_column_label=>'Empai Bu'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6657339356332645450)
,p_db_column_name=>'EMPAI_DEPT_ID'
,p_display_order=>410
,p_column_identifier=>'AM'
,p_column_label=>'Empai Dept Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6657339139355645448)
,p_db_column_name=>'EMPAI_POS_ID'
,p_display_order=>400
,p_column_identifier=>'AK'
,p_column_label=>'Empai Pos Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6657338909958645445)
,p_db_column_name=>'EMP_EMP_ID'
,p_display_order=>350
,p_column_identifier=>'AH'
,p_column_label=>'Emp./Party ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6657338947199645446)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>360
,p_column_identifier=>'AI'
,p_column_label=>'Emp./Party Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6657337989686645436)
,p_db_column_name=>'LOC_NAME'
,p_display_order=>320
,p_column_identifier=>'AE'
,p_column_label=>'Location Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6657337929699645435)
,p_db_column_name=>'UNIT_NAME'
,p_display_order=>310
,p_column_identifier=>'AD'
,p_column_label=>'Unit Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6648484155518911959)
,p_db_column_name=>'USER_TYPE'
,p_display_order=>30
,p_column_identifier=>'AC'
,p_column_label=>'User Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6648529569076929213)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'11665678'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'AUBA_USER_ID:USER_TYPE:EMP_EMP_ID:EMP_NAME:AUBA_PLNT_LOC_ID:LOC_NAME:AUBA_PLANT:UNIT_NAME:DEPARTMENT:DESIGNATION:AUBA_CRE_BY:AUBA_APPR_BY:AUBA_FROM:AUBA_TO:AUBA_ACCS_DOC_NO:AUBA_ACCS_DOC_DATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6079009222242157562)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(10373190668799904543)
,p_button_name=>'Close1'
,p_static_id=>'close'
,p_button_static_id=>'cancelbtn'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close1'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5998692413665087967)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(7240397092744379491)
,p_button_name=>'Download'
,p_static_id=>'download'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--padLeft:t-Button--padRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Download'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_icon_css_classes=>'fa-download'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6671723970704282782)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(10373190668799904543)
,p_button_name=>'Favorite_button_N'
,p_static_id=>'favorite-button-n'
,p_button_static_id=>'fav'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favorite Button'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-heart-o'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6671724276351283382)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(10373190668799904543)
,p_button_name=>'Favorite_button_Y'
,p_static_id=>'favorite-button-y'
,p_button_static_id=>'cancelbtn1'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favorite Button'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-heart'
,p_required_patch=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6079008876462157560)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(10373190668799904543)
,p_button_name=>'Filter'
,p_static_id=>'filter'
,p_button_static_id=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6079006925300157546)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(10373190668799904543)
,p_button_name=>'Find'
,p_static_id=>'find'
,p_button_static_id=>'SEARCH'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generate'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7411123246241613540)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7240397092744379491)
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
 p_id=>wwv_flow_imp.id(5998692603347087969)
,p_branch_name=>'Download'
,p_branch_action=>'f?p=&APP_ID.:1:&SESSION.:APPLICATION_PROCESS=GET_EXPORT_FILE:&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(5998692413665087967)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6671766936338366033)
,p_branch_name=>'Go To Page 80'
,p_branch_action=>'f?p=&APP_ID.:80:&SESSION.::&DEBUG.::P80_SHOW_DATA:&P80_SHOW_DATA.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'Favorite_button_N,Favorite_button_Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6535257315911794861)
,p_name=>'P80_DEPARTMENT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(10373190668799904543)
,p_prompt=>'Department'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT dept_name1',
'  FROM departments,',
'       emp_active_infos,',
'       appl_users ,',
'       appl_user_plant_access',
' WHERE dept_bu          = empai_bu',
'   AND dept_id          = empai_dept_id',
'   AND appluser_bu      = auba_bu',
'   AND appluser_id      = auba_user_id',
'   AND appluser_bu      = empai_bu',
'   AND appluser_emp_id  = empai_emp_id',
'   AND auba_bu          = :GLOBAL_bu',
'ORDER BY 1 ',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select All Department'
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
 p_id=>wwv_flow_imp.id(6535257146305794860)
,p_name=>'P80_DESIGNATION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(10373190668799904543)
,p_prompt=>'Designation'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT hrpos_pos_name1 FROM (',
'SELECT DISTINCT hrpos_pos_name1,hrpos_pos_id',
'  FROM hr_positions,',
'       emp_active_infos,',
'       appl_users,',
'       appl_user_plant_access',
' WHERE hrpos_bu            = empai_bu',
'   AND hrpos_pos_id        = empai_pos_id',
'   AND appluser_bu         = empai_bu',
'   AND appluser_emp_id     = empai_emp_id',
'   AND appluser_id         = auba_user_id',
'   AND hrpos_bu            = :GLOBAL_bu',
'   AND EXISTS (SELECT auba_plant',
'                                FROM appl_user_plant_access',
'                            WHERE empai_bu         = auba_bu',
'                                 AND empai_plnt      = auba_plant',
'                                 AND auba_bu        = :GLOBAL_bu',
'                                 AND auba_user_id   = :GLOBAL_user',
'                                 AND TRUNC(SYSDATE) BETWEEN TRUNC(auba_from) AND TRUNC(auba_to)) )',
'ORDER BY 1 '))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select All Designation'
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
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6081659154159593770)
,p_name=>'P80_EFF_FROM'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(10373190668799904543)
,p_prompt=>'Eff. From'
,p_format_mask=>'DD-MON-YYYY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>40
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
 p_id=>wwv_flow_imp.id(6081668585541602406)
,p_name=>'P80_EFF_TO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(10373190668799904543)
,p_prompt=>'Eff. To'
,p_format_mask=>'DD-MON-YYYY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>40
,p_begin_on_new_line=>'N'
,p_colspan=>2
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
 p_id=>wwv_flow_imp.id(6535256516295794853)
,p_name=>'P80_EMP_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(10373190668799904543)
,p_prompt=>'Emp./Party'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_UAM1015_EMP'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select  All Employee'
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
  'title', 'Select the Employee /Party',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6775577640197617920)
,p_name=>'P80_ERROR_FLAG'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10373190668799904543)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6671723657624281678)
,p_name=>'P80_FAVOURITE_FLAG'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7052449358142780890)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT WUBFA_USER_FAV',
'     FROM wapl_bus_fun,',
'          wapl_user_bus_fun_accs',
'    WHERE WUBFA_USER_ID = :GLOBAL_USER',
'      AND WUBFA_BUS_FUN_ID = WBF_BUS_FUN_ID',
'      AND WBF_PAGE_NO = :app_page_id',
'      AND wbf_appl_no = :app_id',
'      AND wbf_visible = ''Y'''))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7052524905754781133)
,p_name=>'P80_NEW'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7052449358142780890)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6535257021537794858)
,p_name=>'P80_PLNT_LOC'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(10373190668799904543)
,p_prompt=>'Location '
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_UAM1015_PLNT_LOC'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select All Unit Location'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
  'title', 'Select the Unit Location',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6648481219876911929)
,p_name=>'P80_REPORT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7052449358142780890)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6671757887172355682)
,p_name=>'P80_SHOW_DATA'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(10373190668799904543)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6562103937747302598)
,p_name=>'P80_USER_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10373190668799904543)
,p_prompt=>'User'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT appluser_id d, appluser_id r',
'  FROM appl_users,',
'       appl_user_plant_access',
' WHERE appluser_bu = auba_bu',
'   AND appluser_id = auba_user_id',
'   AND appluser_bu = :Global_bu     ',
'   AND appluser_status = ''A''',
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select All User'
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
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6569537582143646049)
,p_name=>'P80_USER_PLNT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(10373190668799904543)
,p_prompt=>'Unit'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_UAM1015_PLNT'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select All Unit'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_is_persistent=>'N'
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
  'title', 'Select the Unit',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6535256766682794856)
,p_name=>'P80_USER_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(10373190668799904543)
,p_prompt=>'User Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Admin User;R,Functional User;E,Role Based User ;O,ESS User;U,Supplier;S,Customer;C,POS User;P,Mobile User;M,Limited Access User;L'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7411122967029613537)
,p_name=>'Clear'
,p_static_id=>'clear'
,p_event_sequence=>270
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7411123066597613538)
,p_event_id=>wwv_flow_imp.id(7411122967029613537)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P80_USER_ID,P80_ERROR_FLAG,P80_USER_TYPE,P80_EMP_ID,P80_PLNT_LOC,P80_USER_PLNT,P80_DESIGNATION,P80_DEPARTMENT,P80_EFF_FROM,P80_EFF_TO,P80_SHOW_DATA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7411123193267613539)
,p_event_id=>wwv_flow_imp.id(7411122967029613537)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("find").show();',
    'apex.item("detail").hide();')))).to_clob
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_server_condition_expr1=>'P80_SHOW_DATA'
,p_server_condition_expr2=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6775590681112623456)
,p_name=>'Favorite_N'
,p_static_id=>'favorite-n'
,p_event_sequence=>240
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6671723970704282782)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6775591119702623457)
,p_event_id=>wwv_flow_imp.id(6775590681112623456)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P80_FAVOURITE_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    proc_upd_favour_web(:global_bu, ''N'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '    SELECT wubfa_user_fav',
    '      INTO :P80_FAVOURITE_FLAG',
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
 p_id=>wwv_flow_imp.id(6775591559061623459)
,p_event_id=>wwv_flow_imp.id(6775590681112623456)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P80_FAVOURITE_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6775592812036624856)
,p_name=>'Favorite_Y'
,p_static_id=>'favorite-y'
,p_event_sequence=>250
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6671724276351283382)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6775593146591624859)
,p_event_id=>wwv_flow_imp.id(6775592812036624856)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P80_FAVOURITE_FLAG',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    proc_upd_favour_web(:global_bu, ''Y'',:app_id,:app_page_id,:global_user);',
    '    COMMIT;',
    '',
    '    SELECT wubfa_user_fav',
    '      INTO :P80_FAVOURITE_FLAG',
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
 p_id=>wwv_flow_imp.id(6775593693741624859)
,p_event_id=>wwv_flow_imp.id(6775592812036624856)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P80_FAVOURITE_FLAG'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6192951818575721051)
,p_name=>'Filter'
,p_static_id=>'filter'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6079008876462157560)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6192951889252721052)
,p_event_id=>wwv_flow_imp.id(6192951818575721051)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P80_USER_ID,P80_USER_TYPE,P80_EMP_ID,P80_PLNT_LOC,P80_USER_PLNT,P80_DESIGNATION,P80_DEPARTMENT,P80_EFF_FROM,P80_EFF_TO,P80_SHOW_DATA'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6774356369772938049)
,p_event_id=>wwv_flow_imp.id(6192951818575721051)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.message.clearErrors();')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7974719747096067351)
,p_event_id=>wwv_flow_imp.id(6192951818575721051)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7240397092744379491)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6671766632607366029)
,p_name=>'Find'
,p_static_id=>'find'
,p_event_sequence=>220
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6079006925300157546)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5998692636634087970)
,p_event_id=>wwv_flow_imp.id(6671766632607366029)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P80_USER_ID,P80_USER_TYPE,P80_EMP_ID,P80_PLNT_LOC,P80_USER_PLNT,P80_DESIGNATION,P80_DEPARTMENT,P80_EFF_FROM,P80_EFF_TO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Unit_Access'',1,''P80_USER_ID'',''User Id'',:P80_USER_ID,:P80_USER_ID);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Unit_Access'',2,''P80_USER_TYPE'',''User Type'',:P80_USER_TYPE,',
    '      CASE WHEN :P80_USER_TYPE = ''R'' THEN ''Admin User''',
    '              WHEN :P80_USER_TYPE = ''E'' THEN ''Functional User''',
    '              WHEN :P80_USER_TYPE = ''O'' THEN ''Role Based User''',
    '              WHEN :P80_USER_TYPE = ''U'' THEN ''ESS User''',
    '              WHEN :P80_USER_TYPE = ''S'' THEN ''Supplier''',
    '              WHEN :P80_USER_TYPE = ''C'' THEN ''Customer''',
    '              WHEN :P80_USER_TYPE = ''P'' THEN ''POS User''',
    '              WHEN :P80_USER_TYPE = ''M'' THEN ''Mobile User''',
    '              WHEN :P80_USER_TYPE =''L'' THEN ''Limited Access User'' END);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Unit_Access'',3,''P80_EMP_ID'',''Emp. ID'',:P80_EMP_ID,:P80_EMP_ID);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Unit_Access'',4,''P80_PLNT_LOC'',''Bus. Fun. ID'',:P80_PLNT_LOC,:P80_PLNT_LOC);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Unit_Access'',5,''P80_USER_PLNT'',''Unit'',:P80_USER_PLNT,:P80_USER_PLNT); ',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Unit_Access'',6,''P80_DESIGNATION'',''Designation'',:P80_DESIGNATION,:P80_DESIGNATION);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Unit_Access'',7,''P80_DEPARTMENT'',''Department'',:P80_DEPARTMENT,:P80_DEPARTMENT);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Unit_Access'',8,''P80_EFF_FROM'',''Eff. From'',:P80_EFF_FROM,:P80_EFF_FROM);',
    '  proc_upd_apex_page_item_val(:APP_ID,:APP_PAGE_ID,:APP_SESSION,''Unit_Access'',9,''P80_EFF_TO'',''Eff. To'',:P80_EFF_TO,:P80_EFF_TO);',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6774356284150938048)
,p_event_id=>wwv_flow_imp.id(6671766632607366029)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P80_ERROR_FLAG',
  'items_to_submit', 'P80_EFF_FROM,P80_EFF_TO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ':P80_ERROR_FLAG := 0;',
    '',
    'IF :P80_EFF_FROM IS NOT NULL  OR :P80_EFF_TO IS NOT NULL THEN',
    '  DECLARE',
    '    v_date  DATE;',
    '  BEGIN',
    '    v_date := TO_DATE(:P80_EFF_TO,:GLOBAL_DATE_FORMAT);',
    '  EXCEPTION WHEN OTHERS THEN',
    '     :P80_ERROR_FLAG := ''P80_EFF_TO'';',
    '  END;',
    '',
    '  DECLARE',
    '    v_date  DATE;',
    '  BEGIN',
    '    v_date := TO_DATE(:P80_EFF_FROM,:GLOBAL_DATE_FORMAT);',
    '  EXCEPTION WHEN OTHERS THEN',
    '     :P80_ERROR_FLAG := ''P80_EFF_FROM'';',
    '  END;',
    '',
    'END IF;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7411122838639613536)
,p_event_id=>wwv_flow_imp.id(6671766632607366029)
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
,p_client_condition_element=>'P80_SHOW_DATA'
,p_client_condition_expression=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6671766703533366030)
,p_event_id=>wwv_flow_imp.id(6671766632607366029)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7240397092744379491)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P80_ERROR_FLAG'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6671766831628366031)
,p_event_id=>wwv_flow_imp.id(6671766632607366029)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P80_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6775583389209621112)
,p_name=>'P80_ERROR_FLAG'
,p_static_id=>'p80-error-flag'
,p_event_sequence=>230
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P80_ERROR_FLAG'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6775583763279621115)
,p_event_id=>wwv_flow_imp.id(6775583389209621112)
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
    'var errorFlag= $v(''P80_ERROR_FLAG'');',
    '',
    'if(errorFlag == ''P80_EFF_FROM'') {',
    '// Now show new errors',
    'apex.message.showErrors([',
    '    {',
    '        type:       "error",',
    '        location:   [ "page", "inline" ],',
    '        pageItem:   "P80_EFF_FROM",',
    '        message:    "Eff. From must be a valid date format DD-MM-RRRR.",',
    '        unsafe:     false',
    '    }',
    ']); ',
    '//To stop the further actions from firing',
    'apex.da.cancelEvent.call(this);',
    '}  ',
    '',
    'if(errorFlag == ''P80_EFF_TO'') {',
    '// Now show new errors',
    'apex.message.showErrors([',
    '    {',
    '        type:       "error",',
    '        location:   [ "page", "inline" ],',
    '        pageItem:   "P80_EFF_TO",',
    '        message:    "Eff. To must be a valid date format DD-MM-RRRR.",',
    '        unsafe:     false',
    '    }',
    ']); ',
    '//To stop the further actions from firing',
    'apex.da.cancelEvent.call(this);',
    '}  ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6775634522059631806)
,p_name=>'P80_FAVOURITE_FLAG'
,p_static_id=>'p80-favourite-flag'
,p_event_sequence=>260
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P80_FAVOURITE_FLAG'
,p_condition_element=>'P80_FAVOURITE_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6775636363717631812)
,p_event_id=>wwv_flow_imp.id(6775634522059631806)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6671724276351283382)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6775635389317631809)
,p_event_id=>wwv_flow_imp.id(6775634522059631806)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide-2'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6671723970704282782)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6775634854147631807)
,p_event_id=>wwv_flow_imp.id(6775634522059631806)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6671724276351283382)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6775635894770631809)
,p_event_id=>wwv_flow_imp.id(6775634522059631806)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show-2'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6671723970704282782)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7411123345483613541)
,p_name=>'Search'
,p_static_id=>'search'
,p_event_sequence=>280
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7411123246241613540)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7411123488110613542)
,p_event_id=>wwv_flow_imp.id(7411123345483613541)
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
 p_id=>wwv_flow_imp.id(6079013307516157584)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT case APPLUSER_STATUS when ''A'' then ''<span style="color:green">Active</span>''',
'                            when ''D'' then ''<span style="color:red">Inactive</span>'' ',
'                            when ''N'' then ''<span style="color:Blue">New</span>'' end as "APPLUSER_STATUS "',
'        into :P80_APPLUSER_STATUS_1',
'        FROM APPL_USERS',
'            WHERE APPLUSER_BU=:GLOBAL_BU',
'            AND ROWID=:P80_ROWID;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>597051471972546556
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6079012839798157582)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pre_insert'
,p_static_id=>'pre-insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P80_APPLUSER_PARTY_ID is not null then',
'',
'        SELECT (SELECT hrpos_pos_name1 FROM hr_positions WHERE hrpos_bu = APPLUSER_BU AND hrpos_pos_id = APPLUSER_POS_ID)pos_name,',
'               (SELECT dept_name1 FROM departments WHERE dept_bu = APPLUSER_BU AND dept_id = APPLUSER_DEPT_ID)dept_name,',
'               APPLUSER_PASSWORD, APPLUSER_PW_EXP_DAYS,',
'               (select  emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 from employees',
'                    where emp_emp_id=APPLUSER_PARTY_ID',
'                        and emp_bu=:global_bu)Emp_Name',
'            into :P80_DEPARTMENT_NAME , :P80_POSITION, :P80_PASSWORD ,:P80_APPLUSER_PW_EXP_DAYS_1,:P80_EMP_NAME',
'        FROM APPL_USERS',
'            WHERE APPLUSER_BU=:GLOBAL_BU',
'            AND APPLUSER_EMP_ID = :P80_APPLUSER_PARTY_ID;',
'end if;',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>597051004254546554
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5998692531037087968)
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
'proc_apex_ir_report_export(:GLOBAL_bu,:app_id,:app_page_id,''Unit_Access'',:app_session,:GLOBAL_user,v_qry);',
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
'        ''Current Unit Access''',
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
'                               ''"Current Unit Access"'',',
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
,p_process_when_button_id=>wwv_flow_imp.id(5998692413665087967)
,p_internal_uid=>516730695493476940
);
wwv_flow_imp.component_end;
end;
/
