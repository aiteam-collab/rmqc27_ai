prompt --application/pages/page_23613101001
begin
--   Manifest
--     PAGE: 23613101001
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
 p_id=>23613101001
,p_name=>'Workflow History'
,p_alias=>'WORKFLOW-HISTORY'
,p_page_mode=>'MODAL'
,p_step_title=>'WF Log.'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* For Report Header */',
'.a-IRR-table {',
'    border-collapse: collapse;',
'    table-layout: auto;',
'    border-spacing: 0;',
'    white-space: nowrap;',
'    word-wrap: break-word;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'1350'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7435539681049587231)
,p_plug_name=>'Work Flow History_1'
,p_static_id=>'work-flow-history'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
'        /*CASE',
'          WHEN      wfdcl_auth_type = ''P''',
'               AND  wfdcl_ctrl_person IS NOT NULL',
'          THEN',
'             (SELECT appluser_id',
'                FROM appl_users',
'               WHERE appluser_bu = :global_bu',
'                 AND appluser_emp_id = func_find_emp_pos_id(wfdcl_bu,wfdcl_ctrl_person)',
'                 AND appluser_status = ''A'')',
'          WHEN     wfdcl_auth_type = ''E''',
'               AND wfdcl_ctrl_person IS NOT NULL',
'          THEN',
'             (SELECT appluser_id',
'                FROM appl_users',
'               WHERE appluser_bu = :global_bu',
'                 AND appluser_emp_id =  wfdcl_ctrl_person',
'                 AND appluser_status = ''A'')',
'       END ',
'          "WITH_USER",*/',
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
'          THEN func_find_employee_desc1(wfdcl_prev_bu,WFDCL_PREV_CTRL_PERSON,1)',
'            /* (SELECT DECODE (',
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
'               WHERE     appluser_bu = emp_bu(+)',
'                     AND appluser_emp_id = emp_emp_id(+)',
'                     AND appluser_bu = wfdcl_bu',
'                     AND appluser_id = wfdcl_prev_ctrl_person)*/',
'       END',
'          "FROM_EMP",',
'       /*CASE',
'          WHEN     wfdcl_auth_type = ''P''',
'               AND wfdcl_prev_ctrl_person IS NOT NULL',
'               AND wfdcl_frwd_rtn IN (''F'', ''R'', ''C'')',
'          THEN',
'             (SELECT appluser_id',
'                FROM appl_users',
'               WHERE     appluser_bu = wfdcl_bu',
'                     AND appluser_emp_id = func_find_emp_pos_id(wfdcl_bu,wfdcl_prev_ctrl_person)',
'                     AND appluser_status = ''A'')',
'          WHEN     wfdcl_auth_type = ''E''',
'               AND wfdcl_frwd_rtn IN (''F'', ''R'', ''C'')',
'               AND wfdcl_prev_ctrl_person IS NOT NULL',
'          THEN',
'             (SELECT appluser_id',
'                FROM appl_users',
'               WHERE     appluser_bu = wfdcl_bu',
'                     AND appluser_emp_id = wfdcl_prev_ctrl_person',
'                     AND appluser_status = ''A'')',
'       END',
'          "FROM_USER",*/',
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
'   AND wfdcl_type = :P23613101001_WF_TYPE',
'   AND (wfdcl_plnt = :P23613101001_PLNT or :P23613101001_PLNT is null)',
'   AND (wfdcl_doc_pfx = :P23613101001_DOC_PFX OR :P23613101001_DOC_PFX IS NULL)',
'   AND (wfdcl_doc_no = :P23613101001_DOC_NO OR :P23613101001_DOC_NO IS NULL)',
'   AND (WFDCL_PROD_ID = :P23613101001_PROD_ID OR : P23613101001_PROD_ID IS NULL)',
'   AND (WFDCL_PROD_REV = :P23613101001_PROD_REV OR : P23613101001_PROD_REV IS NULL)',
'   AND (wfdcl_spplr_id = :P23613101001_PARTY_ID OR : P23613101001_PARTY_ID IS NULL)',
'   AND (wfdcl_cust_id  = :P23613101001_CUST_ID  OR :P23613101001_CUST_ID IS NULL)',
'   AND(WFDCL_INST_ID =TRIM(:P23613101001_INST_ID) OR :P23613101001_INST_ID IS NULL)',
'   order by WFDCL_SEQNO desc ,WFDCL_ACTION_DATE desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P23613101001_PLNT,P23613101001_WF_TYPE,P23613101001_DOC_PFX,P23613101001_DOC_NO,P23613101001_PROD_ID,P23613101001_PROD_REV,P23613101001_PARTY_ID,P23613101001_INST_ID'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Work Flow History_1'
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
 p_id=>wwv_flow_imp.id(7435539763380587232)
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
,p_internal_uid=>1953577927836976204
);
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(7517873074683814295)
,p_name=>'Forwarded From'
,p_static_id=>'forwarded-from'
,p_display_sequence=>20
);
wwv_flow_imp_page.create_worksheet_col_group(
 p_id=>wwv_flow_imp.id(7517872971276814294)
,p_name=>'With Whom'
,p_static_id=>'with-whom'
,p_display_sequence=>10
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087054645093997242)
,p_db_column_name=>'DOC_FROM_EMP'
,p_display_order=>540
,p_group_id=>wwv_flow_imp.id(7517873074683814295)
,p_column_identifier=>'BB'
,p_column_label=>' Emp.Id'
,p_column_type=>'STRING'
,p_static_id=>'DOC_FROM_EMP'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087054270325997237)
,p_db_column_name=>'DOC_WITH_EMP'
,p_display_order=>530
,p_group_id=>wwv_flow_imp.id(7517872971276814294)
,p_column_identifier=>'BA'
,p_column_label=>' Emp.Id'
,p_column_type=>'STRING'
,p_static_id=>'DOC_WITH_EMP'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087057085831997260)
,p_db_column_name=>'Details'
,p_display_order=>610
,p_column_identifier=>'BI'
,p_column_label=>'Details'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087055446655997248)
,p_db_column_name=>'FROM_EMP'
,p_display_order=>560
,p_group_id=>wwv_flow_imp.id(7517873074683814295)
,p_column_identifier=>'BD'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_static_id=>'FROM_EMP'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087053906902997232)
,p_db_column_name=>'Priority'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Priority'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087055063788997245)
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
 p_id=>wwv_flow_imp.id(6087038070591997065)
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
 p_id=>wwv_flow_imp.id(6087042390073997099)
