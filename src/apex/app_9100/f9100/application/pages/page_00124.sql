prompt --application/pages/page_00124
begin
--   Manifest
--     PAGE: 00124
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
 p_id=>124
,p_name=>'Update Users'
,p_alias=>'UPDATE-USERS'
,p_page_mode=>'MODAL'
,p_step_title=>'Update Users'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Region--accent6 > .t-Region-header {',
'    background-color: #dec553de;',
'    color: #2a2a08;',
'}',
'',
'.t-Form--labelsAbove .t-Form-fieldContainer .apex-item-select, .t-Form-fieldContainer--stacked .apex-item-select {',
'    max-width: 123%;',
'}',
'.t-Region-body {',
'    color: #6a3ebd;',
'    line-height: 0rem;',
'    font-size: 1.3rem;',
'}',
'.t-Cards--cols .t-Cards-item {',
'    width: 200%;',
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
'.t-Form-label {',
'    color: #080808;',
'}',
'.t-Card-info {',
'    color: tan;',
'    font-size: var(--ut-cardlist-info-font-size, 13px);',
'    margin-top: var(--ut-cardlist-info-margin-y, 12px);',
'    line-height: var(--ut-cardlist-info-line-height, 16px);',
'    overflow: hidden;',
'    text-overflow: ellipsis;',
'    white-space: nowrap;',
'    text-align: -webkit-center;',
'} ',
''))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'800'
,p_dialog_width=>'1000'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11899352845984920330)
,p_plug_name=>'Create User '
,p_static_id=>'create-user'
,p_title=>'User Create'
,p_region_name=>'user'
,p_parent_plug_id=>wwv_flow_imp.id(8581206099435519362)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       UAPPUSER_BU,',
'       UAPPUSER_ID,',
'       UAPPUSER_PASSWORD,',
'       UAPPUSER_EFF_FROM,',
'       UAPPUSER_EFF_TO,',
'       UAPPUSER_EMP_ID,',
'       UAPPUSER_STATUS,',
'       UAPPUSER_USER_TYPE,',
'       UAPPUSER_CUST_ID,',
'       UAPPUSER_SUPLR_ID,',
'       UAPPUSER_CRE_BY,',
'       UAPPUSER_CRE_IP_ADDR,',
'       UAPPUSER_CRE_OS_USER,',
'       UAPPUSER_CRE_DATE,',
'       UAPPUSER_UPD_BY,',
'       UAPPUSER_UPD_IP_ADDR,',
'       UAPPUSER_UPD_OS_USER,',
'       UAPPUSER_UPD_DATE,',
'       UAPPUSER_CRE_EMP_ID,',
'       UAPPUSER_UPD_EMP_ID,',
'       UAPPUSER_EMAIL_ID,',
'       UAPPUSER_MOBILE_NO,',
'       UAPPUSER_PARTY_ID,',
'       UAPPUSER_POS_ID,',
'       UAPPUSER_DEPT_ID,',
'       UAPPUSER_JRNL_POST,',
'       UAPPUSER_DOC_NO,',
'       UAPPUSER_DOC_DATE,',
'       UAPPUSER_APPR_BY,',
'       UAPPUSER_APPR_EMP_ID,',
'       UAPPUSER_APPR_IP_ADDR,',
'       UAPPUSER_APPR_OS_USER,',
'       UAPPUSER_APPR_DATE',
'  from UPD_APPL_USERS',
'  where UAPPUSER_BU = :GLOBAL_BU'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P124_APPLUSER_STATUS in(''A'',''D'')'
,p_plug_read_only_when2=>'PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11206615388642365495)
,p_plug_name=>'Create Users'
,p_static_id=>'create-users'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--accent8:t-Region--scrollBody:t-Form--leftLabels'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8581206099435519362)
,p_plug_name=>'Header'
,p_static_id=>'header'
,p_parent_plug_id=>wwv_flow_imp.id(11206615388642365495)
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(9362259269587673675)
,p_name=>'Load Image'
,p_static_id=>'load-image'
,p_parent_plug_id=>wwv_flow_imp.id(8581206099435519362)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#:t-Form--large:margin-left-none:margin-right-none'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--spanHorizontally:t-Cards--animColorFill:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'       ''<center><img alt="''||apex_escape.html_attribute(:P124_APPLUSER_EMP_ID)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src=''''#APP_IMAGES#women.png'''' height = "110" width = "110"/></center>''    CARD_TITLE,',
'       NULL CARD_SUBTITLE,',
'       ''Unknown'' CARD_TEXT,',
'       ''Unknown'' CARD_SUBTEXT',
' FROM DUAL ',
' WHERE 0 = (SELECT',
'    SUM(cnt) found',
'FROM',
'    (',
'        SELECT',
'            COUNT(*) cnt',
'        FROM',
'            doc_mgmt',
'        WHERE',
'                dm_bu = :global_bu',
'            AND dm_vou_no = :p124_appluser_emp_id',
'            AND dm_vou_type = ''E_IMG''',
'        UNION ALL',
'        SELECT',
'            COUNT(*) cnt',
'        FROM',
'            employees',
'        WHERE',
'                emp_bu = :global_bu',
'            AND emp_emp_id = :p124_appluser_emp_id',
'    ))',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5831512621652893613)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5831511772330893612)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5831512139915893612)
,p_query_column_id=>3
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>20
,p_column_heading=>'Card Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5831511420533893599)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Title'
,p_column_format=>'PCT_GRAPH:#f9f9f9::'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(9930149249789804959)
,p_name=>'Load Image'
,p_static_id=>'load-image-2'
,p_parent_plug_id=>wwv_flow_imp.id(8581206099435519362)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Form--large:margin-top-md:margin-left-none:margin-right-none'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--spanHorizontally:t-Cards--animColorFill:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DECODE(NVL(dbms_lob.getlength(dm_blob),0),0,null,',
'        ''<center><img alt="''||apex_escape.html_attribute(dm_vou_no)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src = "''||apex_util.get_blob_file_src(''P6_DM_BLOB'', ROWID)||''" height = "110" width = "110"/></cen'
||'ter>'')',
'        CARD_TITLE,',
'        ROWID CARD_SUBTITLE,',
'        (select APPLUSER_EMP_ID||''-''||',
'                (SELECT  emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 emp_name',
'                  FROM EMPLOYEES ',
'                  WHERE EMP_BU=APPLUSER_BU',
'                    AND EMP_EMP_ID=APPLUSER_EMP_ID)',
'           FROM APPL_USERS',
'          WHERE APPLUSER_ID=:P124_APPLUSER_ID',
'            AND APPLUSER_USER_TYPE = :P124_APPLUSER_USER_TYPE',
'            AND APPLUSER_EMP_ID = :P124_APPLUSER_EMP_ID)CARD_TEXT,',
'       (SELECT INITCAP(HRPOS_POS_NAME1)',
'          FROM HR_POSITIONS',
'         WHERE HRPOS_BU = :GLOBAL_BU',
'           AND HRPOS_POS_ID = :P124_APPLUSER_POS_ID',
'           )',
'       CARD_SUBTEXT',
'FROM doc_mgmt',
'WHERE dm_bu = :Global_bu',
'AND dm_vou_no =:P124_APPLUSER_EMP_ID',
'AND dm_vou_type =''E_IMG''',
'UNION ALL',
'SELECT CASE WHEN  EMP_GENDER=''F'' ',
'            THEN ''<center><img alt="''||apex_escape.html_attribute(:P124_APPLUSER_EMP_ID)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src=''''#APP_IMAGES#women.png'''' height = "110" width = "110"/></center>''',
'            ELSE ''<center><img alt="''||apex_escape.html_attribute(:P124_APPLUSER_EMP_ID)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src=''''#APP_IMAGES#profile (1).png'''' height = "110" width = "110"/></center>''',
'       END ',
'       CARD_TITLE,',
'       NULL CARD_SUBTITLE,',
'       (SELECT APPLUSER_EMP_ID||''-''||',
'                (SELECT  emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 emp_name',
'                  FROM EMPLOYEES ',
'                  WHERE EMP_BU=APPLUSER_BU',
'                    AND EMP_EMP_ID=APPLUSER_EMP_ID)',
'           FROM APPL_USERS',
'          WHERE APPLUSER_ID=:P124_APPLUSER_ID',
'            AND APPLUSER_USER_TYPE = :P124_APPLUSER_USER_TYPE',
'            AND APPLUSER_EMP_ID = :P124_APPLUSER_EMP_ID)CARD_TEXT,',
'       (SELECT INITCAP(HRPOS_POS_NAME1)',
'          FROM HR_POSITIONS',
'         WHERE HRPOS_BU = :GLOBAL_BU',
'           AND HRPOS_POS_ID = :P124_APPLUSER_POS_ID)',
'       CARD_SUBTEXT',
'  FROM EMPLOYEES',
' WHERE EMP_BU = :GLOBAL_BU',
'   AND EMP_EMP_ID = :P124_APPLUSER_EMP_ID',
'   AND EMP_EMP_ID NOT IN (SELECT DM_VOU_NO',
'                            FROM DOC_MGMT',
'                           WHERE DM_BU = :GLOBAL_BU',
'                             AND DM_VOU_TYPE = ''E_IMG''',
'                             AND DM_VOU_NO IS NOT NULL)',
'UNION ALL',
'SELECT ''<center><img alt="''||apex_escape.html_attribute(:P124_APPLUSER_EMP_ID)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src=''''#APP_FILES#profile (1).png'''' height = "110" width = "110"/></center>''',
'       CARD_TITLE,',
'       NULL CARD_SUBTITLE,',
'       NULL CARD_TEXT,',
'       NULL CARD_SUBTEXT',
'  FROM suppliers',
' WHERE suplr_bu       = :GLOBAL_BU',
'   AND (suplr_suplr_id  = :P124_APPLUSER_SUPLR_ID  OR suplr_suplr_id  = :P124_APPLUSER_CUST_ID)',
'   AND suplr_suplr_id  NOT IN (SELECT DM_VOU_NO',
'                            FROM DOC_MGMT',
'                           WHERE DM_BU = :GLOBAL_BU',
'                             AND DM_VOU_TYPE = ''E_IMG''',
'                             AND DM_VOU_NO IS NOT NULL)'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5831491247426893515)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>200
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5831490527351893512)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>210
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5831490875005893513)
,p_query_column_id=>3
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>180
,p_column_heading=>'Card Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5831490068872893507)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>170
,p_column_heading=>'Card Title'
,p_column_format=>'PCT_GRAPH:#f9f9f9::'
,p_column_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::P6_ROWID,P6_EMP_ROWID,P6_DM_VOU_NO,P6_TITLE,P6_TYPE,P6_RETURN_PAGE_NO:#CARD_SUBTITLE#,&P21113001502_ROWID.,&P21113001502_APPLUSER_EMP_ID.,&P21113001502_EMP_NAME.,IMG,21113001502'
,p_column_linktext=>'#CARD_TITLE#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9139724911214452013)
,p_plug_name=>'Region'
,p_static_id=>'region'
,p_parent_plug_id=>wwv_flow_imp.id(8581206099435519362)
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_read_only_when_type=>'EXPRESSION'
,p_plug_read_only_when=>':P124_APPLUSER_STATUS IN (''A'',''D'')'
,p_plug_read_only_when2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5831484055700893368)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(11206615388642365495)
,p_button_name=>'Insert'
,p_static_id=>'insert'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insert'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P124_ROWID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5863769439983849451)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(11206615388642365495)
,p_button_name=>'Un_Locked'
,p_static_id=>'un-locked'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconRight:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Un Locked'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P124_LOCK_CHK'
,p_button_condition2=>'Y'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5831484497839893370)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(11206615388642365495)
,p_button_name=>'Update'
,p_static_id=>'update'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Insert'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P124_ROWID IS NOT NULL AND :P124_UAPPUSER_STATUS IN(''N'',''A'')'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'savebtn'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5863769127658849448)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(11206615388642365495)
,p_button_name=>'Update_user'
,p_static_id=>'update-user'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link:t-Button--iconRight:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Update User'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6114314704428517803)
,p_branch_name=>'Go To Page 21113001503'
,p_branch_action=>'f?p=&APP_ID.:21113001503:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(5863769439983849451)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9139785440350453581)
,p_name=>'P124_DEPARTMENT_NAME'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_prompt=>'Department'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5863769568490849452)
,p_name=>'P124_LOCK_CHK'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9139785536557453582)
,p_name=>'P124_POSITION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_prompt=>'Designation'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=readonly'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5778925185795993365)
,p_name=>'P124_P_EMP_ID'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5778925065756993364)
,p_name=>'P124_P_USER_ID'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9776274431729992999)
,p_name=>'P124_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5778924604123993359)
,p_name=>'P124_UAPPUSER_APPR_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_APPR_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5778925017577993363)
,p_name=>'P124_UAPPUSER_APPR_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_APPR_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5778924655903993360)
,p_name=>'P124_UAPPUSER_APPR_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_APPR_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5778924737159993361)
,p_name=>'P124_UAPPUSER_APPR_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_APPR_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5778924844435993362)
,p_name=>'P124_UAPPUSER_APPR_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_APPR_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6327143965368700207)
,p_name=>'P124_UAPPUSER_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6327144914328700217)
,p_name=>'P124_UAPPUSER_CRE_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_CRE_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6327145233451700220)
,p_name=>'P124_UAPPUSER_CRE_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_CRE_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6461305304758957075)
,p_name=>'P124_UAPPUSER_CRE_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_CRE_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6327145080246700218)
,p_name=>'P124_UAPPUSER_CRE_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_CRE_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6327145137326700219)
,p_name=>'P124_UAPPUSER_CRE_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_CRE_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6327144777867700215)
,p_name=>'P124_UAPPUSER_CUST_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_CUST_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6461305969262957081)
,p_name=>'P124_UAPPUSER_DEPT_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_DEPT_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5778924493722993358)
,p_name=>'P124_UAPPUSER_DOC_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_DOC_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5778924399104993357)
,p_name=>'P124_UAPPUSER_DOC_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_DOC_NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6327137212932700111)
,p_name=>'P124_UAPPUSER_EFF_FROM'
,p_source_data_type=>'DATE'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(9139724911214452013)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_prompt=>'Eff. From'
,p_source=>'UAPPUSER_EFF_FROM'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(6327137281272700112)
,p_name=>'P124_UAPPUSER_EFF_TO'
,p_source_data_type=>'DATE'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(9139724911214452013)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_prompt=>'Eff. To'
,p_source=>'UAPPUSER_EFF_TO'
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
 p_id=>wwv_flow_imp.id(6461298509041956978)
