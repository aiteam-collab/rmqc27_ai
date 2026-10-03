prompt --application/pages/page_11130004
begin
--   Manifest
--     PAGE: 11130004
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
 p_id=>11130004
,p_name=>'Bus. Fun. List'
,p_alias=>'BUS-FUN-LIST'
,p_step_title=>'Bus. Fun. List'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*.apex-icons-fontapex .fa {',
'    font-family: inherit!important;',
'    position: relative;',
'    font-weight: bold;',
'}*/',
'',
'#F',
'{',
'color: #ff0000;',
'background-color: #ffffff',
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
'',
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
'} ',
'/* ',
'.t-Button--success {',
'    --a-button-background-color: #e0e0e0;',
'     --a-button-text-color: #047827; ',
'    --a-button-hover-background-color: #e0e0e0;',
'    --a-button-hover-text-color: var(--a-button-text-color);',
'     --a-button-active-background-color: #e0e0e0;',
'    --a-button-active-text-color: var(--a-button-hover-text-color);',
'    --a-button-focus-background-color: var(--a-button-hover-background-color);',
'    --a-button-focus-text-color: var(--a-button-hover-text-color);',
'} */',
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
'/* ',
'a {',
'    color: #4c9ff1;',
'} */',
'',
'',
'.a-Button--hot, .t-Button--hot:not(.t-Button--simple), body .ui-button.ui-button--hot, body .ui-state-default.ui-priority-primary {',
'    color: #ffffff;',
'}',
'',
'.apex-item-grid-row .apex-item-option {',
'    display: table-cell;',
'    vertical-align: top;',
'    padding-right: 12px;',
'    /* padding-top: 11px; */',
'}',
'',
'',
'#Clear123{',
'   background-image: url(#WORKSPACE_FILES#clearclear-removebg-preview.png);',
'   background-position: 6px 3px;',
'   background-repeat: no-repeat;',
'   background-color: #ffffff;',
'   background-size: 26px;',
'   width: 28px;',
'   height: 25px;',
'   padding-top: var(--ut-region-buttons-padding-y, 8px);',
'   padding-bottom: var(--ut-region-buttons-padding-y, 8px);',
'   padding-left: var(--ut-region-buttons-padding-x, 12px);',
'   padding-right: var(--ut-region-buttons-padding-x, 12px);',
'}',
'',
'.a-Button--hot, .t-Button--hot:not(.t-Button--simple), body .ui-button.ui-button--hot, body .ui-state-default.ui-priority-primary {',
'    background-color: #ffffff;',
'    color: #ffffff;',
'}',
'.a-Button--hot, .t-Button--hot:not(.t-Button--simple), body .ui-button.ui-button--hot, body .ui-state-default.ui-priority-primary {',
'    background-color: #ffffff;',
'}        '))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8608959758193372868)
,p_plug_name=>'Bus. Fun.'
,p_static_id=>'bus-fun'
,p_title=>'Result(s)'
,p_region_name=>'ig_line'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_region_attributes=>'style=display:none;'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid,',
'wbf_seq_no,',
'wbf_bus_fun_id,',
'wbf_page_no,',
'wbf_bus_fun_name,',
'wbf_bus_fun_short_name,',
'wbf_bus_fun_type,',
'wbf_par_fun_id,',
'Par_Desc ,',
'Par_alias_Desc wbf_par_fun_alias_name,',
'wbf_visible,',
'wbf_icon,',
'wbf_node_type,',
'wbf_cre_by,',
'wbf_cre_ip_addr,',
'wbf_cre_os_user,',
'wbf_cre_emp_id,',
'wbf_cre_date,',
'wbf_upd_by,',
'wbf_upd_ip_addr,',
'wbf_upd_os_user,',
'wbf_upd_emp_id,',
'wbf_upd_date,',
'wbf_srch_flag,',
'wbf_asgn_to,',
'wbf_asgn_date,',
'wbf_asgn_status,',
'wbf_appl_no,',
'DECODE(wbf_std_vert_type,''S'',''Standard'',''V'',''Vertical'')wbf_std_vert_type,',
'wbf_vertical_id,',
'VERTICAL_DESC,',
'wbf_vert_bus_fun_name,',
'wbf_bus_fun_narration,',
'wbf_bus_fun_mis_name,',
'wbf_form_loc1,',
'wbf_form_icon,',
'wbf_form_id,',
'wbf_active_flag,',
'wbf_module_id,',
'wbf_bus_fun_alias_name,',
'wbf_screen_count,',
'wbf_print_seq',
'from (',
'select',
'       wbf_seq_no,',
'       wbf_bus_fun_id,',
'       wbf_page_no,',
'       wbf_bus_fun_name,',
'       wbf_bus_fun_short_name,',
'       wbf_bus_fun_type,',
'       wbf_par_fun_id,',
'       (SELECT wbf_bus_fun_name',
'          FROM wapl_bus_fun',
'         WHERE wbf_bus_fun_id = a.wbf_par_fun_id) Par_Desc,',
'       (SELECT wbf_bus_fun_alias_name',
'          FROM wapl_bus_fun',
'         WHERE wbf_bus_fun_id = a.wbf_par_fun_id) Par_alias_Desc,',
'       DECODE(wbf_visible,''Y'',''Main'',''N'',''Sub'') wbf_visible,',
'       wbf_icon,',
'       DECODE(wbf_node_type,''MOD'',''Module'',''SET'',''Setup'',''FRM'',''Transaction'',''RPT'',''Analytics'',''REP'',''Report'',''MIG'',''Migration'') wbf_node_type,',
'       wbf_cre_by,',
'       wbf_cre_ip_addr,',
'       wbf_cre_os_user,',
'       wbf_cre_emp_id,',
'       wbf_cre_date,',
'       wbf_upd_by,',
'       wbf_upd_ip_addr,',
'       wbf_upd_os_user,',
'       wbf_upd_emp_id,',
'       wbf_upd_date,',
'       wbf_srch_flag,',
'       wbf_asgn_to,',
'       wbf_asgn_date,',
'       wbf_asgn_status,',
'       wbf_appl_no,',
'       wbf_std_vert_type,',
'       wbf_vertical_id,',
'       (SELECT EV_VERTICAL_DESC',
'         FROM ERP_VERTICAL',
'        WHERE EV_VERTICAL_ID = wbf_vertical_id)VERTICAL_DESC ,',
'       wbf_vert_bus_fun_name,',
'       wbf_bus_fun_narration,',
'       wbf_bus_fun_mis_name,',
'       wbf_form_loc1,',
'       wbf_form_icon,',
'       wbf_form_id,',
'       DECODE(wbf_active_flag,''Y'',''Yes'',''N'',''No'') wbf_active_flag,',
'       wbf_module_id,',
'       DECODE(wbf_module_id,''HRM'',''Payroll'',''FIN'',''Financials'') as wbf_par_fun_alias_name,',
'       wbf_bus_fun_alias_name,',
'       wbf_screen_count,',
'       wbf_print_seq',
'  FROM wapl_bus_fun a',
' WHERE ((INSTR(UPPER(wbf_bus_fun_id), UPPER(:P11130004_BUS_FUN_ID)) > 0)',
'         OR (INSTR(UPPER(wbf_bus_fun_name), UPPER(:P11130004_BUS_FUN_ID)) > 0 )',
'          OR :P11130004_BUS_FUN_ID IS NULL)  ',
'  AND   (wbf_vertical_id =  :P11130004_VERTICAL_ID  or :P11130004_VERTICAL_ID is null )',
'  AND ((INSTR(UPPER(wbf_form_id), UPPER(:P11130004_FORM_ID)) > 0 )',
'        OR (INSTR(UPPER(wbf_bus_fun_name), UPPER(:P11130004_FORM_ID)) > 0)',
'        OR :P11130004_FORM_ID IS NULL)',
'  AND ((instr(:P11130004_TYPE || '':'', wbf_node_type || '':'') > 0) or :P11130004_TYPE is null)',
'--   AND (wbf_node_type   = :P11130004_TYPE OR :P11130004_TYPE IS NULL)',
'  AND wbf_visible = ''Y''',
'  AND (wbf_visible     = :P11130004_NODE OR :P11130004_NODE IS NULL)',
'  AND (wbf_std_vert_type = :P11130004_VERTICAL_TYPE OR :P11130004_VERTICAL_TYPE IS NULL)',
'  AND (wbf_active_flag = :P11130004_ACTIVE OR :P11130004_ACTIVE IS NULL)',
'  AND (wbf_module_id   = :P11130004_MODULE OR :P11130004_MODULE IS NULL)',
'  AND :P11130004_SHOW_DATA = ''Y'')',
'  where ((INSTR(UPPER(wbf_par_fun_id), UPPER(:P11130004_PAR_BUS_FUN_ID)) > 0 )',
'        OR (INSTR(UPPER(Par_Desc), UPPER(:P11130004_PAR_BUS_FUN_ID)) > 0)',
'         OR :P11130004_PAR_BUS_FUN_ID IS NULL)',
'',
'  /*AND (a.wbf_bus_fun_id IN',
'           (SELECT wbf_bus_fun_id',
'              FROM (SELECT wbf_bus_fun_id',
'                      FROM wapl_bus_fun',
'                     WHERE (INSTR(UPPER(wbf_par_fun_id),UPPER(:P11130004_PAR_BUS_FUN_ID)) > 0',
'                             OR wbf_par_fun_id IN (SELECT wbf_bus_fun_id FROM wapl_bus_fun WHERE wbf_node_type =''MOD''  AND wbf_par_fun_id IS NULL AND INSTR(UPPER(wbf_bus_fun_name),UPPER(:P11130004_PAR_BUS_FUN_ID)) > 0)',
'                           )',
'                   UNION ALL',
'                   SELECT wbf_bus_fun_id',
'                      FROM wapl_bus_fun',
'                     WHERE wbf_par_fun_id IN (SELECT wbf_bus_fun_id',
'                                                FROM wapl_bus_fun',
'                                               WHERE(INSTR(UPPER(wbf_par_fun_id),UPPER(:P11130004_PAR_BUS_FUN_ID)) > 0',
'                                                     OR wbf_par_fun_id IN (SELECT wbf_bus_fun_id FROM wapl_bus_fun WHERE wbf_node_type =''MOD''  AND wbf_par_fun_id IS NULL AND INSTR(UPPER(wbf_bus_fun_name),UPPER(:P11130004_PAR_BUS_FUN_ID)) > 0)',
'                                                    ) )',
'                    UNION ALL',
'                    SELECT wbf_bus_fun_id',
'                      FROM wapl_bus_fun',
'                     WHERE wbf_par_fun_id IN',
'                              (SELECT wbf_bus_fun_id',
'                                 FROM wapl_bus_fun',
'                                WHERE wbf_par_fun_id IN',
'                                         (SELECT wbf_bus_fun_id',
'                                            FROM wapl_bus_fun',
'                                           WHERE (INSTR(UPPER(wbf_par_fun_id),UPPER(:P11130004_PAR_BUS_FUN_ID)) > 0',
'                                                 OR wbf_par_fun_id IN (SELECT wbf_bus_fun_id FROM wapl_bus_fun WHERE wbf_node_type =''MOD''  AND wbf_par_fun_id IS NULL AND INSTR(UPPER(wbf_bus_fun_name),UPPER(:P11130004_PAR_BUS_FUN_ID)) > 0)',
'                                               )))',
'                           ))',
'        OR :P11130004_PAR_BUS_FUN_ID IS NULL)  */',
'ORDER BY wbf_par_fun_id,wbf_seq_no',
'        '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P11130004_BUS_FUN_ID,P11130004_PAR_BUS_FUN_ID,P11130004_FORM_ID,P11130004_TYPE,P11130004_NODE,P11130004_ACTIVE,P11130004_SHOW_DATA,P11130004_MODULE,P11130004_VERTICAL_ID,P11130004_VERTICAL_TYPE'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Bus. Fun.'
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
 p_id=>wwv_flow_imp.id(6593321431655119467)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'10'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1111359596111508439
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6593322248419119476)
,p_db_column_name=>'PAR_DESC'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Par. Bus. Fun. Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6593321462428119468)
,p_db_column_name=>'ROWID'
,p_display_order=>10
,p_column_identifier=>'A'
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
 p_id=>wwv_flow_imp.id(6338958481143612342)
