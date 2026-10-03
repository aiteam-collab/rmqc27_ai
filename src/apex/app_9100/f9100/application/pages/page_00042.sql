prompt --application/pages/page_00042
begin
--   Manifest
--     PAGE: 00042
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
 p_id=>42
,p_name=>'Events'
,p_alias=>'EVENTS2'
,p_page_mode=>'MODAL'
,p_step_title=>'Events'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-CardView-media--cover .a-CardView-mediaImg {',
'    object-fit: contain;',
'    height: 200px;',
'    width: 200px;',
'}'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6193614938586990458)
,p_plug_name=>'Birthday'
,p_static_id=>'birthday'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490475667505325)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT EMP_EMP_ID,',
'    emp_first_name1 card_title,',
'	(select EMPIMG_IMAGE from Employee_images where EMPIMG_BU = EMP_BU',
'    AND EMPIMG_EMP_ID = EMP_EMP_ID)  card_image,',
'(',
'        SELECT',
'            dept_name1',
'        FROM',
'            departments',
'        WHERE',
'                dept_bu = :global_bu',
'            AND dept_id = (',
'                SELECT',
'                    empai_dept_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) ||''-''||',
'    (',
'        SELECT',
'            hrpos_pos_name1',
'        FROM',
'            hr_positions',
'        WHERE',
'                hrpos_bu = :global_bu',
'            AND hrpos_pos_id = (',
'                SELECT',
'                    empai_pos_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) card_badge',
'FROM',
'    employees',
'WHERE',
'        emp_bu = :global_bu',
'    AND to_char(trunc(emp_dob), ''MMDD'') = to_char(trunc(to_date(sysdate)), ''MMDD'')',
'ORDER BY',
'    to_char(emp_dob, ''DDMM'') ASC'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P42_TYPE'
,p_plug_display_when_cond2=>'BD'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(6193615519941990463)
,p_region_id=>wwv_flow_imp.id(6193614938586990458)
,p_layout_type=>'GRID'
,p_grid_column_count=>3
,p_title_adv_formatting=>false
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>true
,p_body_html_expr=>'<center><h2>&CARD_TITLE.</h2></center>'
,p_second_body_adv_formatting=>true
,p_second_body_html_expr=>'<center><h5>&CARD_BADGE.<h5></center>'
,p_media_adv_formatting=>false
,p_media_source_type=>'BLOB'
,p_media_blob_column_name=>'CARD_IMAGE'
,p_media_display_position=>'FIRST'
,p_media_sizing=>'COVER'
,p_pk1_column_name=>'EMP_EMP_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6193615990076990468)
,p_plug_name=>'New'
,p_static_id=>'new'
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
 p_id=>wwv_flow_imp.id(6193615597749990464)
,p_plug_name=>'Wedding Anniversary'
,p_static_id=>'wedding-anniversary'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490475667505325)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT EMP_EMP_ID,',
'    emp_first_name1 card_title,',
'	(select EMPIMG_IMAGE from Employee_images where EMPIMG_BU = EMP_BU',
'    AND EMPIMG_EMP_ID = EMP_EMP_ID)  card_image,',
'(',
'        SELECT',
'            dept_name1',
'        FROM',
'            departments',
'        WHERE',
'                dept_bu = :global_bu',
'            AND dept_id = (',
'                SELECT',
'                    empai_dept_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) ||''-''||',
'    (',
'        SELECT',
'            hrpos_pos_name1',
'        FROM',
'            hr_positions',
'        WHERE',
'                hrpos_bu = :global_bu',
'            AND hrpos_pos_id = (',
'                SELECT',
'                    empai_pos_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) card_badge',
'FROM',
'    employees',
'WHERE',
'        emp_bu = :global_bu',
'AND to_char(trunc(emp_dom), ''MMDD'') = to_char(trunc(to_date(sysdate)), ''MMDD'')',
'ORDER BY',
'    to_char(emp_dom, ''DDMM'') ASC'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P42_TYPE'
,p_plug_display_when_cond2=>'WA'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(6193615634324990465)
,p_region_id=>wwv_flow_imp.id(6193615597749990464)
,p_layout_type=>'GRID'
,p_grid_column_count=>3
,p_title_adv_formatting=>false
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>true
,p_body_html_expr=>'<center><h2>&CARD_TITLE.</h2></center>'
,p_second_body_adv_formatting=>true
,p_second_body_html_expr=>'<center><h5>&CARD_BADGE.<h5></center>'
,p_media_adv_formatting=>false
,p_media_source_type=>'BLOB'
,p_media_blob_column_name=>'CARD_IMAGE'
,p_media_display_position=>'FIRST'
,p_media_sizing=>'COVER'
,p_pk1_column_name=>'EMP_EMP_ID'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6193615756421990466)
,p_plug_name=>'Work Anniversary'
,p_static_id=>'work-anniversary'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490475667505325)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT EMP_EMP_ID,',
'    emp_first_name1 card_title,',
'	 (',
'                SELECT',
'                    empimg_image',
'                FROM',
'                    employee_images',
'                WHERE',
'                        empimg_bu = emp_bu',
'                    AND empimg_emp_id = emp_emp_id',
'            ) card_image,',
'(',
'        SELECT',
'            dept_name1',
'        FROM',
'            departments',
'        WHERE',
'                dept_bu = :global_bu',
'            AND dept_id = (',
'                SELECT',
'                    empai_dept_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) ||''-''||',
'    (',
'        SELECT',
'            hrpos_pos_name1',
'        FROM',
'            hr_positions',
'        WHERE',
'                hrpos_bu = :global_bu',
'            AND hrpos_pos_id = (',
'                SELECT',
'                    empai_pos_id',
'                FROM',
'                    emp_active_infos',
'                WHERE',
'                        empai_bu = :global_bu',
'                    AND empai_emp_id = EMP_EMP_ID',
'            )',
'    ) card_badge',
'FROM',
'    employees',
'WHERE',
'        emp_bu = :global_bu',
'  AND trunc((sysdate - emp_start_date) / 365) > 0',
'    AND to_char(emp_start_date, ''MMDD'') = to_char(sysdate, ''MMDD'')'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P42_TYPE'
,p_plug_display_when_cond2=>'WAN'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(6193615932152990467)
,p_region_id=>wwv_flow_imp.id(6193615756421990466)
,p_layout_type=>'GRID'
,p_grid_column_count=>3
,p_title_adv_formatting=>false
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>true
,p_body_html_expr=>'<center><h2>&CARD_TITLE.</h2></center>'
,p_second_body_adv_formatting=>true
,p_second_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center><h5>&CARD_BADGE.<h5></center>',
''))
,p_media_adv_formatting=>false
,p_media_source_type=>'BLOB'
,p_media_blob_column_name=>'CARD_IMAGE'
,p_media_display_position=>'FIRST'
,p_media_sizing=>'COVER'
,p_pk1_column_name=>'EMP_EMP_ID'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6193616087457990469)
,p_name=>'P42_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6193615990076990468)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