,p_db_column_name=>'WFDCL_ACTION_DATE'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'On'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'&GLOBAL_RPT_DATE_MASK. HH24:MI:SS'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087041557716997088)
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
 p_id=>wwv_flow_imp.id(6087048031834997162)
,p_db_column_name=>'WFDCL_AUTH_TYPE'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Wfdcl Auth Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087033654220997003)
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
 p_id=>wwv_flow_imp.id(6087053518685997226)
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
 p_id=>wwv_flow_imp.id(6087049506563997182)
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
 p_id=>wwv_flow_imp.id(6087050728793997192)
,p_db_column_name=>'WFDCL_CRE_DATE'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Wfdcl Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087052683012997213)
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
 p_id=>wwv_flow_imp.id(6087049921022997184)
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
 p_id=>wwv_flow_imp.id(6087050280101997190)
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
 p_id=>wwv_flow_imp.id(6087038355209997067)
,p_db_column_name=>'WFDCL_CTRL_PERSON'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Wfdcl Ctrl Person'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087036094634997028)
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
 p_id=>wwv_flow_imp.id(6087034931969997012)
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
 p_id=>wwv_flow_imp.id(6087034442776997009)
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
 p_id=>wwv_flow_imp.id(6087045991378997143)
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
 p_id=>wwv_flow_imp.id(6087048262721997165)
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
 p_id=>wwv_flow_imp.id(6087040758644997084)
,p_db_column_name=>'WFDCL_FRWD_RTN'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Wfdcl Frwd Rtn'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087040015267997079)
,p_db_column_name=>'WFDCL_JRNL_TYPE'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Wfdcl Jrnl Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087036496456997040)
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
 p_id=>wwv_flow_imp.id(6087036908234997045)
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
 p_id=>wwv_flow_imp.id(6087037320319997056)
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
 p_id=>wwv_flow_imp.id(6087037652011997060)
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
 p_id=>wwv_flow_imp.id(6087047596773997159)
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
 p_id=>wwv_flow_imp.id(6087041189738997087)
,p_db_column_name=>'WFDCL_MESSAGE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087045149599997134)
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
 p_id=>wwv_flow_imp.id(6087044029988997123)
,p_db_column_name=>'WFDCL_PO_MODE'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Wfdcl Po Mode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087049130827997174)
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
 p_id=>wwv_flow_imp.id(6087045591064997138)
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
 p_id=>wwv_flow_imp.id(6087048653374997167)
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
 p_id=>wwv_flow_imp.id(6087043538077997113)
,p_db_column_name=>'WFDCL_PRIORITY'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Wfdcl Priority'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087039188330997073)
,p_db_column_name=>'WFDCL_PRJ_ID'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Wfdcl Prj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087042812826997106)
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
 p_id=>wwv_flow_imp.id(6087043174586997110)
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
 p_id=>wwv_flow_imp.id(6087044427271997129)
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
 p_id=>wwv_flow_imp.id(6087041982513997093)
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
 p_id=>wwv_flow_imp.id(6087039600321997076)