,p_db_column_name=>'VERTICAL_DESC'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Vertical Desc.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647740269754216853)
,p_db_column_name=>'WBF_ACTIVE_FLAG'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Active'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647739348469216844)
,p_db_column_name=>'WBF_APPL_NO'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Appl#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647739231123216842)
,p_db_column_name=>'WBF_ASGN_DATE'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Wbf Asgn Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647739299810216843)
,p_db_column_name=>'WBF_ASGN_STATUS'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Wbf Asgn Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647739076343216841)
,p_db_column_name=>'WBF_ASGN_TO'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Wbf Asgn To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6134036843152281729)
,p_db_column_name=>'WBF_BUS_FUN_ALIAS_NAME'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Bus. Fun. Alias Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6593321674846119470)
,p_db_column_name=>'WBF_BUS_FUN_ID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Bus. Fun. ID'
,p_column_link=>'f?p=&APP_ID.:86:&SESSION.::&DEBUG.::P86_ROWID,P86_SHOW_DATA,P86_TITAL:#ROWID#,&P11130004_SHOW_DATA.,Edit Bus. Fun.'
,p_column_linktext=>'#WBF_BUS_FUN_ID#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647739860814216849)
,p_db_column_name=>'WBF_BUS_FUN_MIS_NAME'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Wbf Bus Fun Mis Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6593321918782119472)
,p_db_column_name=>'WBF_BUS_FUN_NAME'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Bus. Fun. Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647739742718216848)
,p_db_column_name=>'WBF_BUS_FUN_NARRATION'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Wbf Bus Fun Narration'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6593321948785119473)
,p_db_column_name=>'WBF_BUS_FUN_SHORT_NAME'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Wbf Bus Fun Short Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6593322107148119474)
,p_db_column_name=>'WBF_BUS_FUN_TYPE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Wbf Bus Fun Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647738001591216830)
,p_db_column_name=>'WBF_CRE_BY'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Wbf Cre By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647738369914216834)
,p_db_column_name=>'WBF_CRE_DATE'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Wbf Cre Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647738236871216833)
,p_db_column_name=>'WBF_CRE_EMP_ID'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Wbf Cre Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647738088377216831)
,p_db_column_name=>'WBF_CRE_IP_ADDR'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Wbf Cre Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647738206179216832)
,p_db_column_name=>'WBF_CRE_OS_USER'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Wbf Cre Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647740075844216851)
,p_db_column_name=>'WBF_FORM_ICON'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Wbf Form Icon'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647740203846216852)
,p_db_column_name=>'WBF_FORM_ID'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Form ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647739937196216850)
,p_db_column_name=>'WBF_FORM_LOC1'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Form Path'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6593322442448119478)
,p_db_column_name=>'WBF_ICON'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Wbf Icon'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6112166361283959129)
,p_db_column_name=>'WBF_MODULE_ID'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>' Module'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647737866284216829)
,p_db_column_name=>'WBF_NODE_TYPE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6593321817301119471)
,p_db_column_name=>'WBF_PAGE_NO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Page No.'
,p_column_type=>'NUMBER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6119929829764176938)
,p_db_column_name=>'WBF_PAR_FUN_ALIAS_NAME'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Par. Bus. Fun. Alias Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6593322152273119475)
,p_db_column_name=>'WBF_PAR_FUN_ID'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Par. Bus. Fun. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6951476635585895286)
,p_db_column_name=>'WBF_PRINT_SEQ'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Print Seq.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6390643348809765547)
,p_db_column_name=>'WBF_SCREEN_COUNT'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Sub Report Count'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6593321568861119469)
,p_db_column_name=>'WBF_SEQ_NO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Seq. No.'
,p_column_type=>'NUMBER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647738981252216840)
,p_db_column_name=>'WBF_SRCH_FLAG'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Wbf Srch Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647739467514216845)
,p_db_column_name=>'WBF_STD_VERT_TYPE'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Vertical Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647738503804216835)
,p_db_column_name=>'WBF_UPD_BY'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Wbf Upd By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647738869438216839)
,p_db_column_name=>'WBF_UPD_DATE'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Wbf Upd Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647738739577216838)
,p_db_column_name=>'WBF_UPD_EMP_ID'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Wbf Upd Emp Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647738598743216836)
,p_db_column_name=>'WBF_UPD_IP_ADDR'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Wbf Upd Ip Addr'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647738682633216837)
,p_db_column_name=>'WBF_UPD_OS_USER'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Wbf Upd Os User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647739618132216846)
,p_db_column_name=>'WBF_VERTICAL_ID'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Wbf Vertical Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6647739704519216847)
,p_db_column_name=>'WBF_VERT_BUS_FUN_NAME'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Vertical Bus Fun Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6593322379950119477)
,p_db_column_name=>'WBF_VISIBLE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Node'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6647786879384218963)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'11658251'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'WBF_BUS_FUN_ID:WBF_BUS_FUN_NAME:WBF_BUS_FUN_ALIAS_NAME:WBF_PAR_FUN_ID:PAR_DESC:WBF_PAR_FUN_ALIAS_NAME:WBF_NODE_TYPE:WBF_MODULE_ID:WBF_STD_VERT_TYPE:VERTICAL_DESC:WBF_APPL_NO:WBF_PAGE_NO:WBF_SCREEN_COUNT:WBF_SEQ_NO:WBF_ACTIVE_FLAG:WBF_PRINT_SEQ'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6500232669514867234)
,p_plug_name=>'Bus. Fun. List'
,p_static_id=>'bus-fun-list'
,p_title=>'Find Bus. Fun. List'
,p_region_name=>'find'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--controlsPosEnd:is-expanded:t-Region--scrollBody:t-Form--slimPadding'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650500665378505339)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6500234325313867250)
,p_plug_name=>'Favorite Button'
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6500233494021867242)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(6500232669514867234)
,p_button_name=>'ADD'
,p_static_id=>'add'
,p_button_static_id=>'addbtn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapLeft:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:86:&SESSION.::&DEBUG.:CR,86:P86_TITAL:Add Bus. Fun.'
,p_button_css_classes=>'addbtn'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6500233687138867244)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(6500232669514867234)
,p_button_name=>'Clear'
,p_static_id=>'clear'
,p_button_static_id=>'Clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6759494685874188285)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(6500232669514867234)
,p_button_name=>'Clear123'
,p_static_id=>'clear-2'
,p_button_static_id=>'Clear123'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6829245633195893490)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(6500232669514867234)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_static_id=>'cancelbtn'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'&GLOBAL_HOME_URL.'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6500233933373867246)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_imp.id(6500232669514867234)
,p_button_name=>'Favorities'
,p_static_id=>'favorities'
,p_button_static_id=>'F'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--gapRight:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Favorities'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'closebtn'
,p_icon_css_classes=>'.t-icon'
,p_button_cattributes=>'onclick="global_fav();"'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6500233590162867243)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(6500232669514867234)
,p_button_name=>'Go_To_Report'
,p_static_id=>'go-to-report'
,p_button_static_id=>'SEARCH'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7393560389166755733)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8608959758193372868)
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
 p_id=>wwv_flow_imp.id(6593320546943119459)
