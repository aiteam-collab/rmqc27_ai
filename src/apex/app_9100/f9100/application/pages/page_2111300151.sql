prompt --application/pages/page_2111300151
begin
--   Manifest
--     PAGE: 2111300151
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
 p_id=>2111300151
,p_name=>'Application Users'
,p_alias=>'CREATE-USERS1'
,p_step_title=>'Application Users'
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
'    font-weight: bold;',
'}',
'.t-Region-title {',
'    font-size: larger;',
'}',
'',
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
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9846022261442810598)
,p_plug_name=>'<b>Signup</b>'
,p_static_id=>'b-signup-b'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody:t-Form--leftLabels:margin-top-lg'
,p_region_attributes=>'style="box-shadow: 0px 1px 16px 0 rgba(0,0,0,0.36);"'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>8
,p_plug_display_column=>3
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8383573144776687771)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_parent_plug_id=>wwv_flow_imp.id(9846022261442810598)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--stacked:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7779131784014897116)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_parent_plug_id=>wwv_flow_imp.id(9846022261442810598)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7779134028258897139)
,p_plug_name=>'Change Password'
,p_static_id=>'change-password'
,p_parent_plug_id=>wwv_flow_imp.id(9846022261442810598)
,p_region_template_options=>'#DEFAULT#:js-dialog-size480x320'
,p_plug_template=>wwv_flow_imp.id(10650510175351505351)
,p_plug_display_sequence=>70
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P2111300151_APPLUSER_STATUS'
,p_plug_read_only_when2=>'D'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(10538759718785365433)
,p_plug_name=>'Create User '
,p_static_id=>'create-user'
,p_parent_plug_id=>wwv_flow_imp.id(9846022261442810598)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>6
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
,p_plug_read_only_when=>':P2111300151_APPLUSER_STATUS in(''A'',''D'')'
,p_plug_read_only_when2=>'PLSQL'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7779131828341897117)
,p_name=>'Load_Image'
,p_static_id=>'load-image'
,p_parent_plug_id=>wwv_flow_imp.id(9846022261442810598)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-Form--large:margin-top-sm:margin-bottom-none:margin-left-none:margin-right-none'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--cols:t-Cards--animColorFill'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
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
'          WHERE APPLUSER_ID        = :P2111300151_APPLUSER_ID',
'            AND APPLUSER_USER_TYPE = :P2111300151_USER_TYPE',
'            AND APPLUSER_EMP_ID    = :P2111300151_APPLUSER_EMP_ID)CARD_TEXT,',
'       (SELECT INITCAP(HRPOS_POS_NAME1)',
'          FROM HR_POSITIONS',
'         WHERE HRPOS_BU     = :GLOBAL_BU',
'           AND HRPOS_POS_ID = :P2111300151_APPLUSER_POS_ID',
'           )',
'       CARD_SUBTEXT',
'FROM doc_mgmt',
'WHERE dm_bu = :Global_bu',
'AND dm_vou_no =:P2111300151_APPLUSER_EMP_ID',
'AND dm_vou_type =''E_IMG''',
'UNION ALL',
'SELECT CASE WHEN  EMP_GENDER=''F'' ',
'            THEN ''<center><img alt="''||apex_escape.html_attribute(:P2111300151_APPLUSER_EMP_ID)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src=''''#APP_IMAGES#women_1.png'''' height = "110" width = "110"/></center'
||'>''',
'            ELSE ''<center><img alt="''||apex_escape.html_attribute(:P2111300151_APPLUSER_EMP_ID)||''"style="border: 0px;-moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src=''''#APP_IMAGES#profile_1.png'''' height = "110" width = "110"/></cente'
||'r>'' ',
'       END ',
'       CARD_TITLE,',
'       NULL CARD_SUBTITLE,',
'       (SELECT APPLUSER_EMP_ID||''-''||',
'                (SELECT  emp_first_name1||'' ''||emp_middle_name1||'' ''||emp_last_name1 emp_name',
'                  FROM EMPLOYEES ',
'                  WHERE EMP_BU=APPLUSER_BU',
'                    AND EMP_EMP_ID=APPLUSER_EMP_ID)',
'           FROM APPL_USERS',
'          WHERE APPLUSER_ID        = :P2111300151_APPLUSER_ID',
'            AND APPLUSER_USER_TYPE = :P2111300151_USER_TYPE',
'            AND APPLUSER_EMP_ID    = :P2111300151_APPLUSER_EMP_ID)CARD_TEXT,',
'       (SELECT INITCAP(HRPOS_POS_NAME1)',
'          FROM HR_POSITIONS',
'         WHERE HRPOS_BU = :GLOBAL_BU',
'           AND HRPOS_POS_ID = :P2111300151_APPLUSER_POS_ID)',
'       CARD_SUBTEXT',
'  FROM EMPLOYEES',
' WHERE EMP_BU = :GLOBAL_BU',
'   AND EMP_EMP_ID = :P2111300151_APPLUSER_EMP_ID',
'   AND EMP_EMP_ID NOT IN (SELECT DM_VOU_NO',
'                            FROM DOC_MGMT',
'                           WHERE DM_BU = :GLOBAL_BU',
'                             AND DM_VOU_TYPE = ''E_IMG''',
'                             AND DM_VOU_NO IS NOT NULL)',
'UNION ALL',
'SELECT ''<center><img alt="''||apex_escape.html_attribute(:P2111300151_APPLUSER_EMP_ID)||''"style="border: 0px; -moz-border-radius: 70px; -webkit-border-radius: 70px;" ''||'' src=''''#APP_IMAGES#profile.png'''' height = "110" width = "110"/></center>''',
'       CARD_TITLE,',
'       NULL CARD_SUBTITLE,',
'       NULL CARD_TEXT,',
'       NULL CARD_SUBTEXT',
'  FROM suppliers',
' WHERE suplr_bu       = :GLOBAL_BU',
'   AND (suplr_suplr_id  = :P2111300151_APPLUSER_SUPLR_ID  OR suplr_suplr_id  = :P2111300151_APPLUSER_CUST_ID)',
'   AND suplr_suplr_id  NOT IN (SELECT DM_VOU_NO',
'                            FROM DOC_MGMT',
'                           WHERE DM_BU = :GLOBAL_BU',
'                             AND DM_VOU_TYPE = ''E_IMG''',
'                             AND DM_VOU_NO IS NOT NULL)'))
,p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_read_only_when=>'P2111300151_APPLUSER_STATUS'
,p_read_only_when2=>'D'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P2111300151_APPLUSER_ID,P2111300151_APPLUSER_EMP_ID,P2111300151_APPLUSER_POS_ID,P2111300151_APPLUSER_USER_TYPE'
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
 p_id=>wwv_flow_imp.id(7116848743412665834)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>200
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7116847587790665817)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>210
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7116847983178665828)
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
 p_id=>wwv_flow_imp.id(7116848361966665832)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>170
