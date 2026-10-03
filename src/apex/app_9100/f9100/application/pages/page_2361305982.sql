prompt --application/pages/page_2361305982
begin
--   Manifest
--     PAGE: 2361305982
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
 p_id=>2361305982
,p_name=>'sent'
,p_alias=>'SENT'
,p_page_mode=>'MODAL'
,p_step_title=>'sent'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7067277828161232183)
,p_plug_name=>'SMS send'
,p_static_id=>'sms-send'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id1,SOH_BU,',
'       SOH_DOC_NO,',
'		 soh_doc_date,',
'       SOH_BODY ,',
'       SOH_USER_ID,',
'       SOH_EMP_ID ,',
'       SOH_VOU_TYPE,',
'       SOH_VOU_PFX,',
'       SOH_VOU_NO,',
'       SOH_STATUS,',
'       SOH_CRE_BY,',
'       SOH_CRE_DATE,',
'       SOH_UPD_BY,',
'       SOH_UPD_DATE,',
'       SOH_UNIT,',
'       SOH_API_URL,',
'       SOH_SMS_TYPE,',
'       SORL_BU,',
'       SORL_DOC_NO,',
'       SORL_SEQ_NO,',
'       SORL_RCVR_MOB_NO ,',
'       SORL_CRE_BY,',
'       SORL_CRE_DATE,',
'       SORL_UPD_BY,',
'       SORL_UPD_DATE,',
'       SORL_API_URL,',
'       SORL_SUB_SEQ_NO,',
'		 BUS_NAME from(',
'    select rownum id1,',
'       SOH_BU,',
'		 (SELECT',
'            bu_name1',
'        FROM',
'            business_units',
'        WHERE',
'            bu_id = SOH_BU)"BUS_NAME",',
'       SOH_DOC_NO,',
'		 soh_doc_date,',
'		  (SELECT',
'     (SELECT applctrl_desc_level FROM appl_control',
'        WHERE applctrl_bu = :global_bu',
'        )',
'        wf_bus_proc_desc',
'FROM',
'    work_flow',
'WHERE',
'    wf_bu         = SOH_BU',
'  AND   wf_bus_proc_id     = SOH_VOU_TYPE)"Document_Type",',
'       SOH_BODY ,',
'       SOH_USER_ID,',
'       SOH_EMP_ID ,',
'       SOH_VOU_TYPE,',
'       SOH_VOU_PFX,',
'       SOH_VOU_NO,',
'       SOH_STATUS,',
'       SOH_CRE_BY,',
'       SOH_CRE_DATE,',
'       SOH_UPD_BY,',
'       SOH_UPD_DATE,',
'       SOH_UNIT,',
'       SOH_API_URL,',
'       SOH_SMS_TYPE,',
'       SORL_BU,',
'       SORL_DOC_NO,',
'       SORL_SEQ_NO,',
'       SORL_RCVR_MOB_NO ,',
'       SORL_CRE_BY,',
'       SORL_CRE_DATE,',
'       SORL_UPD_BY,',
'       SORL_UPD_DATE,',
'       SORL_API_URL,',
'       SORL_SUB_SEQ_NO',
'  from SMS_OUTBOX_VW',
'  where SOH_BU=:GLOBAL_BU AND SOH_STATUS LIKE ''%SUCCESS%'')',
'  where id1 = :P2361305982_ROW_NUM'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P2361305982_ROW_NUM'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(6025934119834444571)
,p_region_id=>wwv_flow_imp.id(7067277828161232183)
,p_layout_type=>'ROW'
,p_title_adv_formatting=>false
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>true
,p_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<b><span aria-hidden="true" class="fa fa-calendar-clock " ></span>&nbsp;<span style = "color:#098272;font-size:15px;font-weight:bold;" >  Doc. Date. : </span></b> &SOH_DOC_DATE. <br>',
'<b><span aria-hidden="true" class="fa fa-book "></span>&nbsp;<span style = "color:#098272;font-size:15px;font-weight:bold;" >Doc. Pfx : </span></b>&SOH_VOU_PFX. <br>',
'<b><span aria-hidden="true" class="fa fa-file-text-o "></span>&nbsp;<span style = "color:#098272;font-size:15px;font-weight:bold;" >Doc. No. : </span></b> &SOH_VOU_NO.<br>',
'<b><span aria-hidden="true" class="fa fa-user " ></span>&nbsp;<span style = "color:#098272;font-size:15px;font-weight:bold;" >Business Entity :  </span></b> &BUS_NAME.<br>',
'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>&nbsp;  </b> &SOH_BODY.<br>',
'    <!--   SOH_DOC_NO,',
'       SOH_BODY ,',
'       SOH_USER_ID,',
'       SOH_EMP_ID ,',
'       SOH_VOU_TYPE,',
'       SOH_VOU_PFX,',
'       SOH_VOU_NO,',
'       SOH_STATUS,',
'       SOH_CRE_BY,',
'       SOH_CRE_DATE,',
'       SOH_UPD_BY,',
'       SOH_UPD_DATE,',
'       SOH_UNIT,',
'       SOH_API_URL,',
'       SOH_SMS_TYPE,',
'       SORL_BU,',
'       SORL_DOC_NO,',
'       SORL_SEQ_NO,',
'       SORL_RCVR_MOB_NO ,',
'       SORL_CRE_BY,',
'       SORL_CRE_DATE,',
'       SORL_UPD_BY,',
'       SORL_UPD_DATE,',
'       SORL_API_URL,',
'       SORL_SUB_SEQ_NO -->'))
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6025934584017444576)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7067277828161232183)
,p_button_name=>'Resend'
,p_static_id=>'resend'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>wwv_flow_imp.id(10650579805006505434)
,p_button_image_alt=>'Resend'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6025935289695444585)
,p_name=>'P2361305982_DOC_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(7067277828161232183)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6025934855181444582)
,p_name=>'P2361305982_ROW_NUM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(7067277828161232183)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6011435645031280138)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   v_url      VARCHAR2 (4000);',
'   v_output   VARCHAR2 (1000);',
'BEGIN',
'   SELECT SOH_API_URL',
'     INTO v_url',
'     FROM SMS_OUTBOX_HD',
'    WHERE SOH_VOU_NO = :P2361305982_DOC_NO;',
'',
'    v_output := UTL_HTTP.request (v_url);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6025934584017444576)
,p_internal_uid=>529473809487669110
);
wwv_flow_imp.component_end;
end;
/
