prompt --application/pages/page_00024
begin
--   Manifest
--     PAGE: 00024
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
 p_id=>24
,p_name=>'Email - Sent / Unsent'
,p_alias=>'EMAIL-SENT-UNSENT1'
,p_step_title=>'Email - Sent / Unsent'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
'',
'',
'.t-HeroRegion-title {',
'    font-size: 1.5rem;',
'    line-height: 4rem;',
'    margin: 0;',
'    font-weight: 700;',
'    color: #5C6BC0;',
'}',
'',
'.t-HeroRegion-wrap {',
'    padding: 16px;',
'    display: flex;',
'    padding-bottom: 0px;',
'    flex-direction: row;',
'    align-items: center;',
'}',
'',
'.t-MediaList-title {',
'    font-size: 1.3rem;',
'    line-height: 3rem;',
'    font-weight: 500;',
'}',
'',
'.a-IRR-headerLink, .a-IRR-headerLink:hover {',
'    text-decoration: none;',
'    background: #3f51b5c7;',
'    color: white;',
'}',
'',
'.t-Cards--cols .t-Cards-item {',
'    width: 100%;',
'}',
'',
'.t-Cards--compact .t-Card-title {',
'    font-size: 1.4rem;',
'    line-height: 2.6rem;',
'    margin: 0;',
'    font-weight: bold;',
'    overflow: hidden;',
'    text-overflow: ellipsis;',
'}',
'',
'.t-Card-title {',
'    color: #242424;',
'    font-family: emoji;',
'}',
'#but {',
'    background-color: #00BCD4;;;',
'    color: #ffffff;',
'    border-radius: 22px;',
'}',
'',
'.t-Body-side {',
'    /*background-color: #e2e2e2;*/',
'    background-image: linear-gradient(to right, #c9e1f5 0%, rgba(0,0,0,.1) 100%);',
'    color: #242424;',
'}',
'',
'.t-MediaList-badge, .t-MediaList-desc {',
'    color: #ef9005;',
'    font-weight: bold;',
'}',
'',
'#but1 {',
'    background-color: #f76999;',
'    border-radius: 22px;',
'}',
'#but2 {',
'    background-color: #fafafa;',
'	 color:#242424;',
'    border-radius: 22px;',
'}',
'',
'',
'#but3 {',
'    background-color: #3BAA2C;',
'    border-radius: 22px;',
'}',
'',
'',
'.t-MediaList-badge, .t-MediaList-desc {',
'    color: brown;',
'    font-weight: bold;',
'}',
'',
'',
'.t-MediaList-title {',
'    font-size: 1.3rem;',
'    line-height: 2rem;',
'    font-weight: 500;',
'}',
'',
'',
'.t-Cards--featured .t-Card-body {',
'    border-top-color: rgba(0, 0, 0, 0.075); ',
' //   background-image: linear-gradient(-225deg, #DFFFCD 0%, #90F9C4 48%, #39F3BB 100%);',
' //   background-image: linear-gradient(to top, #e6b980 0%, #eacda3 100%);',
' //  background-image: linear-gradient(60deg, #96deda 0%, #50c9c3 100%);',
'    //background-image: linear-gradient(-20deg, #f794a4 0%, #fdd6bd 100%);',
'    background-image: linear-gradient(-20deg,     #ffb3b3 0%, #fdd6bd 100%);',
'}',
'',
'.t-Cards--featured.t-Cards--displaySubtitle .t-Card-subtitle {',
'    display: block;',
'    font-size: 12px;',
'    margin: 4px 0 0;',
'    color: #626262;',
'    line-height: 16px;',
'    font-weight: 400;',
'}',
'.t-Button--success:not(.t-Button--simple):not(.t-Button--hot), .t-Button--success:not(.t-Button--simple):not(.t-Button--hot):active, .t-Button--success:not(.t-Button--simple):not(.t-Button--hot).is-active {',
'    background-color: #6F4E37;',
'    /* padding-top: 0px; */',
'    padding: 2px;',
'}',
'.t-Button--link.t-Button, .t-Button--link .t-Icon {',
'    color: #004793;',
'	 font-size: 12px;',
'}',
' .t-Card-subtitle {',
'    color: #0000ff;',
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
'}    */',
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
'#back{',
'    color: #383838;',
'    background-color: #fbce4a;',
'    box-shadow: 0 0 0 1px rgb(0 0 0 / 13%) inset;',
'}',
'',
'',
'',
''))
,p_step_template=>wwv_flow_imp.id(6987777902051605506)
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11695451871575229044)
,p_plug_name=>'Alert Paramters'
,p_static_id=>'alert-paramters'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>100
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6431839109231287950)
,p_plug_name=>'Mail'
,p_static_id=>'mail'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>':P24_TYPE=''MUN'''
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6059235543146770848)
,p_name=>'Mail Sent'
,p_static_id=>'mail-sent'
,p_parent_plug_id=>wwv_flow_imp.id(6317117360542631464)
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
 p_id=>wwv_flow_imp.id(6059235757562770850)
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
 p_id=>wwv_flow_imp.id(6320916102243931172)
