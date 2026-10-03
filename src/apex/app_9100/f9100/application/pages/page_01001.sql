prompt --application/pages/page_01001
begin
--   Manifest
--     PAGE: 01001
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
 p_id=>1001
,p_name=>'Directory'
,p_alias=>'DIRECTORY'
,p_step_title=>'Directory'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Region-headerItems--title {',
'    padding: 4px;',
'    font-size: 15px;',
'}',
'',
'.t-Card-title {',
'    color: #2193b0;',
'    font-size: 13px;',
'    font-weight: 800;',
'}',
'',
'',
'.t-Region--accent13 > .t-Region-header {',
'    background: linear-gradient(to bottom, #745293 0%, #734b6d 100%);',
'    color: #ffffff;',
'}',
'.t-Cards--compact.t-Cards--displaySubtitle .t-Card-subtitle {',
'    display: block;',
'    font-size: 13px;',
'    margin: 4px 0 0;',
'    line-height: 12px;',
'    font-weight: 500;',
'}',
'.t-Cards--compact .t-Card-title {',
'    font-size: 13px;',
'    line-height: 1.6rem;',
'    margin: 0;',
'    font-weight: 800;',
'    verflow: hidden;',
'    text-overflow: ellipsis;',
'}',
'.apex-icons-fontapex .fa {',
'    font-family: inherit!important;',
'    position: relative;',
'    url(#APP_IMAGES#icon.jpg);',
'}'))
,p_step_template=>wwv_flow_imp.id(6339300137962061229)
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'Y'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6188291370130989059)
,p_name=>'Cards View'
,p_static_id=>'cards-view'
,p_parent_plug_id=>wwv_flow_imp.id(6188291294533989058)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--textContent:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--compact:t-Cards--displayIcons:t-Cards--3cols:t-Cards--hideBody:t-Cards--animRaiseCard'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  ''<div> '' ||Initcap(emp_first_name1) ||'' - ''||(emp_emp_id)||''</div> <br/>''',
'     --  ''</div> ||',
'      --  ''<div> '' ||emp_emp_id|| ''</div> <br/>''',
'        CARD_TITLE,',
'	   CASE WHEN empai_pos_id IS NOT NULL THEN',
'	   ''<div> <span style="font-weight:700;font-size:13px;color:#7d3492; padding-right:68px;"> Position  </span>'' ||',
'       (SELECT Initcap(hrpos_pos_name1)',
'          FROM hr_positions',
'         WHERE hrpos_bu = :Global_bu AND hrpos_pos_id = empai_pos_id) ||''</div> <br/>''',
'        end ||',
'	   CASE WHEN empai_dept_id IS NOT NULL THEN	',
'	   ''<div> <span style="font-weight:700;font-size:13px;color:#7d3492; padding-right:44px;"> Department  </span>'' ||',
'       (SELECT Initcap(dept_name1)',
'          FROM departments',
'         WHERE dept_bu = :Global_bu AND dept_id = empai_dept_id) ||''</div> <br/>''',
'        end ||',
'	   ''<div> <span style="font-weight:700;font-size:13px;color:#7d3492; padding-right:9px;"> Business Mob.No.  </span>'' ||	',
'       emp_off_mobile_no||''</div> <br/>''||',
'	   ''<div> <span style="font-weight:700;font-size:13px;color:#7d3492; padding-right:12px;"> Business Email Id  </span>'' ||',
'       emp_off_email_id ||''</div> <br/>''',
'       CARD_SUBTITLE,',
'      /* (NVL((DECODE(NVL(dbms_lob.getlength(EMPIMG_IMAGE),0),0,null,',
'                ''<img alt="''||apex_escape.html_attribute(EMPIMG_BU)||''',
'                          "style="border: 0px; border-radius: "20px!important""',
'                 ''||'' src = "''||apex_util.get_blob_file_src(''P495_EMPIMG_IMAGE'', employee_images.rowid)||''" height = "45px!important" width = "50px!important" />'')   ',
'          ), ( case when  EMP_GENDER=''F'' THEN  ''<img src=''''#APP_IMAGES#user.png''''>''',
'                          ELSE  ''<img src=''''#APP_IMAGES#user.png''''>'' END ',
'                )))''<div  img src=#APP_IMAGES#directory.jfif alt="Img" class="card" style="width: 18rem;></div>''CARD_ICON*/',
'        ''fa fa-address-card-o'' CARD_ICON',
'  FROM employees, ',
'       emp_active_infos,employee_images',
' WHERE emp_bu              = empai_bu',
'   AND emp_emp_id          = empai_emp_id',
'   and empimg_bu(+)        = emp_bu',
'   and empimg_emp_id(+)    = emp_emp_id',
'  -- AND emp_emp_id          = :global_emp_id',
'   AND emp_bu              = :global_bu',
'   AND emp_include_payroll = ''Y''',
'ORDER BY emp_emp_id ASC',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>9
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6186020909309899075)
,p_query_column_id=>3
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>30
,p_column_heading=>'Card Icon'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6186020466690899071)
,p_query_column_id=>2
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>10
,p_column_heading=>'Card Subtitle'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6186020547009899072)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Title'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6954197140361969013)
,p_plug_name=>'Directory'
,p_static_id=>'directory'
,p_icon_css_classes=>'fa-office-phone'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--showIcon:t-Region--accent13:t-Region--stacked:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P1001_TYPE =''D'''
,p_plug_display_when_cond2=>'SQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6710260108203812233)
,p_plug_name=>'My Careers'
,p_static_id=>'my-careers'
,p_icon_css_classes=>'fa-suitcase'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--showIcon:t-Region--accent11:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'1=2'
,p_plug_display_when_cond2=>'SQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6710260310790812235)
,p_plug_name=>'My Careers'
,p_static_id=>'my-careers-2'
,p_parent_plug_id=>wwv_flow_imp.id(6710260108203812233)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ephd_new_basic_eff_from,',
'             ephd_new_dept_name,',
'             (SELECT pact_action_desc1 ',
'          FROM profile_actions ',
'         WHERE pact_bu = ephd_bu ',
'           AND pact_action_id = ephd_action_id)Action,',
'             ephd_new_job_title,',
'             ephd_new_pos_name,',
'             (SELECT NVL(grade_desc1,grade_desc2)',
'               FROM grades',
'             WHERE grade_bu = ephd_bu',
'                  AND grade_grade_id = ephd_new_grade_id)grade_desc1,',
'             ephd_new_basic_sal,',
'             ephd_doc_no',
'   FROM emp_profiles_hd',
' WHERE ephd_bu = :global_bu',
'     AND ephd_emp_id = :global_emp_id',
'     AND ephd_status = ''A''',
' ORDER BY ephd_new_basic_eff_from DESC;'))
,p_plug_source_type=>'NATIVE_IR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6710260439915812236)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'0'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>566418410509290975
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335855237720721551)
,p_db_column_name=>'ACTION'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Action'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335857251057721556)
,p_db_column_name=>'EPHD_DOC_NO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Ephd Doc No'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335854438669721550)
,p_db_column_name=>'EPHD_NEW_BASIC_EFF_FROM'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335856921670721554)
,p_db_column_name=>'EPHD_NEW_BASIC_SAL'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Ephd New Basic Sal'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335854845881721550)
,p_db_column_name=>'EPHD_NEW_DEPT_NAME'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335855665703721551)
,p_db_column_name=>'EPHD_NEW_JOB_TITLE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Ephd New Job Title'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335856077004721553)
,p_db_column_name=>'EPHD_NEW_POS_NAME'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Position'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335856509857721553)
,p_db_column_name=>'GRADE_DESC1'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Grade'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6711884259416795189)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'227120'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EPHD_NEW_BASIC_EFF_FROM:ACTION:EPHD_NEW_DEPT_NAME:EPHD_NEW_POS_NAME:GRADE_DESC1'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6710259833517812230)
,p_plug_name=>'Parameter'
,p_static_id=>'parameter'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6954197248445969014)
,p_plug_name=>'Report View'
,p_static_id=>'report-view'
,p_parent_plug_id=>wwv_flow_imp.id(6188291294533989058)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT emp_bu,',
'       emp_emp_id,',
'       emp_first_name1,',
'       func_find_position_desc(empai_bu, empai_pos_id, 1) Position,',
'       func_find_dept_desc (empai_bu, empai_dept_id, 1) dept_desc,',
'       emp_off_mobile_no,',
'       emp_mobile_no,',
'       emp_extension_no,',
'       emp_bulding_no,',
'       emp_room_no,',
'       emp_off_email_id,',
'       emp_off_email_id_2,',
'       emp_email_id',
'  FROM employees, ',
'       emp_active_infos',
' WHERE emp_bu = empai_bu',
'   AND emp_emp_id = empai_emp_id',
'   --and emp_emp_id = :global_emp_id',
'  AND emp_bu = :global_bu',
'  AND EMP_INCLUDE_PAYROLL = ''Y''',
'  order by emp_emp_id asc',
'  -- AND emp_extension_no IS NOT NULL',
' --  AND empai_dept_id IS NOT NULL',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'NEVER'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6954197411490969016)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'0'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'N'
,p_internal_uid=>810355382084447755
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335862475835721579)
,p_db_column_name=>'DEPT_DESC'
,p_display_order=>50
,p_column_identifier=>'V'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335860916512721576)
,p_db_column_name=>'EMP_BU'
,p_display_order=>10
,p_column_identifier=>'R'
,p_column_label=>'Emp Bu'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335863304143721582)
,p_db_column_name=>'EMP_BULDING_NO'
,p_display_order=>80
,p_column_identifier=>'X'
,p_column_label=>'Bulding No.'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335860458837721575)
,p_db_column_name=>'EMP_EMAIL_ID'
,p_display_order=>130
,p_column_identifier=>'AD'
,p_column_label=>'Email Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335861285744721578)
,p_db_column_name=>'EMP_EMP_ID'
,p_display_order=>20
,p_column_identifier=>'S'
,p_column_label=>'Emp Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335864055035721584)
,p_db_column_name=>'EMP_EXTENSION_NO'
,p_display_order=>60
,p_column_identifier=>'Z'
,p_column_label=>'Extension No.'
,p_column_html_expression=>'<div style="width: 100px; word-wrap: break-word;">#EMP_EXTENSION_NO#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335861686598721578)
,p_db_column_name=>'EMP_FIRST_NAME1'
,p_display_order=>30
,p_column_identifier=>'T'
,p_column_label=>'Name'
,p_column_html_expression=>'<div style="width: 125px; word-wrap: break-word;">#EMP_FIRST_NAME1#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335859248970721562)
,p_db_column_name=>'EMP_MOBILE_NO'
,p_display_order=>100
,p_column_identifier=>'AA'
,p_column_label=>'Mob. No.'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335859707804721573)
,p_db_column_name=>'EMP_OFF_EMAIL_ID'
,p_display_order=>110
,p_column_identifier=>'AB'
,p_column_label=>'Business Email Id'
,p_column_html_expression=>'<div style="width: 100px; word-wrap: break-word;">#EMP_OFF_EMAIL_ID#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335860097851721575)
,p_db_column_name=>'EMP_OFF_EMAIL_ID_2'
,p_display_order=>120
,p_column_identifier=>'AC'
,p_column_label=>' Office Email Id 2'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335862860584721581)
,p_db_column_name=>'EMP_OFF_MOBILE_NO'
,p_display_order=>70
,p_column_identifier=>'W'
,p_column_label=>'Business Mobile No.'
,p_column_html_expression=>'<div style="width: 100px; word-wrap: break-word;">#EMP_OFF_MOBILE_NO#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335863663349721582)
,p_db_column_name=>'EMP_ROOM_NO'
,p_display_order=>90
,p_column_identifier=>'Y'
,p_column_label=>'Room No.'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6335862077309721578)
,p_db_column_name=>'POSITION'
,p_display_order=>40
,p_column_identifier=>'U'
,p_column_label=>'Position'
,p_column_html_expression=>'<div style="width: 150px; word-wrap: break-word;">#POSITION#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6954207516024980413)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'227190'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'EMP_FIRST_NAME1:POSITION:DEPT_DESC:EMP_MOBILE_NO:EMP_EMAIL_ID:EMP_EXTENSION_NO:EMP_OFF_MOBILE_NO:EMP_OFF_EMAIL_ID:EMP_OFF_EMAIL_ID_2'
,p_sort_column_1=>'TYPE_DESC'
,p_sort_direction_1=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6188291294533989058)
,p_plug_name=>'Tabs'
,p_static_id=>'tabs'
,p_parent_plug_id=>wwv_flow_imp.id(6954197140361969013)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:margin-top-sm'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6335853794136721545)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6710260108203812233)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Back'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6335858195455721559)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6954197140361969013)
,p_button_name=>'back'
,p_static_id=>'back-2'
,p_button_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(10650579119284505432)
,p_button_image_alt=>'Back'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6335858611168721561)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6954197140361969013)
,p_button_name=>'New'
,p_static_id=>'new'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--simple:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Directory'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:RP::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-plus-circle'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6335853037830721543)
,p_name=>'P1001_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6710259833517812230)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
