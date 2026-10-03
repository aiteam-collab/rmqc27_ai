prompt --application/pages/page_00290
begin
--   Manifest
--     PAGE: 00290
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
 p_id=>290
,p_name=>'Mail Unsent Details'
,p_alias=>'MAIL-UNSENT-DETAILS'
,p_page_mode=>'MODAL'
,p_step_title=>'Mail Unsent Details'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.col_space:nth-child(odd) {',
'                    font-weight: 500;',
'                    font-size: 1.3rem;',
'                    font-family: inherit;',
'                    color: #0572ce;;',
'                    float: left;',
'                    width: 74.33%;',
'                    padding: 1px;',
'    }',
'',
'.col_space:nth-child(even) {',
'                    float: left;',
'                    color: #0572ce;;',
'                    width:  74.33%;',
'                    padding: 1px;',
'                    font-weight: 500;',
'                    font-size: 1.3rem;',
'                    font-family: inherit;',
'            }'))
,p_step_template=>wwv_flow_imp.id(10650478229710505311)
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'500'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6059237982075770872)
,p_name=>'Send'
,p_static_id=>'send'
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--spanHorizontally:t-Cards--animColorFill'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT  eoh_vou_pfx,',
'         ''<span aria-hidden="true" class="fa fa-user-arrow-up"></span>&nbsp;&nbsp; <SPAN STYLE="color:#7D0552">From :&nbsp;''',
'         || ''</span>''',
'         || eoh_sndr_email',
'         || ''&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;''',
'         || ''<br><span aria-hidden="true" class="fa fa-user-arrow-down"></span>&nbsp;&nbsp;&nbsp;<SPAN STYLE="color:#7D0552">To &nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;''',
'         || ''</span>''',
'         || eorl_rcvr_email',
'         || ''<br><span aria-hidden="true" class="fa fa-user-plus">&nbsp;&nbsp;&nbsp;</span><SPAN STYLE="color:#7D0552">CC &nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;''',
'         || ''</span>''',
'         || eorl_cc_email "CARD_TITLE",',
'         eoh_vou_no,',
'         eorl_bu,',
'               ''<SPAN STYLE="color:#0572ce; font-weight:bold;" >Entity &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;''',
'         || ''</span>''',
'         || (SELECT bu_name1',
'            FROM business_units',
'           WHERE bu_id = eoh_bu)',
'         || ''<br><SPAN STYLE="color:#0572ce; font-weight:bold;">Unit &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;''',
'         || ''</span>''',
'         ||  (SELECT bup_name1',
'            FROM bus_unit_plants',
'           WHERE bup_bu = eoh_bu AND bup_plant_id = eoh_unit)',
'          || ''<br><SPAN STYLE="color:#0572ce; font-weight:bold;" >Doc. Pfx &nbsp;&nbsp;&nbsp;:&nbsp;''',
'        || ''</span>''',
'          ||eoh_vou_pfx',
'          || ''<br><SPAN STYLE="color:#0572ce; font-weight:bold;" >Doc. No. &nbsp;&nbsp;&nbsp;:&nbsp;''',
'        || ''</span>''',
'          ||eoh_vou_no',
'          || ''<br><SPAN STYLE="color:#0572ce; font-weight:bold;" >Document Type &nbsp;&nbsp;&nbsp;:&nbsp;''',
'        || ''</span>''',
'          ||func_find_wf_type_desc (:global_bu, eoh_wf_type, 1)',
'            card_text,',
'                null CARD_SUBTEXT,',
'         (SELECT bu_name1',
'            FROM business_units',
'           WHERE bu_id = eoh_bu)',
'            "Entity",',
'         func_find_wf_type_desc (:global_bu, eoh_wf_type, 1) document_type,',
'         eorl_status',
'     FROM email_outbox_vw',
'             WHERE eoh_bu = :global_bu AND EORL_STATUS LIKE ''%Message Sent%''',
'          and eoh_doc_no = :P290_EOH_DOC_NO_1',
' ORDER BY EOH_DOC_DATE DESC'))
,p_display_when_condition=>'P290_TYPE'
,p_display_when_cond2=>'Send'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(6067283570158077433)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>90
,p_column_heading=>'Card Subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6067283412621077431)
,p_query_column_id=>5
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>70
,p_column_heading=>'Card Text'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6067283511063077432)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>80
,p_column_heading=>'Card Title'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6067283203067077429)
,p_query_column_id=>8
,p_column_alias=>'DOCUMENT_TYPE'
,p_column_display_sequence=>50
,p_column_heading=>'Document Type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6059238391021770876)
,p_query_column_id=>3
,p_column_alias=>'EOH_VOU_NO'
,p_column_display_sequence=>20
,p_column_heading=>'Eoh Vou No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6059238328919770875)
,p_query_column_id=>1
,p_column_alias=>'EOH_VOU_PFX'
,p_column_display_sequence=>10
,p_column_heading=>'Eoh Vou Pfx'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6059238509307770877)
,p_query_column_id=>4
,p_column_alias=>'EORL_BU'
,p_column_display_sequence=>30
,p_column_heading=>'Eorl Bu'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6067283320998077430)
,p_query_column_id=>9
,p_column_alias=>'EORL_STATUS'
,p_column_display_sequence=>60
,p_column_heading=>'Eorl Status'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6059238604468770878)
,p_query_column_id=>7
,p_column_alias=>'Entity'
,p_column_display_sequence=>40
,p_column_heading=>'Entity'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6059236163123770854)
,p_name=>'Unsend'
,p_static_id=>'unsend'
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:margin-left-sm'
,p_component_template_options=>'#DEFAULT#:t-Cards--basic:t-Cards--spanHorizontally:t-Cards--animColorFill'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' SELECT  eoh_vou_pfx,',
'         ''<span aria-hidden="true" class="fa fa-user-arrow-up"></span>&nbsp;&nbsp; <SPAN STYLE="color:#7D0552">From :&nbsp;''',
'         || ''</span>''',
'         || eoh_sndr_email',
'         || ''&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;''',
'         || ''<br><span aria-hidden="true" class="fa fa-user-arrow-down"></span>&nbsp;&nbsp;&nbsp;<SPAN STYLE="color:#7D0552">To &nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;''',
'         || ''</span>''',
'         || eorl_rcvr_email',
'         || ''<br><span aria-hidden="true" class="fa fa-user-plus">&nbsp;&nbsp;&nbsp;</span><SPAN STYLE="color:#7D0552">CC &nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;''',
'         || ''</span>''',
'         || eorl_cc_email "CARD_TITLE",',
'         eoh_vou_no,',
'         eorl_bu,',
'               ''<SPAN STYLE="color:#0572ce; font-weight:bold;" >Entity &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;''',
'         || ''</span>''',
'         || (SELECT bu_name1',
'            FROM business_units',
'           WHERE bu_id = eoh_bu)',
'         || ''<br><SPAN STYLE="color:#0572ce; font-weight:bold;">Unit &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;''',
'         || ''</span>''',
'         ||  (SELECT bup_name1',
'            FROM bus_unit_plants',
'           WHERE bup_bu = eoh_bu AND bup_plant_id = eoh_unit)',
'          || ''<br><SPAN STYLE="color:#0572ce; font-weight:bold;" >Doc. Pfx &nbsp;&nbsp;&nbsp;:&nbsp;''',
'          || ''</span>''',
'          ||eoh_vou_pfx',
'          || ''<br><SPAN STYLE="color:#0572ce; font-weight:bold;" >Doc. No. &nbsp;&nbsp;&nbsp;:&nbsp;''',
'          || ''</span>''',
'          ||eoh_vou_no',
'          || ''<br><SPAN STYLE="color:#0572ce; font-weight:bold;" >Document Type &nbsp;&nbsp;&nbsp;:&nbsp;''',
'        || ''</span>''',
'          ||(select DECODE(',
'        (SELECT applctrl_desc_level FROM appl_control',
'        WHERE applctrl_bu = :global_bu',
'        ),',
'        1,',
'        wf_bus_proc_desc,',
'        NVL(wf_bus_proc_desc2, wf_bus_proc_desc))',
'     AS Name',
'FROM',
'    work_flow',
'WHERE',
'   wf_bu         = :global_bu',
'  AND   wf_bus_proc_id     = eoh_wf_type)  card_text,',
'                null CARD_SUBTEXT,',
'         (SELECT bu_name1',
'            FROM business_units',
'           WHERE bu_id = eoh_bu)',
'            "Entity",',
'        (select DECODE(',
'        (SELECT applctrl_desc_level FROM appl_control',
'        WHERE applctrl_bu = :global_bu',
'        ),',
'        1,',
'        wf_bus_proc_desc,',
'        NVL(wf_bus_proc_desc2, wf_bus_proc_desc))',
'     AS Name',
'FROM',
'    work_flow',
'WHERE',
'   wf_bu         = :global_bu',
'  AND   wf_bus_proc_id     = eoh_wf_type) document_type,',
'         eorl_status',
'    FROM email_outbox_vw',
'   WHERE eoh_bu = :global_bu',
'         AND (eorl_status IS NULL OR eorl_status NOT LIKE (''Message %''))',
'            and eoh_doc_no = :P290_EOH_DOC_NO',
'ORDER BY eoh_doc_no'))
,p_display_when_condition=>'P290_TYPE'
,p_display_when_cond2=>'Unsend'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
 p_id=>wwv_flow_imp.id(6059237823629770870)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>110