,p_name=>'Mail Sent1'
,p_static_id=>'mail-sent-2'
,p_template=>wwv_flow_imp.id(10650517649530505364)
,p_display_sequence=>80
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
'           ''<a href="javascript:$s(''''P24_EORL_CC_EMAIL'''',''',
'         || ''''''''',
'         || cc',
'         || ''''''''',
'         || ''),$s(''''P24_EOH_SUBJ'''',''',
'         || ''''''''',
'         || subject',
'         || ''''''''',
'         || ''),$s(''''P24_EOH_BODY'''',''',
'         || ''''''''',
'         || body',
'         || ''''''''',
'         || ''),$s(''''P24_EOA_FILENAME'''',''',
'         || ''''''''',
'         || fa_download',
'         || ''''''''',
'			|| ''),$s(''''P24_EORL_DOC_NO'''',''',
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
,p_display_when_condition=>'P24_TYPE'
,p_display_when_cond2=>'MUN1'
,p_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
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
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6041300240436901154)
,p_query_column_id=>5
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>190
,p_column_heading=>'Card Icon'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6047295661896745548)
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
 p_id=>wwv_flow_imp.id(6320919029857931202)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>160
,p_column_heading=>'Card Subtext'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6320919132627931203)
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
 p_id=>wwv_flow_imp.id(6320918937855931201)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>150