,p_name=>'P124_UAPPUSER_EMAIL_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(9139724911214452013)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_prompt=>'Email ID'
,p_source=>'UAPPUSER_EMAIL_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>50
,p_tag_attributes=>'READONLY = READONLY'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6327144422218700212)
,p_name=>'P124_UAPPUSER_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_prompt=>'Employee'
,p_source=>'UAPPUSER_EMP_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_USER_CRE_EMP2'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P124_UAPPUSER_USER_TYPE'
,p_ajax_items_to_submit=>'P124_UAPPUSER_USER_TYPE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
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
  'title', 'Select the  Employee',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6477090919754311788)
,p_name=>'P124_UAPPUSER_EMP_NAME'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_prompt=>'Employee Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_tag_attributes=>'readonly=readonly'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6327144085130700208)
,p_name=>'P124_UAPPUSER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_prompt=>'Username'
,p_source=>'UAPPUSER_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>60
,p_tag_attributes=>'readonly=readonly'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6461306073193957082)
,p_name=>'P124_UAPPUSER_JRNL_POST'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_JRNL_POST'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6461298593017956979)
,p_name=>'P124_UAPPUSER_MOBILE_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(9139724911214452013)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_prompt=>'Mobile No.'
,p_source=>'UAPPUSER_MOBILE_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_tag_attributes=>'READONLY = READONLY'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6461305780685957079)
,p_name=>'P124_UAPPUSER_PARTY_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_PARTY_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6477090845794311787)
,p_name=>'P124_UAPPUSER_PASSWORD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_prompt=>'Password'
,p_placeholder=>'************************'
,p_source=>'UAPPUSER_PASSWORD'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>200
,p_tag_attributes=>'readonly=readonly'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6461305865593957080)
,p_name=>'P124_UAPPUSER_POS_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_POS_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6327137425409700114)
,p_name=>'P124_UAPPUSER_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(9139724911214452013)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_default=>'N'
,p_prompt=>'Status'
,p_source=>'UAPPUSER_STATUS'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Draft;N,Pending for Active;E,Active;A,Pending for Deactive;I,Deactive;D'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6327144830537700216)
,p_name=>'P124_UAPPUSER_SUPLR_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_SUPLR_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6461304913449957071)
,p_name=>'P124_UAPPUSER_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6461305258167957074)
,p_name=>'P124_UAPPUSER_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_format_mask=>'DD-MON-RRRR HH24:MI:SS'
,p_source=>'UAPPUSER_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6461305425824957076)
,p_name=>'P124_UAPPUSER_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6461305014041957072)
,p_name=>'P124_UAPPUSER_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6461305197504957073)
,p_name=>'P124_UAPPUSER_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_source=>'UAPPUSER_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6327144675869700214)
,p_name=>'P124_UAPPUSER_USER_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_item_source_plug_id=>wwv_flow_imp.id(11899352845984920330)
,p_prompt=>'User Type'
,p_source=>'UAPPUSER_USER_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Functional User;E,Role Based User;O,ESS User;U,POS User;P,Customer;C,Supplier;S,Mobile User;M'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5500060022019781535)
,p_name=>'P124_USERS_ROWID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11206615388642365495)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9455306995684112491)
,p_name=>'P124_WF_COUNT'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(9139724911214452013)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(5863769045580849447)
,p_validation_name=>'Employee'
,p_static_id=>'employee'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P124_UAPPUSER_EMP_ID IS NULL THEN',
'   RETURN (''Employee must be entered.'');',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_associated_item=>wwv_flow_imp.id(6327144422218700212)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5831519937290893688)
,p_name=>'Assign_user'
,p_static_id=>'assign-user'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P124_USER_NAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5831520502350893690)
,p_event_id=>wwv_flow_imp.id(5831519937290893688)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P124_USER_NAME',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P124_USER_NAME IS NOT NULL THEN',
    '',
    '   IF :P124_USER_NAME = :P124_APPLUSER_ID THEN',
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
    '	 	     AND appluser_id = :P124_USER_NAME;',
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
 p_id=>wwv_flow_imp.id(5831527326860893703)