,p_db_column_name=>'WFDCL_RND_PRJ_ID'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Wfdcl Rnd Prj Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087038773607997070)
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
 p_id=>wwv_flow_imp.id(6087035695023997023)
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
 p_id=>wwv_flow_imp.id(6087046383232997148)
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
 p_id=>wwv_flow_imp.id(6087046757632997153)
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
 p_id=>wwv_flow_imp.id(6087047162537997156)
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
 p_id=>wwv_flow_imp.id(6087035292375997020)
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
 p_id=>wwv_flow_imp.id(6087034047887997007)
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
 p_id=>wwv_flow_imp.id(6087051044152997196)
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
 p_id=>wwv_flow_imp.id(6087052276054997209)
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
 p_id=>wwv_flow_imp.id(6087053078146997218)
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
 p_id=>wwv_flow_imp.id(6087051513080997199)
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
 p_id=>wwv_flow_imp.id(6087051911216997204)
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
 p_id=>wwv_flow_imp.id(6087040377654997081)
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
 p_id=>wwv_flow_imp.id(6087044761426997131)
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
 p_id=>wwv_flow_imp.id(6087055858679997253)
,p_db_column_name=>'WITH_EMP'
,p_display_order=>570
,p_group_id=>wwv_flow_imp.id(7517872971276814294)
,p_column_identifier=>'BE'
,p_column_label=>' Employee'
,p_column_type=>'STRING'
,p_static_id=>'WITH_EMP'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6087057437302997263)
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
 p_id=>wwv_flow_imp.id(7436036023034207792)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'840505'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'WFDCL_SEQNO:DOC_WITH_EMP:WITH_EMP:DOC_FROM_EMP:FROM_EMP:Status:WFDCL_ACTION_DATE:WFDCL_MESSAGE:Priority:Details'