,p_column_heading=>'Card Text'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6320918862532931200)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>140
,p_column_heading=>'Card Title'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6041300175674901153)
,p_query_column_id=>2
,p_column_alias=>'EOH_DOC_NO'
,p_column_display_sequence=>180
,p_column_heading=>'Eoh Doc No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6431837951647287938)
,p_plug_name=>'Mail Sent'
,p_static_id=>'mail-sent-3'
,p_icon_css_classes=>'fa-envelope-check'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>90
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT eoh_doc_date "Doc. Date",',
'            eoh_unit "Unit",',
'            CASE WHEN EOH_UNIT IS NOT NULL THEN',
'            func_find_plnt_desc(NVL(EOH_BU,:GLOBAL_bu),EOH_UNIT,1)',
'            ELSE NULL',
'            END "UNIT1",',
'            eoh_vou_pfx||''-''||eoh_vou_no "Doc. No.",',
'            eoh_sndr_email "From",',
'            eorl_rcvr_email "To",',
'            eorl_cc_email "CC",',
'            DECODE(eorl_rcvr_type,''S'',''Supplier'',''C'',''Customer'',''E'',''Employee'') "Receiver Type",',
'            eoh_subj "Subject",',
'            eoh_body "Body",',
'            eorl_status "Unsend Reason",',
'            func_find_bu_desc(:GLOBAL_bu,1) "Business Unit",',
'            CASE WHEN EOH_WF_TYPE IS NOT NULL THEN',
'            FUNC_FIND_WF_TYPE_DESC(:GLOBAL_bu,EOH_WF_TYPE,1)',
'            ELSE NULL',
'            END "Document Type"',
'   FROM email_outbox_vw',
'  WHERE eoh_bu=:global_bu  ',
'    AND EORL_STATUS LIKE ''%Message Sent%''',
'  ORDER BY EOH_DOC_DATE DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'1=2'
,p_plug_display_when_cond2=>'SQL'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
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
 p_id=>wwv_flow_imp.id(6431838025593287939)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>287995996186766678
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317458421135062645)
,p_db_column_name=>'Body'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Body'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317461141106062648)
,p_db_column_name=>'Business Unit'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Business Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317460354041062646)
,p_db_column_name=>'CC'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Cc Mail'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317458797268062645)
,p_db_column_name=>'Doc. Date'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Doc. Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD.MM.YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317457560220062643)
,p_db_column_name=>'Doc. No.'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317461614703062651)
,p_db_column_name=>'Document Type'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Document Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317459570167062645)
,p_db_column_name=>'From'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'From'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317457937549062645)
,p_db_column_name=>'Receiver Type'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Receiver Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317456796225062643)
,p_db_column_name=>'Subject'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Subject'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317460007166062646)
,p_db_column_name=>'To'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317459227167062645)
,p_db_column_name=>'UNIT1'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Unit1'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317457209266062643)
,p_db_column_name=>'Unit'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Unit'
,p_column_html_expression=>'<span title="#UNIT1#">#Unit#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317460825469062646)
,p_db_column_name=>'Unsend Reason'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Unsend Reason'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6431963641417396904)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1145412'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'Unit:Doc. Date:From:To:CC:Subject:Body:Business Unit:Document Type:Unsend Reason:Receiver Type'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6047294634235745537)
,p_name=>'Mail Unsent'
,p_static_id=>'mail-unsent'
,p_parent_plug_id=>wwv_flow_imp.id(6317117360542631464)
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
 p_id=>wwv_flow_imp.id(6059235885532770851)
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
 p_id=>wwv_flow_imp.id(6317120032873631491)
,p_name=>'Mail Unsent1'
,p_static_id=>'mail-unsent-2'
,p_template=>wwv_flow_imp.id(10650490475667505325)
,p_display_sequence=>70
,p_icon_css_classes=>'fa-envelope-open fam-x fam-is-danger'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding'
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
'		   || ''<a href="javascript:$s(''''P24_EORL_DOC_NO'''',''',
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
'                   --AND eoh_doc_no = :P24_EORL_DOC_NO',
'          ORDER BY eoh_doc_no)',
'ORDER BY doc_date DESC'))
,p_display_when_condition=>':P24_TYPE=''MUN'''
,p_display_when_cond2=>'SQL'
,p_display_condition_type=>'EXPRESSION'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P24_EORL_DOC_NO'
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
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6047294482341745536)
,p_query_column_id=>5
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>180
,p_column_heading=>'Card Icon'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6047294317493745534)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>170
,p_column_heading=>'Card Subtext'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6047294072803745532)
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
 p_id=>wwv_flow_imp.id(6047294216974745533)
