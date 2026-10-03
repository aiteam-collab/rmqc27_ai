prompt --application/pages/page_236130600
begin
--   Manifest
--     PAGE: 236130600
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
 p_id=>236130600
,p_name=>'Whatsapp - Sent/Unsent'
,p_alias=>'WHATSAPP-SENT-UNSENT'
,p_step_title=>'Whatsapp - Sent/Unsent'
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
'#but2 {',
'    background-color: #fafafa;',
'	 color:#242424;',
'    border-radius: 22px;',
'}',
'',
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
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7639569587396512608)
,p_name=>'Mail Sent'
,p_static_id=>'mail-sent'
,p_parent_plug_id=>wwv_flow_imp.id(7897451404792373224)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--small:t-BadgeList--dash:t-BadgeList--flex'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ''<table>',
'    <tr>',
'            <td><img src=#APP_IMAGES#email.gif alt="Img" width="50" height="50" style = "margin-left: 42px;"></td>',
'            <td>''||''<div> <span style = "font-size: 30px; color:#345e4d;">''|| COUNT(eoh_doc_no) || ''</span> </br>',
'	        <span style = "font-size: 12px; color: #008B8B; font-weight:bold">''||''Mail Sent''||''</span>''||''</td>',
'    </tr>',
'        </table>'' "Mail Send"',
' FROM email_outbox_vw',
'             WHERE eoh_bu = :global_bu AND EORL_STATUS LIKE ''%Message Sent%''',
'          ORDER BY EOH_DOC_DATE DESC',
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
 p_id=>wwv_flow_imp.id(7062297999668352863)