,p_name=>'EMP/SUP/CUST'
,p_static_id=>'emp-sup-cust'
,p_event_sequence=>250
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P124_APPLUSER_USER_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5831528294450893704)
,p_event_id=>wwv_flow_imp.id(5831527326860893703)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P124_APPLUSER_PARTY_ID'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5831527752287893703)
,p_event_id=>wwv_flow_imp.id(5831527326860893703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if($v("P124_UAPPUSER_USER_TYPE") == ''R'' || ',
    '   $v("P124_UAPPUSER_USER_TYPE") == ''E'' || ',
    '   $v("P124_UAPPUSER_USER_TYPE") == ''U'' || ',
    '   $v("P124_UAPPUSER_USER_TYPE") == ''P'' ||',
    '   $v("P124_UAPPUSER_USER_TYPE") == ''O''){',
    '    apex.item( "ContainerEMP" ).show();',
    '    apex.item( "ContainerCUST").hide();',
    '    apex.item( "ContainerSUP" ).hide();',
    '}else if ($v("P124_UAPPUSER_USER_TYPE") == ''C''){',
    '    apex.item( "ContainerEMP" ).hide();',
    '    apex.item( "ContainerCUST").show();',
    '    apex.item( "ContainerSUP" ).hide();',
    '}else if ($v("P124_UAPPUSER_USER_TYPE") == ''S''){',
    '    apex.item( "ContainerEMP" ).hide();',
    '    apex.item( "ContainerCUST").hide();',
    '    apex.item( "ContainerSUP" ).show();',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5831528722728893706)
,p_name=>'EMP/SUP/CUST_PL'
,p_static_id=>'emp-sup-cust-pl'
,p_event_sequence=>260
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5831529178650893706)
,p_event_id=>wwv_flow_imp.id(5831528722728893706)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if($v("P124_UAPPUSER_USER_TYPE") == ''R'' ||',
    '   $v("P124_UAPPUSER_USER_TYPE") == ''E'' ||',
    '   $v("P124_UAPPUSER_USER_TYPE") == ''U'' ||',
    '   $v("P124_UAPPUSER_USER_TYPE") == ''P'' ||',
    '   $v("P124_UAPPUSER_USER_TYPE") == ''O''){',
    '    apex.item( "ContainerEMP" ).show();',
    '    apex.item( "ContainerCUST").hide();',
    '    apex.item( "ContainerSUP" ).hide();',
    '}else if ($v("P124_UAPPUSER_USER_TYPE") == ''C''){',
    '    apex.item( "ContainerEMP" ).hide();',
    '    apex.item( "ContainerCUST").show();',
    '    apex.item( "ContainerSUP" ).hide();',
    '}else if ($v("P124_UAPPUSER_USER_TYPE") == ''S''){',
    '    apex.item( "ContainerEMP" ).hide();',
    '    apex.item( "ContainerCUST").hide();',
    '    apex.item( "ContainerSUP" ).show();',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5831523700231893693)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>210
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P124_APPLUSER_PW_EXP_RQRD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5831524226481893696)
,p_event_id=>wwv_flow_imp.id(5831523700231893693)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P124_APPLUSER_PW_EXP_DAYS',
  'items_to_submit', 'P124_APPLUSER_PW_EXP_RQRD',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :P124_APPLUSER_PW_EXP_RQRD =''N'' then',
    '    :P124_APPLUSER_PW_EXP_DAYS :=0;',
    '    :P124_APPLUSER_PW_EXP_DAYS_1 :=0;',
    'end if;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5831525448627893699)
