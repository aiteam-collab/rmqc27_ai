prompt --application/pages/page_1415132010
begin
--   Manifest
--     PAGE: 1415132010
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
 p_id=>1415132010
,p_name=>'Notification Management'
,p_alias=>'NOTIFICATION-MANAGEMENT'
,p_step_title=>'Notification Management'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-CardView-header{',
'	background-color: rgb(248, 217, 132);',
'}',
''))
,p_step_template=>wwv_flow_imp.id(5950304360493412392)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6029296355111998554)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_imp.id(10650524481825505371)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CUN_NOTFN_MOD,',
'       CUN_NOTFN_ID,',
'       CUN_NOTFN_DESC,',
'       CUN_USER_ID,',
'       CUN_LN_NO,',
'       CUN_REC_CNT,',
'       CUN_PRIORITY,',
'       CUN_USER_ROLE,',
'       CUN_NOTIFY_DAYS,',
'       CUN_MOD_SEQ_NO,',
'       CUN_SEQ_NO,',
'       CUN_EXCEL_SEQ_NO,',
'       CUN_CRE_BY,',
'       CUN_CRE_DATE',
'  from NOTIFICATION_ALERT',
'--WHERE CUN_USER_ID = :GLOBAL_USER'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows=>8
,p_plug_query_num_rows_type=>'SET'
,p_show_total_row_count=>true
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(6029296526547998555)
,p_region_id=>wwv_flow_imp.id(6029296355111998554)
,p_layout_type=>'GRID'
,p_grid_column_count=>4
,p_title_adv_formatting=>true
,p_title_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<b class="title"> &CUN_NOTFN_MOD.</b>',
'',
''))
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'CUN_NOTFN_ID'
,p_body_adv_formatting=>false
,p_body_column_name=>'CUN_NOTFN_DESC'
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'CUN_REC_CNT'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6029297539439998566)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6029296355111998554)
,p_button_name=>'Refresh'
,p_static_id=>'refresh'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Refresh'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6029297666238998567)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6029297539439998566)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6029297804696998568)
,p_event_id=>wwv_flow_imp.id(6029297666238998567)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6029296355111998554)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