,p_query_column_id=>4
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>160
,p_column_heading=>'Card Text'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6047293939882745531)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>140
,p_column_heading=>'Card Title'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6319971771089188977)
,p_query_column_id=>2
,p_column_alias=>'EOH_DOC_NO'
,p_column_display_sequence=>120
,p_column_heading=>'Eoh Doc No'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6431839251288287951)
,p_plug_name=>'Mail Unsent'
,p_static_id=>'mail-unsent-3'
,p_parent_plug_id=>wwv_flow_imp.id(6431839109231287950)
,p_icon_css_classes=>'fa-envelope-open fam-x fam-is-danger'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>70
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT eoh_doc_date "Doc. Date",',
'            eoh_unit "Unit",',
'            CASE WHEN  EOH_UNIT IS NOT NULL THEN',
'            func_find_plnt_desc(NVL(EOH_BU,:GLOBAL_bu),EOH_UNIT,1)',
'            END "UNIT1",',
'            eoh_vou_pfx||''-''||eoh_vou_no "Doc. No.",',
'            eoh_sndr_email "From",',
'            eorl_rcvr_email "To",',
'            eorl_cc_email "CC",',
'            DECODE(eorl_rcvr_type,''S'',''Supplier'',''C'',''Customer'',''E'',''Employee'') "Receiver Type",',
'            eoh_subj "Subject",',
'            eoh_body "Body",',
'            eorl_status "Unsend Reason",',
'            func_find_bu_desc(:GLOBAL_bu,1) "Business Unit",',
'            FUNC_FIND_WF_TYPE_DESC(:GLOBAL_bu,EOH_WF_TYPE,1)"Document Type"',
'   FROM email_outbox_vw',
'  WHERE eoh_bu=:global_bu  ',
'  AND (EORL_STATUS IS NULL OR EORL_STATUS NOT LIKE (''Message %'')) ',
'  ORDER BY EOH_DOC_DATE DESC,EOH_DOC_NO DESC',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'1=2 and :P24_TYPE=''MUN'' AND :P24_MAIL_SMS =''MU'''
,p_plug_display_when_cond2=>'SQL'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
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
 p_id=>wwv_flow_imp.id(6431839382535287952)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>287997353128766691
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317464163900062657)
,p_db_column_name=>'Body'
,p_display_order=>80
,p_column_identifier=>'F'
,p_column_label=>'Body'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317466573840062659)
,p_db_column_name=>'Business Unit'
,p_display_order=>140
,p_column_identifier=>'L'
,p_column_label=>'Business Unit'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317465730479062659)
,p_db_column_name=>'CC'
,p_display_order=>120
,p_column_identifier=>'J'
,p_column_label=>'CC'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317464596190062657)
,p_db_column_name=>'Doc. Date'
,p_display_order=>90
,p_column_identifier=>'G'
,p_column_label=>'Send On'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD.MM.YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317463347371062656)
,p_db_column_name=>'Doc. No.'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Doc. No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317466947539062661)
,p_db_column_name=>'Document Type'
,p_display_order=>150
,p_column_identifier=>'M'
,p_column_label=>'Document Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317464941512062657)
,p_db_column_name=>'From'
,p_display_order=>100
,p_column_identifier=>'H'
,p_column_label=>'From'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317463785046062656)
,p_db_column_name=>'Receiver Type'
,p_display_order=>70
,p_column_identifier=>'E'
,p_column_label=>'Receiver Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317462550953062654)
,p_db_column_name=>'Subject'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Subject'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317465401097062657)
,p_db_column_name=>'To'
,p_display_order=>110
,p_column_identifier=>'I'
,p_column_label=>'To'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317467377898062661)
,p_db_column_name=>'UNIT1'
,p_display_order=>160
,p_column_identifier=>'N'
,p_column_label=>'Unit1'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317462998678062656)
,p_db_column_name=>'Unit'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Unit'
,p_column_html_expression=>'<span title="#UNIT1#">#Unit#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6317466169630062659)
,p_db_column_name=>'Unsend Reason'
,p_display_order=>130
,p_column_identifier=>'K'
,p_column_label=>'Unsend Reason'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6431963070199396891)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1145406'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>5
,p_report_columns=>'Unit:Doc. Date:From:To:CC:Subject:Body:Business Unit:Document Type:Unsend Reason:Receiver Type:UNIT1'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6455325308110182856)
,p_name=>'Mail Unsent'
,p_static_id=>'mail-unsent-4'
,p_parent_plug_id=>wwv_flow_imp.id(6431839109231287950)
,p_template=>wwv_flow_imp.id(10650490475667505325)
,p_display_sequence=>20
,p_icon_css_classes=>'fa-envelope-open fam-x fam-is-danger'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--compact:t-Cards--displayIcons:t-Cards--cols:t-Cards--desc-3ln:t-Cards--iconsRounded:t-Cards--animColorFill'
,p_display_column=>1
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  ''fa-envelope-x'' CARD_ICON,',
' ''<font color=#14a800;>''',
'       || ''Subject:''',
'       || ''</font>''',
'       || '' ''',
'       || SUBJECT',
'       || ''<br>'' CARD_TITLE,',
'''<font color="darkmagenta">''',
'       ||'' <b> From  :</b>''',
'       || ''</font>''',
'       || '' ''',
'       || From1',
'       ||',
'         ''<font color="darkmagenta">''',
'       || '' <b> To  :</b>''',
'       || ''</font>''',
'       || '' ''',
'       || To1',
'       ||''<br>''',
'       ||''<font color="black";>''',
'       || '' <b> CC :</b>''',
'       || ''</font>''',
'       || '' ''',
'       || CC',
'|| ''<br>'' ',
'       ||''<font color="royalblue";>''',
'       || ''Body :''',
'       || ''</font>''',
'       || '' ''',
'       || Body       ',
'       card_text,   ',
'        --card_text,',
'     /*   CASE WHEN FY_YEAR = :Global_year THEN',
'       ''<a href="''|| apex_util.prepare_url(''f?p=&APP_ID.:16151904911901:&SESSION.::&DEBUG.::''',
'       || ''P16151904911901_ROWID:''',
'       || ROWID)',
'       || ''"> <B><SPAN STYLE="font-size:10px; font-family:verdana; color:  #28a745;class=fa fa-edit; "> Edit UPI''||''</SPAN></B></a>''',
'       ||''|''||',
'       ''<a href="''|| apex_util.prepare_url(''f?p=&APP_ID.:161519049119:&SESSION.::&DEBUG.::''',
'       || ''P161519049119_YEAR:''',
'       || FY_YEAR)',
'       || ''"> <B><SPAN STYLE="font-size:10px; font-family:verdana; color:  Orange;class=fa fa-edit; "> View Shop Details''||''</SPAN></B></a>''',
'       ELSE NULL',
'       END */ null',
'        "CARD_SUBTEXT",',
'        ''color'' card_color',
' FROM (',
'  SELECT eoh_doc_date Doc_Date,',
'         eoh_unit Unit,',
'         func_find_plnt_desc (NVL (eoh_bu, :global_bu), eoh_unit, 1) UNIT1,',
'         eoh_vou_pfx || ''-'' || eoh_vou_no Doc_No,',
'         eoh_sndr_email From1,',
'         eorl_rcvr_email To1,',
'         eorl_cc_email CC,',
'         DECODE (eorl_rcvr_type,',
'                 ''S'', ''Supplier'',',
'                 ''C'', ''Customer'',',
'                 ''E'', ''Employee'')',
'            Receiver_Type,',
'         eoh_subj Subject,',
'         eoh_body Body,',
'         eorl_status Unsend_Reason,',
'         func_find_bu_desc (:global_bu, 1) Business_Unit,',
'         func_find_wf_type_desc (:global_bu, eoh_wf_type, 1) Document_Type',
'    FROM email_outbox_vw',
'   WHERE eoh_bu = :global_bu',
'         AND (eorl_status IS NULL OR eorl_status NOT LIKE (''Message %''))',
'ORDER BY eoh_doc_date DESC, eoh_doc_no DESC)'))
,p_display_when_condition=>':P24_TYPE=''MUN'' AND :P24_MAIL_SMS =''MU'' AND 1=2'
,p_display_when_cond2=>'SQL'
,p_display_condition_type=>'EXPRESSION'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(10650533555536505382)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317119172198631482)
,p_query_column_id=>5
,p_column_alias=>'CARD_COLOR'
,p_column_display_sequence=>50
,p_column_heading=>'Card Color'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317118731467631478)
,p_query_column_id=>1
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>10
,p_column_heading=>'Card Icon'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317119066488631481)
,p_query_column_id=>4
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Card Subtext'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317118956092631480)
,p_query_column_id=>3
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>30
,p_column_heading=>'Card Text'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6317118899628631479)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'Card Title'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6047295780743745549)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(10650517649530505364)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(6317120032873631491)
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
 p_id=>wwv_flow_imp.id(6047295924009745550)