,p_name=>'P124_APPLUSER_CUST_ID'
,p_static_id=>'p124-appluser-cust-id'
,p_event_sequence=>230
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P124_APPLUSER_CUST_ID'
,p_condition_element=>'P124_APPLUSER_CUST_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5831525970974893701)
,p_event_id=>wwv_flow_imp.id(5831525448627893699)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P124_UAPPUSER_PARTY_ID',
  'items_to_submit', 'P124_UAPPUSER_CUST_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P124_UAPPUSER_CUST_ID IS NOT NULL THEN',
    '    DECLARE',
    '        CURSOR c1',
    '            IS',
    '            SELECT suplr_suplr_id,suplr_name1',
    '              FROM suppliers',
    '             WHERE suplr_bu         = :GLOBAL_bu',
    '               AND suplr_suplr_id   = :P124_UAPPUSER_CUST_ID',
    '               AND SUPLR_PARTY_TYPE = ''C''',
    '               AND suplr_status     = ''A'';',
    '',
    '            cr1                 c1%ROWTYPE;',
    '    BEGIN',
    '        OPEN c1;',
    '        FETCH c1 INTO cr1;',
    '            IF c1%FOUND THEN ',
    '               :P124_EMP_NAME             := cr1.suplr_name1;',
    '               :P124_UAPPUSER_PARTY_ID := :P124_UAPPUSER_CUST_ID;',
    '            END IF; ',
    '        CLOSE c1;',
    '    END;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5831521773496893692)
