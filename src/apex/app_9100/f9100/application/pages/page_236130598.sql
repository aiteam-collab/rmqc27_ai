prompt --application/pages/page_236130598
begin
--   Manifest
--     PAGE: 236130598
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
 p_id=>236130598
,p_name=>'SMS '
,p_alias=>'SMS-1'
,p_step_title=>'SMS '
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Region-headerItems--title {',
'    flex-grow: 1;',
'    flex-shrink: 0;',
'    flex-basis: auto;',
'    text-align: left;',
'    padding: 0.2rem;',
'    display: flex;',
'    align-items: center;',
'}',
'.t-Body-contentInner {',
'    margin: 0 auto;',
'    max-width: 100%;',
'    background-image: url(#APP_IMAGES#05-01.jpg);',
'	 background-image: no-repeat;',
'}',
'',
'',
'.a-Button--hot, .t-Button--hot:not(.t-Button--simple), body .ui-button.ui-button--hot, body .ui-state-default.ui-priority-primary {',
'    background-color: #05c0ce;',
'    color: #ffffff;',
'}',
'.u-colors > :nth-child(45n + 1) .u-color {',
'    background-color: #fafafa;',
'    fill: #309FDB;',
'    color: #242424;',
'}',
'.t-BadgeList--circular.t-BadgeList--small .t-BadgeList-label, .t-BadgeList--dash.t-BadgeList--small .t-BadgeList-label {',
'    font-size: 12px;',
'}',
'.u-colors > :nth-child(45n + 1) .u-color {',
'    background-color: transparent;',
'    fill: #fbce4a;',
'    color: #deff60;',
'    padding: 0.2rem;',
'}',
'',
'.t-BadgeList--circular.t-BadgeList--small .t-BadgeList-label, .t-BadgeList--dash.t-BadgeList--small .t-BadgeList-label {',
'    font-size: 16px;',
'    font-style: oblique;',
'    color: #eef958;',
'}',
'.t-Region {',
'    background-color: transparent;',
'}',
'/* Css Added Elakkiya */',
'',
'#new .t-Form-fieldContainer--floatingLabel .t-Form-itemWrapper{',
'    align-items: stretch;',
'    min-width: 0;',
'    max-width: 100%;',
'    flex-grow: 1;',
'    font-size: 1.2rem;',
'    margin-top: -37px;',
'    margin-bottom: -8px;',
'}',
'',
'',
'.t-Form-fieldContainer--floatingLabel .t-Form-itemWrapper .apex-item-grid-row .apex-item-option :hover{',
'   --a-button-hover-background-color: #f1f1f;',
'   --a-button-hover-text-color: #146629;',
'    overflow: hidden;',
'    transform: scale(1.2);',
'    border :none;',
'    border-radius: 0px;',
'}',
'',
'',
'.apex-button-group .apex-item-option input:checked+label, .t-Form-fieldContainer--radioButtonGroup ',
'.apex-item-group--rc .apex-item-option input+label  {',
'    display: flex;',
'    flex-direction: column;',
'    flex-grow: 1;',
'    --a-button-hover-background-color: #e5e7eb;',
'    --a-button-hover-text-color: hsl(0, 0%, 3%);',
'    font-size: 1.2rem;',
'    font-weight: 900;',
'    padding: 8px;',
'    }',
'',
'/*#new .t-Button--hot, .a-Button--hot, .ui-button--hot, .a-CardView-button--hot, .apex-button-group input:checked + label, ',
'.t-Form-fieldContainer--radioButtonGroup .apex-item-group--rc input:checked + label {',
'    --a-button-background-color: #f1f1f;',
'    --a-button-text-color: #146629;',
'    padding: 8px;',
'    font-weight: 900;',
'    box-shadow:  0 -2px 0 #ff7c00 inset;',
'}   */ ',
'',
'.t-Body-title {',
'    grid-area: title;',
'    z-index: 490;',
'    position: sticky;',
'    min-width: 0;',
'    background-color: #fafafa;',
'    color: var(--ut-body-title-text-color);',
'    -webkit-backdrop-filter: var(--ut-body-title-backdrop-filter);',
'    backdrop-filter: var(--ut-body-title-backdrop-filter);',
'    border-width: 0;',
'    border-bottom-width: var(--ut-body-title-border-width, 1px);',
'    border-style: solid;',
'    border-color: var(--ut-body-title-border-color);',
'    box-shadow: var(--ut-body-title-box-shadow);',
'    top: var(--js-sticky-top, 0px);',
'}',
'.t-Form-fieldContainer--radioButtonGroup .apex-item-group--rc input:checked + label, .apex-button-group input:checked + label {',
'    border-color: #34495e;',
'    background-color: #70707000;',
'    padding: 8px;',
'    font-weight: 900;',
'    color: #146629;',
'    box-shadow:  0 -2px 0 #ff7c00 inset;',
'    /* box-shadow: none; */',
'}',
'',
'',
'#back{',
'    color: #383838;',
'    background-color: #fbce4a;',
'    box-shadow: 0 0 0 1px rgb(0 0 0 / 13%) inset;',
'}',
'',
'',
''))
,p_step_template=>wwv_flow_imp.id(11134577066937722959)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6009392940828002049)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_plug_grid_column_span=>9
,p_plug_display_column=>3
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6047294984485745541)
,p_plug_name=>'New'
,p_static_id=>'new-2'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>9
,p_plug_display_column=>3
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(6001907929781324330)
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'batch_facet_search', 'N',
  'compact_numbers_threshold', '10000',
  'display_chart_for_top_n_values', '10',
  'show_charts', 'Y',
  'show_current_facets', 'N',
  'show_total_row_count', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6047295326539745544)