,p_column_heading=>'Card Subtext'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6059237344920770866)
,p_query_column_id=>5
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>90
,p_column_heading=>'Card Text'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6059237438440770867)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>100
,p_column_heading=>'Card Title'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6047296014935745551)
,p_query_column_id=>8
,p_column_alias=>'DOCUMENT_TYPE'
,p_column_display_sequence=>120
,p_column_heading=>'Document Type'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6059236656990770859)
,p_query_column_id=>3
,p_column_alias=>'EOH_VOU_NO'
,p_column_display_sequence=>20
,p_column_heading=>'Eoh Vou No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6059236610780770858)
,p_query_column_id=>1
,p_column_alias=>'EOH_VOU_PFX'
,p_column_display_sequence=>10
,p_column_heading=>'Eoh Vou Pfx'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6059236822830770860)
,p_query_column_id=>4
,p_column_alias=>'EORL_BU'
,p_column_display_sequence=>30
,p_column_heading=>'Eorl Bu'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6059237189516770864)
,p_query_column_id=>9
,p_column_alias=>'EORL_STATUS'
,p_column_display_sequence=>70
,p_column_heading=>'Eorl Status'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6059237022714770862)
,p_query_column_id=>7
,p_column_alias=>'Entity'
,p_column_display_sequence=>50
,p_column_heading=>'Entity'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6059236339665770856)
,p_name=>'P290_EOH_BU'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6059236163123770854)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6059238130948770873)
,p_name=>'P290_EOH_BU_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6059237982075770872)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6059236471895770857)
,p_name=>'P290_EOH_DOC_NO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6059236163123770854)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6059238135755770874)
,p_name=>'P290_EOH_DOC_NO_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6059237982075770872)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6067283663607077434)
,p_name=>'P290_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6059236163123770854)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
