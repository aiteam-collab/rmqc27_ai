prompt --application/pages/page_00048
begin
--   Manifest
--     PAGE: 00048
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
 p_id=>48
,p_name=>'Work Flow History'
,p_alias=>'WORK-FLOW-HISTORY'
,p_page_mode=>'MODAL'
,p_step_title=>'Work Flow History'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'.a-IRR-headerLink, .a-IRR-headerLink:hover {',
'    text-decoration: none;',
'    color: white;',
'    background:#00b1e7 !important;/// #0076df;',
'}',
'.a-IRR-table th {',
'    border: 0px;',
'    background-color:#a9e5f7 !important;/// #fbce4a;',
'    font-family: arial;',
'    color:black;',
'}',
'/*',
'',
'.a-IRR-header:hover {',
'    background-color: #fbce4a;',
'    color: #1818f9;',
'}',
'.a-IRR-table td {',
'    --a-gv-cell-border-color: #242424;',
'    border-left: 1px solid #f0f0f0;',
'    border-top: 1px solid #262626;',
'}',
'.a-IRR-paginationWrap--bottom {',
'    border-top-color: #242424;',
'}',
'.a-IRR-table tr td:last-child {',
'    border-right-color: #242424;',
'}',
'.a-IRR {',
'    border-radius: 2px;',
'    border-color: #151111;',
'    background-color: #ffffff;',
'}*/'))
,p_step_template=>wwv_flow_imp.id(10650464521724505296)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'90%'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6830468747183201266)
,p_plug_name=>'Work Flow History'
,p_static_id=>'work-flow-history'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 9/14/2022 2:32:35 PM (QP5 v5.163.1008.3004) */',
'SELECT wfdcl_bu,',
'       wfdcl_type,',
'       wfdcl_doc_pfx,',
'       wfdcl_doc_no,',
'       wfdcl_status,',
'       CASE',
'          WHEN wfdcl_status IN (''E'', ''N'')',
'          THEN',
'             ''Entry Completed''',
'          WHEN wfdcl_status = ''C''',
'          THEN',
'             ''Cancelled''',
'          WHEN wfdcl_status = ''R''',
'          THEN',
'             ''Returned''',
'          WHEN wfdcl_status = ''A''',
'          THEN',
'             ''Approved''',
'          ELSE',
'             (SELECT wfaa_status_desc',
'                FROM work_flow_appr_actvt',
'               WHERE     wfaa_bu = wfdcl_bu',
'                     AND wfaa_wf_id = wfdcl_type',
'                     AND wfaa_status = wfdcl_status)',
'       END',
'          "Status",',
'       DECODE (wfdcl_status,',
'               ''E'', ''blue'',',
'               ''N'', ''blue'',',
'               ''P'', ''cornflowerblue'',',
'               ''M'', ''brown'',',
'               ''A'', ''green'',',
'               ''C'', ''red'',',
'               ''L'', ''red'',',
'               ''R'', ''orange'')',
'          "color",',
'       wfdcl_spplr_id,',
'       wfdcl_cust_id,',
'       wfdcl_lvl1,',
'       wfdcl_lvl2,',
'       wfdcl_lvl3,',
'       wfdcl_lvl4,',
'       wfdcl_accts,',
'       wfdcl_ctrl_person,',
'       wfdcl_seqno,',
'       wfdcl_prj_id,',
'       wfdcl_rnd_prj_id,',
'       wfdcl_jrnl_type,',
'       wfdcl_value,',
'       wfdcl_frwd_rtn,',
'       wfdcl_message,',
'       wfdcl_appr_no,',
'       wfdcl_qc_rev,',
'       wfdcl_action_date,',
'       wfdcl_prod_id,',
'       wfdcl_prod_rev,',
'       wfdcl_priority,',
'       DECODE (wfdcl_priority,  ''1'', ''High'',  ''2'', ''Medium'',  ''3'', ''Low'')',
'          "Priority",',
'       wfdcl_po_mode,',
'       wfdcl_qc_ins_mode,',
'       wfdcl_wf_no,',
'       wfdcl_plnt,',
'       wfdcl_prev_ctrl_person,',
'       wfdcl_doc_sfx,',
'       wfdcl_src_bu,',
'       wfdcl_src_plnt,',
'       wfdcl_src_user,',
'       wfdcl_lvl_prj,',
'       wfdcl_auth_type,',
'       wfdcl_emp_id,',
'       CASE',
'          WHEN wfdcl_auth_type = ''P'' AND wfdcl_ctrl_person IS NOT NULL',
'          THEN',
'             wfdcl_emp_id',
'          WHEN wfdcl_auth_type = ''E'' AND wfdcl_ctrl_person IS NOT NULL',
'          THEN',
'             wfdcl_ctrl_person',
'          WHEN wfdcl_auth_type = ''E'' AND wfdcl_ctrl_person IS NULL',
'          THEN',
'             wfdcl_emp_id',
'       END',
'          "DOC_WITH_EMP",',
'       CASE',
'          WHEN wfdcl_auth_type = ''P'' AND wfdcl_ctrl_person IS NOT NULL',
'          THEN',
'             (SELECT DECODE ( (SELECT applctrl_desc_level',
'                                 FROM appl_control',
'                                WHERE applctrl_bu = wfdcl_bu),',
'                             1, hrpos_pos_name1,',
'                             NVL (hrpos_pos_name2, hrpos_pos_name1))',
'                        AS Name',
'                FROM hr_positions',
'               WHERE hrpos_bu = wfdcl_bu',
'                     AND hrpos_pos_id = wfdcl_ctrl_person)',
'          WHEN wfdcl_auth_type = ''E'' AND wfdcl_ctrl_person IS NULL',
'          THEN',
'             NULL',
'          WHEN wfdcl_auth_type = ''E'' AND wfdcl_ctrl_person IS NOT NULL',
'          THEN',
'             (SELECT (DECODE (',
'                         (SELECT applctrl_desc_level',
'                            FROM appl_control',
'                           WHERE applctrl_bu = wfdcl_bu),',
'                         1,    LTRIM (RTRIM (emp_first_name1))',
'                            || '' ''',
'                            || LTRIM (RTRIM (emp_middle_name1))',
'                            || '' ''',
'                            || LTRIM (RTRIM (emp_last_name1)),',
'                         NVL (',
'                               LTRIM (RTRIM (emp_first_name2))',
'                            || LTRIM (RTRIM (emp_middle_name2))',
'                            || LTRIM (RTRIM (emp_last_name2)),',
'                               LTRIM (RTRIM (emp_first_name1))',
'                            || '' ''',
'                            || LTRIM (RTRIM (emp_middle_name1))',
'                            || '' ''',
'                            || LTRIM (RTRIM (emp_last_name1)))))',
'                        emp_name',
'                FROM employees',
'               WHERE emp_bu = wfdcl_bu AND emp_emp_id = wfdcl_ctrl_person)',
'       END',
'          "WITH_EMP",',
'       CASE',
'          WHEN     wfdcl_auth_type = ''P''',
'               AND wfdcl_ctrl_person IS NOT NULL',
'               AND wfdcl_emp_id IS NOT NULL',
'          THEN',
'             (SELECT appluser_id',
'                FROM appl_users',
'               WHERE appluser_bu = wfdcl_bu',
'                 AND appluser_emp_id = wfdcl_emp_id',
'                 AND appluser_status = ''A'')',
'          WHEN     wfdcl_auth_type = ''E''',
'               AND wfdcl_ctrl_person IS NOT NULL',
'               AND wfdcl_emp_id IS NOT NULL',
'          THEN',
'             (SELECT appluser_id',
'                FROM appl_users',
'               WHERE appluser_bu = wfdcl_bu',
'                 AND appluser_emp_id = wfdcl_emp_id',
'                 AND appluser_status = ''A'')',
'          WHEN wfdcl_auth_type = ''E'' AND WFDCL_EMP_ID IS NOT NULL',
'          THEN',
'             (SELECT appluser_id',
'                FROM appl_users',
'               WHERE     appluser_bu = wfdcl_bu',
'                     AND appluser_emp_id = wfdcl_emp_id',
'                     AND appluser_status = ''A'')',
'       END',
'          "WITH_USER",',
'       CASE',
'          WHEN     wfdcl_auth_type = ''P''',
'               AND wfdcl_prev_ctrl_person IS NOT NULL',
'               AND wfdcl_frwd_rtn IN (''F'', ''R'', ''C'')',
'          THEN',
'             (SELECT DECODE ( (SELECT applctrl_desc_level',
'                                 FROM appl_control',
'                                WHERE applctrl_bu = wfdcl_bu),',
'                             1, hrpos_pos_name1,',
'                             NVL (hrpos_pos_name2, hrpos_pos_name1))',
'                        AS Name',
'                FROM hr_positions',
'               WHERE hrpos_bu = wfdcl_bu',
'                     AND hrpos_pos_id = wfdcl_prev_ctrl_person)',
'          WHEN wfdcl_auth_type = ''E'' AND wfdcl_frwd_rtn IN (''F'', ''R'', ''C'')',
'          THEN',
'             wfdcl_prev_ctrl_person',
'       END',
'          "DOC_FROM_EMP",',
'       CASE',
'          WHEN     wfdcl_auth_type = ''P''',
'               AND wfdcl_prev_ctrl_person IS NOT NULL',
'               AND wfdcl_frwd_rtn IN (''F'', ''R'', ''C'')',
'          THEN',
'             (SELECT DECODE ( (SELECT applctrl_desc_level',
'                                 FROM appl_control',
'                                WHERE applctrl_bu = wfdcl_bu),',
'                             1, hrpos_pos_name1,',
'                             NVL (hrpos_pos_name2, hrpos_pos_name1))',
'                        AS Name',
'                FROM hr_positions',
'               WHERE hrpos_bu = wfdcl_bu',
'                     AND hrpos_pos_id = wfdcl_prev_ctrl_person)',
'          WHEN     wfdcl_auth_type = ''E''',
'               AND wfdcl_frwd_rtn IN (''F'', ''R'', ''C'')',
'               AND wfdcl_prev_ctrl_person IS NULL',
'          THEN',
'             NULL',
'          WHEN wfdcl_prev_ctrl_person IS NOT NULL',
'          THEN',
'             (SELECT DECODE (',
'                        (SELECT applctrl_desc_level',
'                           FROM appl_control',
'                          WHERE applctrl_bu = wfdcl_bu),',
'                        1, (   emp_first_name1',
'                            || '' ''',
'                            || emp_middle_name1',
'                            || '' ''',
'                            || emp_last_name1),',
'                        NVL (',
'                           (   emp_first_name2',
'                            || emp_middle_name2',
'                            || emp_last_name2),',
'                           (   emp_first_name1',
'                            || '' ''',
'                            || emp_middle_name1',
'                            || '' ''',
'                            || emp_last_name1)))',
'                        AS emp_name',
'                FROM appl_users, employees',
'               WHERE     appluser_bu = emp_bu',
'                     AND appluser_emp_id = emp_emp_id',
'                     AND appluser_bu = wfdcl_bu',
'                     AND appluser_id = wfdcl_prev_ctrl_person)',
'       END',
'          "FROM_EMP",',
'       CASE',
'          WHEN     wfdcl_auth_type = ''P''',
'               AND wfdcl_emp_id IS NOT NULL',
'               AND wfdcl_prev_ctrl_person IS NOT NULL',
'               AND wfdcl_frwd_rtn IN (''F'', ''R'', ''C'')',
'          THEN',
'             (SELECT appluser_id',
'                FROM appl_users',
'               WHERE     appluser_bu = wfdcl_bu',
'                     AND appluser_emp_id = wfdcl_emp_id',
'                     AND appluser_status = ''A'')',
'          WHEN     wfdcl_auth_type = ''E''',
'               AND wfdcl_frwd_rtn IN (''F'', ''R'', ''C'')',
'               AND wfdcl_emp_id IS NOT NULL',
'          THEN',
'             (SELECT appluser_id',
'                FROM appl_users',
'               WHERE     appluser_bu = wfdcl_bu',
'                     AND appluser_emp_id = wfdcl_emp_id',
'                     AND appluser_status = ''A'')',
'       END',
'          "FROM_USER",',
'       wfdcl_prev_emp_id,',
'       wfdcl_prev_bu,',
'       wfdcl_cre_by,',
'       wfdcl_cre_ip_addr,',
'       wfdcl_cre_os_user,',
'       wfdcl_cre_date,',
'       wfdcl_upd_by,',
'       wfdcl_upd_ip_addr,',
'       wfdcl_upd_os_user,',
'       wfdcl_upd_date,',
'       wfdcl_cre_emp_id,',
'       wfdcl_upd_emp_id,',
'       wfdcl_coll_centr_id,',
'       (func_find_apex_dtls_wfh (wfdcl_auth_type,',
'                                 wfdcl_frwd_rtn,',
'                                 wfdcl_bu,',
'                                 wfdcl_ctrl_person,',
'                                 wfdcl_emp_id,',
'                                 wfdcl_appr_no,',
'                                 wfdcl_type,',
'                                 wfdcl_status,',
'                                 wfdcl_prev_bu,',
'                                 wfdcl_prev_ctrl_person,',
'                                 wfdcl_bu))',
'          "Details"',
'  FROM wf_doc_control_log',
' WHERE wfdcl_bu   = :Global_bu',
'   AND wfdcl_type = :P48_P_WF_TYPE',
'   AND wfdcl_plnt = :P48_P_PLNT',
'   AND (wfdcl_doc_pfx = :P48_P_DOC_PFX',
'   OR :P48_P_DOC_PFX IS NULL)',
'   AND wfdcl_doc_no = :P48_P_DOC_NO'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Work Flow History'
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
 p_id=>wwv_flow_imp.id(6830468829514201267)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>1348506993970590239
);
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(6912802140817428330)
,p_name=>'Forwarded From'
,p_static_id=>'forwarded-from'
,p_display_sequence=>20
);
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(6912802037410428329)
,p_name=>'With Whom'
,p_static_id=>'with-whom'
,p_display_sequence=>10
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087019685794950178)
,p_db_column_name=>'DOC_FROM_EMP'
,p_display_order=>540
,p_group_id=>wwv_flow_imp.id(6912802140817428330)
,p_column_identifier=>'BB'
,p_column_label=>' Emp.Id'
,p_column_type=>'STRING'
,p_static_id=>'DOC_FROM_EMP'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087019255018950173)
,p_db_column_name=>'DOC_WITH_EMP'
,p_display_order=>530
,p_group_id=>wwv_flow_imp.id(6912802037410428329)
,p_column_identifier=>'BA'
,p_column_label=>' Emp.Id'
,p_column_type=>'STRING'
,p_static_id=>'DOC_WITH_EMP'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087022081528950196)
,p_db_column_name=>'Details'
,p_display_order=>610
,p_column_identifier=>'BI'
,p_column_label=>'Details'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087020530761950185)
,p_db_column_name=>'FROM_EMP'
,p_display_order=>560
,p_group_id=>wwv_flow_imp.id(6912802140817428330)
,p_column_identifier=>'BD'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_static_id=>'FROM_EMP'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087021283756950190)
,p_db_column_name=>'FROM_USER'
,p_display_order=>590
,p_group_id=>wwv_flow_imp.id(6912802140817428330)
,p_column_identifier=>'BG'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_static_id=>'FROM_USER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087018904086950171)
,p_db_column_name=>'Priority'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Priority'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087020121487950182)
,p_db_column_name=>'Status'
,p_display_order=>550
,p_column_identifier=>'BC'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="color:#color#; font-weight:bold;">#Status#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087003037256950013)
,p_db_column_name=>'WFDCL_ACCTS'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Wfdcl Accts'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087007366412950071)
,p_db_column_name=>'WFDCL_ACTION_DATE'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'On'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD.MM.YYYY HH:MI:SS AM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087006671070950051)
,p_db_column_name=>'WFDCL_APPR_NO'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Wfdcl Appr No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087012949493950124)
,p_db_column_name=>'WFDCL_AUTH_TYPE'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Wfdcl Auth Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6086998668896949976)
,p_db_column_name=>'WFDCL_BU'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Wfdcl Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087018461106950168)
,p_db_column_name=>'WFDCL_COLL_CENTR_ID'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'Wfdcl Coll Centr Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087014600145950137)
,p_db_column_name=>'WFDCL_CRE_BY'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Wfdcl Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087015743481950146)
,p_db_column_name=>'WFDCL_CRE_DATE'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Wfdcl Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087017819826950163)
,p_db_column_name=>'WFDCL_CRE_EMP_ID'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'Wfdcl Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087014968664950138)
,p_db_column_name=>'WFDCL_CRE_IP_ADDR'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Wfdcl Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087015383254950143)
,p_db_column_name=>'WFDCL_CRE_OS_USER'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Wfdcl Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087003514321950017)
,p_db_column_name=>'WFDCL_CTRL_PERSON'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Wfdcl Ctrl Person'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087001094728949999)
,p_db_column_name=>'WFDCL_CUST_ID'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Wfdcl Cust Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6086999928349949993)
,p_db_column_name=>'WFDCL_DOC_NO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Wfdcl Doc No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6086999472776949984)
,p_db_column_name=>'WFDCL_DOC_PFX'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Wfdcl Doc Pfx'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087010986082950103)
,p_db_column_name=>'WFDCL_DOC_SFX'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Wfdcl Doc Sfx'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087013397583950128)
,p_db_column_name=>'WFDCL_EMP_ID'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087005876551950045)
,p_db_column_name=>'WFDCL_FRWD_RTN'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Wfdcl Frwd Rtn'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087005123839950032)
,p_db_column_name=>'WFDCL_JRNL_TYPE'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Wfdcl Jrnl Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087001534563950003)
,p_db_column_name=>'WFDCL_LVL1'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Wfdcl Lvl1'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087001890874950006)
,p_db_column_name=>'WFDCL_LVL2'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Wfdcl Lvl2'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087002245007950009)
,p_db_column_name=>'WFDCL_LVL3'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Wfdcl Lvl3'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087002707182950010)
,p_db_column_name=>'WFDCL_LVL4'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Wfdcl Lvl4'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087012608653950115)
,p_db_column_name=>'WFDCL_LVL_PRJ'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Wfdcl Lvl Prj'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087006255201950046)
,p_db_column_name=>'WFDCL_MESSAGE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087010213106950096)
,p_db_column_name=>'WFDCL_PLNT'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Wfdcl Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087008976572950087)
,p_db_column_name=>'WFDCL_PO_MODE'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Wfdcl Po Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087014161699950134)
,p_db_column_name=>'WFDCL_PREV_BU'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Wfdcl Prev Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087010558511950101)
,p_db_column_name=>'WFDCL_PREV_CTRL_PERSON'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Wfdcl Prev Ctrl Person'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087013834609950131)
,p_db_column_name=>'WFDCL_PREV_EMP_ID'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Wfdcl Prev Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087008571725950084)
,p_db_column_name=>'WFDCL_PRIORITY'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Wfdcl Priority'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087004258775950023)
,p_db_column_name=>'WFDCL_PRJ_ID'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Wfdcl Prj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087007827781950078)
,p_db_column_name=>'WFDCL_PROD_ID'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Wfdcl Prod Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087008228706950082)
,p_db_column_name=>'WFDCL_PROD_REV'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Wfdcl Prod Rev'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087009381001950090)
,p_db_column_name=>'WFDCL_QC_INS_MODE'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Wfdcl Qc Ins Mode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087007099087950063)
,p_db_column_name=>'WFDCL_QC_REV'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Wfdcl Qc Rev'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087004719317950029)
,p_db_column_name=>'WFDCL_RND_PRJ_ID'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Wfdcl Rnd Prj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087003857582950020)
,p_db_column_name=>'WFDCL_SEQNO'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087000687052949996)
,p_db_column_name=>'WFDCL_SPPLR_ID'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Wfdcl Spplr Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087011428158950106)
,p_db_column_name=>'WFDCL_SRC_BU'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Wfdcl Src Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087011830538950109)
,p_db_column_name=>'WFDCL_SRC_PLNT'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Wfdcl Src Plnt'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087012156911950112)
,p_db_column_name=>'WFDCL_SRC_USER'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Wfdcl Src User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087000261351949993)
,p_db_column_name=>'WFDCL_STATUS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Wfdcl Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6086999066232949981)
,p_db_column_name=>'WFDCL_TYPE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Wfdcl Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087016206464950151)
,p_db_column_name=>'WFDCL_UPD_BY'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Wfdcl Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087017369815950160)
,p_db_column_name=>'WFDCL_UPD_DATE'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'Wfdcl Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087018085351950165)
,p_db_column_name=>'WFDCL_UPD_EMP_ID'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'Wfdcl Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087016590925950153)
,p_db_column_name=>'WFDCL_UPD_IP_ADDR'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Wfdcl Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087016946311950157)
,p_db_column_name=>'WFDCL_UPD_OS_USER'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Wfdcl Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087005509113950040)
,p_db_column_name=>'WFDCL_VALUE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Wfdcl Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087009811199950093)
,p_db_column_name=>'WFDCL_WF_NO'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Wfdcl Wf No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087020856012950187)
,p_db_column_name=>'WITH_EMP'
,p_display_order=>570
,p_group_id=>wwv_flow_imp.id(6912802037410428329)
,p_column_identifier=>'BE'
,p_column_label=>' Employee'
,p_column_type=>'STRING'
,p_static_id=>'WITH_EMP'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087021696917950193)
,p_db_column_name=>'WITH_USER'
,p_display_order=>600
,p_group_id=>wwv_flow_imp.id(6912802037410428329)
,p_column_identifier=>'BH'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_static_id=>'WITH_USER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087022459676950203)
,p_db_column_name=>'color'
,p_display_order=>620
,p_column_identifier=>'BJ'
,p_column_label=>'Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6830965089167821827)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'840505'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'WFDCL_SEQNO:DOC_WITH_EMP:WITH_EMP:WITH_USER:DOC_FROM_EMP:FROM_EMP:FROM_USER:Status:WFDCL_ACTION_DATE:WFDCL_MESSAGE:Priority:Details:color'
,p_sort_column_1=>'WFDCL_SEQNO'
,p_sort_direction_1=>'DESC'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6087024417052950210)
,p_name=>'P48_P_DOC_NO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6830468747183201266)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6087023955657950210)
,p_name=>'P48_P_DOC_PFX'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6830468747183201266)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6087023546416950210)
,p_name=>'P48_P_PLNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6830468747183201266)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6087023152429950206)
,p_name=>'P48_P_WF_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6830468747183201266)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6087024745052950213)
,p_name=>'IR Column '
,p_static_id=>'ir-column'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6087025286290950215)
,p_event_id=>wwv_flow_imp.id(6087024745052950213)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-com-clarifit-apexplugin-ir-column-grouping'
,p_action=>'PLUGIN_COM.CLARIFIT.APEXPLUGIN.IR_COLUMN_GROUPING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'true')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6087025658519950215)
,p_name=>'Ir Column2'
,p_static_id=>'ir-column-2'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6830468747183201266)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6087026178563950217)
,p_event_id=>wwv_flow_imp.id(6087025658519950215)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6830468747183201266)
);
wwv_flow_imp.component_end;
end;
/