,p_query_column_id=>1
,p_column_alias=>'Mail Send'
,p_column_display_sequence=>10
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.::P24_TYPE:MUN1'
,p_column_linktext=>'#Mail Send#'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7901256973152682890)
,p_name=>'Mail Sent1'
,p_static_id=>'mail-sent-2'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>50
,p_icon_css_classes=>'fa-envelope-check'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--basic:t-Cards--displayIcons:t-Cards--cols:t-Cards--iconsRounded:t-Cards--animRaiseCard'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''<span aria-hidden="true" class="fa fa-user-arrow-up" style="color:#e98843"></span>&nbsp;&nbsp; <SPAN STYLE="color:#7D0552">From :&nbsp;''',
'         || ''</span>''',
'         || from1',
'         || ''&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;''',
'         || ''<span aria-hidden="true" class="fa fa-exchange fa-1x fa-anim-horizontal-shake" style="color:Green"></span>''',
'         || ''&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;''',
'         || ''<span aria-hidden="true" class="fa fa-user-arrow-down" style="color:#e98843"></span>&nbsp;&nbsp;<SPAN STYLE="color:#7D0552">To :&nbsp;''',
'         || ''</span>''',
'         || to1',
'         || ''<br><span aria-hidden="true" class="fa fa-user-plus" style="color:#e98843">&nbsp;&nbsp;&nbsp;</span><SPAN STYLE="color:#7D0552">CC &nbsp;&nbsp;&nbsp;:&nbsp;''',
'         || ''</span>''',
'         || cc',
'            card_title,',
'         eoh_doc_no,',
'         doc_date CARD_SUBTITLE,',
'           ''<SPAN STYLE="color:#8d4444; font-weight:bold;" >Subject &nbsp;&nbsp;&nbsp;:&nbsp;''',
'         || ''</span>''',
'         || subject',
'         || ''<br><SPAN STYLE="color:#8d4444; font-weight:bold;">Body &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;''',
'         || ''</span>''',
'         || body',
'            card_text,',
'         ''<span aria-hidden="true" class="fa fa-envelope-o  "></span>''',
'            card_icon,',
'           ''<a href="javascript:$s(''''P236130600_EORL_CC_EMAIL'''',''',
'         || ''''''''',
'         || cc',
'         || ''''''''',
'         || ''),$s(''''P236130600_EOH_SUBJ'''',''',
'         || ''''''''',
'         || subject',
'         || ''''''''',
'         || ''),$s(''''P236130600_EOH_BODY'''',''',
'         || ''''''''',
'         || body',
'         || ''''''''',
'         || ''),$s(''''P236130600_EOA_FILENAME'''',''',
'         || ''''''''',
'         || fa_download',
'         || ''''''''',
'			|| ''),$s(''''P236130600_EORL_DOC_NO'''',''',
'         || ''''''''',
'         || eoh_doc_no',
'         || ''''''''',
'         || ''),apex.submit(''''Resend'''');"> ''',
'         || ''<button type="button" class="t-Button t-Button--icon t-Button--small t-Button--success t-Button--link t-Button--iconLeft"><span aria-hidden="true" class="t-Icon t-Icon--left fa fa-paper-plane"></span>Resend</button>''',
'         || ''</a></button>&nbsp;&nbsp;&nbsp;''',
'			||''<button type="button" class="t-Button t-Button--icon t-Button--hot t-Button--link t-Button--iconLeft"><span aria-hidden="true" class="t-Icon t-Icon--left fa fa-download" ></span>Attachment</button>''',
'            card_subtext,',
'         NULL CARD_LINK',
'    FROM (  SELECT EOH_BU,',
'                   eoh_doc_no,',
'                   eoh_doc_date doc_date,',
'                   eoh_unit unit,',
'                   func_find_plnt_desc (NVL (eoh_bu, :global_bu), eoh_unit, 1)',
'                      unit1,',
'                   --eoh_vou_pfx || ''-'' || eoh_vou_no doc_no,',
'                   eoh_sndr_email from1,',
'                   eorl_rcvr_email to1,',
'                   eorl_cc_email cc,',
'                   DECODE (eorl_rcvr_type,',
'                           ''S'', ''Supplier'',',
'                           ''C'', ''Customer'',',
'                           ''E'', ''Employee'')',
'                      receiver_type,',
'                   --eoh_subj subject,',
'                   CASE',
'                      WHEN eoh_subj IS NULL',
'                      THEN',
'                            ''<span style="color:#607d8b;">''',
'                         || ''No Subject''',
'                         || ''</span>''',
'                      WHEN eoh_subj IS NOT NULL',
'                      THEN',
'                         eoh_subj',
'                   END',
'                      subject,',
'                   --eoh_body body,',
'                   CASE',
'                      WHEN LENGTH (eoh_body) > 50',
'                      THEN',
'                         SUBSTR (eoh_body, 1, 50) || ''..''',
'                      WHEN LENGTH (eoh_body) < 50',
'                      THEN',
'                         eoh_body',
'                   END',
'                      body,',
'                   eorl_status unsend_reason,',
'                   func_find_bu_desc (:global_bu, 1) business_unit,',
'                   func_find_wf_type_desc (:global_bu, eoh_wf_type, 1)',
'                      document_type,',
'                   (SELECT EOA_FILENAME',
'                      FROM email_outbox_attach',
'                     WHERE     eoa_bu = eoh_bu',
'                           AND eoa_doc_no = eoh_doc_no',
'                           AND eoa_seq_no = 1)',
'                      fa_download',
'              FROM email_outbox_vw',
'             WHERE eoh_bu = :global_bu AND EORL_STATUS LIKE ''%Message Sent%''',
'          ORDER BY EOH_DOC_DATE DESC)',
'ORDER BY doc_date DESC'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>10
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_required_patch=>wwv_flow_imp.id(7031259516264491845)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7062304615545362762)
,p_query_column_id=>5
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>190
,p_column_heading=>'Card Icon'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7062305378027362765)
,p_query_column_id=>7
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>200
,p_column_heading=>'Card Link'
,p_column_link=>'f?p=&APP_ID.:290:&SESSION.::&DEBUG.::P290_EOH_DOC_NO,P290_TYPE:#EOH_DOC_NO#,Send'
,p_column_linktext=>'#CARD_LINK#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7062304971994362763)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>160
,p_column_heading=>'Card Subtext'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7062303801578362754)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>170
,p_column_heading=>'Card Subtitle'
,p_column_format=>'DD-MON-YYYY HH:MIPM'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7062304198623362759)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>150
,p_column_heading=>'Card Text'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7062302978778362749)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>140
,p_column_heading=>'Card Title'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7062303373911362751)
,p_query_column_id=>2
,p_column_alias=>'EOH_DOC_NO'
,p_column_display_sequence=>180
,p_column_heading=>'Eoh Doc No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7627628678485487297)
,p_name=>'Mail Unsent'
,p_static_id=>'mail-unsent'
,p_parent_plug_id=>wwv_flow_imp.id(7897451404792373224)
,p_template=>wwv_flow_imp.id(10650490324422505325)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-BadgeList--small:t-BadgeList--dash:t-BadgeList--flex'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ''<table>',
'    <tr>',
'            <td><img src=#APP_IMAGES#mailing.gif alt="Img" width="50" height="50" style = "margin-left: 42px;"></td>',
'            <td>''||''<div> <span style = "font-size: 30px; color:#345e4d;">''|| COUNT(eoh_doc_no) || ''</span> </br>',
'	        <span style = "font-size: 12px; color: #008B8B; font-weight:bold">''||''Mail Unsent''||''</span>''||''</td>',
'    </tr>',
'        </table>'' "Mail Unsent"',
'FROM email_outbox_vw',
'             WHERE eoh_bu = :global_bu',
'                   AND (eorl_status IS NULL OR eorl_status NOT LIKE (''Message %''))',
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
 p_id=>wwv_flow_imp.id(7062297298088352857)