,p_name=>'P124_APPLUSER_PW_EXP_RQRD'
,p_static_id=>'p124-appluser-pw-exp-rqrd'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P124_APPLUSER_PW_EXP_RQRD'
,p_condition_element=>'P124_APPLUSER_PW_EXP_RQRD'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'N'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5831523251641893693)
,p_event_id=>wwv_flow_imp.id(5831521773496893692)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P124_APPLUSER_PW_EXP_DAYS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5831522814010893693)
,p_event_id=>wwv_flow_imp.id(5831521773496893692)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P124_APPLUSER_PW_EXP_DAYS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5831522311090893692)
,p_event_id=>wwv_flow_imp.id(5831521773496893692)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P124_APPLUSER_PW_EXP_DAYS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', '0')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5831526417553893701)
,p_name=>'P124_APPLUSER_SUPLR_ID'
,p_static_id=>'p124-appluser-suplr-id'
,p_event_sequence=>240
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P124_APPLUSER_SUPLR_ID'
,p_condition_element=>'P124_APPLUSER_SUPLR_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5831526872834893701)
,p_event_id=>wwv_flow_imp.id(5831526417553893701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P124_UAPPUSER_PARTY_ID',
  'items_to_submit', 'P124_UAPPUSER_USER_TYPE,P124_UAPPUSER_SUPLR_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P124_UAPPUSER_SUPLR_ID IS NOT NULL AND :P124_UAPPUSER_USER_TYPE IN (''S'') THEN',
    '    DECLARE',
    '        CURSOR c1',
    '            IS',
    '        SELECT suplr_suplr_id,suplr_name1',
    '          FROM suppliers',
    '         WHERE suplr_bu          = :GLOBAL_bu',
    '           AND suplr_suplr_id    = :P124_UAPPUSER_SUPLR_ID',
    '           AND SUPLR_PARTY_TYPE  = ''S''',
    '           AND suplr_status      = ''A'';',
    '           cr1                  c1%ROWTYPE;',
    '	 BEGIN',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	     IF c1%FOUND THEN',
    '            --  :P124_EMP_NAME          := cr1.suplr_name1;',
    '             :P124_UAPPUSER_PARTY_ID := :P124_UAPPUSER_SUPLR_ID;',
    '	 	     END IF;',
    '        CLOSE c1;',
    '    END;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5831524606277893696)
,p_name=>'P124_UAPPUSER_EMP_ID'
,p_static_id=>'p124-uappuser-emp-id'
,p_event_sequence=>220
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P124_UAPPUSER_EMP_ID'
,p_condition_element=>'P124_UAPPUSER_EMP_ID'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5831525102093893698)
,p_event_id=>wwv_flow_imp.id(5831524606277893696)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P124_UAPPUSER_POS_ID,P124_UAPPUSER_EMP_NAME,P124_UAPPUSER_DEPT_ID,P124_POSITION,P124_UAPPUSER_MOBILE_NO,P124_DEPARTMENT_NAME,P124_UAPPUSER_EMAIL_ID,P124_UAPPUSER_PARTY_ID',
  'items_to_submit', 'P124_UAPPUSER_EMP_ID,P124_UAPPUSER_USER_TYPE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P124_UAPPUSER_EMP_ID IS NOT NULL AND :P124_UAPPUSER_USER_TYPE IN (''E'',''U'',''P'',''O'') THEN',
    '    DECLARE',
    '        CURSOR c1',
    '            IS',
    '        SELECT emp_emp_id,',
    '               emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 emp_name,',
    '               empai_dept_id,',
    '               (SELECT dept_name1',
    '                  FROM departments',
    '                 WHERE dept_bu = emp_bu ',
    '                   AND dept_id = empai_dept_id) dept_name,',
    '               empai_pos_id,',
    '               (SELECT hrpos_pos_name1',
    '                  FROM hr_positions',
    '                 WHERE hrpos_bu = emp_bu',
    '                   AND hrpos_pos_id = empai_pos_id) pos_name,',
    '               emp_start_date,',
    '               emp_off_email_id,',
    '               emp_off_mobile_no',
    '          FROM employees,',
    '               emp_active_infos',
    '         WHERE emp_bu  = empai_bu',
    '           AND emp_emp_id = empai_emp_id',
    '           AND emp_bu     = :GLOBAL_bu',
    '           AND emp_emp_id = :P124_UAPPUSER_EMP_ID',
    '           AND emp_status = ''A'';',
    '',
    '    cr1                 c1%ROWTYPE;',
    '',
    '    BEGIN',
    '        OPEN c1;',
    '        FETCH c1 INTO cr1;',
    '            IF c1%FOUND THEN',
    '               :P124_UAPPUSER_POS_ID    := cr1.empai_pos_id;',
    '               :P124_UAPPUSER_EMP_NAME  := cr1.emp_name;',
    '               :P124_UAPPUSER_DEPT_ID   := cr1.empai_dept_id;',
    '               :P124_POSITION           := cr1.pos_name;',
    '               :P124_UAPPUSER_MOBILE_NO := cr1.emp_off_mobile_no;',
    '               :P124_DEPARTMENT_NAME    := cr1.dept_name;',
    '               :P124_UAPPUSER_EMAIL_ID  := cr1.emp_off_email_id;',
    '               :P124_UAPPUSER_PARTY_ID  := :P124_UAPPUSER_EMP_ID;',
    '            END IF;',
    '        CLOSE c1;',
    '    END;',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5831519095776893671)