,p_column_heading=>'Card Title'
,p_column_format=>'PCT_GRAPH:#f9f9f9::'
,p_column_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::P6_ROWID,P6_EMP_ROWID,P6_DM_VOU_NO,P6_TITLE,P6_TYPE,P6_RETURN_PAGE_NO:#CARD_SUBTITLE#,&P2111300151_ROWID.,&P2111300151_APPLUSER_EMP_ID.,&P2111300151_EMP_NAME.,IMG,2111300151'
,p_column_linktext=>'#CARD_TITLE#'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116833566259665753)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(8383573144776687771)
,p_button_name=>'Add'
,p_static_id=>'add'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:21113001502:&SESSION.::&DEBUG.::P21113001502_WF_NO:'
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
 p_id=>wwv_flow_imp.id(7116833152683665751)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8383573144776687771)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:21113001503:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116833977945665753)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(8383573144776687771)
,p_button_name=>'Change_Password'
,p_static_id=>'change-password'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Change Password'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1',
'  FROM appl_users',
' WHERE appluser_bu = :Global_bu',
'   AND appluser_id = :Global_user',
'   AND (appluser_user_type <> ''R''',
'       OR (appluser_user_type = ''R'' ',
'        AND appluser_emp_id IS NOT NULL))'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-key'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6727031344698530803)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(8383573144776687771)
,p_button_name=>'Change_User'
,p_static_id=>'change-user'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Change User'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:185:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116832369302665751)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(8383573144776687771)
,p_button_name=>'Inactivate'
,p_static_id=>'inactivate'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--danger:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Deactive'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P2111300151_ROWID is not null and :P2111300151_APPLUSER_STATUS = ''A'' AND (SELECT 1',
'                                                                             FROM appl_users',
'                                                                            WHERE appluser_bu = :Global_bu',
'                                                                              AND appluser_id = :Global_user',
'                                                                              AND (appluser_user_type <> ''R''',
'                                                                                  OR (appluser_user_type = ''R'' ',
'                                                                                   AND appluser_emp_id IS NOT NULL))) = 1'))
,p_button_condition2=>'SQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-remove'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7393561589433755745)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(8383573144776687771)
,p_button_name=>'Report'
,p_static_id=>'report'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Report'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:21113001503:&SESSION.::&DEBUG.::P21113001503_SHOW_DATA,P21113001503_DUMMY,P21113001503_SEARCH_TYPE,P21113001503_REFIND:Y,1,&P2111300151_SERACH_TYPE.,Y'
,p_icon_css_classes=>'fa-list'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116832825516665751)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(8383573144776687771)
,p_button_name=>'Save_user'
,p_static_id=>'save-user'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-check'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7116856268331665859)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7779134028258897139)
,p_button_name=>'saved_password'
,p_static_id=>'saved-password'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7393561482872755744)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(8383573144776687771)
,p_button_name=>'Search'
,p_static_id=>'search'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:21113001503:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-search'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5628976186035381764)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(8383573144776687771)
,p_button_name=>'Update'
,p_static_id=>'update'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Update'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=800:124:&SESSION.::&DEBUG.::P124_P_USER_ID,P124_P_EMP_ID,P124_USERS_ROWID,P124_LOCK_CHK:&P2111300151_APPLUSER_ID.,&P2111300151_APPLUSER_EMP_ID.,&P2111300151_ROWID.,&P2111300151_APPLUSER_LOCK_CHK.'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7116863260625665890)
,p_branch_name=>'workflow self-Approve'
,p_branch_action=>'f?p=&APP_ID.:2111300151:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>80
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>':P2111300151_WF_COUNT = ''WFM1091'''
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(7116863657948665890)
,p_branch_name=>'Workflow(236131090)'
,p_branch_action=>'f?p=&APP_ID.:236131090:&SESSION.::&DEBUG.::P236131090_P_WF_TYPE,P236131090_FWD_ENTITY,P236131090_P_DOC_NO,P236131090_P_PAGE_ID,P236131090_P_DOC_PFX:WF_USER,&GLOBAL_BU.,&P2111300151_APPLUSER_PARTY_ID.,21113001503,D'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>80
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>':P2111300151_WF_COUNT =''WFM1090'''
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7909364772551444382)
,p_name=>'P2111300151_APPLUSER_ALLOW_CC_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7779131784014897116)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_default=>'N'
,p_source=>'APPLUSER_ALLOW_CC_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when=>':P2111300151_APPLUSER_USER_TYPE = ''E'' AND :P2111300151_APPLUSER_STATUS <> ''D'''
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7894626092904563311)
,p_name=>'P2111300151_APPLUSER_APEX_LANG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>710
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_default=>'en'
,p_source=>'APPLUSER_APEX_LANG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8415576228327436422)
,p_name=>'P2111300151_APPLUSER_BU'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_default=>':GLOBAL_BU'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'APPLUSER_BU'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8476597369517125586)
,p_name=>'P2111300151_APPLUSER_CUST_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>730
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_source=>'APPLUSER_CUST_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8415574653256436419)
,p_name=>'P2111300151_APPLUSER_DEPT_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_source=>'APPLUSER_DEPT_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8415658504231436658)
,p_name=>'P2111300151_APPLUSER_EFF_FROM'
,p_source_data_type=>'DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(7779131784014897116)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'<b>Eff. From</b>'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'APPLUSER_EFF_FROM'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_read_only_when=>'P2111300151_ROWID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
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
 p_id=>wwv_flow_imp.id(8415658858688436658)
,p_name=>'P2111300151_APPLUSER_EFF_TO'
,p_source_data_type=>'DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(7779131784014897116)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_default=>'31-DEC-2099'
,p_prompt=>'<b>Eff. To</b>'
,p_format_mask=>'&GLOBAL_DATE_FORMAT.'
,p_source=>'APPLUSER_EFF_TO'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P2111300151_ROWID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
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
 p_id=>wwv_flow_imp.id(8415586597731436500)
,p_name=>'P2111300151_APPLUSER_EMAIL_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7779131784014897116)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_prompt=>'<b>Email</b>'
,p_source=>'APPLUSER_EMAIL_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>67
,p_cMaxlength=>50
,p_read_only_when=>'P2111300151_ROWID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'EMAIL',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8415575825544436421)
,p_name=>'P2111300151_APPLUSER_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_source=>'APPLUSER_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8415659245069436659)
,p_name=>'P2111300151_APPLUSER_ERP_ADMIN_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7779131784014897116)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_default=>'N'
,p_source=>'APPLUSER_ERP_ADMIN_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8415571367485436413)
,p_name=>'P2111300151_APPLUSER_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_prompt=>'<b>Username</b>'
,p_source=>'APPLUSER_ID'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>67
,p_cMaxlength=>15
,p_tag_attributes=>' autocomplete="off"'
,p_read_only_when=>':P2111300151_APPLUSER_STATUS in(''A'',''D'')'
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5628973400954381736)
,p_name=>'P2111300151_APPLUSER_JRNL_POST'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(7779131784014897116)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_default=>'N'
,p_source=>'APPLUSER_JRNL_POST'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8415592998148436513)
,p_name=>'P2111300151_APPLUSER_LOCK_CHK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7779131784014897116)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_default=>'N'
,p_prompt=>'<b>Account Status</b>'
,p_source=>'APPLUSER_LOCK_CHK'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Locked;Y,Unlocked;N'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P2111300151_ROWID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8415587419671436500)
,p_name=>'P2111300151_APPLUSER_MOBILE_NO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7779131784014897116)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_prompt=>'<b>Mobile No.</b>'
,p_source=>'APPLUSER_MOBILE_NO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>65
,p_cMaxlength=>15
,p_read_only_when=>'P2111300151_ROWID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEL',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7909364616552444381)
,p_name=>'P2111300151_APPLUSER_OTP_FLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7779131784014897116)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_default=>'N'
,p_source=>'APPLUSER_OTP_FLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7909365312665444388)
,p_name=>'P2111300151_APPLUSER_OTP_SOURCE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(7779131784014897116)
,p_item_default=>'s'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8415573411463436417)
,p_name=>'P2111300151_APPLUSER_PARTY_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_prompt=>'<b>Employee</b>'
,p_source=>'APPLUSER_PARTY_ID'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_USER_CRE_EMP21'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select the Employee',
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8415576604648436425)
,p_name=>'P2111300151_APPLUSER_PASSWORD'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_source=>'APPLUSER_PASSWORD'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8415574982107436421)
,p_name=>'P2111300151_APPLUSER_POS_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_source=>'APPLUSER_POS_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8415639332637436634)
,p_name=>'P2111300151_APPLUSER_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(7779131784014897116)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_default=>'N'
,p_prompt=>'<b>Status</b>'
,p_source=>'APPLUSER_STATUS'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:New;N,Pending for Active;E,Active;A,Pending for Deactive;I,Deactive;D'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when=>'P2111300151_ROWID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7786820960465481532)
,p_name=>'P2111300151_APPLUSER_STATUS_1'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(7779131784014897116)
,p_item_default=>'N'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8476597255531125585)
,p_name=>'P2111300151_APPLUSER_SUPLR_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>720
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_source=>'APPLUSER_SUPLR_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8415587389865436438)
,p_name=>'P2111300151_APPLUSER_UPD_BY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_default=>':GLOBAL_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'APPLUSER_UPD_BY'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8415588601019436439)
,p_name=>'P2111300151_APPLUSER_UPD_DATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_default=>'SYSDATE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'APPLUSER_UPD_DATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8415589857641436441)
,p_name=>'P2111300151_APPLUSER_UPD_EMP_ID'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_default=>':GLOBAL_EMP_ID'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'APPLUSER_UPD_EMP_ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8415587769197436438)
,p_name=>'P2111300151_APPLUSER_UPD_IP_ADDR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_default=>':GLOBAL_IP'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'APPLUSER_UPD_IP_ADDR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8415588257795436439)
,p_name=>'P2111300151_APPLUSER_UPD_OS_USER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_default=>':GLOBAL_OS_USER'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'APPLUSER_UPD_OS_USER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8415574221646436419)
,p_name=>'P2111300151_APPLUSER_USER_TYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_default=>'E'
,p_prompt=>'<b>User Type</b>'
,p_source=>'APPLUSER_USER_TYPE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Admin;R,Functional;E,Module Specific;D,Management;G,Mobile App;M,ESS  Portal;U,Supplier  Portal;S,Customer  Portal;C,Subcontract  Portal;T'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8476619316942125693)
,p_name=>'P2111300151_CONFIRM_PASSWORD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7779134028258897139)
,p_prompt=>'Confirm Password'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7779140549023897153)
,p_name=>'P2111300151_DEPARTMENT_NAME'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_prompt=>'<b>Department</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8415573809186436419)
,p_name=>'P2111300151_EMP_NAME'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_prompt=>'<b>Name</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7801880125896409846)
,p_name=>'P2111300151_NEW_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7779134028258897139)
,p_prompt=>'New Password'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7801880044720409845)
,p_name=>'P2111300151_OLD_PASSWORD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7779134028258897139)
,p_prompt=>'Old Password'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8117672782574535908)
,p_name=>'P2111300151_PASSWORD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_default=>'****************************************'
,p_prompt=>'<b>Password</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7779140645230897154)
,p_name=>'P2111300151_POSITION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_prompt=>'<b>Designation</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(10650578599272505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8415600164617436453)
,p_name=>'P2111300151_ROWID'
,p_source_data_type=>'ROWID'
,p_is_primary_key=>true
,p_item_sequence=>690
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_item_source_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_source=>'ROWID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6388019246303381336)
,p_name=>'P2111300151_SEARCH_TYPE'
,p_item_sequence=>740
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7808971350041587112)
,p_name=>'P2111300151_V_OPT_TYPE'
,p_item_sequence=>700
,p_item_plug_id=>wwv_flow_imp.id(10538759718785365433)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8575057505984318741)
,p_name=>'P2111300151_WF_COUNT'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(7779131784014897116)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116859044931665863)
,p_validation_name=>'Confirm_password_val'
,p_static_id=>'confirm-password-val'
,p_validation_sequence=>80
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_err_msg      VARCHAR2(1000);',
'   ',
'	 v_ascii_val								NUMBER(5);',
'    v_pwd_exp_days							NUMBER(5);',
'    v_rules									   VARCHAR2(100);',
'    v_upc									   VARCHAR2(100);',
'    v_lc									      VARCHAR2(100);',
'    v_num									   VARCHAR2(100);',
'    v_spc									   VARCHAR2(100);',
'BEGIN',
'   IF :P2111300151_CONFIRM_PASSWORD IS NULL AND :P2111300151_ROWID IS NULL THEN',
'    	 RETURN(''Confirm Password must be entered.'');',
'   END IF;',
'',
'   IF :P2111300151_CONFIRM_PASSWORD IS NOT NULL THEN',
'',
'		proc_check_pass_complex (:P2111300151_CONFIRM_PASSWORD,v_rules,v_upc,v_lc,v_num,v_spc);  ',
'',
'      IF v_rules = ''N'' THEN',
'         RETURN(''Confirm Password must contain atleast one upper case letter , one lower case letter, one number and one special character.'');',
'		END IF;',
'	   ',
'      IF LENGTH(:P2111300151_CONFIRM_PASSWORD) NOT BETWEEN 3 AND 15 THEN',
'	  	   RETURN(''You must provide 3 to 15 characters for Password.'');',
'	   END IF;',
'   ',
'   END IF;',
'  ',
'   IF :P2111300151_NEW_PASSWORD <> :P2111300151_CONFIRM_PASSWORD then',
'        RETURN(''New Password and Confirm Password does not match'');',
'   END IF;',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_imp.id(7116856268331665859)
,p_associated_item=>wwv_flow_imp.id(8476619316942125693)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116857887460665862)
,p_validation_name=>'old_password'
,p_static_id=>'old-password'
,p_validation_sequence=>40
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P2111300151_OLD_PASSWORD is null then',
'    return(''Old Password Password must be entered. '');',
'end if;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(7116856268331665859)
,p_associated_item=>wwv_flow_imp.id(7801880044720409845)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116859518758665865)
,p_validation_name=>'Password Val.'
,p_static_id=>'password-val'
,p_validation_sequence=>90
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_err_msg      VARCHAR2(1000);',
'',
'	 v_ascii_val								NUMBER(5);',
'    v_pwd_exp_days							NUMBER(5);',
'    v_rules									   VARCHAR2(100);',
'    v_upc									   VARCHAR2(100);',
'    v_lc									      VARCHAR2(100);',
'    v_num									   VARCHAR2(100);',
'    v_spc									   VARCHAR2(100);',
'BEGIN',
'   IF :P2111300151_NEW_PASSWORD IS NULL THEN',
'    	 RETURN(''Password must be entered.'');',
'   END IF;',
'',
'   IF :P2111300151_NEW_PASSWORD IS NOT NULL THEN',
'',
'		proc_check_pass_complex (:P2111300151_NEW_PASSWORD,v_rules,v_upc,v_lc,v_num,v_spc);  ',
'',
'      IF v_rules = ''N'' THEN',
'         RETURN(''Password must contain atleast one upper case letter , one lower case letter, one number and one special character.'');',
'		END IF;',
'',
'      IF LENGTH(:P2111300151_NEW_PASSWORD) NOT BETWEEN 3 AND 15 THEN',
'	  	   RETURN(''You must provide 3 to 15 characters for Password.'');',
'	   END IF;',
'',
'   END IF;',
'',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_always_execute=>'Y'
,p_when_button_pressed=>wwv_flow_imp.id(7116856268331665859)
,p_associated_item=>wwv_flow_imp.id(7801880125896409846)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116858324517665863)
,p_validation_name=>'Validation_for_efffrom'
,p_static_id=>'validation-for-efffrom'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P2111300151_APPLUSER_EFF_FROM IS NOT NULL THEN',
'   -- IF TO_DATE(:P2111300151_APPLUSER_EFF_FROM,''DD-MON-YYYY'') > TO_DATE(:P2111300151_APPLUSER_EFF_TO,''DD-MON-YYYY'') THEN',
'   IF TO_DATE(:P2111300151_APPLUSER_EFF_FROM,:GLOBAL_DATE_FORMAT) > TO_DATE(:P2111300151_APPLUSER_EFF_TO,:GLOBAL_DATE_FORMAT) THEN',
'      RETURN(''Effective from date should be lesser than Effective To date'');',
'   END IF;',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(7116832825516665751)
,p_associated_item=>wwv_flow_imp.id(8415658504231436658)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7116858679585665863)
,p_validation_name=>'validation_for_effto'
,p_static_id=>'validation-for-effto'
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P2111300151_APPLUSER_EFF_TO IS NOT NULL THEN',
'   IF TO_DATE(:P2111300151_APPLUSER_EFF_TO,:GLOBAL_DATE_FORMAT) < TO_DATE(:P2111300151_APPLUSER_EFF_FROM,:GLOBAL_DATE_FORMAT) THEN',
'      RETURN(''Effective To date should be greater than Effective From date'');',
'   END IF;',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_when_button_pressed=>wwv_flow_imp.id(7116832825516665751)
,p_associated_item=>wwv_flow_imp.id(8415658858688436658)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7116860951069665878)
,p_name=>'Change_password_open'
,p_static_id=>'change-password-open'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7116833977945665753)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116861521267665881)
,p_event_id=>wwv_flow_imp.id(7116860951069665878)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7779134028258897139)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7116861853436665882)
,p_name=>'Pwd_Enable/Disable(Always)'
,p_static_id=>'pwd-enable-disable-always'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7116833977945665753)
,p_condition_element=>'P2111300151_APPLUSER_STATUS'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'A'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116862802758665888)
,p_event_id=>wwv_flow_imp.id(7116861853436665882)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(7116833977945665753)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7116862304905665882)
,p_event_id=>wwv_flow_imp.id(7116861853436665882)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(7116833977945665753)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116846892626665813)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(10538759718785365433)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Create User Initilization'
,p_static_id=>'create-user-initilization'
,p_internal_uid=>1634885057083054785
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116860603720665873)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Inactivate'
,p_static_id=>'inactivate'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	 CURSOR c1',
'	     IS',
'	 SELECT *',
'	   FROM wf_emp_hierarchy',
'	  WHERE weh_bu     = :GLOBAL_bu',
'	    AND weh_emp_id = :P2111300151_APPLUSER_EMP_ID;',
'	    ',
'	    cr1																	c1%ROWTYPE;',
'	    ',
'	 CURSOR c2',
'	     IS',
'	 SELECT *',
'	   FROM wf_emp_hierarchy',
'	  WHERE weh_bu         = :GLOBAL_bu',
'	    AND weh_par_emp_id = :P2111300151_APPLUSER_EMP_ID;',
'	    ',
'	    cr2																	c2%ROWTYPE;',
'	    ',
'	 CURSOR c3',
'	     IS',
'	 SELECT *',
'	   FROM wf_direct_authorization',
'	  WHERE wfda_bu       = :GLOBAL_bu',
'	    AND wfda_position = :P2111300151_APPLUSER_EMP_ID',
'	    AND EXISTS (SELECT wf_auth_type',
'							FROM work_flow',
'						  WHERE wf_bu 	        = wfda_bu',
'							 AND wf_bus_proc_id = wfda_type',
'							 AND wf_auth_type   = ''E'');',
'	    ',
'	    cr3																	c3%ROWTYPE;',
'	    ',
'	 CURSOR c4',
'	     IS',
'	 SELECT *',
'	   FROM work_flow_doc_control',
'	  WHERE wfdc_bu          = :GLOBAL_bu',
'	    AND wfdc_ctrl_person = :P2111300151_APPLUSER_EMP_ID',
'	    AND wfdc_frwd_rtn    NOT IN (''R'')',
'	    AND EXISTS (SELECT wf_auth_type',
'							FROM work_flow',
'						  WHERE wf_bu 	        = wfdc_bu',
'							 AND wf_bus_proc_id = wfdc_type',
'							 AND wf_auth_type   = ''E'');',
'	    ',
'	    cr4																	c4%ROWTYPE;',
'	    ',
'	 CURSOR c5',
'	     IS',
'	 SELECT *',
'	   FROM wf_doc_control_log',
'	  WHERE wfdcl_bu               = :GLOBAL_bu',
'	    AND wfdcl_prev_ctrl_person = :P2111300151_APPLUSER_EMP_ID',
'	    AND EXISTS (SELECT wf_auth_type',
'							FROM work_flow',
'						  WHERE wf_bu 	        = wfdcl_bu',
'							 AND wf_bus_proc_id = wfdcl_type',
'							 AND wf_auth_type   = ''E'');',
'	    ',
'	    cr5																	c5%ROWTYPE;',
'	 ',
'	    v_alert						NUMBER;    ',
'       v_appr_res					VARCHAR2(1);',
'       v_appr_msg					VARCHAR2(1000);',
'       v_erp_admin   	      VARCHAR2(15);',
'       v_erp_user			      VARCHAR2(15);',
'BEGIN',
'	 ',
'	 IF :P2111300151_APPLUSER_EMP_ID IS NOT NULL THEN',
'	 	  ',
'	 	  OPEN c1;',
'	 	  FETCH c1 INTO cr1;',
'	 	     ',
'	 	     IF c1%FOUND THEN',
'	 	     	  raise_application_error(-20999,''Employee Linked in workflow Hierarchy.'');',
'	 	     END IF;',
'	 	     ',
'	 	  CLOSE c1;',
'	 	  ',
'	 	  OPEN c2;',
'	 	  FETCH c2 INTO cr2;',
'	 	     ',
'	 	     IF c2%FOUND THEN',
'	 	     	  raise_application_error(-20999,''Employee Linked in workflow Hierarchy.'');',
'	 	     END IF;',
'	 	     ',
'	 	  CLOSE c2;',
'	 	  ',
'	 	  OPEN c3;',
'	 	  FETCH c3 INTO cr3;',
'	 	     ',
'	 	     IF c3%FOUND THEN',
'	 	     	  raise_application_error(-20999,''Employee Linked in workflow Authorization.'');',
'	 	     END IF;',
'	 	     ',
'	 	  CLOSE c3;',
'	 	  ',
'	 	  OPEN c4;',
'	 	  FETCH c4 INTO cr4;',
'	 	     ',
'	 	     IF c4%FOUND THEN',
'	 	     	  raise_application_error(-20999,''Employee Linked in workflow Document control.'');',
'	 	     END IF;',
'	 	     ',
'	 	  CLOSE c4;',
'',
'	 	  ',
'	 END IF;',
'',
'     proc_self_wf_appr(:GLOBAL_bu,',
'						     ''WF_USER'',',
'						     :GLOBAL_user,',
'						     1,',
'						     v_appr_res,',
'						     v_appr_msg,',
'						     p_plnt => NULL,',
'						     p_doc_date => NULL,',
'						     p_doc_pfx => ''D'',',
'						     p_doc_no => :P2111300151_APPLUSER_ID',
'						     );',
'',
'      IF v_appr_res = ''Y'' THEN',
'        :P2111300151_WF_COUNT := ''WFM1091'';  ',
'        apex_application.g_print_success_message := ''User Deactivated Successfully.'';	 ',
'      ELSE',
'        :P2111300151_WF_COUNT  := ''WFM1090'';',
'      END IF;    ',
'',
'	 ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7116832369302665751)
,p_internal_uid=>1634898768177054845
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116859738535665865)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pre_insert'
,p_static_id=>'pre-insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P2111300151_APPLUSER_PARTY_ID is not null then',
'        SELECT APPLUSER_POS_ID||''-''||(SELECT hrpos_pos_name1 FROM hr_positions WHERE hrpos_bu = APPLUSER_BU AND hrpos_active_flag = ''Y'' AND hrpos_pos_id = APPLUSER_POS_ID)pos_name,',
'               APPLUSER_DEPT_ID||''-''||(SELECT dept_name1 FROM departments WHERE dept_bu = APPLUSER_BU AND dept_id = APPLUSER_DEPT_ID)dept_name,',
'               (SELECT EMP_FIRST_NAME1 ',
'                   FROM EMPLOYEES',
'                  WHERE EMP_BU = :GLOBAL_BU',
'                    AND EMP_EMP_ID = APPLUSER_PARTY_ID)EMP_NAME',
'            into  :P2111300151_POSITION,:P2111300151_DEPARTMENT_NAME ,:P2111300151_EMP_NAME',
'        FROM APPL_USERS',
'            WHERE APPLUSER_BU=:GLOBAL_BU',
'            AND ROWID=:P2111300151_ROWID;',
'end if;',
'',
'',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>1634897902992054837
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116846517867665813)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(10538759718785365433)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Create User  Update'
,p_static_id=>'process-form-create-user-update'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7116832825516665751)
,p_process_success_message=>'&P2111300151_APPLUSER_ID. Details Updated Successfully.'
,p_internal_uid=>1634884682324054785
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7116860204162665871)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process from Change Password'
,p_static_id=>'process-from-change-password'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P2111300151_OLD_PASSWORD IS NULL THEN',
'	 raise_application_error(-20999,''Old Password must be entered.'');',
'END IF;',
'',
'IF :P2111300151_NEW_PASSWORD IS NULL THEN',
'	raise_application_error(-20999,''New Password must be entered.'');',
'END IF;',
'',
'IF :P2111300151_OLD_PASSWORD = :P2111300151_NEW_PASSWORD THEN',
'	 raise_application_error(-20999,''Old/New Password should not be same.'');',
'END IF;',
'',
'',
'',
'DECLARE',
' V_USER_TYPE    VARCHAR2(20);',
'BEGIN',
'',
'SELECT distinct APPLUSER_USER_TYPE INTO V_USER_TYPE',
'             FROM appl_users',
'            WHERE appluser_bu = :GLOBAL_bu',
'         AND appluser_id = :P2111300151_APPLUSER_ID;',
'  ',
'',
'IF V_USER_TYPE <> ''O'' THEN',
'',
'	 DECLARE',
'	 	  ',
'	 	  CURSOR c1',
'	 	      IS',
'	 	  SELECT *',
'	 	    FROM appl_users',
'	 	   WHERE appluser_bu = :GLOBAL_bu',
'         AND appluser_id = :P2111300151_APPLUSER_ID',
'         AND appluser_password = func_get_hash(:P2111300151_APPLUSER_ID, :P2111300151_OLD_PASSWORD);',
'         ',
'      cr1																c1%ROWTYPE;',
'      ',
'      CURSOR c2',
'	 	    IS',
'	 	 SELECT *',
'	 	   FROM policy_data',
'	 	  WHERE pda_bu = :GLOBAL_bu;',
'         ',
'      cr2																c2%ROWTYPE;',
'         ',
'      v_pwd_exp_date										DATE;',
'	 	  ',
'	 BEGIN',
'	 	   OPEN c2;',
'	 	   FETCH c2 INTO cr2;',
'	 	       IF c2%NOTFOUND THEN',
'	 	    	   RAISE_APPLICATION_ERROR(-20010,''Policy data not found.'');',
'	 	      ELSE',
'	 	    	   IF cr2.pda_pw_exp_rqrd  = ''Y'' THEN',
'	 	    	 	',
'				 	   IF cr2.pda_pw_freq = ''D'' THEN',
'				         v_pwd_exp_date := TRUNC(SYSDATE) + cr2.pda_pw_exp_days;',
'				 	   ELSIF cr2.pda_pw_freq = ''M'' THEN',
'				         v_pwd_exp_date := ADD_MONTHS(TRUNC(SYSDATE), cr2.pda_pw_exp_days);',
'				      ELSIF cr2.pda_pw_freq = ''Y'' THEN',
'				         v_pwd_exp_date := ADD_MONTHS(TRUNC(SYSDATE), (cr2.pda_pw_exp_days * 12));',
'				      END IF;',
'				    ',
'	 	    	   END IF;',
'	 	      END IF;',
'',
'	 	   CLOSE c2;',
'        ',
'         UPDATE appl_users',
'            SET appluser_password    = func_get_hash(:P2111300151_APPLUSER_ID, :P2111300151_NEW_PASSWORD),',
'                appluser_pw_lud      = TRUNC(SYSDATE),',
'                appluser_pwd_exp_due = v_pwd_exp_date,',
'                appluser_upd_by      = :GLOBAL_user,',
'                appluser_upd_date    = SYSDATE',
'          WHERE appluser_bu = :GLOBAL_bu',
'            AND appluser_id = :P2111300151_APPLUSER_ID;',
'',
'			  PROC_COMMIT;',
'			  ',
'         apex_application.g_print_success_message := ''Password Updated successully.'';	 ',
'',
'	 END;',
'END IF;',
'',
'',
'IF V_USER_TYPE = ''O'' THEN',
'',
'	 DECLARE',
'	 	  ',
'	 	  CURSOR c1',
'	 	      IS',
'	 	  SELECT *',
'	 	    FROM appl_users',
'	 	   WHERE appluser_bu = :GLOBAL_bu',
'         AND appluser_id = :P2111300151_APPLUSER_ID',
'         AND appluser_emp_id = :P2111300151_APPLUSER_EMP_ID',
'         AND appluser_password = func_get_hash(:P2111300151_APPLUSER_ID, :P2111300151_OLD_PASSWORD);',
'         ',
'      cr1																c1%ROWTYPE;',
'      ',
'      CURSOR c2',
'	 	    IS',
'	 	 SELECT *',
'	 	   FROM policy_data',
'	 	  WHERE pda_bu = :GLOBAL_bu;',
'         ',
'      cr2																c2%ROWTYPE;',
'         ',
'      v_pwd_exp_date										DATE;',
'	 	  ',
'	 BEGIN',
'	 	   OPEN c2;',
'	 	   FETCH c2 INTO cr2;',
'	 	       IF c2%NOTFOUND THEN',
'	 	    	   RAISE_APPLICATION_ERROR(-20010,''Policy data not found.'');',
'	 	      ELSE',
'	 	    	   IF cr2.pda_pw_exp_rqrd  = ''Y'' THEN',
'	 	    	 	',
'				 	   IF cr2.pda_pw_freq = ''D'' THEN',
'				         v_pwd_exp_date := TRUNC(SYSDATE) + cr2.pda_pw_exp_days;',
'				 	   ELSIF cr2.pda_pw_freq = ''M'' THEN',
'				         v_pwd_exp_date := ADD_MONTHS(TRUNC(SYSDATE), cr2.pda_pw_exp_days);',
'				      ELSIF cr2.pda_pw_freq = ''Y'' THEN',
'				         v_pwd_exp_date := ADD_MONTHS(TRUNC(SYSDATE), (cr2.pda_pw_exp_days * 12));',
'				      END IF;',
'				    ',
'	 	    	   END IF;',
'	 	      END IF;',
'',
'	 	   CLOSE c2;',
'        ',
'         UPDATE appl_users',
'            SET appluser_password    = func_get_hash(:P2111300151_APPLUSER_ID, :P2111300151_NEW_PASSWORD),',
'                appluser_pw_lud      = TRUNC(SYSDATE),',
'                appluser_pwd_exp_due = v_pwd_exp_date,',
'                appluser_upd_by      = :GLOBAL_user,',
'                appluser_upd_date    = SYSDATE',
'          WHERE appluser_bu = :GLOBAL_bu',
'            AND appluser_id = :P2111300151_APPLUSER_ID',
'            AND appluser_emp_id = :P2111300151_APPLUSER_EMP_ID;',
'',
'			  PROC_COMMIT;',
'			  ',
'         apex_application.g_print_success_message := ''Password Updated successully.'';	 ',
'',
'	 END;',
'END IF;',
'',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7116856268331665859)
,p_internal_uid=>1634898368619054843
);
wwv_flow_imp.component_end;
end;
/