,p_query_column_id=>1
,p_column_alias=>'Mail Unsent'
,p_column_display_sequence=>10
,p_column_heading=>'&nbsp;'
,p_column_link=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.::P24_TYPE:MUN'
,p_column_linktext=>'#Mail Unsent#'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7897457567269379750)
,p_name=>'Mail Unsent1'
,p_static_id=>'mail-unsent-2'
,p_template=>wwv_flow_imp.id(10650490475667505325)
,p_display_sequence=>40
,p_icon_css_classes=>'fa-envelope-open fam-x fam-is-danger'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--displaySubtitle:t-Cards--basic:t-Cards--displayIcons:t-Cards--cols:t-Cards--iconsRounded:t-Cards--animRaiseCard'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''<span aria-hidden="true" class="fa fa-user-arrow-up" style="color:#e98843"></span>&nbsp;&nbsp; <SPAN STYLE="color:#7D0552">From :&nbsp;''',
'         || ''</span>''',
'         || from1',
'         || ''&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;''',
'         || ''<span aria-hidden="true" class="fa fa-exchange fa-1x fa-anim-horizontal-shake" style="color:Green"></span>''',
'         || ''&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;''',
'         || ''<span aria-hidden="true" class="fa fa-user-arrow-down" style="color:#e98843"></span>&nbsp;&nbsp;<SPAN STYLE="color:#7D0552">To :&nbsp;''',
'         || ''</span>''',
'         || to1',
'         || ''<br><span aria-hidden="true" class="fa fa-user-plus" style="color:#e98843">&nbsp;&nbsp;&nbsp;</span><SPAN STYLE="color:#7D0552">CC &nbsp;&nbsp;&nbsp;:&nbsp;''',
'         || ''</span>''',
'         || cc',
'            card_title,',
'         eoh_doc_no,',
'         doc_date CARD_SUBTITLE,',
'           ''<SPAN STYLE="color:#8d4444; font-weight:bold;" >Subject &nbsp;&nbsp;&nbsp;:&nbsp;''',
'         || ''</span>''',
'         || subject',
'         || ''<br><SPAN STYLE="color:#8d4444; font-weight:bold;">Body &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;''',
'         || ''</span>''',
'         || body',
'            card_text,',
'         ''<span aria-hidden="true" class="fa fa-envelope-o  "></span>''',
'            card_icon,',
'         ''<a href="''',
'         || APEX_UTIL.prepare_url (',
'                  ''f?p=&APP_ID.:29:&SESSION.::&DEBUG.::''',
'               || ''P29_EOH_bu,P29_EOH_DOC_NO:''',
'               || EOH_BU',
'               || '',''',
'               || EOH_DOC_NO)',
'         || ''"><span class="fa fa-edit" aria-hidden="true"></span> <B><SPAN STYLE="font-size:10px; font-family:verdana; color:  #21679a"> Edit '' || ''</SPAN></B></a>&nbsp;&nbsp;&nbsp;&nbsp;''',
'         ||''<a href="''',
'			|| APEX_UTIL.prepare_url (',
'                  ''f?p=&APP_ID.:290:&SESSION.::&DEBUG.::''',
'               || ''P290_EOH_bu,P290_EOH_DOC_NO,P290_TYPE:''',
'               || EOH_BU',
'               || '',''',
'               || EOH_DOC_NO',
'					||'',''',
'					||''Unsend'')',
'         || ''"><span aria-hidden="true" class="fa fa-file-text-o"></span> <B><SPAN STYLE="font-size:10px; font-family:verdana; color:  #21679a"> Details ''',
'         || ''</SPAN></B></a>&nbsp;&nbsp;&nbsp;&nbsp;''',
'		   || ''<a href="javascript:$s(''''P236130600_EORL_DOC_NO'''',''',
'         || ''''''''',
'         || eoh_doc_no',
'         || ''''''''',
'         || ''),apex.submit(''''Send'''');"> ''',
'			||''<button type="button" class="t-Button t-Button--icon t-Button--small t-Button--success t-Button--link t-Button--iconLeft"><span aria-hidden="true" class="t-Icon t-Icon--left fa fa-paper-plane"></span>Send</button>''',
'            card_subtext',
'    FROM (  SELECT EOH_BU,',
'                   eoh_doc_no,',
'                   eoh_doc_date doc_date,',
'                   eoh_unit unit,',
'                   func_find_plnt_desc (NVL (eoh_bu, :global_bu), eoh_unit, 1)',
'                      unit1,',
'                   --eoh_vou_pfx || ''-'' || eoh_vou_no doc_no,',
'                   eoh_sndr_email from1,',
'                   eorl_rcvr_email to1,',
'                   eorl_cc_email cc,',
'                   DECODE (eorl_rcvr_type,',
'                           ''S'', ''Supplier'',',
'                           ''C'', ''Customer'',',
'                           ''E'', ''Employee'')',
'                      receiver_type,',
'                   --eoh_subj subject,',
'                   CASE',
'                      WHEN eoh_subj IS NULL',
'                      THEN',
'                            ''<span style="color:#607d8b;">''',
'                         || ''No Subject''',
'                         || ''</span>''',
'                      WHEN eoh_subj IS NOT NULL',
'                      THEN',
'                         eoh_subj',
'                   END',
'                      subject,',
'                   --eoh_body body,',
'                   CASE',
'                      WHEN LENGTH (eoh_body) > 50',
'                      THEN',
'                         SUBSTR (eoh_body, 1, 50) || ''..''',
'                      WHEN LENGTH (eoh_body) < 50',
'                      THEN',
'                         eoh_body',
'                   END',
'                      body,',
'                   eorl_status unsend_reason,',
'                   func_find_bu_desc (:global_bu, 1) business_unit,',
'                   func_find_wf_type_desc (:global_bu, eoh_wf_type, 1)',
'                      document_type,',
'                   (SELECT eoa_doc',
'                      FROM email_outbox_attach',
'                     WHERE     eoa_bu = eoh_bu',
'                           AND eoa_doc_no = eoh_doc_no',
'                           AND eoa_seq_no = 1)',
'                      fa_download',
'              FROM email_outbox_vw',
'             WHERE eoh_bu = :global_bu',
'                   AND (eorl_status IS NULL OR eorl_status NOT LIKE (''Message %''))',
'          ORDER BY eoh_doc_no)',
'ORDER BY doc_date DESC'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P236130600_EORL_DOC_NO'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>10
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
,p_prn_page_header=>'Mail Unsent1'
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
,p_plug_query_exp_separator=>'|'
,p_plug_query_strip_html=>'N'
,p_required_patch=>wwv_flow_imp.id(7031259516264491845)
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7062301241737359301)
,p_query_column_id=>5
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>180
,p_column_heading=>'Card Icon'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7062301703490359303)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>170
,p_column_heading=>'Card Subtext'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7062300470028359296)
,p_query_column_id=>3
,p_column_alias=>'CARD_SUBTITLE'
,p_column_display_sequence=>150
,p_column_heading=>'Card Subtitle'
,p_column_format=>'DD-MON-YYYY HH:MIPM'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7062300876410359299)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>160
,p_column_heading=>'Card Text'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7062299664931359292)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>140
,p_column_heading=>'Card Title'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7062300100826359293)
,p_query_column_id=>2
,p_column_alias=>'EOH_DOC_NO'
,p_column_display_sequence=>120
,p_column_heading=>'Eoh Doc No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7897451404792373224)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>2
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(7582253715651088894)
,p_name=>'Whatsapp Sent'
,p_static_id=>'whatsapp-sent'
,p_region_name=>'Unsend'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--accent3:t-Region--stacked:t-Region--scrollBody:t-Form--slimPadding'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ROWNUM,',
'       WOV_BU,',
'       WOV_SEQ_NO,',
'       ''<span style="color:#2567e1">''||WOV_MOBILE_NO||''</span>'' "ALERT_SUBJ",',
'       ''<span style ="font-size:12px;font-family: verdana; color:#242424">''||WOV_MESSAGE||''</SPAN>''''<Br>''',
'       ||''<span  style = " font-size:12px; font-family:verdana; color:#800000">Doc. Date:&nbsp;'' || TO_CHAR(WOV_DATE,''DD.MM.YYYY'')  || ''</SPAN></B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&'
||'nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;''||''<span  style = " font-size:12px; font-family:verdana; color:#ff837a">Beneficiary Type:&nbsp; ''||',
'       DECODE(WOV_BENF_TYPE,''E'',''Employee'',''C'',''Customer'',''S'',''Supplier'')||''</SPAN></B>'' "ALERT_MSG",',
'       TO_CHAR(WOV_UPD_DATE,''DD.MM.YYYY'') "ALERT_MSG1",',
'       ''<button type="button" class="t-Button t-Button--icon t-Button--hot t-Button--small t-Button--success t-Button--iconLeft"><span aria-hidden="true" class="t-Icon t-Icon--left fa fa-send"></span>send</button>'' "ALERT_ICON1",',
'       --''<span class="fa fa-comments" aria-hidden="true" style="color:#b2cf15; font-size:15px;"></span>'' "ALERT_ICON"',
'       ''<img src="#APP_FILES#whatsapp.png" width= "20"  height= "20"></img>'' "ALERT_ICON"',
'  FROM WHATSAPP_OUTBOX_VW      '))
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
,p_prn_page_header=>'Whatsapp Sent'
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
 p_id=>wwv_flow_imp.id(7049889679501369066)