,p_sort_column_2=>'WFDCL_SEQNO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'WITH_EMP'
,p_sort_direction_3=>'DESC'
,p_sort_column_4=>'Details'
,p_sort_direction_4=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11546195103884413371)
,p_plug_name=>'Workflow History'
,p_static_id=>'workflow-history'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 11/30/2020 6:13:10 PM (QP5 v5.163.1008.3004) */',
'  SELECT wfdcl_bu,',
'         wfdcl_type,',
'         wfdcl_doc_pfx,',
'         wfdcl_doc_no,',
'         wfdcl_status,',
'         wfdcl_spplr_id,',
'         wfdcl_cust_id,',
'         wfdcl_lvl1,',
'         wfdcl_lvl2,',
'         wfdcl_lvl3,',
'         wfdcl_lvl4,',
'         wfdcl_accts,',
'         wfdcl_ctrl_person,',
'         wfdcl_seqno "Line",',
'         wfdcl_prj_id,',
'         wfdcl_rnd_prj_id,',
'         wfdcl_jrnl_type,',
'         wfdcl_value,',
'         wfdcl_frwd_rtn,',
'         wfdcl_message"Message",',
'         wfdcl_appr_no,',
'         wfdcl_qc_rev,',
'         wfdcl_action_date"On",',
'         wfdcl_prod_id,',
'         wfdcl_prod_rev,',
'         decode(wfdcl_priority,''1'',''High'',''2'',''Medium'',''3'',''Low'')"Priority",',
'         wfdcl_po_mode,',
'         wfdcl_qc_ins_mode,',
'         wfdcl_wf_no,',
'         wfdcl_plnt,',
'         wfdcl_prev_ctrl_person,',
'         wfdcl_doc_sfx,',
'         wfdcl_src_bu,',
'         wfdcl_src_plnt,',
'         wfdcl_src_user,',
'         wfdcl_lvl_prj,',
'         wfdcl_auth_type,',
'         CASE',
'            WHEN     wfdcl_auth_type = ''P''',
'                 AND wfdcl_prev_ctrl_person IS NOT NULL',
'                 AND wfdcl_frwd_rtn IN (''F'', ''R'', ''C'')',
'            THEN',
'               func_find_wf_emp_pos_id (wfdcl_prev_bu, wfdcl_prev_ctrl_person)',
'            WHEN wfdcl_auth_type = ''E'' AND wfdcl_frwd_rtn IN (''F'', ''R'', ''C'')',
'            THEN',
'               wfdcl_prev_ctrl_person',
'         END',
'            doc_from_emp,',
'         CASE',
'            WHEN     wfdcl_auth_type = ''P''',
'                 AND wfdcl_prev_ctrl_person IS NOT NULL',
'                 AND wfdcl_frwd_rtn IN (''F'', ''R'', ''C'')',
'            THEN',
'               func_find_position_desc (wfdcl_prev_bu,',
'                                        wfdcl_prev_ctrl_person,',
'                                        1)',
'            WHEN wfdcl_auth_type = ''E'' AND wfdcl_frwd_rtn IN (''F'', ''R'', ''C'')',
'            THEN',
'               CASE',
'                  WHEN wfdcl_prev_ctrl_person IS NULL',
'                  THEN',
'                     NULL',
'                  WHEN wfdcl_prev_ctrl_person IS NOT NULL',
'                  THEN',
'                     func_find_employee_desc (wfdcl_prev_bu,',
'                                              wfdcl_prev_ctrl_person,',
'                                              1)',
'               END',
'         END',
'            doc_from,',
'         CASE',
'            WHEN     wfdcl_auth_type = ''P''',
'                 AND wfdcl_prev_ctrl_person IS NOT NULL',
'                 AND wfdcl_frwd_rtn IN (''F'', ''R'', ''C'')',
'            THEN',
'               func_find_user_id (',
'                  wfdcl_prev_bu,',
'                  (func_find_position_desc (wfdcl_prev_bu,',
'                                            wfdcl_prev_ctrl_person,',
'                                            1)))',
'            WHEN wfdcl_auth_type = ''E'' AND wfdcl_frwd_rtn IN (''F'', ''R'', ''C'')',
'            THEN',
'               func_find_user_id (wfdcl_prev_bu, wfdcl_prev_ctrl_person)',
'         END',
'            doc_from_user,',
'         CASE',
'            WHEN wfdcl_auth_type = ''P'' AND wfdcl_prev_ctrl_person IS NOT NULL',
'            THEN',
'               wfdcl_emp_id',
'            WHEN wfdcl_auth_type = ''E'' AND wfdcl_prev_ctrl_person IS NOT NULL',
'            THEN',
'               wfdcl_ctrl_person',
'            ELSE',
'               WFDCL_EMP_ID',
'         END',
'            doc_with_emp,',
'         CASE',
'            WHEN wfdcl_auth_type = ''P'' AND wfdcl_prev_ctrl_person IS NOT NULL',
'            THEN',
'               func_find_position_desc (wfdcl_bu, wfdcl_ctrl_person, 1)',
'            WHEN wfdcl_auth_type = ''E'' AND wfdcl_prev_ctrl_person IS NOT NULL',
'            THEN',
'               func_find_employee_desc1 (wfdcl_bu, wfdcl_ctrl_person, 1)',
'            ELSE',
'               func_find_employee_desc1 (wfdcl_prev_bu,',
'                                         wfdcl_prev_ctrl_person,',
'                                         1)',
'         END',
'            doc_with,',
'         CASE',
'            WHEN wfdcl_auth_type = ''P'' AND wfdcl_prev_ctrl_person IS NOT NULL',
'            THEN',
'               func_find_user_id (wfdcl_bu, wfdcl_emp_id)',
'            WHEN wfdcl_auth_type = ''E'' AND wfdcl_prev_ctrl_person IS NOT NULL',
'            THEN',
'               func_find_user_id (wfdcl_prev_bu, wfdcl_ctrl_person)',
'            ELSE',
'               NULL          --func_find_user_id (wfdcl_prev_bu, wfdcl_emp_id)',
'         END',
'            doc_with_user,',
'         CASE',
'            WHEN WFDCL_AUTH_TYPE = ''P''',
'            THEN',
'               (SELECT DECODE (',
'                          WFDCL_frwd_rtn,',
'                          ''F'', ''Forwarded to ''',
'                               || func_find_position_desc (WFDCL_bu,',
'                                                           WFDCL_ctrl_person,',
'                                                           1)',
'                               || '' (''',
'                               || CASE',
'                                     WHEN WFDCL_ctrl_person IS NULL',
'                                     THEN',
'                                        NULL',
'                                     WHEN WFDCL_ctrl_person IS NOT NULL',
'                                     THEN',
'                                        FUNC_FIND_WF_EMP_POS_ID (',
'                                           WFDCL_bu,',
'                                           WFDCL_ctrl_person)',
'                                        || ''-''',
'                                        || FUNC_FIND_EMPLOYEE_DESC1 (',
'                                              WFDCL_bu,',
'                                              FUNC_FIND_WF_EMP_POS_ID (',
'                                                 WFDCL_bu,',
'                                                 WFDCL_ctrl_person),',
'                                              1)',
'                                  END',
'                               || '')'',',
'                          ''R'', ''Returned to ''',
'                               || func_find_position_desc (WFDCL_bu,',
'                                                           WFDCL_ctrl_person,',
'                                                           1)',
'                               || '' (''',
'                               || CASE',
'                                     WHEN WFDCL_ctrl_person IS NULL',
'                                     THEN',
'                                        NULL',
'                                     WHEN WFDCL_ctrl_person IS NOT NULL',
'                                     THEN',
'                                        FUNC_FIND_WF_EMP_POS_ID (',
'                                           WFDCL_bu,',
'                                           WFDCL_ctrl_person)',
'                                        || ''-''',
'                                        || FUNC_FIND_EMPLOYEE_DESC1 (',
'                                              WFDCL_bu,',
'                                              FUNC_FIND_WF_EMP_POS_ID (',
'                                                 WFDCL_bu,',
'                                                 WFDCL_ctrl_person),',
'                                              1)',
'                                  END',
'                               || '')'',',
'                          DECODE (',
'                             WFDCL_appr_no,',
'                             0, ''Raised by ''',
'                                || func_find_position_desc (WFDCL_bu,',
'                                                            WFDCL_ctrl_person,',
'                                                            1)',
'                                || '' (''',
'                                || CASE',
'                                      WHEN WFDCL_ctrl_person IS NULL',
'                                      THEN',
'                                         NULL',
'                                      WHEN WFDCL_ctrl_person IS NOT NULL',
'                                      THEN',
'                                         FUNC_FIND_WF_EMP_POS_ID (',
'                                            WFDCL_bu,',
'                                            WFDCL_ctrl_person)',
'                                         || ''-''',
'                                         || FUNC_FIND_EMPLOYEE_DESC1 (',
'                                               WFDCL_bu,',
'                                               FUNC_FIND_WF_EMP_POS_ID (',
'                                                  WFDCL_bu,',
'                                                  WFDCL_ctrl_person),',
'                                               1)',
'                                   END',
'                                || '')'',',
'                             (CASE',
'                                 WHEN WFDCL_STATUS IN (''E'', ''N'')',
'                                 THEN',
'                                    ''Entry Completed''',
'                                 WHEN WFDCL_STATUS IN (''C'')',
'                                 THEN',
'                                    ''Cancelled''',
'                                 WHEN WFDCL_STATUS IN (''R'')',
'                                 THEN',
'                                    ''Returned''',
'                                 WHEN WFDCL_STATUS IS NOT NULL',
'                                 THEN',
'                                    (SELECT wfaa_status_desc',
'                                       FROM work_flow_appr_actvt',
'                                      WHERE     wfaa_bu = wfdcl_bu',
'                                            AND wfaa_wf_id = WFDCL_TYPE',
'                                            AND wfaa_status = WFDCL_STATUS)',
'                                 ELSE',
'                                    WFDCL_STATUS',
'                              END)',
'                             || '' by ''',
'                             || func_find_position_desc (WFDCL_bu,',
'                                                         WFDCL_ctrl_person,',
'                                                         1)',
'                             || '' (''',
'                             || CASE',
'                                   WHEN WFDCL_ctrl_person IS NULL',
'                                   THEN',
'                                      NULL',
'                                   WHEN WFDCL_ctrl_person IS NOT NULL',
'                                   THEN',
'                                      --FUNC_FIND_WF_EMP_POS_ID(:GLOBAL.doc_bu,WFDCL_ctrl_person)||''-''||FUNC_FIND_EMPLOYEE_DESC(:GLOBAL.doc_bu,FUNC_FIND_WF_EMP_POS_ID(:GLOBAL.doc_bu,WFDCL_ctrl_person),1)',
'                                      WFDCL_emp_id || ''-''',
'                                      || FUNC_FIND_EMPLOYEE_DESC1 (',
'                                            WFDCL_bu,',
'                                            WFDCL_emp_id,',
'                                            1)',
'                                END',
'                             || '')''))',
'                  FROM DUAL)',
'            WHEN WFDCL_AUTH_TYPE = ''E''',
'            THEN',
'               (SELECT DECODE (',
'                          WFDCL_frwd_rtn,',
'                          ''F'', ''Forwarded to '' || '' (''',
'                               || CASE',
'                                     WHEN WFDCL_ctrl_person IS NULL',
'                                     THEN',
'                                        NULL',
'                                     WHEN WFDCL_ctrl_person IS NOT NULL',
'                                     THEN',
'                                        WFDCL_ctrl_person || ''-''',
'                                        || FUNC_FIND_EMPLOYEE_DESC1 (',
'                                              WFDCL_bu,',
'                                              WFDCL_ctrl_person,',
'                                              1)',
'                                  END',
'                               || '')'',',
'                          ''R'', ''Returned to '' || '' (''',
'                               || CASE',
'                                     WHEN WFDCL_ctrl_person IS NULL',
'                                     THEN',
'                                        NULL',
'                                     WHEN WFDCL_ctrl_person IS NOT NULL',
'                                     THEN',
'                                        WFDCL_ctrl_person || ''-''',
'                                        || FUNC_FIND_EMPLOYEE_DESC1 (',
'                                              WFDCL_bu,',
'                                              WFDCL_ctrl_person,',
'                                              1)',
'                                  END',
'                               || '')'',',
'                          DECODE (',
'                             WFDCL_status,',
'                             ''A'', (CASE',
'                                      WHEN WFDCL_STATUS IN (''E'', ''N'')',
'                                      THEN',
'                                         ''Entry Completed''',
'                                      WHEN WFDCL_STATUS IN (''C'')',
'                                      THEN',
'                                         ''Cancelled''',
'                                      WHEN WFDCL_STATUS IN (''R'')',
'                                      THEN',
'                                         ''Returned''',
'                                      WHEN WFDCL_STATUS IS NOT NULL',
'                                      THEN',
'                                         (SELECT wfaa_status_desc',
'                                            FROM work_flow_appr_actvt',
'                                           WHERE     wfaa_bu = wfdcl_bu',
'                                                 AND wfaa_wf_id = WFDCL_TYPE',
'                                                 AND wfaa_status = WFDCL_STATUS)',
'                                      ELSE',
'                                         WFDCL_STATUS',
'                                   END)',
'                                  || '' by ''',
'                                  || '' (''',
'                                  || CASE',
'                                        WHEN WFDCL_ctrl_person IS NULL',
'                                        THEN',
'                                           WFDCL_prev_ctrl_person || ''-''',
'                                           || FUNC_FIND_EMPLOYEE_DESC1 (',
'                                                 WFDCL_prev_bu,',
'                                                 WFDCL_prev_ctrl_person,',
'                                                 1)',
'                                        WHEN WFDCL_ctrl_person IS NOT NULL',
'                                        THEN',
'                                           WFDCL_ctrl_person || ''-''',
'                                           || FUNC_FIND_EMPLOYEE_DESC1 (',
'                                                 WFDCL_bu,',
'                                                 WFDCL_ctrl_person,',
'                                                 1)',
'                                     END',
'                                  || '')'',',
'                             ''Raised by '' || '' (''',
'                             || CASE',
'                                   WHEN WFDCL_ctrl_person IS NULL',
'                                   THEN',
'                                      NULL',
'                                   WHEN WFDCL_ctrl_person IS NOT NULL',
'                                   THEN',
'                                      WFDCL_ctrl_person || ''-''',
'                                      || FUNC_FIND_EMPLOYEE_DESC1 (',
'                                            WFDCL_bu,',
'                                            WFDCL_ctrl_person,',
'                                            1)',
'                                END',
'                             || '')''))',
'                  FROM DUAL)',
'         END',
'            log_details,',
'         wfdcl_emp_id,',
'         wfdcl_prev_emp_id,',
'         wfdcl_prev_bu,',
'         wfdcl_cre_by,',
'         wfdcl_cre_ip_addr,',
'         wfdcl_cre_os_user,',
'         wfdcl_cre_date,',
'         wfdcl_upd_by,',
'         wfdcl_upd_ip_addr,',
'         wfdcl_upd_os_user,',
'         wfdcl_upd_date,',
'         wfdcl_cre_emp_id,',
'         wfdcl_upd_emp_id,',
'         wfdcl_coll_centr_id,',
'         CASE',
'            WHEN WFDCL_STATUS IN (''E'', ''N'')',
'            THEN',
'               ''Entry Completed''',
'            WHEN WFDCL_STATUS IN (''C'')',
'            THEN',
'               ''Cancelled''',
'            WHEN WFDCL_STATUS IN (''R'')',
'            THEN',
'               ''Returned''',
'            WHEN WFDCL_STATUS IS NOT NULL',
'            THEN',
'               (SELECT wfaa_status_desc',
'                  FROM work_flow_appr_actvt',
'                 WHERE     wfaa_bu = wfdcl_bu',
'                       AND wfaa_wf_id = WFDCL_TYPE',
'                       AND wfaa_status = WFDCL_STATUS)',
'            ELSE',
'               WFDCL_STATUS',
'         END',
'            status',
'    FROM wf_doc_control_log',
'WHERE wfdcl_src_bu			= :P23613101001_doc_bu',
'  AND wfdcl_src_plnt 		= :P23613101001_plnt 			',
'  AND wfdcl_type 			= :P23613101001_wf_type',
'  AND wfdcl_doc_pfx    	    = :P23613101001_doc_pfx 		',
'  AND wfdcl_doc_no 			= :P23613101001_doc_no',
' ORDER BY WFDCL_ACTION_DATE DESC,WFDCL_SEQNO DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'NEVER'
,p_prn_page_header=>'Workflow History'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(11546195219651413371)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>5402353190244892110
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546099685387364067)
,p_db_column_name=>'DOC_FROM'
,p_display_order=>81
,p_column_identifier=>'BB'
,p_column_label=>'Forwarded From Employee'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546099603980364066)
,p_db_column_name=>'DOC_FROM_EMP'
,p_display_order=>71
,p_column_identifier=>'BA'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546099814018364068)
,p_db_column_name=>'DOC_FROM_USER'
,p_display_order=>91
,p_column_identifier=>'BC'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546099979383364070)
,p_db_column_name=>'DOC_WITH'
,p_display_order=>111
,p_column_identifier=>'BE'
,p_column_label=>'With Whom Employee'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546099831950364069)
,p_db_column_name=>'DOC_WITH_EMP'
,p_display_order=>101
,p_column_identifier=>'BD'
,p_column_label=>'Emp. ID'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546100123328364071)
,p_db_column_name=>'DOC_WITH_USER'
,p_display_order=>121
,p_column_identifier=>'BF'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546100215038364072)
,p_db_column_name=>'LOG_DETAILS'
,p_display_order=>131
,p_column_identifier=>'BG'
,p_column_label=>'Log Details'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546099481386364065)
,p_db_column_name=>'Line'
,p_display_order=>61
,p_column_identifier=>'AZ'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546100382595364074)
,p_db_column_name=>'Message'
,p_display_order=>171
,p_column_identifier=>'BI'
,p_column_label=>'Message'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546100503091364075)
,p_db_column_name=>'On'
,p_display_order=>161
,p_column_identifier=>'BJ'
,p_column_label=>'On'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546100545884364076)
,p_db_column_name=>'Priority'
,p_display_order=>181
,p_column_identifier=>'BK'
,p_column_label=>'Priority'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546100295739364073)
,p_db_column_name=>'STATUS'
,p_display_order=>141
,p_column_identifier=>'BH'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546199934575413376)
,p_db_column_name=>'WFDCL_ACCTS'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Wfdcl Accts'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546203560388413379)
,p_db_column_name=>'WFDCL_APPR_NO'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Wfdcl Appr No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546209933857413386)
,p_db_column_name=>'WFDCL_AUTH_TYPE'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Wfdcl Auth Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546195609986413373)
,p_db_column_name=>'WFDCL_BU'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Wfdcl Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546215545137413392)
,p_db_column_name=>'WFDCL_COLL_CENTR_ID'
,p_display_order=>51
,p_column_identifier=>'AY'
,p_column_label=>'Wfdcl Coll Centr Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546211593944413387)
,p_db_column_name=>'WFDCL_CRE_BY'
,p_display_order=>41
,p_column_identifier=>'AO'
,p_column_label=>'Wfdcl Cre By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546212798041413389)
,p_db_column_name=>'WFDCL_CRE_DATE'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'Wfdcl Cre Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546214767110413392)
,p_db_column_name=>'WFDCL_CRE_EMP_ID'
,p_display_order=>49
,p_column_identifier=>'AW'
,p_column_label=>'Wfdcl Cre Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546211931588413389)
,p_db_column_name=>'WFDCL_CRE_IP_ADDR'
,p_display_order=>42
,p_column_identifier=>'AP'
,p_column_label=>'Wfdcl Cre Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546212340450413389)
,p_db_column_name=>'WFDCL_CRE_OS_USER'
,p_display_order=>43
,p_column_identifier=>'AQ'
,p_column_label=>'Wfdcl Cre Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546200421002413378)
,p_db_column_name=>'WFDCL_CTRL_PERSON'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Wfdcl Ctrl Person'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546197990707413375)
,p_db_column_name=>'WFDCL_CUST_ID'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Wfdcl Cust Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546196797244413375)
,p_db_column_name=>'WFDCL_DOC_NO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Wfdcl Doc No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546196389426413375)
,p_db_column_name=>'WFDCL_DOC_PFX'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Wfdcl Doc Pfx'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546207980203413382)
,p_db_column_name=>'WFDCL_DOC_SFX'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Wfdcl Doc Sfx'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546210417951413387)
,p_db_column_name=>'WFDCL_EMP_ID'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Wfdcl Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546202809841413379)
,p_db_column_name=>'WFDCL_FRWD_RTN'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Wfdcl Frwd Rtn'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546201986606413378)
,p_db_column_name=>'WFDCL_JRNL_TYPE'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Wfdcl Jrnl Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546198386421413376)
,p_db_column_name=>'WFDCL_LVL1'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Wfdcl Lvl1'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546198757979413376)
,p_db_column_name=>'WFDCL_LVL2'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Wfdcl Lvl2'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546199183606413376)
,p_db_column_name=>'WFDCL_LVL3'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Wfdcl Lvl3'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546199561830413376)
,p_db_column_name=>'WFDCL_LVL4'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Wfdcl Lvl4'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546209578152413384)
,p_db_column_name=>'WFDCL_LVL_PRJ'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Wfdcl Lvl Prj'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546207169607413382)
,p_db_column_name=>'WFDCL_PLNT'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Wfdcl Plnt'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546206004986413381)
,p_db_column_name=>'WFDCL_PO_MODE'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Wfdcl Po Mode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546211207091413387)
,p_db_column_name=>'WFDCL_PREV_BU'
,p_display_order=>40
,p_column_identifier=>'AN'
,p_column_label=>'Wfdcl Prev Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546207532238413382)
,p_db_column_name=>'WFDCL_PREV_CTRL_PERSON'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Wfdcl Prev Ctrl Person'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546210732561413387)
,p_db_column_name=>'WFDCL_PREV_EMP_ID'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Wfdcl Prev Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546201220132413378)
,p_db_column_name=>'WFDCL_PRJ_ID'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Wfdcl Prj Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546204822987413381)
,p_db_column_name=>'WFDCL_PROD_ID'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Wfdcl Prod Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546205218335413381)
,p_db_column_name=>'WFDCL_PROD_REV'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Wfdcl Prod Rev'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546206348068413382)
,p_db_column_name=>'WFDCL_QC_INS_MODE'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Wfdcl Qc Ins Mode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546203940130413379)
,p_db_column_name=>'WFDCL_QC_REV'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Wfdcl Qc Rev'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546201591644413378)
,p_db_column_name=>'WFDCL_RND_PRJ_ID'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Wfdcl Rnd Prj Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546197571102413375)
,p_db_column_name=>'WFDCL_SPPLR_ID'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Wfdcl Spplr Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546208352210413382)
,p_db_column_name=>'WFDCL_SRC_BU'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Wfdcl Src Bu'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546208751077413384)
,p_db_column_name=>'WFDCL_SRC_PLNT'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Wfdcl Src Plnt'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546209164532413384)
,p_db_column_name=>'WFDCL_SRC_USER'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Wfdcl Src User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546197181124413375)
,p_db_column_name=>'WFDCL_STATUS'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Wfdcl Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546195941858413373)
,p_db_column_name=>'WFDCL_TYPE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Wfdcl Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546213137332413389)
,p_db_column_name=>'WFDCL_UPD_BY'
,p_display_order=>45
,p_column_identifier=>'AS'
,p_column_label=>'Wfdcl Upd By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546214353562413392)
,p_db_column_name=>'WFDCL_UPD_DATE'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'Wfdcl Upd Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546215129667413392)
,p_db_column_name=>'WFDCL_UPD_EMP_ID'
,p_display_order=>50
,p_column_identifier=>'AX'
,p_column_label=>'Wfdcl Upd Emp Id'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546213566408413389)
,p_db_column_name=>'WFDCL_UPD_IP_ADDR'
,p_display_order=>46
,p_column_identifier=>'AT'
,p_column_label=>'Wfdcl Upd Ip Addr'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546213959617413389)
,p_db_column_name=>'WFDCL_UPD_OS_USER'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'Wfdcl Upd Os User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546202361027413379)
,p_db_column_name=>'WFDCL_VALUE'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Wfdcl Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11546206811361413382)
,p_db_column_name=>'WFDCL_WF_NO'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Wfdcl Wf No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11546217624714416409)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'54023756'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'Line:DOC_WITH_EMP:DOC_WITH:DOC_WITH_USER:DOC_FROM_EMP:DOC_FROM:DOC_FROM_USER:STATUS:Message:On:Priority:LOG_DETAILS'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5605874819437857674)
,p_name=>'P23613101001_CUST_ID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7435539681049587231)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11549051471808320967)
,p_name=>'P23613101001_DOC_BU'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7435539681049587231)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11549051927309320971)
,p_name=>'P23613101001_DOC_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7435539681049587231)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11549051777871320970)
,p_name=>'P23613101001_DOC_PFX'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7435539681049587231)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5779495838373331762)
,p_name=>'P23613101001_INST_ID'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7435539681049587231)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7567084309249736756)
,p_name=>'P23613101001_PARTY_ID'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7435539681049587231)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11549051569069320968)
,p_name=>'P23613101001_PLNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7435539681049587231)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5893675013317526449)
,p_name=>'P23613101001_PROD_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7435539681049587231)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5893675040325526450)
,p_name=>'P23613101001_PROD_REV'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7435539681049587231)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11549051693853320969)
,p_name=>'P23613101001_WF_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7435539681049587231)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6086036484457909930)
,p_name=>'WorkFlow History'
,p_static_id=>'workflow-history'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6086036616062909931)
,p_event_id=>wwv_flow_imp.id(6086036484457909930)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-com-clarifit-apexplugin-ir-column-grouping'
,p_action=>'PLUGIN_COM.CLARIFIT.APEXPLUGIN.IR_COLUMN_GROUPING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'true')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6086036723681909932)
,p_name=>'WorkFlow History_1'
,p_static_id=>'workflow-history-2'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7435539681049587231)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6086036795586909933)
,p_event_id=>wwv_flow_imp.id(6086036723681909932)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'plugin-com-clarifit-apexplugin-ir-column-grouping'
,p_action=>'PLUGIN_COM.CLARIFIT.APEXPLUGIN.IR_COLUMN_GROUPING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'true')).to_clob
);
wwv_flow_imp.component_end;
end;
/