,p_name=>'PASSWORD'
,p_static_id=>'password'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P124_PASSWORD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5831519559468893685)
,p_event_id=>wwv_flow_imp.id(5831519095776893671)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P124_PASSWORD',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    ':P124_UAPPUSER_PASSWORD := func_get_hash(:P124_UAPPUSER_ID,:P124_PASSWORD);',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(5831520929699893690)
,p_name=>'pw_exp_days'
,p_static_id=>'pw-exp-days'
,p_event_sequence=>180
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P124_APPLUSER_PW_EXP_DAYS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(5831521427752893690)
,p_event_id=>wwv_flow_imp.id(5831520929699893690)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P124_APPLUSER_PWD_EXP_DUE',
  'items_to_submit', 'P124_APPLUSER_PW_EXP_DAYS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :P124_APPLUSER_PW_EXP_DAYS is not null then',
    'IF :P124_APPLUSER_PW_EXP_DAYS > 0 THEN',
    '   :P124_APPLUSER_PWD_EXP_DUE := (TRUNC(SYSDATE) + :P124_APPLUSER_PWD_EXP_DUE) - 1;',
    'ELSE',
    '	 :P124_APPLUSER_PWD_EXP_DUE:= NULL;',
    'END IF;',
    ' end if;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5831509566798893592)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(11899352845984920330)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Create User Initilization'