,p_name=>'P236130598_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6047294984485745541)
,p_prompt=>'Search'
,p_source=>'SORL_RCVR_MOB_NO'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'input_field', 'FACET',
  'search_type', 'ROW')).to_clob
,p_fc_show_label=>false
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6008832972670859754)
,p_name=>'SMS Send'
,p_static_id=>'sms-send'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_grid_column_span=>9
,p_display_column=>3
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWNUM,',
'       SOH_BU,',
'       SOH_DOC_NO,',
'		 soh_body,',
'		 null /*''<span style = " font-size:12px; font-family:verdana; color:#af150d"> Doc. Date : &nbsp; '' || SOH_DOC_DATE  || ''</SPAN></B>''  */ "ALERT_DATE",',
'		 ''<span style="color:#2567e1">''||SORL_RCVR_MOB_NO||''</span>'' "ALERT_SUBJ",',
'		''<span style ="font-size:12px;font-family: verdana; color:#242424">''||soh_body||''</SPAN>''''<Br>''',
'		||''<span  style = " font-size:12px; font-family:verdana; color:#800000">Doc. Date:&nbsp;'' || SOH_DOC_DATE  || ''</SPAN></B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;''||''<s'
||'pan  style = " font-size:12px; font-family:verdana; color:#834a6c">Document Type:&nbsp; ''||( SELECT',
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
'  AND   wf_bus_proc_id     = SOH_VOU_TYPE)||''</SPAN></B><br>''',
'		||  ''<span style = "font-size:12px;  font-family:verdana; color:#800000"> Doc. No. :&nbsp;'' || SOH_VOU_PFX  ||''-''||SOH_VOU_NO || ''</SPAN>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'' || ''<span style = "font-size:12px;  font-fa'
||'mily:verdana; color:#834a6c"> Business Entity:&nbsp;''',
'||(SELECT',
'            bu_name1',
'        FROM',
'            business_units',
'        WHERE',
'            bu_id = SOH_BU)||''</SPAN></B>'' "ALERT_MSG",',
'		--''<span  style = " font-size:10px; font-family:verdana; color:#3a9601"> '' || SOH_DOC_DATE  || ''</SPAN></B><br>''||  ''<span style = "font-size:12px;  font-family:verdana; color:#af1109"> '' || SOH_VOU_NO  || ''</SPAN></B>''  ',
'		''<button type="button" class="t-Button t-Button--icon t-Button--hot t-Button--small t-Button--success t-Button--iconLeft"><span aria-hidden="true" class="t-Icon t-Icon--left fa fa-send"></span>send</button>'' "ALERT_ICON1",',
'       SOH_USER_ID,',
'       SOH_EMP_ID ,',
'		 null "ALERT_MSG1",',
'		 ''<span class="fa fa-comments" aria-hidden="true" style="color:#b2cf15; font-size:15px;"></span>'' "ALERT_ICON",',
'       SOH_VOU_TYPE,',
'		/*    ''<a href="''|| apex_util.prepare_url(''f?p=&APP_ID.:2361305981:&SESSION.::&DEBUG.::''',
'                      || ''P2361305981_ROW_NUM:''',
'                      || ROWnum)',
'                      || ''">'' */',
'	  -- apex_page.get_url(p_page => 2361305981, p_items => ''P2361305981_ROW_NUM,P2361305981_Type'', p_values => ''''||ROWNUM||'',UNSEND'')  "ALERT_LINK" , ',
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
'   AND (  (:P236130598_TYPE = ''MOBILE''   AND SORL_RCVR_MOB_NO LIKE ''%''||:P236130598_SCANCODE||''%'')',
'              OR :P236130598_SCANCODE IS NULL)',
'   AND SOH_STATUS LIKE ''%SUCCESS%'''))
,p_display_when_condition=>':P236130598_SERVER = ''SEND'''
,p_display_when_cond2=>'PLSQL'
,p_display_condition_type=>'EXPRESSION'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(11675079996724977856)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6009391019556002029)
,p_query_column_id=>5
,p_column_alias=>'ALERT_DATE'
,p_column_display_sequence=>240
,p_column_heading=>'Alert Date'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6009391135727002031)
,p_query_column_id=>12
,p_column_alias=>'ALERT_ICON'
,p_column_display_sequence=>260
,p_column_heading=>'Alert Icon'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6009391312811002032)
,p_query_column_id=>8
,p_column_alias=>'ALERT_ICON1'
,p_column_display_sequence=>270
,p_column_heading=>'Alert Icon1'
,p_column_link=>'javascript: $s(''P236130598_SOH_DOC_NO_1'',''#SOH_DOC_NO#''),$s(''P236130598_SOH_VOU_TYPE_1'',''#SOH_VOU_TYPE#''),$s(''P236130598_SORL_RCVR_MOB_NO_1'',''#SORL_RCVR_MOB_NO#''),$s(''P236130598_SOH_BODY_1'',''#SOH_BODY#''); apex.confirm(''Do you want to Resend?'',''SEND'')'
||';'
,p_column_linktext=>'#ALERT_ICON1#'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6009391074943002030)
,p_query_column_id=>7
,p_column_alias=>'ALERT_MSG'
,p_column_display_sequence=>250
,p_column_heading=>'Alert Msg'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6009391719114002036)
,p_query_column_id=>11
,p_column_alias=>'ALERT_MSG1'
,p_column_display_sequence=>310
,p_column_heading=>'Alert Msg1'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6009391503068002034)
,p_query_column_id=>6
,p_column_alias=>'ALERT_SUBJ'
,p_column_display_sequence=>290
,p_column_heading=>'Alert Subj'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6009391740184002037)
,p_query_column_id=>1
,p_column_alias=>'ROWNUM'
,p_column_display_sequence=>320
,p_column_heading=>'Rownum'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008834258028859767)
,p_query_column_id=>22
,p_column_alias=>'SOH_API_URL'
,p_column_display_sequence=>120
,p_column_heading=>'Soh Api Url'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030507698301094968)
,p_query_column_id=>4
,p_column_alias=>'SOH_BODY'
,p_column_display_sequence=>330
,p_column_heading=>'Soh Body'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008833228669859756)
,p_query_column_id=>2
,p_column_alias=>'SOH_BU'
,p_column_display_sequence=>10
,p_column_heading=>'Soh Bu'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008833739024859762)
,p_query_column_id=>17
,p_column_alias=>'SOH_CRE_BY'
,p_column_display_sequence=>70
,p_column_heading=>'Soh Cre By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008833852140859763)
,p_query_column_id=>18
,p_column_alias=>'SOH_CRE_DATE'
,p_column_display_sequence=>80
,p_column_heading=>'Soh Cre Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6009391339307002033)
,p_query_column_id=>3
,p_column_alias=>'SOH_DOC_NO'
,p_column_display_sequence=>280
,p_column_heading=>'Soh Doc No'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6009391571467002035)
,p_query_column_id=>10
,p_column_alias=>'SOH_EMP_ID'
,p_column_display_sequence=>300
,p_column_heading=>'Soh Emp Id'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008834372275859768)
,p_query_column_id=>23
,p_column_alias=>'SOH_SMS_TYPE'
,p_column_display_sequence=>130
,p_column_heading=>'Soh Sms Type'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008833643540859761)
,p_query_column_id=>16
,p_column_alias=>'SOH_STATUS'
,p_column_display_sequence=>60
,p_column_heading=>'Soh Status'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008834209771859766)
,p_query_column_id=>21
,p_column_alias=>'SOH_UNIT'
,p_column_display_sequence=>110
,p_column_heading=>'Soh Unit'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008833955974859764)
,p_query_column_id=>19
,p_column_alias=>'SOH_UPD_BY'
,p_column_display_sequence=>90
,p_column_heading=>'Soh Upd By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008834045289859765)
,p_query_column_id=>20
,p_column_alias=>'SOH_UPD_DATE'
,p_column_display_sequence=>100
,p_column_heading=>'Soh Upd Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008833243630859757)
,p_query_column_id=>9
,p_column_alias=>'SOH_USER_ID'
,p_column_display_sequence=>20
,p_column_heading=>'Soh User Id'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008833548399859760)
,p_query_column_id=>15
,p_column_alias=>'SOH_VOU_NO'
,p_column_display_sequence=>50
,p_column_heading=>'Soh Vou No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008833464546859759)
,p_query_column_id=>14
,p_column_alias=>'SOH_VOU_PFX'
,p_column_display_sequence=>40
,p_column_heading=>'Soh Vou Pfx'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008833419542859758)
,p_query_column_id=>13
,p_column_alias=>'SOH_VOU_TYPE'
,p_column_display_sequence=>30
,p_column_heading=>'Soh Vou Type'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008835284028859777)
,p_query_column_id=>32
,p_column_alias=>'SORL_API_URL'
,p_column_display_sequence=>220
,p_column_heading=>'Sorl Api Url'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008834503272859769)
,p_query_column_id=>24
,p_column_alias=>'SORL_BU'
,p_column_display_sequence=>140
,p_column_heading=>'Sorl Bu'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008834932853859773)
,p_query_column_id=>28
,p_column_alias=>'SORL_CRE_BY'
,p_column_display_sequence=>180
,p_column_heading=>'Sorl Cre By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008834970724859774)
,p_query_column_id=>29
,p_column_alias=>'SORL_CRE_DATE'
,p_column_display_sequence=>190
,p_column_heading=>'Sorl Cre Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008834564232859770)
,p_query_column_id=>25
,p_column_alias=>'SORL_DOC_NO'
,p_column_display_sequence=>150
,p_column_heading=>'Sorl Doc No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008834785563859772)
,p_query_column_id=>27
,p_column_alias=>'SORL_RCVR_MOB_NO'
,p_column_display_sequence=>170
,p_column_heading=>'Sorl Rcvr Mob No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008834687629859771)
,p_query_column_id=>26
,p_column_alias=>'SORL_SEQ_NO'
,p_column_display_sequence=>160
,p_column_heading=>'Sorl Seq No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008835385259859778)
,p_query_column_id=>33
,p_column_alias=>'SORL_SUB_SEQ_NO'
,p_column_display_sequence=>230
,p_column_heading=>'Sorl Sub Seq No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008835068767859775)
,p_query_column_id=>30
,p_column_alias=>'SORL_UPD_BY'
,p_column_display_sequence=>200
,p_column_heading=>'Sorl Upd By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6008835229308859776)
,p_query_column_id=>31
,p_column_alias=>'SORL_UPD_DATE'
,p_column_display_sequence=>210
,p_column_heading=>'Sorl Upd Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6027615373074706750)
,p_name=>'SMS Sent1'
,p_static_id=>'sms-sent'
,p_parent_plug_id=>wwv_flow_imp.id(6010048104267939332)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--small:t-BadgeList--dash:t-BadgeList--cols t-BadgeList--3cols'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ''<table>',
'    <tr>',
'            <td><img src=#APP_IMAGES#message.gif alt="Img" width="50" height="50" style = "margin-left: 42px;"></td>',
'            <td>''||''<div> <span style = "font-size: 30px;">''|| COUNT(SOH_DOC_NO) || ''</span> </br>',
'	        <span style = "font-size: 12px; color: #242424;">''||''SMS Sent''||''</span>''||''</td>',
'    </tr>',
'        </table>'' "SMS Send"',
'FROM',
'SMS_OUTBOX_VW',
'where SOH_BU = :global_bu',
'  AND SOH_STATUS LIKE ''%SUCCESS%''',
'    /*AND emp_status = ''A''',
'    AND to_char(trunc(emp_dob), ''MMDD'') = to_char(trunc(to_date(sysdate)), ''MMDD'')',
'ORDER BY',
'    to_char(emp_dob, ''DDMM'') ASC*/'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650529557729505378)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6027615985242706756)
,p_query_column_id=>1
,p_column_alias=>'SMS Send'
,p_column_display_sequence=>10
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:236130598:&SESSION.::&DEBUG.::P236130598_SERVER:SEND'
,p_column_linktext=>'#SMS Send#'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6001907929781324330)
,p_name=>'SMS Unsend'
,p_static_id=>'sms-unsend'
,p_region_name=>'Unsend'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--accent3:t-Region--stacked:t-Region--scrollBody:t-Form--slimPadding'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWNUM,',
'       SOH_BU,',
'       SOH_DOC_NO  ,',
'		 soh_body,',
'		 null /*''<span style = " font-size:12px; font-family:verdana; color:#af150d"> Doc. Date : &nbsp; '' || SOH_DOC_DATE  || ''</SPAN></B>''  */ "ALERT_DATE",',
'		 ''<span style="color:#2567e1">''||SORL_RCVR_MOB_NO||''</span>'' "ALERT_SUBJ",',
'		''<span style ="font-size:12px;font-family: verdana; color:#242424">''||soh_body||''</SPAN>''''<Br>''',
'		||''<span  style = " font-size:12px; font-family:verdana; color:#800000">Doc. Date:&nbsp;'' || SOH_DOC_DATE  || ''</SPAN></B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
||'&nbsp;&nbsp;&nbsp;''||''<span  style = " font-size:12px; font-family:verdana; color:#ff837a">Document Type:&nbsp; ''||( SELECT',
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
'  AND   wf_bus_proc_id     = SOH_VOU_TYPE)||''</SPAN></B><br>''',
'		||  ''<span style = "font-size:12px;  font-family:verdana; color:#800000"> Doc.&nbsp  No. :&nbsp;'' || SOH_VOU_PFX  ||''-''||SOH_VOU_NO || ''</SPAN>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'' || ''<span style = "font-s'
||'ize:12px;  font-family:verdana; color:#ff837a"> Business Entity:&nbsp;''',
'||(SELECT',
'            bu_name1',
'        FROM',
'            business_units',
'        WHERE',
'            bu_id = SOH_BU)||''</SPAN></B>'' "ALERT_MSG",',
'		--''<span  style = " font-size:10px; font-family:verdana; color:#3a9601"> '' || SOH_DOC_DATE  || ''</SPAN></B><br>''||  ''<span style = "font-size:12px;  font-family:verdana; color:#af1109"> '' || SOH_VOU_NO  || ''</SPAN></B>''  ',
'		''<button type="button" class="t-Button t-Button--icon t-Button--hot t-Button--small t-Button--success t-Button--iconLeft"><span aria-hidden="true" class="t-Icon t-Icon--left fa fa-send"></span>Resend</button>'' "ALERT_ICON1",',
'       SOH_USER_ID,',
'       SOH_EMP_ID ,',
'		 SOH_UPD_DATE "ALERT_MSG1",',
'		 ''<span class="fa fa-comments" aria-hidden="true" style="color:#b2cf15; font-size:15px;"></span>'' "ALERT_ICON",',
'       SOH_VOU_TYPE,',
'		/*    ''<a href="''|| apex_util.prepare_url(''f?p=&APP_ID.:2361305981:&SESSION.::&DEBUG.::''',
'                      || ''P2361305981_ROW_NUM:''',
'                      || ROWnum)',
'                      || ''">'' */',
'	  -- apex_page.get_url(p_page => 2361305981, p_items => ''P2361305981_ROW_NUM,P2361305981_Type'', p_values => ''''||ROWNUM||'',UNSEND'')  "ALERT_LINK" , ',
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
'  where SOH_BU = :global_bu AND (SOH_STATUS NOT LIKE ''%SUCCESS%'' OR SOH_STATUS IS NULL)',
'  AND (  (:P236130598_TYPE = ''MOBILE''   AND SORL_RCVR_MOB_NO LIKE ''%''||:P236130598_SCANCODE||''%'')',
'              OR :P236130598_SCANCODE IS NULL)',
'  --and SORL_RCVR_MOB_NO = :P236130598_SCANCODE '))
,p_display_when_condition=>':P236130598_SERVER = ''UNSEND'''
,p_display_when_cond2=>'PLSQL'
,p_display_condition_type=>'EXPRESSION'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(11675079996724977856)
,p_query_num_rows=>5
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'Y'
,p_prn_format=>'PDF'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width_units=>'PERCENTAGE'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'SMS Unsend'
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
,p_sort_null=>'L'
,p_plug_query_exp_filename=>'SMS Unsend'
,p_plug_query_exp_separator=>'|'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001910831230324359)
,p_query_column_id=>5
,p_column_alias=>'ALERT_DATE'
,p_column_display_sequence=>290
,p_column_heading=>'Alert Date'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001911244656324364)
,p_query_column_id=>12
,p_column_alias=>'ALERT_ICON'
,p_column_display_sequence=>330
,p_column_heading=>'Alert Icon'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001911412786324365)
,p_query_column_id=>8
,p_column_alias=>'ALERT_ICON1'
,p_column_display_sequence=>340
,p_column_heading=>'Alert Icon1'
,p_column_link=>'javascript: $s(''P236130598_SOH_DOC_NO'',''#SOH_DOC_NO#''),$s(''P236130598_SOH_VOU_TYPE'',''#SOH_VOU_TYPE#''),$s(''P236130598_SORL_RCVR_MOB_NO'',''#SORL_RCVR_MOB_NO#''),$s(''P236130598_SOH_BODY'',''#SOH_BODY#''); apex.submit(''RESEND'');'
,p_column_linktext=>'#ALERT_ICON1#'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001910952106324361)
,p_query_column_id=>7
,p_column_alias=>'ALERT_MSG'
,p_column_display_sequence=>310
,p_column_heading=>'Alert Msg'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001912197009324373)
,p_query_column_id=>11
,p_column_alias=>'ALERT_MSG1'
,p_column_display_sequence=>390
,p_column_heading=>'Alert Msg1'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001911915653324370)
,p_query_column_id=>6
,p_column_alias=>'ALERT_SUBJ'
,p_column_display_sequence=>370
,p_column_heading=>'Alert Subj'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5996107300227296764)
,p_query_column_id=>1
,p_column_alias=>'ROWNUM'
,p_column_display_sequence=>400
,p_column_heading=>'Rownum'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001909591607324347)
,p_query_column_id=>22
,p_column_alias=>'SOH_API_URL'
,p_column_display_sequence=>170
,p_column_heading=>'Soh Api Url'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6030507592666094967)
,p_query_column_id=>4
,p_column_alias=>'SOH_BODY'
,p_column_display_sequence=>410
,p_column_heading=>'Soh Body'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001907959776324331)
,p_query_column_id=>2
,p_column_alias=>'SOH_BU'
,p_column_display_sequence=>10
,p_column_heading=>'Soh Bu'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001909052490324342)
,p_query_column_id=>17
,p_column_alias=>'SOH_CRE_BY'
,p_column_display_sequence=>120
,p_column_heading=>'Soh Cre By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001909166806324343)
,p_query_column_id=>18
,p_column_alias=>'SOH_CRE_DATE'
,p_column_display_sequence=>130
,p_column_heading=>'Soh Cre Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001911587114324367)
,p_query_column_id=>3
,p_column_alias=>'SOH_DOC_NO'
,p_column_display_sequence=>350
,p_column_heading=>'Soh Doc No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001912093333324372)
,p_query_column_id=>10
,p_column_alias=>'SOH_EMP_ID'
,p_column_display_sequence=>380
,p_column_heading=>'Soh Emp Id'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001909653042324348)
,p_query_column_id=>23
,p_column_alias=>'SOH_SMS_TYPE'
,p_column_display_sequence=>180
,p_column_heading=>'Soh Sms Type'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001908967868324341)
,p_query_column_id=>16
,p_column_alias=>'SOH_STATUS'
,p_column_display_sequence=>110
,p_column_heading=>'Soh Status'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001909467396324346)
,p_query_column_id=>21
,p_column_alias=>'SOH_UNIT'
,p_column_display_sequence=>160
,p_column_heading=>'Soh Unit'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001909307127324344)
,p_query_column_id=>19
,p_column_alias=>'SOH_UPD_BY'
,p_column_display_sequence=>140
,p_column_heading=>'Soh Upd By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001909376726324345)
,p_query_column_id=>20
,p_column_alias=>'SOH_UPD_DATE'
,p_column_display_sequence=>150
,p_column_heading=>'Soh Upd Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001908461448324336)
,p_query_column_id=>9
,p_column_alias=>'SOH_USER_ID'
,p_column_display_sequence=>60
,p_column_heading=>'Soh User Id'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001908857604324340)
,p_query_column_id=>15
,p_column_alias=>'SOH_VOU_NO'
,p_column_display_sequence=>100
,p_column_heading=>'Soh Vou No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001908817581324339)
,p_query_column_id=>14
,p_column_alias=>'SOH_VOU_PFX'
,p_column_display_sequence=>90
,p_column_heading=>'Soh Vou Pfx'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001908727665324338)
,p_query_column_id=>13
,p_column_alias=>'SOH_VOU_TYPE'
,p_column_display_sequence=>80
,p_column_heading=>'Soh Vou Type'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001910611775324357)
,p_query_column_id=>32
,p_column_alias=>'SORL_API_URL'
,p_column_display_sequence=>270
,p_column_heading=>'Sorl Api Url'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001909746266324349)
,p_query_column_id=>24
,p_column_alias=>'SORL_BU'
,p_column_display_sequence=>190
,p_column_heading=>'Sorl Bu'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001910196891324353)
,p_query_column_id=>28
,p_column_alias=>'SORL_CRE_BY'
,p_column_display_sequence=>230
,p_column_heading=>'Sorl Cre By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001910294523324354)
,p_query_column_id=>29
,p_column_alias=>'SORL_CRE_DATE'
,p_column_display_sequence=>240
,p_column_heading=>'Sorl Cre Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001909911094324350)
,p_query_column_id=>25
,p_column_alias=>'SORL_DOC_NO'
,p_column_display_sequence=>200
,p_column_heading=>'Sorl Doc No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001910118093324352)
,p_query_column_id=>27
,p_column_alias=>'SORL_RCVR_MOB_NO'
,p_column_display_sequence=>220
,p_column_heading=>'Sorl Rcvr Mob No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001910009618324351)
,p_query_column_id=>26
,p_column_alias=>'SORL_SEQ_NO'
,p_column_display_sequence=>210
,p_column_heading=>'Sorl Seq No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001910698448324358)
,p_query_column_id=>33
,p_column_alias=>'SORL_SUB_SEQ_NO'
,p_column_display_sequence=>280
,p_column_heading=>'Sorl Sub Seq No'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001910401319324355)
,p_query_column_id=>30
,p_column_alias=>'SORL_UPD_BY'
,p_column_display_sequence=>250
,p_column_heading=>'Sorl Upd By'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6001910500479324356)
,p_query_column_id=>31
,p_column_alias=>'SORL_UPD_DATE'
,p_column_display_sequence=>260
,p_column_heading=>'Sorl Upd Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6027615065769706747)
,p_name=>'SMS  Unsent1'
,p_static_id=>'sms-unsent'
,p_parent_plug_id=>wwv_flow_imp.id(6010048104267939332)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:u-colors:t-BadgeList--small:t-BadgeList--dash:t-BadgeList--flex'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ''<table>',
'    <tr>',
'            <td><img src=#APP_IMAGES#mailing.gif alt="Img" width="50" height="50" style = "margin-left: 42px;"></td>',
'            <td>''||''<div> <span style = "font-size: 30px; color:#345e4d;">''|| COUNT(SOH_DOC_NO) || ''</span> </br>',
'	        <span style = "font-size: 12px; color: #242424;">''||''SMS Unsent''||''</span>''||''</td>',
'    </tr>',
'        </table>'' "SMS Unsend"',
'FROM',
'SMS_OUTBOX_VW',
'where SOH_BU=:GLOBAL_BU AND (SOH_STATUS NOT LIKE ''%SUCCESS%'' OR SOH_STATUS IS NULL)',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650529557729505378)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6027615303646706749)
,p_query_column_id=>1
,p_column_alias=>'SMS Unsend'
,p_column_display_sequence=>10
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:236130598:&SESSION.::&DEBUG.::P236130598_SERVER:UNSEND'
,p_column_linktext=>'#SMS Unsend#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6552638033816131462)
,p_plug_name=>'Tabs'
,p_static_id=>'tabs'
,p_region_name=>'tabs'
,p_region_template_options=>'#DEFAULT#:t-Form--leftLabels:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>70
,p_plug_grid_column_span=>3
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_required_patch=>wwv_flow_imp.id(7031259516264491845)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6010048104267939332)
,p_plug_name=>'Unsend'
,p_static_id=>'unsend'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7049889161747369061)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6010048104267939332)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_static_id=>'back'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--iconLeft:t-Button--gapBottom'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_image_alt=>'Back'
,p_icon_css_classes=>'fa-arrow-left-alt'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6010048247795939334)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6010048104267939332)
,p_button_name=>'SMS_Sent'
,p_static_id=>'sms-sent'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconLeft:t-Button--stretch:t-Button--gapTop'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'SMS Sent'
,p_button_redirect_url=>'f?p=&APP_ID.:236130598:&SESSION.::&DEBUG.::P236130598_SERVER:SEND'
,p_icon_css_classes=>'fa-paper-plane'
,p_grid_new_row=>'Y'
,p_required_patch=>wwv_flow_imp.id(7031259516264491845)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6010048167839939333)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6010048104267939332)
,p_button_name=>'SMS_Unsent'
,p_static_id=>'sms-unsent'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--mobileHideLabel:t-Button--iconLeft:t-Button--stretch:t-Button--gapTop'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'SMS  Unsent'
,p_button_redirect_url=>'f?p=&APP_ID.:236130598:&SESSION.::&DEBUG.::P236130598_SERVER:UNSEND'
,p_icon_css_classes=>'fa-send-o'
,p_grid_new_row=>'Y'
,p_required_patch=>wwv_flow_imp.id(7031259516264491845)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6552638391150131466)
,p_branch_name=>'Go To Page 236130598'
,p_branch_action=>'f?p=&APP_ID.:236130598:&SESSION.::&DEBUG.::P236130598_TABS:S&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P236130598_TABS'
,p_branch_condition_text=>'S'
,p_required_patch=>wwv_flow_imp.id(7031259516264491845)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6552638435658131467)
,p_branch_name=>'Go To Page 24'
,p_branch_action=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.::P24_TABS:M&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P236130598_TABS'
,p_branch_condition_text=>'M'
,p_required_patch=>wwv_flow_imp.id(7031259516264491845)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6008832880846859753)
,p_name=>'P236130598_SCANCODE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6009392940828002049)
,p_prompt=>'<b>Search</b>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>10
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_fc_show_label=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6010048403585939335)
,p_name=>'P236130598_SERVER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6009392940828002049)
,p_item_default=>'UNSEND'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_fc_show_label=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6030507493233094966)
,p_name=>'P236130598_SOH_BODY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6001907929781324330)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_fc_show_label=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6041299074742901142)
,p_name=>'P236130598_SOH_BODY_1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6008832972670859754)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_fc_show_label=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6030507208048094963)
,p_name=>'P236130598_SOH_DOC_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6001907929781324330)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_fc_show_label=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6041298826304901139)
,p_name=>'P236130598_SOH_DOC_NO_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6008832972670859754)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_fc_show_label=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6030507309145094964)
,p_name=>'P236130598_SOH_VOU_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6001907929781324330)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_fc_show_label=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6041298866641901140)
,p_name=>'P236130598_SOH_VOU_TYPE_1'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6008832972670859754)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_fc_show_label=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6030507383219094965)
,p_name=>'P236130598_SORL_RCVR_MOB_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6001907929781324330)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_fc_show_label=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6041299035513901141)
,p_name=>'P236130598_SORL_RCVR_MOB_NO_1'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6008832972670859754)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_fc_show_label=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6552638040438131463)
,p_name=>'P236130598_TABS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6552638033816131462)
,p_item_default=>'S'
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Email;M,SMS;S'
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6027615738346706754)
,p_name=>'P236130598_TITLE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6009392940828002049)
,p_item_default=>':GLOBAL_PAGE_DESC'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_fc_show_label=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6009392897650002048)
,p_name=>'P236130598_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6009392940828002049)
,p_item_default=>'MOBILE'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_fc_show_label=>false
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6032318883277657932)
,p_name=>'New_1'
,p_static_id=>'new'
,p_event_sequence=>20
,p_condition_element=>'P236130598_SERVER'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'UNSEND'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6032318977342657933)
,p_event_id=>wwv_flow_imp.id(6032318883277657932)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-set-css'
,p_action=>'NATIVE_SET_CSS'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6027615065769706747)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'style_name', 'background',
  'value', 'darkseagreen')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6032319046405657934)