,p_name=>'P11130004_ACTIVE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6500232669514867234)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6500232751236867235)
,p_name=>'P11130004_BUS_FUN_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6500232669514867234)
,p_prompt=>'Bus. Fun.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'AAM0004_BUS_FUN_ID'
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
  'title', 'Select the Bus. Fun.',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6500234357352867251)
,p_name=>'P11130004_FAVORITE_FLAG'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6500234325313867250)
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
 p_id=>wwv_flow_imp.id(6500233184107867239)
,p_name=>'P11130004_FORM_ID'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(6500232669514867234)
,p_prompt=>'Form'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'AAM0004_FROM_ID'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUp="this.value=this.value.toUpperCase();"'
,p_colspan=>3
,p_display_when_type=>'NEVER'
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
  'title', 'Select the Form',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6112166651730959132)
,p_name=>'P11130004_MODULE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6500232669514867234)
,p_prompt=>'Module'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT apbfmn_desc1,',
'       apbfmn_id       ',
'  FROM appl_bus_fun_module_name',
' WHERE apbfmn_id <> ''MIG''',
' ORDER BY apbfmn_print_seq_no'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>6
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-left-sm'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the module',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6593320479264119458)
,p_name=>'P11130004_NODE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6500232669514867234)
,p_prompt=>'Node'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Main;Y,Sub;N'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6500232939797867237)
,p_name=>'P11130004_PAR_BUS_FUN_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6500232669514867234)
,p_prompt=>'Par. Bus. Fun.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'AAM0004_PAR_BUS_FUN'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_tag_attributes=>'onKeyUP="this.value=this.value.toUpperCase();"'
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
  'title', 'Select the Par. Bus. Fun',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6647741253578216863)