,p_name=>'P24_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6047295780743745549)
,p_prompt=>'Search'
,p_source=>'subject'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'input_field', 'FACET',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6317117360542631464)
,p_plug_name=>'New'
,p_static_id=>'new-2'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>2
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6552637312413131455)
,p_plug_name=>'Tabs'
,p_static_id=>'tabs'
,p_region_name=>'tabs'
,p_region_template_options=>'#DEFAULT#:margin-top-none:margin-bottom-lg'
,p_plug_template=>wwv_flow_imp.id(10650490324422505325)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_required_patch=>wwv_flow_imp.id(7031259516264491845)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7049889048537369060)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6317117360542631464)
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
 p_id=>wwv_flow_imp.id(6318492264987866662)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6317117360542631464)
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
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6552637775713131460)
,p_branch_name=>'Go To Page 236130598'
,p_branch_action=>'f?p=&APP_ID.:236130598:&SESSION.::&DEBUG.::P236130598_TABS:S&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P24_TABS'
,p_branch_condition_text=>'S'
,p_required_patch=>wwv_flow_imp.id(7031259516264491845)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6552637896321131461)
,p_branch_name=>'Go To Page 24'
,p_branch_action=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.::P24_TABS:M&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_branch_condition=>'P24_TABS'
,p_branch_condition_text=>'M'
,p_required_patch=>wwv_flow_imp.id(7031259516264491845)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6041300811398901159)
,p_name=>'P24_EOA_FILENAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6320916102243931172)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6041300647264901158)
,p_name=>'P24_EOH_BODY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6320916102243931172)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6041300574693901157)
,p_name=>'P24_EOH_SUBJ'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6320916102243931172)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6041300515687901156)
,p_name=>'P24_EORL_CC_EMAIL'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6320916102243931172)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5961677538764714432)
,p_name=>'P24_EORL_DOC_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6320916102243931172)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6319970496932188964)
,p_name=>'P24_PARAMETER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11695451871575229044)
,p_item_default=>'MU'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6552637377424131456)
,p_name=>'P24_TABS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6552637312413131455)
,p_item_default=>'M'
,p_prompt=>'&nbsp;'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:Email;M,SMS;S'
,p_colspan=>3
,p_field_template=>wwv_flow_imp.id(10650578635815505431)
,p_item_css_classes=>'def'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large:margin-left-none:margin-right-none:t-Form-fieldContainer--radioButtonGroup'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'number_of_columns', '2',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6317426466427062567)
,p_name=>'P24_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11695451871575229044)
,p_item_default=>'MUN'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6317482645119062690)
,p_name=>'Submit_Page'
,p_static_id=>'submit-page'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P24_SEARCH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6317483158984062692)
,p_event_id=>wwv_flow_imp.id(6317482645119062690)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6552637571962131458)
,p_name=>'submit_page'
,p_static_id=>'submit-page-2'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P24_TABS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6552637709466131459)
,p_event_id=>wwv_flow_imp.id(6552637571962131458)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6317482303171062687)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Menu'
,p_static_id=>'menu'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :p24_search IS NOT NULL THEN',
'',
'DECLARE',
'   v_link   VARCHAR2 (200) := :p24_search;',
'   v_app_no NUMBER(5);',
'   v_node_type VARCHAR2(10);',
'BEGIN',
'',
'SELECT wbf_appl_no,wbf_node_type INTO v_app_no,v_node_type',
'FROM wapl_bus_fun',
'WHERE wbf_page_no=:p24_search;',
'',
'IF v_node_type =''RPT'' THEN ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':777:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P777_USERNAME,P777_PASSWORD,P777_PAGE:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:p24_search, 1));',
'   HTMLDB_APPLICATION.g_unrecoverable_error := TRUE;',
'',
'ELSE ',
'   APEX_UTIL.redirect_url (',
'      ''f?p=''||v_app_no||'':106:&SESSION.:BRANCH_TO_PAGE_ACCEPT:NO:RP:P106_USERNAME,P106_PASSWORD,P106_PAGE,GLOBAL_SESSION:''',
'      || :global_user',
'      || '',''',
'      || :global_p',
'      || '',''',
'      || NVL (:p24_search, 1)',
'      || '',''',
'      || :app_session);',
'   HTMLDB_APPLICATION.g_unrecoverable_error := TRUE;',
'',
'END IF;',
'',
'EXCEPTION WHEN NO_DATA_FOUND THEN',
'Raise_Application_Error(-20999,''Application not defined for the Page.'');',
'   ',
'END;',
'',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>835520467627451659
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6059235222062770844)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P24_TYPE  = ''MUN'' THEN',
'   :Global_page_desc :=''Mail Unsent'';',
'ELSIF	:P24_TYPE  = ''MUN1'' THEN',
'   :global_page_desc  := ''Mail Sent'';',
'	end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>577273386519159816
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6041299486306901146)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Process'
,p_static_id=>'process'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
' 	v_mail_status 			VARCHAR2(400);',
'	v_filename		VARCHAR2(1000);',
'BEGIN',
'',
'	FOR cr1 IN (SELECT eoh_doc_no,eorl_rcvr_email,eorl_cc_email,eoh_subj,eoh_body,',
'	                   uma_user_name,CRYPTIT.decrypt(uma_password) password,uma_host,uma_port',
'	              FROM email_outbox_vw,user_mail_access',
'	             WHERE eoh_bu = uma_bu',
'							   AND eoh_sndr_email = uma_user_name',
'							   AND uma_status = ''A''',
'							   AND eoh_bu = :GLOBAL_bu  ',
'							   AND (eorl_status IS NULL OR eorl_status NOT LIKE (''Message %''))',
'							   AND eorl_sel_flag = ''Y'')',
'	LOOP',
'		',
'   IF cr1.eoh_doc_no IS NOT NULL THEN     ',
'   ',
'     proc_send_mailv24(:global_bu,cr1.eoh_doc_no,:global_user,v_mail_status);',
'  				     ',
'     UPDATE email_outbox_hd SET eoh_status = v_mail_status',
'     WHERE eoh_bu = :global_bu  ',
'       AND eoh_doc_no = cr1.eoh_doc_no;',
'  	 ',
'     UPDATE wfm_mail_report',
'        SET mr_status = v_mail_status',
'      WHERE mr_seq_no = cr1.eoh_doc_no;',
'    ',
'   END IF;			',
'			',
'                	',
'             UPDATE email_outbox_rcvr_list',
'                SET eorl_status = v_mail_status,',
'                    eorl_sel_flag = ''N'',',
'                    eorl_upd_by = :global_bu$user,',
'                    eorl_upd_date = SYSDATE',
'              WHERE eorl_bu = :global_bu ',
'                AND eorl_doc_no = cr1.eoh_doc_no;',
'                ',
'           COMMIT;',
'	',
'	END LOOP;',
'	',
'',
'END;',
'',
' ',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>559337650763290118
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6041300416424901155)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Resend'
,p_static_id=>'resend'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'---RAISE_APPLICATION_ERROR(-20999,:p24_EORL_DOC_NO);',
'declare',
' 	mail_res varchar2(400);',
'	 cursor c1 is ',
'	 select * from user_mail_access',
'	 where uma_bu = :global_bu',
'	 and uma_user = :global_user;',
'	 	cr1			c1%ROWTYPE;	  ',
'begin',
'	OPEN c1;',
'	FETCH c1 INTO cr1;',
' IF :p24_EORL_CC_EMAIL IS NOT NULL THEN   ',
'				 	 mail_res :=  sys.sendmessage_sp (cr1.UMA_HOST,',
'				                                     cr1.UMA_USER_NAME,',
'				                                    :p24_EORL_RCVR_EMAIL,',
'				                                    :p24_EORL_CC_EMAIL,',
'				                                    :p24_EOH_SUBJ,',
'				                                    :p24_EOH_BODY,',
'				                                    :p24_EOA_FILENAME,',
'				                                    cr1.UMA_USER_NAME,',
'				                                    ''sys123456'',',
'				                                    cr1.UMA_PORT);',
'  ELSE',
'        ',
'            mail_res :=  sys.SEND$MESSAGE (cr1.UMA_HOST,',
'                                           cr1.UMA_USER_NAME,',
'                                           :p24_EORL_RCVR_EMAIL,',
'			                                  :p24_EOH_SUBJ,',
'			                                  :p24_EOH_BODY,',
'			                                  :p24_EOA_FILENAME,',
'			                                  cr1.UMA_USER_NAME,',
'			                                  ''sys123456'',',
'			                                  cr1.UMA_PORT);',
'			                                    ',
'			                                     ',
'                                                                       	 ',
'    IF mail_res =''Message Sent'' THEN                 	',
'             UPDATE email_outbox_rcvr_list',
'             SET EORL_STATUS=''Message Sent''',
'             WHERE EORL_BU = :global_bu ',
'             AND EORL_DOC_NO = :p24_EORL_DOC_NO;',
'            COMMIT;',
'',
'    END IF;             ',
'           ',
'             ',
' END IF;                         				                                    ',
'close c1;',
' end;         ',
'commit;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Resend'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>559338580881290127
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6059237867163770871)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send'
,p_static_id=>'send'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'---Raise_application_error(-20999,:P24_EORL_DOC_NO);',
'DECLARE',
' 	v_mail_status 	VARCHAR2(400);',
'	v_filename		VARCHAR2(1000);',
'BEGIN',
'',
'	FOR cr1 IN (SELECT eoh_doc_no,eorl_rcvr_email,eorl_cc_email,eoh_subj,eoh_body,',
'	                   uma_user_name,CRYPTIT.decrypt(uma_password) password,uma_host,uma_port',
'	              FROM email_outbox_vw,user_mail_access',
'	             WHERE eoh_bu = uma_bu',
'							   AND eoh_sndr_email = uma_user_name',
'							   AND uma_status = ''A''',
'							   AND eoh_bu = :GLOBAL_bu  ',
'							   AND (eorl_status IS NULL OR eorl_status NOT LIKE (''Message %''))',
'							  AND eoh_doc_no = :p24_EORL_DOC_NO)',
'	LOOP',
'		',
'   IF cr1.eoh_doc_no IS NOT NULL THEN     ',
'   ',
'     proc_send_mailv24(:GLOBAL_bu,cr1.eoh_doc_no,:GLOBAL_user,v_mail_status);',
'  				     ',
'     UPDATE email_outbox_hd SET eoh_status = v_mail_status',
'     WHERE eoh_bu = :GLOBAL_bu  ',
'       AND eoh_doc_no = cr1.eoh_doc_no;',
'  	 ',
'     UPDATE wfm_mail_report',
'        SET mr_status = v_mail_status',
'      WHERE mr_seq_no = cr1.eoh_doc_no;',
'    ',
'   END IF;		',
'',
'         /*    UPDATE email_outbox_rcvr_list',
'                SET eorl_status = v_mail_status,',
'                    eorl_sel_flag = ''N'',',
'                    eorl_upd_by = :GLOBAL_user,',
'                    eorl_upd_date = SYSDATE',
'              WHERE eorl_bu = :GLOBAL_bu ',
'                AND eorl_doc_no = cr1.eoh_doc_no;*/',
'                ',
'             COMMIT;',
'	',
'	END LOOP;',
'	',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'Send'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
,p_internal_uid=>577276031620159843
);
wwv_flow_imp.component_end;
end;
/
