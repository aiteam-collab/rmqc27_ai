prompt --application/pages/page_04800
begin
--   Manifest
--     PAGE: 04800
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
 p_id=>4800
,p_name=>'SMS Sent'
,p_alias=>'SMS-SENT'
,p_step_title=>'SMS Sent'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'Y'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6010048477404939336)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490475667505325)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<h3 style="color:blue";>SMS Unsent<h3>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6537569994614916839)
,p_plug_name=>'New'
,p_static_id=>'new-2'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>9
,p_plug_display_column=>3
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6537010026457774544)
,p_name=>'SMS Send'
,p_static_id=>'sms-send'
,p_parent_plug_id=>wwv_flow_imp.id(6010048477404939336)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWNUM,',
'       SOH_BU,',
'       SOH_DOC_NO  ,',
'		 null  "ALERT_DATE",',
'		 SORL_RCVR_MOB_NO "ALERT_SUBJ",',
'       SOH_BODY "ALERT_MSG",',
'		  ''<span style = "font-size:12px;  font-family:verdana; color:#008b8b"> Doc. Date : &nbsp; '' ||  SOH_DOC_DATE || ''</SPAN></B>''   "ALERT_ICON1",',
'       SOH_USER_ID,',
'       SOH_EMP_ID ,',
'		 null "ALERT_MSG1",',
'		 ''<span class="fa fa-comments" aria-hidden="true" style="color:#028505; font-size:30px;"></span>'' "ALERT_ICON",',
'       SOH_VOU_TYPE,',
'		/*    ''<a href="''|| apex_util.prepare_url(''f?p=&APP_ID.:2361305981:&SESSION.::&DEBUG.::''',
'                      || ''P2361305981_ROW_NUM:''',
'                      || ROWnum)',
'                      || ''">'' */ ',
'		apex_page.get_url(p_page => 2361305981, p_items => ''P2361305981_ROW_NUM_1,P2361305981_Type'', p_values => ''''||ROWNUM||'',Send'')"ALERT_LINK" , ',
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
'       SORL_RCVR_MOB_NO,',
'       SORL_CRE_BY,',
'       SORL_CRE_DATE,',
'       SORL_UPD_BY,',
'       SORL_UPD_DATE,',
'       SORL_API_URL,',
'       SORL_SUB_SEQ_NO',
'  from SMS_OUTBOX_VW',
'  where SOH_BU = :global_bu',
'   AND SOH_STATUS LIKE ''%SUCCESS%''',
'  ---and SORL_RCVR_MOB_NO = :P4800_SCANCODE '))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(11675079996724977856)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010164695509525874)
,p_query_column_id=>4
,p_column_alias=>'ALERT_DATE'
,p_column_display_sequence=>240
,p_column_heading=>'Alert Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010165468062525876)
,p_query_column_id=>11
,p_column_alias=>'ALERT_ICON'
,p_column_display_sequence=>260
,p_column_heading=>'Alert Icon'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010165846675525876)
,p_query_column_id=>7
,p_column_alias=>'ALERT_ICON1'
,p_column_display_sequence=>270
,p_column_heading=>'Alert Icon1'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010168264877525878)
,p_query_column_id=>13
,p_column_alias=>'ALERT_LINK'
,p_column_display_sequence=>330
,p_column_heading=>'Alert Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010165120358525874)
,p_query_column_id=>6
,p_column_alias=>'ALERT_MSG'
,p_column_display_sequence=>250
,p_column_heading=>'Alert Msg'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010167444374525878)
,p_query_column_id=>10
,p_column_alias=>'ALERT_MSG1'
,p_column_display_sequence=>310
,p_column_heading=>'Alert Msg1'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010166668983525876)
,p_query_column_id=>5
,p_column_alias=>'ALERT_SUBJ'
,p_column_display_sequence=>290
,p_column_heading=>'Alert Subj'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010167893317525878)
,p_query_column_id=>1
,p_column_alias=>'ROWNUM'
,p_column_display_sequence=>320
,p_column_heading=>'Rownum'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010159858784525870)
,p_query_column_id=>22
,p_column_alias=>'SOH_API_URL'
,p_column_display_sequence=>120
,p_column_heading=>'Soh Api Url'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010155448235525863)
,p_query_column_id=>2
,p_column_alias=>'SOH_BU'
,p_column_display_sequence=>10
,p_column_heading=>'Soh Bu'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010157847173525865)
,p_query_column_id=>17
,p_column_alias=>'SOH_CRE_BY'
,p_column_display_sequence=>70
,p_column_heading=>'Soh Cre By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010158328004525865)
,p_query_column_id=>18
,p_column_alias=>'SOH_CRE_DATE'
,p_column_display_sequence=>80
,p_column_heading=>'Soh Cre Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010166316291525876)
,p_query_column_id=>3
,p_column_alias=>'SOH_DOC_NO'
,p_column_display_sequence=>280
,p_column_heading=>'Soh Doc No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010167053188525876)
,p_query_column_id=>9
,p_column_alias=>'SOH_EMP_ID'
,p_column_display_sequence=>300
,p_column_heading=>'Soh Emp Id'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010160245137525870)
,p_query_column_id=>23
,p_column_alias=>'SOH_SMS_TYPE'
,p_column_display_sequence=>130
,p_column_heading=>'Soh Sms Type'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010157436082525865)
,p_query_column_id=>16
,p_column_alias=>'SOH_STATUS'
,p_column_display_sequence=>60
,p_column_heading=>'Soh Status'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010159529533525870)
,p_query_column_id=>21
,p_column_alias=>'SOH_UNIT'
,p_column_display_sequence=>110
,p_column_heading=>'Soh Unit'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010158731624525867)
,p_query_column_id=>19
,p_column_alias=>'SOH_UPD_BY'
,p_column_display_sequence=>90
,p_column_heading=>'Soh Upd By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010159074716525870)
,p_query_column_id=>20
,p_column_alias=>'SOH_UPD_DATE'
,p_column_display_sequence=>100
,p_column_heading=>'Soh Upd Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010155854151525863)
,p_query_column_id=>8
,p_column_alias=>'SOH_USER_ID'
,p_column_display_sequence=>20
,p_column_heading=>'Soh User Id'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010157084467525865)
,p_query_column_id=>15
,p_column_alias=>'SOH_VOU_NO'
,p_column_display_sequence=>50
,p_column_heading=>'Soh Vou No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010156651213525865)
,p_query_column_id=>14
,p_column_alias=>'SOH_VOU_PFX'
,p_column_display_sequence=>40
,p_column_heading=>'Soh Vou Pfx'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010156264297525863)
,p_query_column_id=>12
,p_column_alias=>'SOH_VOU_TYPE'
,p_column_display_sequence=>30
,p_column_heading=>'Soh Vou Type'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010163886844525874)
,p_query_column_id=>32
,p_column_alias=>'SORL_API_URL'
,p_column_display_sequence=>220
,p_column_heading=>'Sorl Api Url'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010160718542525871)
,p_query_column_id=>24
,p_column_alias=>'SORL_BU'
,p_column_display_sequence=>140
,p_column_heading=>'Sorl Bu'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010162306323525871)
,p_query_column_id=>28
,p_column_alias=>'SORL_CRE_BY'
,p_column_display_sequence=>180
,p_column_heading=>'Sorl Cre By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010162715942525873)
,p_query_column_id=>29
,p_column_alias=>'SORL_CRE_DATE'
,p_column_display_sequence=>190
,p_column_heading=>'Sorl Cre Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010161135313525871)
,p_query_column_id=>25
,p_column_alias=>'SORL_DOC_NO'
,p_column_display_sequence=>150
,p_column_heading=>'Sorl Doc No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010161903935525871)
,p_query_column_id=>27
,p_column_alias=>'SORL_RCVR_MOB_NO'
,p_column_display_sequence=>170
,p_column_heading=>'Sorl Rcvr Mob No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010161474629525871)
,p_query_column_id=>26
,p_column_alias=>'SORL_SEQ_NO'
,p_column_display_sequence=>160
,p_column_heading=>'Sorl Seq No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010164239921525874)
,p_query_column_id=>33
,p_column_alias=>'SORL_SUB_SEQ_NO'
,p_column_display_sequence=>230
,p_column_heading=>'Sorl Sub Seq No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010163062623525873)
,p_query_column_id=>30
,p_column_alias=>'SORL_UPD_BY'
,p_column_display_sequence=>200
,p_column_heading=>'Sorl Upd By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010163507656525873)
,p_query_column_id=>31
,p_column_alias=>'SORL_UPD_DATE'
,p_column_display_sequence=>210
,p_column_heading=>'Sorl Upd Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6530084983568239120)
,p_name=>'SMS Unsend'
,p_static_id=>'sms-unsend'
,p_parent_plug_id=>wwv_flow_imp.id(6010048477404939336)
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWNUM,',
'       SOH_BU,',
'       SOH_DOC_NO  ,',
'		 null /*''<span style = " font-size:12px; font-family:verdana; color:#af150d"> Doc. Date : &nbsp; '' || SOH_DOC_DATE  || ''</SPAN></B>''  */ "ALERT_DATE",',
'		 SORL_RCVR_MOB_NO "ALERT_SUBJ",',
'       SOH_BODY "ALERT_MSG",',
'		''<span style = " font-size:10px; font-family:verdana; color:#af150d"> '' || SOH_DOC_DATE  || ''</SPAN></B><br>''||  ''<span style = "font-size:12px;  font-family:verdana; color:#158aec"> '' || SOH_VOU_NO  || ''</SPAN></B>''   "ALERT_ICON1",',
'       SOH_USER_ID,',
'       SOH_EMP_ID ,',
'		 null "ALERT_MSG1",',
'		 ''<span class="fa fa-comments" aria-hidden="true" style="color:#028505; font-size:15px;"></span>'' "ALERT_ICON",',
'       SOH_VOU_TYPE,',
'		/*    ''<a href="''|| apex_util.prepare_url(''f?p=&APP_ID.:2361305981:&SESSION.::&DEBUG.::''',
'                      || ''P2361305981_ROW_NUM:''',
'                      || ROWnum)',
'                      || ''">'' */',
'	   apex_page.get_url(p_page => 2361305981, p_items => ''P2361305981_ROW_NUM,P2361305981_Type'', p_values => ''''||ROWNUM||'',UNSEND'')  "ALERT_LINK" , ',
'		  --apex_page.get_url(p_page => 99, p_items => ''P99_DOC_NO,P99_TYPE'', p_values => ''''||EAP_DOC_NO||'',L'') card_like,',
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
'       SORL_RCVR_MOB_NO,',
'       SORL_CRE_BY,',
'       SORL_CRE_DATE,',
'       SORL_UPD_BY,',
'       SORL_UPD_DATE,',
'       SORL_API_URL,',
'       SORL_SUB_SEQ_NO',
'  from SMS_OUTBOX_VW',
'  where SOH_BU = :global_bu',
'   AND ( (:P4800_TYPE = ''PFX'' AND SOH_VOU_PFX = :P4800_SCANCODE)',
'              OR (:P4800_TYPE = ''NO''',
'                  AND SOH_VOU_NO = :P4800_SCANCODE)',
'              OR (:P4800_TYPE = ''MOBILE''   AND SORL_RCVR_MOB_NO LIKE ''%''||:P4800_SCANCODE||''%'')',
'              OR :P4800_SCANCODE IS NULL)',
'  ---and SORL_RCVR_MOB_NO = :P4800_SCANCODE '))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(11675079996724977856)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010152751971525857)
,p_query_column_id=>4
,p_column_alias=>'ALERT_DATE'
,p_column_display_sequence=>290
,p_column_heading=>'Alert Date'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010153990107525857)
,p_query_column_id=>11
,p_column_alias=>'ALERT_ICON'
,p_column_display_sequence=>330
,p_column_heading=>'Alert Icon'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010143727021525834)
,p_query_column_id=>7
,p_column_alias=>'ALERT_ICON1'
,p_column_display_sequence=>340
,p_column_heading=>'Alert Icon1'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010142109303525832)
,p_query_column_id=>13
,p_column_alias=>'ALERT_LINK'
,p_column_display_sequence=>410
,p_column_heading=>'Alert Link'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010153202098525857)
,p_query_column_id=>6
,p_column_alias=>'ALERT_MSG'
,p_column_display_sequence=>310
,p_column_heading=>'Alert Msg'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010142477010525832)
,p_query_column_id=>10
,p_column_alias=>'ALERT_MSG1'
,p_column_display_sequence=>390
,p_column_heading=>'Alert Msg1'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010143290307525834)
,p_query_column_id=>5
,p_column_alias=>'ALERT_SUBJ'
,p_column_display_sequence=>370
,p_column_heading=>'Alert Subj'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010154402989525857)
,p_query_column_id=>1
,p_column_alias=>'ROWNUM'
,p_column_display_sequence=>400
,p_column_heading=>'Rownum'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010148020893525846)
,p_query_column_id=>22
,p_column_alias=>'SOH_API_URL'
,p_column_display_sequence=>170
,p_column_heading=>'Soh Api Url'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010142928155525832)
,p_query_column_id=>2
,p_column_alias=>'SOH_BU'
,p_column_display_sequence=>10
,p_column_heading=>'Soh Bu'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010146063875525835)
,p_query_column_id=>17
,p_column_alias=>'SOH_CRE_BY'
,p_column_display_sequence=>120
,p_column_heading=>'Soh Cre By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010146416584525845)
,p_query_column_id=>18
,p_column_alias=>'SOH_CRE_DATE'
,p_column_display_sequence=>130
,p_column_heading=>'Soh Cre Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010154835077525859)
,p_query_column_id=>3
,p_column_alias=>'SOH_DOC_NO'
,p_column_display_sequence=>350
,p_column_heading=>'Soh Doc No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010153573553525857)
,p_query_column_id=>9
,p_column_alias=>'SOH_EMP_ID'
,p_column_display_sequence=>380
,p_column_heading=>'Soh Emp Id'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010148401059525846)
,p_query_column_id=>23
,p_column_alias=>'SOH_SMS_TYPE'
,p_column_display_sequence=>180
,p_column_heading=>'Soh Sms Type'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010145639242525835)
,p_query_column_id=>16
,p_column_alias=>'SOH_STATUS'
,p_column_display_sequence=>110
,p_column_heading=>'Soh Status'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010147629108525846)
,p_query_column_id=>21
,p_column_alias=>'SOH_UNIT'
,p_column_display_sequence=>160
,p_column_heading=>'Soh Unit'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010146741084525846)
,p_query_column_id=>19
,p_column_alias=>'SOH_UPD_BY'
,p_column_display_sequence=>140
,p_column_heading=>'Soh Upd By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010147199263525846)
,p_query_column_id=>20
,p_column_alias=>'SOH_UPD_DATE'
,p_column_display_sequence=>150
,p_column_heading=>'Soh Upd Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010144112779525834)
,p_query_column_id=>8
,p_column_alias=>'SOH_USER_ID'
,p_column_display_sequence=>60
,p_column_heading=>'Soh User Id'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010145320129525835)
,p_query_column_id=>15
,p_column_alias=>'SOH_VOU_NO'
,p_column_display_sequence=>100
,p_column_heading=>'Soh Vou No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010144887767525834)
,p_query_column_id=>14
,p_column_alias=>'SOH_VOU_PFX'
,p_column_display_sequence=>90
,p_column_heading=>'Soh Vou Pfx'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010144444423525834)
,p_query_column_id=>12
,p_column_alias=>'SOH_VOU_TYPE'
,p_column_display_sequence=>80
,p_column_heading=>'Soh Vou Type'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010152024241525856)
,p_query_column_id=>32
,p_column_alias=>'SORL_API_URL'
,p_column_display_sequence=>270
,p_column_heading=>'Sorl Api Url'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010148774485525848)
,p_query_column_id=>24
,p_column_alias=>'SORL_BU'
,p_column_display_sequence=>190
,p_column_heading=>'Sorl Bu'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010150411871525854)
,p_query_column_id=>28
,p_column_alias=>'SORL_CRE_BY'
,p_column_display_sequence=>230
,p_column_heading=>'Sorl Cre By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010150761454525854)
,p_query_column_id=>29
,p_column_alias=>'SORL_CRE_DATE'
,p_column_display_sequence=>240
,p_column_heading=>'Sorl Cre Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010149171588525848)
,p_query_column_id=>25
,p_column_alias=>'SORL_DOC_NO'
,p_column_display_sequence=>200
,p_column_heading=>'Sorl Doc No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010149939739525854)
,p_query_column_id=>27
,p_column_alias=>'SORL_RCVR_MOB_NO'
,p_column_display_sequence=>220
,p_column_heading=>'Sorl Rcvr Mob No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010149581428525848)
,p_query_column_id=>26
,p_column_alias=>'SORL_SEQ_NO'
,p_column_display_sequence=>210
,p_column_heading=>'Sorl Seq No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010152395088525856)
,p_query_column_id=>33
,p_column_alias=>'SORL_SUB_SEQ_NO'
,p_column_display_sequence=>280
,p_column_heading=>'Sorl Sub Seq No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010151235057525854)
,p_query_column_id=>30
,p_column_alias=>'SORL_UPD_BY'
,p_column_display_sequence=>250
,p_column_heading=>'Sorl Upd By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6010151569001525856)
,p_query_column_id=>31
,p_column_alias=>'SORL_UPD_DATE'
,p_column_display_sequence=>260
,p_column_heading=>'Sorl Upd Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6538225158054854122)
,p_plug_name=>'Unsend'
,p_static_id=>'unsend'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>2
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6010139912460525824)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6538225158054854122)
,p_button_name=>'SMS_Sent'
,p_static_id=>'sms-sent'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--large:t-Button--iconLeft:t-Button--stretch:t-Button--gapTop'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'SMS Sent'
,p_icon_css_classes=>'fa-paper-plane'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6010139470296525823)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6538225158054854122)
,p_button_name=>'SMS_Unsent'
,p_static_id=>'sms-unsent'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--large:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'SMS  Unsent'
,p_icon_css_classes=>'fa-send-o'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6010141399905525829)
,p_name=>'P4800_SCANCODE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6537569994614916839)
,p_prompt=>'Search'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(6010140974776525829)
,p_name=>'P4800_SERVER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6537569994614916839)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6010140552303525826)
,p_name=>'P4800_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6537569994614916839)
,p_prompt=>'Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Doc. Pfx.;PFX,Doc. No.;NO,Receiver Mobile Number;MOBILE'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>4
,p_grid_column=>1
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6010168692730525887)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P4800_SCANCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp.component_end;
end;
/