,p_name=>'P11130004_SHOW_DATA'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6500232669514867234)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6500233346113867241)
,p_name=>'P11130004_TYPE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6500232669514867234)
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC2:Setup;SET,Transaction;FRM,Report;REP,Analytics;RPT,Data Management;DMM,Module;MOD'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_imp.id(10650578336760505429)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '3')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6338958296864612341)
,p_name=>'P11130004_VERTICAL_ID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6500232669514867234)
,p_prompt=>'Vertical '
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT EV_VERTICAL_DESC,',
'    EV_VERTICAL_ID',
'     FROM  ERP_VERTICAL',
'     ORDER BY EV_VERTICAL_DESC'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:margin-right-sm'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select Vertical',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6263263533504623415)
,p_name=>'P11130004_VERTICAL_TYPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6500232669514867234)
,p_prompt=>'Vertical Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Standard;S,Vertical;V'
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
 p_id=>wwv_flow_imp.id(7393560127665755730)
,p_name=>'CLEAE'
,p_static_id=>'cleae'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7393560279784755732)
,p_event_id=>wwv_flow_imp.id(7393560127665755730)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11130004_BUS_FUN_ID,P11130004_PAR_BUS_FUN_ID,P11130004_FORM_ID,P11130004_NODE,P11130004_ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7393560197920755731)
,p_event_id=>wwv_flow_imp.id(7393560127665755730)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("find").show();',
    'apex.item("detail").hide();')))).to_clob
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_server_condition_expr1=>'P11130004_SHOW_DATA'
,p_server_condition_expr2=>'Y'
,p_build_option_id=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6647740649452216857)
,p_name=>'Clear Region'
,p_static_id=>'clear-region'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6759494685874188285)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6647740924298216859)
,p_event_id=>wwv_flow_imp.id(6647740649452216857)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11130004_BUS_FUN_ID,P11130004_FAVORITE_FLAG,P11130004_PAR_BUS_FUN_ID,P11130004_FORM_ID,P11130004_NODE,P11130004_ACTIVE,P11130004_SHOW_DATA,P11130004_MODULE,P11130004_VERTICAL_ID,P11130004_VERTICAL_TYPE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7974719453914067348)
,p_event_id=>wwv_flow_imp.id(6647740649452216857)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'refresh'
,p_static_id=>'refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8608959758193372868)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_build_option_id=>wwv_flow_imp.id(7619582453551492551)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7393560472310755734)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7393560389166755733)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7393560558043755735)
,p_event_id=>wwv_flow_imp.id(7393560472310755734)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("find").show();',
    'apex.item("ig_line").hide();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6776278738931275949)
