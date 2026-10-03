prompt --application/pages/page_2361305981
begin
--   Manifest
--     PAGE: 2361305981
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
 p_id=>2361305981
,p_name=>'SMS'
,p_alias=>'SMS'
,p_page_mode=>'MODAL'
,p_step_title=>'SMS'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6021652612452313268)
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
 p_id=>wwv_flow_imp.id(6523305901006398648)
,p_plug_name=>'SMS Unsend'
,p_static_id=>'sms-unsend'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
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
'		 BUS_NAME,',
'		 DOCUMENT_TYPE from(',
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
'		 /*  (SELECT',
'    wf_bus_proc_desc',
'FROM',
'    work_flow',
'WHERE   wf_bu         = SOH_BU',
'  AND   wf_bus_proc_id     = SOH_VOU_TYPE)"DOCUMENT_TYPE", */',
' ( SELECT',
'    DECODE(',
'        (SELECT applctrl_desc_level FROM appl_control',
'        WHERE applctrl_bu = SOH_BU',
'        ),',
'        1,',
'        wf_bus_proc_desc,',
'        NVL(wf_bus_proc_desc2, wf_bus_proc_desc))',
'     AS Name',
'FROM',
'    work_flow',
'WHERE',
'   wf_bu         = SOH_BU',
'  AND   wf_bus_proc_id     = SOH_VOU_TYPE)"DOCUMENT_TYPE",',
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
'  from SMS_OUTBOX_VW)',
'  where id1 = :P2361305981_ROW_NUM'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P2361305981_ROW_NUM'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P2361305981_TYPE'
,p_plug_display_when_cond2=>'UNSEND'
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(5996107710029296768)
,p_region_id=>wwv_flow_imp.id(6523305901006398648)
,p_layout_type=>'ROW'
,p_title_adv_formatting=>false
,p_sub_title_adv_formatting=>false
,p_body_adv_formatting=>true
,p_body_html_expr=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<b><span aria-hidden="true" class="fa fa-calendar-clock " style="color:#600909" ></span>&nbsp;<span style = "color:#0572ce;font-size:17px;font-weight:bold;" >  Doc. Date. : </span></b> &SOH_DOC_DATE. <br>',
'<b><span aria-hidden="true" class="fa fa-book " style="color:#600909" ></span>&nbsp;<span style = "color:#0572ce;font-size:17px;font-weight:bold;" >Doc. Pfx : </span></b>&SOH_VOU_PFX. <br>',
'<b><span aria-hidden="true" class="fa fa-file-text-o " style="color:#600909" ></span>&nbsp;<span style = "color:#0572ce;font-size:17px;font-weight:bold;" >Doc. No. : </span></b> &SOH_VOU_NO.<br>',
'<b><span aria-hidden="true" class="fa fa-user " style="color:#600909" ></span>&nbsp;<span style = "color:#0572ce;font-size:17px;font-weight:bold;" >Business Entity :  </span></b> &BUS_NAME.<br>',
'<b><span aria-hidden="true" class="fa fa-list-ul " style="color:#600909" ></span>&nbsp;<span style = "color:#0572ce;font-size:17px;font-weight:bold;" >Document Type :  </span></b> &DOCUMENT_TYPE.<br>',
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
'       SORL_SUB_SEQ_NO',
'		 Document_Type -->'))
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6008832367739859748)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6523305901006398648)
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
 p_id=>wwv_flow_imp.id(6008832700267859751)
,p_name=>'P2361305981_DOC_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6523305901006398648)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5996107207608296763)
,p_name=>'P2361305981_ROW_NUM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6523305901006398648)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6009392692869002046)
,p_name=>'P2361305981_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6021652612452313268)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6009392806391002047)
,p_process_sequence=>20
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
'    WHERE SOH_VOU_NO = :p_SOH_VOU_NO;',
'',
'    v_output := UTL_HTTP.request (v_url);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>527430970847391019
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6008832488927859749)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send'
,p_static_id=>'send'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   v_doc_no   varchar2(10);',
'   v_vou_type varchar2(20);',
'   v_rec_mob_no varchar2(500);',
'   v_template   varchar2(4000);',
'BEGIN',
'SELECT soh_doc_no,',
'       soh_vou_type,',
'       SORL_RCVR_MOB_NO,',
'       soh_body',
'	into v_doc_no,',
'			 v_vou_type,',
'			 v_rec_mob_no,',
'			 v_template',
'  FROM SMS_OUTBOX_VW',
' WHERE SOH_BU = :GLOBAL_BU ;',
' 	--	AND SOH_DOC_NO = :P2361305981_DOC_NO;',
' 		',
' 	--ALERT_MSG(''CHECK''||:global.bu||''~''||v_doc_no||''~''||v_vou_type||''~''||v_rec_mob_no||''~''||v_template||''~''||:global.bu$user,''N'');',
' 		',
' 	PROC_SEND_SMS_ERP      (:global_bu,',
' 													v_doc_no,',
' 													v_vou_type,',
' 													v_rec_mob_no,',
' 													v_template,',
' 													:global_user);',
'  Raise_application_error(-20999,''SMS Sent Succesfully''); 													',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(6008832367739859748)
,p_internal_uid=>526870653384248721
);
wwv_flow_imp.component_end;
end;
/
