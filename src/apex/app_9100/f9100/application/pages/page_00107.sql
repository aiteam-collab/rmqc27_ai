prompt --application/pages/page_00107
begin
--   Manifest
--     PAGE: 00107
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
 p_id=>107
,p_name=>'Jasper Error MSG'
,p_alias=>'JASPER-ERROR-MSG'
,p_page_mode=>'MODAL'
,p_step_title=>'Jasper Error MSG'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650485080006505315)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15617537599294708482)
,p_plug_name=>'Jasper Error Msg'
,p_static_id=>'jasper-error-msg'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT log_entry ',
'  FROM jasper_log',
' WHERE log_id     = :P107_LOG_ID',
'   AND log_rpt_id = :P107_LOG_RTP_ID'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P107_LOG_ID'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(15617537767643708483)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_actions_menu=>'N'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_enable_mail_download=>'Y'
,p_internal_uid=>10135575932100097455
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15617537993354708486)
,p_db_column_name=>'LOG_ENTRY'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Log Entry'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_display_text_as=>'RICH_TEXT'
,p_heading_alignment=>'LEFT'
,p_rich_text_format=>'MARKDOWN'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(15624614984762449126)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'24990272'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LOG_ENTRY'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15617540517508708602)
,p_name=>'P107_LOG_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(15617537599294708482)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15617541131159708608)
,p_name=>'P107_LOG_RTP_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(15617537599294708482)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