,p_name=>'P11130004_FAVORITE_FLAG'
,p_static_id=>'p11130004-favorite-flag'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11130004_FAVORITE_FLAG'
,p_condition_element=>'P11130004_FAVORITE_FLAG'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6776279640528275953)
,p_event_id=>wwv_flow_imp.id(6776278738931275949)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6500233933373867246)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6776280175254275953)
,p_event_id=>wwv_flow_imp.id(6776278738931275949)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(6500233933373867246)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6647740439280216855)
,p_name=>'Report Refresh'
,p_static_id=>'report-refresh'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6500233590162867243)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7393560005875755729)
,p_event_id=>wwv_flow_imp.id(6647740439280216855)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("ig_line").show();',
    'apex.item("find").hide();')))).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P11130004_SHOW_DATA'
,p_client_condition_expression=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(8242176855035635360)
,p_event_id=>wwv_flow_imp.id(6647740439280216855)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'slideclose();')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5757954474367449778)
,p_event_id=>wwv_flow_imp.id(6647740439280216855)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-3'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.item("find").show();',
    'apex.item("ig_line").show();',
    'apex.jQuery(''#ig_line_ir'').interactiveReport("reset");',
    'apex.region("ig_line").refresh();',
    'slideclose();')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6647740537073216856)
,p_event_id=>wwv_flow_imp.id(6647740439280216855)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8608959758193372868)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6647741169836216862)
,p_event_id=>wwv_flow_imp.id(6647740439280216855)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11130004_SHOW_DATA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'Y')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
