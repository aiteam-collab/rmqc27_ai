prompt --application/pages/page_1113009502
begin
--   Manifest
--     PAGE: 1113009502
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
 p_id=>1113009502
,p_name=>'Load User'
,p_alias=>'LOAD-USER'
,p_page_mode=>'MODAL'
,p_step_title=>'Load User'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7575425395266078584)
,p_plug_name=>'Load User'
,p_static_id=>'load-user'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650515782604505361)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       WUBFT_USER_ID,',
'       WUBFT_BUS_FUN_ID,',
'       (SELECT wbf_bus_fun_name',
'       FROM wapl_bus_fun',
'       WHERE wbf_bus_fun_id  = WUBFT_BUS_FUN_ID)bus_fun_desc, ',
'		 (SELECT wbf_vert_bus_fun_name',
'		 FROM wapl_bus_fun',
'       WHERE wbf_bus_fun_id  = WUBFT_BUS_FUN_ID)vert_bus_fun_name,',
'       (SELECT wbf_node_type',
'		 FROM wapl_bus_fun',
'       WHERE wbf_bus_fun_id  = WUBFT_BUS_FUN_ID)node_type, 	 ',
'       WUBFT_SEL_FLAG,',
'       WUBFT_CRE_BY,',
'       WUBFT_CRE_IP_ADDR,',
'       WUBFT_CRE_OS_USER,',
'       WUBFT_CRE_EMP_ID,',
'       WUBFT_CRE_DATE,',
'       WUBFT_UPD_BY,',
'       WUBFT_UPD_IP_ADDR,',
'       WUBFT_UPD_OS_USER,',
'       WUBFT_UPD_EMP_ID,',
'       WUBFT_UPD_DATE',
'  from WAPL_USER_BUS_FUN_TEMP',
'',
'',
'  		 ',
'  '))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Load User'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(7575425526549078584)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>2093463691005467556
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7575586557748081746)
,p_db_column_name=>'BUS_FUN_DESC'
,p_display_order=>12
,p_column_identifier=>'O'
,p_column_label=>'Description(Display)'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7575586830002081748)
,p_db_column_name=>'NODE_TYPE'
,p_display_order=>32
,p_column_identifier=>'Q'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7575584914987081729)
,p_db_column_name=>'ROWID'
,p_display_order=>152
,p_column_identifier=>'N'
,p_column_label=>'Rowid'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7575586646452081747)
,p_db_column_name=>'VERT_BUS_FUN_NAME'
,p_display_order=>22
,p_column_identifier=>'P'
,p_column_label=>'Vertical  Description'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7575426264197078588)
,p_db_column_name=>'WUBFT_BUS_FUN_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>' Bus. Fun '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7575427062224078590)
,p_db_column_name=>'WUBFT_CRE_BY'
,p_display_order=>52
,p_column_identifier=>'D'
,p_column_label=>'Wubft Cre By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7575428716842078593)
,p_db_column_name=>'WUBFT_CRE_DATE'
,p_display_order=>92
,p_column_identifier=>'H'
,p_column_label=>'Wubft Cre Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7575428275212078593)
,p_db_column_name=>'WUBFT_CRE_EMP_ID'
,p_display_order=>82
,p_column_identifier=>'G'
,p_column_label=>'Wubft Cre Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7575427485337078590)
,p_db_column_name=>'WUBFT_CRE_IP_ADDR'
,p_display_order=>62
,p_column_identifier=>'E'
,p_column_label=>'Wubft Cre Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7575427856679078592)
,p_db_column_name=>'WUBFT_CRE_OS_USER'
,p_display_order=>72
,p_column_identifier=>'F'
,p_column_label=>'Wubft Cre Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7575426642618078588)
,p_db_column_name=>'WUBFT_SEL_FLAG'
,p_display_order=>42
,p_column_identifier=>'C'
,p_column_label=>'Wubft Sel Flag'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7575428957994078595)
,p_db_column_name=>'WUBFT_UPD_BY'
,p_display_order=>102
,p_column_identifier=>'I'
,p_column_label=>'Wubft Upd By'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7575430599104078596)
,p_db_column_name=>'WUBFT_UPD_DATE'
,p_display_order=>142
,p_column_identifier=>'M'
,p_column_label=>'Wubft Upd Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7575430167726078595)
,p_db_column_name=>'WUBFT_UPD_EMP_ID'
,p_display_order=>132
,p_column_identifier=>'L'
,p_column_label=>'Wubft Upd Emp Id'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7575429369892078595)
,p_db_column_name=>'WUBFT_UPD_IP_ADDR'
,p_display_order=>112
,p_column_identifier=>'J'
,p_column_label=>'Wubft Upd Ip Addr'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7575429779320078595)
,p_db_column_name=>'WUBFT_UPD_OS_USER'
,p_display_order=>122
,p_column_identifier=>'K'
,p_column_label=>'Wubft Upd Os User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7575425881019078588)
,p_db_column_name=>'WUBFT_USER_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Wubft User Id'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7575583323835080456)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'20936215'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'WUBFT_BUS_FUN_ID:BUS_FUN_DESC:VERT_BUS_FUN_NAME:NODE_TYPE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7575584976206081730)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7575585963022081740)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(7575584976206081730)
,p_button_name=>'Load'
,p_static_id=>'load'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Load'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7575586214343081742)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(7575584976206081730)
,p_button_name=>'OK'
,p_static_id=>'ok'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--link'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ok'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7575585499658081735)
,p_name=>'P1113009502_BL_CHK_ANALYTICS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(7575584976206081730)
,p_prompt=>'Analytics'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7575585339514081734)
,p_name=>'P1113009502_BL_CHK_FORM'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(7575584976206081730)
,p_prompt=>'Transactions'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7575585590949081736)
,p_name=>'P1113009502_BL_CHK_REPORT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(7575584976206081730)
,p_prompt=>'Report'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7575585249513081733)
,p_name=>'P1113009502_BL_CHK_SETUP'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(7575584976206081730)
,p_prompt=>'Setup'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7575585046666081731)
,p_name=>'P1113009502_BL_FROM_VERT_DESC'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7575584976206081730)
,p_prompt=>'Description'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(7575585233153081732)
,p_name=>'P1113009502_BL_FROM_VERT_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7575584976206081730)
,p_prompt=>'Vertical'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOV_VERTICAL_USER'
,p_cSize=>30
,p_colspan=>2
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7575585676005081737)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P1113009502_BL_FROM_VERT_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7575585775457081738)
,p_event_id=>wwv_flow_imp.id(7575585676005081737)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P1113009502_BL_FROM_VERT_DESC',
  'items_to_submit', 'P1113009502_BL_FROM_VERT_ID',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P1113009502_BL_FROM_VERT_ID  IS NOT NULL THEN',
    '	 ',
    '	 DECLARE',
    '	 	',
    '	 	  CURSOR c1',
    '	 	      IS',
    '	 	  SELECT ev_vertical_desc',
    '	 	    FROM erp_vertical',
    '	 	   WHERE ev_vertical_id = :P1113009502_BL_FROM_VERT_ID;',
    '	    ',
    '	    cr1											c1%ROWTYPE;',
    '	       ',
    '	 BEGIN',
    '	 	',
    '	 	  OPEN c1;',
    '	 	  FETCH c1 INTO cr1;',
    '	 	  ',
    '	 	     IF c1%NOTFOUND THEN',
    '	 	     	  RAISE_APPLICATION_ERROR(-20999,''Vertical not found.'');',
    '	 	     ELSE',
    '	 	     	  :P1113009502_BL_FROM_VERT_DESC := cr1.ev_vertical_desc;',
    '	 	     END IF;',
    '	 	     ',
    '	 	  CLOSE c1;',
    '	 	  ',
    '	 END;',
    '	 ',
    'END IF;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7575585884577081739)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load'