,p_static_id=>'create-user-initilization'
,p_internal_uid=>349547731255282564
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5778924282934993356)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New Doc'
,p_static_id=>'new-doc'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    CURSOR C1',
'        IS',
'        SELECT * ',
'          FROM upd_appl_users',
'         WHERE uappuser_bu = :GLOBAL_bu',
'           AND uappuser_id = :P124_P_USER_ID',
'           AND uappuser_status = ''N'';',
'',
'        cr1             c1%ROWTYPE;',
'BEGIN',
'    OPEN c1;',
'    FETCH c1 INTO cr1;',
'        IF c1%FOUND THEN',
'            SELECT ROWID INTO :P124_ROWID ',
'              FROM upd_appl_users',
'             WHERE uappuser_bu = :GLOBAL_bu',
'               AND uappuser_id = :P124_P_USER_ID',
'               AND uappuser_status = ''N'';',
'        ELSE',
'            proc_upd_user (:GLOBAL_BU,:P124_P_USER_ID,''USERS'',:P124_P_USER_ID,:P124_UAPPUSER_DOC_NO);',
'',
'            SELECT rowid into :P124_ROWID ',
'              FROM upd_appl_users ',
'             WHERE uappuser_bu = :GLOBAL_BU ',
'               AND uappuser_doc_no = :P124_UAPPUSER_DOC_NO;',
'        END IF;',
'END;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>296962447391382328
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5831514255475893651)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Post Query'
,p_static_id=>'post-query'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P124_UAPPUSER_EMP_ID IS NOT NULL AND :P124_UAPPUSER_USER_TYPE IN (''E'',''U'',''P'',''O'') THEN',
'	DECLARE  ',
'		  CURSOR c1',
'		      IS',
'		  SELECT emp_emp_id, emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 emp_name,empai_dept_id,(SELECT dept_name1 FROM departments WHERE dept_bu = emp_bu AND dept_id = empai_dept_id)dept_name,empai_pos_id,(SELECT hrpos_pos_name1 FROM hr_po'
||'sitions WHERE hrpos_bu = emp_bu AND hrpos_pos_id = empai_pos_id)pos_name,emp_start_date, emp_email_id,emp_mobile_no',
'		    FROM employees,emp_active_infos WHERE emp_bu  = empai_bu AND emp_emp_id = empai_emp_id AND emp_bu     = :GLOBAL_bu AND emp_emp_id = :P124_UAPPUSER_EMP_ID AND emp_status = ''A'';',
'		     cr1													c1%ROWTYPE;',
'		  CURSOR c4',
'		      IS',
'		  SELECT *',
'		    FROM appl_users WHERE appluser_bu = :GLOBAL_bu AND appluser_id <> :P124_UAPPUSER_USER_TYPE AND appluser_emp_id = :P124_UAPPUSER_EMP_ID AND appluser_status NOT IN (''D'');	     ',
'		    cr4         c4%ROWTYPE; 	  ',
'	BEGIN',
'		OPEN c1;',
'		FETCH c1 INTO cr1;',
'		    IF c1%FOUND THEN',
'               :P124_UAPPUSER_EMP_NAME :=  cr1.emp_name;',
'               :P124_POSITION          :=  cr1.pos_name;',
'               :P124_DEPARTMENT_NAME   :=  cr1.dept_name;',
'		    END IF; ',
'        CLOSE c1;',
'    END;',
'',
'ELSIF :P124_UAPPUSER_CUST_ID IS NOT NULL AND :P124_UAPPUSER_USER_TYPE IN (''C'') THEN',
'	 ',
'    DECLARE',
'	 	  ',
'        CURSOR c1',
'            IS',
'	 	SELECT suplr_name1',
'	 	  FROM suppliers',
'	 	 WHERE suplr_bu       = :GLOBAL_bu',
'	 	   AND suplr_suplr_id = :P124_UAPPUSER_CUST_ID;',
'',
'        cr1                     c1%ROWTYPE;',
'',
'    BEGIN',
'',
'        OPEN c1;',
'        FETCH c1 INTO cr1;',
'',
'            IF c1%FOUND THEN',
'               :P124_UAPPUSER_EMP_NAME := cr1.suplr_name1;',
'            END IF;',
'',
'	 	  CLOSE c1;',
'',
'	 END;',
'	 ',
'ELSIF :P124_UAPPUSER_SUPLR_ID IS NOT NULL AND :P124_UAPPUSER_USER_TYPE IN (''S'') THEN',
'',
'    DECLARE',
'',
'        CURSOR c1',
'            IS',
'        SELECT suplr_name1',
'          FROM suppliers',
'         WHERE suplr_bu       = :GLOBAL_bu',
'           AND suplr_suplr_id = :P124_UAPPUSER_SUPLR_ID;',
'',
'        cr1                     c1%ROWTYPE;',
'',
'    BEGIN',
'',
'        OPEN c1;',
'        FETCH c1 INTO cr1;',
'',
'            IF c1%FOUND THEN',
'               :P124_UAPPUSER_EMP_NAME := cr1.suplr_name1;',
'            END IF;',
'',
'        CLOSE c1;',
'',
'    END;',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>349552419932282623
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5831518321464893665)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pre Insert Update'
,p_static_id=>'pre-insert-update'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P124_ROWID IS NULL THEN',
'   :P124_UAPPUSER_BU           := :GLOBAL_BU;',
'   :P124_UAPPUSER_CRE_BY       := :GLOBAL_USER;',
'   :P124_UAPPUSER_CRE_IP_ADDR  := :GLOBAL_IP;',
'   :P124_UAPPUSER_CRE_EMP_ID   := :GLOBAL_EMP_ID;',
'   :P124_UAPPUSER_CRE_DATE     := TO_CHAR(SYSDATE,''DD-MON-RRRR HH24:MI:SS'');',
'ELSE',
'   :P124_UAPPUSER_UPD_BY       := :GLOBAL_USER;',
'   :P124_UAPPUSER_UPD_IP_ADDR  := :GLOBAL_IP;',
'   :P124_UAPPUSER_UPD_EMP_ID   := :GLOBAL_EMP_ID;',
'   :P124_UAPPUSER_UPD_DATE     := TO_CHAR(SYSDATE,''DD-MON-RRRR HH24:MI:SS'');',
'END IF;',
'',
'IF :P124_UAPPUSER_USER_TYPE NOT IN (''S'',''C'') THEN',
'   :P124_UAPPUSER_PARTY_ID := :P124_UAPPUSER_EMP_ID;',
'ELSIF :P124_UAPPUSER_USER_TYPE = ''S'' THEN',
'   :P124_UAPPUSER_PARTY_ID := :P124_UAPPUSER_SUPLR_ID;',
'ELSIF :P124_UAPPUSER_USER_TYPE = ''C'' THEN',
'   :P124_UAPPUSER_PARTY_ID := :P124_UAPPUSER_CUST_ID;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Insert,Update,Activate'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>349556485921282637
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5831509205340893587)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(11899352845984920330)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Create User'
,p_static_id=>'process-form-create-user'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Insert,Update'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>349547369797282559
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5831513925926893649)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process from Mobile and email Update '
,p_static_id=>'process-from-mobile-and-email-update'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P124_UAPPUSER_ID IS NOT NULL AND :P124_UAPPUSER_MOBILE_NO IS NOT NULL THEN',
'',
'    UPDATE employees',
'       SET emp_off_mobile_no = :P124_UAPPUSER_MOBILE_NO,',
'           emp_upd_by        = :Global_user,',
'           emp_upd_date      = SYSDATE,',
'           emp_upd_emp_id    = :Global_emp_id',
'     WHERE emp_bu            = :GLOBAL_bu ',
'       AND emp_emp_id        = :P124_UAPPUSER_EMP_ID;',
'END IF;',
'',
'IF :P124_UAPPUSER_ID IS NOT NULL AND :P124_UAPPUSER_EMAIL_ID IS NOT NULL THEN',
'    UPDATE employees',
'       SET emp_off_email_id = :P124_UAPPUSER_EMAIL_ID,',
'           emp_upd_by       = :Global_user,',
'           emp_upd_date     = SYSDATE,',
'           emp_upd_emp_id   = :Global_emp_id',
'     WHERE emp_bu           = :GLOBAL_bu',
'       AND emp_emp_id       = :P124_UAPPUSER_EMP_ID;',
'END IF;',
'',
'COMMIT;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Insert,Update,Activate'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>349552090383282621
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5863769372746849450)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Un Locked'
,p_static_id=>'un-locked'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE appl_users',
'   SET appluser_lock_chk  = ''N'',',
'       appluser_login_atm = ''0'',',
'       appluser_upd_by    = :GLOBAL_user,',
'       appluser_upd_date  = SYSDATE',
' WHERE appluser_bu = :GLOBAL_bu',
'   AND appluser_id = :P124_P_USER_ID;',
'COMMIT;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5863769439983849451)
,p_internal_uid=>384248388961929248
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5863769213750849449)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update'
,p_static_id=>'update'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE appl_users ',
'   SET appluser_emp_id = :P124_UAPPUSER_EMP_ID,',
'       appluser_upd_by = :GLOBAL_user,',
'       appluser_upd_date = SYSDATE',
' WHERE appluser_bu     = :GLOBAL_bu',
'   AND appluser_emp_id = :P124_P_EMP_ID;',
'',
'UPDATE appl_users',
'   SET appluser_party_id  = :P124_UAPPUSER_EMP_ID,',
'       appluser_upd_by    = :GLOBAL_user,',
'       appluser_upd_date  = SYSDATE',
' WHERE appluser_bu        = :GLOBAL_bu',
'   AND appluser_party_id  = :P124_P_EMP_ID;',
'',
'UPDATE appl_users',
'   SET appluser_user_type = :P124_UAPPUSER_USER_TYPE,',
'       appluser_eff_from  = :P124_UAPPUSER_EFF_FROM,',
'       appluser_eff_to    = :P124_UAPPUSER_EFF_TO,',
'       appluser_upd_by    = :GLOBAL_user,',
'       appluser_upd_date  = SYSDATE',
' WHERE appluser_bu        = :GLOBAL_bu',
'   AND appluser_emp_id    = :P124_P_EMP_ID;',
'',
'UPDATE wf_direct_authorization',
'   SET wfda_position = :P124_UAPPUSER_EMP_ID,',
'       wfda_upd_by   = :GLOBAL_user,',
'       wfda_upd_date = SYSDATE',
' WHERE wfda_bu       = :GLOBAL_bu',
'   AND wfda_position = :P124_P_EMP_ID;',
'',
'UPDATE wf_emp_hierarchy ',
'   SET weh_emp_id   = :P124_UAPPUSER_EMP_ID,',
'       weh_upd_by   = :GLOBAL_user,',
'       weh_upd_date = SYSDATE',
' WHERE weh_bu       = :GLOBAL_bu',
'   AND weh_emp_id   = :P124_P_EMP_ID;',
'',
'UPDATE wf_emp_hierarchy ',
'   SET weh_par_emp_id = :P124_UAPPUSER_EMP_ID,',
'       weh_upd_by     = :GLOBAL_user,',
'       weh_upd_date   = SYSDATE',
' WHERE weh_bu         = :GLOBAL_bu',
'   AND weh_par_emp_id = :P124_P_EMP_ID;',
'',
'UPDATE work_flow_doc_control',
'   SET wfdc_ctrl_person = :P124_UAPPUSER_EMP_ID,',
'       wfdc_upd_by      = :GLOBAL_user,',
'       wfdc_upd_date    = SYSDATE',
' WHERE wfdc_bu          = :GLOBAL_bu',
'   AND wfdc_ctrl_person = :P124_P_EMP_ID;',
'',
'COMMIT;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(5863769127658849448)
,p_internal_uid=>384248229965929247
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(5831514656954893651)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'User Validate'
,p_static_id=>'user-validate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'',
'    CURSOR c1',
'        IS',
'        SELECT *',
'          FROM upd_appl_users',
'         WHERE UAPPUSER_ID = :P124_UAPPUSER_ID',
'           AND (ROWID <> :P124_ROWID OR :P124_ROWID IS NULL);',
'',
'    cr1           c1%ROWTYPE;',
'',
'    CURSOR c2',
'        IS',
'        SELECT *',
'          FROM upd_appl_users',
'         WHERE UAPPUSER_BU = :GLOBAL_bu',
'           AND UAPPUSER_USER_TYPE <> ''O''',
'           AND UAPPUSER_ID = :P124_UAPPUSER_ID',
'           AND (ROWID <> :P124_ROWID OR :P124_ROWID IS NULL);',
'',
'    cr2            c2%ROWTYPE;',
'',
'    CURSOR c3',
'        IS',
'        SELECT COUNT(*) v_cnt',
'          FROM upd_appl_users',
'         WHERE UAPPUSER_BU <> :Global_bu',
'           AND UAPPUSER_ID = :P124_UAPPUSER_ID;',
'',
'    cr3            c3%ROWTYPE;',
'',
'    CURSOR c4',
'        IS',
'        SELECT COUNT(*) v_cnt',
'          FROM upd_appl_users',
'         WHERE UAPPUSER_ID      = :P124_UAPPUSER_ID',
'           AND UAPPUSER_EMP_ID  = :P124_UAPPUSER_EMP_ID',
'         GROUP BY UAPPUSER_ID,UAPPUSER_EMP_ID;',
'',
'    cr4            c4%ROWTYPE;',
'',
'BEGIN',
'   IF :P124_UAPPUSER_USER_TYPE <> ''O'' THEN',
'        OPEN c1;',
'        FETCH c1 INTO cr1;',
'            IF c1%FOUND THEN',
'               RAISE_APPLICATION_ERROR(-20999,''Username already exists.'');',
'            END IF;',
'        CLOSE c1;',
'',
'    ELSE',
'        OPEN c2;',
'        FETCH c2 INTO cr2;',
'            IF c2%FOUND THEN',
'               RAISE_APPLICATION_ERROR(-20999,''Username already exists.'');',
'            END IF;',
'        CLOSE c2;',
'',
'        OPEN c3;',
'        FETCH c3 INTO cr3;',
'            IF cr3.v_cnt > 0 THEN',
'               RAISE_APPLICATION_ERROR(-20999,''Username already exists.'');',
'            END IF;',
'        CLOSE c3;',
'',
'        OPEN c4;',
'        FETCH c4 INTO cr4;',
'            IF cr4.v_cnt > 1 THEN',
'               RAISE_APPLICATION_ERROR(-20999,''Same Username and Employee already exists.'');',
'            END IF;',
'        CLOSE c4;',
'    END IF;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Insert,Update,Activate'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>349552821411282623
);
wwv_flow_imp.component_end;
end;
/