,p_name=>'New_1_1'
,p_static_id=>'new-2'
,p_event_sequence=>30
,p_condition_element=>'P236130598_SERVER'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'SEND'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6032319213981657935)
,p_event_id=>wwv_flow_imp.id(6032319046405657934)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-set-css'
,p_action=>'NATIVE_SET_CSS'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6027615373074706750)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'style_name', 'background',
  'value', 'darkseagreen')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6552638211145131464)
,p_name=>'Submit_page'
,p_static_id=>'submit-page'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P236130598_TABS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6552638266482131465)
,p_event_id=>wwv_flow_imp.id(6552638211145131464)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6027615893751706755)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P236130598_SERVER  = ''UNSEND'' THEN',
'   :Global_page_desc :=''SMS Unsend'';',
'ELSIF	:P236130598_SERVER  = ''SEND'' THEN',
'   :global_page_desc  := ''SMS Send'';',
'	end if;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>545654058208095727
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6027616182099706758)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UNSEND'
,p_static_id=>'unsend'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--- RAISE_APPLICATION_ERROR(-20999,:P236130598_SOH_DOC_NO||''-''||:P236130598_SOH_VOU_TYPE||''-''||:P236130598_SORL_RCVR_MOB_NO||''-''||:P236130598_SOH_BODY||''-''||:GLOBAL_BU);',
' BEGIN',
'  proc_send_sms_erp(:GLOBAL_bu,',
'                  :P236130598_soh_doc_no,',
'						:P236130598_soh_vou_type,',
'						:P236130598_sorl_rcvr_mob_no,',
'						:P236130598_soh_body,',
'						:GLOBAL_user);',
'',
'EXCEPTION',
'  WHEN OTHERS THEN ',
'  Raise_application_error(-20999,''SMS Not Sent, Please check exception.'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'RESEND'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'SMS Send.'
,p_internal_uid=>545654346556095730
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6041298638416901138)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UNSEND_1'
,p_static_id=>'unsend-2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--- RAISE_APPLICATION_ERROR(-20999,:P236130598_SOH_DOC_NO||''-''||:P236130598_SOH_VOU_TYPE||''-''||:P236130598_SORL_RCVR_MOB_NO||''-''||:P236130598_SOH_BODY||''-''||:GLOBAL_BU);',
' BEGIN',
'  proc_send_sms_erp(:GLOBAL_bu,',
'                  :P236130598_soh_doc_no_1,',
'						:P236130598_soh_vou_type_1,',
'						:P236130598_sorl_rcvr_mob_no_1,',
'						:P236130598_soh_body_1,',
'						:GLOBAL_user);',
'',
'EXCEPTION',
'  WHEN OTHERS THEN ',
'  Raise_application_error(-20999,''SMS Not Sent, Please check exception.'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SEND'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_process_success_message=>'SMS Send.'
,p_internal_uid=>559336802873290110
);
wwv_flow_imp.component_end;
end;
/