,p_query_column_id=>8
,p_column_alias=>'ALERT_ICON'
,p_column_display_sequence=>450
,p_column_heading=>'Alert Icon'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7049889599933369065)
,p_query_column_id=>7
,p_column_alias=>'ALERT_ICON1'
,p_column_display_sequence=>440
,p_column_heading=>'Alert Icon1'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7062310262773375610)
,p_query_column_id=>5
,p_column_alias=>'ALERT_MSG'
,p_column_display_sequence=>310
,p_column_heading=>'Alert Msg'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7049889467414369064)
,p_query_column_id=>6
,p_column_alias=>'ALERT_MSG1'
,p_column_display_sequence=>430
,p_column_heading=>'Alert Msg1'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7062309924455375609)
,p_query_column_id=>4
,p_column_alias=>'ALERT_SUBJ'
,p_column_display_sequence=>370
,p_column_heading=>'Alert Subj'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7062307895828375601)
,p_query_column_id=>1
,p_column_alias=>'ROWNUM'
,p_column_display_sequence=>400
,p_column_heading=>'Rownum'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7049889291249369062)
,p_query_column_id=>2
,p_column_alias=>'WOV_BU'
,p_column_display_sequence=>410
,p_column_heading=>'Wov Bu'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(7049889337021369063)
,p_query_column_id=>3
,p_column_alias=>'WOV_SEQ_NO'
,p_column_display_sequence=>420
,p_column_heading=>'Wov Seq No'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7062296555610352831)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(7897451404792373224)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_static_id=>'back'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_image_alt=>'Back'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'f?p=&APP_ID.:23613059801:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-left-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7062296147050352824)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7897451404792373224)
,p_button_name=>'BTN_COMPOSE'
,p_static_id=>'btn-compose'
,p_button_static_id=>'but2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft:t-Button--stretch:t-Button--padTop'
,p_button_template_id=>wwv_flow_imp.id(10650579844143505434)
,p_button_image_alt=>'<b>Compose</b>'
,p_button_redirect_url=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-pencil'
,p_grid_new_row=>'Y'
);
wwv_flow_imp.component_end;
end;
/