,p_static_id=>'load'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P1113009502_BL_FROM_VERT_ID  IS NOT NULL THEN',
'	',
'	 DECLARE',
'	 	',
'	 	  CURSOR c1',
'	 	      IS',
'	 	  SELECT *',
'	 	    FROM wapl_vert_bus_fun_asso,',
'	 	         wapl_bus_fun',
'	 	   WHERE wvbfa_vertical_id = :P1113009502_BL_FROM_VERT_ID ',
'	 	     AND wvbfa_bus_fun_id  = wbf_bus_fun_id',
'	 	     AND (wbf_node_type = ''SET'' AND :P1113009502_BL_CHK_SETUP = ''Y'' OR',
'	 	     			wbf_node_type = ''FRM'' AND :P1113009502_BL_CHK_FORM = ''Y'' OR',
'	 	     			wbf_node_type = ''RPT'' AND :P1113009502_BL_CHK_ANALYTICS = ''Y'' OR',
'	 	     			wbf_node_type = ''REP'' AND :P1113009502_BL_CHK_REPORT = ''Y'');',
'	 	     			',
'			cr1												c1%ROWTYPE;',
'			',
'			v_res											VARCHAR2(1) := ''N'';',
'	 	   ',
'	 BEGIN',
'	 	  ',
'	 	  DELETE wapl_user_bus_fun_temp;',
'	 	  	   ',
'	 	--   alert_msg(:BLK_LOAD_USER.BL_FROM_VERTICAL_ID||''~''||:BLK_LOAD_USER.BL_CHK_SETUP,''N'');',
'	 	  	   ',
' 	  	FOR cr1 IN c1',
' 	  	LOOP',
' 	  	 	',
' 	  	   INSERT INTO wapl_user_bus_fun_temp(wubft_user_id	 			 ,',
'																	          wubft_bus_fun_id		 ,',
'																	          wubft_sel_flag			 ,',
'																	          wubft_cre_by				 ,',
'																	          wubft_cre_ip_addr	 	 ,',
'																	          wubft_cre_os_user	 	 ,',
'																	          wubft_cre_emp_id		 ,',
'																	          wubft_cre_date			 )',
'																	   VALUES(:WUBFT_USER_ID,',
'																	 				  cr1.wvbfa_bus_fun_id ,',
'																	 				  ''Y''								 	 ,',
'																	 				  :GLOBAL_USER		 	 ,',
'																	 				  :GLOBAL_USER	 ,',
'																	 				  :GLOBAL_user		 	 ,',
'																	 				  :GLOBAL_EMP_ID	 	 ,',
'																	 				  SYSDATE						 	 );',
' 	  	 	  ',
' 	  	 	 v_res := ''Y'';',
' 	  	 	  ',
' 	  	END LOOP c1;',
'',
'	 	  COMMIT;',
'	 	  ',
'	 	  IF v_res = ''Y'' THEN',
'	 	  	 RAISE_APPLICATION_ERROR(-20999,''Loaded Successfully.'');',
'	 	  ELSE',
'	 	  	 RAISE_APPLICATION_ERROR(-20999,''Not Loaded.'');',
'	 	  END IF;',
'	 	  ',
'	 END;',
'	 ',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7575585963022081740)
,p_internal_uid=>2093624049033470711
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(7575586091366081741)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'OK'
,p_static_id=>'ok'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	',
'	 CURSOR c1',
'	     IS',
'	 SELECT COUNT(*) v_cnt',
'	   FROM wapl_user_bus_fun_temp',
'	  WHERE wubft_sel_flag = ''Y'';',
'	   ',
'	 cr1														c1%ROWTYPE;',
'	 ',
'	 CURSOR c2',
'	     IS',
'	 SELECT *',
'	   FROM wapl_user_bus_fun_temp',
'	  WHERE wubft_sel_flag = ''Y'';',
'	   ',
'	 CURSOR c3(c_bus_fun_id					VARCHAR2)',
'	     IS',
'	 SELECT *',
'	   FROM wapl_user_bus_fun_accs',
'	  WHERE wubfa_user_id = :WUBFT_USER_ID',
'	    AND wubfa_bus_fun_id  = c_bus_fun_id;',
'	    ',
'	 cr3														c3%ROWTYPE;',
'   ',
'   v_seq_no												NUMBER(5);',
'	   ',
'BEGIN',
'	',
'	 OPEN c1;',
'	 FETCH c1 INTO cr1;',
'	 ',
'	    IF cr1.v_cnt = 0 THEN',
'	    	 RAISE_APPLICATION_ERROR(-20999,''Line details not found.'');',
'	    END IF;',
'	    ',
'	 CLOSE c1;',
'	 ',
'	 FOR cr2 IN c2',
'	 LOOP',
'	 	  ',
'	 	  OPEN c3(cr2.wubft_bus_fun_id);',
'	 	  FETCH c3 INTO cr3;',
'	 	  ',
'	 	     IF c3%NOTFOUND THEN',
'	 	     	  ',
'	 	     	  INSERT INTO wapl_user_bus_fun_accs(wubfa_user_id							,',
'																				       wubfa_bus_fun_id						,',
'																				       wubfa_date_from						,',
'																				       wubfa_date_to							,',
'																				       wubfa_cre_by								,',
'																				       wubfa_cre_ip_addr					,',
'																				       wubfa_cre_os_user					,	',
'																				       wubfa_cre_emp_id						,',
'																				       wubfa_cre_date							)',
'																				VALUES(:WUBFT_USER_ID,',
'																							 cr2.wubft_bus_fun_id				,',
'																							 ''01-Apr-2021''							,',
'																							 ''01-Apr-2099''							,',
'																							 :GLOBAL_USER						,',
'																							 :GLOBAL_IP_ADDR					,',
'																							 :GLOBAL_USER						,',
'																							 :GLOBAL_EMP_ID					,',
'																							 SYSDATE										);',
'	 	     	  ',
'	 	     END IF;',
'	 	     ',
'	 	  CLOSE c3;',
'	 	  ',
'	 END LOOP c2;',
'	 ',
'	 DELETE wapl_user_bus_fun_temp;',
'',
'	 COMMIT;',
'	 ',
'	',
'	 ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(7575586214343081742)
,p_internal_uid=>2093624255822470713
);
wwv_flow_imp.component_end;
end;
/
