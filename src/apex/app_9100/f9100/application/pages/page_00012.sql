prompt --application/pages/page_00012
begin
--   Manifest
--     PAGE: 00012
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
 p_id=>12
,p_name=>'Apex Session'
,p_alias=>'SESSION-SARANYA'
,p_step_title=>'Apex Session'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6175075117536020462)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>8
,p_plug_display_column=>3
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ASL_ID,',
'       ASL_CREATED_ON,',
'       ASL_MAX_IDLE_SEC,',
'       ASL_IDLE_TIMEOUT_ON,',
'       ASL_LIFE_TIMEOUT_ON,',
'       ASL_REMOTE_ADDR,',
'       ASL_USERNAME,',
'       ASL_BU',
'  from APEX_SESSION_LIST',
'  where ASL_USERNAME <> ''nobody''',
'  order by ASL_CREATED_ON desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'New'
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
 p_id=>wwv_flow_imp.id(6175075199271020463)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>31233169864499202
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6175075938548020471)
,p_db_column_name=>'ASL_BU'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Updated by'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6175075357992020465)
,p_db_column_name=>'ASL_CREATED_ON'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Created On'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6175075284740020464)
,p_db_column_name=>'ASL_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Session'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6175075573630020467)
,p_db_column_name=>'ASL_IDLE_TIMEOUT_ON'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Idle Timeout On'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6175075707893020468)
,p_db_column_name=>'ASL_LIFE_TIMEOUT_ON'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Life Timeout On'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6175075491684020466)
,p_db_column_name=>'ASL_MAX_IDLE_SEC'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Max Idle Sec.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6175075749246020469)
,p_db_column_name=>'ASL_REMOTE_ADDR'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'IP Address'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6175075850221020470)
,p_db_column_name=>'ASL_USERNAME'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Username'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6175083376035028473)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'312414'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'ASL_ID:ASL_CREATED_ON:ASL_REMOTE_ADDR:ASL_USERNAME'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6175076054807020472)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Formatted on 9/20/2021 4:50:48 PM (QP5 v5.163.1008.3004) */',
'DECLARE',
'   CURSOR C1',
'   IS',
'      SELECT * FROM APEX_210100.WWV_FLOW_SESSIONS$;',
'',
'   CURSOR C2 (C_ID NUMBER)',
'   IS',
'      SELECT *',
'        FROM APEX_SESSION_LIST',
'       WHERE ASL_ID = C_ID;',
'',
'   CR1   C1%ROWTYPE;',
'   CR2   C2%ROWTYPE;',
'BEGIN',
'  FOR cr1 IN c1',
'LOOP',
'',
'',
'      OPEN C2 (CR1.ID);',
'',
'      FETCH C2 INTO CR2;',
'',
'      IF C2%NOTFOUND',
'      THEN',
'         INSERT INTO APEX_SESSION_LIST (ASL_ID,',
'                                        ASL_CREATED_ON,',
'                                        ASL_MAX_IDLE_SEC,',
'                                        ASL_IDLE_TIMEOUT_ON,',
'                                        ASL_LIFE_TIMEOUT_ON,',
'                                        ASL_REMOTE_ADDR,',
'                                        ASL_USERNAME,',
'                                        ASL_BU)',
'              VALUES (CR1.ID,',
'                      CR1.CREATED_ON,',
'                      CR1.MAX_IDLE_SEC,',
'                      CR1.IDLE_TIMEOUT_ON,',
'                      CR1.LIFE_TIMEOUT_ON,',
'                      CR1.REMOTE_ADDR,',
'                      CR1.USERNAME,',
'                      :global_BU);',
'',
'         COMMIT;',
'      END IF;',
'',
'      CLOSE C2;',
'   ',
'',
'   End loop;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>693114219263409444
);
wwv_flow_imp.component_end;
end;
/
